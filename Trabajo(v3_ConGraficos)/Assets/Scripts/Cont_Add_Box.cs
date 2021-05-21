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
        Debug.Log("Condicion de subida de cama:"+(!next && soltar));
        Debug.Log("Subir: "+soltar);
        if (next && soltar || Input.GetMouseButtonDown(0))
        {
            Invoke("PosY", 0.4f);

        }
    }

    void PosY() { 
         transform.position = new Vector2(transform.position.x, transform.position.y + 1.8f);
    }

}