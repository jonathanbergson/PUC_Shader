Shader "Custom/Water"
{
    Properties
    {
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _NoiseTex ("Noise", 2D) = "white" {}

        _Color ("Color", Color) = (0,1,1,1)
        _Alpha ("Alpha", Range(0, 1)) = 0.6
        _Tess ("Tessellation", Range(1,32)) = 10
    }

    SubShader
    {
        Cull Off

            CGPROGRAM
            #pragma surface surf BlinnPhong vertex:vert tessellate:tess alpha:blend
            #pragma target 4.6

            sampler2D _MainTex, _NoiseTex;
            float _Alpha, _Speed, _Tess;
            float4 _Color;

            struct Input
            {
                float2 uv_MainTex;
            };

            float tess ()
            {
                return _Tess;
            }

            void vert (inout appdata_full v)
            {
                float timeRef = _Time.z * 0.5f;
                float x = (v.texcoord.x * 30 + timeRef) * 0.015;
                float y = (v.texcoord.y * 30 + timeRef) * 0.015;
                float4 noise = tex2Dlod(_NoiseTex, float4(x, y, 0, 0));

                v.vertex.y = noise.y;
            }

            void surf (Input IN, inout SurfaceOutput o)
            {
                float timeRef = _Time.z * 0.01f;
                float2 uv = IN.uv_MainTex * 2 + float2(timeRef, timeRef);
                float4 noise = tex2D(_NoiseTex, uv) * 3.0f;

                o.Albedo = _Color * noise;
                o.Alpha = _Alpha;
            }
            ENDCG
    }
    FallBack "Diffuse"
}
