/*
	* Name: TerrainPloughTool.cs
	* Author: Madasir Ali / Upwork / Fiverr
	* 
	* Description: Gives the ability to draw ploughing like procedural patterns on terrain.
*/

#pragma warning disable CS0162      // disabling warnings about the unreachable CPU side (OBSOLETE) code.

using TerrainPloughTools.Internal;

using Debug = UnityEngine.Debug;
using Convert = System.Convert;
using static TerrainPloughTools.Internal.ViewAsNativeArrayExtensions;

using Commands;
using Commands.AllCommands.TerrainCommands;
using UnityEngine;
using Unity.Collections;
using Unity.Mathematics;
using Unity.Jobs;
using System.Runtime.CompilerServices;
using UnityEngine.EventSystems;
using UnityEngine.Events;
using System;

namespace TerrainPloughTools
{
    /// <summary>
    /// Terrain Plough Tools (MonoBehaviour). Master script to schedule jobs and handle input or to optionally draw gizmos.
    /// </summary>
    public sealed class TerrainPloughTool : MonoBehaviour {
        private enum TerrainSyncMode {
            None,
            Auto,
            Forced,
            Partial,
            PartialAuto,
            AfterClick
        }

        #region FEILDS
        
        [Header("Brush Settings:")]

        [Tooltip("The width of the plough brush in texels related to terrain's height map.")]
        [SerializeField] [DebugInfoAttribute]
        private int BrushWidth = 64;
        [Tooltip("The height of the plough brush in texels related to terrain's height map.")]
        [SerializeField] [DebugInfoAttribute]
        private int BrushHeight = 64;
        [Tooltip("Less the value more time to hold at a position to reach the max altitude. High value = less smoothess in elevation.")]
        [SerializeField] [DebugInfoAttribute]
        private float Hardness = 10;
        [Tooltip("The current angle of the brush.")]
        [SerializeField] [DebugInfoAttribute]
        private float Angle;
        [Tooltip("The index of the brush to use from brushmasks set.")]
        [SerializeField] [DebugInfoAttribute]
        private int ActiveBrushIndex;

        [Header("Pattern Settings:")]
        [Tooltip("The sum of the total crests and troughs form or fit in brush size.")]
        [SerializeField] [DebugInfoAttribute]
        private float Frequency = 31;
        [Tooltip("The height to wave in world's position or scale.")]
        [SerializeField] [DebugInfoAttribute]
        private float Amplitude = 0.005f;

        [Header("Mode:")]
        [Tooltip("Brush behaviour.")]
        [SerializeField] [DebugInfoAttribute]
        private BrushMode Mode = BrushMode.Lines;

        [Header("Spiral Settings:")]
        [Tooltip("Width or thichness of the line creating spiral. Like a marbel carving in sand, its the diameter of that marbel.")]
        [SerializeField] [DebugInfoAttribute]
        private int DotDiameter = 10;
        [Tooltip("Starting radius or distance from centre the marbel or the dot is, during making spirals.")]
        [SerializeField] [DebugInfoAttribute]
        private float Radius = 0.5f;
        [Tooltip("The speed by which the spiral will move outward, or the speed of the radius to increase.")]
        [SerializeField] [DebugInfoAttribute]
        private float ExpendSpeed = 0.25f;
        [Tooltip("The rotation speed or speed to increase the angle of the brush, the speed of carving spiral. High values can create cuts in spirals !")]
        [SerializeField] [DebugInfoAttribute]
        private float RotateSpeed = 50f;

        [Header("Curvey Settings:")]
        [Tooltip("Minimum change in cursor position in screen space to be considered as cursor moved, not impotant. I think this setting is bad.")]
        //[SerializeField] [DebugInfoAttribute]
        private float RotationStabelization = 0.00f;

        [Header("Flatten Settings: ")]
        [Tooltip("The max world height to reach.")]
        [SerializeField] [DebugInfoAttribute]
        private float FlattenHeight = 1f;

        [Header("Paint Settings:")]
        [Tooltip("The index of the layer to paint in Terrain Layers Set.")]
        [SerializeField] [DebugInfoAttribute]
        private int PaintLayer;

        [Header("Misc:")]
        [SerializeField]
        [Tooltip("Tick rate of the brushe, using fixed tick rate made things smooth. 0.016ms = 60fps")]
        private float DeltaTime = 0.016f;
        [Tooltip("Allow to increase or decrease the angle of the brush, W key = increase angle, Q key = decrease angle.")]
        [SerializeField]
        private bool RotationControls = false;

        [Header("References:")]
        [Tooltip("The terrain on which to plough or draw.")]
        [SerializeField]
        private Terrain Terrain;
        [Tooltip("The camera that will be used to raycast or to find the position where cursor is currently pointing in world.")]
        [SerializeField]
        private Camera RaycastCamera;
        [Tooltip("Set of all terrain layers to use.")]
        [SerializeField]
        private TerrainLayersSet TerrainLayers;
        [Tooltip("Set of all brushes to use.")]
        [SerializeField]
        private BrushmasksSet Brushes;

        [Header("Mask:")]
        [Tooltip("The height to set in masked area, its normalized value.")]
        [SerializeField]
        private float MaskedAreaHeight = 0;
        [Tooltip("The mask border in texels, it's to fix the void visuals thourgh terrain when the height is increased at edges.")]
        [SerializeField]
        private float MaskBorderSize = 2;

        [Header("Perfomance Settings:")]
        [Tooltip("The dimension of tiles in which to divide the brush. Only for CPU based.")]
        //[SerializeField]      // CPU SIDE OBSOLETE !
        private const int BatchCount = 16;
        [Tooltip("How many frames to give the job to finish. For both CPU based and GPU based.")]
        [SerializeField]
        [Range(0, 3)]
        private int FrameSkipping = 0;
        [Tooltip("Whether to use GPU computing.\n" + "Good for heightmap larger than 513x513.")]
        //[SerializeField]  // CPU SIDE IS OBSOLETE !
        private const bool HardwareAcceleration = true;
        [Tooltip("GPU terrain to CPU terrain sync control. Sync if required for geomatry reposition i.e grass and trees, and for physics. If only visuals are required 'None' can be used.\n\n" +
            "AfterClick: Will sync after the plouging has been stopped, i.e On Mouse Click Up.\n\n" +
            "None: Will not sync GPU data to CPU at all.\n\n" +
            "Forced: Will sync after each change.\n\n" +
            "Auto: Will update the terrain completely in upcoming frame depending on the SyncSkipping.\n\n" +
            "Partial: Will only update heightmap on CPU side while no LODS i.e grass and trees will not reposition.\n\n" +
            "Partial Auto: Will only update heightmap instantly while the LODS will be updated in upcoming frame depending on SyncSkipping.\n")]
        [SerializeField]
        private TerrainSyncMode SyncMode = TerrainSyncMode.AfterClick;
        [Tooltip("How many frames after to sync terrain. For Auto And Partial Auto Sync Modes.")]
        [Range(0, 10)]
        [SerializeField]
        private int SyncSkipping = 1;

#if UNITY_EDITOR
        [Header("Debug:")]
        [Tooltip("To draw gizmos or hologram where the brush is going to draw. It's editor only on build it will be removed, be sure to turn show gizmos in game window.")]
        [SerializeField]
        private bool GizmosEnabled = true;
#endif

        [Header("Other:")]
        [Tooltip("To register commands in Command Histroy.")]
        [SerializeField]
        private bool RegisterCommands = true;
        [Tooltip("If true the cursor will not move while drawing spiral and ring.")]
        [SerializeField]
        private bool AllowSpiralRingCursorLock = true;
        //      //

        /// <summary>
        /// Height map resolution.
        /// </summary>
        private int _heightmapResolution;
        /// <summary>
        /// Original height map.
        /// </summary>
        private float[,] _heightmap;
        /// <summary>
        /// Brushmap.
        /// </summary>
        private float[,] _brushmap;

        /// <summary>
        /// The angle which 'Angle' will be approaching to.
        /// </summary>
        private float _newAngle;
        /// <summary>
        /// Mouse or cursor position in last frame.
        /// </summary>
        private Vector2 _lastMousePosition;
        /// <summary>
        /// Current skiped frames, or 'waiting for frames'.
        /// </summary>
        private int _currentSkipCount;

        private JobHandle _nBrushingJobHandle;
        private NativeArrayViewHandle _nBrushMapViewHandle;
        private NativeArrayViewHandle _nHeightMapViewHandle;

        /// <summary>
        /// Whether a job is dispatched or not. If dispatched then not completed.
        /// </summary>
        private bool _jobCompleted = true;
        /// <summary>
        /// The texel position base in heightmap for which the job is dispatched.
        /// </summary>
        private int2 _texelPos;
        /// <summary>
        /// Original heightmap copy on GPU.
        /// </summary>
        private RenderTexture _heightmapTexture;
        /// <summary>
        /// Texture of to hold current region of heightmap under brush influence on GPU.
        /// </summary>
        private RenderTexture _currentHeightmapTexture;
        /// <summary>
        /// The result of brush on heightmap.
        /// </summary>
        private RenderTexture _renderTexture;

/*        /// <summary>
        /// The brush bounding box from last frame.
        /// </summary>
        private int _lastFrameSize;*/

        /// <summary>
        /// The material being used for ploughing, GPU based.
        /// </summary>
        private Material _ploughMaterial;
        /// <summary>
        /// Name of the shader from which the plouging material will be created.
        /// </summary>
        private const string PLOUGH_SHADER = "TerrainPloughTool/PloughShader";

        /// <summary>
        /// Whether curretn input is for erasing.
        /// </summary>
        private bool _erasing;
        /// <summary>
        /// Whether Terrain GPU data and CPU data are unsycned or not.
        /// </summary>
        private bool _dirtyHeightmap;

        /// <summary>
        /// Just a buffer to have copy of spiral radius before start expending it.
        /// </summary>
        private float _copiedOrignalRadius = -1;

        private int _currentSyncSkipCount;

        private Texture2D _brushmaskTexture;
        private int _lastBrushIndex;

        private RenderTexture _brushmaskRescaleTexture;
        private bool _dirtyBrushmask;

        private byte[] _brushmask;
        private NativeArrayViewHandle _nBrushmaskViewHandle;

        private NativeArray<float> _nBrushmapCopy;

        private float[,,] _alphamap;
        private NativeArrayViewHandle _nAlphamapViewHandle;

        private BrushMode _lastMode;

        private int _alphamapResolution;
        private bool _dirtyAlphamap;

        private RenderTexture _bilinearCurrentHeightmapTexture;
        private Texture2DArray _splatmapTextures;

        private RenderTexture _splatRenderTexture;

        private Mesh _brushPreviewMesh;
        private const string BRUSH_PREVIEW_SHADER_NAME = "TerrainPloughTool/BrushPreviewShader";
        private Material _brushPreviewMaterial;

        private const int MAX_BRUSH_PREVIEW_GRID_RESOLUTION = 196;

        private TerrainSaveLoadSystem _saveLoadSystem;

        private ModifyHeightsCommand _currentHeightCommand;
        private ModifySplatsCommand _currentAlphamapsCommand;

        private RenderTexture _maskPassRenderTexture;

        /// <summary>
        /// Storing hit of last frame, useful when cursor is moving during spiral to not allow pos change.
        /// </summary>
        private RaycastHit _hit;
        private RaycastHit _hologramHit;

        /// <summary>
        /// For Spiral Subdvisions
        /// </summary>
        private float _lastAngle;

        private const float DESIRED_SPIRAL_ARC = 0.1f;

#if LOG_ENABLED
        private Stopwatch _stopwatch = new ();
        private long _elaspedTime;
#endif
        #endregion

        #region UNITY_EVENTS

        private void Awake() {
            if (_saveLoadSystem == null) {
                _saveLoadSystem = new TerrainSaveLoadSystem();
            }
        }

        private void Start() {
            Debug.Assert(Terrain        != null, $"{name}:{nameof(TerrainPloughTool)}, variable {nameof(Terrain)} is not assigned.");
            Debug.Assert(RaycastCamera  != null, $"{name}:{nameof(TerrainPloughTool)}, variable {nameof(RaycastCamera)} is not assigned.");
            Debug.Assert(TerrainLayers  != null, $"{name}:{nameof(TerrainLayersSet)}, variable {nameof(TerrainLayers)} is not assigned.");
            Debug.Assert(Brushes        != null, $"{name}:{nameof(BrushmasksSet)}, variable {nameof(Brushes)} is not assigned.");
            Debug.Assert(EventSystem.current != null, "There is no event system in scene, Create a event system by right click inside heirarchy then in UI menu.");

            _currentSkipCount = FrameSkipping;
            _currentSyncSkipCount = SyncSkipping;

            _heightmapResolution = Terrain.terrainData.heightmapResolution;
            _alphamapResolution = Terrain.terrainData.alphamapResolution;

            Terrain.terrainData.terrainLayers = TerrainLayers.Layers;

            _brushPreviewMaterial = new Material(Shader.Find(BRUSH_PREVIEW_SHADER_NAME));

#if LOG_ENABLED
            Debug.Log($"Cloning Terrain: {Terrain.name}, Height Map.");
            _stopwatch.Start();
#endif
            // coping original height.
            if (HardwareAcceleration) {
                _ploughMaterial = new Material(Shader.Find(PLOUGH_SHADER));

                _heightmapTexture = new RenderTexture(_heightmapResolution, _heightmapResolution, 0, Terrain.heightmapFormat, 0);

                var originalRenderTexture = RenderTexture.active;
                Graphics.Blit(Terrain.terrainData.heightmapTexture, _heightmapTexture);
                RenderTexture.active = originalRenderTexture;

            } else {
                _heightmap = Terrain.terrainData.GetHeights(0, 0, _heightmapResolution, _heightmapResolution);
            }

#if LOG_ENABLED
            _stopwatch.Stop();
            Debug.Log($"Time took to clone heightmap: {_stopwatch.ElapsedMilliseconds}ms");
            _elaspedTime += _stopwatch.ElapsedMilliseconds;
            _stopwatch.Reset();
#endif
        }

        private void Update() {

            _heightmapResolution = Terrain.terrainData.heightmapResolution;
            _alphamapResolution = Terrain.terrainData.alphamapResolution;

            [MethodImpl(MethodImplOptions.AggressiveInlining)]
            void HeightmapHardSync() {

#if LOG_ENABLED
                _stopwatch.Start();
#endif
                Terrain.terrainData.SyncHeightmap();
#if LOG_ENABLED
                _stopwatch.Stop();
                Debug.Log($"Auto Synced: Terrain Heightmap and LOD. Time Took: {_stopwatch.ElapsedMilliseconds}ms");
                _stopwatch.Reset();
#endif
            }

            [MethodImpl(MethodImplOptions.AggressiveInlining)]
            void AlphamapsHardSync()
            {
#if LOG_ENABLED
                _stopwatch.Start();
#endif
                Terrain.terrainData.SyncTexture(TerrainData.AlphamapTextureName);
#if LOG_ENABLED
                _stopwatch.Stop();
                Debug.Log($"Auto Synced: Terrain Alphamsps. Time Took: {_stopwatch.ElapsedMilliseconds}ms");
                _stopwatch.Reset();
#endif
            }

            if (_currentSyncSkipCount >= SyncSkipping) {
                _currentSyncSkipCount = 0;

                if (_dirtyHeightmap && (SyncMode == TerrainSyncMode.Auto || SyncMode == TerrainSyncMode.PartialAuto)) {
                    _dirtyHeightmap = false;
                    HeightmapHardSync();
                }
                if (_dirtyAlphamap && (SyncMode == TerrainSyncMode.Auto || SyncMode == TerrainSyncMode.PartialAuto))
                {
                    _dirtyAlphamap = false;
                    AlphamapsHardSync();
                }

            } else {
                _currentSyncSkipCount++;
            }
            if (Input.GetKey(KeyCode.Mouse0) == false) {

                bool willSync = _dirtyHeightmap || _dirtyAlphamap;

                // doing Sync of Terrain GPU data to CPU
                if (_dirtyHeightmap && SyncMode == TerrainSyncMode.AfterClick) {
                    _dirtyHeightmap = false;
                    HeightmapHardSync();
                }

                if (_dirtyAlphamap && SyncMode == TerrainSyncMode.AfterClick)
                {
                    _dirtyAlphamap = false;
                    AlphamapsHardSync();
                }

                if (RegisterCommands && willSync)
                {
                    switch (_lastMode)
                    {
                        case BrushMode.Paint:
                            if(_currentAlphamapsCommand != null)
                            {
                                _currentAlphamapsCommand.Complete(Terrain.terrainData);
                                CommandHistory.Register(_currentAlphamapsCommand);
                                _currentAlphamapsCommand = null;
                            }
                            break;
                        default:
                            if (_currentHeightCommand != null)
                            {
                                _currentHeightCommand.Complete(Terrain.terrainData);
                                CommandHistory.Register(_currentHeightCommand);
                                _currentHeightCommand = null;
                            }
                            break;
                    }
                }
            }

            if (_currentSkipCount >= FrameSkipping) {
                _currentSkipCount = 0;
                
                if (_jobCompleted == false) {
                    _jobCompleted = true;

                    _nBrushingJobHandle.Complete();

                    if (_lastMode == BrushMode.Paint) {

                        Terrain.terrainData.SetAlphamaps(_texelPos.x, _texelPos.y, _alphamap);

                        _nAlphamapViewHandle.Dispose();

                    } else {
                        // apply newly calculated heights block to terrain height map.
                        if (SyncMode == TerrainSyncMode.Forced)
                            Terrain.terrainData.SetHeights(_texelPos.x, _texelPos.y, _brushmap);
                        else {
                            Terrain.terrainData.SetHeightsDelayLOD(_texelPos.x, _texelPos.y, _brushmap);
                            _dirtyHeightmap = true;
                        }

                        _nBrushMapViewHandle.Dispose();
                        _nHeightMapViewHandle.Dispose();

                        if (_lastMode == BrushMode.Smooth) {
                            _nBrushmapCopy.Dispose();
                        }
                    }

                    _nBrushmaskViewHandle.Dispose();

                    if (RegisterCommands && (Input.GetKey(KeyCode.Mouse0) == false))
                    {
                        switch (_lastMode)
                        {
                            case BrushMode.Paint:
                                if (_currentAlphamapsCommand != null)
                                {
                                    _currentAlphamapsCommand.Complete(Terrain.terrainData);
                                    CommandHistory.Register(_currentAlphamapsCommand);
                                    _currentAlphamapsCommand = null;
                                }
                                break;
                            default:
                                if (_currentHeightCommand != null)
                                {
                                    _currentHeightCommand.Complete(Terrain.terrainData);
                                    CommandHistory.Register(_currentHeightCommand);
                                    _currentHeightCommand = null;
                                }
                                break;
                        }
                    }
                }
            } else {
                _currentSkipCount++;
                return;
            }

            {
                if(_brushmaskTexture != null) {
                    if(_brushmaskTexture.CheckSize(BrushWidth, BrushHeight) == false) {
                        _dirtyBrushmask = true;

                        // resize
                        Destroy(_brushmaskTexture);
                        _brushmaskRescaleTexture.Release();

                        _brushmaskTexture = new Texture2D(BrushWidth, BrushHeight, TextureFormat.R8, false, true, true);
                        _brushmaskRescaleTexture = new RenderTexture(BrushWidth, BrushHeight, 0, UnityEngine.Experimental.Rendering.GraphicsFormat.R8_UNorm, 0);

                        // tessellating new brush preview mesh
                        var size = Convert.ToInt32(Mathf.Sqrt(Mathf.Pow(BrushWidth, 2) + Mathf.Pow(BrushHeight, 2)));
                        _brushPreviewMesh = GenerateGrid(Mathf.Min(size, MAX_BRUSH_PREVIEW_GRID_RESOLUTION));
                    }
                }
                else
                {
                    _dirtyBrushmask = true;

                    // create new
                    _brushmaskTexture = new Texture2D(BrushWidth, BrushHeight, TextureFormat.R8, false, true, true);
                    _brushmaskRescaleTexture = new RenderTexture(BrushWidth, BrushHeight, 0, UnityEngine.Experimental.Rendering.GraphicsFormat.R8_UNorm, 0);

                    // tessellating new brush preview mesh
                    var size = Convert.ToInt32(Mathf.Sqrt(Mathf.Pow(BrushWidth, 2) + Mathf.Pow(BrushHeight, 2)));
                    _brushPreviewMesh = GenerateGrid(Mathf.Min(size, MAX_BRUSH_PREVIEW_GRID_RESOLUTION));
                }

                // if brush changed
                if (_lastBrushIndex != ActiveBrushIndex)
                {
                    _dirtyBrushmask = true;
                }
                // rescales selected brush
                if (_dirtyBrushmask)
                {
                    _dirtyBrushmask = false;
#if LOG_ENABLED
                    _stopwatch.Start();
#endif
                    // intializing new selected mask
                    var originalRenderTexture = RenderTexture.active;
                    RenderTexture.active = _brushmaskRescaleTexture;
                    Graphics.Blit(Brushes.Masks[ActiveBrushIndex], _brushmaskRescaleTexture);

                    _brushmaskTexture.ReadPixels(new Rect(0, 0, BrushWidth, BrushHeight), 0, 0);
                    _brushmask = _brushmaskTexture.GetRawTextureData();

                    RenderTexture.active = originalRenderTexture;

#if LOG_ENABLED

                    _stopwatch.Stop();
                    print("Time Taken to rescale brush mask: " + watch.ElapsedMilliseconds + " ms");
                    _stopwatch.Reset();
#endif
                }
                _lastBrushIndex = ActiveBrushIndex;
            }

            if (Input.GetKey(KeyCode.Mouse0) == false)
            {
                if(_currentHeightCommand != null)
                {
                    _currentHeightCommand.DestroyCommand();
                }
                if(_currentAlphamapsCommand != null)
                {
                    _currentAlphamapsCommand.DestroyCommand();
                }

                return;
            }

            var ray = RaycastCamera.ScreenPointToRay(Input.mousePosition);
            // if spiral use the first click position
            if ((Mode == BrushMode.Spiral || Mode == BrushMode.Rings) &&
                AllowSpiralRingCursorLock) {

                if (Input.GetKeyDown(KeyCode.Mouse0)) {
                    if (Physics.Raycast(ray, out _hit, RaycastCamera.farClipPlane, 1 << Terrain.gameObject.layer) == false)
                        return;
                }
            } else {
                // for other brushes follow the cursor
                if (Physics.Raycast(ray, out _hit, RaycastCamera.farClipPlane, 1 << Terrain.gameObject.layer) == false)
                    return;
            }
            if (EventSystem.current.IsPointerOverGameObject())
                return;

#if LOG_ENABLED
            _stopwatch.Start();
#endif
            if (Mode == BrushMode.Paint)
            {
                if (_currentAlphamapsCommand == null)
                {
                    _currentAlphamapsCommand = new ModifySplatsCommand(Terrain.terrainData);
                }
            }
            else
            {
                if (_currentHeightCommand == null)
                {
                    _currentHeightCommand = new ModifyHeightsCommand(Terrain.terrainData);
                }
            }

            // calculating a large square around brush rectangle to accomodate rotation.
            var realBrushSize = Convert.ToInt32(
                            Mathf.Sqrt(Mathf.Pow(BrushWidth, 2) + Mathf.Pow(BrushHeight, 2)));


            int subDivs = 1;                // currenly only being used for spiral
            // if spiral divide it into parts if the arc, that will be draw is grater then desired arc,
            // else it will not be able to cover the whole arc and create a gap.
            if (Mode == BrushMode.Spiral) {
                float arc = Radius * (Mathf.Deg2Rad * (Angle - _lastAngle));
                subDivs = (int)(arc / DESIRED_SPIRAL_ARC) + 1;
            }

            for (int div = 0; div < subDivs; div++) {

                // converting click position in world space to texel space of the heightmap.
                var terrainPos = _hit.point - Terrain.transform.position;
                if (Mode == BrushMode.Spiral) {
                    float angle = _lastAngle + ((Angle - _lastAngle) * (1f / (float)((subDivs - div))));
                    var dir = new Vector3(Mathf.Cos(angle * Mathf.Deg2Rad), 0, Mathf.Sin(angle * Mathf.Deg2Rad));

                    terrainPos += dir * Radius;
                }

                var uv = (terrainPos.x, terrainPos.z);
                uv = (uv.x / Terrain.terrainData.size.x, uv.z / Terrain.terrainData.size.z);

                var textureResolution = Mode == BrushMode.Paint ? _alphamapResolution : _heightmapResolution;
                if (Mode == BrushMode.Spiral) {
                    uv = (uv.x - ((DotDiameter / (float)_heightmapResolution) * 0.5f), uv.z - ((DotDiameter / (float)_heightmapResolution) * 0.5f));
                    //uvTexel = (uvTexel.x - (DotDiameter * 0.5f), uvTexel.z + (DotDiameter * 0.5f));
                } else {
                    uv = (uv.x - ((realBrushSize / (float)textureResolution) * 0.5f), uv.z - ((realBrushSize / (float)textureResolution) * 0.5f));
                }
                (float x, float z) uvTexel = (uv.x * textureResolution, uv.z * textureResolution);
                _texelPos = new int2(Convert.ToInt32(uvTexel.x), Convert.ToInt32(uvTexel.z));

                //                                                                  //
                {
                    var size = Mode == BrushMode.Spiral ? DotDiameter : realBrushSize;

                    // CRITICAL CODE:-
                    if (HardwareAcceleration) {
                        uv = (_texelPos.x / (float)textureResolution, _texelPos.y / (float)textureResolution);
                    }
                    // **************************************************************** //  

                    var terrainMaxHeightMultiplier = 1 / Terrain.terrainData.size.y;

#if LOG_ENABLED
                Debug.Log($"Before Job: {_stopwatch.ElapsedMilliseconds}ms");
#endif
                    if (HardwareAcceleration) {

                        if (_renderTexture != null) {
                            if (_renderTexture.CheckSize(size, size) == false) {
                                _renderTexture.Release();

                                _renderTexture = new RenderTexture(size, size, 0, Terrain.heightmapFormat, 0);
                            }
                        } else {
                            _renderTexture = new RenderTexture(size, size, 0, Terrain.heightmapFormat, 0);
                        }

                        if (_maskPassRenderTexture != null) {
                            if (_maskPassRenderTexture.CheckSize(_heightmapResolution, _heightmapResolution) == false) {
                                _maskPassRenderTexture.Release();

                                _maskPassRenderTexture = new RenderTexture(_heightmapResolution, _heightmapResolution, 0, Terrain.heightmapFormat, 0);
                            }
                        } else {
                            _maskPassRenderTexture = new RenderTexture(_heightmapResolution, _heightmapResolution, 0, Terrain.heightmapFormat, 0);
                        }

                        if (_currentHeightmapTexture != null) {
                            if (_currentHeightmapTexture.CheckSize(size, size) == false) {
                                _currentHeightmapTexture.Release();

                                _currentHeightmapTexture = new RenderTexture(size, size, 0, Terrain.heightmapFormat, 0);
                            }
                        } else {
                            _currentHeightmapTexture = new RenderTexture(size, size, 0, Terrain.heightmapFormat, 0);
                        }

                        // makking sure all data is initialized
                        if (_ploughMaterial == null) {
                            _ploughMaterial = new Material(Shader.Find(PLOUGH_SHADER));
                        }

                        if (Mode != BrushMode.Paint) {
                            var originalRenderTexture = RenderTexture.active;

                            if (_heightmapTexture != null) {
                                if (_heightmapTexture.CheckSize(_heightmapResolution, _heightmapResolution) == false) {

                                    _heightmapTexture.Release();

                                    _heightmapTexture = new RenderTexture(_heightmapResolution, _heightmapResolution, 0, Terrain.heightmapFormat, 0);
                                    Graphics.Blit(Terrain.terrainData.heightmapTexture, _heightmapTexture);
                                }
                            } else {

                                _heightmapTexture = new RenderTexture(_heightmapResolution, _heightmapResolution, 0, Terrain.heightmapFormat, 0);
                                Graphics.Blit(Terrain.terrainData.heightmapTexture, _heightmapTexture);
                            }

                            // if paint brush reselected, recreate the base heightmap
                            if ((Mode == BrushMode.Lines || Mode == BrushMode.Spiral || Mode == BrushMode.Curvey || Mode == BrushMode.Rings) &&
                                (_lastMode != BrushMode.Lines && _lastMode != BrushMode.Spiral && _lastMode != BrushMode.Curvey && _lastMode != BrushMode.Rings)) {

                                if (_heightmapTexture != null) {
                                    _heightmapTexture.Release();
                                }

                                Graphics.Blit(Terrain.terrainData.heightmapTexture, _heightmapTexture);
                            }

                            // coping current heightmap current the brush region
                            float normSize = size / (float)_heightmapResolution;
                            _ploughMaterial.SetVector("_Box", new Vector4(uv.x, uv.z, normSize, Angle));
                            Graphics.Blit(Terrain.terrainData.heightmapTexture, _currentHeightmapTexture, _ploughMaterial, 0);

                            // drawing depending on specified
                            // 
                            float normBrushWidth;
                            float normBrushHeight;
                            if (Mode != BrushMode.Spiral) {
                                normBrushWidth = BrushWidth / (float)size;
                                normBrushHeight = BrushHeight / (float)size;
                            } else {
                                normBrushWidth = DotDiameter / (float)size;
                                normBrushHeight = normBrushWidth;
                            }

                            _ploughMaterial.SetVector("_Brush", new Vector4(normBrushWidth, normBrushHeight, Frequency, Amplitude));
                            _ploughMaterial.SetTexture("_Mask", _brushmaskRescaleTexture);

                            switch (Mode) {
                                case BrushMode.Lines: {
                                        _ploughMaterial.SetTexture("_Basemap", _heightmapTexture);
                                        _ploughMaterial.SetVector("_Hardness", new Vector4(Hardness * terrainMaxHeightMultiplier, DeltaTime, _erasing ? -1 : 1f));
                                        Graphics.Blit(_currentHeightmapTexture, _renderTexture, _ploughMaterial, 1);
                                    }
                                    break;
                                case BrushMode.Rings: {
                                        _ploughMaterial.SetTexture("_Basemap", _heightmapTexture);
                                        _ploughMaterial.SetVector("_Hardness", new Vector4(Hardness * terrainMaxHeightMultiplier, DeltaTime, _erasing ? -1 : 1f));
                                        Graphics.Blit(_currentHeightmapTexture, _renderTexture, _ploughMaterial, 1);
                                    }
                                    break;
                                case BrushMode.Curvey: {
                                        _ploughMaterial.SetTexture("_Basemap", _heightmapTexture);
                                        _ploughMaterial.SetVector("_Hardness", new Vector4(Hardness * terrainMaxHeightMultiplier, DeltaTime, _erasing ? -1 : 1f));
                                        Graphics.Blit(_currentHeightmapTexture, _renderTexture, _ploughMaterial, 1);
                                    }
                                    break;
                                case BrushMode.Spiral: {
                                        _ploughMaterial.SetTexture("_Basemap", _heightmapTexture);
                                        _ploughMaterial.SetVector("_Hardness", new Vector4(Hardness * terrainMaxHeightMultiplier, DeltaTime, _erasing ? -1 : 1f));
                                        Graphics.Blit(_currentHeightmapTexture, _renderTexture, _ploughMaterial, 2);
                                    }
                                    break;
                                case BrushMode.Rasie: {
                                        _ploughMaterial.SetVector("_Hardness", new Vector4(Hardness * terrainMaxHeightMultiplier, DeltaTime, _erasing ? -1 : 1f));
                                        Graphics.Blit(_currentHeightmapTexture, _renderTexture, _ploughMaterial, 6);
                                    }
                                    break;
                                case BrushMode.Lower: {
                                        _ploughMaterial.SetVector("_Hardness", new Vector4(Hardness * terrainMaxHeightMultiplier, DeltaTime, _erasing ? -1 : 1f));
                                        Graphics.Blit(_currentHeightmapTexture, _renderTexture, _ploughMaterial, 7);
                                    }
                                    break;
                                case BrushMode.Smooth: {
                                        if (_bilinearCurrentHeightmapTexture != null) {
                                            if (_bilinearCurrentHeightmapTexture.CheckSize(size, size) == false) {
                                                _bilinearCurrentHeightmapTexture.Release();

                                                _bilinearCurrentHeightmapTexture = new RenderTexture(size, size, 0, Terrain.heightmapFormat, 0);
                                                _bilinearCurrentHeightmapTexture.filterMode = FilterMode.Bilinear;
                                            }
                                        } else {
                                            _bilinearCurrentHeightmapTexture = new RenderTexture(size, size, 0, Terrain.heightmapFormat, 0);
                                            _bilinearCurrentHeightmapTexture.filterMode = FilterMode.Bilinear;
                                        }

                                        Graphics.Blit(_currentHeightmapTexture, _bilinearCurrentHeightmapTexture);

                                        _ploughMaterial.SetVector("_Hardness", new Vector4(Hardness * terrainMaxHeightMultiplier, DeltaTime, _erasing ? -1 : 1f));
                                        _ploughMaterial.SetTexture("_Bilinear", _bilinearCurrentHeightmapTexture);

                                        Graphics.Blit(_currentHeightmapTexture, _renderTexture, _ploughMaterial, 5);
                                    }
                                    break;
                                case BrushMode.Flatten: {
                                        _ploughMaterial.SetVector("_Hardness", new Vector4(Hardness * terrainMaxHeightMultiplier, DeltaTime, _erasing ? -1 : 1f, (FlattenHeight / Terrain.terrainData.size.y) * 0.5f));
                                        Graphics.Blit(_currentHeightmapTexture, _renderTexture, _ploughMaterial, 4);
                                    }
                                    break;
                                case BrushMode.Eraser: {
                                        _ploughMaterial.SetVector("_Hardness", new Vector4(Hardness * terrainMaxHeightMultiplier, DeltaTime, _erasing ? -1 : 1f));
                                        Graphics.Blit(_currentHeightmapTexture, _renderTexture, _ploughMaterial, 3);
                                    }
                                    break;
                            }

                            Vector2Int slicedSize = new Vector2Int(size, size);
                            Vector2Int slicedPos = new Vector2Int(_texelPos.x, _texelPos.y);
                            Vector2Int offset = new Vector2Int();
                            if (_texelPos.x + size > textureResolution) {
                                slicedSize.x += textureResolution - (_texelPos.x + size);
                            }
                            if (_texelPos.y + size > textureResolution) {
                                slicedSize.y += textureResolution - (_texelPos.y + size);
                            }
                            if (_texelPos.x < 0) {
                                offset.x += -slicedPos.x;
                                slicedSize.x += slicedPos.x;
                                slicedPos.x = 0;
                            }
                            if (_texelPos.y < 0) {
                                offset.y += -slicedPos.y;
                                slicedSize.y += slicedPos.y;
                                slicedPos.y = 0;
                            }

                            // if whole of the brush is outside the terrain then nothing can be done, i.e gonna slice whole things make no sense
                            if (((_texelPos.x + size < 0 || _texelPos.x > textureResolution) ||
                               (_texelPos.y + size < 0 || _texelPos.y > textureResolution)) == false) {
                                // sending the result of new calculated heightmap's brush region to the terrain.
                                TerrainHeightmapSyncControl syncControl = TerrainHeightmapSyncControl.None;
                                if (SyncMode == TerrainSyncMode.Forced)
                                    syncControl = TerrainHeightmapSyncControl.HeightAndLod;
                                else if (SyncMode == TerrainSyncMode.Partial || SyncMode == TerrainSyncMode.PartialAuto)
                                    syncControl = TerrainHeightmapSyncControl.HeightOnly;

                                Terrain.terrainData.CopyActiveRenderTextureToHeightmap(new RectInt(offset.x, offset.y, slicedSize.x, slicedSize.y), new Vector2Int(slicedPos.x, slicedPos.y), syncControl);
                                _dirtyHeightmap = SyncMode != TerrainSyncMode.Forced && SyncMode != TerrainSyncMode.Partial;


                                // masking 
                                _ploughMaterial.SetTexture("_Mask", Terrain.terrainData.holesTexture);
                                _ploughMaterial.SetVector("_Params", new Vector4((MaskedAreaHeight / Terrain.terrainData.size.y) * 0.5f, _heightmapResolution, MaskBorderSize, 0));
                                Graphics.Blit(Terrain.terrainData.heightmapTexture, _maskPassRenderTexture, _ploughMaterial, 9);
                                Terrain.terrainData.CopyActiveRenderTextureToHeightmap(new RectInt(0, 0, textureResolution, textureResolution), Vector2Int.zero, TerrainHeightmapSyncControl.None);

                                RenderTexture.active = originalRenderTexture;
                            }
                        } else {
                            var splatCount = Terrain.terrainData.alphamapTextureCount;
                            var lastSplatUsedChannels = Terrain.terrainData.alphamapLayers % 4;

                            if (_splatRenderTexture != null) {
                                if (_splatRenderTexture.CheckSize(size, size) == false) {
                                    _splatRenderTexture.Release();

                                    _splatRenderTexture = new RenderTexture(size, size, 0, UnityEngine.Experimental.Rendering.GraphicsFormat.R8G8B8A8_UNorm);
                                }
                            } else {
                                _splatRenderTexture = new RenderTexture(size, size, 0, UnityEngine.Experimental.Rendering.GraphicsFormat.R8G8B8A8_UNorm);
                            }

                            if (_splatmapTextures != null) {
                                if (_splatmapTextures.CheckSize(size, size) == false) {
                                    Destroy(_splatmapTextures);

                                    _splatmapTextures = new Texture2DArray(size, size, splatCount,
                                        UnityEngine.Experimental.Rendering.GraphicsFormat.R8G8B8A8_UNorm, UnityEngine.Experimental.Rendering.TextureCreationFlags.DontInitializePixels, 0);
                                }
                            } else {
                                _splatmapTextures = new Texture2DArray(size, size, splatCount,
                                    UnityEngine.Experimental.Rendering.GraphicsFormat.R8G8B8A8_UNorm, UnityEngine.Experimental.Rendering.TextureCreationFlags.DontInitializePixels, 0);
                            }


                            Vector2Int slicedSize = new Vector2Int(size, size);
                            Vector2Int slicedPos = new Vector2Int(_texelPos.x, _texelPos.y);
                            Vector2Int offset = new Vector2Int();
                            if (_texelPos.x + size > textureResolution) {
                                slicedSize.x += textureResolution - (_texelPos.x + size);
                            }
                            if (_texelPos.y + size > textureResolution) {
                                slicedSize.y += textureResolution - (_texelPos.y + size);
                            }
                            if (_texelPos.x < 0) {
                                offset.x += -slicedPos.x;
                                slicedSize.x += slicedPos.x;
                                slicedPos.x = 0;
                            }
                            if (_texelPos.y < 0) {
                                offset.y += -slicedPos.y;
                                slicedSize.y += slicedPos.y;
                                slicedPos.y = 0;
                            }


                            float normSize = size / (float)textureResolution;
                            for (var i = 0; i < splatCount; i++) {
                                Graphics.CopyTexture(Terrain.terrainData.alphamapTextures[i], 0, 0, slicedPos.x, slicedPos.y, slicedSize.x, slicedSize.y, _splatmapTextures, i, 0, offset.x, offset.y);
                            }

                            var originalRenderTexture = RenderTexture.active;
                            _ploughMaterial.SetVector("_Brush", new Vector4(BrushWidth / (float)size, BrushHeight / (float)size, 0, 0));
                            _ploughMaterial.SetTexture("_Mask", _brushmaskRescaleTexture);
                            _ploughMaterial.SetVector("_Box", new Vector4(uv.x, uv.z, normSize, Angle));
                            _ploughMaterial.SetVector("_Hardness", new Vector4(Hardness, DeltaTime, 0, 0));
                            _ploughMaterial.SetTexture("_Splatmaps", _splatmapTextures);

                            bool sync = SyncMode == TerrainSyncMode.Forced ? true : false;
                            for (var i = 0; i < splatCount; i++) {

                                {
                                    var selectionIndex = PaintLayer % 4;
                                    var selectionMask = new Vector4(selectionIndex == 0 ? 1 : 0, selectionIndex == 1 ? 1 : 0, selectionIndex == 2 ? 1 : 0, selectionIndex == 3 ? 1 : 0);
                                    _ploughMaterial.SetVector("_Params", new Vector4(PaintLayer, i, i == (PaintLayer / 4) ? 1 : -1, 1f));
                                    _ploughMaterial.SetVector("_Selection", selectionMask);
                                    Graphics.Blit(Terrain.terrainData.alphamapTextures[i], _splatRenderTexture, _ploughMaterial, 8);
                                }

                                Terrain.terrainData.CopyActiveRenderTextureToTexture(TerrainData.AlphamapTextureName, i,
                                    new RectInt(offset.x, offset.y, slicedSize.x, slicedSize.y), new Vector2Int(slicedPos.x, slicedPos.y), sync);
                            }
                            RenderTexture.active = originalRenderTexture;

                            _dirtyAlphamap = !sync;
                        }

                    } 
                    else {

                        if (_texelPos.x + size >= textureResolution)
                            _texelPos.x += textureResolution - (_texelPos.x + size);
                        if (_texelPos.y + size >= textureResolution)
                            _texelPos.y += textureResolution - (_texelPos.y + size);
                        // Clamp the left side (x-axis)
                        if (_texelPos.x < 0) {
                            //size += _texelPos.x; // Reduce size to account for the left out-of-bounds portion
                            _texelPos.x = 0;     // Clamp to the left edge
                        }
                        // Clamp the top side (y-axis)
                        if (_texelPos.y < 0) {
                            //size += _texelPos.y; // Reduce size to account for the top out-of-bounds portion
                            _texelPos.y = 0;     // Clamp to the top edge
                        }
                        if (_texelPos.x + size >= textureResolution)
                            size += textureResolution - (_texelPos.x + size);
                        if (_texelPos.y + size >= textureResolution)
                            size += textureResolution - (_texelPos.y + size);

                        if (Mode != BrushMode.Paint) {
                            // if paint brush reselected, recreate the base heightmap
                            if ((Mode == BrushMode.Lines || Mode == BrushMode.Spiral || Mode == BrushMode.Curvey || Mode == BrushMode.Rings) &&
                                (_lastMode != BrushMode.Lines && _lastMode != BrushMode.Spiral && _lastMode != BrushMode.Curvey && _lastMode != BrushMode.Rings)) {

                                _heightmap = Terrain.terrainData.GetHeights(0, 0, _heightmapResolution, _heightmapResolution);
                            }

                            if (_heightmap == null || (_heightmap.GetLength(0) != _heightmapResolution || _heightmap.GetLength(1) != _heightmapResolution)) {
                                _heightmap = Terrain.terrainData.GetHeights(0, 0, _heightmapResolution, _heightmapResolution);
                            }

                            // obtaining current brush map. or region of heightmap under brush influance.
                            _brushmap = Terrain.terrainData.GetHeights(_texelPos.x, _texelPos.y, size, size);

                            _nHeightMapViewHandle = _heightmap.ViewAsNativeArray(out var nHeightmap);
                            _nBrushMapViewHandle = _brushmap.ViewAsNativeArray(out var nBrushmap);
                            _nBrushmaskViewHandle = _brushmask.ViewAsNativeArray(out var nBrushmask);

                            switch (Mode) {
                                case BrushMode.Lines: {
                                        _nBrushingJobHandle = new ApplyLinesBrushParrallelJob() {
                                            brushBase = _texelPos,
                                            nBrushMap = nBrushmap,
                                            nHeightMap = nHeightmap,
                                            brushmapPitch = size,
                                            brushSize = new float2(BrushWidth, BrushHeight),
                                            angle = Angle,
                                            heightmapPitch = _heightmapResolution,
                                            amplitude = Amplitude,
                                            frequency = Frequency,
                                            hardness = Hardness * terrainMaxHeightMultiplier,
                                            dt = DeltaTime,
                                            erasing = _erasing,
                                            nBrushmask = nBrushmask
                                        }
                                        .Schedule(size * size, BatchCount * BatchCount);
                                    }
                                    break;
                                case BrushMode.Rings: {
                                        _nBrushingJobHandle = new ApplyLinesBrushParrallelJob() {
                                            brushBase = _texelPos,
                                            nBrushMap = nBrushmap,
                                            nHeightMap = nHeightmap,
                                            brushmapPitch = size,
                                            brushSize = new float2(BrushWidth, BrushHeight),
                                            angle = Angle,
                                            heightmapPitch = _heightmapResolution,
                                            amplitude = Amplitude,
                                            frequency = Frequency,
                                            hardness = Hardness * terrainMaxHeightMultiplier,
                                            dt = DeltaTime,
                                            erasing = _erasing,
                                            nBrushmask = nBrushmask
                                        }
                                        .Schedule(size * size, BatchCount * BatchCount);
                                    }
                                    break;
                                case BrushMode.Curvey: {
                                        _nBrushingJobHandle = new ApplyLinesBrushParrallelJob() {
                                            brushBase = _texelPos,
                                            nBrushMap = nBrushmap,
                                            nHeightMap = nHeightmap,
                                            brushmapPitch = size,
                                            brushSize = new float2(BrushWidth, BrushHeight),
                                            angle = Angle,
                                            heightmapPitch = _heightmapResolution,
                                            amplitude = Amplitude,
                                            frequency = Frequency,
                                            hardness = Hardness * terrainMaxHeightMultiplier,
                                            dt = DeltaTime,
                                            erasing = _erasing,
                                            nBrushmask = nBrushmask
                                        }
                                        .Schedule(size * size, BatchCount * BatchCount);
                                    }
                                    break;
                                case BrushMode.Spiral: {
                                        _nBrushingJobHandle = new ApplySpiralBrushParrallelJob() {
                                            brushBase = _texelPos,
                                            nBrushMap = nBrushmap,
                                            nHeightMap = nHeightmap,
                                            brushmapPitch = size,
                                            heightmapPitch = _heightmapResolution,
                                            amplitude = Amplitude,
                                            hardness = Hardness * terrainMaxHeightMultiplier,
                                            dt = DeltaTime,
                                            erasing = _erasing
                                        }
                                        .Schedule(size * size, BatchCount * BatchCount);
                                    }
                                    break;
                                case BrushMode.Rasie: {
                                        _nBrushingJobHandle = new ApplyRaiseBrushParrallelJob() {
                                            brushBase = _texelPos,
                                            nBrushMap = nBrushmap,
                                            brushmapPitch = size,
                                            hardness = Hardness * terrainMaxHeightMultiplier * 2,
                                            dt = DeltaTime,
                                            angle = Angle,
                                            brushSize = new float2(BrushWidth, BrushHeight),
                                            nBrushmask = nBrushmask
                                        }
                                        .Schedule(size * size, BatchCount * BatchCount);
                                    }
                                    break;
                                case BrushMode.Lower: {
                                        _nBrushingJobHandle = new ApplyLowerBrushParrallelJob() {
                                            brushBase = _texelPos,
                                            nBrushMap = nBrushmap,
                                            brushmapPitch = size,
                                            hardness = Hardness * terrainMaxHeightMultiplier * 2,
                                            dt = DeltaTime,
                                            angle = Angle,
                                            brushSize = new float2(BrushWidth, BrushHeight),
                                            nBrushmask = nBrushmask,
                                        }
                                        .Schedule(size * size, BatchCount * BatchCount);
                                    }
                                    break;
                                case BrushMode.Smooth: {
                                        _nBrushmapCopy = new NativeArray<float>(nBrushmap, Allocator.TempJob);

                                        _nBrushingJobHandle = new ApplySmoothBrushParrallelJob() {
                                            brushBase = _texelPos,
                                            nBrushMap = nBrushmap,
                                            brushmapPitch = size,
                                            hardness = Hardness,
                                            dt = DeltaTime,
                                            angle = Angle,
                                            brushSize = new float2(BrushWidth, BrushHeight),
                                            nBrushmask = nBrushmask,
                                            nBrushMapCopy = _nBrushmapCopy
                                        }
                                        .Schedule(size * size, BatchCount * BatchCount);
                                    }
                                    break;
                                case BrushMode.Flatten: {
                                        _nBrushingJobHandle = new ApplyFlattenBrushParrallelJob() {
                                            brushBase = _texelPos,
                                            nBrushMap = nBrushmap,
                                            brushmapPitch = size,
                                            hardness = Hardness * terrainMaxHeightMultiplier * 2,
                                            dt = DeltaTime,
                                            angle = Angle,
                                            brushSize = new float2(BrushWidth, BrushHeight),
                                            nBrushmask = nBrushmask,
                                            height = FlattenHeight / Terrain.terrainData.size.y
                                        }
                                        .Schedule(size * size, BatchCount * BatchCount);
                                    }
                                    break;
                                case BrushMode.Eraser: {
                                        _nBrushingJobHandle = new ApplyEraseBrushParrallelJob() {
                                            brushBase = _texelPos,
                                            nBrushMap = nBrushmap,
                                            brushmapPitch = size,
                                            hardness = Hardness * terrainMaxHeightMultiplier * 2,
                                            dt = DeltaTime,
                                            angle = Angle,
                                            brushSize = new float2(BrushWidth, BrushHeight),
                                            nBrushmask = nBrushmask,
                                        }
                                        .Schedule(size * size, BatchCount * BatchCount);
                                    }
                                    break;
                            }
                        } else {
                            Debug.Assert(PaintLayer <= Terrain.terrainData.alphamapLayers, $"Name: {name}," +
                                $" {nameof(PaintLayer)}: {PaintLayer} excedes Terrain: {Terrain.name} layers ({Terrain.terrainData.alphamapLayers})");
                            _alphamap = Terrain.terrainData.GetAlphamaps(_texelPos.x, _texelPos.y, size, size);
                            _nAlphamapViewHandle = _alphamap.ViewAsNativeArray(out var nAlphamap);
                            _nBrushmaskViewHandle = _brushmask.ViewAsNativeArray(out var nBrushmask);

                            _nBrushingJobHandle = new ApplyPaintBrushParrallelJob() {
                                brushBase = _texelPos,
                                nAlphamap = nAlphamap,
                                brushmapPitch = size,
                                hardness = Hardness,
                                dt = DeltaTime,
                                angle = Angle,
                                brushSize = new float2(BrushWidth, BrushHeight),
                                nBrushmask = nBrushmask,
                                alphamapSliceIndex = PaintLayer,
                                depth = _alphamap.GetLength(2)
                            }
                            .Schedule(size * size * _alphamap.GetLength(2), BatchCount * BatchCount * _alphamap.GetLength(2));
                        }

                        _jobCompleted = false;
                    }

                    _lastMode = Mode;
                }
            }   // iterations

#if LOG_ENABLED
            _stopwatch.Stop();
            Debug.Log($"Brushing Time: {_stopwatch.ElapsedMilliseconds}ms");
            _stopwatch.Reset();
            _elaspedTime += _stopwatch.ElapsedMilliseconds;
#endif
        }

        private void LateUpdate() {
            // ________________________ Handling contols or inputs ___________________________//
            _erasing = Input.GetKey(KeyCode.Mouse1);
            _lastAngle = Angle;

            if (Input.GetKey(KeyCode.Mouse0)) {
                if (Mode == BrushMode.Spiral || Mode == BrushMode.Rings) {
                    if(_copiedOrignalRadius < 0) {
                        _copiedOrignalRadius = Radius;
                    }
                    Angle += DeltaTime * RotateSpeed;
                    Radius += DeltaTime * ExpendSpeed;
                } else if (Mode == BrushMode.Curvey) {
                    var mousePos = Input.mousePosition;
                    var delta = new Vector2(mousePos.x - _lastMousePosition.x, mousePos.y - _lastMousePosition.y);
                    if (delta.magnitude > (RotationStabelization)) {
                        // the new angle where to point the brush
                        _newAngle = Vector2.SignedAngle(Vector2.right, delta.normalized) - RaycastCamera.transform.eulerAngles.y;
                    }
                }
            }
            if(Input.GetKeyUp(KeyCode.Mouse0)) {
                if(Mode == BrushMode.Spiral || Mode == BrushMode.Rings) {
                    Radius = _copiedOrignalRadius;
                    Angle = 0;
                    _copiedOrignalRadius = -1;
                }
            }

            if (RotationControls) {
                if (Input.GetKey(KeyCode.W)) {
                    _newAngle += DeltaTime * RotateSpeed;
                } else if (Input.GetKey(KeyCode.Q)) {
                    _newAngle -= DeltaTime * RotateSpeed;
                }
            }

            if (Mode == BrushMode.Curvey || RotationControls) { 
                Angle = Mathf.LerpAngle(Angle, _newAngle, DeltaTime * RotateSpeed);
                _lastMousePosition = Input.mousePosition;
            }
            //_______________________________________________________________________________//

            RenderHologram();
        }

        private void RenderHologram() {
            if (_brushmaskTexture == null || _brushPreviewMesh == null)
                return;

            var ray = RaycastCamera.ScreenPointToRay(Input.mousePosition);

            // for spiral just have centre at the click position
            if((Mode == BrushMode.Spiral || Mode == BrushMode.Rings) &&
                AllowSpiralRingCursorLock) {
                if (Input.GetKeyDown(KeyCode.Mouse0)) {
                    if (Physics.Raycast(ray, out _hologramHit, RaycastCamera.farClipPlane, 1 << Terrain.gameObject.layer) == false)
                        return;
                    
                } else if (Input.GetKey(KeyCode.Mouse0) == false) {
                    // if the did not even started drawing
                    if (Physics.Raycast(ray, out _hologramHit, RaycastCamera.farClipPlane, 1 << Terrain.gameObject.layer) == false)
                        return;
                }
                
            } else {
                // if the did not even started drawing
                if (Physics.Raycast(ray, out _hologramHit, RaycastCamera.farClipPlane, 1 << Terrain.gameObject.layer) == false)
                    return;
            }

            // calculating a large square around brush rectangle to accomodate rotation.
            var realBrushSize = Convert.ToInt32(
                             Mathf.Sqrt(Mathf.Pow(BrushWidth, 2) + Mathf.Pow(BrushHeight, 2)));

            // converting click position in world space to texel space of the heightmap.
            var terrainPos = _hologramHit.point - Terrain.transform.position;
            if (Mode == BrushMode.Spiral) {
                var dir = new Vector3(Mathf.Cos(Angle * Mathf.Deg2Rad), 0, Mathf.Sin(Angle * Mathf.Deg2Rad));
                terrainPos += dir * Radius;
            }

            var uv = (terrainPos.x, terrainPos.z);
            uv = (uv.x / Terrain.terrainData.size.x, uv.z / Terrain.terrainData.size.z);

            var textureResolution = Mode == BrushMode.Paint ? _alphamapResolution : _heightmapResolution;
            if (Mode == BrushMode.Spiral) {
                uv = (uv.x - ((DotDiameter / (float)_heightmapResolution) * 0.5f), uv.z - ((DotDiameter / (float)_heightmapResolution) * 0.5f));
                //uvTexel = (uvTexel.x - (DotDiameter * 0.5f), uvTexel.z + (DotDiameter * 0.5f));
            } else {
                uv = (uv.x - ((realBrushSize / (float)textureResolution) * 0.5f), uv.z - ((realBrushSize / (float)textureResolution) * 0.5f));
            }
            (float x, float z) uvTexel = (uv.x * textureResolution, uv.z * textureResolution);
            var texelPos = new int2(Convert.ToInt32(uvTexel.x), Convert.ToInt32(uvTexel.z));
            // clamping in max bounds of heightmap.
            var size = Mode == BrushMode.Spiral ? DotDiameter : realBrushSize;

            if(HardwareAcceleration == false)
            {
                if (texelPos.x + size >= textureResolution)
                    texelPos.x += textureResolution - (texelPos.x + size);
                if (texelPos.y + size >= textureResolution)
                    texelPos.y += textureResolution - (texelPos.y + size);
                // Clamp the left side (x-axis)
                if (texelPos.x < 0) {
                    //size += _texelPos.x; // Reduce size to account for the left out-of-bounds portion
                    texelPos.x = 0;     // Clamp to the left edge
                }

                // Clamp the top side (y-axis)
                if (texelPos.y < 0) {
                    //size += _texelPos.y; // Reduce size to account for the top out-of-bounds portion
                    texelPos.y = 0;     // Clamp to the top edge
                }
                if (texelPos.x + size >= textureResolution)
                    size += textureResolution - (texelPos.x + size);
                if (texelPos.y + size >= textureResolution)
                    size += textureResolution - (texelPos.y + size);
            }

            // CRITICAL CODE:-
            if (HardwareAcceleration) {
                uv = (texelPos.x / (float)textureResolution, texelPos.y / (float)textureResolution);
            }
            var texelWorldPos = new Vector3(((texelPos.x + (size * 0.5f)) * Terrain.terrainData.size.x) / textureResolution, 0, ((texelPos.y + (size * 0.5f)) * Terrain.terrainData.size.z) / textureResolution);
            // **************************************************************** //  

            float normBrushWidth;
            float normBrushHeight;
            if (Mode != BrushMode.Spiral) {
                normBrushWidth = BrushWidth / (float)size;
                normBrushHeight = BrushHeight / (float)size;
            } else {
                normBrushWidth = DotDiameter / (float)size;
                normBrushHeight = normBrushWidth;
            }
            float normSize = size / (float)textureResolution;

            _brushPreviewMaterial.SetVector("_Box", new Vector4(uv.x, uv.z, normSize, Angle));
            _brushPreviewMaterial.SetTexture("_Mask", _brushmaskRescaleTexture);
            _brushPreviewMaterial.SetVector("_Brush", new Vector4(normBrushWidth, normBrushHeight, Terrain.terrainData.size.y, 0));
            _brushPreviewMaterial.SetTexture("_MainTex", Terrain.terrainData.heightmapTexture);

            Graphics.DrawMesh(_brushPreviewMesh, Matrix4x4.TRS(texelWorldPos, Quaternion.identity,
                new Vector3(size * (Terrain.terrainData.size.x / (float)textureResolution),
                1,
                size * (Terrain.terrainData.size.z / (float)textureResolution))), _brushPreviewMaterial, 1 << 1, RaycastCamera);
        }

        private void OnDestroy() {

            HardSyncJobs();

            _currentHeightCommand?.DestroyCommand();
            _currentAlphamapsCommand?.DestroyCommand();

#if TERRAIN_CHILDREN
            Terrain.terrainData.SyncHeightmap();
            Terrain.terrainData.SyncTexture(TerrainData.AlphamapTextureName);
            _dirtyHeightmap = false;
            _dirtyAlphamap = false;
#endif
            if (_maskPassRenderTexture != null)
                _maskPassRenderTexture.Release();

            if (_brushmaskRescaleTexture != null)
                _brushmaskRescaleTexture.Release();

            if (_heightmapTexture != null)
                _heightmapTexture.Release();

            if (_renderTexture != null)
                _renderTexture.Release();

            if (_currentHeightmapTexture != null)
                _currentHeightmapTexture.Release();

            if (_bilinearCurrentHeightmapTexture != null)
                _bilinearCurrentHeightmapTexture.Release();

            if (_splatmapTextures != null)
                Destroy(_splatmapTextures);

            if (_brushmaskTexture != null)
                Destroy(_brushmaskTexture);

            if (_splatRenderTexture != null)
                _splatRenderTexture.Release();
        }

        private void HardSyncJobs() {
            if (_jobCompleted == false) {
                _jobCompleted = true;

                _nBrushingJobHandle.Complete();

                if (_lastMode == BrushMode.Paint) {
                    _nAlphamapViewHandle.Dispose();
                } else {
                    _nBrushMapViewHandle.Dispose();
                    _nHeightMapViewHandle.Dispose();

                    if (_lastMode == BrushMode.Smooth) {
                        _nBrushmapCopy.Dispose();
                    }
                }
                _nBrushmaskViewHandle.Dispose();
            }
        }

        // Function to generate a grid mesh with fixed total width and height of 1
        public Mesh GenerateGrid(int resolution) {
            // Create a new mesh
            Mesh mesh = new Mesh();

            // Number of vertices (resolution+1 because we need a vertex at each corner)
            int vertexCount = (resolution + 1) * (resolution + 1);
            Vector3[] vertices = new Vector3[vertexCount];
            Vector2[] uvs = new Vector2[vertexCount];

            // Total size of the grid (width and height) will be 1, so each cell has a size of 1/resolution
            float cellSize = 1.0f / resolution; // Size of each cell in the grid

            // Calculate the offset to center the grid at (0, 0)
            float halfSize = 0.5f; // Since the total size is 1, half of it will be 0.5

            // Generate the vertices
            int index = 0;
            for (int y = 0; y <= resolution; y++) {
                for (int x = 0; x <= resolution; x++) {
                    // Calculate the position of the vertex, offset by half the grid size to center it
                    float xPos = (x * cellSize) - halfSize;
                    float zPos = (y * cellSize) - halfSize;

                    // Set the vertex position
                    vertices[index] = new Vector3(xPos, 0, zPos);

                    // UVs (mapping the grid to a unit square)
                    uvs[index] = new Vector2((float)x / resolution, (float)y / resolution);

                    index++;
                }
            }

            // Generate triangles
            int[] triangles = new int[resolution * resolution * 6];
            int triIndex = 0;
            for (int y = 0; y < resolution; y++) {
                for (int x = 0; x < resolution; x++) {
                    // Each quad is made up of two triangles
                    int topLeft = y * (resolution + 1) + x;
                    int topRight = y * (resolution + 1) + (x + 1);
                    int bottomLeft = (y + 1) * (resolution + 1) + x;
                    int bottomRight = (y + 1) * (resolution + 1) + (x + 1);

                    // First triangle (top-left, top-right, bottom-left)
                    triangles[triIndex++] = topLeft;
                    triangles[triIndex++] = bottomLeft;
                    triangles[triIndex++] = topRight;

                    // Second triangle (top-right, bottom-left, bottom-right)
                    triangles[triIndex++] = topRight;
                    triangles[triIndex++] = bottomLeft;
                    triangles[triIndex++] = bottomRight;
                }
            }

            // Assign vertices, triangles, and UVs to the mesh
            mesh.vertices = vertices;
            mesh.triangles = triangles;
            mesh.uv = uvs;

            return mesh;
        }

#if UNITY_EDITOR

        [ContextMenu(nameof(ForceSync))]
        private void ForceSync() {
            Terrain.terrainData.SyncHeightmap();
            _dirtyHeightmap = false;
        }

        private void OnDrawGizmos() {
            if (UnityEditor.EditorApplication.isPlaying == false)
                return;

            if (GizmosEnabled == false)
                return;

            if (Terrain == null || RaycastCamera == null)
                return;

            var originalColor = Gizmos.color;
            var originalMatrix = Gizmos.matrix;
            Gizmos.color = _erasing? Color.red : Color.green;

            var ray = RaycastCamera.ScreenPointToRay(Input.mousePosition);
            if (Physics.Raycast(ray, out RaycastHit hit, RaycastCamera.farClipPlane, 1 << Terrain.gameObject.layer) == false)
                return;

            var realBrushSize = Convert.ToInt32(
                             Mathf.Sqrt(Mathf.Pow(BrushWidth, 2) + Mathf.Pow(BrushHeight, 2)));

            var terrainPos = hit.point - Terrain.transform.position;
            if (Mode == BrushMode.Spiral) {
                var dir = new Vector3(Mathf.Cos(Angle * Mathf.Deg2Rad), 0, Mathf.Sin(Angle * Mathf.Deg2Rad));
                terrainPos += dir * Radius;
            }

            var uv = (terrainPos.x, terrainPos.z);
            uv = (uv.x / Terrain.terrainData.size.x, uv.z / Terrain.terrainData.size.z);
            (float x, float z) uvTexel = (uv.x * _heightmapResolution, uv.z * _heightmapResolution);
            if (Mode == BrushMode.Spiral) {
                uvTexel = (uvTexel.x - (DotDiameter * 0.5f), uvTexel.z + (DotDiameter * 0.5f));
            } else {
                uvTexel = (uvTexel.x - (realBrushSize * 0.5f), uvTexel.z - (realBrushSize * 0.5f));
            }
            var texelPos = new int2(Convert.ToInt32(uvTexel.x), Convert.ToInt32(uvTexel.z));
            terrainPos += Terrain.transform.position;

            var size = Mode == BrushMode.Spiral ? DotDiameter : realBrushSize;
            if (texelPos.x + size >= _heightmapResolution)
                texelPos.x += _heightmapResolution - (texelPos.x + size);
            if (texelPos.y + size >= _heightmapResolution)
                texelPos.y += _heightmapResolution - (texelPos.y + size);
            // Clamp the left side (x-axis)
            if (texelPos.x < 0)
            {
                //size += texelPos.x; // Reduce size to account for the left out-of-bounds portion
                texelPos.x = 0;     // Clamp to the left edge
            }

            // Clamp the top side (y-axis)
            if (texelPos.y < 0)
            {
                //size += texelPos.y; // Reduce size to account for the top out-of-bounds portion
                texelPos.y = 0;     // Clamp to the top edge
            }
            if (texelPos.x + size >= _heightmapResolution)
                size += _heightmapResolution - (texelPos.x + size);
            if (texelPos.y + size >= _heightmapResolution)
                size += _heightmapResolution - (texelPos.y + size);

            var texelWorldPos = new Vector3((texelPos.x * Terrain.terrainData.size.x) / _heightmapResolution, Mathf.Abs(Terrain.terrainData.GetHeight(texelPos.x, texelPos.y) - (Amplitude * 0.9f)),
                                                (texelPos.y * Terrain.terrainData.size.z) / _heightmapResolution);

            if (Mode == BrushMode.Spiral) {
                var rad = ((size * 0.5f) * ((Terrain.terrainData.size.z + Terrain.terrainData.size.x) * 0.5f)) / _heightmapResolution;
                texelWorldPos.x += rad;
                texelWorldPos.y += rad;
                Gizmos.DrawSphere(texelWorldPos, rad);
            } else {
                var boxSize = new Vector3((size * ((Terrain.terrainData.size.z + Terrain.terrainData.size.x) * 0.5f)) / _heightmapResolution,
                                       1,
                                       (size * ((Terrain.terrainData.size.z + Terrain.terrainData.size.x) * 0.5f)) / _heightmapResolution);
                texelWorldPos.x += boxSize.x * 0.5f;
                texelWorldPos.z += boxSize.z * 0.5f;

                var brushSize = new Vector2(BrushWidth, BrushHeight);
                if (new Vector2(size, size).magnitude < brushSize.magnitude) {
                    brushSize.x = size;
                    brushSize.y = size;
                }

                boxSize = new Vector3((brushSize.x * ((Terrain.terrainData.size.z + Terrain.terrainData.size.x) * 0.5f)) / _heightmapResolution,
                                  Amplitude,
                                  (brushSize.y * ((Terrain.terrainData.size.z + Terrain.terrainData.size.x) * 0.5f)) / _heightmapResolution);

                Gizmos.matrix = Matrix4x4.TRS(texelWorldPos, Quaternion.Euler(0, -Angle, 0), boxSize);
                Gizmos.DrawCube(Vector3.zero, Vector3.one);
            }

            Gizmos.color = originalColor;
            Gizmos.matrix = originalMatrix;
        }
#endif
        #endregion

        #region API
        public struct DataSets
        {
            public BrushmasksSet brushmasksSet;
            public TerrainLayersSet terrainLayersSet;
        }
        public struct References
        {
            public Terrain terrain;
            public Camera raycastCamera;
            public TerrainLayersSet layersSet;
            public BrushmasksSet brushmasksSet;
        }
        public struct MutationData
        {
            public BrushMode mode;

            public int brushWidth;
            public int brushHeight;
            public float hardness;
            public float angle;

            public int brushIndex;

            public float frequency;
            public float amplitude;

            public int dotDiamter;
            public float radius;
            public float expendSpeed;
            public float rotateSpeed;

            public int paintLayerIndex;

            public float flattenHeight;

            public bool rotationControls;
        }

        public static UnityEvent<TerrainPloughTool, Terrain> OnTerrainCreated;

        public static TerrainPloughTool Setup(TerrainLayersSet layers, BrushmasksSet brushes, Camera camera, Terrain terrain, int size = 32, int maxHeight = 8, int heightmapResolution = 9, int alphamapResolution = 9) {

            // setting terrain detail
            var terrainData = new TerrainData();
            terrainData.enableHolesTextureCompression = false;
            terrainData.heightmapResolution = (int)Mathf.Pow(2, heightmapResolution) + 1;
            terrainData.alphamapResolution = (int)Mathf.Pow(2, alphamapResolution);

            // assigning new terrain data
            terrain.terrainData = terrainData;
            terrain.GetComponent<TerrainCollider>().terrainData = terrainData;

            terrainData.size = new Vector3(size, maxHeight, size);

            // adding plough tool
            var ploughToolObj = new GameObject("Terrain Plough Tool");
            ploughToolObj.transform.SetParent(terrain.transform);
            var ploughTool = ploughToolObj.AddComponent<TerrainPloughTool>();

            // setting plough tool
            ploughTool.SetReferences(new References {
                brushmasksSet = brushes,
                layersSet = layers,
                raycastCamera = camera,
                terrain = terrain
            });

            OnTerrainCreated?.Invoke(ploughTool, terrain);

            return ploughTool;
        }

        public DataSets GetDataCollections()
        {
            Debug.Assert(Brushes != null);
            Debug.Assert(TerrainLayers != null);

            return new DataSets()
            {
                brushmasksSet = Brushes,
                terrainLayersSet = TerrainLayers
            };
        }
        public void SetReferences(References references) {
            Debug.Assert(Terrain        == null, $"{name}:{nameof(TerrainPloughTool)}, variable {nameof(Terrain)} is already assigned.");
            Debug.Assert(RaycastCamera  == null, $"{name}:{nameof(TerrainPloughTool)}, variable {nameof(RaycastCamera)} is already assigned.");
            Debug.Assert(TerrainLayers  == null, $"{name}:{nameof(TerrainLayersSet)}, variable {nameof(TerrainLayers)} is already assigned.");
            Debug.Assert(Brushes        == null, $"{name}:{nameof(BrushmasksSet)}, variable {nameof(Brushes)} is already assigned.");

            Terrain = references.terrain;
            RaycastCamera = references.raycastCamera;
            TerrainLayers = references.layersSet;
            Brushes = references.brushmasksSet;
        }

        public void Mutate(MutationData data)
        {
            Mode = data.mode;
            BrushWidth = Mathf.Max(data.brushWidth, 1);
            BrushHeight = Mathf.Max(data.brushHeight, 1);
            Hardness = Mathf.Max(data.hardness, 1);
            Angle = data.angle;

            ActiveBrushIndex = data.brushIndex;

            Frequency = data.frequency % 2 == 0? data.frequency + 1 : data.frequency;
            Amplitude = Mathf.Max(data.amplitude, 0.001f);

            DotDiameter = Mathf.Max(data.dotDiamter, 1);
            Radius = Mathf.Max(data.radius, 0.05f);
            ExpendSpeed = Mathf.Max(data.expendSpeed, 0.05f);
            RotateSpeed = Mathf.Max(data.rotateSpeed, 0.1f);

            PaintLayer = data.paintLayerIndex;

            FlattenHeight = Mathf.Max(data.flattenHeight, 0);

            RotationControls = data.rotationControls;
        }
        public MutationData GetCurrentState() {

            var data = new MutationData();

            data.mode = Mode;
            data.brushWidth = BrushWidth;
            data.brushHeight = BrushHeight;
            data.hardness = Hardness;
            data.angle = Angle;

            data.brushIndex = ActiveBrushIndex;

            data.frequency = Frequency;
            data.amplitude = Amplitude;

            data.dotDiamter = DotDiameter;
            data.radius = Radius;
            data.expendSpeed = ExpendSpeed;
            data.rotateSpeed = RotateSpeed;

            data.paintLayerIndex = PaintLayer;

            data.flattenHeight = FlattenHeight;

            data.rotationControls = RotationControls;

            return data;

        }

        public void Save(string fileName) {
            Debug.Assert(fileName != null);

            // hard sync if the sync mode is none
            Terrain.terrainData.SyncHeightmap();
            Terrain.terrainData.SyncTexture(TerrainData.AlphamapTextureName);

            _saveLoadSystem.Save(Terrain, fileName);
        }
        public void Load(string fileName) {

            HardSyncJobs();

            Terrain.terrainData.SyncHeightmap();
            Terrain.terrainData.SyncTexture(TerrainData.AlphamapTextureName);
            _dirtyHeightmap = false;
            _dirtyAlphamap = false;

            _currentHeightCommand?.DestroyCommand();
            _currentAlphamapsCommand?.DestroyCommand();

            // for pattern time eraser to work.
            if (_heightmapTexture != null) {
                _heightmapTexture.Release();
                _heightmapTexture = null;
            }
            if (_heightmap != null)
                _heightmap = null;

            _saveLoadSystem.Load(fileName, Terrain);
        }
        public string[] QuerySaveFiles() {
            return _saveLoadSystem.QuerySaves();
        }
        #endregion

        [System.AttributeUsage(System.AttributeTargets.All, Inherited = false, AllowMultiple = false)]
        public sealed class DebugInfoAttribute : Attribute {}
    }
}

#pragma warning restore CS0162