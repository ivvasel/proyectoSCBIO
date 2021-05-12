using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Add_Box : MonoBehaviour
{

    public GameObject Box;
    void Start()
    {
        ADDBox();
    }
   
    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Invoke("ADDBox", 1f);
        }
    }

    void ADDBox() 
    {
        Instantiate(Box, transform.position, transform.rotation);
    }


}
