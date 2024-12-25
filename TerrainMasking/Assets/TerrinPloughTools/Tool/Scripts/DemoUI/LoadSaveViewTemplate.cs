/*
	* Name: TerrainPloughTool.cs
	* Author: Madasir Ali / Upwork / Fiverr
	
*/

using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;

namespace TerrainPloughTools
{
    internal sealed class LoadSaveViewTemplate : MonoBehaviour{
        [Header("Elements:")]
        [SerializeField]
        private Button Button;
        [SerializeField]
        private Text Text;

        public void Set(string text, UnityAction onClick) {
            Button.onClick.AddListener(onClick);
            Text.text = text;
        }
    }
}