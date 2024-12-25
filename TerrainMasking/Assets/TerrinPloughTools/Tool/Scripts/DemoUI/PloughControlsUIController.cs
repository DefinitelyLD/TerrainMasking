/*
	* Name: TerrainPloughTool.cs
	* Author: Madasir Ali / Upwork / Fiverr
	
*/

using Commands;
using UnityEngine;
using UnityEngine.UI;

namespace TerrainPloughTools
{
    internal sealed class PloughControlsUIController : MonoBehaviour
    {
        [Header("Elements:")]
        [SerializeField]
        private Dropdown Dropdown;

        [SerializeField]
        private Button UndoButton;
        [SerializeField]
        private Button RedoButton;

        [SerializeField]
        private ModeUIPanel[] Panels;

        [SerializeField]
        private InputField SaveFileName;
        [SerializeField]
        private Button SaveButton;

        [SerializeField]
        private LoadViewUI LoadView;

        [Header("References:")]
        [SerializeField]
        private TerrainPloughTool PloughTool;

        private BrushMode _activeMode;

        private void Start()
        {
            foreach (var panel in Panels)
                panel.Initialize(PloughTool);

            SaveButton.onClick.AddListener(() => {
                PloughTool.Save(SaveFileName.text);
                LoadView.DisplaySaves(PloughTool);
            });
            LoadView.DisplaySaves(PloughTool);

            void TogglePannel(BrushMode mode)
            {
                foreach (var panel in Panels)
                {
                    if (panel.Mode == mode)
                    {
                        panel.Toggle(true);
                    }
                    else
                    {
                        panel.Toggle(false);
                    }
                }
            }

            TogglePannel(0);

            _activeMode = (BrushMode)Dropdown.value;
            Dropdown.onValueChanged.AddListener(index =>
            {
                TogglePannel((BrushMode)index);
                _activeMode = (BrushMode)Dropdown.value;
            });

            UndoButton.onClick.AddListener(() => {
                CommandHistory.Undo();
            });

            RedoButton.onClick.AddListener(() => {
                CommandHistory.Redo();
            });
        }

        private void LateUpdate()
        {
            TerrainPloughTool.MutationData data = new TerrainPloughTool.MutationData();
            foreach(var panel in Panels)
            {
                if (panel.gameObject.activeInHierarchy == false)
                    continue;

                panel.Set(ref data, PloughTool.GetCurrentState());
            }

            data.mode = _activeMode;

            PloughTool.Mutate(data);
        }

        public struct References
        {
            public TerrainPloughTool ploughTool;
        }
        public void SetReferences(References references)
        {
            Debug.Assert(PloughTool == null, "Plough Tool is already assigned.");
            PloughTool = references.ploughTool;
        }
    }
}