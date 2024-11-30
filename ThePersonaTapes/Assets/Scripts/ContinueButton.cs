using UnityEngine;
using UnityEngine.UI;

public class HideButtonIfNoSave : MonoBehaviour
{
    private string saveDataKey = "InkStoryState"; // Your save data key

    void Start()
    {
        // Check if save data exists
        if (!PlayerPrefs.HasKey(saveDataKey))
        {
            Debug.Log("No save data found. Hiding button.");
            gameObject.SetActive(false); // Hide the button's GameObject
        }
        else
        {
            Debug.Log("Save data found: " + saveDataKey);
        }
    }
}
