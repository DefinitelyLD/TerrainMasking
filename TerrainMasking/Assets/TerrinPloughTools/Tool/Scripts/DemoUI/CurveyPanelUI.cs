/*
	* Name: TerrainPloughTool.cs
	* Author: Madasir Ali / Upwork / Fiverr
	
*/

using UnityEngine;
using UnityEngine.UI;

namespace TerrainPloughTools
{
    internal sealed class CurveyPanelUI : ModeUIPanel
    {
        [Header("References:")]
        [SerializeField]
        private InputField BrushWidth;
        [SerializeField]
        private InputField BrushHeight;
        [SerializeField]
        private Slider RotateSpeed;
        [SerializeField]
        private Slider Hardness;
        [SerializeField]
        private Slider Frequency;
        [SerializeField]
        private Slider Amplitude;
        [SerializeField]
        private SelectionGrid BrushSelection;

        public override BrushMode Mode => BrushMode.Curvey;

        public override void Initialize(TerrainPloughTool ploughTool)
        {
            base.Initialize(ploughTool);

            var data = ploughTool.GetDataCollections();
            BrushSelection.SetReferences(new SelectionGrid.References()
            {
                textures = data.brushmasksSet
            });
        }

        public override void Set(ref TerrainPloughTool.MutationData data, TerrainPloughTool.MutationData state)
        {

            data = state;

            data.amplitude = Amplitude.value;
            data.frequency = Frequency.value;
            data.brushIndex = BrushSelection.SelectedIndex;
            data.hardness = Hardness.value;
            data.rotateSpeed = RotateSpeed.value;

            int width;
            int height;

            if (int.TryParse(BrushWidth.text, out width) == false)
                width = 32;
            if (int.TryParse(BrushHeight.text, out height) == false)
                height = 32;


            data.brushWidth = width;
            data.brushHeight = height;
        }
    }
}