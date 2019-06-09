using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class NewBehaviourScript : MonoBehaviour {

    public Transform SV;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        for (int i = 0; i < SV.childCount; i++)
        {
            if (SV.GetChild(i).name!="Button1")
            {
                Debug.Log(SV.GetChild(i).name);
            }
        }
	}
}
