using UnityEngine;

namespace TerrainPloughTools
{
    internal static class TextureExtensions
    {
        public static bool CheckSize(this Texture texture, Vector2Int target)
        {
            return texture.width == target.x && texture.height == target.y;
        }
        public static bool CheckSize(this Texture texture, int width, int height)
        {
            return texture.width == width && texture.height == height;
        }
    }
}