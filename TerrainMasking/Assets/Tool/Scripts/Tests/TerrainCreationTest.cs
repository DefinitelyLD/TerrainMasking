/*
	* Name: TerrainCreationTest.cs
	* Description: Tests the terrain creation.
	* Auther: Madasir Ali - Upwork / Fiverr
*/

using TerrainPloughTools;
using UnityEngine;

public class TerrainCreationTest : MonoBehaviour
{
    public TerrainPloughTools.BrushmasksSet Brushes;
    public TerrainPloughTools.TerrainLayersSet Layers;

    public GameObject UIController;
    public Camera Camera;
    public Terrain Template;
    public Texture2D Mask;
    public int Size = 36;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        var ploughTool = TerrainPloughTools.TerrainPloughTool.Setup(Layers, Brushes, Camera, Template, Size);

        // instantiating ui prefab
        var uiObj = Instantiate(UIController, ploughTool.transform.parent);

        // creating UI, this can be your UI. and this code is to fail as 'PloughControlsUIController' is internal to demonstrate the UI is be external.
        var uiController = uiObj.GetComponent<TerrainPloughTools.PloughControlsUIController>();
        uiController.SetReferences(new TerrainPloughTools.PloughControlsUIController.References()
        {
            ploughTool = ploughTool
        });

        var terrainMask = Template.transform.gameObject.AddComponent<TerrainMask>();
        terrainMask.SetReferences(new TerrainMask.References() {
            maskTexture = Mask
        });

        print("Terrain Created and set up !");
    }
}
