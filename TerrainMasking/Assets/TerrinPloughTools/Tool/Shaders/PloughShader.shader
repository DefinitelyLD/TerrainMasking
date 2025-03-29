Shader "TerrainPloughTool/PloughShader"
{
    Properties { _MainTex ("Texture", any) = "" {} }

    SubShader
    {
        // No culling or depth
        Cull Off ZWrite Off ZTest Always

HLSLINCLUDE
        #include "UnityCG.cginc"

        #define M_PI 3.1415926535897932384626433832795

        struct appdata
        {
            float4 vertex : POSITION;
            float2 uv : TEXCOORD0;
        };

        struct v2f
        {
            float2 uv : TEXCOORD0;
            float4 vertex : SV_POSITION;
        };

        v2f vert (appdata v)
        {
            v2f o;
            o.vertex = UnityObjectToClipPos(v.vertex);
            o.uv = v.uv;
            return o;
        }

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

        sampler2D _MainTex;
        sampler2D _Mask;
        float4 _Box;
ENDHLSL

        // copy pass
        Pass
        {
HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            float4 frag (v2f i) : SV_Target
            {
                float4 col = tex2D(_MainTex, (i.uv * _Box.z) + _Box.xy);
                return col;
            }
ENDHLSL
        }

        // plough pass
        Pass
        {
HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            sampler2D _Basemap;

            float4 _Brush;
            float4 _Hardness;

            float4 frag (v2f i) : SV_Target
            {
                float2 uv = i.uv;
                float2 pin = float2(uv.x - 0.5, uv.y - 0.5);
                
                float4 currentHeight = tex2D(_MainTex, uv);

                if(IsPointInsideRotatedRectangle(pin, float2(0, 0), _Brush.xy, _Box.w) == false)
                {
                    return currentHeight;
                }

                float baseHeight = tex2D(_Basemap, (uv * _Box.z) + _Box.xy).r;
                currentHeight -= baseHeight;

                float mag = sqrt(pow(pin.x, 2.0) + pow(pin.y, 2.0));
                float theta = atan2(pin.y, pin.x) - radians(_Box.w);
                
                float newX = mag * cos(theta) + (_Brush.x * 0.5);
                float newY = mag * sin(theta) + (_Brush.y * 0.5);

                float valueY = abs(newY) / _Brush.y;
                float valueX = abs(newX) / _Brush.x;

                float mask = tex2D(_Mask, float2(valueX, valueY));

                float newHeight = (sign(sin(valueY * _Brush.z * M_PI)) * sqrt(abs(sin(valueY * _Brush.z * M_PI))) * _Brush.w) * 0.5;

                if(_Hardness.z < 0.0)
                {
                    float followHeight = lerp(currentHeight + baseHeight, baseHeight, _Hardness.x * _Hardness.y * 2 * mask);
                    return clamp(followHeight, baseHeight, 0.5);
                }
                else
                {
                    float followHeight = lerp(currentHeight, newHeight, _Hardness.x * _Hardness.y * mask);
                    return clamp((followHeight) + baseHeight, baseHeight, 0.5);
                }
            }
ENDHLSL
        }

        // spiral pass
        Pass
        {
HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            sampler2D _Basemap;

            float4 _Brush;
            float4 _Hardness;

            float4 frag (v2f i) : SV_Target
            {
                float2 uv = i.uv;
                float2 pin = float2(uv.x - 0.5, uv.y - 0.5);
                
                float currentHeight = tex2D(_MainTex, uv).r;
                float mag = sqrt(pow(pin.x, 2.0) + pow(pin.y, 2.0));

                if(mag > 0.5)
                {
                    return currentHeight;
                }

                float value = 1.0 - (mag / (_Brush.x * 0.5));
                float newHeight = (sqrt(value) * _Brush.w) * 0.5;

                float baseHeight = tex2D(_Basemap, (uv * _Box.z) + _Box.xy).r;
                currentHeight -= baseHeight;

                if(currentHeight >= newHeight)
                {
                    return currentHeight + baseHeight;
                }

                if(_Hardness.z < 0.0)
                {
                    float followHeight = lerp(currentHeight + baseHeight, baseHeight, _Hardness.x * _Hardness.y * 2);
                    return clamp(followHeight, 0, 0.5);
                }
                else
                {
                    float followHeight = lerp(currentHeight, newHeight, _Hardness.x * _Hardness.y);
                    return clamp((followHeight) + baseHeight, 0, 0.5);
                }
            }
ENDHLSL
        }

        // erase pass
        Pass
        {
HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            float4 _Brush;
            float4 _Hardness;

            float4 frag (v2f i) : SV_Target
            {
                float2 uv = i.uv;
                float2 pin = float2(uv.x - 0.5, uv.y - 0.5);
                
                float4 currentHeight = tex2D(_MainTex, uv);

                if(IsPointInsideRotatedRectangle(pin, float2(0, 0), _Brush.xy, _Box.w) == false)
                {
                    return currentHeight;
                }

                float mag = sqrt(pow(pin.x, 2.0) + pow(pin.y, 2.0));
                float theta = atan2(pin.y, pin.x) - radians(_Box.w);
                
                float newX = mag * cos(theta) + (_Brush.x * 0.5);
                float newY = mag * sin(theta) + (_Brush.y * 0.5);

                float valueY = abs(newY) / _Brush.y;
                float valueX = abs(newX) / _Brush.x;

                float mask = tex2D(_Mask, float2(valueX, valueY));

                float followHeight = max(lerp(currentHeight, 0, _Hardness.x * _Hardness.y * mask), 0);
                return clamp(followHeight, 0, 0.5);
            }
ENDHLSL
        }

        // flatten pass
        Pass
        {
HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            float4 _Brush;
            float4 _Hardness;

            float4 frag (v2f i) : SV_Target
            {
                float2 uv = i.uv;
                float2 pin = float2(uv.x - 0.5, uv.y - 0.5);
                
                float4 currentHeight = tex2D(_MainTex, uv);

                if(IsPointInsideRotatedRectangle(pin, float2(0, 0), _Brush.xy, _Box.w) == false)
                {
                    return currentHeight;
                }

                float mag = sqrt(pow(pin.x, 2.0) + pow(pin.y, 2.0));
                float theta = atan2(pin.y, pin.x) - radians(_Box.w);
                
                float newX = mag * cos(theta) + (_Brush.x * 0.5);
                float newY = mag * sin(theta) + (_Brush.y * 0.5);

                float valueY = abs(newY) / _Brush.y;
                float valueX = abs(newX) / _Brush.x;

                float mask = tex2D(_Mask, float2(valueX, valueY));

                float followHeight = lerp(currentHeight, _Hardness.w, _Hardness.x * _Hardness.y * mask);
                return clamp(followHeight, 0, 0.5);
            }
ENDHLSL
        }

        // smoothen pass
        Pass {
HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            float4 _Brush;
            float4 _Hardness;

            Texture2D _Bilinear;
            SamplerState sampler_Bilinear;
            
            // Function to average the colors around a given pixel
            float4 AverageColorAroundPixel(Texture2D tex, SamplerState samp, float2 texCoord)
            {
                // Initialize accumulator for color sum
                float4 colorSum = float4(0.0, 0.0, 0.0, 0.0);
                int numSamples = 0;

                // Sample the texture in a grid pattern around the given pixel
                // The step size is determined by the radius and the texture resolution
                [unroll]for (int x = -int(3); x <= int(3); ++x)
                {
                    [unroll]for (int y = -int(3); y <= int(3); ++y)
                    {
                        // Calculate the offset for this sample
                        float2 dimensions = float2(0,0);
                        tex.GetDimensions(dimensions.x, dimensions.y);
                        float2 offset = float2(x, y) / dimensions; // Adjust offset by texture dimensions
                        float2 sampleCoord = texCoord + offset;  // Calculate the texture coordinate for this sample

                        // Ensure the sample coordinates are within bounds (clamp)
                        sampleCoord = clamp(sampleCoord, float2(0.0f, 0.0f), float2(1.0f, 1.0f));

                        // Sample the color from the texture
                        colorSum += tex.Sample(samp, sampleCoord);
                        numSamples++;
                    }
                }

                // Return the average color
                return colorSum / numSamples;
            }

            float4 frag (v2f i) : SV_Target
            {
                float2 uv = i.uv;
                float2 pin = float2(uv.x - 0.5, uv.y - 0.5);
                
                float4 currentHeight = tex2D(_MainTex, uv);

                if(IsPointInsideRotatedRectangle(pin, float2(0, 0), _Brush.xy, _Box.w) == false)
                {
                    return currentHeight;
                }

                float mag = sqrt(pow(pin.x, 2.0) + pow(pin.y, 2.0));
                float theta = atan2(pin.y, pin.x) - radians(_Box.w);
                
                float newX = mag * cos(theta) + (_Brush.x * 0.5);
                float newY = mag * sin(theta) + (_Brush.y * 0.5);

                float valueY = abs(newY) / _Brush.y;
                float valueX = abs(newX) / _Brush.x;

                float mask = tex2D(_Mask, float2(valueX, valueY));

                float average = AverageColorAroundPixel(_Bilinear, sampler_Bilinear, uv);
                float newHeight = lerp(currentHeight, average, _Hardness.x * _Hardness.y * mask);

                return clamp(newHeight, 0, 0.5);
            }
ENDHLSL
        }

        // raise pass
        Pass {
HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            float4 _Brush;
            float4 _Hardness;

            float4 frag (v2f i) : SV_Target
            {
                float2 uv = i.uv;
                float2 pin = float2(uv.x - 0.5, uv.y - 0.5);
                
                float4 currentHeight = tex2D(_MainTex, uv);

                if(IsPointInsideRotatedRectangle(pin, float2(0, 0), _Brush.xy, _Box.w) == false)
                {
                    return currentHeight;
                }

                float mag = sqrt(pow(pin.x, 2.0) + pow(pin.y, 2.0));
                float theta = atan2(pin.y, pin.x) - radians(_Box.w);
                
                float newX = mag * cos(theta) + (_Brush.x * 0.5);
                float newY = mag * sin(theta) + (_Brush.y * 0.5);

                float valueY = abs(newY) / _Brush.y;
                float valueX = abs(newX) / _Brush.x;

                float mask = tex2D(_Mask, float2(valueX, valueY));

                float followHeight = lerp(currentHeight, currentHeight + (_Hardness.x * _Hardness.y), _Hardness.x * _Hardness.y * mask);
                return clamp(followHeight, 0, 0.5);
            }
ENDHLSL
        }

        // lower pass
        Pass {
HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            float4 _Brush;
            float4 _Hardness;

            float4 frag (v2f i) : SV_Target
            {
                float2 uv = i.uv;
                float2 pin = float2(uv.x - 0.5, uv.y - 0.5);
                
                float4 currentHeight = tex2D(_MainTex, uv);

                if(IsPointInsideRotatedRectangle(pin, float2(0, 0), _Brush.xy, _Box.w) == false)
                {
                    return currentHeight;
                }

                float mag = sqrt(pow(pin.x, 2.0) + pow(pin.y, 2.0));
                float theta = atan2(pin.y, pin.x) - radians(_Box.w);
                
                float newX = mag * cos(theta) + (_Brush.x * 0.5);
                float newY = mag * sin(theta) + (_Brush.y * 0.5);

                float valueY = abs(newY) / _Brush.y;
                float valueX = abs(newX) / _Brush.x;

                float mask = tex2D(_Mask, float2(valueX, valueY));

                float followHeight = lerp(currentHeight, currentHeight - (_Hardness.x * _Hardness.y), _Hardness.x * _Hardness.y * mask);
                return clamp(followHeight, 0, 0.5);
            }
ENDHLSL
        }

        // paint pass
        Pass {

HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            float4 _Brush;
            float4 _Hardness;

            Texture2DArray _Splatmaps;
            SamplerState sampler_Splatmaps;

            float4 _Params;
            float4 _Selection;

            float4 frag (v2f i) : SV_Target
            {
                float2 uv = i.uv;
                float2 pin = float2(uv.x - 0.5, uv.y - 0.5);

                float4 currentWeight = _Splatmaps.Sample(sampler_Splatmaps, float3(uv, _Params.y));
                
                if(IsPointInsideRotatedRectangle(pin, float2(0, 0), _Brush.xy, _Box.w) == false)
                {
                    return currentWeight;
                }

                float mag = sqrt(pow(pin.x, 2.0) + pow(pin.y, 2.0));
                float theta = atan2(pin.y, pin.x) - radians(_Box.w);
                
                float newX = mag * cos(theta) + (_Brush.x * 0.5);
                float newY = mag * sin(theta) + (_Brush.y * 0.5);

                float valueY = abs(newY) / _Brush.y;
                float valueX = abs(newX) / _Brush.x;

                float mask = tex2D(_Mask, float2(valueX, valueY));


                float4 newWeight;
                if(_Params.z > 0)
                {
                    newWeight = float4(
                    lerp(currentWeight.r, _Selection[0], _Hardness.x * _Hardness.y * mask),
                    lerp(currentWeight.g, _Selection[1], _Hardness.x * _Hardness.y * mask), 
                    lerp(currentWeight.b, _Selection[2], _Hardness.x * _Hardness.y * mask), 
                    lerp(currentWeight.a, _Selection[3], _Hardness.x * _Hardness.y * mask));
                }
                else
                {
                    newWeight = float4(
                    lerp(currentWeight.r, 0, _Hardness.x * _Hardness.y * mask),
                    lerp(currentWeight.g, 0, _Hardness.x * _Hardness.y * mask), 
                    lerp(currentWeight.b, 0, _Hardness.x * _Hardness.y * mask), 
                    lerp(currentWeight.a, 0, _Hardness.x * _Hardness.y * mask));
                }

                return newWeight;
            }
ENDHLSL
        }

        // mask pass
        Pass {
HLSLPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            float4 _Params;

            float4 frag (v2f i) : SV_Target
            {
                float2 uv = i.uv;

                float mask = tex2D(_Mask, uv).r;
                float height = tex2D(_MainTex, uv).r;

                float leftMask   =  tex2D(_Mask, float2(    clamp(((uv.x * _Params.y) - _Params.z) / _Params.y, 0, 1),  clamp(uv.y, 0, 1))).r;
                float rightMask  =  tex2D(_Mask, float2(    clamp(((uv.x * _Params.y) + _Params.z) / _Params.y, 0, 1),  clamp(uv.y, 0, 1))).r;
                float topMask    =  tex2D(_Mask, float2(    clamp(uv.x, 0, 1),                                          clamp(((uv.y * _Params.y) + _Params.z) / _Params.y, 0, 1))).r;
                float bottomMask =  tex2D(_Mask, float2(    clamp(uv.x, 0, 1),                                          clamp(((uv.y * _Params.y) - _Params.z) / _Params.y, 0, 1))).r;

                float newHeight = _Params.x;

                if((mask > 0.5 && leftMask > 0.5 && rightMask > 0.5) &&
                   (mask > 0.5 && bottomMask > 0.5 && topMask > 0.5))
                {
                    newHeight = height;
                }

                return float4(newHeight, 0, 0, 0);
            }
ENDHLSL
        }
    }
}