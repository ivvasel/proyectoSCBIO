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
        matlab= GameObject.Find("Matlab").GetComponent<Matlab>();
    }
   
    void Update()
    {   
        
        msg= matlab.msg;
        soltar = matlab.soltar;
        next = matlab.next;
        if (next && soltar  /*|| Input.GetMouseButtonDown(0)*/)
        {            
            Debug.Log("Suelta CAJA");
            Invoke("ADDBox", 1f);
            Invoke("Sonido",0f);
            Invoke("NextFalse",0.1f);
            Invoke("NextTrue", 1f);
        }
    }

    void ADDBox() 
    {
        Instantiate(Box, transform.position, transform.rotation);
    }
        void NextTrue () {
        matlab.next=true;
        
    }
            void NextFalse () {
        matlab.next=false;
        
    }
    void Sonido(){
        Instantiate(SonidoCaja);
    }


}
