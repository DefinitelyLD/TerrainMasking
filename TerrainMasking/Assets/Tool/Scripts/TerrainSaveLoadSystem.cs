using Debug = UnityEngine.Debug;
using UnityEngine;
using System;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.IO.Compression;

namespace TerrainPloughTools
{
    internal sealed class TerrainSaveLoadSystem
    {
        [Serializable]
        public sealed class TerrainFileData
        {
            public float posX;
            public float posZ;
            public float mapXSize;
            public float mapZSize;
            public float heightSize;
            public int heightmapResolution;
            public int alphamapResolution;
            public int basemapResolution;
            public float[,,] splatMap;
            public float[,] heightMap;
        }

        public string[] QuerySaves()
        {

            string[] saveFileNames = null;

            try
            {
                var directoryPath = Path.Combine(Application.persistentDataPath, "TerrainPloughTool");

                if (Directory.Exists(directoryPath) == false)
                {
                    Directory.CreateDirectory(directoryPath);
                }

                var files = Directory.GetFiles(directoryPath);

                saveFileNames = new string[files.Length];
                for (var i = 0; i < files.Length; i++)
                {

                    var nameStartIndex = files[i].LastIndexOf(Path.DirectorySeparatorChar) + 1;
                    var nameCount = files[i].Length - nameStartIndex;

                    saveFileNames[i] = files[i].Substring(nameStartIndex, nameCount);
                }

            }
            catch (Exception e)
            {
                Debug.LogError("Failed to query terrain save files.");
                Debug.LogException(e);
            }
            Debug.Assert(saveFileNames != null, "Can't proceed further as the Save files are failed to be queried.");

            return saveFileNames;
        }

        public void Save(Terrain terrain, string fileName)
        {
            var save = new TerrainFileData();
            var terrainData = terrain.terrainData;

            save.mapXSize = terrainData.size.x;
            save.mapZSize = terrainData.size.z;
            save.heightSize = terrainData.size.y;
            save.basemapResolution = terrainData.baseMapResolution;
            save.heightmapResolution = terrainData.heightmapResolution;
            save.alphamapResolution = terrainData.alphamapResolution;
            save.splatMap = terrainData.GetAlphamaps(0, 0, terrainData.alphamapWidth, terrainData.alphamapHeight);
            save.heightMap = terrainData.GetHeights(0, 0, terrainData.heightmapResolution, terrainData.heightmapResolution);
            save.posX = terrain.transform.position.x;
            save.posZ = terrain.transform.position.z;

            try
            {
                var directoryPath = Path.Combine(Application.persistentDataPath, "TerrainPloughTool");
                var path = Path.Combine(directoryPath, fileName);

                if (Directory.Exists(directoryPath) == false)
                {
                    Directory.CreateDirectory(directoryPath);
                }

                var bytes = SerializeCompressed(save);

                if (File.Exists(path) == false)
                {
                    using var stream = File.Create(path);
                    stream.Write(bytes, 0, bytes.Length);
                    stream.Close();
                }
                else
                {
                    File.WriteAllBytes(path, bytes);
                }
            }
            catch (Exception e)
            {
                Debug.LogError($"Failed to save terrain: {fileName}");
                Debug.LogException(e);
            }
        }

        public void Load(string fileName, Terrain terrain)
        {
            TerrainFileData save = null;
            try
            {
                var directoryPath = Path.Combine(Application.persistentDataPath, "TerrainPloughTool");
                var path = Path.Combine(directoryPath, fileName);

                if (Directory.Exists(directoryPath) == false)
                {
                    Directory.CreateDirectory(directoryPath);
                }

                var bytes = File.ReadAllBytes(path);
                save = DeserializeCompressed<TerrainFileData>(bytes);
            }
            catch (Exception e)
            {
                Debug.LogError($"Failed to load terrain: {fileName}");
                Debug.LogException(e);
            }

            Debug.Assert(save != null, "Can't proceed further as the save file not loaded.");

            TerrainData terrainData = terrain.terrainData;

            terrainData.heightmapResolution = save.heightmapResolution;
            terrainData.alphamapResolution = save.alphamapResolution;
            terrainData.baseMapResolution = save.basemapResolution;
            terrainData.size = new Vector3(save.mapXSize, save.heightSize, save.mapZSize);

            terrainData.SetHeights(0, 0, save.heightMap);
            terrainData.SetAlphamaps(0, 0, save.splatMap);
        }

        private byte[] SerializeCompressed<T>(T value)
        {
            BinaryFormatter bf = new BinaryFormatter();
            using (var ms = new MemoryStream())
            {
                bf.Serialize(ms, value);

                using (MemoryStream input = new MemoryStream(ms.ToArray()))
                using (MemoryStream output = new MemoryStream())
                {
                    using (GZipStream compression = new GZipStream(output, CompressionMode.Compress))
                    {
                        input.CopyTo(compression);
                    }

                    return output.ToArray();
                }
            }
        }

        private T DeserializeCompressed<T>(byte[] bytes)
        {
            using (var inStream = new MemoryStream(bytes))
            using (var zipStream = new GZipStream(inStream, CompressionMode.Decompress))
            using (var outStream = new MemoryStream())
            {
                zipStream.CopyTo(outStream);

                BinaryFormatter bf = new BinaryFormatter();
                outStream.Position = 0;
                var deserialized = bf.Deserialize(outStream);
                T result = (T)deserialized;

                zipStream.Close();

                return result;
            }
        }
    }
}