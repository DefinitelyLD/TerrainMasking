/*
	* Name: TerrainPloughTool.cs
	* Author: Madasir Ali / Upwork / Fiverr
	
*/

using UnityEngine;

namespace TerrainPloughTools
{
    internal sealed class LoadViewUI : MonoBehaviour {
        [Header("Elements:")]
        [SerializeField]
        private Transform Root;
        [SerializeField]
        private LoadSaveViewTemplate SaveTemplate;

        public void DisplaySaves(TerrainPloughTool ploughTool) {
            var saves = ploughTool.QuerySaveFiles();

            SaveTemplate.gameObject.SetActive(true);
            foreach (Transform child in Root)
                if(child.transform != SaveTemplate.transform)
                    Destroy(child.gameObject);

            foreach (var file in saves) {
                var viewObj = Instantiate(SaveTemplate.gameObject, Root);
                var view = viewObj.GetComponent<LoadSaveViewTemplate>();

                view.Set(file, () => {
                    ploughTool.Load(file);
                    DisplaySaves(ploughTool);
                });
            }

            SaveTemplate.gameObject.SetActive(false);
        }
    }
}