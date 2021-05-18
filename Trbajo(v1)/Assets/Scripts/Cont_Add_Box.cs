using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Cont_Add_Box : MonoBehaviour
{
    bool soltar = false;
    string msg = "";
    public Matlab matlab;
    void Start()
    {
        
    }
   
    void Update()
    {
        msg= matlab.msg;
        soltar = matlab.soltar;
        if (soltar)
        {
            Invoke("PosY", 0.6f);
        }
    }

    void PosY() { 
         transform.position = new Vector2(transform.position.x, transform.position.y + 2.0f);
    }
}