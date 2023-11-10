Shader "Custom/Water"
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
        Cull Off

        CGPROGRAM
        #pragma surface surf BlinnPhong vertex:vert alpha:blend tessellate:tess
        #pragma target 4.6

        sampler2D _NoiseTex, _MainTex;
        float _Alpha, _Speed, _Tess;

        struct appdata {
            float4 vertex : POSITION;
            float4 tangent : TANGENT;
            float3 normal : NORMAL;
            float2 texcoord : TEXCOORD0;
        };

        struct Input
        {
            float2 uv_MainTex;
        };

        float tess ()
        {
            return 10;
        }

        void vert (inout appdata_full v)
        {
//            o.uv_MainTex = v.texcoord;

            float timeRef = _Time.z * 0.05f;
            float x = (v.texcoord.x * 5 + timeRef) * 0.2;
            float y = (v.texcoord.y * 5 + timeRef) * 0.2;
            float4 noise = tex2Dlod(_NoiseTex, float4(x, y, 0, 0));

            v.vertex.y = noise.y - 0.3f;
        }

        void surf (Input IN, inout SurfaceOutput o)
        {
            float timeRef = _Time.z * 0.05f;
            float2 uv = IN.uv_MainTex * 5 + float2(timeRef, timeRef);
            float4 noise = tex2D(_NoiseTex, uv) * 2.0f;
            float4 cian = float4(0, 1, 1, 1);

            o.Albedo = cian * noise;
            o.Alpha = 1;
        }
        ENDCG
    }
    FallBack "Diffuse"
}

// [x] Vertex Shader - Displacement Map
// [x] Texturas
// [x] Animação
// [ ] Grabpass
// [x] Transparência
// [x] Tessellation
