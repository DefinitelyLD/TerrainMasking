// Made with Amplify Shader Editor v1.9.7.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Hidden/BOXOPHOBIC/The Visual Engine/Helpers/Debug"
{
	Properties
	{
		[StyledBanner(Debug)]_Banner("Banner", Float) = 0
		[StyledEnum(NULL, Vertex_R 0 Vertex_G 1 Vertex_B 2 Vertex_A 3 Branch 4 Leaves 5 Height 6 Sphere 7 UV0_Y 8, 0, 0)]_MotionTinyMaskMode("Motion 01 Anim Mask", Float) = 4
		[StyledEnum(NULL, Vertex_R 0 Vertex_G 1 Vertex_B 2 Vertex_A 3 Branch 4 Leaves 5 Height 6 Sphere 7 UV0_Y 8, 0, 0)]_MotionBaseMaskMode("Motion 01 Anim Mask", Float) = 3
		[StyledEnum(NULL, Vertex_R 0 Vertex_G 1 Vertex_B 2 Vertex_A 3 Branch 4 Leaves 5 Height 6 Sphere 7 UV0_Y 8, 0, 0)]_MotionSmallMaskMode("Motion 01 Anim Mask", Float) = 4
		[StyledRemapSlider]_MotionTinyMaskRemap("Motion 01 Anim Mask", Vector) = (0,1,0,0)
		[StyledRemapSlider]_MotionBaseMaskRemap("Motion 01 Anim Mask", Vector) = (0,1,0,0)
		[StyledRemapSlider]_MotionSmallMaskRemap("Motion 01 Anim Mask", Vector) = (0,1,0,0)
		[HideInInspector]_motion_base_proc_mode("_motion_base_proc_mode", Vector) = (0,0,0,0)
		[HideInInspector]_motion_tiny_proc_mode("_motion_tiny_proc_mode", Vector) = (0,0,0,0)
		[HideInInspector]_motion_small_proc_mode("_motion_small_proc_mode", Vector) = (0,0,0,0)
		[HideInInspector]_motion_tiny_vert_mode("_motion_tiny_vert_mode", Vector) = (0,0,0,0)
		[HideInInspector]_motion_small_vert_mode("_motion_small_vert_mode", Vector) = (0,0,0,0)
		[HideInInspector]_motion_base_vert_mode("_motion_base_vert_mode", Vector) = (0,0,0,0)
		_ObjectRadiusValue("Object Radius Value", Range( 0 , 50)) = 1
		[HideInInspector]_motion_tiny_mask_mode("_motion_tiny_mask_mode", Float) = 0
		[HideInInspector]_motion_small_mask_mode("_motion_small_mask_mode", Float) = 0
		[HideInInspector]_motion_base_mask_mode("_motion_base_mask_mode", Float) = 0
		_ObjectHeightValue("Object Height Value", Range( 0 , 50)) = 1
		[HideInInspector]_object_phase_mode("_object_phase_mode", Vector) = (0,0,0,0)
		_IsVertexShader("_IsVertexShader", Float) = 0
		_IsSimpleShader("_IsSimpleShader", Float) = 0
		[HideInInspector]_IsTVEShader("_IsTVEShader", Float) = 0
		_IsStandardShader("_IsStandardShader", Float) = 0
		_IsSubsurfaceShader("_IsSubsurfaceShader", Float) = 0
		_IsImpostorShader("_IsImpostorShader", Float) = 0
		_IsCoreShader("_IsCoreShader", Float) = 0
		[NoScaleOffset]_MainNormalTex("_MainNormalTex", 2D) = "black" {}
		[NoScaleOffset]_EmissiveTex("_EmissiveTex", 2D) = "black" {}
		[NoScaleOffset]_SecondMaskTex("_SecondMaskTex", 2D) = "black" {}
		[NoScaleOffset]_SecondNormalTex("_SecondNormalTex", 2D) = "black" {}
		[NoScaleOffset]_SecondAlbedoTex("_SecondAlbedoTex", 2D) = "black" {}
		[NoScaleOffset]_MainAlbedoTex("_MainAlbedoTex", 2D) = "black" {}
		[NoScaleOffset]_MainMaskTex("_MainMaskTex", 2D) = "black" {}
		_RenderClip("_RenderClip", Float) = 0
		_IsElementShader("_IsElementShader", Float) = 0
		_IsHelperShader("_IsHelperShader", Float) = 0
		_MainAlphaClipValue("_MainAlphaClipValue", Float) = 0
		_DetailMode("_DetailMode", Float) = 0
		_EmissiveCat("_EmissiveCat", Float) = 0
		[HDR]_EmissiveColor("_EmissiveColor", Color) = (0,0,0,0)
		_IsBlanketShader("_IsBlanketShader", Float) = 0
		_IsPolygonalShader("_IsPolygonalShader", Float) = 0
		[Space(10)][StyledVector(9)]_main_coord_value("_main_coord_value", Vector) = (1,1,0,0)
		[Enum(UV 0,0,Baked,1)]_DetailCoordMode("Detail Coord", Float) = 0
		[Space(10)][StyledVector(9)]_SecondUVs("Detail UVs", Vector) = (1,1,0,0)
		[Space(10)][StyledVector(9)]_EmissiveUVs("Emissive UVs", Vector) = (1,1,0,0)
		_IsIdentifier("_IsIdentifier", Float) = 0
		_IsLiteShader("_IsLiteShader", Float) = 0
		_IsCustomShader("_IsCustomShader", Float) = 0
		[StyledMessage(Info, Use this shader to debug the original mesh or the converted mesh attributes., 0,0)]_Message("Message", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
		//[ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		//[ToggleOff] _GlossyReflections("Reflections", Float) = 1.0
	}

	SubShader
	{
		
		Tags { "RenderType"="Opaque" "Queue"="Geometry" "DisableBatching"="True" }
	LOD 0

		Cull Off
		AlphaToMask Off
		ZWrite On
		ZTest LEqual
		ColorMask RGBA
		
		Blend Off
		

		CGINCLUDE
		#pragma target 5.0

		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		ENDCG

		
		Pass
		{
			
			Name "ForwardBase"
			Tags { "LightMode"="ForwardBase" }

			Blend One Zero

			CGPROGRAM
			#define ASE_NO_AMBIENT 1
			#define ASE_VERSION 19702
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma vertex vert
			#pragma fragment frag
			#pragma multi_compile_fwdbase
			#ifndef UNITY_PASS_FORWARDBASE
				#define UNITY_PASS_FORWARDBASE
			#endif
			#include "HLSLSupport.cginc"
			#ifndef UNITY_INSTANCED_LOD_FADE
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#ifndef UNITY_INSTANCED_SH
				#define UNITY_INSTANCED_SH
			#endif
			#ifndef UNITY_INSTANCED_LIGHTMAPSTS
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			#include "AutoLight.cginc"

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local TVE_LEGACY
			#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
			#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
			#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
			#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
			#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
			#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
			#else//ASE Sampling Macros
			#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
			#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
			#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
			#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
			#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplertex,coord,lod) tex2DArraylod(tex, float4(coord,lod))
			#endif//ASE Sampling Macros
			

			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				#if defined(LIGHTMAP_ON) || (!defined(LIGHTMAP_ON) && SHADER_TARGET >= 30)
					float4 lmap : TEXCOORD0;
				#endif
				#if !defined(LIGHTMAP_ON) && UNITY_SHOULD_SAMPLE_SH
					half3 sh : TEXCOORD1;
				#endif
				#if defined(UNITY_HALF_PRECISION_FRAGMENT_SHADER_REGISTERS) && UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHTING_COORDS(2,3)
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_SHADOW_COORDS(2)
					#else
						SHADOW_COORDS(2)
					#endif
				#endif
				#ifdef ASE_FOG
					UNITY_FOG_COORDS(4)
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD8;
				#endif
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				float4 ase_texcoord11 : TEXCOORD11;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform half _Banner;
			uniform half _Message;
			uniform float _IsSimpleShader;
			uniform float _IsVertexShader;
			uniform half _IsTVEShader;
			uniform half TVE_DEBUG_Type;
			uniform float _IsCoreShader;
			uniform float _IsBlanketShader;
			uniform float _IsImpostorShader;
			uniform float _IsPolygonalShader;
			uniform float _IsLiteShader;
			uniform float _IsStandardShader;
			uniform float _IsSubsurfaceShader;
			uniform float _IsCustomShader;
			uniform float _IsIdentifier;
			uniform half TVE_DEBUG_Index;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainAlbedoTex);
			uniform half4 _main_coord_value;
			SamplerState sampler_MainAlbedoTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainNormalTex);
			SamplerState sampler_MainNormalTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainMaskTex);
			SamplerState sampler_MainMaskTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondAlbedoTex);
			uniform half _DetailCoordMode;
			uniform half4 _SecondUVs;
			SamplerState sampler_SecondAlbedoTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondNormalTex);
			SamplerState sampler_SecondNormalTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondMaskTex);
			SamplerState sampler_SecondMaskTex;
			uniform float _DetailMode;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveTex);
			uniform half4 _EmissiveUVs;
			SamplerState sampler_EmissiveTex;
			uniform float4 _EmissiveColor;
			uniform float _EmissiveCat;
			uniform half TVE_DEBUG_Min;
			uniform half TVE_DEBUG_Max;
			float4 _MainAlbedoTex_TexelSize;
			float4 _MainNormalTex_TexelSize;
			float4 _MainMaskTex_TexelSize;
			float4 _SecondAlbedoTex_TexelSize;
			float4 _SecondMaskTex_TexelSize;
			float4 _EmissiveTex_TexelSize;
			uniform float4 _MainAlbedoTex_ST;
			UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_DEBUG_MipTex);
			SamplerState samplerTVE_DEBUG_MipTex;
			uniform float4 _MainNormalTex_ST;
			uniform float4 _MainMaskTex_ST;
			uniform float4 _SecondAlbedoTex_ST;
			uniform float4 _SecondMaskTex_ST;
			uniform float4 _EmissiveTex_ST;
			uniform half TVE_DEBUG_Layer;
			uniform float TVE_CoatLayers[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_CoatBaseTex);
			uniform half4 TVE_RenderBaseCoords;
			SamplerState sampler_Linear_Clamp;
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_CoatNearTex);
			uniform half4 TVE_RenderNearCoords;
			SamplerState sampler_Linear_Repeat;
			uniform float4 TVE_RenderNearPositionR;
			uniform half TVE_RenderNearFadeValue;
			uniform half4 TVE_CoatParams;
			uniform float TVE_PaintLayers[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PaintBaseTex);
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PaintNearTex);
			uniform half4 TVE_PaintParams;
			uniform float TVE_GlowLayers[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_GlowBaseTex);
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_GlowNearTex);
			uniform half4 TVE_GlowParams;
			uniform float TVE_AtmoLayers[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_AtmoBaseTex);
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_AtmoNearTex);
			uniform half4 TVE_AtmoParams;
			uniform float TVE_FormLayers[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FormBaseTex);
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FormNearTex);
			uniform half4 TVE_FormParams;
			uniform float TVE_FlowLayers[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FlowBaseTex);
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FlowNearTex);
			uniform half4 TVE_FlowParams;
			uniform float TVE_PushLayers[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PushBaseTex);
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PushNearTex);
			uniform half4 TVE_PushParams;
			uniform half4 _object_phase_mode;
			uniform half4 _motion_base_vert_mode;
			uniform half _ObjectHeightValue;
			uniform half4 _motion_base_proc_mode;
			uniform half _ObjectRadiusValue;
			uniform half _motion_base_mask_mode;
			uniform half4 _MotionBaseMaskRemap;
			uniform half _MotionBaseMaskMode;
			uniform half4 _motion_small_vert_mode;
			uniform half4 _motion_small_proc_mode;
			uniform half _motion_small_mask_mode;
			uniform half4 _MotionSmallMaskRemap;
			uniform half _MotionSmallMaskMode;
			uniform half4 _motion_tiny_vert_mode;
			uniform half4 _motion_tiny_proc_mode;
			uniform half _motion_tiny_mask_mode;
			uniform half4 _MotionTinyMaskRemap;
			uniform half _MotionTinyMaskMode;
			uniform half TVE_DEBUG_Filter;
			uniform half TVE_DEBUG_Shading;
			uniform half TVE_DEBUG_Clip;
			uniform float _RenderClip;
			uniform float _MainAlphaClipValue;
			uniform float _IsElementShader;
			uniform float _IsHelperShader;


			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float Debug_Index464_g127014 = TVE_DEBUG_Index;
				float3 ifLocalVar40_g127015 = 0;
				if( Debug_Index464_g127014 == 0.0 )
				ifLocalVar40_g127015 = saturate( v.vertex.xyz );
				float3 ifLocalVar40_g127022 = 0;
				if( Debug_Index464_g127014 == 1.0 )
				ifLocalVar40_g127022 = v.normal;
				float3 ifLocalVar40_g127028 = 0;
				if( Debug_Index464_g127014 == 2.0 )
				ifLocalVar40_g127028 = v.tangent.xyz;
				float ifLocalVar40_g127020 = 0;
				if( Debug_Index464_g127014 == 3.0 )
				ifLocalVar40_g127020 = saturate( v.tangent.w );
				float ifLocalVar40_g127064 = 0;
				if( Debug_Index464_g127014 == 5.0 )
				ifLocalVar40_g127064 = v.ase_color.r;
				float ifLocalVar40_g127065 = 0;
				if( Debug_Index464_g127014 == 6.0 )
				ifLocalVar40_g127065 = v.ase_color.g;
				float ifLocalVar40_g127066 = 0;
				if( Debug_Index464_g127014 == 7.0 )
				ifLocalVar40_g127066 = v.ase_color.b;
				float ifLocalVar40_g127067 = 0;
				if( Debug_Index464_g127014 == 8.0 )
				ifLocalVar40_g127067 = v.ase_color.a;
				float3 appendResult1147_g127014 = (float3(v.ase_texcoord.x , v.ase_texcoord.y , 0.0));
				float3 ifLocalVar40_g127068 = 0;
				if( Debug_Index464_g127014 == 9.0 )
				ifLocalVar40_g127068 = appendResult1147_g127014;
				float3 appendResult1148_g127014 = (float3(v.texcoord1.xyzw.x , v.texcoord1.xyzw.y , 0.0));
				float3 ifLocalVar40_g127069 = 0;
				if( Debug_Index464_g127014 == 10.0 )
				ifLocalVar40_g127069 = appendResult1148_g127014;
				float3 appendResult1149_g127014 = (float3(v.texcoord2.xyzw.x , v.texcoord2.xyzw.y , 0.0));
				float3 ifLocalVar40_g127089 = 0;
				if( Debug_Index464_g127014 == 11.0 )
				ifLocalVar40_g127089 = appendResult1149_g127014;
				float4 break33_g127087 = _object_phase_mode;
				float temp_output_30_0_g127087 = ( v.ase_color.r * break33_g127087.x );
				float temp_output_29_0_g127087 = ( v.ase_color.g * break33_g127087.y );
				float temp_output_31_0_g127087 = ( v.ase_color.b * break33_g127087.z );
				float temp_output_28_0_g127087 = ( temp_output_30_0_g127087 + temp_output_29_0_g127087 + temp_output_31_0_g127087 + ( v.ase_color.a * break33_g127087.w ) );
				half Motion_PhaseMask1725_g127014 = temp_output_28_0_g127087;
				float3 hsvTorgb260_g127014 = HSVToRGB( float3(Motion_PhaseMask1725_g127014,1.0,1.0) );
				float3 gammaToLinear266_g127014 = GammaToLinearSpace( hsvTorgb260_g127014 );
				float3 ifLocalVar40_g127090 = 0;
				if( Debug_Index464_g127014 == 12.0 )
				ifLocalVar40_g127090 = gammaToLinear266_g127014;
				float4 break1821_g127014 = v.ase_color;
				float4 break33_g127585 = _motion_base_vert_mode;
				float temp_output_30_0_g127585 = ( break1821_g127014.r * break33_g127585.x );
				float temp_output_29_0_g127585 = ( break1821_g127014.g * break33_g127585.y );
				float temp_output_31_0_g127585 = ( break1821_g127014.b * break33_g127585.z );
				float temp_output_28_0_g127585 = ( temp_output_30_0_g127585 + temp_output_29_0_g127585 + temp_output_31_0_g127585 + ( break1821_g127014.a * break33_g127585.w ) );
				float temp_output_1824_0_g127014 = temp_output_28_0_g127585;
				half Bounds_Height1700_g127014 = _ObjectHeightValue;
				half Final_HeightMask1815_g127014 = saturate( ( v.vertex.xyz.y / Bounds_Height1700_g127014 ) );
				float4 break33_g127589 = _motion_base_proc_mode;
				float temp_output_30_0_g127589 = ( Final_HeightMask1815_g127014 * break33_g127589.x );
				half Bounds_Radius1702_g127014 = _ObjectRadiusValue;
				half Final_SphereMask1816_g127014 = saturate( ( length( v.vertex.xyz ) / ( Bounds_Height1700_g127014 * Bounds_Radius1702_g127014 ) ) );
				float temp_output_29_0_g127589 = ( Final_SphereMask1816_g127014 * break33_g127589.y );
				float temp_output_1834_0_g127014 = ( temp_output_30_0_g127589 + temp_output_29_0_g127589 );
				float lerpResult1887_g127014 = lerp( temp_output_1824_0_g127014 , temp_output_1834_0_g127014 , _motion_base_mask_mode);
				float clampResult17_g127582 = clamp( lerpResult1887_g127014 , 0.0001 , 0.9999 );
				float temp_output_7_0_g127583 = _MotionBaseMaskRemap.x;
				float temp_output_9_0_g127583 = ( clampResult17_g127582 - temp_output_7_0_g127583 );
				float temp_output_6_0_g127584 = saturate( ( ( temp_output_9_0_g127583 / ( _MotionBaseMaskRemap.y - temp_output_7_0_g127583 ) ) + 0.0001 ) );
				#ifdef TVE_REGISTER
				float staticSwitch14_g127584 = ( temp_output_6_0_g127584 + ( _MotionBaseMaskMode * 0.0 ) );
				#else
				float staticSwitch14_g127584 = temp_output_6_0_g127584;
				#endif
				half Motion_BaseMask1675_g127014 = staticSwitch14_g127584;
				float ifLocalVar40_g127091 = 0;
				if( Debug_Index464_g127014 == 13.0 )
				ifLocalVar40_g127091 = Motion_BaseMask1675_g127014;
				float4 break1855_g127014 = v.ase_color;
				float4 break33_g127586 = _motion_small_vert_mode;
				float temp_output_30_0_g127586 = ( break1855_g127014.r * break33_g127586.x );
				float temp_output_29_0_g127586 = ( break1855_g127014.g * break33_g127586.y );
				float temp_output_31_0_g127586 = ( break1855_g127014.b * break33_g127586.z );
				float temp_output_28_0_g127586 = ( temp_output_30_0_g127586 + temp_output_29_0_g127586 + temp_output_31_0_g127586 + ( break1855_g127014.a * break33_g127586.w ) );
				float temp_output_1845_0_g127014 = temp_output_28_0_g127586;
				float4 break33_g127590 = _motion_small_proc_mode;
				float temp_output_30_0_g127590 = ( Final_HeightMask1815_g127014 * break33_g127590.x );
				float temp_output_29_0_g127590 = ( Final_SphereMask1816_g127014 * break33_g127590.y );
				float temp_output_1849_0_g127014 = ( temp_output_30_0_g127590 + temp_output_29_0_g127590 );
				float lerpResult1889_g127014 = lerp( temp_output_1845_0_g127014 , temp_output_1849_0_g127014 , _motion_small_mask_mode);
				float enc1882_g127014 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector21882_g127014 = DecodeFloatToVector2( enc1882_g127014 );
				float2 break1878_g127014 = localDecodeFloatToVector21882_g127014;
				half Small_Mask_Legacy1879_g127014 = break1878_g127014.x;
				#ifdef TVE_LEGACY
				float staticSwitch1883_g127014 = Small_Mask_Legacy1879_g127014;
				#else
				float staticSwitch1883_g127014 = lerpResult1889_g127014;
				#endif
				float clampResult17_g127592 = clamp( staticSwitch1883_g127014 , 0.0001 , 0.9999 );
				float temp_output_7_0_g127593 = _MotionSmallMaskRemap.x;
				float temp_output_9_0_g127593 = ( clampResult17_g127592 - temp_output_7_0_g127593 );
				float temp_output_6_0_g127594 = saturate( ( ( temp_output_9_0_g127593 / ( _MotionSmallMaskRemap.y - temp_output_7_0_g127593 ) ) + 0.0001 ) );
				#ifdef TVE_REGISTER
				float staticSwitch14_g127594 = ( temp_output_6_0_g127594 + ( _MotionSmallMaskMode * 0.0 ) );
				#else
				float staticSwitch14_g127594 = temp_output_6_0_g127594;
				#endif
				half Motion_SmallMask1693_g127014 = staticSwitch14_g127594;
				float ifLocalVar40_g127092 = 0;
				if( Debug_Index464_g127014 == 14.0 )
				ifLocalVar40_g127092 = Motion_SmallMask1693_g127014;
				float4 break1867_g127014 = v.ase_color;
				float4 break33_g127587 = _motion_tiny_vert_mode;
				float temp_output_30_0_g127587 = ( break1867_g127014.r * break33_g127587.x );
				float temp_output_29_0_g127587 = ( break1867_g127014.g * break33_g127587.y );
				float temp_output_31_0_g127587 = ( break1867_g127014.b * break33_g127587.z );
				float temp_output_28_0_g127587 = ( temp_output_30_0_g127587 + temp_output_29_0_g127587 + temp_output_31_0_g127587 + ( break1867_g127014.a * break33_g127587.w ) );
				float temp_output_1860_0_g127014 = temp_output_28_0_g127587;
				float4 break33_g127591 = _motion_tiny_proc_mode;
				float temp_output_30_0_g127591 = ( Final_HeightMask1815_g127014 * break33_g127591.x );
				float temp_output_29_0_g127591 = ( Final_SphereMask1816_g127014 * break33_g127591.y );
				float temp_output_1864_0_g127014 = ( temp_output_30_0_g127591 + temp_output_29_0_g127591 );
				float lerpResult1891_g127014 = lerp( temp_output_1860_0_g127014 , temp_output_1864_0_g127014 , _motion_tiny_mask_mode);
				half Tiny_Mask_Legacy1880_g127014 = break1878_g127014.y;
				#ifdef TVE_LEGACY
				float staticSwitch1886_g127014 = Tiny_Mask_Legacy1880_g127014;
				#else
				float staticSwitch1886_g127014 = lerpResult1891_g127014;
				#endif
				float clampResult17_g127595 = clamp( staticSwitch1886_g127014 , 0.0001 , 0.9999 );
				float temp_output_7_0_g127596 = _MotionTinyMaskRemap.x;
				float temp_output_9_0_g127596 = ( clampResult17_g127595 - temp_output_7_0_g127596 );
				float temp_output_6_0_g127597 = saturate( ( ( temp_output_9_0_g127596 / ( _MotionTinyMaskRemap.y - temp_output_7_0_g127596 ) ) + 0.0001 ) );
				#ifdef TVE_REGISTER
				float staticSwitch14_g127597 = ( temp_output_6_0_g127597 + ( _MotionTinyMaskMode * 0.0 ) );
				#else
				float staticSwitch14_g127597 = temp_output_6_0_g127597;
				#endif
				half Motion_TinyMask1717_g127014 = staticSwitch14_g127597;
				float ifLocalVar40_g127093 = 0;
				if( Debug_Index464_g127014 == 15.0 )
				ifLocalVar40_g127093 = Motion_TinyMask1717_g127014;
				float3 appendResult60_g127088 = (float3(v.ase_texcoord3.x , 0.0 , v.ase_texcoord3.y));
				float3 ifLocalVar40_g127094 = 0;
				if( Debug_Index464_g127014 == 16.0 )
				ifLocalVar40_g127094 = appendResult60_g127088;
				float3 vertexToFrag328_g127014 = ( ( ifLocalVar40_g127015 + ifLocalVar40_g127022 + ifLocalVar40_g127028 + ifLocalVar40_g127020 ) + ( ifLocalVar40_g127064 + ifLocalVar40_g127065 + ifLocalVar40_g127066 + ifLocalVar40_g127067 ) + ( ifLocalVar40_g127068 + ifLocalVar40_g127069 + ifLocalVar40_g127089 ) + ( ifLocalVar40_g127090 + ifLocalVar40_g127091 + ifLocalVar40_g127092 + ifLocalVar40_g127093 + ifLocalVar40_g127094 ) );
				o.ase_texcoord11.xyz = vertexToFrag328_g127014;
				
				o.ase_texcoord9 = v.ase_texcoord;
				o.ase_texcoord10 = v.texcoord1.xyzw;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord11.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = v.normal;
				v.tangent = v.tangent;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#ifdef DYNAMICLIGHTMAP_ON
				o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif
				#ifdef LIGHTMAP_ON
				o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				#ifndef LIGHTMAP_ON
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						o.sh = 0;
						#ifdef VERTEXLIGHT_ON
						o.sh += Shade4PointLights (
							unity_4LightPosX0, unity_4LightPosY0, unity_4LightPosZ0,
							unity_LightColor[0].rgb, unity_LightColor[1].rgb, unity_LightColor[2].rgb, unity_LightColor[3].rgb,
							unity_4LightAtten0, worldPos, worldNormal);
						#endif
						o.sh = ShadeSHPerVertex (worldNormal, o.sh);
					#endif
				#endif

				#if UNITY_VERSION >= 201810 && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_TRANSFER_LIGHTING(o, v.texcoord1.xy);
				#elif defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if UNITY_VERSION >= 201710
						UNITY_TRANSFER_SHADOW(o, v.texcoord1.xy);
					#else
						TRANSFER_SHADOW(o);
					#endif
				#endif

				#ifdef ASE_FOG
					UNITY_TRANSFER_FOG(o,o.pos);
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					o.screenPos = ComputeScreenPos(o.pos);
				#endif
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			fixed4 frag (v2f IN , bool ase_vface : SV_IsFrontFace
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
				) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					UNITY_LIGHT_ATTENUATION(atten, IN, worldPos)
				#else
					half atten = 1;
				#endif
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				float4 color690_g127014 = IsGammaSpace() ? float4(0.1,0.1,0.1,0) : float4(0.01002283,0.01002283,0.01002283,0);
				float4 Shading_Inactive1492_g127014 = color690_g127014;
				float Debug_Type367_g127014 = TVE_DEBUG_Type;
				float4 color646_g127014 = IsGammaSpace() ? float4(0.9245283,0.7969696,0.4142933,1) : float4(0.8368256,0.5987038,0.1431069,1);
				float4 Output_Converted717_g127014 = color646_g127014;
				float4 ifLocalVar40_g127075 = 0;
				if( Debug_Type367_g127014 == 0.0 )
				ifLocalVar40_g127075 = Output_Converted717_g127014;
				float4 color1529_g127014 = IsGammaSpace() ? float4(0.9254902,0.7960784,0.4156863,1) : float4(0.8387991,0.5972018,0.1441285,1);
				float _IsCoreShader1551_g127014 = _IsCoreShader;
				float4 color1539_g127014 = IsGammaSpace() ? float4(0.6196079,0.7686275,0.1490196,0) : float4(0.3419145,0.5520116,0.01938236,0);
				float _IsBlanketShader1554_g127014 = _IsBlanketShader;
				float4 color1542_g127014 = IsGammaSpace() ? float4(0.9716981,0.3162602,0.4816265,0) : float4(0.9368213,0.08154967,0.1974273,0);
				float _IsImpostorShader1110_g127014 = _IsImpostorShader;
				float4 color1544_g127014 = IsGammaSpace() ? float4(0.3254902,0.6117647,0.8117647,0) : float4(0.08650047,0.3324516,0.6239604,0);
				float _IsPolygonalShader1112_g127014 = _IsPolygonalShader;
				float4 color1649_g127014 = IsGammaSpace() ? float4(0.6,0.6,0.6,0) : float4(0.3185468,0.3185468,0.3185468,0);
				float _IsLiteShader1648_g127014 = _IsLiteShader;
				float4 Output_Scope1531_g127014 = ( ( color1529_g127014 * _IsCoreShader1551_g127014 ) + ( color1539_g127014 * _IsBlanketShader1554_g127014 ) + ( color1542_g127014 * _IsImpostorShader1110_g127014 ) + ( color1544_g127014 * _IsPolygonalShader1112_g127014 ) + ( color1649_g127014 * _IsLiteShader1648_g127014 ) );
				float4 ifLocalVar40_g127077 = 0;
				if( Debug_Type367_g127014 == 2.0 )
				ifLocalVar40_g127077 = Output_Scope1531_g127014;
				float4 color529_g127014 = IsGammaSpace() ? float4(0.62,0.77,0.15,0) : float4(0.3423916,0.5542217,0.01960665,0);
				float _IsVertexShader1158_g127014 = _IsVertexShader;
				float4 color544_g127014 = IsGammaSpace() ? float4(0.3252937,0.6122813,0.8113208,0) : float4(0.08639329,0.3330702,0.6231937,0);
				float _IsSimpleShader359_g127014 = _IsSimpleShader;
				float4 color521_g127014 = IsGammaSpace() ? float4(0.6566009,0.3404236,0.8490566,0) : float4(0.3886527,0.09487338,0.6903409,0);
				float _IsStandardShader344_g127014 = _IsStandardShader;
				float4 color1121_g127014 = IsGammaSpace() ? float4(0.9716981,0.88463,0.1787558,0) : float4(0.9368213,0.7573396,0.02686729,0);
				float _IsSubsurfaceShader548_g127014 = _IsSubsurfaceShader;
				float4 Output_Lighting525_g127014 = ( ( color529_g127014 * _IsVertexShader1158_g127014 ) + ( color544_g127014 * _IsSimpleShader359_g127014 ) + ( color521_g127014 * _IsStandardShader344_g127014 ) + ( color1121_g127014 * _IsSubsurfaceShader548_g127014 ) );
				float4 ifLocalVar40_g127078 = 0;
				if( Debug_Type367_g127014 == 3.0 )
				ifLocalVar40_g127078 = Output_Lighting525_g127014;
				float4 color1559_g127014 = IsGammaSpace() ? float4(0.9245283,0.7969696,0.4142933,1) : float4(0.8368256,0.5987038,0.1431069,1);
				float4 color1563_g127014 = IsGammaSpace() ? float4(0.3053578,0.8867924,0.5362216,0) : float4(0.0759199,0.7615293,0.2491121,0);
				float _IsCustomShader1570_g127014 = _IsCustomShader;
				float4 lerpResult1561_g127014 = lerp( color1559_g127014 , color1563_g127014 , _IsCustomShader1570_g127014);
				float4 Output_Custom1560_g127014 = lerpResult1561_g127014;
				float4 ifLocalVar40_g127079 = 0;
				if( Debug_Type367_g127014 == 4.0 )
				ifLocalVar40_g127079 = Output_Custom1560_g127014;
				float3 hsvTorgb1452_g127014 = HSVToRGB( float3(( _IsIdentifier / 1000.0 ),1.0,1.0) );
				float3 gammaToLinear1453_g127014 = GammaToLinearSpace( hsvTorgb1452_g127014 );
				float4 appendResult1657_g127014 = (float4(gammaToLinear1453_g127014 , 1.0));
				float4 Output_Sharing1355_g127014 = appendResult1657_g127014;
				float4 ifLocalVar40_g127080 = 0;
				if( Debug_Type367_g127014 == 5.0 )
				ifLocalVar40_g127080 = Output_Sharing1355_g127014;
				float Debug_Index464_g127014 = TVE_DEBUG_Index;
				half2 Main_UVs1219_g127014 = ( ( IN.ase_texcoord9.xy * (_main_coord_value).xy ) + (_main_coord_value).zw );
				float4 tex2DNode586_g127014 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g127014 );
				float3 appendResult637_g127014 = (float3(tex2DNode586_g127014.r , tex2DNode586_g127014.g , tex2DNode586_g127014.b));
				float3 ifLocalVar40_g127021 = 0;
				if( Debug_Index464_g127014 == 0.0 )
				ifLocalVar40_g127021 = appendResult637_g127014;
				float ifLocalVar40_g127025 = 0;
				if( Debug_Index464_g127014 == 1.0 )
				ifLocalVar40_g127025 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g127014 ).a;
				float4 tex2DNode604_g127014 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, Main_UVs1219_g127014 );
				float3 appendResult876_g127014 = (float3(tex2DNode604_g127014.a , tex2DNode604_g127014.g , 1.0));
				float3 gammaToLinear878_g127014 = GammaToLinearSpace( appendResult876_g127014 );
				float3 ifLocalVar40_g127029 = 0;
				if( Debug_Index464_g127014 == 2.0 )
				ifLocalVar40_g127029 = gammaToLinear878_g127014;
				float ifLocalVar40_g127017 = 0;
				if( Debug_Index464_g127014 == 3.0 )
				ifLocalVar40_g127017 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).r;
				float ifLocalVar40_g127035 = 0;
				if( Debug_Index464_g127014 == 4.0 )
				ifLocalVar40_g127035 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).g;
				float ifLocalVar40_g127026 = 0;
				if( Debug_Index464_g127014 == 5.0 )
				ifLocalVar40_g127026 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).b;
				float ifLocalVar40_g127016 = 0;
				if( Debug_Index464_g127014 == 6.0 )
				ifLocalVar40_g127016 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).a;
				float2 appendResult1251_g127014 = (float2(IN.ase_texcoord10.z , IN.ase_texcoord10.w));
				float2 Mesh_DetailCoord1254_g127014 = appendResult1251_g127014;
				float2 lerpResult1231_g127014 = lerp( IN.ase_texcoord9.xy , Mesh_DetailCoord1254_g127014 , _DetailCoordMode);
				half2 Layer_02_UVs1234_g127014 = ( ( lerpResult1231_g127014 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				float4 tex2DNode854_g127014 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Layer_02_UVs1234_g127014 );
				float3 appendResult839_g127014 = (float3(tex2DNode854_g127014.r , tex2DNode854_g127014.g , tex2DNode854_g127014.b));
				float3 ifLocalVar40_g127019 = 0;
				if( Debug_Index464_g127014 == 7.0 )
				ifLocalVar40_g127019 = appendResult839_g127014;
				float ifLocalVar40_g127027 = 0;
				if( Debug_Index464_g127014 == 8.0 )
				ifLocalVar40_g127027 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Layer_02_UVs1234_g127014 ).a;
				float4 tex2DNode841_g127014 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondNormalTex, Layer_02_UVs1234_g127014 );
				float3 appendResult880_g127014 = (float3(tex2DNode841_g127014.a , tex2DNode841_g127014.g , 1.0));
				float3 gammaToLinear879_g127014 = GammaToLinearSpace( appendResult880_g127014 );
				float3 ifLocalVar40_g127034 = 0;
				if( Debug_Index464_g127014 == 8.0 )
				ifLocalVar40_g127034 = gammaToLinear879_g127014;
				float ifLocalVar40_g127030 = 0;
				if( Debug_Index464_g127014 == 10.0 )
				ifLocalVar40_g127030 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).r;
				float ifLocalVar40_g127024 = 0;
				if( Debug_Index464_g127014 == 11.0 )
				ifLocalVar40_g127024 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).g;
				float ifLocalVar40_g127032 = 0;
				if( Debug_Index464_g127014 == 12.0 )
				ifLocalVar40_g127032 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).b;
				float ifLocalVar40_g127033 = 0;
				if( Debug_Index464_g127014 == 13.0 )
				ifLocalVar40_g127033 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).a;
				half2 Emissive_UVs1245_g127014 = ( ( IN.ase_texcoord9.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float4 tex2DNode858_g127014 = SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, Emissive_UVs1245_g127014 );
				float ifLocalVar40_g127023 = 0;
				if( Debug_Index464_g127014 == 14.0 )
				ifLocalVar40_g127023 = tex2DNode858_g127014.r;
				float Debug_Min721_g127014 = TVE_DEBUG_Min;
				float temp_output_7_0_g127031 = Debug_Min721_g127014;
				float4 temp_cast_3 = (temp_output_7_0_g127031).xxxx;
				float4 temp_output_9_0_g127031 = ( ( float4( ( ( ifLocalVar40_g127021 + ifLocalVar40_g127025 + ifLocalVar40_g127029 ) + ( ifLocalVar40_g127017 + ifLocalVar40_g127035 + ifLocalVar40_g127026 + ifLocalVar40_g127016 ) ) , 0.0 ) + float4( ( ( ( ifLocalVar40_g127019 + ifLocalVar40_g127027 + ifLocalVar40_g127034 ) + ( ifLocalVar40_g127030 + ifLocalVar40_g127024 + ifLocalVar40_g127032 + ifLocalVar40_g127033 ) ) * _DetailMode ) , 0.0 ) + ( ( ifLocalVar40_g127023 * _EmissiveColor ) * _EmissiveCat ) ) - temp_cast_3 );
				float Debug_Max723_g127014 = TVE_DEBUG_Max;
				float4 Output_Maps561_g127014 = saturate( ( ( temp_output_9_0_g127031 / ( Debug_Max723_g127014 - temp_output_7_0_g127031 ) ) + 0.0001 ) );
				float4 ifLocalVar40_g127081 = 0;
				if( Debug_Type367_g127014 == 6.0 )
				ifLocalVar40_g127081 = Output_Maps561_g127014;
				float Resolution44_g127052 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
				float4 color62_g127052 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g127052 = 0;
				if( Resolution44_g127052 <= 256.0 )
				ifLocalVar61_g127052 = color62_g127052;
				float4 color55_g127052 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g127052 = 0;
				if( Resolution44_g127052 == 512.0 )
				ifLocalVar56_g127052 = color55_g127052;
				float4 color42_g127052 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g127052 = 0;
				if( Resolution44_g127052 == 1024.0 )
				ifLocalVar40_g127052 = color42_g127052;
				float4 color48_g127052 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g127052 = 0;
				if( Resolution44_g127052 == 2048.0 )
				ifLocalVar47_g127052 = color48_g127052;
				float4 color51_g127052 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g127052 = 0;
				if( Resolution44_g127052 >= 4096.0 )
				ifLocalVar52_g127052 = color51_g127052;
				float4 ifLocalVar40_g127038 = 0;
				if( Debug_Index464_g127014 == 0.0 )
				ifLocalVar40_g127038 = ( ifLocalVar61_g127052 + ifLocalVar56_g127052 + ifLocalVar40_g127052 + ifLocalVar47_g127052 + ifLocalVar52_g127052 );
				float Resolution44_g127051 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
				float4 color62_g127051 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g127051 = 0;
				if( Resolution44_g127051 <= 256.0 )
				ifLocalVar61_g127051 = color62_g127051;
				float4 color55_g127051 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g127051 = 0;
				if( Resolution44_g127051 == 512.0 )
				ifLocalVar56_g127051 = color55_g127051;
				float4 color42_g127051 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g127051 = 0;
				if( Resolution44_g127051 == 1024.0 )
				ifLocalVar40_g127051 = color42_g127051;
				float4 color48_g127051 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g127051 = 0;
				if( Resolution44_g127051 == 2048.0 )
				ifLocalVar47_g127051 = color48_g127051;
				float4 color51_g127051 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g127051 = 0;
				if( Resolution44_g127051 >= 4096.0 )
				ifLocalVar52_g127051 = color51_g127051;
				float4 ifLocalVar40_g127036 = 0;
				if( Debug_Index464_g127014 == 1.0 )
				ifLocalVar40_g127036 = ( ifLocalVar61_g127051 + ifLocalVar56_g127051 + ifLocalVar40_g127051 + ifLocalVar47_g127051 + ifLocalVar52_g127051 );
				float Resolution44_g127050 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
				float4 color62_g127050 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g127050 = 0;
				if( Resolution44_g127050 <= 256.0 )
				ifLocalVar61_g127050 = color62_g127050;
				float4 color55_g127050 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g127050 = 0;
				if( Resolution44_g127050 == 512.0 )
				ifLocalVar56_g127050 = color55_g127050;
				float4 color42_g127050 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g127050 = 0;
				if( Resolution44_g127050 == 1024.0 )
				ifLocalVar40_g127050 = color42_g127050;
				float4 color48_g127050 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g127050 = 0;
				if( Resolution44_g127050 == 2048.0 )
				ifLocalVar47_g127050 = color48_g127050;
				float4 color51_g127050 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g127050 = 0;
				if( Resolution44_g127050 >= 4096.0 )
				ifLocalVar52_g127050 = color51_g127050;
				float4 ifLocalVar40_g127037 = 0;
				if( Debug_Index464_g127014 == 2.0 )
				ifLocalVar40_g127037 = ( ifLocalVar61_g127050 + ifLocalVar56_g127050 + ifLocalVar40_g127050 + ifLocalVar47_g127050 + ifLocalVar52_g127050 );
				float Resolution44_g127057 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 color62_g127057 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g127057 = 0;
				if( Resolution44_g127057 <= 256.0 )
				ifLocalVar61_g127057 = color62_g127057;
				float4 color55_g127057 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g127057 = 0;
				if( Resolution44_g127057 == 512.0 )
				ifLocalVar56_g127057 = color55_g127057;
				float4 color42_g127057 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g127057 = 0;
				if( Resolution44_g127057 == 1024.0 )
				ifLocalVar40_g127057 = color42_g127057;
				float4 color48_g127057 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g127057 = 0;
				if( Resolution44_g127057 == 2048.0 )
				ifLocalVar47_g127057 = color48_g127057;
				float4 color51_g127057 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g127057 = 0;
				if( Resolution44_g127057 >= 4096.0 )
				ifLocalVar52_g127057 = color51_g127057;
				float4 ifLocalVar40_g127044 = 0;
				if( Debug_Index464_g127014 == 3.0 )
				ifLocalVar40_g127044 = ( ifLocalVar61_g127057 + ifLocalVar56_g127057 + ifLocalVar40_g127057 + ifLocalVar47_g127057 + ifLocalVar52_g127057 );
				float Resolution44_g127056 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
				float4 color62_g127056 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g127056 = 0;
				if( Resolution44_g127056 <= 256.0 )
				ifLocalVar61_g127056 = color62_g127056;
				float4 color55_g127056 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g127056 = 0;
				if( Resolution44_g127056 == 512.0 )
				ifLocalVar56_g127056 = color55_g127056;
				float4 color42_g127056 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g127056 = 0;
				if( Resolution44_g127056 == 1024.0 )
				ifLocalVar40_g127056 = color42_g127056;
				float4 color48_g127056 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g127056 = 0;
				if( Resolution44_g127056 == 2048.0 )
				ifLocalVar47_g127056 = color48_g127056;
				float4 color51_g127056 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g127056 = 0;
				if( Resolution44_g127056 >= 4096.0 )
				ifLocalVar52_g127056 = color51_g127056;
				float4 ifLocalVar40_g127042 = 0;
				if( Debug_Index464_g127014 == 4.0 )
				ifLocalVar40_g127042 = ( ifLocalVar61_g127056 + ifLocalVar56_g127056 + ifLocalVar40_g127056 + ifLocalVar47_g127056 + ifLocalVar52_g127056 );
				float Resolution44_g127058 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 color62_g127058 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g127058 = 0;
				if( Resolution44_g127058 <= 256.0 )
				ifLocalVar61_g127058 = color62_g127058;
				float4 color55_g127058 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g127058 = 0;
				if( Resolution44_g127058 == 512.0 )
				ifLocalVar56_g127058 = color55_g127058;
				float4 color42_g127058 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g127058 = 0;
				if( Resolution44_g127058 == 1024.0 )
				ifLocalVar40_g127058 = color42_g127058;
				float4 color48_g127058 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g127058 = 0;
				if( Resolution44_g127058 == 2048.0 )
				ifLocalVar47_g127058 = color48_g127058;
				float4 color51_g127058 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g127058 = 0;
				if( Resolution44_g127058 >= 4096.0 )
				ifLocalVar52_g127058 = color51_g127058;
				float4 ifLocalVar40_g127043 = 0;
				if( Debug_Index464_g127014 == 5.0 )
				ifLocalVar40_g127043 = ( ifLocalVar61_g127058 + ifLocalVar56_g127058 + ifLocalVar40_g127058 + ifLocalVar47_g127058 + ifLocalVar52_g127058 );
				float Resolution44_g127055 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
				float4 color62_g127055 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g127055 = 0;
				if( Resolution44_g127055 <= 256.0 )
				ifLocalVar61_g127055 = color62_g127055;
				float4 color55_g127055 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g127055 = 0;
				if( Resolution44_g127055 == 512.0 )
				ifLocalVar56_g127055 = color55_g127055;
				float4 color42_g127055 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g127055 = 0;
				if( Resolution44_g127055 == 1024.0 )
				ifLocalVar40_g127055 = color42_g127055;
				float4 color48_g127055 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g127055 = 0;
				if( Resolution44_g127055 == 2048.0 )
				ifLocalVar47_g127055 = color48_g127055;
				float4 color51_g127055 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g127055 = 0;
				if( Resolution44_g127055 >= 4096.0 )
				ifLocalVar52_g127055 = color51_g127055;
				float4 ifLocalVar40_g127045 = 0;
				if( Debug_Index464_g127014 == 6.0 )
				ifLocalVar40_g127045 = ( ifLocalVar61_g127055 + ifLocalVar56_g127055 + ifLocalVar40_g127055 + ifLocalVar47_g127055 + ifLocalVar52_g127055 );
				float4 Output_Resolution737_g127014 = ( ( ifLocalVar40_g127038 + ifLocalVar40_g127036 + ifLocalVar40_g127037 ) + ( ifLocalVar40_g127044 + ifLocalVar40_g127042 + ifLocalVar40_g127043 ) + ifLocalVar40_g127045 );
				float4 ifLocalVar40_g127082 = 0;
				if( Debug_Type367_g127014 == 7.0 )
				ifLocalVar40_g127082 = Output_Resolution737_g127014;
				float2 uv_MainAlbedoTex = IN.ase_texcoord9.xy * _MainAlbedoTex_ST.xy + _MainAlbedoTex_ST.zw;
				float2 UVs72_g127063 = Main_UVs1219_g127014;
				float Resolution44_g127063 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
				float4 tex2DNode77_g127063 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127063 * ( Resolution44_g127063 / 8.0 ) ) );
				float4 lerpResult78_g127063 = lerp( SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ) , tex2DNode77_g127063 , tex2DNode77_g127063.a);
				float4 ifLocalVar40_g127041 = 0;
				if( Debug_Index464_g127014 == 0.0 )
				ifLocalVar40_g127041 = lerpResult78_g127063;
				float2 uv_MainNormalTex = IN.ase_texcoord9.xy * _MainNormalTex_ST.xy + _MainNormalTex_ST.zw;
				float2 UVs72_g127054 = Main_UVs1219_g127014;
				float Resolution44_g127054 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
				float4 tex2DNode77_g127054 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127054 * ( Resolution44_g127054 / 8.0 ) ) );
				float4 lerpResult78_g127054 = lerp( SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, uv_MainNormalTex ) , tex2DNode77_g127054 , tex2DNode77_g127054.a);
				float4 ifLocalVar40_g127039 = 0;
				if( Debug_Index464_g127014 == 1.0 )
				ifLocalVar40_g127039 = lerpResult78_g127054;
				float2 uv_MainMaskTex = IN.ase_texcoord9.xy * _MainMaskTex_ST.xy + _MainMaskTex_ST.zw;
				float2 UVs72_g127053 = Main_UVs1219_g127014;
				float Resolution44_g127053 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
				float4 tex2DNode77_g127053 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127053 * ( Resolution44_g127053 / 8.0 ) ) );
				float4 lerpResult78_g127053 = lerp( SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, uv_MainMaskTex ) , tex2DNode77_g127053 , tex2DNode77_g127053.a);
				float4 ifLocalVar40_g127040 = 0;
				if( Debug_Index464_g127014 == 2.0 )
				ifLocalVar40_g127040 = lerpResult78_g127053;
				float2 uv_SecondAlbedoTex = IN.ase_texcoord9.xy * _SecondAlbedoTex_ST.xy + _SecondAlbedoTex_ST.zw;
				float2 UVs72_g127061 = Layer_02_UVs1234_g127014;
				float Resolution44_g127061 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 tex2DNode77_g127061 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127061 * ( Resolution44_g127061 / 8.0 ) ) );
				float4 lerpResult78_g127061 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g127061 , tex2DNode77_g127061.a);
				float4 ifLocalVar40_g127048 = 0;
				if( Debug_Index464_g127014 == 3.0 )
				ifLocalVar40_g127048 = lerpResult78_g127061;
				float2 uv_SecondMaskTex = IN.ase_texcoord9.xy * _SecondMaskTex_ST.xy + _SecondMaskTex_ST.zw;
				float2 UVs72_g127060 = Layer_02_UVs1234_g127014;
				float Resolution44_g127060 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
				float4 tex2DNode77_g127060 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127060 * ( Resolution44_g127060 / 8.0 ) ) );
				float4 lerpResult78_g127060 = lerp( SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, uv_SecondMaskTex ) , tex2DNode77_g127060 , tex2DNode77_g127060.a);
				float4 ifLocalVar40_g127046 = 0;
				if( Debug_Index464_g127014 == 4.0 )
				ifLocalVar40_g127046 = lerpResult78_g127060;
				float2 UVs72_g127062 = Layer_02_UVs1234_g127014;
				float Resolution44_g127062 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 tex2DNode77_g127062 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127062 * ( Resolution44_g127062 / 8.0 ) ) );
				float4 lerpResult78_g127062 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g127062 , tex2DNode77_g127062.a);
				float4 ifLocalVar40_g127047 = 0;
				if( Debug_Index464_g127014 == 5.0 )
				ifLocalVar40_g127047 = lerpResult78_g127062;
				float2 uv_EmissiveTex = IN.ase_texcoord9.xy * _EmissiveTex_ST.xy + _EmissiveTex_ST.zw;
				float2 UVs72_g127059 = Emissive_UVs1245_g127014;
				float Resolution44_g127059 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
				float4 tex2DNode77_g127059 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127059 * ( Resolution44_g127059 / 8.0 ) ) );
				float4 lerpResult78_g127059 = lerp( SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, uv_EmissiveTex ) , tex2DNode77_g127059 , tex2DNode77_g127059.a);
				float4 ifLocalVar40_g127049 = 0;
				if( Debug_Index464_g127014 == 6.0 )
				ifLocalVar40_g127049 = lerpResult78_g127059;
				float4 Output_MipLevel1284_g127014 = ( ( ifLocalVar40_g127041 + ifLocalVar40_g127039 + ifLocalVar40_g127040 ) + ( ifLocalVar40_g127048 + ifLocalVar40_g127046 + ifLocalVar40_g127047 ) + ifLocalVar40_g127049 );
				float4 ifLocalVar40_g127083 = 0;
				if( Debug_Type367_g127014 == 8.0 )
				ifLocalVar40_g127083 = Output_MipLevel1284_g127014;
				float ifLocalVar40_g127581 = 0;
				if( Debug_Index464_g127014 == 0.0 )
				ifLocalVar40_g127581 = (float3( 0,0,0 )).z;
				float Debug_Layer885_g127014 = TVE_DEBUG_Layer;
				float temp_output_82_0_g127400 = Debug_Layer885_g127014;
				float temp_output_19_0_g127402 = TVE_CoatLayers[(int)temp_output_82_0_g127400];
				float3 WorldPosition893_g127014 = worldPos;
				half3 Input_Position180_g127403 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127403 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127403).xz ) );
				float temp_output_82_0_g127403 = temp_output_82_0_g127400;
				float2 temp_output_119_0_g127403 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127403).xz ) );
				float temp_output_7_0_g127408 = 1.0;
				float temp_output_9_0_g127408 = ( saturate( ( distance( Input_Position180_g127403 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127408 );
				float4 lerpResult131_g127403 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127403,temp_output_82_0_g127403), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127403,temp_output_82_0_g127403), 0.0 ) , saturate( ( temp_output_9_0_g127408 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127408 ) ) ));
				float4 temp_output_17_0_g127402 = lerpResult131_g127403;
				float4 temp_output_3_0_g127402 = TVE_CoatParams;
				float4 ifLocalVar18_g127402 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127402 >= 0.5 )
				ifLocalVar18_g127402 = temp_output_17_0_g127402;
				else
				ifLocalVar18_g127402 = temp_output_3_0_g127402;
				float4 lerpResult22_g127402 = lerp( temp_output_3_0_g127402 , temp_output_17_0_g127402 , temp_output_19_0_g127402);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127402 = lerpResult22_g127402;
				#else
				float4 staticSwitch24_g127402 = ifLocalVar18_g127402;
				#endif
				float ifLocalVar40_g127418 = 0;
				if( Debug_Index464_g127014 == 1.0 )
				ifLocalVar40_g127418 = (staticSwitch24_g127402).g;
				float temp_output_82_0_g127409 = Debug_Layer885_g127014;
				float temp_output_19_0_g127411 = TVE_CoatLayers[(int)temp_output_82_0_g127409];
				half3 Input_Position180_g127412 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127412 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127412).xz ) );
				float temp_output_82_0_g127412 = temp_output_82_0_g127409;
				float2 temp_output_119_0_g127412 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127412).xz ) );
				float temp_output_7_0_g127417 = 1.0;
				float temp_output_9_0_g127417 = ( saturate( ( distance( Input_Position180_g127412 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127417 );
				float4 lerpResult131_g127412 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127412,temp_output_82_0_g127412), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127412,temp_output_82_0_g127412), 0.0 ) , saturate( ( temp_output_9_0_g127417 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127417 ) ) ));
				float4 temp_output_17_0_g127411 = lerpResult131_g127412;
				float4 temp_output_3_0_g127411 = TVE_CoatParams;
				float4 ifLocalVar18_g127411 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127411 >= 0.5 )
				ifLocalVar18_g127411 = temp_output_17_0_g127411;
				else
				ifLocalVar18_g127411 = temp_output_3_0_g127411;
				float4 lerpResult22_g127411 = lerp( temp_output_3_0_g127411 , temp_output_17_0_g127411 , temp_output_19_0_g127411);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127411 = lerpResult22_g127411;
				#else
				float4 staticSwitch24_g127411 = ifLocalVar18_g127411;
				#endif
				float ifLocalVar40_g127419 = 0;
				if( Debug_Index464_g127014 == 2.0 )
				ifLocalVar40_g127419 = (staticSwitch24_g127411).b;
				float temp_output_82_0_g127429 = Debug_Layer885_g127014;
				float temp_output_19_0_g127431 = TVE_PaintLayers[(int)temp_output_82_0_g127429];
				half3 Input_Position180_g127432 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127432 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127432).xz ) );
				float temp_output_82_0_g127432 = temp_output_82_0_g127429;
				float2 temp_output_119_0_g127432 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127432).xz ) );
				float temp_output_7_0_g127437 = 1.0;
				float temp_output_9_0_g127437 = ( saturate( ( distance( Input_Position180_g127432 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127437 );
				float4 lerpResult131_g127432 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127432,temp_output_82_0_g127432), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127432,temp_output_82_0_g127432), 0.0 ) , saturate( ( temp_output_9_0_g127437 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127437 ) ) ));
				float4 temp_output_17_0_g127431 = lerpResult131_g127432;
				float4 temp_output_3_0_g127431 = TVE_PaintParams;
				float4 ifLocalVar18_g127431 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127431 >= 0.5 )
				ifLocalVar18_g127431 = temp_output_17_0_g127431;
				else
				ifLocalVar18_g127431 = temp_output_3_0_g127431;
				float4 lerpResult22_g127431 = lerp( temp_output_3_0_g127431 , temp_output_17_0_g127431 , temp_output_19_0_g127431);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127431 = lerpResult22_g127431;
				#else
				float4 staticSwitch24_g127431 = ifLocalVar18_g127431;
				#endif
				float3 ifLocalVar40_g127438 = 0;
				if( Debug_Index464_g127014 == 3.0 )
				ifLocalVar40_g127438 = (staticSwitch24_g127431).rgb;
				float temp_output_82_0_g127420 = Debug_Layer885_g127014;
				float temp_output_19_0_g127422 = TVE_PaintLayers[(int)temp_output_82_0_g127420];
				half3 Input_Position180_g127423 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127423 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127423).xz ) );
				float temp_output_82_0_g127423 = temp_output_82_0_g127420;
				float2 temp_output_119_0_g127423 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127423).xz ) );
				float temp_output_7_0_g127428 = 1.0;
				float temp_output_9_0_g127428 = ( saturate( ( distance( Input_Position180_g127423 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127428 );
				float4 lerpResult131_g127423 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127423,temp_output_82_0_g127423), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127423,temp_output_82_0_g127423), 0.0 ) , saturate( ( temp_output_9_0_g127428 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127428 ) ) ));
				float4 temp_output_17_0_g127422 = lerpResult131_g127423;
				float4 temp_output_3_0_g127422 = TVE_PaintParams;
				float4 ifLocalVar18_g127422 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127422 >= 0.5 )
				ifLocalVar18_g127422 = temp_output_17_0_g127422;
				else
				ifLocalVar18_g127422 = temp_output_3_0_g127422;
				float4 lerpResult22_g127422 = lerp( temp_output_3_0_g127422 , temp_output_17_0_g127422 , temp_output_19_0_g127422);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127422 = lerpResult22_g127422;
				#else
				float4 staticSwitch24_g127422 = ifLocalVar18_g127422;
				#endif
				float ifLocalVar40_g127439 = 0;
				if( Debug_Index464_g127014 == 4.0 )
				ifLocalVar40_g127439 = saturate( (staticSwitch24_g127422).a );
				float temp_output_82_0_g127440 = Debug_Layer885_g127014;
				float temp_output_19_0_g127442 = TVE_GlowLayers[(int)temp_output_82_0_g127440];
				half3 Input_Position180_g127443 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127443 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127443).xz ) );
				float temp_output_82_0_g127443 = temp_output_82_0_g127440;
				float2 temp_output_119_0_g127443 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127443).xz ) );
				float temp_output_7_0_g127448 = 1.0;
				float temp_output_9_0_g127448 = ( saturate( ( distance( Input_Position180_g127443 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127448 );
				float4 lerpResult131_g127443 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127443,temp_output_82_0_g127443), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127443,temp_output_82_0_g127443), 0.0 ) , saturate( ( temp_output_9_0_g127448 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127448 ) ) ));
				float4 temp_output_17_0_g127442 = lerpResult131_g127443;
				float4 temp_output_3_0_g127442 = TVE_GlowParams;
				float4 ifLocalVar18_g127442 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127442 >= 0.5 )
				ifLocalVar18_g127442 = temp_output_17_0_g127442;
				else
				ifLocalVar18_g127442 = temp_output_3_0_g127442;
				float4 lerpResult22_g127442 = lerp( temp_output_3_0_g127442 , temp_output_17_0_g127442 , temp_output_19_0_g127442);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127442 = lerpResult22_g127442;
				#else
				float4 staticSwitch24_g127442 = ifLocalVar18_g127442;
				#endif
				float3 ifLocalVar40_g127512 = 0;
				if( Debug_Index464_g127014 == 5.0 )
				ifLocalVar40_g127512 = (staticSwitch24_g127442).rgb;
				float temp_output_82_0_g127503 = Debug_Layer885_g127014;
				float temp_output_19_0_g127505 = TVE_GlowLayers[(int)temp_output_82_0_g127503];
				half3 Input_Position180_g127506 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127506 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127506).xz ) );
				float temp_output_82_0_g127506 = temp_output_82_0_g127503;
				float2 temp_output_119_0_g127506 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127506).xz ) );
				float temp_output_7_0_g127511 = 1.0;
				float temp_output_9_0_g127511 = ( saturate( ( distance( Input_Position180_g127506 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127511 );
				float4 lerpResult131_g127506 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127506,temp_output_82_0_g127506), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127506,temp_output_82_0_g127506), 0.0 ) , saturate( ( temp_output_9_0_g127511 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127511 ) ) ));
				float4 temp_output_17_0_g127505 = lerpResult131_g127506;
				float4 temp_output_3_0_g127505 = TVE_GlowParams;
				float4 ifLocalVar18_g127505 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127505 >= 0.5 )
				ifLocalVar18_g127505 = temp_output_17_0_g127505;
				else
				ifLocalVar18_g127505 = temp_output_3_0_g127505;
				float4 lerpResult22_g127505 = lerp( temp_output_3_0_g127505 , temp_output_17_0_g127505 , temp_output_19_0_g127505);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127505 = lerpResult22_g127505;
				#else
				float4 staticSwitch24_g127505 = ifLocalVar18_g127505;
				#endif
				float ifLocalVar40_g127513 = 0;
				if( Debug_Index464_g127014 == 6.0 )
				ifLocalVar40_g127513 = saturate( (staticSwitch24_g127505).a );
				float temp_output_132_0_g127476 = Debug_Layer885_g127014;
				float temp_output_19_0_g127478 = TVE_AtmoLayers[(int)temp_output_132_0_g127476];
				half3 Input_Position180_g127479 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127479 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127479).xz ) );
				float temp_output_82_0_g127479 = temp_output_132_0_g127476;
				float2 temp_output_119_0_g127479 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127479).xz ) );
				float temp_output_7_0_g127484 = 1.0;
				float temp_output_9_0_g127484 = ( saturate( ( distance( Input_Position180_g127479 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127484 );
				float4 lerpResult131_g127479 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127479,temp_output_82_0_g127479), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127479,temp_output_82_0_g127479), 0.0 ) , saturate( ( temp_output_9_0_g127484 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127484 ) ) ));
				float4 temp_output_17_0_g127478 = lerpResult131_g127479;
				float4 temp_output_3_0_g127478 = TVE_AtmoParams;
				float4 ifLocalVar18_g127478 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127478 >= 0.5 )
				ifLocalVar18_g127478 = temp_output_17_0_g127478;
				else
				ifLocalVar18_g127478 = temp_output_3_0_g127478;
				float4 lerpResult22_g127478 = lerp( temp_output_3_0_g127478 , temp_output_17_0_g127478 , temp_output_19_0_g127478);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127478 = lerpResult22_g127478;
				#else
				float4 staticSwitch24_g127478 = ifLocalVar18_g127478;
				#endif
				float ifLocalVar40_g127514 = 0;
				if( Debug_Index464_g127014 == 7.0 )
				ifLocalVar40_g127514 = (staticSwitch24_g127478).r;
				float temp_output_132_0_g127449 = Debug_Layer885_g127014;
				float temp_output_19_0_g127451 = TVE_AtmoLayers[(int)temp_output_132_0_g127449];
				half3 Input_Position180_g127452 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127452 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127452).xz ) );
				float temp_output_82_0_g127452 = temp_output_132_0_g127449;
				float2 temp_output_119_0_g127452 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127452).xz ) );
				float temp_output_7_0_g127457 = 1.0;
				float temp_output_9_0_g127457 = ( saturate( ( distance( Input_Position180_g127452 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127457 );
				float4 lerpResult131_g127452 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127452,temp_output_82_0_g127452), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127452,temp_output_82_0_g127452), 0.0 ) , saturate( ( temp_output_9_0_g127457 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127457 ) ) ));
				float4 temp_output_17_0_g127451 = lerpResult131_g127452;
				float4 temp_output_3_0_g127451 = TVE_AtmoParams;
				float4 ifLocalVar18_g127451 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127451 >= 0.5 )
				ifLocalVar18_g127451 = temp_output_17_0_g127451;
				else
				ifLocalVar18_g127451 = temp_output_3_0_g127451;
				float4 lerpResult22_g127451 = lerp( temp_output_3_0_g127451 , temp_output_17_0_g127451 , temp_output_19_0_g127451);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127451 = lerpResult22_g127451;
				#else
				float4 staticSwitch24_g127451 = ifLocalVar18_g127451;
				#endif
				float ifLocalVar40_g127515 = 0;
				if( Debug_Index464_g127014 == 8.0 )
				ifLocalVar40_g127515 = (staticSwitch24_g127451).g;
				float temp_output_132_0_g127458 = Debug_Layer885_g127014;
				float temp_output_19_0_g127460 = TVE_AtmoLayers[(int)temp_output_132_0_g127458];
				half3 Input_Position180_g127461 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127461 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127461).xz ) );
				float temp_output_82_0_g127461 = temp_output_132_0_g127458;
				float2 temp_output_119_0_g127461 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127461).xz ) );
				float temp_output_7_0_g127466 = 1.0;
				float temp_output_9_0_g127466 = ( saturate( ( distance( Input_Position180_g127461 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127466 );
				float4 lerpResult131_g127461 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127461,temp_output_82_0_g127461), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127461,temp_output_82_0_g127461), 0.0 ) , saturate( ( temp_output_9_0_g127466 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127466 ) ) ));
				float4 temp_output_17_0_g127460 = lerpResult131_g127461;
				float4 temp_output_3_0_g127460 = TVE_AtmoParams;
				float4 ifLocalVar18_g127460 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127460 >= 0.5 )
				ifLocalVar18_g127460 = temp_output_17_0_g127460;
				else
				ifLocalVar18_g127460 = temp_output_3_0_g127460;
				float4 lerpResult22_g127460 = lerp( temp_output_3_0_g127460 , temp_output_17_0_g127460 , temp_output_19_0_g127460);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127460 = lerpResult22_g127460;
				#else
				float4 staticSwitch24_g127460 = ifLocalVar18_g127460;
				#endif
				float ifLocalVar40_g127516 = 0;
				if( Debug_Index464_g127014 == 9.0 )
				ifLocalVar40_g127516 = (staticSwitch24_g127460).b;
				float temp_output_132_0_g127467 = Debug_Layer885_g127014;
				float temp_output_19_0_g127469 = TVE_AtmoLayers[(int)temp_output_132_0_g127467];
				half3 Input_Position180_g127470 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127470 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127470).xz ) );
				float temp_output_82_0_g127470 = temp_output_132_0_g127467;
				float2 temp_output_119_0_g127470 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127470).xz ) );
				float temp_output_7_0_g127475 = 1.0;
				float temp_output_9_0_g127475 = ( saturate( ( distance( Input_Position180_g127470 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127475 );
				float4 lerpResult131_g127470 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127470,temp_output_82_0_g127470), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127470,temp_output_82_0_g127470), 0.0 ) , saturate( ( temp_output_9_0_g127475 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127475 ) ) ));
				float4 temp_output_17_0_g127469 = lerpResult131_g127470;
				float4 temp_output_3_0_g127469 = TVE_AtmoParams;
				float4 ifLocalVar18_g127469 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127469 >= 0.5 )
				ifLocalVar18_g127469 = temp_output_17_0_g127469;
				else
				ifLocalVar18_g127469 = temp_output_3_0_g127469;
				float4 lerpResult22_g127469 = lerp( temp_output_3_0_g127469 , temp_output_17_0_g127469 , temp_output_19_0_g127469);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127469 = lerpResult22_g127469;
				#else
				float4 staticSwitch24_g127469 = ifLocalVar18_g127469;
				#endif
				float ifLocalVar40_g127517 = 0;
				if( Debug_Index464_g127014 == 10.0 )
				ifLocalVar40_g127517 = saturate( (staticSwitch24_g127469).a );
				float temp_output_130_0_g127494 = Debug_Layer885_g127014;
				float temp_output_19_0_g127496 = TVE_FormLayers[(int)temp_output_130_0_g127494];
				half3 Input_Position180_g127497 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127497 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127497).xz ) );
				float temp_output_82_0_g127497 = temp_output_130_0_g127494;
				float2 temp_output_119_0_g127497 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127497).xz ) );
				float temp_output_7_0_g127502 = 1.0;
				float temp_output_9_0_g127502 = ( saturate( ( distance( Input_Position180_g127497 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127502 );
				float4 lerpResult131_g127497 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127497,temp_output_82_0_g127497), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127497,temp_output_82_0_g127497), 0.0 ) , saturate( ( temp_output_9_0_g127502 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127502 ) ) ));
				float4 temp_output_17_0_g127496 = lerpResult131_g127497;
				float4 temp_output_3_0_g127496 = TVE_FormParams;
				float4 ifLocalVar18_g127496 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127496 >= 0.5 )
				ifLocalVar18_g127496 = temp_output_17_0_g127496;
				else
				ifLocalVar18_g127496 = temp_output_3_0_g127496;
				float4 lerpResult22_g127496 = lerp( temp_output_3_0_g127496 , temp_output_17_0_g127496 , temp_output_19_0_g127496);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127496 = lerpResult22_g127496;
				#else
				float4 staticSwitch24_g127496 = ifLocalVar18_g127496;
				#endif
				float3 appendResult1013_g127014 = (float3((staticSwitch24_g127496).rg , 0.0));
				float3 ifLocalVar40_g127518 = 0;
				if( Debug_Index464_g127014 == 11.0 )
				ifLocalVar40_g127518 = appendResult1013_g127014;
				float temp_output_130_0_g127485 = Debug_Layer885_g127014;
				float temp_output_19_0_g127487 = TVE_FormLayers[(int)temp_output_130_0_g127485];
				half3 Input_Position180_g127488 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127488 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127488).xz ) );
				float temp_output_82_0_g127488 = temp_output_130_0_g127485;
				float2 temp_output_119_0_g127488 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127488).xz ) );
				float temp_output_7_0_g127493 = 1.0;
				float temp_output_9_0_g127493 = ( saturate( ( distance( Input_Position180_g127488 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127493 );
				float4 lerpResult131_g127488 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127488,temp_output_82_0_g127488), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127488,temp_output_82_0_g127488), 0.0 ) , saturate( ( temp_output_9_0_g127493 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127493 ) ) ));
				float4 temp_output_17_0_g127487 = lerpResult131_g127488;
				float4 temp_output_3_0_g127487 = TVE_FormParams;
				float4 ifLocalVar18_g127487 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127487 >= 0.5 )
				ifLocalVar18_g127487 = temp_output_17_0_g127487;
				else
				ifLocalVar18_g127487 = temp_output_3_0_g127487;
				float4 lerpResult22_g127487 = lerp( temp_output_3_0_g127487 , temp_output_17_0_g127487 , temp_output_19_0_g127487);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127487 = lerpResult22_g127487;
				#else
				float4 staticSwitch24_g127487 = ifLocalVar18_g127487;
				#endif
				float ifLocalVar40_g127519 = 0;
				if( Debug_Index464_g127014 == 12.0 )
				ifLocalVar40_g127519 = saturate( (staticSwitch24_g127487).b );
				float temp_output_130_0_g127542 = Debug_Layer885_g127014;
				float temp_output_19_0_g127544 = TVE_FormLayers[(int)temp_output_130_0_g127542];
				half3 Input_Position180_g127545 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127545 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127545).xz ) );
				float temp_output_82_0_g127545 = temp_output_130_0_g127542;
				float2 temp_output_119_0_g127545 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127545).xz ) );
				float temp_output_7_0_g127550 = 1.0;
				float temp_output_9_0_g127550 = ( saturate( ( distance( Input_Position180_g127545 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127550 );
				float4 lerpResult131_g127545 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127545,temp_output_82_0_g127545), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127545,temp_output_82_0_g127545), 0.0 ) , saturate( ( temp_output_9_0_g127550 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127550 ) ) ));
				float4 temp_output_17_0_g127544 = lerpResult131_g127545;
				float4 temp_output_3_0_g127544 = TVE_FormParams;
				float4 ifLocalVar18_g127544 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127544 >= 0.5 )
				ifLocalVar18_g127544 = temp_output_17_0_g127544;
				else
				ifLocalVar18_g127544 = temp_output_3_0_g127544;
				float4 lerpResult22_g127544 = lerp( temp_output_3_0_g127544 , temp_output_17_0_g127544 , temp_output_19_0_g127544);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127544 = lerpResult22_g127544;
				#else
				float4 staticSwitch24_g127544 = ifLocalVar18_g127544;
				#endif
				float ifLocalVar40_g127551 = 0;
				if( Debug_Index464_g127014 == 13.0 )
				ifLocalVar40_g127551 = saturate( (staticSwitch24_g127544).a );
				float temp_output_136_0_g127520 = Debug_Layer885_g127014;
				float temp_output_19_0_g127522 = TVE_FlowLayers[(int)temp_output_136_0_g127520];
				half3 Input_Position180_g127523 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127523 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127523).xz ) );
				float temp_output_82_0_g127523 = temp_output_136_0_g127520;
				float2 temp_output_119_0_g127523 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127523).xz ) );
				float temp_output_7_0_g127528 = 1.0;
				float temp_output_9_0_g127528 = ( saturate( ( distance( Input_Position180_g127523 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127528 );
				float4 lerpResult131_g127523 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127523,temp_output_82_0_g127523), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127523,temp_output_82_0_g127523), 0.0 ) , saturate( ( temp_output_9_0_g127528 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127528 ) ) ));
				float4 temp_output_17_0_g127522 = lerpResult131_g127523;
				float4 temp_output_3_0_g127522 = TVE_FlowParams;
				float4 ifLocalVar18_g127522 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127522 >= 0.5 )
				ifLocalVar18_g127522 = temp_output_17_0_g127522;
				else
				ifLocalVar18_g127522 = temp_output_3_0_g127522;
				float4 lerpResult22_g127522 = lerp( temp_output_3_0_g127522 , temp_output_17_0_g127522 , temp_output_19_0_g127522);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127522 = lerpResult22_g127522;
				#else
				float4 staticSwitch24_g127522 = ifLocalVar18_g127522;
				#endif
				float3 appendResult1012_g127014 = (float3((staticSwitch24_g127522).rg , 0.0));
				float3 ifLocalVar40_g127538 = 0;
				if( Debug_Index464_g127014 == 14.0 )
				ifLocalVar40_g127538 = appendResult1012_g127014;
				float temp_output_136_0_g127529 = Debug_Layer885_g127014;
				float temp_output_19_0_g127531 = TVE_FlowLayers[(int)temp_output_136_0_g127529];
				half3 Input_Position180_g127532 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127532 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127532).xz ) );
				float temp_output_82_0_g127532 = temp_output_136_0_g127529;
				float2 temp_output_119_0_g127532 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127532).xz ) );
				float temp_output_7_0_g127537 = 1.0;
				float temp_output_9_0_g127537 = ( saturate( ( distance( Input_Position180_g127532 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127537 );
				float4 lerpResult131_g127532 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127532,temp_output_82_0_g127532), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127532,temp_output_82_0_g127532), 0.0 ) , saturate( ( temp_output_9_0_g127537 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127537 ) ) ));
				float4 temp_output_17_0_g127531 = lerpResult131_g127532;
				float4 temp_output_3_0_g127531 = TVE_FlowParams;
				float4 ifLocalVar18_g127531 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127531 >= 0.5 )
				ifLocalVar18_g127531 = temp_output_17_0_g127531;
				else
				ifLocalVar18_g127531 = temp_output_3_0_g127531;
				float4 lerpResult22_g127531 = lerp( temp_output_3_0_g127531 , temp_output_17_0_g127531 , temp_output_19_0_g127531);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127531 = lerpResult22_g127531;
				#else
				float4 staticSwitch24_g127531 = ifLocalVar18_g127531;
				#endif
				float ifLocalVar40_g127539 = 0;
				if( Debug_Index464_g127014 == 15.0 )
				ifLocalVar40_g127539 = (staticSwitch24_g127531).b;
				float temp_output_136_0_g127554 = Debug_Layer885_g127014;
				float temp_output_19_0_g127555 = TVE_PushLayers[(int)temp_output_136_0_g127554];
				half3 Input_Position180_g127556 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127556 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127556).xz ) );
				float temp_output_82_0_g127556 = temp_output_136_0_g127554;
				float2 temp_output_119_0_g127556 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127556).xz ) );
				float temp_output_7_0_g127561 = 1.0;
				float temp_output_9_0_g127561 = ( saturate( ( distance( Input_Position180_g127556 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127561 );
				float4 lerpResult131_g127556 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127556,temp_output_82_0_g127556), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127556,temp_output_82_0_g127556), 0.0 ) , saturate( ( temp_output_9_0_g127561 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127561 ) ) ));
				float4 temp_output_17_0_g127555 = lerpResult131_g127556;
				float4 temp_output_3_0_g127555 = TVE_PushParams;
				float4 ifLocalVar18_g127555 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127555 >= 0.5 )
				ifLocalVar18_g127555 = temp_output_17_0_g127555;
				else
				ifLocalVar18_g127555 = temp_output_3_0_g127555;
				float4 lerpResult22_g127555 = lerp( temp_output_3_0_g127555 , temp_output_17_0_g127555 , temp_output_19_0_g127555);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127555 = lerpResult22_g127555;
				#else
				float4 staticSwitch24_g127555 = ifLocalVar18_g127555;
				#endif
				float3 appendResult1780_g127014 = (float3((staticSwitch24_g127555).rg , 0.0));
				float3 ifLocalVar40_g127540 = 0;
				if( Debug_Index464_g127014 == 16.0 )
				ifLocalVar40_g127540 = appendResult1780_g127014;
				float temp_output_136_0_g127563 = Debug_Layer885_g127014;
				float temp_output_19_0_g127564 = TVE_PushLayers[(int)temp_output_136_0_g127563];
				half3 Input_Position180_g127565 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127565 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127565).xz ) );
				float temp_output_82_0_g127565 = temp_output_136_0_g127563;
				float2 temp_output_119_0_g127565 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127565).xz ) );
				float temp_output_7_0_g127570 = 1.0;
				float temp_output_9_0_g127570 = ( saturate( ( distance( Input_Position180_g127565 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127570 );
				float4 lerpResult131_g127565 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127565,temp_output_82_0_g127565), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127565,temp_output_82_0_g127565), 0.0 ) , saturate( ( temp_output_9_0_g127570 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127570 ) ) ));
				float4 temp_output_17_0_g127564 = lerpResult131_g127565;
				float4 temp_output_3_0_g127564 = TVE_PushParams;
				float4 ifLocalVar18_g127564 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127564 >= 0.5 )
				ifLocalVar18_g127564 = temp_output_17_0_g127564;
				else
				ifLocalVar18_g127564 = temp_output_3_0_g127564;
				float4 lerpResult22_g127564 = lerp( temp_output_3_0_g127564 , temp_output_17_0_g127564 , temp_output_19_0_g127564);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127564 = lerpResult22_g127564;
				#else
				float4 staticSwitch24_g127564 = ifLocalVar18_g127564;
				#endif
				float ifLocalVar40_g127541 = 0;
				if( Debug_Index464_g127014 == 17.0 )
				ifLocalVar40_g127541 = (staticSwitch24_g127564).b;
				float temp_output_136_0_g127572 = Debug_Layer885_g127014;
				float temp_output_19_0_g127573 = TVE_PushLayers[(int)temp_output_136_0_g127572];
				half3 Input_Position180_g127574 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127574 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127574).xz ) );
				float temp_output_82_0_g127574 = temp_output_136_0_g127572;
				float2 temp_output_119_0_g127574 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127574).xz ) );
				float temp_output_7_0_g127579 = 1.0;
				float temp_output_9_0_g127579 = ( saturate( ( distance( Input_Position180_g127574 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127579 );
				float4 lerpResult131_g127574 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127574,temp_output_82_0_g127574), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127574,temp_output_82_0_g127574), 0.0 ) , saturate( ( temp_output_9_0_g127579 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127579 ) ) ));
				float4 temp_output_17_0_g127573 = lerpResult131_g127574;
				float4 temp_output_3_0_g127573 = TVE_PushParams;
				float4 ifLocalVar18_g127573 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127573 >= 0.5 )
				ifLocalVar18_g127573 = temp_output_17_0_g127573;
				else
				ifLocalVar18_g127573 = temp_output_3_0_g127573;
				float4 lerpResult22_g127573 = lerp( temp_output_3_0_g127573 , temp_output_17_0_g127573 , temp_output_19_0_g127573);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127573 = lerpResult22_g127573;
				#else
				float4 staticSwitch24_g127573 = ifLocalVar18_g127573;
				#endif
				float ifLocalVar40_g127552 = 0;
				if( Debug_Index464_g127014 == 18.0 )
				ifLocalVar40_g127552 = saturate( (staticSwitch24_g127573).a );
				float temp_output_7_0_g127553 = Debug_Min721_g127014;
				float3 temp_cast_58 = (temp_output_7_0_g127553).xxx;
				float3 temp_output_9_0_g127553 = ( ( ifLocalVar40_g127581 + ( ifLocalVar40_g127418 + ifLocalVar40_g127419 ) + ( ifLocalVar40_g127438 + ifLocalVar40_g127439 ) + ( ifLocalVar40_g127512 + ifLocalVar40_g127513 ) + ( ifLocalVar40_g127514 + ifLocalVar40_g127515 + ifLocalVar40_g127516 + ifLocalVar40_g127517 ) + ( ifLocalVar40_g127518 + ifLocalVar40_g127519 + ifLocalVar40_g127551 ) + ( ifLocalVar40_g127538 + ifLocalVar40_g127539 + ifLocalVar40_g127540 + ifLocalVar40_g127541 + ifLocalVar40_g127552 ) ) - temp_cast_58 );
				float4 appendResult1659_g127014 = (float4(saturate( ( ( temp_output_9_0_g127553 / ( Debug_Max723_g127014 - temp_output_7_0_g127553 ) ) + 0.0001 ) ) , 1.0));
				float4 Output_Globals888_g127014 = appendResult1659_g127014;
				float4 ifLocalVar40_g127084 = 0;
				if( Debug_Type367_g127014 == 9.0 )
				ifLocalVar40_g127084 = Output_Globals888_g127014;
				float3 vertexToFrag328_g127014 = IN.ase_texcoord11.xyz;
				float4 color1016_g127014 = IsGammaSpace() ? float4(0.5831653,0.6037736,0.2135992,0) : float4(0.2992498,0.3229691,0.03750122,0);
				float4 color1017_g127014 = IsGammaSpace() ? float4(0.8117647,0.3488252,0.2627451,0) : float4(0.6239604,0.0997834,0.05612849,0);
				float4 switchResult1015_g127014 = (((ase_vface>0)?(color1016_g127014):(color1017_g127014)));
				float3 ifLocalVar40_g127018 = 0;
				if( Debug_Index464_g127014 == 4.0 )
				ifLocalVar40_g127018 = (switchResult1015_g127014).rgb;
				float temp_output_7_0_g127074 = Debug_Min721_g127014;
				float3 temp_cast_59 = (temp_output_7_0_g127074).xxx;
				float3 temp_output_9_0_g127074 = ( ( vertexToFrag328_g127014 + ifLocalVar40_g127018 ) - temp_cast_59 );
				float4 appendResult1658_g127014 = (float4(saturate( ( ( temp_output_9_0_g127074 / ( Debug_Max723_g127014 - temp_output_7_0_g127074 ) ) + 0.0001 ) ) , 1.0));
				float4 Output_Mesh316_g127014 = appendResult1658_g127014;
				float4 ifLocalVar40_g127086 = 0;
				if( Debug_Type367_g127014 == 11.0 )
				ifLocalVar40_g127086 = Output_Mesh316_g127014;
				float _IsTVEShader647_g127014 = _IsTVEShader;
				float Debug_Filter322_g127014 = TVE_DEBUG_Filter;
				float lerpResult1524_g127014 = lerp( 1.0 , _IsTVEShader647_g127014 , Debug_Filter322_g127014);
				float4 lerpResult1517_g127014 = lerp( Shading_Inactive1492_g127014 , ( ( ifLocalVar40_g127075 + ifLocalVar40_g127077 + ifLocalVar40_g127078 + ifLocalVar40_g127079 + ifLocalVar40_g127080 ) + ( ifLocalVar40_g127081 + ifLocalVar40_g127082 + ifLocalVar40_g127083 ) + ( ifLocalVar40_g127084 + ifLocalVar40_g127086 ) ) , lerpResult1524_g127014);
				float3 ase_viewDirWS = normalize( worldViewDir );
				float dotResult1472_g127014 = dot( WorldNormal , ase_viewDirWS );
				float temp_output_1526_0_g127014 = ( 1.0 - saturate( dotResult1472_g127014 ) );
				float Shading_Fresnel1469_g127014 = (( 1.0 - ( temp_output_1526_0_g127014 * temp_output_1526_0_g127014 ) )*0.3 + 0.7);
				float Debug_Shading1653_g127014 = TVE_DEBUG_Shading;
				float lerpResult1655_g127014 = lerp( 1.0 , Shading_Fresnel1469_g127014 , Debug_Shading1653_g127014);
				float Debug_Clip623_g127014 = TVE_DEBUG_Clip;
				float lerpResult622_g127014 = lerp( 1.0 , SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ).a , ( Debug_Clip623_g127014 * _RenderClip ));
				clip( lerpResult622_g127014 - _MainAlphaClipValue);
				clip( ( 1.0 - saturate( ( _IsElementShader + _IsHelperShader ) ) ) - 1.0);
				
				o.Albedo = fixed3( 0.5, 0.5, 0.5 );
				o.Normal = fixed3( 0, 0, 1 );
				o.Emission = ( lerpResult1517_g127014 * lerpResult1655_g127014 ).rgb;
				#if defined(_SPECULAR_SETUP)
					o.Specular = fixed3( 0, 0, 0 );
				#else
					o.Metallic = 0;
				#endif
				o.Smoothness = 0;
				o.Occlusion = 1;
				o.Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef _ALPHATEST_ON
					clip( o.Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifndef USING_DIRECTIONAL_LIGHT
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				#else
					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
				#endif

				fixed4 c = 0;
				float3 worldN;
				worldN.x = dot(IN.tSpace0.xyz, o.Normal);
				worldN.y = dot(IN.tSpace1.xyz, o.Normal);
				worldN.z = dot(IN.tSpace2.xyz, o.Normal);
				worldN = normalize(worldN);
				o.Normal = worldN;

				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
				gi.indirect.diffuse = 0;
				gi.indirect.specular = 0;
				gi.light.color = _LightColor0.rgb;
				gi.light.dir = lightDir;

				UnityGIInput giInput;
				UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
				giInput.light = gi.light;
				giInput.worldPos = worldPos;
				giInput.worldViewDir = worldViewDir;
				giInput.atten = atten;
				#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
					giInput.lightmapUV = IN.lmap;
				#else
					giInput.lightmapUV = 0.0;
				#endif
				#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
					giInput.ambient = IN.sh;
				#else
					giInput.ambient.rgb = 0.0;
				#endif
				giInput.probeHDR[0] = unity_SpecCube0_HDR;
				giInput.probeHDR[1] = unity_SpecCube1_HDR;
				#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
					giInput.boxMin[0] = unity_SpecCube0_BoxMin;
				#endif
				#ifdef UNITY_SPECCUBE_BOX_PROJECTION
					giInput.boxMax[0] = unity_SpecCube0_BoxMax;
					giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
					giInput.boxMax[1] = unity_SpecCube1_BoxMax;
					giInput.boxMin[1] = unity_SpecCube1_BoxMin;
					giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
				#endif

				#if defined(_SPECULAR_SETUP)
					LightingStandardSpecular_GI(o, giInput, gi);
				#else
					LightingStandard_GI( o, giInput, gi );
				#endif

				#ifdef ASE_BAKEDGI
					gi.indirect.diffuse = BakedGI;
				#endif

				#if UNITY_SHOULD_SAMPLE_SH && !defined(LIGHTMAP_ON) && defined(ASE_NO_AMBIENT)
					gi.indirect.diffuse = 0;
				#endif

				#if defined(_SPECULAR_SETUP)
					c += LightingStandardSpecular (o, worldViewDir, gi);
				#else
					c += LightingStandard( o, worldViewDir, gi );
				#endif

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;
					#ifdef DIRECTIONAL
						float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
					#else
						float3 lightAtten = gi.light.color;
					#endif
					half3 transmission = max(0 , -dot(o.Normal, gi.light.dir)) * lightAtten * Transmission;
					c.rgb += o.Albedo * transmission;
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#ifdef DIRECTIONAL
						float3 lightAtten = lerp( _LightColor0.rgb, gi.light.color, shadow );
					#else
						float3 lightAtten = gi.light.color;
					#endif
					half3 lightDir = gi.light.dir + o.Normal * normal;
					half transVdotL = pow( saturate( dot( worldViewDir, -lightDir ) ), scattering );
					half3 translucency = lightAtten * (transVdotL * direct + gi.indirect.diffuse * ambient) * Translucency;
					c.rgb += o.Albedo * translucency * strength;
				}
				#endif

				//#ifdef ASE_REFRACTION
				//	float4 projScreenPos = ScreenPos / ScreenPos.w;
				//	float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, WorldNormal ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
				//	projScreenPos.xy += refractionOffset.xy;
				//	float3 refraction = UNITY_SAMPLE_SCREENSPACE_TEXTURE( _GrabTexture, projScreenPos ) * RefractionColor;
				//	color.rgb = lerp( refraction, color.rgb, color.a );
				//	color.a = 1;
				//#endif

				c.rgb += o.Emission;

				#ifdef ASE_FOG
					UNITY_APPLY_FOG(IN.fogCoord, c);
				#endif
				return c;
			}
			ENDCG
		}

		
		Pass
		{
			
			Name "Deferred"
			Tags { "LightMode"="Deferred" }

			AlphaToMask Off

			CGPROGRAM
			#define ASE_NO_AMBIENT 1
			#define ASE_VERSION 19702
			#define ASE_USING_SAMPLING_MACROS 1

			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#pragma multi_compile_prepassfinal
			#ifndef UNITY_PASS_DEFERRED
				#define UNITY_PASS_DEFERRED
			#endif
			#include "HLSLSupport.cginc"
			#if !defined( UNITY_INSTANCED_LOD_FADE )
				#define UNITY_INSTANCED_LOD_FADE
			#endif
			#if !defined( UNITY_INSTANCED_SH )
				#define UNITY_INSTANCED_SH
			#endif
			#if !defined( UNITY_INSTANCED_LIGHTMAPSTS )
				#define UNITY_INSTANCED_LIGHTMAPSTS
			#endif
			#include "UnityShaderVariables.cginc"
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local TVE_LEGACY
			#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
			#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
			#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
			#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
			#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
			#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
			#else//ASE Sampling Macros
			#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
			#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
			#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
			#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
			#define SAMPLE_TEXTURE2D_ARRAY_LOD(tex,samplertex,coord,lod) tex2DArraylod(tex, float4(coord,lod))
			#endif//ASE Sampling Macros
			

			struct appdata {
				float4 vertex : POSITION;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct v2f {
				#if UNITY_VERSION >= 201810
					UNITY_POSITION(pos);
				#else
					float4 pos : SV_POSITION;
				#endif
				float4 lmap : TEXCOORD2;
				#ifndef LIGHTMAP_ON
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						half3 sh : TEXCOORD3;
					#endif
				#else
					#ifdef DIRLIGHTMAP_OFF
						float4 lmapFadePos : TEXCOORD4;
					#endif
				#endif
				float4 tSpace0 : TEXCOORD5;
				float4 tSpace1 : TEXCOORD6;
				float4 tSpace2 : TEXCOORD7;
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_texcoord9 : TEXCOORD9;
				float4 ase_texcoord10 : TEXCOORD10;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			#ifdef LIGHTMAP_ON
			float4 unity_LightmapFade;
			#endif
			fixed4 unity_Ambient;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			uniform half _Banner;
			uniform half _Message;
			uniform float _IsSimpleShader;
			uniform float _IsVertexShader;
			uniform half _IsTVEShader;
			uniform half TVE_DEBUG_Type;
			uniform float _IsCoreShader;
			uniform float _IsBlanketShader;
			uniform float _IsImpostorShader;
			uniform float _IsPolygonalShader;
			uniform float _IsLiteShader;
			uniform float _IsStandardShader;
			uniform float _IsSubsurfaceShader;
			uniform float _IsCustomShader;
			uniform float _IsIdentifier;
			uniform half TVE_DEBUG_Index;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainAlbedoTex);
			uniform half4 _main_coord_value;
			SamplerState sampler_MainAlbedoTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainNormalTex);
			SamplerState sampler_MainNormalTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_MainMaskTex);
			SamplerState sampler_MainMaskTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondAlbedoTex);
			uniform half _DetailCoordMode;
			uniform half4 _SecondUVs;
			SamplerState sampler_SecondAlbedoTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondNormalTex);
			SamplerState sampler_SecondNormalTex;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_SecondMaskTex);
			SamplerState sampler_SecondMaskTex;
			uniform float _DetailMode;
			UNITY_DECLARE_TEX2D_NOSAMPLER(_EmissiveTex);
			uniform half4 _EmissiveUVs;
			SamplerState sampler_EmissiveTex;
			uniform float4 _EmissiveColor;
			uniform float _EmissiveCat;
			uniform half TVE_DEBUG_Min;
			uniform half TVE_DEBUG_Max;
			float4 _MainAlbedoTex_TexelSize;
			float4 _MainNormalTex_TexelSize;
			float4 _MainMaskTex_TexelSize;
			float4 _SecondAlbedoTex_TexelSize;
			float4 _SecondMaskTex_TexelSize;
			float4 _EmissiveTex_TexelSize;
			uniform float4 _MainAlbedoTex_ST;
			UNITY_DECLARE_TEX2D_NOSAMPLER(TVE_DEBUG_MipTex);
			SamplerState samplerTVE_DEBUG_MipTex;
			uniform float4 _MainNormalTex_ST;
			uniform float4 _MainMaskTex_ST;
			uniform float4 _SecondAlbedoTex_ST;
			uniform float4 _SecondMaskTex_ST;
			uniform float4 _EmissiveTex_ST;
			uniform half TVE_DEBUG_Layer;
			uniform float TVE_CoatLayers[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_CoatBaseTex);
			uniform half4 TVE_RenderBaseCoords;
			SamplerState sampler_Linear_Clamp;
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_CoatNearTex);
			uniform half4 TVE_RenderNearCoords;
			SamplerState sampler_Linear_Repeat;
			uniform float4 TVE_RenderNearPositionR;
			uniform half TVE_RenderNearFadeValue;
			uniform half4 TVE_CoatParams;
			uniform float TVE_PaintLayers[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PaintBaseTex);
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PaintNearTex);
			uniform half4 TVE_PaintParams;
			uniform float TVE_GlowLayers[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_GlowBaseTex);
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_GlowNearTex);
			uniform half4 TVE_GlowParams;
			uniform float TVE_AtmoLayers[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_AtmoBaseTex);
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_AtmoNearTex);
			uniform half4 TVE_AtmoParams;
			uniform float TVE_FormLayers[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FormBaseTex);
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FormNearTex);
			uniform half4 TVE_FormParams;
			uniform float TVE_FlowLayers[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FlowBaseTex);
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_FlowNearTex);
			uniform half4 TVE_FlowParams;
			uniform float TVE_PushLayers[10];
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PushBaseTex);
			UNITY_DECLARE_TEX2DARRAY_NOSAMPLER(TVE_PushNearTex);
			uniform half4 TVE_PushParams;
			uniform half4 _object_phase_mode;
			uniform half4 _motion_base_vert_mode;
			uniform half _ObjectHeightValue;
			uniform half4 _motion_base_proc_mode;
			uniform half _ObjectRadiusValue;
			uniform half _motion_base_mask_mode;
			uniform half4 _MotionBaseMaskRemap;
			uniform half _MotionBaseMaskMode;
			uniform half4 _motion_small_vert_mode;
			uniform half4 _motion_small_proc_mode;
			uniform half _motion_small_mask_mode;
			uniform half4 _MotionSmallMaskRemap;
			uniform half _MotionSmallMaskMode;
			uniform half4 _motion_tiny_vert_mode;
			uniform half4 _motion_tiny_proc_mode;
			uniform half _motion_tiny_mask_mode;
			uniform half4 _MotionTinyMaskRemap;
			uniform half _MotionTinyMaskMode;
			uniform half TVE_DEBUG_Filter;
			uniform half TVE_DEBUG_Shading;
			uniform half TVE_DEBUG_Clip;
			uniform float _RenderClip;
			uniform float _MainAlphaClipValue;
			uniform float _IsElementShader;
			uniform float _IsHelperShader;


			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float2 DecodeFloatToVector2( float enc )
			{
				float2 result ;
				result.y = enc % 2048;
				result.x = floor(enc / 2048);
				return result / (2048 - 1);
			}
			

			v2f VertexFunction (appdata v  ) {
				UNITY_SETUP_INSTANCE_ID(v);
				v2f o;
				UNITY_INITIALIZE_OUTPUT(v2f,o);
				UNITY_TRANSFER_INSTANCE_ID(v,o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float Debug_Index464_g127014 = TVE_DEBUG_Index;
				float3 ifLocalVar40_g127015 = 0;
				if( Debug_Index464_g127014 == 0.0 )
				ifLocalVar40_g127015 = saturate( v.vertex.xyz );
				float3 ifLocalVar40_g127022 = 0;
				if( Debug_Index464_g127014 == 1.0 )
				ifLocalVar40_g127022 = v.normal;
				float3 ifLocalVar40_g127028 = 0;
				if( Debug_Index464_g127014 == 2.0 )
				ifLocalVar40_g127028 = v.tangent.xyz;
				float ifLocalVar40_g127020 = 0;
				if( Debug_Index464_g127014 == 3.0 )
				ifLocalVar40_g127020 = saturate( v.tangent.w );
				float ifLocalVar40_g127064 = 0;
				if( Debug_Index464_g127014 == 5.0 )
				ifLocalVar40_g127064 = v.ase_color.r;
				float ifLocalVar40_g127065 = 0;
				if( Debug_Index464_g127014 == 6.0 )
				ifLocalVar40_g127065 = v.ase_color.g;
				float ifLocalVar40_g127066 = 0;
				if( Debug_Index464_g127014 == 7.0 )
				ifLocalVar40_g127066 = v.ase_color.b;
				float ifLocalVar40_g127067 = 0;
				if( Debug_Index464_g127014 == 8.0 )
				ifLocalVar40_g127067 = v.ase_color.a;
				float3 appendResult1147_g127014 = (float3(v.ase_texcoord.x , v.ase_texcoord.y , 0.0));
				float3 ifLocalVar40_g127068 = 0;
				if( Debug_Index464_g127014 == 9.0 )
				ifLocalVar40_g127068 = appendResult1147_g127014;
				float3 appendResult1148_g127014 = (float3(v.texcoord1.xyzw.x , v.texcoord1.xyzw.y , 0.0));
				float3 ifLocalVar40_g127069 = 0;
				if( Debug_Index464_g127014 == 10.0 )
				ifLocalVar40_g127069 = appendResult1148_g127014;
				float3 appendResult1149_g127014 = (float3(v.texcoord2.xyzw.x , v.texcoord2.xyzw.y , 0.0));
				float3 ifLocalVar40_g127089 = 0;
				if( Debug_Index464_g127014 == 11.0 )
				ifLocalVar40_g127089 = appendResult1149_g127014;
				float4 break33_g127087 = _object_phase_mode;
				float temp_output_30_0_g127087 = ( v.ase_color.r * break33_g127087.x );
				float temp_output_29_0_g127087 = ( v.ase_color.g * break33_g127087.y );
				float temp_output_31_0_g127087 = ( v.ase_color.b * break33_g127087.z );
				float temp_output_28_0_g127087 = ( temp_output_30_0_g127087 + temp_output_29_0_g127087 + temp_output_31_0_g127087 + ( v.ase_color.a * break33_g127087.w ) );
				half Motion_PhaseMask1725_g127014 = temp_output_28_0_g127087;
				float3 hsvTorgb260_g127014 = HSVToRGB( float3(Motion_PhaseMask1725_g127014,1.0,1.0) );
				float3 gammaToLinear266_g127014 = GammaToLinearSpace( hsvTorgb260_g127014 );
				float3 ifLocalVar40_g127090 = 0;
				if( Debug_Index464_g127014 == 12.0 )
				ifLocalVar40_g127090 = gammaToLinear266_g127014;
				float4 break1821_g127014 = v.ase_color;
				float4 break33_g127585 = _motion_base_vert_mode;
				float temp_output_30_0_g127585 = ( break1821_g127014.r * break33_g127585.x );
				float temp_output_29_0_g127585 = ( break1821_g127014.g * break33_g127585.y );
				float temp_output_31_0_g127585 = ( break1821_g127014.b * break33_g127585.z );
				float temp_output_28_0_g127585 = ( temp_output_30_0_g127585 + temp_output_29_0_g127585 + temp_output_31_0_g127585 + ( break1821_g127014.a * break33_g127585.w ) );
				float temp_output_1824_0_g127014 = temp_output_28_0_g127585;
				half Bounds_Height1700_g127014 = _ObjectHeightValue;
				half Final_HeightMask1815_g127014 = saturate( ( v.vertex.xyz.y / Bounds_Height1700_g127014 ) );
				float4 break33_g127589 = _motion_base_proc_mode;
				float temp_output_30_0_g127589 = ( Final_HeightMask1815_g127014 * break33_g127589.x );
				half Bounds_Radius1702_g127014 = _ObjectRadiusValue;
				half Final_SphereMask1816_g127014 = saturate( ( length( v.vertex.xyz ) / ( Bounds_Height1700_g127014 * Bounds_Radius1702_g127014 ) ) );
				float temp_output_29_0_g127589 = ( Final_SphereMask1816_g127014 * break33_g127589.y );
				float temp_output_1834_0_g127014 = ( temp_output_30_0_g127589 + temp_output_29_0_g127589 );
				float lerpResult1887_g127014 = lerp( temp_output_1824_0_g127014 , temp_output_1834_0_g127014 , _motion_base_mask_mode);
				float clampResult17_g127582 = clamp( lerpResult1887_g127014 , 0.0001 , 0.9999 );
				float temp_output_7_0_g127583 = _MotionBaseMaskRemap.x;
				float temp_output_9_0_g127583 = ( clampResult17_g127582 - temp_output_7_0_g127583 );
				float temp_output_6_0_g127584 = saturate( ( ( temp_output_9_0_g127583 / ( _MotionBaseMaskRemap.y - temp_output_7_0_g127583 ) ) + 0.0001 ) );
				#ifdef TVE_REGISTER
				float staticSwitch14_g127584 = ( temp_output_6_0_g127584 + ( _MotionBaseMaskMode * 0.0 ) );
				#else
				float staticSwitch14_g127584 = temp_output_6_0_g127584;
				#endif
				half Motion_BaseMask1675_g127014 = staticSwitch14_g127584;
				float ifLocalVar40_g127091 = 0;
				if( Debug_Index464_g127014 == 13.0 )
				ifLocalVar40_g127091 = Motion_BaseMask1675_g127014;
				float4 break1855_g127014 = v.ase_color;
				float4 break33_g127586 = _motion_small_vert_mode;
				float temp_output_30_0_g127586 = ( break1855_g127014.r * break33_g127586.x );
				float temp_output_29_0_g127586 = ( break1855_g127014.g * break33_g127586.y );
				float temp_output_31_0_g127586 = ( break1855_g127014.b * break33_g127586.z );
				float temp_output_28_0_g127586 = ( temp_output_30_0_g127586 + temp_output_29_0_g127586 + temp_output_31_0_g127586 + ( break1855_g127014.a * break33_g127586.w ) );
				float temp_output_1845_0_g127014 = temp_output_28_0_g127586;
				float4 break33_g127590 = _motion_small_proc_mode;
				float temp_output_30_0_g127590 = ( Final_HeightMask1815_g127014 * break33_g127590.x );
				float temp_output_29_0_g127590 = ( Final_SphereMask1816_g127014 * break33_g127590.y );
				float temp_output_1849_0_g127014 = ( temp_output_30_0_g127590 + temp_output_29_0_g127590 );
				float lerpResult1889_g127014 = lerp( temp_output_1845_0_g127014 , temp_output_1849_0_g127014 , _motion_small_mask_mode);
				float enc1882_g127014 = v.ase_texcoord.z;
				float2 localDecodeFloatToVector21882_g127014 = DecodeFloatToVector2( enc1882_g127014 );
				float2 break1878_g127014 = localDecodeFloatToVector21882_g127014;
				half Small_Mask_Legacy1879_g127014 = break1878_g127014.x;
				#ifdef TVE_LEGACY
				float staticSwitch1883_g127014 = Small_Mask_Legacy1879_g127014;
				#else
				float staticSwitch1883_g127014 = lerpResult1889_g127014;
				#endif
				float clampResult17_g127592 = clamp( staticSwitch1883_g127014 , 0.0001 , 0.9999 );
				float temp_output_7_0_g127593 = _MotionSmallMaskRemap.x;
				float temp_output_9_0_g127593 = ( clampResult17_g127592 - temp_output_7_0_g127593 );
				float temp_output_6_0_g127594 = saturate( ( ( temp_output_9_0_g127593 / ( _MotionSmallMaskRemap.y - temp_output_7_0_g127593 ) ) + 0.0001 ) );
				#ifdef TVE_REGISTER
				float staticSwitch14_g127594 = ( temp_output_6_0_g127594 + ( _MotionSmallMaskMode * 0.0 ) );
				#else
				float staticSwitch14_g127594 = temp_output_6_0_g127594;
				#endif
				half Motion_SmallMask1693_g127014 = staticSwitch14_g127594;
				float ifLocalVar40_g127092 = 0;
				if( Debug_Index464_g127014 == 14.0 )
				ifLocalVar40_g127092 = Motion_SmallMask1693_g127014;
				float4 break1867_g127014 = v.ase_color;
				float4 break33_g127587 = _motion_tiny_vert_mode;
				float temp_output_30_0_g127587 = ( break1867_g127014.r * break33_g127587.x );
				float temp_output_29_0_g127587 = ( break1867_g127014.g * break33_g127587.y );
				float temp_output_31_0_g127587 = ( break1867_g127014.b * break33_g127587.z );
				float temp_output_28_0_g127587 = ( temp_output_30_0_g127587 + temp_output_29_0_g127587 + temp_output_31_0_g127587 + ( break1867_g127014.a * break33_g127587.w ) );
				float temp_output_1860_0_g127014 = temp_output_28_0_g127587;
				float4 break33_g127591 = _motion_tiny_proc_mode;
				float temp_output_30_0_g127591 = ( Final_HeightMask1815_g127014 * break33_g127591.x );
				float temp_output_29_0_g127591 = ( Final_SphereMask1816_g127014 * break33_g127591.y );
				float temp_output_1864_0_g127014 = ( temp_output_30_0_g127591 + temp_output_29_0_g127591 );
				float lerpResult1891_g127014 = lerp( temp_output_1860_0_g127014 , temp_output_1864_0_g127014 , _motion_tiny_mask_mode);
				half Tiny_Mask_Legacy1880_g127014 = break1878_g127014.y;
				#ifdef TVE_LEGACY
				float staticSwitch1886_g127014 = Tiny_Mask_Legacy1880_g127014;
				#else
				float staticSwitch1886_g127014 = lerpResult1891_g127014;
				#endif
				float clampResult17_g127595 = clamp( staticSwitch1886_g127014 , 0.0001 , 0.9999 );
				float temp_output_7_0_g127596 = _MotionTinyMaskRemap.x;
				float temp_output_9_0_g127596 = ( clampResult17_g127595 - temp_output_7_0_g127596 );
				float temp_output_6_0_g127597 = saturate( ( ( temp_output_9_0_g127596 / ( _MotionTinyMaskRemap.y - temp_output_7_0_g127596 ) ) + 0.0001 ) );
				#ifdef TVE_REGISTER
				float staticSwitch14_g127597 = ( temp_output_6_0_g127597 + ( _MotionTinyMaskMode * 0.0 ) );
				#else
				float staticSwitch14_g127597 = temp_output_6_0_g127597;
				#endif
				half Motion_TinyMask1717_g127014 = staticSwitch14_g127597;
				float ifLocalVar40_g127093 = 0;
				if( Debug_Index464_g127014 == 15.0 )
				ifLocalVar40_g127093 = Motion_TinyMask1717_g127014;
				float3 appendResult60_g127088 = (float3(v.ase_texcoord3.x , 0.0 , v.ase_texcoord3.y));
				float3 ifLocalVar40_g127094 = 0;
				if( Debug_Index464_g127014 == 16.0 )
				ifLocalVar40_g127094 = appendResult60_g127088;
				float3 vertexToFrag328_g127014 = ( ( ifLocalVar40_g127015 + ifLocalVar40_g127022 + ifLocalVar40_g127028 + ifLocalVar40_g127020 ) + ( ifLocalVar40_g127064 + ifLocalVar40_g127065 + ifLocalVar40_g127066 + ifLocalVar40_g127067 ) + ( ifLocalVar40_g127068 + ifLocalVar40_g127069 + ifLocalVar40_g127089 ) + ( ifLocalVar40_g127090 + ifLocalVar40_g127091 + ifLocalVar40_g127092 + ifLocalVar40_g127093 + ifLocalVar40_g127094 ) );
				o.ase_texcoord10.xyz = vertexToFrag328_g127014;
				
				o.ase_texcoord8 = v.ase_texcoord;
				o.ase_texcoord9 = v.texcoord1.xyzw;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord10.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.vertex.w = 1;
				v.normal = v.normal;
				v.tangent = v.tangent;

				o.pos = UnityObjectToClipPos(v.vertex);
				float3 worldPos = mul(unity_ObjectToWorld, v.vertex).xyz;
				fixed3 worldNormal = UnityObjectToWorldNormal(v.normal);
				fixed3 worldTangent = UnityObjectToWorldDir(v.tangent.xyz);
				fixed tangentSign = v.tangent.w * unity_WorldTransformParams.w;
				fixed3 worldBinormal = cross(worldNormal, worldTangent) * tangentSign;
				o.tSpace0 = float4(worldTangent.x, worldBinormal.x, worldNormal.x, worldPos.x);
				o.tSpace1 = float4(worldTangent.y, worldBinormal.y, worldNormal.y, worldPos.y);
				o.tSpace2 = float4(worldTangent.z, worldBinormal.z, worldNormal.z, worldPos.z);

				#ifdef DYNAMICLIGHTMAP_ON
					o.lmap.zw = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#else
					o.lmap.zw = 0;
				#endif
				#ifdef LIGHTMAP_ON
					o.lmap.xy = v.texcoord1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
					#ifdef DIRLIGHTMAP_OFF
						o.lmapFadePos.xyz = (mul(unity_ObjectToWorld, v.vertex).xyz - unity_ShadowFadeCenterAndType.xyz) * unity_ShadowFadeCenterAndType.w;
						o.lmapFadePos.w = (-UnityObjectToViewPos(v.vertex).z) * (1.0 - unity_ShadowFadeCenterAndType.w);
					#endif
				#else
					o.lmap.xy = 0;
					#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
						o.sh = 0;
						o.sh = ShadeSHPerVertex (worldNormal, o.sh);
					#endif
				#endif
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float4 tangent : TANGENT;
				float3 normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_texcoord3 : TEXCOORD3;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( appdata v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.tangent = v.tangent;
				o.normal = v.normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_texcoord3 = v.ase_texcoord3;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, UNITY_MATRIX_M, _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, UNITY_MATRIX_M, _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			v2f DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				appdata o = (appdata) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.tangent = patch[0].tangent * bary.x + patch[1].tangent * bary.y + patch[2].tangent * bary.z;
				o.normal = patch[0].normal * bary.x + patch[1].normal * bary.y + patch[2].normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_texcoord3 = patch[0].ase_texcoord3 * bary.x + patch[1].ase_texcoord3 * bary.y + patch[2].ase_texcoord3 * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].normal * (dot(o.vertex.xyz, patch[i].normal) - dot(patch[i].vertex.xyz, patch[i].normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			v2f vert ( appdata v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag (v2f IN , bool ase_vface : SV_IsFrontFace
				, out half4 outGBuffer0 : SV_Target0
				, out half4 outGBuffer1 : SV_Target1
				, out half4 outGBuffer2 : SV_Target2
				, out half4 outEmission : SV_Target3
				#if defined(SHADOWS_SHADOWMASK) && (UNITY_ALLOWED_MRT_COUNT > 4)
				, out half4 outShadowMask : SV_Target4
				#endif
				#ifdef _DEPTHOFFSET_ON
				, out float outputDepth : SV_Depth
				#endif
			)
			{
				UNITY_SETUP_INSTANCE_ID(IN);

				#ifdef LOD_FADE_CROSSFADE
					UNITY_APPLY_DITHER_CROSSFADE(IN.pos.xy);
				#endif

				#if defined(_SPECULAR_SETUP)
					SurfaceOutputStandardSpecular o = (SurfaceOutputStandardSpecular)0;
				#else
					SurfaceOutputStandard o = (SurfaceOutputStandard)0;
				#endif
				float3 WorldTangent = float3(IN.tSpace0.x,IN.tSpace1.x,IN.tSpace2.x);
				float3 WorldBiTangent = float3(IN.tSpace0.y,IN.tSpace1.y,IN.tSpace2.y);
				float3 WorldNormal = float3(IN.tSpace0.z,IN.tSpace1.z,IN.tSpace2.z);
				float3 worldPos = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 worldViewDir = normalize(UnityWorldSpaceViewDir(worldPos));
				half atten = 1;

				float4 color690_g127014 = IsGammaSpace() ? float4(0.1,0.1,0.1,0) : float4(0.01002283,0.01002283,0.01002283,0);
				float4 Shading_Inactive1492_g127014 = color690_g127014;
				float Debug_Type367_g127014 = TVE_DEBUG_Type;
				float4 color646_g127014 = IsGammaSpace() ? float4(0.9245283,0.7969696,0.4142933,1) : float4(0.8368256,0.5987038,0.1431069,1);
				float4 Output_Converted717_g127014 = color646_g127014;
				float4 ifLocalVar40_g127075 = 0;
				if( Debug_Type367_g127014 == 0.0 )
				ifLocalVar40_g127075 = Output_Converted717_g127014;
				float4 color1529_g127014 = IsGammaSpace() ? float4(0.9254902,0.7960784,0.4156863,1) : float4(0.8387991,0.5972018,0.1441285,1);
				float _IsCoreShader1551_g127014 = _IsCoreShader;
				float4 color1539_g127014 = IsGammaSpace() ? float4(0.6196079,0.7686275,0.1490196,0) : float4(0.3419145,0.5520116,0.01938236,0);
				float _IsBlanketShader1554_g127014 = _IsBlanketShader;
				float4 color1542_g127014 = IsGammaSpace() ? float4(0.9716981,0.3162602,0.4816265,0) : float4(0.9368213,0.08154967,0.1974273,0);
				float _IsImpostorShader1110_g127014 = _IsImpostorShader;
				float4 color1544_g127014 = IsGammaSpace() ? float4(0.3254902,0.6117647,0.8117647,0) : float4(0.08650047,0.3324516,0.6239604,0);
				float _IsPolygonalShader1112_g127014 = _IsPolygonalShader;
				float4 color1649_g127014 = IsGammaSpace() ? float4(0.6,0.6,0.6,0) : float4(0.3185468,0.3185468,0.3185468,0);
				float _IsLiteShader1648_g127014 = _IsLiteShader;
				float4 Output_Scope1531_g127014 = ( ( color1529_g127014 * _IsCoreShader1551_g127014 ) + ( color1539_g127014 * _IsBlanketShader1554_g127014 ) + ( color1542_g127014 * _IsImpostorShader1110_g127014 ) + ( color1544_g127014 * _IsPolygonalShader1112_g127014 ) + ( color1649_g127014 * _IsLiteShader1648_g127014 ) );
				float4 ifLocalVar40_g127077 = 0;
				if( Debug_Type367_g127014 == 2.0 )
				ifLocalVar40_g127077 = Output_Scope1531_g127014;
				float4 color529_g127014 = IsGammaSpace() ? float4(0.62,0.77,0.15,0) : float4(0.3423916,0.5542217,0.01960665,0);
				float _IsVertexShader1158_g127014 = _IsVertexShader;
				float4 color544_g127014 = IsGammaSpace() ? float4(0.3252937,0.6122813,0.8113208,0) : float4(0.08639329,0.3330702,0.6231937,0);
				float _IsSimpleShader359_g127014 = _IsSimpleShader;
				float4 color521_g127014 = IsGammaSpace() ? float4(0.6566009,0.3404236,0.8490566,0) : float4(0.3886527,0.09487338,0.6903409,0);
				float _IsStandardShader344_g127014 = _IsStandardShader;
				float4 color1121_g127014 = IsGammaSpace() ? float4(0.9716981,0.88463,0.1787558,0) : float4(0.9368213,0.7573396,0.02686729,0);
				float _IsSubsurfaceShader548_g127014 = _IsSubsurfaceShader;
				float4 Output_Lighting525_g127014 = ( ( color529_g127014 * _IsVertexShader1158_g127014 ) + ( color544_g127014 * _IsSimpleShader359_g127014 ) + ( color521_g127014 * _IsStandardShader344_g127014 ) + ( color1121_g127014 * _IsSubsurfaceShader548_g127014 ) );
				float4 ifLocalVar40_g127078 = 0;
				if( Debug_Type367_g127014 == 3.0 )
				ifLocalVar40_g127078 = Output_Lighting525_g127014;
				float4 color1559_g127014 = IsGammaSpace() ? float4(0.9245283,0.7969696,0.4142933,1) : float4(0.8368256,0.5987038,0.1431069,1);
				float4 color1563_g127014 = IsGammaSpace() ? float4(0.3053578,0.8867924,0.5362216,0) : float4(0.0759199,0.7615293,0.2491121,0);
				float _IsCustomShader1570_g127014 = _IsCustomShader;
				float4 lerpResult1561_g127014 = lerp( color1559_g127014 , color1563_g127014 , _IsCustomShader1570_g127014);
				float4 Output_Custom1560_g127014 = lerpResult1561_g127014;
				float4 ifLocalVar40_g127079 = 0;
				if( Debug_Type367_g127014 == 4.0 )
				ifLocalVar40_g127079 = Output_Custom1560_g127014;
				float3 hsvTorgb1452_g127014 = HSVToRGB( float3(( _IsIdentifier / 1000.0 ),1.0,1.0) );
				float3 gammaToLinear1453_g127014 = GammaToLinearSpace( hsvTorgb1452_g127014 );
				float4 appendResult1657_g127014 = (float4(gammaToLinear1453_g127014 , 1.0));
				float4 Output_Sharing1355_g127014 = appendResult1657_g127014;
				float4 ifLocalVar40_g127080 = 0;
				if( Debug_Type367_g127014 == 5.0 )
				ifLocalVar40_g127080 = Output_Sharing1355_g127014;
				float Debug_Index464_g127014 = TVE_DEBUG_Index;
				half2 Main_UVs1219_g127014 = ( ( IN.ase_texcoord8.xy * (_main_coord_value).xy ) + (_main_coord_value).zw );
				float4 tex2DNode586_g127014 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g127014 );
				float3 appendResult637_g127014 = (float3(tex2DNode586_g127014.r , tex2DNode586_g127014.g , tex2DNode586_g127014.b));
				float3 ifLocalVar40_g127021 = 0;
				if( Debug_Index464_g127014 == 0.0 )
				ifLocalVar40_g127021 = appendResult637_g127014;
				float ifLocalVar40_g127025 = 0;
				if( Debug_Index464_g127014 == 1.0 )
				ifLocalVar40_g127025 = SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, Main_UVs1219_g127014 ).a;
				float4 tex2DNode604_g127014 = SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, Main_UVs1219_g127014 );
				float3 appendResult876_g127014 = (float3(tex2DNode604_g127014.a , tex2DNode604_g127014.g , 1.0));
				float3 gammaToLinear878_g127014 = GammaToLinearSpace( appendResult876_g127014 );
				float3 ifLocalVar40_g127029 = 0;
				if( Debug_Index464_g127014 == 2.0 )
				ifLocalVar40_g127029 = gammaToLinear878_g127014;
				float ifLocalVar40_g127017 = 0;
				if( Debug_Index464_g127014 == 3.0 )
				ifLocalVar40_g127017 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).r;
				float ifLocalVar40_g127035 = 0;
				if( Debug_Index464_g127014 == 4.0 )
				ifLocalVar40_g127035 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).g;
				float ifLocalVar40_g127026 = 0;
				if( Debug_Index464_g127014 == 5.0 )
				ifLocalVar40_g127026 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).b;
				float ifLocalVar40_g127016 = 0;
				if( Debug_Index464_g127014 == 6.0 )
				ifLocalVar40_g127016 = SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, Main_UVs1219_g127014 ).a;
				float2 appendResult1251_g127014 = (float2(IN.ase_texcoord9.z , IN.ase_texcoord9.w));
				float2 Mesh_DetailCoord1254_g127014 = appendResult1251_g127014;
				float2 lerpResult1231_g127014 = lerp( IN.ase_texcoord8.xy , Mesh_DetailCoord1254_g127014 , _DetailCoordMode);
				half2 Layer_02_UVs1234_g127014 = ( ( lerpResult1231_g127014 * (_SecondUVs).xy ) + (_SecondUVs).zw );
				float4 tex2DNode854_g127014 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Layer_02_UVs1234_g127014 );
				float3 appendResult839_g127014 = (float3(tex2DNode854_g127014.r , tex2DNode854_g127014.g , tex2DNode854_g127014.b));
				float3 ifLocalVar40_g127019 = 0;
				if( Debug_Index464_g127014 == 7.0 )
				ifLocalVar40_g127019 = appendResult839_g127014;
				float ifLocalVar40_g127027 = 0;
				if( Debug_Index464_g127014 == 8.0 )
				ifLocalVar40_g127027 = SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, Layer_02_UVs1234_g127014 ).a;
				float4 tex2DNode841_g127014 = SAMPLE_TEXTURE2D( _SecondNormalTex, sampler_SecondNormalTex, Layer_02_UVs1234_g127014 );
				float3 appendResult880_g127014 = (float3(tex2DNode841_g127014.a , tex2DNode841_g127014.g , 1.0));
				float3 gammaToLinear879_g127014 = GammaToLinearSpace( appendResult880_g127014 );
				float3 ifLocalVar40_g127034 = 0;
				if( Debug_Index464_g127014 == 8.0 )
				ifLocalVar40_g127034 = gammaToLinear879_g127014;
				float ifLocalVar40_g127030 = 0;
				if( Debug_Index464_g127014 == 10.0 )
				ifLocalVar40_g127030 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).r;
				float ifLocalVar40_g127024 = 0;
				if( Debug_Index464_g127014 == 11.0 )
				ifLocalVar40_g127024 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).g;
				float ifLocalVar40_g127032 = 0;
				if( Debug_Index464_g127014 == 12.0 )
				ifLocalVar40_g127032 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).b;
				float ifLocalVar40_g127033 = 0;
				if( Debug_Index464_g127014 == 13.0 )
				ifLocalVar40_g127033 = SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, Layer_02_UVs1234_g127014 ).a;
				half2 Emissive_UVs1245_g127014 = ( ( IN.ase_texcoord8.xy * (_EmissiveUVs).xy ) + (_EmissiveUVs).zw );
				float4 tex2DNode858_g127014 = SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, Emissive_UVs1245_g127014 );
				float ifLocalVar40_g127023 = 0;
				if( Debug_Index464_g127014 == 14.0 )
				ifLocalVar40_g127023 = tex2DNode858_g127014.r;
				float Debug_Min721_g127014 = TVE_DEBUG_Min;
				float temp_output_7_0_g127031 = Debug_Min721_g127014;
				float4 temp_cast_3 = (temp_output_7_0_g127031).xxxx;
				float4 temp_output_9_0_g127031 = ( ( float4( ( ( ifLocalVar40_g127021 + ifLocalVar40_g127025 + ifLocalVar40_g127029 ) + ( ifLocalVar40_g127017 + ifLocalVar40_g127035 + ifLocalVar40_g127026 + ifLocalVar40_g127016 ) ) , 0.0 ) + float4( ( ( ( ifLocalVar40_g127019 + ifLocalVar40_g127027 + ifLocalVar40_g127034 ) + ( ifLocalVar40_g127030 + ifLocalVar40_g127024 + ifLocalVar40_g127032 + ifLocalVar40_g127033 ) ) * _DetailMode ) , 0.0 ) + ( ( ifLocalVar40_g127023 * _EmissiveColor ) * _EmissiveCat ) ) - temp_cast_3 );
				float Debug_Max723_g127014 = TVE_DEBUG_Max;
				float4 Output_Maps561_g127014 = saturate( ( ( temp_output_9_0_g127031 / ( Debug_Max723_g127014 - temp_output_7_0_g127031 ) ) + 0.0001 ) );
				float4 ifLocalVar40_g127081 = 0;
				if( Debug_Type367_g127014 == 6.0 )
				ifLocalVar40_g127081 = Output_Maps561_g127014;
				float Resolution44_g127052 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
				float4 color62_g127052 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g127052 = 0;
				if( Resolution44_g127052 <= 256.0 )
				ifLocalVar61_g127052 = color62_g127052;
				float4 color55_g127052 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g127052 = 0;
				if( Resolution44_g127052 == 512.0 )
				ifLocalVar56_g127052 = color55_g127052;
				float4 color42_g127052 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g127052 = 0;
				if( Resolution44_g127052 == 1024.0 )
				ifLocalVar40_g127052 = color42_g127052;
				float4 color48_g127052 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g127052 = 0;
				if( Resolution44_g127052 == 2048.0 )
				ifLocalVar47_g127052 = color48_g127052;
				float4 color51_g127052 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g127052 = 0;
				if( Resolution44_g127052 >= 4096.0 )
				ifLocalVar52_g127052 = color51_g127052;
				float4 ifLocalVar40_g127038 = 0;
				if( Debug_Index464_g127014 == 0.0 )
				ifLocalVar40_g127038 = ( ifLocalVar61_g127052 + ifLocalVar56_g127052 + ifLocalVar40_g127052 + ifLocalVar47_g127052 + ifLocalVar52_g127052 );
				float Resolution44_g127051 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
				float4 color62_g127051 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g127051 = 0;
				if( Resolution44_g127051 <= 256.0 )
				ifLocalVar61_g127051 = color62_g127051;
				float4 color55_g127051 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g127051 = 0;
				if( Resolution44_g127051 == 512.0 )
				ifLocalVar56_g127051 = color55_g127051;
				float4 color42_g127051 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g127051 = 0;
				if( Resolution44_g127051 == 1024.0 )
				ifLocalVar40_g127051 = color42_g127051;
				float4 color48_g127051 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g127051 = 0;
				if( Resolution44_g127051 == 2048.0 )
				ifLocalVar47_g127051 = color48_g127051;
				float4 color51_g127051 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g127051 = 0;
				if( Resolution44_g127051 >= 4096.0 )
				ifLocalVar52_g127051 = color51_g127051;
				float4 ifLocalVar40_g127036 = 0;
				if( Debug_Index464_g127014 == 1.0 )
				ifLocalVar40_g127036 = ( ifLocalVar61_g127051 + ifLocalVar56_g127051 + ifLocalVar40_g127051 + ifLocalVar47_g127051 + ifLocalVar52_g127051 );
				float Resolution44_g127050 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
				float4 color62_g127050 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g127050 = 0;
				if( Resolution44_g127050 <= 256.0 )
				ifLocalVar61_g127050 = color62_g127050;
				float4 color55_g127050 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g127050 = 0;
				if( Resolution44_g127050 == 512.0 )
				ifLocalVar56_g127050 = color55_g127050;
				float4 color42_g127050 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g127050 = 0;
				if( Resolution44_g127050 == 1024.0 )
				ifLocalVar40_g127050 = color42_g127050;
				float4 color48_g127050 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g127050 = 0;
				if( Resolution44_g127050 == 2048.0 )
				ifLocalVar47_g127050 = color48_g127050;
				float4 color51_g127050 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g127050 = 0;
				if( Resolution44_g127050 >= 4096.0 )
				ifLocalVar52_g127050 = color51_g127050;
				float4 ifLocalVar40_g127037 = 0;
				if( Debug_Index464_g127014 == 2.0 )
				ifLocalVar40_g127037 = ( ifLocalVar61_g127050 + ifLocalVar56_g127050 + ifLocalVar40_g127050 + ifLocalVar47_g127050 + ifLocalVar52_g127050 );
				float Resolution44_g127057 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 color62_g127057 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g127057 = 0;
				if( Resolution44_g127057 <= 256.0 )
				ifLocalVar61_g127057 = color62_g127057;
				float4 color55_g127057 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g127057 = 0;
				if( Resolution44_g127057 == 512.0 )
				ifLocalVar56_g127057 = color55_g127057;
				float4 color42_g127057 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g127057 = 0;
				if( Resolution44_g127057 == 1024.0 )
				ifLocalVar40_g127057 = color42_g127057;
				float4 color48_g127057 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g127057 = 0;
				if( Resolution44_g127057 == 2048.0 )
				ifLocalVar47_g127057 = color48_g127057;
				float4 color51_g127057 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g127057 = 0;
				if( Resolution44_g127057 >= 4096.0 )
				ifLocalVar52_g127057 = color51_g127057;
				float4 ifLocalVar40_g127044 = 0;
				if( Debug_Index464_g127014 == 3.0 )
				ifLocalVar40_g127044 = ( ifLocalVar61_g127057 + ifLocalVar56_g127057 + ifLocalVar40_g127057 + ifLocalVar47_g127057 + ifLocalVar52_g127057 );
				float Resolution44_g127056 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
				float4 color62_g127056 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g127056 = 0;
				if( Resolution44_g127056 <= 256.0 )
				ifLocalVar61_g127056 = color62_g127056;
				float4 color55_g127056 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g127056 = 0;
				if( Resolution44_g127056 == 512.0 )
				ifLocalVar56_g127056 = color55_g127056;
				float4 color42_g127056 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g127056 = 0;
				if( Resolution44_g127056 == 1024.0 )
				ifLocalVar40_g127056 = color42_g127056;
				float4 color48_g127056 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g127056 = 0;
				if( Resolution44_g127056 == 2048.0 )
				ifLocalVar47_g127056 = color48_g127056;
				float4 color51_g127056 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g127056 = 0;
				if( Resolution44_g127056 >= 4096.0 )
				ifLocalVar52_g127056 = color51_g127056;
				float4 ifLocalVar40_g127042 = 0;
				if( Debug_Index464_g127014 == 4.0 )
				ifLocalVar40_g127042 = ( ifLocalVar61_g127056 + ifLocalVar56_g127056 + ifLocalVar40_g127056 + ifLocalVar47_g127056 + ifLocalVar52_g127056 );
				float Resolution44_g127058 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 color62_g127058 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g127058 = 0;
				if( Resolution44_g127058 <= 256.0 )
				ifLocalVar61_g127058 = color62_g127058;
				float4 color55_g127058 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g127058 = 0;
				if( Resolution44_g127058 == 512.0 )
				ifLocalVar56_g127058 = color55_g127058;
				float4 color42_g127058 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g127058 = 0;
				if( Resolution44_g127058 == 1024.0 )
				ifLocalVar40_g127058 = color42_g127058;
				float4 color48_g127058 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g127058 = 0;
				if( Resolution44_g127058 == 2048.0 )
				ifLocalVar47_g127058 = color48_g127058;
				float4 color51_g127058 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g127058 = 0;
				if( Resolution44_g127058 >= 4096.0 )
				ifLocalVar52_g127058 = color51_g127058;
				float4 ifLocalVar40_g127043 = 0;
				if( Debug_Index464_g127014 == 5.0 )
				ifLocalVar40_g127043 = ( ifLocalVar61_g127058 + ifLocalVar56_g127058 + ifLocalVar40_g127058 + ifLocalVar47_g127058 + ifLocalVar52_g127058 );
				float Resolution44_g127055 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
				float4 color62_g127055 = IsGammaSpace() ? float4(0.484069,0.862666,0.9245283,0) : float4(0.1995908,0.7155456,0.8368256,0);
				float4 ifLocalVar61_g127055 = 0;
				if( Resolution44_g127055 <= 256.0 )
				ifLocalVar61_g127055 = color62_g127055;
				float4 color55_g127055 = IsGammaSpace() ? float4(0.1933962,0.7383016,1,0) : float4(0.03108436,0.5044825,1,0);
				float4 ifLocalVar56_g127055 = 0;
				if( Resolution44_g127055 == 512.0 )
				ifLocalVar56_g127055 = color55_g127055;
				float4 color42_g127055 = IsGammaSpace() ? float4(0.4431373,0.7921569,0.1764706,0) : float4(0.1651322,0.5906189,0.02624122,0);
				float4 ifLocalVar40_g127055 = 0;
				if( Resolution44_g127055 == 1024.0 )
				ifLocalVar40_g127055 = color42_g127055;
				float4 color48_g127055 = IsGammaSpace() ? float4(1,0.6889491,0.07075471,0) : float4(1,0.4324122,0.006068094,0);
				float4 ifLocalVar47_g127055 = 0;
				if( Resolution44_g127055 == 2048.0 )
				ifLocalVar47_g127055 = color48_g127055;
				float4 color51_g127055 = IsGammaSpace() ? float4(1,0.2066492,0.0990566,0) : float4(1,0.03521443,0.009877041,0);
				float4 ifLocalVar52_g127055 = 0;
				if( Resolution44_g127055 >= 4096.0 )
				ifLocalVar52_g127055 = color51_g127055;
				float4 ifLocalVar40_g127045 = 0;
				if( Debug_Index464_g127014 == 6.0 )
				ifLocalVar40_g127045 = ( ifLocalVar61_g127055 + ifLocalVar56_g127055 + ifLocalVar40_g127055 + ifLocalVar47_g127055 + ifLocalVar52_g127055 );
				float4 Output_Resolution737_g127014 = ( ( ifLocalVar40_g127038 + ifLocalVar40_g127036 + ifLocalVar40_g127037 ) + ( ifLocalVar40_g127044 + ifLocalVar40_g127042 + ifLocalVar40_g127043 ) + ifLocalVar40_g127045 );
				float4 ifLocalVar40_g127082 = 0;
				if( Debug_Type367_g127014 == 7.0 )
				ifLocalVar40_g127082 = Output_Resolution737_g127014;
				float2 uv_MainAlbedoTex = IN.ase_texcoord8.xy * _MainAlbedoTex_ST.xy + _MainAlbedoTex_ST.zw;
				float2 UVs72_g127063 = Main_UVs1219_g127014;
				float Resolution44_g127063 = max( _MainAlbedoTex_TexelSize.z , _MainAlbedoTex_TexelSize.w );
				float4 tex2DNode77_g127063 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127063 * ( Resolution44_g127063 / 8.0 ) ) );
				float4 lerpResult78_g127063 = lerp( SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ) , tex2DNode77_g127063 , tex2DNode77_g127063.a);
				float4 ifLocalVar40_g127041 = 0;
				if( Debug_Index464_g127014 == 0.0 )
				ifLocalVar40_g127041 = lerpResult78_g127063;
				float2 uv_MainNormalTex = IN.ase_texcoord8.xy * _MainNormalTex_ST.xy + _MainNormalTex_ST.zw;
				float2 UVs72_g127054 = Main_UVs1219_g127014;
				float Resolution44_g127054 = max( _MainNormalTex_TexelSize.z , _MainNormalTex_TexelSize.w );
				float4 tex2DNode77_g127054 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127054 * ( Resolution44_g127054 / 8.0 ) ) );
				float4 lerpResult78_g127054 = lerp( SAMPLE_TEXTURE2D( _MainNormalTex, sampler_MainNormalTex, uv_MainNormalTex ) , tex2DNode77_g127054 , tex2DNode77_g127054.a);
				float4 ifLocalVar40_g127039 = 0;
				if( Debug_Index464_g127014 == 1.0 )
				ifLocalVar40_g127039 = lerpResult78_g127054;
				float2 uv_MainMaskTex = IN.ase_texcoord8.xy * _MainMaskTex_ST.xy + _MainMaskTex_ST.zw;
				float2 UVs72_g127053 = Main_UVs1219_g127014;
				float Resolution44_g127053 = max( _MainMaskTex_TexelSize.z , _MainMaskTex_TexelSize.w );
				float4 tex2DNode77_g127053 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127053 * ( Resolution44_g127053 / 8.0 ) ) );
				float4 lerpResult78_g127053 = lerp( SAMPLE_TEXTURE2D( _MainMaskTex, sampler_MainMaskTex, uv_MainMaskTex ) , tex2DNode77_g127053 , tex2DNode77_g127053.a);
				float4 ifLocalVar40_g127040 = 0;
				if( Debug_Index464_g127014 == 2.0 )
				ifLocalVar40_g127040 = lerpResult78_g127053;
				float2 uv_SecondAlbedoTex = IN.ase_texcoord8.xy * _SecondAlbedoTex_ST.xy + _SecondAlbedoTex_ST.zw;
				float2 UVs72_g127061 = Layer_02_UVs1234_g127014;
				float Resolution44_g127061 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 tex2DNode77_g127061 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127061 * ( Resolution44_g127061 / 8.0 ) ) );
				float4 lerpResult78_g127061 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g127061 , tex2DNode77_g127061.a);
				float4 ifLocalVar40_g127048 = 0;
				if( Debug_Index464_g127014 == 3.0 )
				ifLocalVar40_g127048 = lerpResult78_g127061;
				float2 uv_SecondMaskTex = IN.ase_texcoord8.xy * _SecondMaskTex_ST.xy + _SecondMaskTex_ST.zw;
				float2 UVs72_g127060 = Layer_02_UVs1234_g127014;
				float Resolution44_g127060 = max( _SecondMaskTex_TexelSize.z , _SecondMaskTex_TexelSize.w );
				float4 tex2DNode77_g127060 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127060 * ( Resolution44_g127060 / 8.0 ) ) );
				float4 lerpResult78_g127060 = lerp( SAMPLE_TEXTURE2D( _SecondMaskTex, sampler_SecondMaskTex, uv_SecondMaskTex ) , tex2DNode77_g127060 , tex2DNode77_g127060.a);
				float4 ifLocalVar40_g127046 = 0;
				if( Debug_Index464_g127014 == 4.0 )
				ifLocalVar40_g127046 = lerpResult78_g127060;
				float2 UVs72_g127062 = Layer_02_UVs1234_g127014;
				float Resolution44_g127062 = max( _SecondAlbedoTex_TexelSize.z , _SecondAlbedoTex_TexelSize.w );
				float4 tex2DNode77_g127062 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127062 * ( Resolution44_g127062 / 8.0 ) ) );
				float4 lerpResult78_g127062 = lerp( SAMPLE_TEXTURE2D( _SecondAlbedoTex, sampler_SecondAlbedoTex, uv_SecondAlbedoTex ) , tex2DNode77_g127062 , tex2DNode77_g127062.a);
				float4 ifLocalVar40_g127047 = 0;
				if( Debug_Index464_g127014 == 5.0 )
				ifLocalVar40_g127047 = lerpResult78_g127062;
				float2 uv_EmissiveTex = IN.ase_texcoord8.xy * _EmissiveTex_ST.xy + _EmissiveTex_ST.zw;
				float2 UVs72_g127059 = Emissive_UVs1245_g127014;
				float Resolution44_g127059 = max( _EmissiveTex_TexelSize.z , _EmissiveTex_TexelSize.w );
				float4 tex2DNode77_g127059 = SAMPLE_TEXTURE2D( TVE_DEBUG_MipTex, samplerTVE_DEBUG_MipTex, ( UVs72_g127059 * ( Resolution44_g127059 / 8.0 ) ) );
				float4 lerpResult78_g127059 = lerp( SAMPLE_TEXTURE2D( _EmissiveTex, sampler_EmissiveTex, uv_EmissiveTex ) , tex2DNode77_g127059 , tex2DNode77_g127059.a);
				float4 ifLocalVar40_g127049 = 0;
				if( Debug_Index464_g127014 == 6.0 )
				ifLocalVar40_g127049 = lerpResult78_g127059;
				float4 Output_MipLevel1284_g127014 = ( ( ifLocalVar40_g127041 + ifLocalVar40_g127039 + ifLocalVar40_g127040 ) + ( ifLocalVar40_g127048 + ifLocalVar40_g127046 + ifLocalVar40_g127047 ) + ifLocalVar40_g127049 );
				float4 ifLocalVar40_g127083 = 0;
				if( Debug_Type367_g127014 == 8.0 )
				ifLocalVar40_g127083 = Output_MipLevel1284_g127014;
				float ifLocalVar40_g127581 = 0;
				if( Debug_Index464_g127014 == 0.0 )
				ifLocalVar40_g127581 = (float3( 0,0,0 )).z;
				float Debug_Layer885_g127014 = TVE_DEBUG_Layer;
				float temp_output_82_0_g127400 = Debug_Layer885_g127014;
				float temp_output_19_0_g127402 = TVE_CoatLayers[(int)temp_output_82_0_g127400];
				float3 WorldPosition893_g127014 = worldPos;
				half3 Input_Position180_g127403 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127403 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127403).xz ) );
				float temp_output_82_0_g127403 = temp_output_82_0_g127400;
				float2 temp_output_119_0_g127403 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127403).xz ) );
				float temp_output_7_0_g127408 = 1.0;
				float temp_output_9_0_g127408 = ( saturate( ( distance( Input_Position180_g127403 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127408 );
				float4 lerpResult131_g127403 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127403,temp_output_82_0_g127403), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127403,temp_output_82_0_g127403), 0.0 ) , saturate( ( temp_output_9_0_g127408 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127408 ) ) ));
				float4 temp_output_17_0_g127402 = lerpResult131_g127403;
				float4 temp_output_3_0_g127402 = TVE_CoatParams;
				float4 ifLocalVar18_g127402 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127402 >= 0.5 )
				ifLocalVar18_g127402 = temp_output_17_0_g127402;
				else
				ifLocalVar18_g127402 = temp_output_3_0_g127402;
				float4 lerpResult22_g127402 = lerp( temp_output_3_0_g127402 , temp_output_17_0_g127402 , temp_output_19_0_g127402);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127402 = lerpResult22_g127402;
				#else
				float4 staticSwitch24_g127402 = ifLocalVar18_g127402;
				#endif
				float ifLocalVar40_g127418 = 0;
				if( Debug_Index464_g127014 == 1.0 )
				ifLocalVar40_g127418 = (staticSwitch24_g127402).g;
				float temp_output_82_0_g127409 = Debug_Layer885_g127014;
				float temp_output_19_0_g127411 = TVE_CoatLayers[(int)temp_output_82_0_g127409];
				half3 Input_Position180_g127412 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127412 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127412).xz ) );
				float temp_output_82_0_g127412 = temp_output_82_0_g127409;
				float2 temp_output_119_0_g127412 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127412).xz ) );
				float temp_output_7_0_g127417 = 1.0;
				float temp_output_9_0_g127417 = ( saturate( ( distance( Input_Position180_g127412 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127417 );
				float4 lerpResult131_g127412 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127412,temp_output_82_0_g127412), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_CoatNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127412,temp_output_82_0_g127412), 0.0 ) , saturate( ( temp_output_9_0_g127417 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127417 ) ) ));
				float4 temp_output_17_0_g127411 = lerpResult131_g127412;
				float4 temp_output_3_0_g127411 = TVE_CoatParams;
				float4 ifLocalVar18_g127411 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127411 >= 0.5 )
				ifLocalVar18_g127411 = temp_output_17_0_g127411;
				else
				ifLocalVar18_g127411 = temp_output_3_0_g127411;
				float4 lerpResult22_g127411 = lerp( temp_output_3_0_g127411 , temp_output_17_0_g127411 , temp_output_19_0_g127411);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127411 = lerpResult22_g127411;
				#else
				float4 staticSwitch24_g127411 = ifLocalVar18_g127411;
				#endif
				float ifLocalVar40_g127419 = 0;
				if( Debug_Index464_g127014 == 2.0 )
				ifLocalVar40_g127419 = (staticSwitch24_g127411).b;
				float temp_output_82_0_g127429 = Debug_Layer885_g127014;
				float temp_output_19_0_g127431 = TVE_PaintLayers[(int)temp_output_82_0_g127429];
				half3 Input_Position180_g127432 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127432 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127432).xz ) );
				float temp_output_82_0_g127432 = temp_output_82_0_g127429;
				float2 temp_output_119_0_g127432 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127432).xz ) );
				float temp_output_7_0_g127437 = 1.0;
				float temp_output_9_0_g127437 = ( saturate( ( distance( Input_Position180_g127432 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127437 );
				float4 lerpResult131_g127432 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127432,temp_output_82_0_g127432), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127432,temp_output_82_0_g127432), 0.0 ) , saturate( ( temp_output_9_0_g127437 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127437 ) ) ));
				float4 temp_output_17_0_g127431 = lerpResult131_g127432;
				float4 temp_output_3_0_g127431 = TVE_PaintParams;
				float4 ifLocalVar18_g127431 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127431 >= 0.5 )
				ifLocalVar18_g127431 = temp_output_17_0_g127431;
				else
				ifLocalVar18_g127431 = temp_output_3_0_g127431;
				float4 lerpResult22_g127431 = lerp( temp_output_3_0_g127431 , temp_output_17_0_g127431 , temp_output_19_0_g127431);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127431 = lerpResult22_g127431;
				#else
				float4 staticSwitch24_g127431 = ifLocalVar18_g127431;
				#endif
				float3 ifLocalVar40_g127438 = 0;
				if( Debug_Index464_g127014 == 3.0 )
				ifLocalVar40_g127438 = (staticSwitch24_g127431).rgb;
				float temp_output_82_0_g127420 = Debug_Layer885_g127014;
				float temp_output_19_0_g127422 = TVE_PaintLayers[(int)temp_output_82_0_g127420];
				half3 Input_Position180_g127423 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127423 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127423).xz ) );
				float temp_output_82_0_g127423 = temp_output_82_0_g127420;
				float2 temp_output_119_0_g127423 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127423).xz ) );
				float temp_output_7_0_g127428 = 1.0;
				float temp_output_9_0_g127428 = ( saturate( ( distance( Input_Position180_g127423 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127428 );
				float4 lerpResult131_g127423 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127423,temp_output_82_0_g127423), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PaintNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127423,temp_output_82_0_g127423), 0.0 ) , saturate( ( temp_output_9_0_g127428 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127428 ) ) ));
				float4 temp_output_17_0_g127422 = lerpResult131_g127423;
				float4 temp_output_3_0_g127422 = TVE_PaintParams;
				float4 ifLocalVar18_g127422 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127422 >= 0.5 )
				ifLocalVar18_g127422 = temp_output_17_0_g127422;
				else
				ifLocalVar18_g127422 = temp_output_3_0_g127422;
				float4 lerpResult22_g127422 = lerp( temp_output_3_0_g127422 , temp_output_17_0_g127422 , temp_output_19_0_g127422);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127422 = lerpResult22_g127422;
				#else
				float4 staticSwitch24_g127422 = ifLocalVar18_g127422;
				#endif
				float ifLocalVar40_g127439 = 0;
				if( Debug_Index464_g127014 == 4.0 )
				ifLocalVar40_g127439 = saturate( (staticSwitch24_g127422).a );
				float temp_output_82_0_g127440 = Debug_Layer885_g127014;
				float temp_output_19_0_g127442 = TVE_GlowLayers[(int)temp_output_82_0_g127440];
				half3 Input_Position180_g127443 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127443 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127443).xz ) );
				float temp_output_82_0_g127443 = temp_output_82_0_g127440;
				float2 temp_output_119_0_g127443 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127443).xz ) );
				float temp_output_7_0_g127448 = 1.0;
				float temp_output_9_0_g127448 = ( saturate( ( distance( Input_Position180_g127443 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127448 );
				float4 lerpResult131_g127443 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127443,temp_output_82_0_g127443), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127443,temp_output_82_0_g127443), 0.0 ) , saturate( ( temp_output_9_0_g127448 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127448 ) ) ));
				float4 temp_output_17_0_g127442 = lerpResult131_g127443;
				float4 temp_output_3_0_g127442 = TVE_GlowParams;
				float4 ifLocalVar18_g127442 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127442 >= 0.5 )
				ifLocalVar18_g127442 = temp_output_17_0_g127442;
				else
				ifLocalVar18_g127442 = temp_output_3_0_g127442;
				float4 lerpResult22_g127442 = lerp( temp_output_3_0_g127442 , temp_output_17_0_g127442 , temp_output_19_0_g127442);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127442 = lerpResult22_g127442;
				#else
				float4 staticSwitch24_g127442 = ifLocalVar18_g127442;
				#endif
				float3 ifLocalVar40_g127512 = 0;
				if( Debug_Index464_g127014 == 5.0 )
				ifLocalVar40_g127512 = (staticSwitch24_g127442).rgb;
				float temp_output_82_0_g127503 = Debug_Layer885_g127014;
				float temp_output_19_0_g127505 = TVE_GlowLayers[(int)temp_output_82_0_g127503];
				half3 Input_Position180_g127506 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127506 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127506).xz ) );
				float temp_output_82_0_g127506 = temp_output_82_0_g127503;
				float2 temp_output_119_0_g127506 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127506).xz ) );
				float temp_output_7_0_g127511 = 1.0;
				float temp_output_9_0_g127511 = ( saturate( ( distance( Input_Position180_g127506 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127511 );
				float4 lerpResult131_g127506 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127506,temp_output_82_0_g127506), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_GlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127506,temp_output_82_0_g127506), 0.0 ) , saturate( ( temp_output_9_0_g127511 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127511 ) ) ));
				float4 temp_output_17_0_g127505 = lerpResult131_g127506;
				float4 temp_output_3_0_g127505 = TVE_GlowParams;
				float4 ifLocalVar18_g127505 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127505 >= 0.5 )
				ifLocalVar18_g127505 = temp_output_17_0_g127505;
				else
				ifLocalVar18_g127505 = temp_output_3_0_g127505;
				float4 lerpResult22_g127505 = lerp( temp_output_3_0_g127505 , temp_output_17_0_g127505 , temp_output_19_0_g127505);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127505 = lerpResult22_g127505;
				#else
				float4 staticSwitch24_g127505 = ifLocalVar18_g127505;
				#endif
				float ifLocalVar40_g127513 = 0;
				if( Debug_Index464_g127014 == 6.0 )
				ifLocalVar40_g127513 = saturate( (staticSwitch24_g127505).a );
				float temp_output_132_0_g127476 = Debug_Layer885_g127014;
				float temp_output_19_0_g127478 = TVE_AtmoLayers[(int)temp_output_132_0_g127476];
				half3 Input_Position180_g127479 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127479 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127479).xz ) );
				float temp_output_82_0_g127479 = temp_output_132_0_g127476;
				float2 temp_output_119_0_g127479 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127479).xz ) );
				float temp_output_7_0_g127484 = 1.0;
				float temp_output_9_0_g127484 = ( saturate( ( distance( Input_Position180_g127479 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127484 );
				float4 lerpResult131_g127479 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127479,temp_output_82_0_g127479), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127479,temp_output_82_0_g127479), 0.0 ) , saturate( ( temp_output_9_0_g127484 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127484 ) ) ));
				float4 temp_output_17_0_g127478 = lerpResult131_g127479;
				float4 temp_output_3_0_g127478 = TVE_AtmoParams;
				float4 ifLocalVar18_g127478 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127478 >= 0.5 )
				ifLocalVar18_g127478 = temp_output_17_0_g127478;
				else
				ifLocalVar18_g127478 = temp_output_3_0_g127478;
				float4 lerpResult22_g127478 = lerp( temp_output_3_0_g127478 , temp_output_17_0_g127478 , temp_output_19_0_g127478);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127478 = lerpResult22_g127478;
				#else
				float4 staticSwitch24_g127478 = ifLocalVar18_g127478;
				#endif
				float ifLocalVar40_g127514 = 0;
				if( Debug_Index464_g127014 == 7.0 )
				ifLocalVar40_g127514 = (staticSwitch24_g127478).r;
				float temp_output_132_0_g127449 = Debug_Layer885_g127014;
				float temp_output_19_0_g127451 = TVE_AtmoLayers[(int)temp_output_132_0_g127449];
				half3 Input_Position180_g127452 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127452 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127452).xz ) );
				float temp_output_82_0_g127452 = temp_output_132_0_g127449;
				float2 temp_output_119_0_g127452 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127452).xz ) );
				float temp_output_7_0_g127457 = 1.0;
				float temp_output_9_0_g127457 = ( saturate( ( distance( Input_Position180_g127452 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127457 );
				float4 lerpResult131_g127452 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127452,temp_output_82_0_g127452), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127452,temp_output_82_0_g127452), 0.0 ) , saturate( ( temp_output_9_0_g127457 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127457 ) ) ));
				float4 temp_output_17_0_g127451 = lerpResult131_g127452;
				float4 temp_output_3_0_g127451 = TVE_AtmoParams;
				float4 ifLocalVar18_g127451 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127451 >= 0.5 )
				ifLocalVar18_g127451 = temp_output_17_0_g127451;
				else
				ifLocalVar18_g127451 = temp_output_3_0_g127451;
				float4 lerpResult22_g127451 = lerp( temp_output_3_0_g127451 , temp_output_17_0_g127451 , temp_output_19_0_g127451);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127451 = lerpResult22_g127451;
				#else
				float4 staticSwitch24_g127451 = ifLocalVar18_g127451;
				#endif
				float ifLocalVar40_g127515 = 0;
				if( Debug_Index464_g127014 == 8.0 )
				ifLocalVar40_g127515 = (staticSwitch24_g127451).g;
				float temp_output_132_0_g127458 = Debug_Layer885_g127014;
				float temp_output_19_0_g127460 = TVE_AtmoLayers[(int)temp_output_132_0_g127458];
				half3 Input_Position180_g127461 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127461 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127461).xz ) );
				float temp_output_82_0_g127461 = temp_output_132_0_g127458;
				float2 temp_output_119_0_g127461 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127461).xz ) );
				float temp_output_7_0_g127466 = 1.0;
				float temp_output_9_0_g127466 = ( saturate( ( distance( Input_Position180_g127461 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127466 );
				float4 lerpResult131_g127461 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127461,temp_output_82_0_g127461), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127461,temp_output_82_0_g127461), 0.0 ) , saturate( ( temp_output_9_0_g127466 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127466 ) ) ));
				float4 temp_output_17_0_g127460 = lerpResult131_g127461;
				float4 temp_output_3_0_g127460 = TVE_AtmoParams;
				float4 ifLocalVar18_g127460 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127460 >= 0.5 )
				ifLocalVar18_g127460 = temp_output_17_0_g127460;
				else
				ifLocalVar18_g127460 = temp_output_3_0_g127460;
				float4 lerpResult22_g127460 = lerp( temp_output_3_0_g127460 , temp_output_17_0_g127460 , temp_output_19_0_g127460);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127460 = lerpResult22_g127460;
				#else
				float4 staticSwitch24_g127460 = ifLocalVar18_g127460;
				#endif
				float ifLocalVar40_g127516 = 0;
				if( Debug_Index464_g127014 == 9.0 )
				ifLocalVar40_g127516 = (staticSwitch24_g127460).b;
				float temp_output_132_0_g127467 = Debug_Layer885_g127014;
				float temp_output_19_0_g127469 = TVE_AtmoLayers[(int)temp_output_132_0_g127467];
				half3 Input_Position180_g127470 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127470 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127470).xz ) );
				float temp_output_82_0_g127470 = temp_output_132_0_g127467;
				float2 temp_output_119_0_g127470 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127470).xz ) );
				float temp_output_7_0_g127475 = 1.0;
				float temp_output_9_0_g127475 = ( saturate( ( distance( Input_Position180_g127470 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127475 );
				float4 lerpResult131_g127470 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127470,temp_output_82_0_g127470), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_AtmoNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127470,temp_output_82_0_g127470), 0.0 ) , saturate( ( temp_output_9_0_g127475 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127475 ) ) ));
				float4 temp_output_17_0_g127469 = lerpResult131_g127470;
				float4 temp_output_3_0_g127469 = TVE_AtmoParams;
				float4 ifLocalVar18_g127469 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127469 >= 0.5 )
				ifLocalVar18_g127469 = temp_output_17_0_g127469;
				else
				ifLocalVar18_g127469 = temp_output_3_0_g127469;
				float4 lerpResult22_g127469 = lerp( temp_output_3_0_g127469 , temp_output_17_0_g127469 , temp_output_19_0_g127469);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127469 = lerpResult22_g127469;
				#else
				float4 staticSwitch24_g127469 = ifLocalVar18_g127469;
				#endif
				float ifLocalVar40_g127517 = 0;
				if( Debug_Index464_g127014 == 10.0 )
				ifLocalVar40_g127517 = saturate( (staticSwitch24_g127469).a );
				float temp_output_130_0_g127494 = Debug_Layer885_g127014;
				float temp_output_19_0_g127496 = TVE_FormLayers[(int)temp_output_130_0_g127494];
				half3 Input_Position180_g127497 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127497 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127497).xz ) );
				float temp_output_82_0_g127497 = temp_output_130_0_g127494;
				float2 temp_output_119_0_g127497 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127497).xz ) );
				float temp_output_7_0_g127502 = 1.0;
				float temp_output_9_0_g127502 = ( saturate( ( distance( Input_Position180_g127497 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127502 );
				float4 lerpResult131_g127497 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127497,temp_output_82_0_g127497), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127497,temp_output_82_0_g127497), 0.0 ) , saturate( ( temp_output_9_0_g127502 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127502 ) ) ));
				float4 temp_output_17_0_g127496 = lerpResult131_g127497;
				float4 temp_output_3_0_g127496 = TVE_FormParams;
				float4 ifLocalVar18_g127496 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127496 >= 0.5 )
				ifLocalVar18_g127496 = temp_output_17_0_g127496;
				else
				ifLocalVar18_g127496 = temp_output_3_0_g127496;
				float4 lerpResult22_g127496 = lerp( temp_output_3_0_g127496 , temp_output_17_0_g127496 , temp_output_19_0_g127496);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127496 = lerpResult22_g127496;
				#else
				float4 staticSwitch24_g127496 = ifLocalVar18_g127496;
				#endif
				float3 appendResult1013_g127014 = (float3((staticSwitch24_g127496).rg , 0.0));
				float3 ifLocalVar40_g127518 = 0;
				if( Debug_Index464_g127014 == 11.0 )
				ifLocalVar40_g127518 = appendResult1013_g127014;
				float temp_output_130_0_g127485 = Debug_Layer885_g127014;
				float temp_output_19_0_g127487 = TVE_FormLayers[(int)temp_output_130_0_g127485];
				half3 Input_Position180_g127488 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127488 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127488).xz ) );
				float temp_output_82_0_g127488 = temp_output_130_0_g127485;
				float2 temp_output_119_0_g127488 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127488).xz ) );
				float temp_output_7_0_g127493 = 1.0;
				float temp_output_9_0_g127493 = ( saturate( ( distance( Input_Position180_g127488 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127493 );
				float4 lerpResult131_g127488 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127488,temp_output_82_0_g127488), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127488,temp_output_82_0_g127488), 0.0 ) , saturate( ( temp_output_9_0_g127493 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127493 ) ) ));
				float4 temp_output_17_0_g127487 = lerpResult131_g127488;
				float4 temp_output_3_0_g127487 = TVE_FormParams;
				float4 ifLocalVar18_g127487 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127487 >= 0.5 )
				ifLocalVar18_g127487 = temp_output_17_0_g127487;
				else
				ifLocalVar18_g127487 = temp_output_3_0_g127487;
				float4 lerpResult22_g127487 = lerp( temp_output_3_0_g127487 , temp_output_17_0_g127487 , temp_output_19_0_g127487);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127487 = lerpResult22_g127487;
				#else
				float4 staticSwitch24_g127487 = ifLocalVar18_g127487;
				#endif
				float ifLocalVar40_g127519 = 0;
				if( Debug_Index464_g127014 == 12.0 )
				ifLocalVar40_g127519 = saturate( (staticSwitch24_g127487).b );
				float temp_output_130_0_g127542 = Debug_Layer885_g127014;
				float temp_output_19_0_g127544 = TVE_FormLayers[(int)temp_output_130_0_g127542];
				half3 Input_Position180_g127545 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127545 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127545).xz ) );
				float temp_output_82_0_g127545 = temp_output_130_0_g127542;
				float2 temp_output_119_0_g127545 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127545).xz ) );
				float temp_output_7_0_g127550 = 1.0;
				float temp_output_9_0_g127550 = ( saturate( ( distance( Input_Position180_g127545 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127550 );
				float4 lerpResult131_g127545 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127545,temp_output_82_0_g127545), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FormNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127545,temp_output_82_0_g127545), 0.0 ) , saturate( ( temp_output_9_0_g127550 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127550 ) ) ));
				float4 temp_output_17_0_g127544 = lerpResult131_g127545;
				float4 temp_output_3_0_g127544 = TVE_FormParams;
				float4 ifLocalVar18_g127544 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127544 >= 0.5 )
				ifLocalVar18_g127544 = temp_output_17_0_g127544;
				else
				ifLocalVar18_g127544 = temp_output_3_0_g127544;
				float4 lerpResult22_g127544 = lerp( temp_output_3_0_g127544 , temp_output_17_0_g127544 , temp_output_19_0_g127544);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127544 = lerpResult22_g127544;
				#else
				float4 staticSwitch24_g127544 = ifLocalVar18_g127544;
				#endif
				float ifLocalVar40_g127551 = 0;
				if( Debug_Index464_g127014 == 13.0 )
				ifLocalVar40_g127551 = saturate( (staticSwitch24_g127544).a );
				float temp_output_136_0_g127520 = Debug_Layer885_g127014;
				float temp_output_19_0_g127522 = TVE_FlowLayers[(int)temp_output_136_0_g127520];
				half3 Input_Position180_g127523 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127523 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127523).xz ) );
				float temp_output_82_0_g127523 = temp_output_136_0_g127520;
				float2 temp_output_119_0_g127523 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127523).xz ) );
				float temp_output_7_0_g127528 = 1.0;
				float temp_output_9_0_g127528 = ( saturate( ( distance( Input_Position180_g127523 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127528 );
				float4 lerpResult131_g127523 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127523,temp_output_82_0_g127523), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127523,temp_output_82_0_g127523), 0.0 ) , saturate( ( temp_output_9_0_g127528 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127528 ) ) ));
				float4 temp_output_17_0_g127522 = lerpResult131_g127523;
				float4 temp_output_3_0_g127522 = TVE_FlowParams;
				float4 ifLocalVar18_g127522 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127522 >= 0.5 )
				ifLocalVar18_g127522 = temp_output_17_0_g127522;
				else
				ifLocalVar18_g127522 = temp_output_3_0_g127522;
				float4 lerpResult22_g127522 = lerp( temp_output_3_0_g127522 , temp_output_17_0_g127522 , temp_output_19_0_g127522);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127522 = lerpResult22_g127522;
				#else
				float4 staticSwitch24_g127522 = ifLocalVar18_g127522;
				#endif
				float3 appendResult1012_g127014 = (float3((staticSwitch24_g127522).rg , 0.0));
				float3 ifLocalVar40_g127538 = 0;
				if( Debug_Index464_g127014 == 14.0 )
				ifLocalVar40_g127538 = appendResult1012_g127014;
				float temp_output_136_0_g127529 = Debug_Layer885_g127014;
				float temp_output_19_0_g127531 = TVE_FlowLayers[(int)temp_output_136_0_g127529];
				half3 Input_Position180_g127532 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127532 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127532).xz ) );
				float temp_output_82_0_g127532 = temp_output_136_0_g127529;
				float2 temp_output_119_0_g127532 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127532).xz ) );
				float temp_output_7_0_g127537 = 1.0;
				float temp_output_9_0_g127537 = ( saturate( ( distance( Input_Position180_g127532 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127537 );
				float4 lerpResult131_g127532 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127532,temp_output_82_0_g127532), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_FlowNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127532,temp_output_82_0_g127532), 0.0 ) , saturate( ( temp_output_9_0_g127537 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127537 ) ) ));
				float4 temp_output_17_0_g127531 = lerpResult131_g127532;
				float4 temp_output_3_0_g127531 = TVE_FlowParams;
				float4 ifLocalVar18_g127531 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127531 >= 0.5 )
				ifLocalVar18_g127531 = temp_output_17_0_g127531;
				else
				ifLocalVar18_g127531 = temp_output_3_0_g127531;
				float4 lerpResult22_g127531 = lerp( temp_output_3_0_g127531 , temp_output_17_0_g127531 , temp_output_19_0_g127531);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127531 = lerpResult22_g127531;
				#else
				float4 staticSwitch24_g127531 = ifLocalVar18_g127531;
				#endif
				float ifLocalVar40_g127539 = 0;
				if( Debug_Index464_g127014 == 15.0 )
				ifLocalVar40_g127539 = (staticSwitch24_g127531).b;
				float temp_output_136_0_g127554 = Debug_Layer885_g127014;
				float temp_output_19_0_g127555 = TVE_PushLayers[(int)temp_output_136_0_g127554];
				half3 Input_Position180_g127556 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127556 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127556).xz ) );
				float temp_output_82_0_g127556 = temp_output_136_0_g127554;
				float2 temp_output_119_0_g127556 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127556).xz ) );
				float temp_output_7_0_g127561 = 1.0;
				float temp_output_9_0_g127561 = ( saturate( ( distance( Input_Position180_g127556 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127561 );
				float4 lerpResult131_g127556 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127556,temp_output_82_0_g127556), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127556,temp_output_82_0_g127556), 0.0 ) , saturate( ( temp_output_9_0_g127561 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127561 ) ) ));
				float4 temp_output_17_0_g127555 = lerpResult131_g127556;
				float4 temp_output_3_0_g127555 = TVE_PushParams;
				float4 ifLocalVar18_g127555 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127555 >= 0.5 )
				ifLocalVar18_g127555 = temp_output_17_0_g127555;
				else
				ifLocalVar18_g127555 = temp_output_3_0_g127555;
				float4 lerpResult22_g127555 = lerp( temp_output_3_0_g127555 , temp_output_17_0_g127555 , temp_output_19_0_g127555);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127555 = lerpResult22_g127555;
				#else
				float4 staticSwitch24_g127555 = ifLocalVar18_g127555;
				#endif
				float3 appendResult1780_g127014 = (float3((staticSwitch24_g127555).rg , 0.0));
				float3 ifLocalVar40_g127540 = 0;
				if( Debug_Index464_g127014 == 16.0 )
				ifLocalVar40_g127540 = appendResult1780_g127014;
				float temp_output_136_0_g127563 = Debug_Layer885_g127014;
				float temp_output_19_0_g127564 = TVE_PushLayers[(int)temp_output_136_0_g127563];
				half3 Input_Position180_g127565 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127565 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127565).xz ) );
				float temp_output_82_0_g127565 = temp_output_136_0_g127563;
				float2 temp_output_119_0_g127565 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127565).xz ) );
				float temp_output_7_0_g127570 = 1.0;
				float temp_output_9_0_g127570 = ( saturate( ( distance( Input_Position180_g127565 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127570 );
				float4 lerpResult131_g127565 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127565,temp_output_82_0_g127565), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127565,temp_output_82_0_g127565), 0.0 ) , saturate( ( temp_output_9_0_g127570 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127570 ) ) ));
				float4 temp_output_17_0_g127564 = lerpResult131_g127565;
				float4 temp_output_3_0_g127564 = TVE_PushParams;
				float4 ifLocalVar18_g127564 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127564 >= 0.5 )
				ifLocalVar18_g127564 = temp_output_17_0_g127564;
				else
				ifLocalVar18_g127564 = temp_output_3_0_g127564;
				float4 lerpResult22_g127564 = lerp( temp_output_3_0_g127564 , temp_output_17_0_g127564 , temp_output_19_0_g127564);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127564 = lerpResult22_g127564;
				#else
				float4 staticSwitch24_g127564 = ifLocalVar18_g127564;
				#endif
				float ifLocalVar40_g127541 = 0;
				if( Debug_Index464_g127014 == 17.0 )
				ifLocalVar40_g127541 = (staticSwitch24_g127564).b;
				float temp_output_136_0_g127572 = Debug_Layer885_g127014;
				float temp_output_19_0_g127573 = TVE_PushLayers[(int)temp_output_136_0_g127572];
				half3 Input_Position180_g127574 = WorldPosition893_g127014;
				float2 temp_output_75_0_g127574 = ( (TVE_RenderBaseCoords).zw + ( (TVE_RenderBaseCoords).xy * (Input_Position180_g127574).xz ) );
				float temp_output_82_0_g127574 = temp_output_136_0_g127572;
				float2 temp_output_119_0_g127574 = ( (TVE_RenderNearCoords).zw + ( (TVE_RenderNearCoords).xy * (Input_Position180_g127574).xz ) );
				float temp_output_7_0_g127579 = 1.0;
				float temp_output_9_0_g127579 = ( saturate( ( distance( Input_Position180_g127574 , (TVE_RenderNearPositionR).xyz ) / (TVE_RenderNearPositionR).w ) ) - temp_output_7_0_g127579 );
				float4 lerpResult131_g127574 = lerp( SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushBaseTex, sampler_Linear_Clamp, float3(temp_output_75_0_g127574,temp_output_82_0_g127574), 0.0 ) , SAMPLE_TEXTURE2D_ARRAY_LOD( TVE_PushNearTex, sampler_Linear_Repeat, float3(temp_output_119_0_g127574,temp_output_82_0_g127574), 0.0 ) , saturate( ( temp_output_9_0_g127579 / ( TVE_RenderNearFadeValue - temp_output_7_0_g127579 ) ) ));
				float4 temp_output_17_0_g127573 = lerpResult131_g127574;
				float4 temp_output_3_0_g127573 = TVE_PushParams;
				float4 ifLocalVar18_g127573 = 0;
				UNITY_BRANCH 
				if( temp_output_19_0_g127573 >= 0.5 )
				ifLocalVar18_g127573 = temp_output_17_0_g127573;
				else
				ifLocalVar18_g127573 = temp_output_3_0_g127573;
				float4 lerpResult22_g127573 = lerp( temp_output_3_0_g127573 , temp_output_17_0_g127573 , temp_output_19_0_g127573);
				#ifdef SHADER_API_MOBILE
				float4 staticSwitch24_g127573 = lerpResult22_g127573;
				#else
				float4 staticSwitch24_g127573 = ifLocalVar18_g127573;
				#endif
				float ifLocalVar40_g127552 = 0;
				if( Debug_Index464_g127014 == 18.0 )
				ifLocalVar40_g127552 = saturate( (staticSwitch24_g127573).a );
				float temp_output_7_0_g127553 = Debug_Min721_g127014;
				float3 temp_cast_58 = (temp_output_7_0_g127553).xxx;
				float3 temp_output_9_0_g127553 = ( ( ifLocalVar40_g127581 + ( ifLocalVar40_g127418 + ifLocalVar40_g127419 ) + ( ifLocalVar40_g127438 + ifLocalVar40_g127439 ) + ( ifLocalVar40_g127512 + ifLocalVar40_g127513 ) + ( ifLocalVar40_g127514 + ifLocalVar40_g127515 + ifLocalVar40_g127516 + ifLocalVar40_g127517 ) + ( ifLocalVar40_g127518 + ifLocalVar40_g127519 + ifLocalVar40_g127551 ) + ( ifLocalVar40_g127538 + ifLocalVar40_g127539 + ifLocalVar40_g127540 + ifLocalVar40_g127541 + ifLocalVar40_g127552 ) ) - temp_cast_58 );
				float4 appendResult1659_g127014 = (float4(saturate( ( ( temp_output_9_0_g127553 / ( Debug_Max723_g127014 - temp_output_7_0_g127553 ) ) + 0.0001 ) ) , 1.0));
				float4 Output_Globals888_g127014 = appendResult1659_g127014;
				float4 ifLocalVar40_g127084 = 0;
				if( Debug_Type367_g127014 == 9.0 )
				ifLocalVar40_g127084 = Output_Globals888_g127014;
				float3 vertexToFrag328_g127014 = IN.ase_texcoord10.xyz;
				float4 color1016_g127014 = IsGammaSpace() ? float4(0.5831653,0.6037736,0.2135992,0) : float4(0.2992498,0.3229691,0.03750122,0);
				float4 color1017_g127014 = IsGammaSpace() ? float4(0.8117647,0.3488252,0.2627451,0) : float4(0.6239604,0.0997834,0.05612849,0);
				float4 switchResult1015_g127014 = (((ase_vface>0)?(color1016_g127014):(color1017_g127014)));
				float3 ifLocalVar40_g127018 = 0;
				if( Debug_Index464_g127014 == 4.0 )
				ifLocalVar40_g127018 = (switchResult1015_g127014).rgb;
				float temp_output_7_0_g127074 = Debug_Min721_g127014;
				float3 temp_cast_59 = (temp_output_7_0_g127074).xxx;
				float3 temp_output_9_0_g127074 = ( ( vertexToFrag328_g127014 + ifLocalVar40_g127018 ) - temp_cast_59 );
				float4 appendResult1658_g127014 = (float4(saturate( ( ( temp_output_9_0_g127074 / ( Debug_Max723_g127014 - temp_output_7_0_g127074 ) ) + 0.0001 ) ) , 1.0));
				float4 Output_Mesh316_g127014 = appendResult1658_g127014;
				float4 ifLocalVar40_g127086 = 0;
				if( Debug_Type367_g127014 == 11.0 )
				ifLocalVar40_g127086 = Output_Mesh316_g127014;
				float _IsTVEShader647_g127014 = _IsTVEShader;
				float Debug_Filter322_g127014 = TVE_DEBUG_Filter;
				float lerpResult1524_g127014 = lerp( 1.0 , _IsTVEShader647_g127014 , Debug_Filter322_g127014);
				float4 lerpResult1517_g127014 = lerp( Shading_Inactive1492_g127014 , ( ( ifLocalVar40_g127075 + ifLocalVar40_g127077 + ifLocalVar40_g127078 + ifLocalVar40_g127079 + ifLocalVar40_g127080 ) + ( ifLocalVar40_g127081 + ifLocalVar40_g127082 + ifLocalVar40_g127083 ) + ( ifLocalVar40_g127084 + ifLocalVar40_g127086 ) ) , lerpResult1524_g127014);
				float3 ase_viewDirWS = normalize( worldViewDir );
				float dotResult1472_g127014 = dot( WorldNormal , ase_viewDirWS );
				float temp_output_1526_0_g127014 = ( 1.0 - saturate( dotResult1472_g127014 ) );
				float Shading_Fresnel1469_g127014 = (( 1.0 - ( temp_output_1526_0_g127014 * temp_output_1526_0_g127014 ) )*0.3 + 0.7);
				float Debug_Shading1653_g127014 = TVE_DEBUG_Shading;
				float lerpResult1655_g127014 = lerp( 1.0 , Shading_Fresnel1469_g127014 , Debug_Shading1653_g127014);
				float Debug_Clip623_g127014 = TVE_DEBUG_Clip;
				float lerpResult622_g127014 = lerp( 1.0 , SAMPLE_TEXTURE2D( _MainAlbedoTex, sampler_MainAlbedoTex, uv_MainAlbedoTex ).a , ( Debug_Clip623_g127014 * _RenderClip ));
				clip( lerpResult622_g127014 - _MainAlphaClipValue);
				clip( ( 1.0 - saturate( ( _IsElementShader + _IsHelperShader ) ) ) - 1.0);
				
				o.Albedo = fixed3( 0.5, 0.5, 0.5 );
				o.Normal = fixed3( 0, 0, 1 );
				o.Emission = ( lerpResult1517_g127014 * lerpResult1655_g127014 ).rgb;
				#if defined(_SPECULAR_SETUP)
					o.Specular = fixed3( 0, 0, 0 );
				#else
					o.Metallic = 0;
				#endif
				o.Smoothness = 0;
				o.Occlusion = 1;
				o.Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float3 BakedGI = 0;

				#ifdef _ALPHATEST_ON
					clip( o.Alpha - AlphaClipThreshold );
				#endif

				#ifdef _DEPTHOFFSET_ON
					outputDepth = IN.pos.z;
				#endif

				#ifndef USING_DIRECTIONAL_LIGHT
					fixed3 lightDir = normalize(UnityWorldSpaceLightDir(worldPos));
				#else
					fixed3 lightDir = _WorldSpaceLightPos0.xyz;
				#endif

				float3 worldN;
				worldN.x = dot(IN.tSpace0.xyz, o.Normal);
				worldN.y = dot(IN.tSpace1.xyz, o.Normal);
				worldN.z = dot(IN.tSpace2.xyz, o.Normal);
				worldN = normalize(worldN);
				o.Normal = worldN;

				UnityGI gi;
				UNITY_INITIALIZE_OUTPUT(UnityGI, gi);
				gi.indirect.diffuse = 0;
				gi.indirect.specular = 0;
				gi.light.color = 0;
				gi.light.dir = half3(0,1,0);

				UnityGIInput giInput;
				UNITY_INITIALIZE_OUTPUT(UnityGIInput, giInput);
				giInput.light = gi.light;
				giInput.worldPos = worldPos;
				giInput.worldViewDir = worldViewDir;
				giInput.atten = atten;
				#if defined(LIGHTMAP_ON) || defined(DYNAMICLIGHTMAP_ON)
					giInput.lightmapUV = IN.lmap;
				#else
					giInput.lightmapUV = 0.0;
				#endif
				#if UNITY_SHOULD_SAMPLE_SH && !UNITY_SAMPLE_FULL_SH_PER_PIXEL
					giInput.ambient = IN.sh;
				#else
					giInput.ambient.rgb = 0.0;
				#endif
				giInput.probeHDR[0] = unity_SpecCube0_HDR;
				giInput.probeHDR[1] = unity_SpecCube1_HDR;
				#if defined(UNITY_SPECCUBE_BLENDING) || defined(UNITY_SPECCUBE_BOX_PROJECTION)
					giInput.boxMin[0] = unity_SpecCube0_BoxMin;
				#endif
				#ifdef UNITY_SPECCUBE_BOX_PROJECTION
					giInput.boxMax[0] = unity_SpecCube0_BoxMax;
					giInput.probePosition[0] = unity_SpecCube0_ProbePosition;
					giInput.boxMax[1] = unity_SpecCube1_BoxMax;
					giInput.boxMin[1] = unity_SpecCube1_BoxMin;
					giInput.probePosition[1] = unity_SpecCube1_ProbePosition;
				#endif

				#if defined(_SPECULAR_SETUP)
					LightingStandardSpecular_GI( o, giInput, gi );
				#else
					LightingStandard_GI( o, giInput, gi );
				#endif

				#ifdef ASE_BAKEDGI
					gi.indirect.diffuse = BakedGI;
				#endif

				#if UNITY_SHOULD_SAMPLE_SH && !defined(LIGHTMAP_ON) && defined(ASE_NO_AMBIENT)
					gi.indirect.diffuse = 0;
				#endif

				#if defined(_SPECULAR_SETUP)
					outEmission = LightingStandardSpecular_Deferred( o, worldViewDir, gi, outGBuffer0, outGBuffer1, outGBuffer2 );
				#else
					outEmission = LightingStandard_Deferred( o, worldViewDir, gi, outGBuffer0, outGBuffer1, outGBuffer2 );
				#endif

				#if defined(SHADOWS_SHADOWMASK) && (UNITY_ALLOWED_MRT_COUNT > 4)
					outShadowMask = UnityGetRawBakedOcclusions (IN.lmap.xy, float3(0, 0, 0));
				#endif
				#ifndef UNITY_HDR_ON
					outEmission.rgb = exp2(-outEmission.rgb);
				#endif
			}
			ENDCG
		}

	
	}
	
	
	Dependency "LightMode"="ForwardBase"

	Fallback Off
}
/*ASEBEGIN
Version=19702
Node;AmplifyShaderEditor.RangedFloatNode;2155;-1792,-5248;Half;False;Global;TVE_DEBUG_Layer;TVE_DEBUG_Layer;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2013;-1792,-5312;Half;False;Global;TVE_DEBUG_Index;TVE_DEBUG_Index;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1908;-1792,-5376;Half;False;Global;TVE_DEBUG_Type;TVE_DEBUG_Type;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2069;-1792,-4992;Half;False;Global;TVE_DEBUG_Min;TVE_DEBUG_Min;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2032;-1792,-5056;Half;False;Global;TVE_DEBUG_Clip;TVE_DEBUG_Clip;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2070;-1792,-4928;Half;False;Global;TVE_DEBUG_Max;TVE_DEBUG_Max;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1953;-1792,-5184;Half;False;Global;TVE_DEBUG_Filter;TVE_DEBUG_Filter;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2329;-1792,-5120;Half;False;Global;TVE_DEBUG_Shading;TVE_DEBUG_Shading;4;0;Create;True;0;5;Vertex Colors;100;Texture Coords;200;Vertex Postion;300;Vertex Normals;301;Vertex Tangents;302;0;True;2;Space(10);StyledEnum (Vertex Position _Vertex Normals _VertexTangents _Vertex Sign _Vertex Red (Variation) _Vertex Green (Occlusion) _Vertex Blue (Blend) _Vertex Alpha (Height) _Motion Bending _Motion Rolling _Motion Flutter);False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ConditionalIfNode;1774;-880,2944;Inherit;False;True;5;0;FLOAT;0;False;1;FLOAT;1;False;2;FLOAT;0;False;3;FLOAT;0;False;4;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TFHCRemapNode;1803;-1344,2944;Inherit;False;5;0;FLOAT;0;False;1;FLOAT;-1;False;2;FLOAT;1;False;3;FLOAT;0.3;False;4;FLOAT;0.7;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1878;-1792,-5632;Half;False;Property;_Banner;Banner;0;0;Create;True;0;0;0;True;1;StyledBanner(Debug);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1772;-1088,3072;Float;False;Constant;_Float3;Float 3;31;0;Create;True;0;0;0;False;0;False;24;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1931;-1408,-5632;Half;False;Property;_DebugCategory;[ Debug Category ];140;0;Create;True;0;0;0;False;1;StyledCategory(Debug Settings, 5, 10);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;1843;-1632,2944;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;1771;-1088,2944;Inherit;False;-1;;1;0;OBJECT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;1800;-1472,2944;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1804;-1792,2944;Inherit;False;Constant;_Float1;Float 1;0;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;1881;-1600,-5632;Half;False;Property;_Message;Message;141;0;Create;True;0;0;0;True;1;StyledMessage(Info, Use this shader to debug the original mesh or the converted mesh attributes., 0,0);False;0;0;1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2203;-896,-5632;Inherit;False;Base Compile;-1;;73162;e67c8238031dbf04ab79a5d4d63d1b4f;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;2352;-1408,-5376;Inherit;False;Tool Debug;1;;127014;d48cde928c5068141abea1713047719b;1,1236,0;8;336;FLOAT;0;False;465;FLOAT;0;False;884;FLOAT;0;False;337;FLOAT;0;False;1652;FLOAT;0;False;624;FLOAT;0;False;720;FLOAT;0;False;722;FLOAT;0;False;1;COLOR;338
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2109;-896,-5376;Float;False;True;-1;2;;0;4;Hidden/BOXOPHOBIC/The Visual Engine/Helpers/Debug;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;ForwardBase;0;1;ForwardBase;18;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;True;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=True=DisableBatching;True;7;False;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=ForwardBase;False;False;0;;1;LightMode=ForwardBase;0;Standard;40;Workflow,InvertActionOnDeselection;1;0;Surface;0;0;  Blend;0;0;  Refraction Model;0;0;  Dither Shadows;1;0;Two Sided;0;638071577106831206;Deferred Pass;1;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;0;0;  Use Shadow Threshold;0;0;Receive Shadows;0;0;GPU Instancing;0;638141543866713469;LOD CrossFade;0;0;Built-in Fog;0;0;Ambient Light;0;0;Meta Pass;0;0;Add Pass;0;0;Override Baked GI;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Fwd Specular Highlights Toggle;0;0;Fwd Reflections Toggle;0;0;Disable Batching;1;0;Vertex Position,InvertActionOnDeselection;1;0;0;6;False;True;False;True;False;False;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2112;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;4;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;Meta;0;4;Meta;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;True;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;False;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2113;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;4;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;ShadowCaster;0;5;ShadowCaster;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;True;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;True;1;=;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2110;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;4;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;ForwardAdd;0;2;ForwardAdd;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;True;4;1;False;;1;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;True;1;LightMode=ForwardAdd;False;False;0;True;1;LightMode=ForwardAdd;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2108;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;4;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;ExtraPrePass;0;0;ExtraPrePass;6;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;True;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=ForwardBase;False;False;0;-1;59;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;=;LightMode=ForwardBase;=;=;=;=;=;=;=;=;=;=;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;2111;-896,-5376;Float;False;False;-1;2;ASEMaterialInspector;0;4;New Amplify Shader;ed95fe726fd7b4644bb42f4d1ddd2bcd;True;Deferred;0;3;Deferred;0;False;True;0;1;False;;0;False;;0;1;False;;0;False;;True;0;False;;0;False;;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;False;True;3;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;DisableBatching=False=DisableBatching;True;2;False;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;True;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Deferred;True;2;False;0;False;0;0;Standard;0;False;0
WireConnection;1774;0;1771;0
WireConnection;1774;1;1772;0
WireConnection;1774;3;1803;0
WireConnection;1803;0;1800;0
WireConnection;1843;0;1804;0
WireConnection;1800;0;1843;0
WireConnection;2352;336;1908;0
WireConnection;2352;465;2013;0
WireConnection;2352;884;2155;0
WireConnection;2352;337;1953;0
WireConnection;2352;1652;2329;0
WireConnection;2352;624;2032;0
WireConnection;2352;720;2069;0
WireConnection;2352;722;2070;0
WireConnection;2109;2;2352;338
ASEEND*/
//CHKSM=7CC30B1F42529E8191CB31CDB1B745F526CD066C