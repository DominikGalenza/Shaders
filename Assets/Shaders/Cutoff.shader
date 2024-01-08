Shader "Holistic/Cutoff" {

	Properties {
		_RimColour ("Rim Colour", Color) = (0, 0.5, 0.5, 0)
		_RimPower ("Rim Power", Range(0.5, 8)) = 3
	}

	SubShader {

		CGPROGRAM
			#pragma surface surf Lambert

			struct Input {
				float3 viewDir;
				float3 worldPos;
			};

			float4 _RimColour;
			float _RimPower;

			void surf(Input IN, inout SurfaceOutput o) {
				half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal));
				//o.Emission = _RimColour.rgb * rim > 0.5 ? rim : 0;
				//o.Emission = rim > 0.5 ? float3(1, 0, 0) : rim > 0.3 ? float3(0, 1, 0) : 0;
				//o.Emission = IN.worldPos.y > 1 ? float3(0, 1, 0) : float3(1, 0, 0);
				//o.Emission = frac(IN.worldPos.y * 10 * 0.5) > 0.4 ? float3(0, 1, 0) : float3(1, 0, 0);
				o.Emission = frac(IN.worldPos.y * 10 * 0.5) > 0.4 ? float3(0, 1, 0) * rim : float3(1, 0, 0) * rim;
			}
		ENDCG

	}

	Fallback "Diffuse"
}