Shader "UI/GlitchEffect"
{
    Properties
    {
        _MainTex("Main Texture", 2D) = "white" {}
        _Color("Color Tint", Color) = (1, 1, 1, 1)
        _GlitchInterval("Glitch Interval Time [seconds]", Float) = 0.06
        _DispProbability("Displacement Glitch Probability", Float) = 0.022
        _DispIntensity("Displacement Glitch Intensity", Float) = 0.09
        _ColorProbability("Color Glitch Probability", Float) = 0.02
        _ColorIntensity("Color Glitch Intensity", Float) = 0.07
        _WrapDispCoords("Wrap Displacement Coords (Off=Clamp)", Float) = 1
        _DispGlitchOn("Displacement Glitch On", Float) = 1
        _ColorGlitchOn("Color Glitch On", Float) = 1
    }

        SubShader
        {
            Tags { "Queue" = "Overlay" "IgnoreProjector" = "True" "RenderType" = "Transparent" }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            Lighting Off
            ZWrite Off
            ZTest Always
            Pass
            {
                CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #include "UnityCG.cginc"

                sampler2D _MainTex;
                fixed4 _Color;
                float _GlitchInterval;
                float _DispIntensity;
                float _DispProbability;
                float _ColorIntensity;
                float _ColorProbability;
                float _WrapDispCoords;
                float _DispGlitchOn;
                float _ColorGlitchOn;

                struct appdata_t
                {
                    float4 vertex : POSITION;
                    float2 texcoord : TEXCOORD0;
                    float4 color : COLOR;
                };

                struct v2f
                {
                    float4 vertex : SV_POSITION;
                    float2 texcoord : TEXCOORD0;
                    fixed4 color : COLOR;
                };

                v2f vert(appdata_t IN)
                {
                    v2f OUT;
                    OUT.vertex = UnityObjectToClipPos(IN.vertex);
                    OUT.texcoord = IN.texcoord;
                    OUT.color = IN.color * _Color;
                    return OUT;
                }

                float rand(float x, float y)
                {
                    return frac(sin(x * 12.9898 + y * 78.233) * 43758.5453);
                }

                fixed4 frag(v2f IN) : SV_Target
                {
                    float intervalTime = floor(_Time.y / _GlitchInterval) * _GlitchInterval;
                    float timePositionVal = intervalTime + IN.vertex.x + IN.vertex.y;

                    float dispGlitchRandom = rand(timePositionVal, -timePositionVal);
                    float colorGlitchRandom = rand(timePositionVal, timePositionVal);

                    float rShiftRandom = (rand(-timePositionVal, timePositionVal) - 0.5) * _ColorIntensity;
                    float gShiftRandom = (rand(-timePositionVal, -timePositionVal) - 0.5) * _ColorIntensity;
                    float bShiftRandom = (rand(-timePositionVal * 2, -timePositionVal * 2) - 0.5) * _ColorIntensity;

                    float shiftLineOffset = (rand(timePositionVal * 2, timePositionVal * 2) - 0.5) / 50;

                    if (dispGlitchRandom < _DispProbability && _DispGlitchOn == 1)
                    {
                        IN.texcoord.x += (rand(floor(IN.texcoord.y / (0.2 + shiftLineOffset)) - timePositionVal, floor(IN.texcoord.y / (0.2 + shiftLineOffset)) + timePositionVal) - 0.5) * _DispIntensity;
                        if (_WrapDispCoords == 1)
                        {
                            IN.texcoord.x = fmod(IN.texcoord.x, 1);
                        }
                        else
                        {
                            IN.texcoord.x = clamp(IN.texcoord.x, 0, 1);
                        }
                    }

                    fixed4 normalC = tex2D(_MainTex, IN.texcoord);
                    fixed4 rShifted = tex2D(_MainTex, float2(IN.texcoord.x + rShiftRandom, IN.texcoord.y + rShiftRandom));
                    fixed4 gShifted = tex2D(_MainTex, float2(IN.texcoord.x + gShiftRandom, IN.texcoord.y + gShiftRandom));
                    fixed4 bShifted = tex2D(_MainTex, float2(IN.texcoord.x + bShiftRandom, IN.texcoord.y + bShiftRandom));

                    fixed4 c;
                    if (colorGlitchRandom < _ColorProbability && _ColorGlitchOn == 1)
                    {
                        c.r = rShifted.r;
                        c.g = gShifted.g;
                        c.b = bShifted.b;
                        c.a = (rShifted.a + gShifted.a + bShifted.a) / 3;
                    }
                    else
                    {
                        c = normalC;
                    }

                    c.rgb *= IN.color.rgb;
                    c.a *= IN.color.a;

                    return c;
                }
                ENDCG
            }
        }
}
