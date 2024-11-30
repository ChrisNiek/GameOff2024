using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class SecretUnlockManager : MonoBehaviour
{
    [System.Serializable]
    public class Secret
    {
        public string secretKey;        // Unique identifier for the secret
        public GameObject cluePanel;    // Panel showing the clue
        public GameObject secretPanel;  // Panel showing the unlocked secret
    }

    public List<Secret> secrets = new List<Secret>();
    public TextMeshProUGUI secretButtonText; // Reference to the TextMeshProUGUI on the "Secrets" button
    public Image secretButtonImage; // Reference to the Image component of the button for texture switching
    public Button resetButton;  // Reference to the reset button
    public float textRevertDelay = 3f; // Time (in seconds) before the text reverts to "Secrets"
    public float flashInterval = 0.1f; // Interval for flashing the "Fill Center" property

    private bool secretUnlocked = false; // Flag to track if any secret has been unlocked

    void Start()
    {
        // Load the unlock states from PlayerPrefs
        LoadSecretsState();

        if (secretButtonText != null)
        {
            secretButtonText.text = "Secrets"; // Initialize the button with "Secrets"
        }

        // Add the ResetSecrets method to the reset button's OnClick event
        if (resetButton != null)
        {
            resetButton.onClick.AddListener(ResetSecrets);
        }
    }

    public void UnlockSecret(string secretKey)
    {
        // Find the secret in the list
        foreach (Secret secret in secrets)
        {
            if (secret.secretKey == secretKey)
            {
                // Hide the clue panel and show the secret panel
                if (secret.cluePanel != null)
                    secret.cluePanel.SetActive(false);

                if (secret.secretPanel != null)
                    secret.secretPanel.SetActive(true);

                secretUnlocked = true; // Mark that a secret has been unlocked

                // Update the secret button text to "Revealed!" and start the flashing effect
                if (secretButtonText != null)
                {
                    secretButtonText.text = "Revealed!"; // Change text to "Revealed!"
                    StartCoroutine(AlternateButtonText(secretButtonText));
                    StartCoroutine(FlashButtonImageFillCenter(secretButtonImage));
                }

                // Save the unlock state
                PlayerPrefs.SetInt(secretKey, 1); // Store '1' to indicate the secret has been unlocked
                PlayerPrefs.Save();

                Debug.Log("Secret unlocked: " + secretKey);
                return;
            }
        }

        Debug.LogWarning("Secret with key '" + secretKey + "' not found.");
    }

    private IEnumerator AlternateButtonText(TextMeshProUGUI buttonText)
    {
        // Wait for the specified delay before reverting the text
        yield return new WaitForSeconds(textRevertDelay);

        // Revert the button text to "Secrets"
        if (secretUnlocked)
        {
            buttonText.text = "Secrets";
            secretUnlocked = false; // Reset the flag
        }
    }

    private IEnumerator FlashButtonImageFillCenter(Image buttonImage)
    {
        // Flash the 'fillCenter' property between true and false while the button shows "Revealed!"
        while (secretUnlocked)
        {
            buttonImage.fillCenter = !buttonImage.fillCenter; // Toggle the 'fillCenter' property
            yield return new WaitForSeconds(flashInterval);
        }

        // Ensure the 'fillCenter' is set to false (no fill) after flashing stops
        if (buttonImage != null)
        {
            buttonImage.fillCenter = false; // End with no fill
        }
    }

    private void LoadSecretsState()
    {
        foreach (Secret secret in secrets)
        {
            // Check if the secret is unlocked (stored in PlayerPrefs)
            if (PlayerPrefs.GetInt(secret.secretKey, 0) == 1)
            {
                // Secret has been unlocked, reveal the secret panel
                if (secret.cluePanel != null)
                    secret.cluePanel.SetActive(false);

                if (secret.secretPanel != null)
                    secret.secretPanel.SetActive(true);
            }
        }
    }

    // Method to reset the secrets
    public void ResetSecrets()
    {
        // Reset the PlayerPrefs for all secrets
        foreach (Secret secret in secrets)
        {
            PlayerPrefs.DeleteKey(secret.secretKey); // Remove the stored unlock state for the secret

            // Reset the UI state for each secret
            if (secret.cluePanel != null)
                secret.cluePanel.SetActive(true);  // Show the clue panel again

            if (secret.secretPanel != null)
                secret.secretPanel.SetActive(false); // Hide the secret panel again
        }

        // Reset the button text
        if (secretButtonText != null)
        {
            secretButtonText.text = "Secrets"; // Change button text back to "Secrets"
        }

        // Save the PlayerPrefs changes
        PlayerPrefs.Save();

        Debug.Log("Secrets reset.");
    }
}
