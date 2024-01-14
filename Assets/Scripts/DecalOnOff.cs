using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DecalOnOff : MonoBehaviour
{
    private Material material;
    private bool showDecal;

	private void OnMouseDown()
	{
		showDecal = !showDecal;
		if (showDecal)
			material.SetFloat("_ShowDecal", 1);
		else
			material.SetFloat("_ShowDecal", 0);
	}

	private void Start()
	{
		material = GetComponent<Renderer>().sharedMaterial;
	}
}
