using UnityEngine;
using UnityEngine.SceneManagement;

public class GameRestart : MonoBehaviour
{
    public void LoadLevel(string MainLevel)
    {
        // Load the specified scene by name
        SceneManager.LoadScene(MainLevel);
    }
}
