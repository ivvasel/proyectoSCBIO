using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Box : MonoBehaviour
{
    public bool soltar = false;
    public Matlab matlabobj; 
    void Start()
    {
        transform.SetParent(GameObject.FindGameObjectWithTag("Add_Box").transform);
        GetComponent<Rigidbody2D>().gravityScale = 0;
        transform.position = GameObject.FindGameObjectWithTag("Add_Box").transform.position;
    }
    
    public void Update()
    {
        
        //Matlab variable = GetComponent<Matlab>();
        soltar= matlabobj.soltar;

        if (soltar)
        {
            transform.parent = null;
            GetComponent<Rigidbody2D>().gravityScale = 1;
        }

    }
}
