/*
	* Name: TerrainPloughTool.cs
	* Author: Madasir Ali / Upwork / Fiverr
*/

using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace TerrainPloughTools
{
    [CreateAssetMenu(fileName ="New Terrain Layers Set", menuName ="Create Terrain Layers Set")]
    public sealed class TerrainLayersSet : ScriptableSet
    {
        public TerrainLayer[] Layers;

        public override IEnumerable<T> GetEnumerable<T>() {
            var textures = new Texture2D[Layers.Length];
            for(var i = 0; i < Layers.Length; i++) {
                textures[i] = Layers[i].diffuseTexture;
            }

            return (IEnumerable<T>)textures.AsEnumerable();
        }
    }
}