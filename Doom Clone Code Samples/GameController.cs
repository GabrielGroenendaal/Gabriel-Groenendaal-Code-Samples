using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

// This is the brain, the nervous system that the rest of the game will reference

public class GameController : MonoBehaviour
{
    /* SCENES */
    // 0: Main Menu
    // 1: Level 1
    // 2: Victory
    // 3: Game Over
    
    /* REFERENCES */
    public AudioController audio;
 
    /* BOOLEAN GAMESTATES */
    private bool victory;
    private bool gameOver;
    private string gameState;

    // private float transitionTimer; // way to smooth out transitions between games
    
    void Start()
    {
        audio = GetComponent<AudioController>();
        gameState = SceneManager.GetActiveScene().name;
        
        if (gameState == "main menu")
        {
            audio.playClip(0); // Play Menu Music
        }
        
        else if (gameState == "level 1")
        {
            // player = GameObject.Find("Player").GetComponent<PlayerController>();
            audio.playClip(1); // Play Level Music
        }
        
        else if (gameState == "victory")
        {
            audio.playClip(2); // Play Level Music
        }
        
        else if (gameState == "game over")
        {
            audio.playClip(3); // Play Level Music
        }
    } 

    void Update()
    {
        if (gameState == "main menu")
        {
            if (Input.GetKeyDown(KeyCode.Space)) { SceneManager.LoadScene(1); } // START THE GAME
            if (Input.GetKeyDown(KeyCode.Escape)) { Application.Quit(); } // QUIT THE GAME
        }

        else if (gameState == "level 1")
        {
            if (Input.GetKeyDown(KeyCode.Escape)) { SceneManager.LoadScene(0); } // RETURN TO MAIN MENU
            if (Input.GetKeyDown(KeyCode.Space)) { SceneManager.LoadScene(2); } // Go to Victory Screen
            if (Input.GetKeyDown(KeyCode.Backspace)) { SceneManager.LoadScene(3); } // Go to Fail Screen
        }

        else if (gameState == "game over" || gameState == "victory")
        {
            if (Input.GetKeyDown(KeyCode.Space)) { SceneManager.LoadScene(1); } // RETRY
            if (Input.GetKeyDown(KeyCode.Escape)) { SceneManager.LoadScene(0); } // RETURN TO MAIN MENU
        }
    }

    public void Victory()
    {
        SceneManager.LoadScene(2);
    }
    
    public void GameOver()
    {
        SceneManager.LoadScene(1);
    }
}
