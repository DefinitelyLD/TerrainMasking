/*
	* Name: TerrainPloughTool.cs
	* Author: Madasir Ali / Upwork / Fiverr
	
*/

using UnityEngine;

namespace TerrainPloughTools
{
    internal abstract class ModeUIPanel : MonoBehaviour
    {
        public abstract BrushMode Mode { get; }

        public virtual void Initialize(TerrainPloughTool ploughTool) { }

        public void Toggle(bool value)
        {
            gameObject.SetActive(value);
        }
        public abstract void Set(ref TerrainPloughTool.MutationData data, TerrainPloughTool.MutationData state);
    }
}