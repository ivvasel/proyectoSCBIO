using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//Para la conexión 

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
        {            
            print("Suelta CAJA");
            Invoke("ADDBox", 0f);
        }
    }

    void ADDBox() 
    {
        Instantiate(Box, transform.position, transform.rotation);
    }

}
