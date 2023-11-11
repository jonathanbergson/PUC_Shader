Shader "Unlit/WaterUnlit"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _NoiseTex ("Noise", 2D) = "white" {}

        _Alpha ("Alpha", Range(0, 1)) = 0.8
        _Speed ("Speed", Range(0, 10)) = 1.0
        _Tess ("Tessellation", Range(1,32)) = 4
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

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
            };

            sampler2D _MainTex, _NoiseTex;
            float4 _MainTex_ST;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);

                float timeRef = _Time.z * 0.5f;
                float x = (v.uv.x * 30 + timeRef) * 0.015;
                float y = (v.uv.y * 30 + timeRef) * 0.015;
                float4 noise = tex2Dlod(_NoiseTex, float4(x, y, 0, 0));

                o.vertex.y = noise.y;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                float timeRef = _Time.z * 0.01f;
                float2 uv = i.uv * 2 + float2(timeRef, timeRef);
                float4 noise = tex2D(_NoiseTex, uv) * 3.0f;

                float4 cian = float4(0, 1, 1, 1);
                fixed4 col = cian * (noise);

                return col;
            }
            ENDCG
        }
    }
}
