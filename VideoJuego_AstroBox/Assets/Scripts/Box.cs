using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Box : MonoBehaviour
{
    bool soltar, next,condicion;
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
        next = matlab.next;
        condicion = next && soltar;
        Debug.Log("Gravedad: "+condicion);
        if (next && soltar)
        {
            transform.parent = null;
            GetComponent<Rigidbody2D>().gravityScale = 1;
        }

    }
}
