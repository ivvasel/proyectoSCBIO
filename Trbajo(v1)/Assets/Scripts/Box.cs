using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Box : MonoBehaviour
{
    bool soltar ;
    public Matlab matlab; 
    void Start()
    {        
        transform.SetParent(GameObject.FindGameObjectWithTag("Add_Box").transform);
        GetComponent<Rigidbody2D>().gravityScale = 0;
        transform.position = GameObject.FindGameObjectWithTag("Add_Box").transform.position;
    }
    
    public void Update()
    {   matlab= GameObject.Find("Matlab").GetComponent<Matlab>();
        soltar = matlab.soltar;
        Debug.Log("Soltar: "+soltar);
        if (soltar)
        //if (Input.GetMouseButtonDown(0))
        {
            transform.parent = null;
            GetComponent<Rigidbody2D>().gravityScale = 1;
        }

    }
}
