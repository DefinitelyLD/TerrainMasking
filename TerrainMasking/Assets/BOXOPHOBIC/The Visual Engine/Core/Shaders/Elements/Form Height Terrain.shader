// Made with Amplify Shader Editor v1.9.7.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Visual Engine/Elements/Legacy/Form Height (Terrain)"
{
	Properties
	{
		[StyledMessage(Info, Use the Height Terrain elements to snap the prefabs on terrain surfaces. Please note__ the Terrain Mask option need to be set to Height on the element script for the element to get the terrain texture., 0, 15)]_ElementMessage("Element Message", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 2050
		[HideInInspector]_IsElementShader("_IsElementShader", Float) = 1
		[StyledCategory(Render Settings, true, 0, 10)]_RenderCategory("[ Render Category ]", Float) = 1
		_ElementIntensity("Render Intensity", Range( 0 , 1)) = 1
		[StyledMessage(Info, When using a higher Layer number the Global Volume will create more render textures to render the elements. Try using fewer layers when possible., _ElementLayerMessage, 1, 10, 10)]_ElementLayerMessage("Render Layer Message", Float) = 0
		[StyledMessage(Warning, When using all layers the Global Volume will create one render texture for each layer to render the elements. Try using fewer layers when possible., _ElementLayerWarning, 1, 10, 10)]_ElementLayerWarning("Render Layer Warning", Float) = 0
		[StyledMask(Form Layers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_ElementLayerMask("Render Layer", Float) = 1
		[StyledSpace(10)]_EndRender("[ End Render ]", Float) = 1
		[StyledCategory(Element Settings, true, 0, 10)]_CategoryElement("[ Category Element ]", Float) = 1
		[StyledTextureSingleLine]_MainTex("Element Texture", 2D) = "white" {}
		[Space(10)]_HeightOffsetValue("Height Offset", Float) = 0
		[HideInInspector]_TerrainPosition("Terrain Position", Vector) = (0,0,0,0)
		[HideInInspector]_TerrainSize("Terrain Size", Vector) = (0,0,0,0)
		[StyledSpace(10)]_EndElement("[ End Element ]", Float) = 1
		[StyledCategory(Fading Settings, true, 0, 10)]_CategoryFade("[ Category Fade ]", Float) = 1
		[Enum(Off,0,On,1)]_ElementVolumeFadeMode("Bounds Fade", Float) = 0
		_ElementVolumeFadeValue("Bounds Fade Blend", Range( 0 , 1)) = 0.75
		[StyledSpace(10)]_EndFade("[ End Fade ]", Float) = 1

	}
	
	SubShader
	{
		
		
		Tags { "RenderType"="Transparent" "Queue"="Transparent" "DisableBatching"="True" }
	LOD 100

		
		Pass
		{
			
			Name "VolumePass"
			
			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend SrcAlpha OneMinusSrcAlpha
			AlphaToMask Off
			Cull Back
			ColorMask B
			ZWrite Off
			ZTest LEqual
			
			CGPROGRAM

			#define ASE_VERSION 19702


			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsVersion;
			uniform half _IsElementShader;
			uniform half _RenderCategory;
			uniform half _ElementLayerMessage;
			uniform half _ElementLayerWarning;
			uniform half _ElementLayerMask;
			uniform half _CategoryElement;
			uniform half _EndElement;
			uniform half _EndRender;
			uniform half _CategoryFade;
			uniform half _EndFade;
			uniform half _ElementMessage;
			uniform sampler2D _MainTex;
			uniform float3 _TerrainPosition;
			uniform float3 _TerrainSize;
			float4 _MainTex_TexelSize;
			uniform float _HeightOffsetValue;
			uniform float _ElementIntensity;
			uniform half4 TVE_RenderBasePositionR;
			uniform float _ElementVolumeFadeValue;
			uniform float _ElementVolumeFadeMode;

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float4 appendResult232 = (float4(_TerrainPosition.x , _TerrainPosition.z , _TerrainSize.x , _TerrainSize.z));
				half4 Terrain_Coords233 = appendResult232;
				float4 temp_output_35_0_g23060 = Terrain_Coords233;
				float2 InputScale48_g23060 = (temp_output_35_0_g23060).zw;
				half2 FinalScale53_g23060 = ( 1.0 / InputScale48_g23060 );
				float2 InputPosition52_g23060 = (temp_output_35_0_g23060).xy;
				half2 FinalPosition58_g23060 = -( FinalScale53_g23060 * InputPosition52_g23060 );
				float2 temp_output_65_0_g23060 = ( ( (WorldPosition).xz * FinalScale53_g23060 ) + FinalPosition58_g23060 );
				float4 temp_output_70_0_g23060 = _MainTex_TexelSize;
				float2 InputTexelSize68_g23060 = (temp_output_70_0_g23060).zw;
				float2 temp_cast_0 = (1.0).xx;
				float2 InputTexelRecip69_g23060 = (temp_output_70_0_g23060).xy;
				float4 Terrain_Height_Raw175 = tex2D( _MainTex, ( ( ( temp_output_65_0_g23060 / ( 1.0 / ( InputTexelSize68_g23060 - temp_cast_0 ) ) ) + 0.5 ) * InputTexelRecip69_g23060 ) );
				float temp_output_223_0 = ( ( (Terrain_Height_Raw175).r + ( (Terrain_Height_Raw175).g * 256.0 ) ) / 257.0 );
				#ifdef SHADER_API_VULKAN
				float staticSwitch212 = temp_output_223_0;
				#else
				float staticSwitch212 = (Terrain_Height_Raw175).r;
				#endif
				#ifdef SHADER_API_GLES
				float staticSwitch213 = temp_output_223_0;
				#else
				float staticSwitch213 = staticSwitch212;
				#endif
				#ifdef SHADER_API_GLES3
				float staticSwitch214 = temp_output_223_0;
				#else
				float staticSwitch214 = staticSwitch213;
				#endif
				float Terrain_Height_Platform215 = staticSwitch214;
				float Terrain_SizeY143 = _TerrainSize.y;
				float Terrain_Height_Final206 = ( Terrain_Height_Platform215 * Terrain_SizeY143 * 2.0 );
				float Terrain_PosY200 = _TerrainPosition.y;
				float temp_output_7_0_g23063 = 1.0;
				float temp_output_9_0_g23063 = ( saturate( ( distance( WorldPosition , (TVE_RenderBasePositionR).xyz ) / (TVE_RenderBasePositionR).w ) ) - temp_output_7_0_g23063 );
				float lerpResult18_g23061 = lerp( 1.0 , saturate( ( temp_output_9_0_g23063 / ( _ElementVolumeFadeValue - temp_output_7_0_g23063 ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha182 = ( _ElementIntensity * lerpResult18_g23061 );
				float4 appendResult169 = (float4(0.0 , 0.0 , ( Terrain_Height_Final206 + Terrain_PosY200 + _HeightOffsetValue ) , Element_Alpha182));
				
				
				finalColor = appendResult169;
				return finalColor;
			}
			ENDCG
		}
		
		
		Pass
		{
			
			Name "VisualPass"
			
			CGINCLUDE
			#pragma target 3.0
			ENDCG
			Blend SrcAlpha OneMinusSrcAlpha
			AlphaToMask Off
			Cull Back
			ColorMask RGBA
			ZWrite Off
			ZTest LEqual
			
			CGPROGRAM

			#define ASE_VERSION 19702


			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsVersion;
			uniform half _IsElementShader;
			uniform half _RenderCategory;
			uniform half _ElementLayerMessage;
			uniform half _ElementLayerWarning;
			uniform half _ElementLayerMask;
			uniform half _CategoryElement;
			uniform half _EndElement;
			uniform half _EndRender;
			uniform half _CategoryFade;
			uniform half _EndFade;
			uniform half _ElementMessage;
			uniform sampler2D _MainTex;
			uniform float3 _TerrainPosition;
			uniform float3 _TerrainSize;
			float4 _MainTex_TexelSize;
			uniform float _ElementIntensity;
			uniform half4 TVE_RenderBasePositionR;
			uniform float _ElementVolumeFadeValue;
			uniform float _ElementVolumeFadeMode;

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				
				float3 vertexValue = float3(0, 0, 0);
				#if ASE_ABSOLUTE_VERTEX_POS
				vertexValue = v.vertex.xyz;
				#endif
				vertexValue = vertexValue;
				#if ASE_ABSOLUTE_VERTEX_POS
				v.vertex.xyz = vertexValue;
				#else
				v.vertex.xyz += vertexValue;
				#endif
				o.vertex = UnityObjectToClipPos(v.vertex);

				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				o.worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				#endif
				return o;
			}
			
			fixed4 frag (v2f i ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(i);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
				fixed4 finalColor;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 WorldPosition = i.worldPos;
				#endif
				float4 appendResult232 = (float4(_TerrainPosition.x , _TerrainPosition.z , _TerrainSize.x , _TerrainSize.z));
				half4 Terrain_Coords233 = appendResult232;
				float4 temp_output_35_0_g23060 = Terrain_Coords233;
				float2 InputScale48_g23060 = (temp_output_35_0_g23060).zw;
				half2 FinalScale53_g23060 = ( 1.0 / InputScale48_g23060 );
				float2 InputPosition52_g23060 = (temp_output_35_0_g23060).xy;
				half2 FinalPosition58_g23060 = -( FinalScale53_g23060 * InputPosition52_g23060 );
				float2 temp_output_65_0_g23060 = ( ( (WorldPosition).xz * FinalScale53_g23060 ) + FinalPosition58_g23060 );
				float4 temp_output_70_0_g23060 = _MainTex_TexelSize;
				float2 InputTexelSize68_g23060 = (temp_output_70_0_g23060).zw;
				float2 temp_cast_0 = (1.0).xx;
				float2 InputTexelRecip69_g23060 = (temp_output_70_0_g23060).xy;
				float4 Terrain_Height_Raw175 = tex2D( _MainTex, ( ( ( temp_output_65_0_g23060 / ( 1.0 / ( InputTexelSize68_g23060 - temp_cast_0 ) ) ) + 0.5 ) * InputTexelRecip69_g23060 ) );
				float temp_output_223_0 = ( ( (Terrain_Height_Raw175).r + ( (Terrain_Height_Raw175).g * 256.0 ) ) / 257.0 );
				#ifdef SHADER_API_VULKAN
				float staticSwitch212 = temp_output_223_0;
				#else
				float staticSwitch212 = (Terrain_Height_Raw175).r;
				#endif
				#ifdef SHADER_API_GLES
				float staticSwitch213 = temp_output_223_0;
				#else
				float staticSwitch213 = staticSwitch212;
				#endif
				#ifdef SHADER_API_GLES3
				float staticSwitch214 = temp_output_223_0;
				#else
				float staticSwitch214 = staticSwitch213;
				#endif
				float Terrain_Height_Platform215 = staticSwitch214;
				float Terrain_SizeY143 = _TerrainSize.y;
				float Terrain_Height_Final206 = ( Terrain_Height_Platform215 * Terrain_SizeY143 * 2.0 );
				float3 temp_cast_1 = (saturate( ( Terrain_Height_Final206 * 0.1 ) )).xxx;
				half3 Input_Color94_g23066 = temp_cast_1;
				float3 break68_g23066 = Input_Color94_g23066;
				float clampResult80_g23066 = clamp( max( max( break68_g23066.x , break68_g23066.y ) , break68_g23066.z ) , 0.1 , 10000.0 );
				float4 color185 = IsGammaSpace() ? float4(0,0.2,1,0) : float4(0,0.03310476,1,0);
				half3 Input_Tint76_g23066 = (color185).rgb;
				half3 Element_Valid47_g23066 = ( clampResult80_g23066 * Input_Tint76_g23066 );
				float temp_output_7_0_g23063 = 1.0;
				float temp_output_9_0_g23063 = ( saturate( ( distance( WorldPosition , (TVE_RenderBasePositionR).xyz ) / (TVE_RenderBasePositionR).w ) ) - temp_output_7_0_g23063 );
				float lerpResult18_g23061 = lerp( 1.0 , saturate( ( temp_output_9_0_g23063 / ( _ElementVolumeFadeValue - temp_output_7_0_g23063 ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha182 = ( _ElementIntensity * lerpResult18_g23061 );
				half Input_Alpha48_g23066 = Element_Alpha182;
				float4 appendResult58_g23066 = (float4(Element_Valid47_g23066 , Input_Alpha48_g23066));
				
				
				finalColor = appendResult58_g23066;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "TVEShaderGUIElement"
	
	Fallback Off
}
/*ASEBEGIN
Version=19702
Node;AmplifyShaderEditor.Vector3Node;141;-2176,-1024;Inherit;False;Property;_TerrainSize;Terrain Size;18;1;[HideInInspector];Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector3Node;201;-2176,-1280;Inherit;False;Property;_TerrainPosition;Terrain Position;17;1;[HideInInspector];Create;True;0;0;0;False;0;False;0,0,0;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.DynamicAppendNode;232;-1792,-896;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;233;-1600,-896;Half;False;Terrain_Coords;-1;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;236;-2176,-512;Inherit;False;233;Terrain_Coords;1;0;OBJECT;;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TexelSizeNode;234;-2176,-448;Inherit;False;146;1;0;SAMPLER2D;;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;241;-1792,-512;Inherit;False;Compute Coords Height;10;;23060;d0444d471efe7f1408b5cbe1e3f402c9;1,83,1;2;35;FLOAT4;0,0,0,0;False;70;FLOAT4;0,0,0,0;False;1;FLOAT2;38
Node;AmplifyShaderEditor.SamplerNode;146;-1408,-512;Inherit;True;Property;_MainTex;Element Texture;15;0;Create;False;0;0;0;False;1;StyledTextureSingleLine;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.RegisterLocalVarNode;175;-1024,-512;Float;False;Terrain_Height_Raw;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;211;-2176,-128;Inherit;False;175;Terrain_Height_Raw;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.SwizzleNode;218;-1920,64;Inherit;False;FLOAT;1;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;220;-1920,128;Float;False;Constant;_Float5;Float 5;10;0;Create;True;0;0;0;False;0;False;256;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;217;-1920,0;Inherit;False;FLOAT;0;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;219;-1728,64;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;221;-1536,0;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;222;-1536,128;Float;False;Constant;_Float6;Float 5;10;0;Create;True;0;0;0;False;0;False;257;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SwizzleNode;216;-1920,-128;Inherit;False;FLOAT;0;1;2;3;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;223;-1280,0;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;212;-1760,-128;Inherit;False;Property;_Keyword0;Keyword 0;10;0;Create;True;0;0;0;False;0;False;0;0;0;False;SHADER_API_VULKAN;Toggle;2;Key0;Key1;Fetch;False;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;213;-1504,-128;Inherit;False;Property;_Keyword1;Keyword 0;10;0;Create;True;0;0;0;False;0;False;0;0;0;False;SHADER_API_GLES;Toggle;2;Key0;Key1;Fetch;False;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;214;-1280,-128;Inherit;False;Property;_Keyword2;Keyword 0;10;0;Create;True;0;0;0;False;0;False;0;0;0;False;SHADER_API_GLES3;Toggle;2;Key0;Key1;Fetch;False;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;143;-1792,-1024;Inherit;False;Terrain_SizeY;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;215;-1024,-128;Float;False;Terrain_Height_Platform;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;144;-256,-832;Inherit;False;143;Terrain_SizeY;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;210;-256,-768;Half;False;Constant;_Float4;Float 4;16;0;Create;True;0;0;0;False;0;False;2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;176;-256,-896;Inherit;False;215;Terrain_Height_Platform;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;149;128,-896;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;174;-2176,832;Inherit;False;Element Fade Volume;21;;23061;4935729172cdadd45b9b14c3fa9c1db4;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;206;512,-896;Float;False;Terrain_Height_Final;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;230;-2176,768;Inherit;False;Element Form;1;;23064;bc58488265c2ed6408843a733b1a9124;0;0;1;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;208;-256,-128;Inherit;False;206;Terrain_Height_Final;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;170;-1536,768;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;205;128,-128;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;182;-1024,768;Half;False;Element_Alpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;184;-256,0;Inherit;False;182;Element_Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;185;-256,64;Inherit;False;Constant;_Color1;Color 1;15;0;Create;True;0;0;0;False;0;False;0,0.2,1,0;0,0,0,0;True;True;0;6;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT3;5
Node;AmplifyShaderEditor.SaturateNode;204;256,-128;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;203;-256,-448;Inherit;False;200;Terrain_PosY;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;207;-256,-512;Inherit;False;206;Terrain_Height_Final;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;199;-256,-384;Inherit;False;Property;_HeightOffsetValue;Height Offset;16;0;Create;False;0;0;0;False;1;Space(10);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;169;512,-512;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;180;512,-128;Inherit;False;Element Visuals;-1;;23066;78cf0f00cfd72824e84597f2db54a76e;1,64,1;3;59;FLOAT3;0,0,0;False;117;FLOAT;0;False;77;COLOR;1,1,1,1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;148;128,-512;Inherit;False;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;183;128,-384;Inherit;False;182;Element_Alpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;167;-1472,-1792;Inherit;False;Element Compile;-1;;23067;5302407fc6d65554791e558e67d59358;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;225;-1920,-1792;Half;False;Property;_CategoryElement;[ Category Element ];14;0;Create;True;0;0;0;True;1;StyledCategory(Element Settings, true, 0, 10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;228;-1920,-1728;Half;False;Property;_EndElement;[ End Element ];19;0;Create;True;0;0;0;True;1;StyledSpace(10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;229;-1920,-1664;Half;False;Property;_EndRender;[ End Render ];13;0;Create;True;0;0;0;True;1;StyledSpace(10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;226;-1712,-1792;Half;False;Property;_CategoryFade;[ Category Fade ];20;0;Create;True;0;0;0;True;1;StyledCategory(Fading Settings, true, 0, 10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;227;-1712,-1728;Half;False;Property;_EndFade;[ End Fade ];24;0;Create;True;0;0;0;True;1;StyledSpace(10);False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;200;-1792,-1280;Inherit;False;Terrain_PosY;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;112;-2176,-1792;Half;False;Property;_ElementMessage;Element Message;0;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use the Height Terrain elements to snap the prefabs on terrain surfaces. Please note__ the Terrain Mask option need to be set to Height on the element script for the element to get the terrain texture., 0, 15);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;177;768,-512;Float;False;True;-1;2;TVEShaderGUIElement;100;16;BOXOPHOBIC/The Visual Engine/Elements/Legacy/Form Height (Terrain);f4f273c3bb6262d4396be458405e60f9;True;VolumePass;0;0;VolumePass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;DisableBatching=True=DisableBatching;False;False;0;True;True;2;5;False;;10;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;True;True;False;False;True;False;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;False;True;2;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;2;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;178;768,-128;Float;False;False;-1;2;ASEMaterialInspector;100;16;New Amplify Shader;f4f273c3bb6262d4396be458405e60f9;True;VisualPass;0;1;VisualPass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;False;False;0;True;True;2;5;False;;10;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;False;True;2;False;0;;0;0;Standard;0;False;0
WireConnection;232;0;201;1
WireConnection;232;1;201;3
WireConnection;232;2;141;1
WireConnection;232;3;141;3
WireConnection;233;0;232;0
WireConnection;241;35;236;0
WireConnection;241;70;234;0
WireConnection;146;1;241;38
WireConnection;175;0;146;0
WireConnection;218;0;211;0
WireConnection;217;0;211;0
WireConnection;219;0;218;0
WireConnection;219;1;220;0
WireConnection;221;0;217;0
WireConnection;221;1;219;0
WireConnection;216;0;211;0
WireConnection;223;0;221;0
WireConnection;223;1;222;0
WireConnection;212;1;216;0
WireConnection;212;0;223;0
WireConnection;213;1;212;0
WireConnection;213;0;223;0
WireConnection;214;1;213;0
WireConnection;214;0;223;0
WireConnection;143;0;141;2
WireConnection;215;0;214;0
WireConnection;149;0;176;0
WireConnection;149;1;144;0
WireConnection;149;2;210;0
WireConnection;206;0;149;0
WireConnection;170;0;230;4
WireConnection;170;1;174;0
WireConnection;205;0;208;0
WireConnection;182;0;170;0
WireConnection;204;0;205;0
WireConnection;169;2;148;0
WireConnection;169;3;183;0
WireConnection;180;59;204;0
WireConnection;180;117;184;0
WireConnection;180;77;185;0
WireConnection;148;0;207;0
WireConnection;148;1;203;0
WireConnection;148;2;199;0
WireConnection;200;0;201;2
WireConnection;177;0;169;0
WireConnection;178;0;180;0
ASEEND*/
//CHKSM=9A8395F62A9794E820516740EED89BF43A4B7A92