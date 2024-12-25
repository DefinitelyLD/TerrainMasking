/*
	* Name: TerrainPloughTool.cs
	* Author: Madasir Ali / Upwork / Fiverr
*/

using System.Collections.Generic;
using UnityEngine;


namespace TerrainPloughTools
{
    public abstract class ScriptableSet : ScriptableObject {
        public abstract IEnumerable<T> GetEnumerable<T>();
    }
}