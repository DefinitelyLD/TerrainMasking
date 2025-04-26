/*
	* Name: TerrainPloughTool.cs
	* Author: Madasir Ali / Upwork / Fiverr
	
*/

using UnityEngine;
using UnityEngine.UI;

namespace TerrainPloughTools
{
    [RequireComponent(typeof(GridLayoutGroup))]
    internal sealed class SelectionGrid : MonoBehaviour
    {
        [Header("Data:")]
        [SerializeField]
        private ScriptableSet Textures;

        public int SelectedIndex { get; private set; }

        public struct References
        {
            public ScriptableSet textures;
        }
        public void SetReferences(References references)
        {
            Debug.Assert(Textures == null, "Textures are already assigned.");

            Textures = references.textures;
        }

        private void Start()
        {
            Refresh();
        }

        public void Refresh() {
            foreach(var texture in Textures.GetEnumerable<Texture2D>()) {
                var buttonObj = new GameObject(transform.childCount.ToString());
                buttonObj.transform.parent = transform;

                var button = buttonObj.AddComponent<Button>();
                var image = buttonObj.AddComponent<Image>();
                button.targetGraphic = image;
                button.image.sprite = Sprite.Create(texture, new Rect(0, 0, texture.width, texture.height),
                    new Vector2(texture.width * 0.5f, texture.height * 0.5f));
                button.onClick.AddListener(() => {
                    SelectedIndex = int.Parse(button.name);
                });
            }
        }
    }
}