Shader "Holistic/CutoffChallenge" {

	Properties {
		_RimColour ("Rim Colour", Color) = (0, 0.5, 0.5, 0)
		_RimPower ("Rim Power", Range(0.5, 8)) = 3
		_DiffuseTexture ("Diffuse Texture", 2D) = "white" {}
		_StripeSizeSlider ("Stripe Size", Range(1, 20)) = 1
	}

	SubShader {

		CGPROGRAM
			#pragma surface surf Lambert

			struct Input {
				float3 viewDir;
				float3 worldPos;
				float2 uv_DiffuseTexture;
			};

			float4 _RimColour;
			float _RimPower;
			sampler2D _DiffuseTexture;
			half _StripeSizeSlider;

			void surf(Input IN, inout SurfaceOutput o) {
				half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
				o.Albedo = tex2D(_DiffuseTexture, IN.uv_DiffuseTexture).rgb;
				o.Emission = frac(IN.worldPos.y * (20 - _StripeSizeSlider) * 0.5) > 0.4 ? float3(0, 1, 0) * rim : float3(1, 0, 0) * rim;
			}
		ENDCG

	}

	Fallback "Diffuse"
}