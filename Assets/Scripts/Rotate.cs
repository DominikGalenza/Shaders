using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Rotate : MonoBehaviour
{
	private void Update()
	{
		transform.Rotate(0, 0.2f, 0);
	}
}