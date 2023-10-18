Shader "Unlit/Matrix"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _A ("A", Range(-6.28, 6.28)) = 0.0
        _B ("B", Range(-2, 2)) = 0.0
    }
    SubShader
    {
        Blend SrcAlpha OneMinusSrcAlpha
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
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

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _A, _B;
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                return o;
            }
            fixed4 frag (v2f i) : SV_Target
            {
                // CISALHAMENTO
                // float2x2 m = float2x2(
                //     1, sin(_Time.z) * _A,
                //     _B, 1
                // );
                // float2 p = mul(m, i.uv);

                // TRANSLACAO
                // float2 d = float2(_A, _B);
                // float2 p = i.uv + d;

                // ROTACAO
                _A = _Time.y;   
                float2x2 m = float2x2(
                    cos(_A), -sin(_A),
                    sin(_A), cos(_A)
                );
                float2 d = float2(0.5, 0.5);
                float2 p = mul(m, i.uv - d) + d;

                fixed4 col = tex2D(_MainTex, p);
                return col;
            }
            ENDCG
        }
    }
}
