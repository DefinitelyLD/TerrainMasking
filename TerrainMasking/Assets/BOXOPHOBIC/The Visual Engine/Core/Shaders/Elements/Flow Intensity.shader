// Upgrade NOTE: upgraded instancing buffer 'BOXOPHOBICTheVisualEngineElementsFlowIntensity' to new syntax.

// Made with Amplify Shader Editor v1.9.8
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "BOXOPHOBIC/The Visual Engine/Elements/Flow Intensity"
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
		[StyledMask(Flow Layers, Default 0 Layer_1 1 Layer_2 2 Layer_3 3 Layer_4 4 Layer_5 5 Layer_6 6 Layer_7 7 Layer_8 8, 0, 0)]_ElementLayerMask("Render Layer", Float) = 1
		[HideInInspector]_ElementParams("Render Params", Vector) = (1,1,1,1)
		[Enum(Constant,0,Seasons,1)]_ElementMode("Render Mode", Float) = 0
		[Enum(Multiply,0,Additive,1)]_ElementBlendA("Render Blend", Float) = 0
		[StyledSpace(10)]_RenderEnd("[ Render End ]", Float) = 0
		[StyledCategory(Element Settings, true, 0, 10)]_ElementCategory("[ Element Category ]", Float) = 1
		[NoScaleOffset][StyledTextureSingleLine]_MainTex("Element Texture", 2D) = "white" {}
		[StyledSpace(10)]_SpaceTexture("#SpaceTexture", Float) = 0
		[StyledRemapSlider]_MainTexColorRemap("Element Value", Vector) = (0,1,0,0)
		[StyledRemapSlider]_MainTexAlphaRemap("Element Alpha", Vector) = (0,1,0,0)
		[StyledRemapSlider]_MainTexFalloffRemap("Element Falloff", Vector) = (0,0,0,0)
		[Space(10)]_MainValue("Element Value", Range( 0 , 1)) = 1
		[Space(10)]_AdditionalValue1("Winter Value", Range( 0 , 1)) = 1
		_AdditionalValue2("Spring Value", Range( 0 , 1)) = 1
		_AdditionalValue3("Summer Value", Range( 0 , 1)) = 1
		_AdditionalValue4("Autumn Value", Range( 0 , 1)) = 1
		[Space(10)][StyledRemapSlider]_SeasonRemap("Seasons Curve", Vector) = (0,1,0,0)
		[Space(10)]_SpeedTresholdValue("Particle Speed Treshold", Float) = 10
		[StyledSpace(10)]_ElementEnd("[ Element End ]", Float) = 0
		[StyledCategory(Fading Settings, true, 0, 10)]_FadeCategory("[ Fade Category ]", Float) = 1
		[Enum(Off,0,On,1)]_ElementVolumeFadeMode("Bounds Fade", Float) = 0
		_ElementVolumeFadeValue("Bounds Fade Blend", Range( 0 , 1)) = 0.75
		[HDR][Enum(Off,0,On,1)][Space(10)]_ElementRaycastMode("Raycast Fade", Float) = 0
		[StyledLayers()]_RaycastLayerMask("Raycast Layer", Float) = 1
		_RaycastDistanceMaxValue("Raycast Limit", Float) = 2
		[StyledSpace(10)]_FadeEnd("[ Fade End ]", Float) = 0
		[HideInInspector]_render_src("_render_src", Float) = 2
		[HideInInspector]_render_dst("_render_dst", Float) = 0

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
			Blend One Zero, [_render_src] [_render_dst]
			AlphaToMask Off
			Cull Back
			ColorMask A
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
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
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
			uniform float _render_src;
			uniform float _render_dst;
			uniform half _MainValue;
			uniform half4 TVE_SeasonOption;
			uniform half _AdditionalValue1;
			uniform half _AdditionalValue2;
			uniform half TVE_SeasonLerp;
			uniform half4 _SeasonRemap;
			uniform half _AdditionalValue3;
			uniform half _AdditionalValue4;
			uniform float _ElementMode;
			uniform sampler2D _MainTex;
			uniform float _ElementIntensity;
			uniform half4 _MainTexAlphaRemap;
			uniform half4 _MainTexFalloffRemap;
			uniform half4 TVE_RenderBasePositionR;
			uniform float _ElementVolumeFadeValue;
			uniform float _ElementVolumeFadeMode;
			uniform half _ElementBlendA;
			UNITY_INSTANCING_BUFFER_START(BOXOPHOBICTheVisualEngineElementsFlowIntensity)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr BOXOPHOBICTheVisualEngineElementsFlowIntensity
			UNITY_INSTANCING_BUFFER_END(BOXOPHOBICTheVisualEngineElementsFlowIntensity)

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				half TVE_SeasonOptions_X50_g77258 = TVE_SeasonOption.x;
				half Value_Winter158_g77258 = _AdditionalValue1;
				half Value_Spring159_g77258 = _AdditionalValue2;
				float temp_output_7_0_g77274 = _SeasonRemap.x;
				float temp_output_9_0_g77274 = ( TVE_SeasonLerp - temp_output_7_0_g77274 );
				half TVE_SeasonLerp54_g77258 = saturate( saturate( ( temp_output_9_0_g77274 / ( _SeasonRemap.y - temp_output_7_0_g77274 ) ) ) );
				float lerpResult168_g77258 = lerp( Value_Winter158_g77258 , Value_Spring159_g77258 , TVE_SeasonLerp54_g77258);
				half TVE_SeasonOptions_Y51_g77258 = TVE_SeasonOption.y;
				half Value_Summer160_g77258 = _AdditionalValue3;
				float lerpResult167_g77258 = lerp( Value_Spring159_g77258 , Value_Summer160_g77258 , TVE_SeasonLerp54_g77258);
				half TVE_SeasonOptions_Z52_g77258 = TVE_SeasonOption.z;
				half Value_Autumn161_g77258 = _AdditionalValue4;
				float lerpResult166_g77258 = lerp( Value_Summer160_g77258 , Value_Autumn161_g77258 , TVE_SeasonLerp54_g77258);
				half TVE_SeasonOptions_W53_g77258 = TVE_SeasonOption.w;
				float lerpResult165_g77258 = lerp( Value_Autumn161_g77258 , Value_Winter158_g77258 , TVE_SeasonLerp54_g77258);
				float vertexToFrag11_g77260 = ( ( ( TVE_SeasonOptions_X50_g77258 * lerpResult168_g77258 ) + ( TVE_SeasonOptions_Y51_g77258 * lerpResult167_g77258 ) ) + ( ( TVE_SeasonOptions_Z52_g77258 * lerpResult166_g77258 ) + ( TVE_SeasonOptions_W53_g77258 * lerpResult165_g77258 ) ) );
				o.ase_texcoord1.x = vertexToFrag11_g77260;
				
				o.ase_texcoord1.yz = v.ase_texcoord.xy;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
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
				half Value_Main157_g77258 = _MainValue;
				float vertexToFrag11_g77260 = i.ase_texcoord1.x;
				half Value_Seasons1721_g77258 = vertexToFrag11_g77260;
				half Element_Mode55_g77258 = _ElementMode;
				float lerpResult181_g77258 = lerp( Value_Main157_g77258 , Value_Seasons1721_g77258 , Element_Mode55_g77258);
				half4 MainTex_RGBA587_g77258 = tex2D( _MainTex, ( 1.0 - i.ase_texcoord1.yz ) );
				float3 temp_cast_0 = (0.0001).xxx;
				float3 temp_cast_1 = (0.9999).xxx;
				float3 clampResult17_g77275 = clamp( (MainTex_RGBA587_g77258).rgb , temp_cast_0 , temp_cast_1 );
				float temp_output_7_0_g77265 = _MainTexColorRemap.x;
				float3 temp_cast_2 = (temp_output_7_0_g77265).xxx;
				float3 temp_output_9_0_g77265 = ( clampResult17_g77275 - temp_cast_2 );
				float3 temp_output_1765_0_g77258 = saturate( ( temp_output_9_0_g77265 / ( _MainTexColorRemap.y - temp_output_7_0_g77265 ) ) );
				half Element_Remap_R73_g77258 = (temp_output_1765_0_g77258).x;
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half Element_Params_R1738_g77258 = _ElementParams_Instance.x;
				half Element_Value1744_g77258 = ( Element_Remap_R73_g77258 * Element_Params_R1738_g77258 * i.ase_color.r );
				half Final_Extras_RGB213_g77258 = ( lerpResult181_g77258 * Element_Value1744_g77258 );
				float clampResult17_g77276 = clamp( (MainTex_RGBA587_g77258).a , 0.0001 , 0.9999 );
				float temp_output_7_0_g77264 = _MainTexAlphaRemap.x;
				float temp_output_9_0_g77264 = ( clampResult17_g77276 - temp_output_7_0_g77264 );
				half Element_Remap_A74_g77258 = saturate( ( ( temp_output_9_0_g77264 / ( _MainTexAlphaRemap.y - temp_output_7_0_g77264 ) ) + 0.0001 ) );
				half Element_Params_A1737_g77258 = _ElementParams_Instance.w;
				float clampResult17_g77262 = clamp( saturate( ( 1.0 - distance( (i.ase_texcoord1.yz*2.0 + -1.0) , float2( 0,0 ) ) ) ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g77263 = _MainTexFalloffRemap.x;
				float temp_output_9_0_g77263 = ( clampResult17_g77262 - temp_output_7_0_g77263 );
				half Element_Falloff1883_g77258 = saturate( ( ( temp_output_9_0_g77263 / ( _MainTexFalloffRemap.y - temp_output_7_0_g77263 ) ) + 0.0001 ) );
				float temp_output_7_0_g77280 = 1.0;
				float temp_output_9_0_g77280 = ( saturate( ( distance( WorldPosition , (TVE_RenderBasePositionR).xyz ) / (TVE_RenderBasePositionR).w ) ) - temp_output_7_0_g77280 );
				float lerpResult18_g77278 = lerp( 1.0 , saturate( ( temp_output_9_0_g77280 / ( _ElementVolumeFadeValue - temp_output_7_0_g77280 ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g77258 = ( _ElementIntensity * Element_Remap_A74_g77258 * Element_Params_A1737_g77258 * i.ase_color.a * Element_Falloff1883_g77258 * lerpResult18_g77278 );
				float lerpResult1634_g77258 = lerp( 1.0 , Final_Extras_RGB213_g77258 , Element_Alpha56_g77258);
				half Element_BlendA918_g77258 = _ElementBlendA;
				float lerpResult933_g77258 = lerp( lerpResult1634_g77258 , ( Final_Extras_RGB213_g77258 * Element_Alpha56_g77258 ) , Element_BlendA918_g77258);
				half Final_Extras_Blend211_g77258 = lerpResult933_g77258;
				float4 appendResult1732_g77258 = (float4(Final_Extras_RGB213_g77258 , 0.0 , 0.0 , Final_Extras_Blend211_g77258));
				
				
				finalColor = appendResult1732_g77258;
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
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_POSITION


			struct appdata
			{
				float4 vertex : POSITION;
				float4 color : COLOR;
				float4 ase_texcoord : TEXCOORD0;
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
			uniform float _render_src;
			uniform float _render_dst;
			uniform half _MainValue;
			uniform half4 TVE_SeasonOption;
			uniform half _AdditionalValue1;
			uniform half _AdditionalValue2;
			uniform half TVE_SeasonLerp;
			uniform half4 _SeasonRemap;
			uniform half _AdditionalValue3;
			uniform half _AdditionalValue4;
			uniform float _ElementMode;
			uniform sampler2D _MainTex;
			uniform float _ElementIntensity;
			uniform half4 _MainTexAlphaRemap;
			uniform half4 _MainTexFalloffRemap;
			uniform half4 TVE_RenderBasePositionR;
			uniform float _ElementVolumeFadeValue;
			uniform float _ElementVolumeFadeMode;
			UNITY_INSTANCING_BUFFER_START(BOXOPHOBICTheVisualEngineElementsFlowIntensity)
				UNITY_DEFINE_INSTANCED_PROP(half4, _ElementParams)
#define _ElementParams_arr BOXOPHOBICTheVisualEngineElementsFlowIntensity
			UNITY_INSTANCING_BUFFER_END(BOXOPHOBICTheVisualEngineElementsFlowIntensity)

			
			v2f vert ( appdata v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
				UNITY_TRANSFER_INSTANCE_ID(v, o);

				half TVE_SeasonOptions_X50_g77258 = TVE_SeasonOption.x;
				half Value_Winter158_g77258 = _AdditionalValue1;
				half Value_Spring159_g77258 = _AdditionalValue2;
				float temp_output_7_0_g77274 = _SeasonRemap.x;
				float temp_output_9_0_g77274 = ( TVE_SeasonLerp - temp_output_7_0_g77274 );
				half TVE_SeasonLerp54_g77258 = saturate( saturate( ( temp_output_9_0_g77274 / ( _SeasonRemap.y - temp_output_7_0_g77274 ) ) ) );
				float lerpResult168_g77258 = lerp( Value_Winter158_g77258 , Value_Spring159_g77258 , TVE_SeasonLerp54_g77258);
				half TVE_SeasonOptions_Y51_g77258 = TVE_SeasonOption.y;
				half Value_Summer160_g77258 = _AdditionalValue3;
				float lerpResult167_g77258 = lerp( Value_Spring159_g77258 , Value_Summer160_g77258 , TVE_SeasonLerp54_g77258);
				half TVE_SeasonOptions_Z52_g77258 = TVE_SeasonOption.z;
				half Value_Autumn161_g77258 = _AdditionalValue4;
				float lerpResult166_g77258 = lerp( Value_Summer160_g77258 , Value_Autumn161_g77258 , TVE_SeasonLerp54_g77258);
				half TVE_SeasonOptions_W53_g77258 = TVE_SeasonOption.w;
				float lerpResult165_g77258 = lerp( Value_Autumn161_g77258 , Value_Winter158_g77258 , TVE_SeasonLerp54_g77258);
				float vertexToFrag11_g77260 = ( ( ( TVE_SeasonOptions_X50_g77258 * lerpResult168_g77258 ) + ( TVE_SeasonOptions_Y51_g77258 * lerpResult167_g77258 ) ) + ( ( TVE_SeasonOptions_Z52_g77258 * lerpResult166_g77258 ) + ( TVE_SeasonOptions_W53_g77258 * lerpResult165_g77258 ) ) );
				o.ase_texcoord1.x = vertexToFrag11_g77260;
				
				o.ase_texcoord1.yz = v.ase_texcoord.xy;
				o.ase_color = v.color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.w = 0;
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
				half Value_Main157_g77258 = _MainValue;
				float vertexToFrag11_g77260 = i.ase_texcoord1.x;
				half Value_Seasons1721_g77258 = vertexToFrag11_g77260;
				half Element_Mode55_g77258 = _ElementMode;
				float lerpResult181_g77258 = lerp( Value_Main157_g77258 , Value_Seasons1721_g77258 , Element_Mode55_g77258);
				half4 MainTex_RGBA587_g77258 = tex2D( _MainTex, ( 1.0 - i.ase_texcoord1.yz ) );
				float3 temp_cast_0 = (0.0001).xxx;
				float3 temp_cast_1 = (0.9999).xxx;
				float3 clampResult17_g77275 = clamp( (MainTex_RGBA587_g77258).rgb , temp_cast_0 , temp_cast_1 );
				float temp_output_7_0_g77265 = _MainTexColorRemap.x;
				float3 temp_cast_2 = (temp_output_7_0_g77265).xxx;
				float3 temp_output_9_0_g77265 = ( clampResult17_g77275 - temp_cast_2 );
				float3 temp_output_1765_0_g77258 = saturate( ( temp_output_9_0_g77265 / ( _MainTexColorRemap.y - temp_output_7_0_g77265 ) ) );
				half Element_Remap_R73_g77258 = (temp_output_1765_0_g77258).x;
				half4 _ElementParams_Instance = UNITY_ACCESS_INSTANCED_PROP(_ElementParams_arr, _ElementParams);
				half Element_Params_R1738_g77258 = _ElementParams_Instance.x;
				half Element_Value1744_g77258 = ( Element_Remap_R73_g77258 * Element_Params_R1738_g77258 * i.ase_color.r );
				half Final_Extras_RGB213_g77258 = ( lerpResult181_g77258 * Element_Value1744_g77258 );
				float3 temp_cast_3 = (Final_Extras_RGB213_g77258).xxx;
				half3 Input_Color94_g77282 = temp_cast_3;
				float3 break68_g77282 = Input_Color94_g77282;
				float clampResult80_g77282 = clamp( max( max( break68_g77282.x , break68_g77282.y ) , break68_g77282.z ) , 0.1 , 10000.0 );
				float4 color2148_g77258 = IsGammaSpace() ? float4(0.654902,0.9596435,1,0) : float4(0.3864295,0.9106393,1,0);
				half3 Input_Tint76_g77282 = (color2148_g77258).rgb;
				half3 Element_Valid47_g77282 = ( clampResult80_g77282 * Input_Tint76_g77282 );
				float clampResult17_g77276 = clamp( (MainTex_RGBA587_g77258).a , 0.0001 , 0.9999 );
				float temp_output_7_0_g77264 = _MainTexAlphaRemap.x;
				float temp_output_9_0_g77264 = ( clampResult17_g77276 - temp_output_7_0_g77264 );
				half Element_Remap_A74_g77258 = saturate( ( ( temp_output_9_0_g77264 / ( _MainTexAlphaRemap.y - temp_output_7_0_g77264 ) ) + 0.0001 ) );
				half Element_Params_A1737_g77258 = _ElementParams_Instance.w;
				float clampResult17_g77262 = clamp( saturate( ( 1.0 - distance( (i.ase_texcoord1.yz*2.0 + -1.0) , float2( 0,0 ) ) ) ) , 0.0001 , 0.9999 );
				float temp_output_7_0_g77263 = _MainTexFalloffRemap.x;
				float temp_output_9_0_g77263 = ( clampResult17_g77262 - temp_output_7_0_g77263 );
				half Element_Falloff1883_g77258 = saturate( ( ( temp_output_9_0_g77263 / ( _MainTexFalloffRemap.y - temp_output_7_0_g77263 ) ) + 0.0001 ) );
				float temp_output_7_0_g77280 = 1.0;
				float temp_output_9_0_g77280 = ( saturate( ( distance( WorldPosition , (TVE_RenderBasePositionR).xyz ) / (TVE_RenderBasePositionR).w ) ) - temp_output_7_0_g77280 );
				float lerpResult18_g77278 = lerp( 1.0 , saturate( ( temp_output_9_0_g77280 / ( _ElementVolumeFadeValue - temp_output_7_0_g77280 ) ) ) , _ElementVolumeFadeMode);
				half Element_Alpha56_g77258 = ( _ElementIntensity * Element_Remap_A74_g77258 * Element_Params_A1737_g77258 * i.ase_color.a * Element_Falloff1883_g77258 * lerpResult18_g77278 );
				half Final_MotionWind_A2053_g77258 = Element_Alpha56_g77258;
				half Input_Alpha48_g77282 = Final_MotionWind_A2053_g77258;
				float4 appendResult58_g77282 = (float4(Element_Valid47_g77282 , Input_Alpha48_g77282));
				
				
				finalColor = appendResult58_g77282;
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
Node;AmplifyShaderEditor.FunctionNode;642;-640,-768;Inherit;False;Element Flow;1;;77218;c08e6ab33dbacc04780022d2dbd4852d;0;0;1;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;416;-64,-1280;Inherit;False;Element Compile;-1;;77220;5302407fc6d65554791e558e67d59358;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;636;-640,-1280;Half;False;Property;_ElementMessage;Element Message;0;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use the Motion elements to control the wind intensity locally. Element Texture R and Particle Color R are used as value multipliers. Element Texture A and Particle Color A are used as alpha masks., 0, 15);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;644;-640,-1152;Inherit;False;Property;_render_src;_render_src;71;1;[HideInInspector];Create;True;0;0;0;True;0;False;2;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;645;-480,-1152;Inherit;False;Property;_render_dst;_render_dst;72;1;[HideInInspector];Create;True;0;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;643;-384,-768;Inherit;False;Element Shader;10;;77258;0e972c73cae2ee54ea51acc9738801d0;12,477,2,1778,2,478,0,1824,0,1814,3,145,3,1784,0,481,0,1933,1,1935,1,1904,0,1907,1;1;1974;FLOAT;0;False;2;FLOAT4;0;FLOAT4;1779
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;417;-64,-768;Float;False;True;-1;2;TVEShaderGUIElement;100;15;BOXOPHOBIC/The Visual Engine/Elements/Flow Intensity;f4f273c3bb6262d4396be458405e60f9;True;VolumePass;0;0;VolumePass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;DisableBatching=True=DisableBatching;False;False;0;True;True;0;5;False;;10;False;;2;5;True;_render_src;10;True;_render_dst;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;True;True;False;False;False;True;0;False;_render_colormask;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;False;True;2;False;0;;0;0;Standard;1;Vertex Position,InvertActionOnDeselection;1;0;0;2;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;418;-64,-640;Float;False;False;-1;2;ASEMaterialInspector;100;15;New Amplify Shader;f4f273c3bb6262d4396be458405e60f9;True;VisualPass;0;1;VisualPass;2;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;RenderType=Opaque=RenderType;False;False;0;True;True;2;5;False;;10;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;True;True;2;False;;True;0;False;;True;False;0;False;;0;False;;False;True;2;False;0;;0;0;Standard;0;False;0
WireConnection;643;1974;642;4
WireConnection;417;0;643;0
WireConnection;418;0;643;1779
ASEEND*/
//CHKSM=B4B052BA930503A7CC252292476ACD5B476014F3