using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Box : MonoBehaviour
{
    bool soltar = false;
    string msg = "";
    public Matlab matlab;
    void Start()
    {
        transform.SetParent(GameObject.FindGameObjectWithTag("Add_Box").transform);
        GetComponent<Rigidbody2D>().gravityScale = 0;
        transform.position = GameObject.FindGameObjectWithTag("Add_Box").transform.position;
    }
    
    public void Update()
    {
        msg= matlab.msg;
        soltar = matlab.soltar;
        if (soltar)
        {
            transform.parent = null;
            GetComponent<Rigidbody2D>().gravityScale = 1;
        }

    }
}
