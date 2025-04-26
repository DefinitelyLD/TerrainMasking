using UnityEngine;

namespace Commands.AllCommands.TerrainCommands
{   
    public class ModifyHeightsCommand : ICommand
    {
        private class TerrainHeightsState
        {
            public TerrainData Data;
            public RenderTexture Heightmap;
        } 

        private readonly TerrainHeightsState _startState;
        private TerrainHeightsState _endState;

        public ModifyHeightsCommand(TerrainData data)
        {
            _startState = new TerrainHeightsState()
            {
                Data = data,
                Heightmap = new RenderTexture(data.heightmapResolution, data.heightmapResolution, 0, data.heightmapTexture.format, RenderTextureReadWrite.Linear)
            };

            Graphics.CopyTexture(data.heightmapTexture, _startState.Heightmap);
        }

        public void Complete(TerrainData data)
        {
            _endState = new TerrainHeightsState(){
                Data = data,
                Heightmap = new RenderTexture(data.heightmapResolution, data.heightmapResolution, 0, data.heightmapTexture.format, RenderTextureReadWrite.Linear)
            };

            Graphics.CopyTexture(data.heightmapTexture, _endState.Heightmap);
        }

        public void Execute()
        {
            var originalRenderTexture = RenderTexture.active;
            RenderTexture.active = _endState.Heightmap;

            _endState.Data.CopyActiveRenderTextureToHeightmap(new RectInt(0, 0, _endState.Heightmap.width, _endState.Heightmap.height), Vector2Int.zero,
                TerrainHeightmapSyncControl.HeightAndLod);

            RenderTexture.active = originalRenderTexture;
        }

        public void Undo()
        {
            var originalRenderTexture = RenderTexture.active;
            RenderTexture.active = _startState.Heightmap;

            _startState.Data.CopyActiveRenderTextureToHeightmap(new RectInt(0, 0, _startState.Heightmap.width, _startState.Heightmap.height), Vector2Int.zero,
                TerrainHeightmapSyncControl.HeightAndLod);

            RenderTexture.active = originalRenderTexture;
        }

        public void DestroyCommand()
        {
            if(_endState != null)
                _endState.Heightmap.Release();

            if(_startState != null)
                _startState.Heightmap.Release();
        }
    }
}