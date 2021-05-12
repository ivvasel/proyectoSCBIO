using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Floor : MonoBehaviour
{

    public GameObject GameOver;

    void Start() {
        GameOver.gameObject.SetActive(false);
    }

    void OnCollisionEnter2D(Collision2D col) {

        if (col.gameObject.tag == "Box") {

            GameOver.gameObject.SetActive(true);
            Time.timeScale = 0;
        }
    
    }

}
