using UnityEngine;
using UnityEngine.SceneManagement;

public class GameRestart : MonoBehaviour
{
    public void LoadLevel(string MainMenu)
    {
        // Load the specified scene by name
        SceneManager.LoadScene(MainMenu);
    }
}
