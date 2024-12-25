using Unity.Jobs;
using Unity.Burst;
using Unity.Mathematics;
using Unity.Collections;
using System.Runtime.CompilerServices;

namespace TerrainPloughTools
{
    /// <summary>
    /// </summary>
    [BurstCompile(FloatPrecision.Low, FloatMode.Fast, OptimizeFor = OptimizeFor.Performance)]
    internal struct ApplyLowerBrushParrallelJob : IJobParallelFor
    {
        /// <summary>
        /// Heightmap region under brush or simply brushmap.
        /// </summary>
        public NativeArray<float> nBrushMap;
        [ReadOnly]
        public NativeArray<byte> nBrushmask;
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
        /// Width and height of the brush in texel space.
        /// </summary>
        [ReadOnly]
        public float2 brushSize;
        /// <summary>
        /// Current angle of the brush in degrees.
        /// </summary>
        [ReadOnly]
        public float angle;
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
        /// Call per pixel or per texel of the brushmap.
        /// </summary>
        /// <param name="index">Current index of the texel.</param>
        public void Execute(int index) {
            // converting 1D index to 2D indexes.
            int x = index % brushmapPitch;
            int y = index / brushmapPitch;

            // tranlating origin to the centre
            float2 pin = new(x - (brushmapPitch * 0.5f), y - (brushmapPitch * 0.5f));

            // checking if it lies between the brush rectangle or area, (the brush map will be slighly larger in area then the actual brush to allow rotation)
            if (IsPointInsideRotatedRectangle(pin, float2.zero, brushSize, angle) == false)
                return;

            // removing the current rotation or angle, on the texel.
            var mag = math.sqrt(math.pow(pin.x, 2) + math.pow(pin.y, 2));
            var theta = math.atan2(pin.y, pin.x) - (angle * math.TORADIANS);
            // texels at 0 degree rotation, and translating origin back to top left.
            int newX = (int)(mag * math.cos(theta) + (brushSize.x * 0.5f));
            int newY = (int)(mag * math.sin(theta) + (brushSize.y * 0.5f));

            float currentHeight = nBrushMap[(y * brushmapPitch) + x];

            var maskIndex = ((newY * (int)brushSize.x) + newX);
            float mask = 1;
            if (maskIndex < nBrushmask.Length) {
                mask = (nBrushmask[maskIndex] / 255f);
            }

            // apply the new calculated height
            nBrushMap[(y * brushmapPitch) + x] = math.lerp(currentHeight, currentHeight - (hardness * dt), hardness * dt * mask);
        }

        // Check if a point is inside a rotated rectangle
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private readonly unsafe bool IsPointInsideRotatedRectangle(float2 point, float2 rectangleCenter, float2 size, float rotationAngle) {
            // Half the width and height of the rectangle
            float halfWidth = size.x * 0.5f;
            float halfHeight = size.y * 0.5f;

            // Vertices of the rectangle (axis-aligned first)
            var vertices = stackalloc float2[4] {
                new float2(-halfWidth, -halfHeight), // Bottom-left
                new float2(halfWidth, -halfHeight),  // Bottom-right
                new float2(halfWidth, halfHeight),   // Top-right
                new float2(-halfWidth, halfHeight)   // Top-left
            };

            // Rotate and translate each vertex to the center of the rectangle
            // Rotate the vertex
            float rad = math.TORADIANS * rotationAngle;
            float cos = math.cos(rad);
            float sin = math.sin(rad);
            float x = vertices[0].x * cos - vertices[0].y * sin;
            float y = vertices[0].x * sin + vertices[0].y * cos;

            // Translate the vertex to the center of the rectangle
            vertices[0] = new float2(x, y) + rectangleCenter;

            rad = math.TORADIANS * rotationAngle;
            cos = math.cos(rad);
            sin = math.sin(rad);
            x = vertices[1].x * cos - vertices[1].y * sin;
            y = vertices[1].x * sin + vertices[1].y * cos;
            vertices[1] = new float2(x, y) + rectangleCenter;

            rad = math.TORADIANS * rotationAngle;
            cos = math.cos(rad);
            sin = math.sin(rad);
            x = vertices[2].x * cos - vertices[2].y * sin;
            y = vertices[2].x * sin + vertices[2].y * cos;
            vertices[2] = new float2(x, y) + rectangleCenter;

            rad = math.TORADIANS * rotationAngle;
            cos = math.cos(rad);
            sin = math.sin(rad);
            x = vertices[3].x * cos - vertices[3].y * sin;
            y = vertices[3].x * sin + vertices[3].y * cos;
            vertices[3] = new float2(x, y) + rectangleCenter;

            // Use the ray-casting algorithm to check if the point is inside the rotated rectangle
            return IsPointInPolygon(vertices, point);

            // Local function: Ray-casting algorithm to check if point is inside a polygon (cross product method)
            [MethodImpl(MethodImplOptions.AggressiveInlining)]
            bool IsPointInPolygon(float2* vertices, float2 point) {
                int n = 4;
                bool inside = false;

                for (int i = 0, j = n - 1; i < n; j = i++) {
                    // Cross product (edge direction check)
                    if (((vertices[i].y > point.y) != (vertices[j].y > point.y)) &&
                        (point.x < (vertices[j].x - vertices[i].x) * (point.y - vertices[i].y) / (vertices[j].y - vertices[i].y) + vertices[i].x)) {
                        inside = !inside;
                    }
                }

                return inside;
            }
        }
    }
}