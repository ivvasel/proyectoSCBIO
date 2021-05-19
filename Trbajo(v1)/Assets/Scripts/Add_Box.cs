using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Add_Box : MonoBehaviour
{
    bool soltar = false;
    string msg = "";
    public Matlab matlab;
    public GameObject Box;
    

    void Start()
    {
        ADDBox();

    }
   
    void Update()
    {   
        msg= matlab.msg;
        soltar = matlab.soltar;
        if (soltar)
        //if (Input.GetMouseButtonDown(0))
        {            
            Debug.Log("Suelta CAJA");
            Invoke("ADDBox", 1f);
        }
    }

    void ADDBox() 
    {
        Instantiate(Box, transform.position, transform.rotation);
    }

}
