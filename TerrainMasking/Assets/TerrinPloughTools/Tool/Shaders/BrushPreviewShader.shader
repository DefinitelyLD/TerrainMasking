Shader "TerrainPloughTool/BrushPreviewShader"
{
    SubShader
    {
        Tags { "RenderType"="Transparent" }
        LOD 100
        Cull Off ZWrite Off ZTest LEqual
        Blend SrcAlpha OneMinusSrcAlpha

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
                float height : HEIGHT;
            };

            sampler2D _MainTex;
            sampler2D _Mask;

            float4 _Box;
            float4 _Brush;

               // Check if a point is inside a rotated rectangle
            bool IsPointInsideRotatedRectangle(float2 pin, float2 rectangleCenter, float2 size, float rotationAngle)
            {
                // Half the width and height of the rectangle
                float halfWidth = size.x * 0.5;
                float halfHeight = size.y * 0.5;

                // Vertices of the rectangle (axis-aligned first)
                float2 vertices[4];
                vertices[0] = float2(-halfWidth, -halfHeight); // Bottom-left
                vertices[1] = float2(halfWidth, -halfHeight);  // Bottom-right
                vertices[2] = float2(halfWidth, halfHeight);   // Top-right
                vertices[3] = float2(-halfWidth, halfHeight);  // Top-left

                // Rotation matrix
                float rad = radians(rotationAngle);
                float cosA = cos(rad);
                float sinA = sin(rad);

                // Rotate and translate each vertex to the center of the rectangle
                for (int p = 0; p < 4; p++)
                {
                    float2 vertex = vertices[p];
                    float x = vertex.x * cosA - vertex.y * sinA;
                    float y = vertex.x * sinA + vertex.y * cosA;
                    vertices[p] = float2(x, y) + rectangleCenter;
                }

                // Ray-casting algorithm to check if the pin is inside the rotated rectangle
                bool inside = false;
                for (int i = 0, j = 3; i < 4; j = i++)
                {
                    // Cross product (edge direction check)
                    if ((vertices[i].y > pin.y) != (vertices[j].y > pin.y) &&
                        (pin.x < (vertices[j].x - vertices[i].x) * (pin.y - vertices[i].y) / (vertices[j].y - vertices[i].y) + vertices[i].x))
                    {
                        inside = !inside;
                    }
                }

                return inside;
            }

            v2f vert(appdata v)
            {
                v2f o;

                float2 uv = v.uv;;

                float4 heightmapUV = float4(_Box.x + (uv.x * _Box.z), _Box.y + (uv.y * _Box.z), 0, 0);
                float height = tex2Dlod(_MainTex, heightmapUV).r * 1.00;

                v.vertex.y = (height * 2 * _Brush.z) + 0.1;
               
                o.height = height * 2.0;

                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;

                return o;
            }

            float4 frag(v2f i) : SV_Target
            {
                float2 uv = i.uv;
                float2 pin = float2(uv.x - 0.5, uv.y - 0.5);
                
                if(IsPointInsideRotatedRectangle(pin, float2(0, 0), _Brush.xy, _Box.w) == false)
                {
                    //return float4(1, 0,0,1);
                    discard;
                }

                float mag = sqrt(pow(pin.x, 2.0) + pow(pin.y, 2.0));
                float theta = atan2(pin.y, pin.x) - radians(_Box.w);
                
                float newX = mag * cos(theta) + (_Brush.x * 0.5);
                float newY = mag * sin(theta) + (_Brush.y * 0.5);

                float valueY = abs(newY) / _Brush.y;
                float valueX = abs(newX) / _Brush.x;

                float mask = tex2D(_Mask, float2(valueX, valueY));

                return float4(0, i.height, 1 - i.height, mask * 1);
            }
            ENDCG
        }
    }
}
