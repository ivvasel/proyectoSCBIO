using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Cont_Add_Box : MonoBehaviour
{
   
    void Start()
    {
        
    }
   
    void Update()
    {
        if(Input.GetMouseButtonDown(0)){
            Invoke("PosY", 0.6f);
        }
    }

    void PosY() { 
         transform.position = new Vector2(transform.position.x, transform.position.y + 1.0f);
    }
}
