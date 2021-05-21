using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GameControl : MonoBehaviour
{

    public int Score, HighScore;
    public Text TXTBoxCount;
    public Text TXTHighScore;

    void Start()
    {
        
    }
   
    void Update()
    {
        Score = GameObject.FindGameObjectsWithTag("Box").Length - 1;
        HighScore = PlayerPrefs.GetInt("highscore", HighScore);
        TXTBoxCount.text = Score.ToString();
        TXTHighScore.text = "Best: " + HighScore.ToString();

        if (Score > HighScore)
        {
            HighScore = Score;
            PlayerPrefs.SetInt("highscore", HighScore);
            PlayerPrefs.Save();
        }
    }

    public void BTN_ResteGame() {

        Time.timeScale = 1;
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
    }
}