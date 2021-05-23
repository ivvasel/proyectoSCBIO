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
        matlab= GameObject.Find("Matlab").GetComponent<Matlab>();
    }
   
    void Update()
    {
        msg= matlab.msg;
        soltar = matlab.soltar;
        next = matlab.next;
        if (next && soltar)
        {
            Invoke("PosY", 0.4f);

        }
    }

    void PosY() { 
         transform.position = new Vector2(transform.position.x, transform.position.y + 1.87f);
    }

}