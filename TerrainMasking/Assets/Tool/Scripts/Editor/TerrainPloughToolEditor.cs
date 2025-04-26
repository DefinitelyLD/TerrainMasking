using UnityEditor;
using System.Linq;
using UnityEngine;

namespace TerrainPloughTools {
    [CustomEditor(typeof(TerrainPloughTool))]
    internal sealed class TerrainPloughToolEditor : Editor {

        private SerializedProperty[] _debugProperties;
        private SerializedProperty[] _defaultProperties;

        private bool _showDebugValues;

        private void OnEnable() {

            var fields = typeof(TerrainPloughTool)
                .GetFields(System.Reflection.BindingFlags.Public | System.Reflection.BindingFlags.NonPublic | System.Reflection.BindingFlags.Instance);

            var debugFields = (from feild in fields
                               where feild.CustomAttributes.Any(x => x.AttributeType == typeof(TerrainPloughTool.DebugInfoAttribute))
                               select feild).ToArray();

            _debugProperties = new SerializedProperty[debugFields.Length];
            for (var i = 0; i < _debugProperties.Length; i++) {
                _debugProperties[i] = serializedObject.FindProperty(debugFields[i].Name);
            }

            var defaultFields = (from field in fields
                                 where field.CustomAttributes.Any(x => x.AttributeType == typeof(SerializeField)) &&
                                       !field.CustomAttributes.Any(x => x.AttributeType == typeof(TerrainPloughTool.DebugInfoAttribute))
                                 select field).ToArray();


            _defaultProperties = new SerializedProperty[defaultFields.Length];
            for (var i = 0; i < _defaultProperties.Length; i++) {
                _defaultProperties[i] = serializedObject.FindProperty(defaultFields[i].Name);
            }
        }

        public override void OnInspectorGUI() {
            serializedObject.Update();

            EditorGUILayout.HelpBox($"{nameof(TerrainPloughTool)}", MessageType.Info, true);
            EditorGUILayout.Space();
            

            _showDebugValues = EditorGUILayout.Toggle("Show Debug Values: ", _showDebugValues);

            if (_showDebugValues) {

                EditorGUILayout.Space();
                EditorGUILayout.LabelField("Debug Values: ");
                EditorGUILayout.Space();

                foreach (var property in _debugProperties) {
                    EditorGUILayout.PropertyField(property);
                }

                EditorGUILayout.Space();
                EditorGUILayout.LabelField("____________________________________________________________________________________________________________________________");
                EditorGUILayout.Space(10);
            }

            foreach (var property in _defaultProperties) {
                EditorGUILayout.PropertyField(property);
            }

            serializedObject.ApplyModifiedProperties();
        }
    }
}
