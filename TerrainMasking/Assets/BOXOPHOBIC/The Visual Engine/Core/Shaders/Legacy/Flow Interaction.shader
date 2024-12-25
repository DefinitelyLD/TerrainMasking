// Upgrade NOTE: upgraded instancing buffer 'HiddenBOXOPHOBICTheVisualEngineElementsFlowInteractionLegacy' to new syntax.

// Made with Amplify Shader Editor v1.9.8
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Hidden/BOXOPHOBIC/The Visual Engine/Elements/Flow Interaction (Legacy)"
{
	Properties
	{
		[StyledMessage(Info, Use the Motion elements to control the wind intensity locally. Element Texture R and Particle Color R are used as value multipliers. Element Texture A and Particle Color A are used as alpha masks., 0, 15)]_ElementMessage("Element Message", Float) = 0
		[HideInInspector]_IsVersion("_IsVersion", Float) = 2050
		[HideInInspector]_IsElementShader("_IsElementShader", Float) = 1
		[StyledCategory(Render Settings, true, 0, 10)]_RenderCategory("[ Render Category ]", Float) = 1
		_ElementIntensity("Render Intensity", Range( 0 , 1)) = 1
		[StyledMessage(Info, When using a higher Layer number the Global Volume will create more render textures to render the elements. Try using fewer layers when possible., _ElementLayerMessage, 1, 10, 10)]_ElementLayerMessage("Render Layer Message", Float) = 0
		[StyledMessage(Warning, When using all layers the Global Volume will create one render texture for each layer to render the elements. Try using fewer layers when possible., _ElementLayerWarning, 1, 10, 10)]_ElementLayerWarning("Render Layer Warning", Float) = 0
		[StyledMask(Push Layers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_ElementLayerMask("Render Layer", Float) = 1
		[HideInInspector]_ElementParams("Render Params", Vector) = (1,1,1,1)
		[StyledSpace(10)]_RenderEnd("[ Render End ]", Float) = 0
		[StyledCategory(Element Settings, true, 0, 10)]_ElementCategory("[ Element Category ]", Float) = 1
		[NoScaleOffset][StyledTextureSingleLine]_MainTex("Element Texture", 2D) = "white" {}
		[StyledSpace(10)]_SpaceTexture("#SpaceTexture", Float) = 0
		[StyledRemapSlider]_MainTexColorRemap("Element Value", Vector) = (0,1,0,0)
		[StyledRemapSlider]_MainTexAlphaRemap("Element Alpha", Vector) = (0,1,0,0)
		[StyledRemapSlider]_MainTexFalloffRemap("Element Falloff", Vector) = (0,0,0,0)
		[Space(10)][StyledTextureSingleLine]_MotionTex("Motion Texture", 2D) = "linearGrey" {}
		[HideInInspector]_MotionPhaseValue("Motion Phase", Float) = 0
		[Enum(Element Forward,0,Element Texture,1,Particle Translate,2,Particle Velocity,3)][Space(10)]_MotionDirectionMode("Motion Direction", Float) = 1
		_MotionNoiseValue("Motion Noise", Range( 0 , 1)) = 0
		_MotionTillingValue("Motion Tilling", Range( 0 , 100)) = 5
		_MotionSpeedValue("Motion Speed", Range( 0 , 50)) = 5
		[Space(10)]_SpeedTresholdValue("Particle Speed Treshold", Float) = 10
		[Space(10)][StyledToggle]_ElementInvertMode("Use Inverted Direction", Float) = 0
		[StyledSpace(10)]_ElementEnd("[ Element End ]", Float) = 0
		[StyledCategory(Fading Settings, true, 0, 10)]_FadeCategory("[ Fade Category ]", Float) = 1
		[Enum(Off,0,On,1)]_ElementVolumeFadeMode("Bounds Fade", Float) = 0
		_ElementVolumeFadeValue("Bounds Fade Blend", Range( 0 , 1)) = 0.75
		[HDR][Enum(Off,0,On,1)][Space(10)]_ElementRaycastMode("Raycast Fade", Float) = 0
		[StyledLayers()]_RaycastLayerMask("Raycast Layer", Float) = 1
		_RaycastDistanceMaxValue("Raycast Limit", Float) = 2
		[HideInInspector]_motion_direction_mode("_motion_direction_mode", Vector) = (0,0,0,0)
		[StyledSpace(10)]_FadeEnd("[ Fade End ]", Float) = 0

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
			Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
			AlphaToMask Off
			Cull Back
			ColorMask RGA
			ZWrite Off
			ZTest LEqual
			
			CGPROGRAM

			#define ASE_VERSION 19800


			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsVersion;
			uniform half _IsElementShader;
			uniform half _RenderCategory;
			uniform half _ElementLayerMessage;
			uniform half _ElementLayerWarning;
			uniform half _ElementLayerMask;
			uniform half _ElementMessage;
			uniform half4 _MainTexColorRemap;
			uniform half _RaycastLayerMask;
			uniform half _RaycastDistanceMaxValue;
			uniform half _ElementRaycastMode;
			uniform half _FadeEnd;
			uniform half _SpaceTexture;
			uniform half _FadeCategory;
			uniform half _ElementCategory;
			uniform half _ElementEnd;
			uniform half _RenderEnd;
			uniform float _SpeedTresholdValue;
			uniform half4 _motion_direction_mode;
			uniform sampler2D _MainTex;
			uniform float _ElementInvertMode;
			uniform sampler2D _MotionTex;
			uniform float3 TVE_WorldOrigin;
			uniform half _MotionTillingValue;
			uniform half4 TVE_TimeParams;
			uniform half _MotionSpeedValue;
			uniform half _MotionPhaseValue;
			uniform half _MotionNoiseValue;
			uniform float _ElementIntensity;
			uniform half4 _MainTexAlphaRemap;
			uniform half4 _MainTexFalloffRemap;
			uniform half4 TVE_RenderBasePositionR;
			uniform float _ElementVolumeFadeValue;
			uniform float _ElementVolumeFadeMode;
			uniform half _MotionDirectionMode;
			UNITY_INSTANCING_BUFFER_START(HiddenBOXOPHOBICTheVisualEngineElementsFlowInteractionLegacy)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr HiddenBOXOPHOBICTheVisualEngineElementsFlowInteractionLegacy
			UNITY_INSTANCING_BUFFER_END(HiddenBOXOPHOBICTheVisualEngineElementsFlowInteractionLegacy)

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				o.ase_texcoord1 = v.ase_texcoord;
				o.ase_color = v.color;
				o.ase_texcoord2 = v.ase_texcoord1;
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
				float3 ase_objectScale = float3( length( unity_ObjectToWorld[ 0 ].xyz ), length( unity_ObjectToWorld[ 1 ].xyz ), length( unity_ObjectToWorld[ 2 ].xyz ) );
				half2 Direction_Transform1406_g77104 = (( mul( unity_ObjectToWorld, float4( float3(0,0,1) , 0.0 ) ).xyz / ase_objectScale )).xz;
				half4 MainTex_RGBA587_g77104 = tex2D( _MainTex, ( 1.0 - i.ase_texcoord1.xy ) );
				float3 temp_cast_2 = (0.0001).xxx;
				float3 temp_cast_3 = (0.9999).xxx;
				float3 clampResult17_g77113 = clamp( (MainTex_RGBA587_g77104).rgb , temp_cast_2 , temp_cast_3 );
				float temp_output_7_0_g77111 = _MainTexColorRemap.x;
				float3 temp_cast_4 = (temp_output_7_0_g77111).xxx;
				float3 temp_output_9_0_g77111 = ( clampResult17_g77113 - temp_cast_4 );
				float3 temp_output_1765_0_g77104 = saturate( ( temp_output_9_0_g77111 / ( _MainTexColorRemap.y - temp_output_7_0_g77111 ) ) );
				half Element_Remap_R73_g77104 = (temp_output_1765_0_g77104).x;
				half Element_Remap_G265_g77104 = (temp_output_1765_0_g77104).y;
				float3 appendResult274_g77104 = (float3((Element_Remap_R73_g77104*2.0 + -1.0) , 0.0 , (Element_Remap_G265_g77104*2.0 + -1.0)));
				float3 break281_g77104 = ( mul( unity_ObjectToWorld, float4( appendResult274_g77104 , 0.0 ) ).xyz / ase_objectScale );
				float2 appendResult1403_g77104 = (float2(break281_g77104.x , break281_g77104.z));
				half2 Direction_Texture284_g77104 = appendResult1403_g77104;
				float2 appendResult1404_g77104 = (float2(i.ase_color.r , i.ase_color.g));
				half2 Direction_VertexColor1150_g77104 = (appendResult1404_g77104*2.0 + -1.0);
				float2 appendResult1382_g77104 = (float2(i.ase_texcoord1.z , i.ase_texcoord2.x));
				half2 Direction_Velocity1394_g77104 = ( appendResult1382_g77104 / i.ase_texcoord2.y );
				float2 temp_output_1452_0_g77104 = ( ( _motion_direction_mode.x * Direction_Transform1406_g77104 ) + ( _motion_direction_mode.y * Direction_Texture284_g77104 ) + ( _motion_direction_mode.z * Direction_VertexColor1150_g77104 ) + ( _motion_direction_mode.w * Direction_Velocity1394_g77104 ) );
				half Element_InvertMode489_g77104 = _ElementInvertMode;
				float2 lerpResult1468_g77104 = lerp( temp_output_1452_0_g77104 , -temp_output_1452_0_g77104 , Element_InvertMode489_g77104);
				half2 Direction_Advanced1454_g77104 = lerpResult1468_g77104;
				half2 Motion_Coords2098_g77104 = -(( WorldPosition - TVE_WorldOrigin )).xz;
				half2 Motion_Tilling1409_g77104 = ( Motion_Coords2098_g77104 * 0.005 * _MotionTillingValue );
				float2 temp_output_3_0_g77124 = Motion_Tilling1409_g77104;
				float2 temp_output_21_0_g77124 = Direction_Advanced1454_g77104;
				float mulTime113_g77127 = _Time.y * 0.015;
				float lerpResult128_g77127 = lerp( mulTime113_g77127 , ( ( mulTime113_g77127 * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				float temp_output_15_0_g77124 = (lerpResult128_g77127*_MotionSpeedValue + _MotionPhaseValue);
				float temp_output_23_0_g77124 = frac( temp_output_15_0_g77124 );
				float4 lerpResult39_g77124 = lerp( tex2D( _MotionTex, ( temp_output_3_0_g77124 + ( temp_output_21_0_g77124 * temp_output_23_0_g77124 ) ) ) , tex2D( _MotionTex, ( temp_output_3_0_g77124 + ( temp_output_21_0_g77124 * frac( ( temp_output_15_0_g77124 + 0.5 ) ) ) ) ) , ( abs( ( temp_output_23_0_g77124 - 0.5 ) ) / 0.5 ));
				float4 temp_output_1423_0_g77104 = lerpResult39_g77124;
				half2 Motion_FlowRG1427_g77104 = (temp_output_1423_0_g77104).rg;
				half Motion_Noise2056_g77104 = _MotionNoiseValue;
				float2 lerpResult2141_g77104 = lerp( (Direction_Advanced1454_g77104*0.5 + 0.5) , Motion_FlowRG1427_g77104 , Motion_Noise2056_g77104);
				half Motion_FlowA2144_g77104 = (temp_output_1423_0_g77104).a;
				float3 appendResult1436_g77104 = (float3(lerpResult2141_g77104 , ( saturate( ( Motion_Noise2056_g77104 * 2.0 ) ) * Motion_FlowA2144_g77104 )));
				half3 Final_MotionAdvanced_RGB1438_g77104 = appendResult1436_g77104;
				float clampResult17_g77114 = clamp( (MainTex_RGBA587_g77104).a , 0.0001 , 0.9999 );
				float temp_output_7_0_g77110 = _MainTexAlphaRemap.x;
				float temp_output_9_0_g77110 = ( clampResult17_g77114 - temp_output_7_0_g77110 );
				half Element_Remap_A74_g77104 = saturate( ( ( temp_output_9_0_g77110 / ( _MainTexAlphaRemap.y - temp_output_7_0_g77110 ) ) + 0.0001 ) );
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half Element_Params_A1737_g77104 = _ElementParams_Instance.w;
				float clampResult17_g77108 = clamp( saturate( ( 1.0 - distance( (i.ase_texcoord1.xy*2.0 + -1.0) , float2( 0,0 ) ) ) ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g77109 = _MainTexFalloffRemap.x;
				float temp_output_9_0_g77109 = ( clampResult17_g77108 - temp_output_7_0_g77109 );
				half Element_Falloff1883_g77104 = saturate( ( ( temp_output_9_0_g77109 / ( _MainTexFalloffRemap.y - temp_output_7_0_g77109 ) ) + 0.0001 ) );
				float temp_output_7_0_g77118 = 1.0;
				float temp_output_9_0_g77118 = ( saturate( ( distance( WorldPosition , (TVE_RenderBasePositionR).xyz ) / (TVE_RenderBasePositionR).w ) ) - temp_output_7_0_g77118 );
				float lerpResult18_g77116 = lerp( 1.0 , saturate( ( temp_output_9_0_g77118 / ( _ElementVolumeFadeValue - temp_output_7_0_g77118 ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g77104 = ( _ElementIntensity * Element_Remap_A74_g77104 * Element_Params_A1737_g77104 * i.ase_color.a * Element_Falloff1883_g77104 * lerpResult18_g77116 );
				half Final_MotionAdvanced_A1439_g77104 = Element_Alpha56_g77104;
				float4 appendResult1463_g77104 = (float4(Final_MotionAdvanced_RGB1438_g77104 , Final_MotionAdvanced_A1439_g77104));
				float4 temp_output_6_0_g77123 = appendResult1463_g77104;
				half Motion_Direction1013_g77104 = _MotionDirectionMode;
				#ifdef TVE_REGISTER
				float4 staticSwitch14_g77123 = ( temp_output_6_0_g77123 + ( Motion_Direction1013_g77104 * 0.0 ) );
				#else
				float4 staticSwitch14_g77123 = temp_output_6_0_g77123;
				#endif
				
				
				finalColor = staticSwitch14_g77123;
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

			#define ASE_VERSION 19800


			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			//only defining to not throw compilation error over Unity 5.5
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_instancing
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};
			
			struct v2f
			{
				float4 vertex : SV_POSITION;
				#ifdef ASE_NEEDS_FRAG_WORLD_POSITION
				float3 worldPos : TEXCOORD0;
				#endif
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			uniform half _IsVersion;
			uniform half _IsElementShader;
			uniform half _RenderCategory;
			uniform half _ElementLayerMessage;
			uniform half _ElementLayerWarning;
			uniform half _ElementLayerMask;
			uniform half _ElementMessage;
			uniform half4 _MainTexColorRemap;
			uniform half _RaycastLayerMask;
			uniform half _RaycastDistanceMaxValue;
			uniform half _ElementRaycastMode;
			uniform half _FadeEnd;
			uniform half _SpaceTexture;
			uniform half _FadeCategory;
			uniform half _ElementCategory;
			uniform half _ElementEnd;
			uniform half _RenderEnd;
			uniform float _SpeedTresholdValue;
			uniform half4 _motion_direction_mode;
			uniform sampler2D _MainTex;
			uniform float _ElementInvertMode;
			uniform sampler2D _MotionTex;
			uniform float3 TVE_WorldOrigin;
			uniform half _MotionTillingValue;
			uniform half4 TVE_TimeParams;
			uniform half _MotionSpeedValue;
			uniform half _MotionPhaseValue;
			uniform half _MotionNoiseValue;
			uniform float _ElementIntensity;
			uniform half4 _MainTexAlphaRemap;
			uniform half4 _MainTexFalloffRemap;
			uniform half4 TVE_RenderBasePositionR;
			uniform float _ElementVolumeFadeValue;
			uniform float _ElementVolumeFadeMode;
			UNITY_INSTANCING_BUFFER_START(HiddenBOXOPHOBICTheVisualEngineElementsFlowInteractionLegacy)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr HiddenBOXOPHOBICTheVisualEngineElementsFlowInteractionLegacy
			UNITY_INSTANCING_BUFFER_END(HiddenBOXOPHOBICTheVisualEngineElementsFlowInteractionLegacy)

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				o.ase_texcoord1 = v.ase_texcoord;
				o.ase_color = v.color;
				o.ase_texcoord2 = v.ase_texcoord1;
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
				float3 ase_objectScale = float3( length( unity_ObjectToWorld[ 0 ].xyz ), length( unity_ObjectToWorld[ 1 ].xyz ), length( unity_ObjectToWorld[ 2 ].xyz ) );
				half2 Direction_Transform1406_g77104 = (( mul( unity_ObjectToWorld, float4( float3(0,0,1) , 0.0 ) ).xyz / ase_objectScale )).xz;
				half4 MainTex_RGBA587_g77104 = tex2D( _MainTex, ( 1.0 - i.ase_texcoord1.xy ) );
				float3 temp_cast_2 = (0.0001).xxx;
				float3 temp_cast_3 = (0.9999).xxx;
				float3 clampResult17_g77113 = clamp( (MainTex_RGBA587_g77104).rgb , temp_cast_2 , temp_cast_3 );
				float temp_output_7_0_g77111 = _MainTexColorRemap.x;
				float3 temp_cast_4 = (temp_output_7_0_g77111).xxx;
				float3 temp_output_9_0_g77111 = ( clampResult17_g77113 - temp_cast_4 );
				float3 temp_output_1765_0_g77104 = saturate( ( temp_output_9_0_g77111 / ( _MainTexColorRemap.y - temp_output_7_0_g77111 ) ) );
				half Element_Remap_R73_g77104 = (temp_output_1765_0_g77104).x;
				half Element_Remap_G265_g77104 = (temp_output_1765_0_g77104).y;
				float3 appendResult274_g77104 = (float3((Element_Remap_R73_g77104*2.0 + -1.0) , 0.0 , (Element_Remap_G265_g77104*2.0 + -1.0)));
				float3 break281_g77104 = ( mul( unity_ObjectToWorld, float4( appendResult274_g77104 , 0.0 ) ).xyz / ase_objectScale );
				float2 appendResult1403_g77104 = (float2(break281_g77104.x , break281_g77104.z));
				half2 Direction_Texture284_g77104 = appendResult1403_g77104;
				float2 appendResult1404_g77104 = (float2(i.ase_color.r , i.ase_color.g));
				half2 Direction_VertexColor1150_g77104 = (appendResult1404_g77104*2.0 + -1.0);
				float2 appendResult1382_g77104 = (float2(i.ase_texcoord1.z , i.ase_texcoord2.x));
				half2 Direction_Velocity1394_g77104 = ( appendResult1382_g77104 / i.ase_texcoord2.y );
				float2 temp_output_1452_0_g77104 = ( ( _motion_direction_mode.x * Direction_Transform1406_g77104 ) + ( _motion_direction_mode.y * Direction_Texture284_g77104 ) + ( _motion_direction_mode.z * Direction_VertexColor1150_g77104 ) + ( _motion_direction_mode.w * Direction_Velocity1394_g77104 ) );
				half Element_InvertMode489_g77104 = _ElementInvertMode;
				float2 lerpResult1468_g77104 = lerp( temp_output_1452_0_g77104 , -temp_output_1452_0_g77104 , Element_InvertMode489_g77104);
				half2 Direction_Advanced1454_g77104 = lerpResult1468_g77104;
				half2 Motion_Coords2098_g77104 = -(( WorldPosition - TVE_WorldOrigin )).xz;
				half2 Motion_Tilling1409_g77104 = ( Motion_Coords2098_g77104 * 0.005 * _MotionTillingValue );
				float2 temp_output_3_0_g77124 = Motion_Tilling1409_g77104;
				float2 temp_output_21_0_g77124 = Direction_Advanced1454_g77104;
				float mulTime113_g77127 = _Time.y * 0.015;
				float lerpResult128_g77127 = lerp( mulTime113_g77127 , ( ( mulTime113_g77127 * TVE_TimeParams.x ) + TVE_TimeParams.y ) , TVE_TimeParams.w);
				float temp_output_15_0_g77124 = (lerpResult128_g77127*_MotionSpeedValue + _MotionPhaseValue);
				float temp_output_23_0_g77124 = frac( temp_output_15_0_g77124 );
				float4 lerpResult39_g77124 = lerp( tex2D( _MotionTex, ( temp_output_3_0_g77124 + ( temp_output_21_0_g77124 * temp_output_23_0_g77124 ) ) ) , tex2D( _MotionTex, ( temp_output_3_0_g77124 + ( temp_output_21_0_g77124 * frac( ( temp_output_15_0_g77124 + 0.5 ) ) ) ) ) , ( abs( ( temp_output_23_0_g77124 - 0.5 ) ) / 0.5 ));
				float4 temp_output_1423_0_g77104 = lerpResult39_g77124;
				half2 Motion_FlowRG1427_g77104 = (temp_output_1423_0_g77104).rg;
				half Motion_Noise2056_g77104 = _MotionNoiseValue;
				float2 lerpResult2141_g77104 = lerp( (Direction_Advanced1454_g77104*0.5 + 0.5) , Motion_FlowRG1427_g77104 , Motion_Noise2056_g77104);
				half Motion_FlowA2144_g77104 = (temp_output_1423_0_g77104).a;
				float3 appendResult1436_g77104 = (float3(lerpResult2141_g77104 , ( saturate( ( Motion_Noise2056_g77104 * 2.0 ) ) * Motion_FlowA2144_g77104 )));
				half3 Final_MotionAdvanced_RGB1438_g77104 = appendResult1436_g77104;
				half3 Input_Color94_g77140 = Final_MotionAdvanced_RGB1438_g77104;
				half3 Element_Valid47_g77140 = ( Input_Color94_g77140 * Input_Color94_g77140 );
				float clampResult17_g77114 = clamp( (MainTex_RGBA587_g77104).a , 0.0001 , 0.9999 );
				float temp_output_7_0_g77110 = _MainTexAlphaRemap.x;
				float temp_output_9_0_g77110 = ( clampResult17_g77114 - temp_output_7_0_g77110 );
				half Element_Remap_A74_g77104 = saturate( ( ( temp_output_9_0_g77110 / ( _MainTexAlphaRemap.y - temp_output_7_0_g77110 ) ) + 0.0001 ) );
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half Element_Params_A1737_g77104 = _ElementParams_Instance.w;
				float clampResult17_g77108 = clamp( saturate( ( 1.0 - distance( (i.ase_texcoord1.xy*2.0 + -1.0) , float2( 0,0 ) ) ) ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g77109 = _MainTexFalloffRemap.x;
				float temp_output_9_0_g77109 = ( clampResult17_g77108 - temp_output_7_0_g77109 );
				half Element_Falloff1883_g77104 = saturate( ( ( temp_output_9_0_g77109 / ( _MainTexFalloffRemap.y - temp_output_7_0_g77109 ) ) + 0.0001 ) );
				float temp_output_7_0_g77118 = 1.0;
				float temp_output_9_0_g77118 = ( saturate( ( distance( WorldPosition , (TVE_RenderBasePositionR).xyz ) / (TVE_RenderBasePositionR).w ) ) - temp_output_7_0_g77118 );
				float lerpResult18_g77116 = lerp( 1.0 , saturate( ( temp_output_9_0_g77118 / ( _ElementVolumeFadeValue - temp_output_7_0_g77118 ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g77104 = ( _ElementIntensity * Element_Remap_A74_g77104 * Element_Params_A1737_g77104 * i.ase_color.a * Element_Falloff1883_g77104 * lerpResult18_g77116 );
				half Final_MotionAdvanced_A1439_g77104 = Element_Alpha56_g77104;
				half Input_Alpha48_g77140 = Final_MotionAdvanced_A1439_g77104;
				float4 appendResult58_g77140 = (float4(Element_Valid47_g77140 , Input_Alpha48_g77140));
				
				
				finalColor = appendResult58_g77140;
				return finalColor;
			}
			ENDCG
		}
	}
	CustomEditor "TVEShaderGUIElement"
	
	Fallback Off
}
/*ASEBEGIN
Version=19800
Node;AmplifyShaderEditor.FunctionNode;639;-640,-768;Inherit;False;Element Push;1;;77101;daf80be7c77d54d4bb4554e32ce03c7a;0;0;1;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;416;-64,-1280;Inherit;False;Element Compile;-1;;77103;5302407fc6d65554791e558e67d59358;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;636;-640,-1280;Half;False;Property;_ElementMessage;Element Message;0;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use the Motion elements to control the wind intensity locally. Element Texture R and Particle Color R are used as value multipliers. Element Texture A and Particle Color A are used as alpha masks., 0, 15);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;638;-384,-768;Inherit;False;Element Shader;10;;77104;0e972c73cae2ee54ea51acc9738801d0;12,477,2,1778,2,478,0,1824,0,1814,3,145,3,1784,3,481,3,1933,1,1935,1,1904,0,1907,1;1;1974;FLOAT;0;False;2;FLOAT4;0;FLOAT4;1779
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;417;-64,-768;Float;False;True;-1;2;TVEShaderGUIElement;100;16;Hidden/BOXOPHOBIC/The Visual Engine/Elements/Flow Interaction (Legacy);f4f273c3bb6262d4396be458405e60f9;True;VolumePass;0;0;VolumePass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;DisableBatching=True=DisableBatching;False;False;0;True;True;2;5;False;;10;False;;2;5;False;;10;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;True;True;True;True;False;True;0;False;_render_colormask;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;False;True;2;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;2;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;418;-64,-640;Float;False;False;-1;2;ASEMaterialInspector;100;16;New Amplify Shader;f4f273c3bb6262d4396be458405e60f9;True;VisualPass;0;1;VisualPass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;False;False;0;True;True;2;5;False;;10;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;False;True;2;False;0;;0;0;Standard;0;False;0
WireConnection;638;1974;639;4
WireConnection;417;0;638;0
WireConnection;418;0;638;1779
ASEEND*/
//CHKSM=6C2A3EDF2CD75F80F905E7CA2A56C03756E4DED1