using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GameControl : MonoBehaviour
{

    public int Score;
    public Text TXTBoxCount;

    void Start()
    {
        
    }
   
    void Update()
    {
        Score = GameObject.FindGameObjectsWithTag("Box").Length;
        TXTBoxCount.text = Score.ToString();
    }

    public void BTN_ResteGame() {

        Time.timeScale = 1;
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
    }
}
