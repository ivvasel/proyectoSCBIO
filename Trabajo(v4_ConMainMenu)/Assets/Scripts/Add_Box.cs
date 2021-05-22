using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Add_Box : MonoBehaviour
{
    bool soltar,next;
    string msg = "";
    public Matlab matlab;
    public GameObject Box;
    public GameObject SonidoCaja;
    

    void Start()
    {
        ADDBox();

    }
   
    void Update()
    {   
        msg= matlab.msg;
        soltar = matlab.soltar;
        next = matlab.next;
        if (next && soltar || Input.GetMouseButtonDown(0))
        //if (Input.GetMouseButtonDown(0))
        {            
            Debug.Log("Suelta CAJA");
            Invoke("ADDBox", 1f);
            Invoke("Sonido",0.8f);
            matlab.next = false;
            Invoke("Next", 1f);
        }
    }

    void ADDBox() 
    {
        Instantiate(Box, transform.position, transform.rotation);
    }
        void Next () {
        matlab.next=true;
        
    }
    void Sonido(){
        Instantiate(SonidoCaja);
    }


}
