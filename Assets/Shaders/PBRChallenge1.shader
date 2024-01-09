Shader "Holistic/PBRChallenge1" {

	Properties {
		_Colour ("Colour", Color) = (1, 1, 1, 1)
		_MetallicTex ("Metallic (R)", 2D) = "white" {}
		_Metallic ("Metallic", Range(0.0, 1.0)) = 0.0
		_Emission ("Emission", Range(0, 10)) = 1
	}

	SubShader {
		Tags {
			"Queue" = "Geometry"
		}

		CGPROGRAM
			#pragma surface surf Standard

			sampler2D _MetallicTex;
			half _Metallic;
			half _Emission;
			fixed4 _Colour;

			struct Input {
				float2 uv_MetallicTex;
			};

			void surf(Input IN, inout SurfaceOutputStandard o) {
				o.Albedo = _Colour.rgb;
				o.Smoothness = tex2D(_MetallicTex, IN.uv_MetallicTex).r;
				o.Metallic = _Metallic;
				o.Emission = tex2D(_MetallicTex, IN.uv_MetallicTex).r * _Emission;
			}
		ENDCG
	}

	Fallback "Diffuse"
}