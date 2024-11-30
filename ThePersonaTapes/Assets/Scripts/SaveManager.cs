using System.Collections;          // For IEnumerator
using UnityEngine;                 // For UnityEngine classes
using UnityEngine.UI;              // For Button class
using TMPro;                       // For TextMeshProUGUI
                     


public class SaveManager : MonoBehaviour
{
    public static SaveManager Instance;
    public Button menuButton;  // Reference to the button to flash
    public TextMeshProUGUI menuButtonText; // Reference to the button text
    public float textRevertDelay = 3f; // Delay before reverting the text
    public float flashInterval = 0.1f; // Flashing interval for the button


    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
        }
    }

    public void AutoSave(string saveData)
    {
        PlayerPrefs.SetString("InkStoryState", saveData);
        PlayerPrefs.Save();
        Debug.Log("Game Saved");

        // Trigger button flashing
        if (menuButton != null)
        {
            StartCoroutine(FlashButton());
        }
    }


    public string LoadSave()
    {
        return PlayerPrefs.GetString("InkStoryState", string.Empty);
    }

    private IEnumerator FlashButton()
    {
        if (menuButton != null && menuButtonText != null)
        {
            // Change button text to indicate save
            menuButtonText.text = "Game Saved";

            // Get the Image component for the button
            Image buttonImage = menuButton.GetComponent<Image>();

            // Store the starting time
            float startTime = Time.time;

            // Flash the 'fillCenter' property between true and false while the button shows "Game Saved"
            while (Time.time - startTime < textRevertDelay)
            {
                // Toggle the 'fillCenter' property
                buttonImage.fillCenter = !buttonImage.fillCenter;

                // Wait for the specified flash interval before toggling again
                yield return new WaitForSeconds(flashInterval);
            }

            // Ensure the 'fillCenter' is set to false after the flashing stops
            buttonImage.fillCenter = false;

            // Revert the button text back to "Menu" after the flash
            menuButtonText.text = "Menu";
        }
    }



}
