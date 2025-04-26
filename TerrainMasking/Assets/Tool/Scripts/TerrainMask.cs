
using UnityEngine;

namespace TerrainPloughTools {

    [RequireComponent(typeof(Terrain))]
    public sealed class TerrainMask : MonoBehaviour {

        [Header("References:")]
        [Tooltip("The mask to apply on terrin.")]
        [SerializeField]
        private Texture2D Mask;

        private RenderTexture _resizeRenderTexture;
        private Texture2D _resizedMaskTexture;

        // Start is called once before the first execution of Update after the MonoBehaviour is created
        void Start() {
            var terrain = GetComponent<Terrain>();
            int resolution = terrain.terrainData.holesResolution;

            _resizeRenderTexture = new RenderTexture(resolution, resolution, 0, terrain.terrainData.holesTexture.graphicsFormat);
            _resizedMaskTexture = new Texture2D(resolution, resolution, TextureFormat.RGBA32, false);

            // Resize and copy Mask to Texture
            Graphics.Blit(Mask, _resizeRenderTexture);
            RenderTexture.active = _resizeRenderTexture;
            _resizedMaskTexture.ReadPixels(new Rect(0, 0, resolution, resolution), 0, 0);
            _resizedMaskTexture.Apply();
            RenderTexture.active = null;

            // Generate holes from Texture
            var holes = new bool[resolution, resolution];
            for (var i = 0; i < resolution; i++) {
                for (var j = 0; j < resolution; j++) {
                    var pixel = _resizedMaskTexture.GetPixel(i, j);
                    holes[j, i] = pixel.r > 0.5f; // Adjust threshold as needed
                }
            }

            terrain.terrainData.SetHoles(0, 0, holes);
        }
        private void OnDestroy() {
            if (_resizeRenderTexture != null) {

                _resizeRenderTexture.Release();
                Destroy(_resizeRenderTexture);
                _resizeRenderTexture = null;
            }
            if (_resizedMaskTexture != null) {
                Destroy(_resizedMaskTexture);
                _resizedMaskTexture = null;
            }
        }

        public struct References {
            public Texture2D maskTexture;
        }
        public void SetReferences(References references) {
            Debug.Assert(Mask == null, $"{nameof(Mask)} is already assigned.");
            Debug.Assert(references.maskTexture != null);

            Mask = references.maskTexture;
        }
    }
}