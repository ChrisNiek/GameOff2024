using UnityEngine;

public class TogglePanel : MonoBehaviour
{
    public GameObject panel; // Assign the panel GameObject in the Inspector

    void Update()
    {
        // Check if the Escape key is pressed
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            Toggle(); // Call the Toggle function
        }
    }

    public void Toggle()
    {
        panel.SetActive(!panel.activeSelf); // Toggle the active state
    }
}
