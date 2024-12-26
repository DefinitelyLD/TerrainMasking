
using UnityEngine;

public class TerrainMaskTest : MonoBehaviour
{
    public Texture2D Mask;

    public Terrain Terrain;

    private RenderTexture ResizeMask;
    public Texture2D Texture;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start() {
        int resolution = Terrain.terrainData.holesResolution;
        ResizeMask = new RenderTexture(resolution, resolution, 0, Terrain.terrainData.holesTexture.graphicsFormat);
        Texture = new Texture2D(resolution, resolution, TextureFormat.RGBA32, false);

        // Resize and copy Mask to Texture
        Graphics.Blit(Mask, ResizeMask);
        RenderTexture.active = ResizeMask;
        Texture.ReadPixels(new Rect(0, 0, resolution, resolution), 0, 0);
        Texture.Apply();
        RenderTexture.active = null;

        // Generate holes from Texture
        var holes = new bool[resolution, resolution];
        for (var i = 0; i < resolution; i++) {
            for (var j = 0; j < resolution; j++) {
                var pixel = Texture.GetPixel(i, j);
                holes[j, i] = pixel.r > 0.5f; // Adjust threshold as needed
            }
        }

        Terrain.terrainData.SetHoles(0, 0, holes);
    }
    private void OnDestroy() {
        if (ResizeMask != null) {

            ResizeMask.Release();
            Destroy(ResizeMask);
            ResizeMask = null;
        }
        if (Texture != null) {
            Destroy(Texture);
            Texture = null;
        }
    }
}
