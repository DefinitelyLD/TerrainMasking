/*
	* Name: TerrainPloughTool.cs
	* Author: Madasir Ali / Upwork / Fiverr
*/


using System.Collections.Generic;
using System.Linq;
using UnityEngine;

namespace TerrainPloughTools
{
    [CreateAssetMenu(fileName = "New Brushmasks Set", menuName = "Create New Brushmasks Set")]
    public sealed class BrushmasksSet : ScriptableSet
    {
        public Texture2D[] Masks;

        public override IEnumerable<T> GetEnumerable<T>() {
            return (IEnumerable<T>)Masks.AsEnumerable();
        }
    }
}