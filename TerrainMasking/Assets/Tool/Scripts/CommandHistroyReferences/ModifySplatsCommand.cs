using UnityEngine;

namespace Commands.AllCommands.TerrainCommands
{    
    public class ModifySplatsCommand : ICommand
    {
        private class TerrainSplatsState
        {
            public TerrainData Data;
            public RenderTexture[] Alphamaps;
        } 

        private readonly TerrainSplatsState _startState;
        private TerrainSplatsState _endState;
        
        public ModifySplatsCommand(TerrainData data)
        {
            _startState = new TerrainSplatsState(){
                Data = data,
                Alphamaps = new RenderTexture[data.alphamapTextureCount]
            };

            for(var i = 0; i < _startState.Alphamaps.Length; i++)
            {
                _startState.Alphamaps[i] = new RenderTexture(data.alphamapTextures[i].width, data.alphamapTextures[i].height, 0, data.alphamapTextures[i].graphicsFormat, 0);
                Graphics.CopyTexture(data.alphamapTextures[i], 0, 0, _startState.Alphamaps[i], 0, 0);
            }
        }

        public void Complete(TerrainData data)
        {
            _endState = new TerrainSplatsState()
            {
                Data = data,
                Alphamaps = new RenderTexture[data.alphamapTextureCount]
            };

            for (var i = 0; i < _endState.Alphamaps.Length; i++)
            {
                _endState.Alphamaps[i] = new RenderTexture(data.alphamapTextures[i].width, data.alphamapTextures[i].height, 0, data.alphamapTextures[i].graphicsFormat, 0);
                Graphics.CopyTexture(data.alphamapTextures[i], 0, 0, _endState.Alphamaps[i], 0, 0);
            }
        }

        public void Execute()
        {
            var originalRenderTexture = RenderTexture.active;

            for (var i = 0; i < _endState.Alphamaps.Length; i++)
            {
                RenderTexture.active = _endState.Alphamaps[i];

                var size = new Vector2Int(RenderTexture.active.width, RenderTexture.active.height);
                _endState.Data.CopyActiveRenderTextureToTexture("alphamap", i, new RectInt(0, 0, size.x, size.y), Vector2Int.zero, false);
            }

            RenderTexture.active = originalRenderTexture;
        }

        public void Undo()
        {
            var originalRenderTexture = RenderTexture.active;

            for (var i = 0; i < _startState.Alphamaps.Length; i++)
            {
                RenderTexture.active = _startState.Alphamaps[i];

                var size = new Vector2Int(RenderTexture.active.width, RenderTexture.active.height);
                _startState.Data.CopyActiveRenderTextureToTexture("alphamap", i, new RectInt(0, 0, size.x, size.y), Vector2Int.zero, false);
            }

            RenderTexture.active = originalRenderTexture;
        }

        public void DestroyCommand()
        {
            if (_startState != null)
            {
                for (var i = 0; i < _startState.Alphamaps.Length; i++)
                {
                    _startState.Alphamaps[i].Release();
                }
            }
            if (_endState != null)
            {
                for (var i = 0; i < _endState.Alphamaps.Length; i++)
                {
                    _endState.Alphamaps[i].Release();
                }
            }
        }
    }
}