/*
	* Name: TerrainPloughTool.cs
	* Author: Madasir Ali / Upwork / Fiverr
	
*/

using UnityEngine;
using UnityEngine.UI;

namespace TerrainPloughTools
{
    internal sealed class SpiralPanelUI : ModeUIPanel
    {
        [Header("References:")]
        [SerializeField]
        private Slider DotDiameter;
        [SerializeField]
        private Slider Amplitude;
        [SerializeField]
        private Slider Hardness;
        [SerializeField]
        private Slider RotationSpeed;
        [SerializeField]
        private Slider ExpendSpeed;

        public override BrushMode Mode => BrushMode.Spiral;

        public override void Initialize(TerrainPloughTool ploughTool)
        {
            base.Initialize(ploughTool);
        }

        public override void Set(ref TerrainPloughTool.MutationData data, TerrainPloughTool.MutationData state) {

            data = state;

            data.hardness = Hardness.value;
            data.dotDiamter = (int)DotDiameter.value;
            data.expendSpeed = ExpendSpeed.value;
            data.rotateSpeed = RotationSpeed.value;
            data.amplitude= Amplitude.value;


            DotDiameter.value = data.dotDiamter;
        }
    }
}