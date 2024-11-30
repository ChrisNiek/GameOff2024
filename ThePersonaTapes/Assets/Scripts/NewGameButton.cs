using UnityEngine;

public class NewGameButton : MonoBehaviour
{
    private string savedData = "InkStoryState";

    public void RestartStory()
    {
        // Check if the save data exists
        if (PlayerPrefs.HasKey(savedData))
        {
            // Delete the save data
            PlayerPrefs.DeleteKey(savedData);
            PlayerPrefs.Save(); // Ensure the deletion is applied immediately
        }
    }
}