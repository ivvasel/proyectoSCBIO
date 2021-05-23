using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Floor : MonoBehaviour
{

    public GameObject GameOver;
    public GameObject SonidoGeneral;
    public GameObject SonidoOver;
    public GameObject addbox;
 
    void Start() {
        GameOver.gameObject.SetActive(false);
        //SonidoOver.gameObject.SetActive(false);
    }

    void OnCollisionEnter2D(Collision2D col) {

        if (col.gameObject.tag == "Box") {
            SonidoGeneral.gameObject.SetActive(false);
            addbox.gameObject.SetActive(false);
            GameOver.gameObject.SetActive(true);
            Time.timeScale = 0;
        }
    
    }

}
