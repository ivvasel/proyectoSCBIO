using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Cont_Add_Box : MonoBehaviour
{
    bool soltar,next ;
    string msg = "";
    public Matlab matlab;
    void Start()
    {
        
    }
   
    void Update()
    {
        msg= matlab.msg;
        soltar = matlab.soltar;
        next = matlab.next;
        Debug.Log("Subir: "+soltar);
        if (soltar || Input.GetMouseButtonDown(0) && next)
        {
            Invoke("PosY", 0.4f);
            matlab.next = false;
            Invoke("Next",1.2f);

        }
    }

    void PosY() { 
         transform.position = new Vector2(transform.position.x, transform.position.y + 1.8f);
    }
    void Next () {
        matlab.next=true;
    }
}