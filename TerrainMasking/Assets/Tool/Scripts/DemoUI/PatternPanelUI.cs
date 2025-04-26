/*
	* Name: TerrainPloughTool.cs
	* Author: Madasir Ali / Upwork / Fiverr
	
*/

using UnityEngine;
using UnityEngine.UI;

namespace TerrainPloughTools
{

    internal sealed class PatternPanelUI : ModeUIPanel
    {
        [Header("References:")]
        [SerializeField]
        private InputField BrushWidth;
        [SerializeField]
        private InputField BrushHeight;
        [SerializeField]
        private Slider Angle;
        [SerializeField]
        private Slider Hardness;
        [SerializeField]
        private Slider Frequency;
        [SerializeField]
        private Slider Amplitude;
        [SerializeField]
        private SelectionGrid BrushSelection;

        public override BrushMode Mode => BrushMode.Lines;

        public override void Initialize(TerrainPloughTool ploughTool)
        {
            base.Initialize(ploughTool);

            var data = ploughTool.GetDataCollections();
            BrushSelection.SetReferences(new SelectionGrid.References()
            {
                textures = data.brushmasksSet
            });
        }

        public override void Set(ref TerrainPloughTool.MutationData data, TerrainPloughTool.MutationData state) {
            data.amplitude = Amplitude.value;
            data.frequency = Frequency.value;
            data.brushIndex = BrushSelection.SelectedIndex;
            data.hardness = Hardness.value;
            data.angle = 360f - Angle.value;

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