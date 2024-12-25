using Unity.Jobs;
using Unity.Burst;
using Unity.Mathematics;
using Unity.Collections;
using System.Runtime.CompilerServices;

namespace TerrainPloughTools
{
    /// <summary>
    /// Job for modifing terrain heightmap that is under brush map or region in parrallel small patches. It reads the original height map as base height
    /// and the portion of heightmap under brush (brushmap) to calculate new height and saves it to the brush's portion (heightmap brush porition or brush map).
    /// </summary>
    [BurstCompile(FloatPrecision.Low, FloatMode.Fast, OptimizeFor = OptimizeFor.Performance)]
    internal struct ApplySpiralBrushParrallelJob : IJobParallelFor
    {
        /// <summary>
        /// Original heightmap or base.
        /// </summary>
        [ReadOnly]
        public NativeArray<float> nHeightMap;
        /// <summary>
        /// Heightmap region under brush or simply brushmap.
        /// </summary>
        public NativeArray<float> nBrushMap;
        /// <summary>
        /// The offset of brushmap in heightmap.
        /// </summary>
        [ReadOnly]
        public int2 brushBase;
        /// <summary>
        /// Length of the row of the brush map, i.e l * l = brushmap area.
        /// </summary>
        [ReadOnly]
        public int brushmapPitch;
        /// <summary>
        /// The max height in world position, without base height.
        /// </summary>
        [ReadOnly]
        public float amplitude;
        /// <summary>
        /// The length of the row of heightmap, i.e l * l = heightmap area.
        /// </summary>
        [ReadOnly]
        public int heightmapPitch;
        /// <summary>
        /// The high the value the fast the point in map will reach its max amplitude or altitude or height.
        /// </summary>
        [ReadOnly]
        public float hardness;
        /// <summary>
        /// Tick rate of the brush.
        /// </summary>
        [ReadOnly]
        public float dt;
        /// <summary>
        /// Whether brush is in erasing mode.
        /// </summary>
        [ReadOnly]
        public bool erasing;

        /// <summary>
        /// Per pixel or texel call, of the brushmap.
        /// </summary>
        /// <param name="index">Current texel index</param>
        public void Execute(int index) {
            // converting 1D index to 2D indexes.
            int x = index % brushmapPitch;
            int y = index / brushmapPitch;

            // tranlating origin to the centre
            float2 pin = new(x - (brushmapPitch * 0.5f), y - (brushmapPitch * 0.5f));
            var mag = math.sqrt(math.pow(pin.x, 2) + math.pow(pin.y, 2));

            // if it lies in dot radius.
            if (mag > brushmapPitch * 0.5f)
                return;

            // 0 to 1 value to samples, i.e to most left to most right,
            var norm = 1f - (mag / (brushmapPitch * 0.5f));
            // the new height to set
            var height = amplitude * (math.sqrt(norm));
            // original heightmap height, its the minimum height to have, like can't deform it more than that.
            float baseHeight = nHeightMap[((y + brushBase.y) * heightmapPitch) + (x + brushBase.x)];
            // current height under brush map.
            float currentHeight = nBrushMap[(y * brushmapPitch) + x] - baseHeight;

            // do not degrade the already applied high position, else it will add height, then on next step remove height
            if (currentHeight >= height)
                return;

            // apply or set the new height.
            if (erasing == false) {
                nBrushMap[(y * brushmapPitch) + x] = math.lerp(currentHeight, height, hardness * dt) + baseHeight;
            }
            else {
                // moving height towards saved height
                nBrushMap[(y * brushmapPitch) + x] = math.lerp(currentHeight + baseHeight, baseHeight, hardness * dt * 2f);
            }
        }
    }
}