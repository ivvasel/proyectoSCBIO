using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollow : MonoBehaviour
{

    public Transform ContAddBox;

    void Start()
    {
        
    }

   
    void Update()
    {
        if (ContAddBox.position.y > transform.position.y) {
            transform.position = new Vector3(transform.position.x, ContAddBox.transform.position.y - 1f, transform.position.z);
        }
        
    }

    
}
