using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Ink.Runtime;
using UnityEngine.SceneManagement;

public class InkyStoryManager : MonoBehaviour
{
    public Button restartButton;
    public Button menuButton; // Reference to the menu button that will flash
    public float textRevertDelay = 3f; // Time before reverting the button text
    public SecretUnlockManager secretUnlockManager;
    public ColorManager colorManager;
    public TextMeshProUGUI storyText;
    public GameObject choicesContainer;
    public Button choiceButtonPrefab;
    public TextAsset inkJSONAsset;
    public SoundEffectsManager soundEffectsManager; // Reference to SoundEffectsManager

    public GameObject foregroundPlane;
    public GameObject frontMidgroundPlane;
    public GameObject rearMidgroundPlane;
    public GameObject backgroundPlane;
    public GameObject transitionPlane;

    public List<SceneDataSO> sceneLibrary = new List<SceneDataSO>(); // Reference to Scriptable Object

    public AudioSource typewriterAudioSource;
    public AudioClip typewriterSound;
    public float minPitch = 0.9f;
    public float maxPitch = 1.1f;

    public Material specialEffectMaterial; // Material with shader for special effects

    public AdaptiveMusicManager musicManager; // Reference to AdaptiveMusicManager

    private Story inkStory;
    private Coroutine fadeInCoroutine;
    private string currentScene;
    private bool isTyping = false;  // Flag to track if the typewriter effect is active

    void Start()
    {
        inkStory = new Story(inkJSONAsset.text); // Initialize the Ink story with the JSON asset
        string savedData = SaveManager.Instance.LoadSave(); // Load the saved data from PlayerPrefs

        if (!string.IsNullOrEmpty(savedData))
        {
            inkStory.state.LoadJson(savedData); // Load the saved state into the Ink story
        }

        if (restartButton != null)
        {
            restartButton.onClick.AddListener(RestartStory);
        }

        transitionPlane.SetActive(true);
        StartCoroutine(FadeOutTransitionPlane());  // Fade out on start
        StartCoroutine(DisplayCurrentParagraph());
        Cursor.visible = false;
    }


    void Update()
    {
        if (Input.GetMouseButtonDown(0) && isTyping)
        {
            StopCoroutine(TypewriterEffect(inkStory.currentText));
            storyText.text = inkStory.currentText;
            isTyping = false;
        }
    }

    private IEnumerator DisplayCurrentParagraph()
    {
        storyText.text = "";

        if (inkStory.canContinue)
        {
            string paragraph = inkStory.Continue();
            storyText.text = "";

            ProcessTags(inkStory.currentTags); // Process tags including music triggers

            CanvasGroup storyCanvasGroup = storyText.GetComponent<CanvasGroup>();
            if (storyCanvasGroup == null)
            {
                storyCanvasGroup = storyText.gameObject.AddComponent<CanvasGroup>();
            }
            storyCanvasGroup.alpha = 1f;

            yield return StartCoroutine(TypewriterEffect(paragraph));

            RefreshChoices();
        }
    }

    private IEnumerator TypewriterEffect(string text)
    {
        isTyping = true;
        storyText.text = "";

        for (int i = 0; i < text.Length; i++)
        {
            if (!isTyping) break;

            storyText.text += text[i];

            if (!char.IsWhiteSpace(text[i]) && typewriterAudioSource && typewriterSound)
            {
                typewriterAudioSource.pitch = Random.Range(minPitch, maxPitch);
                typewriterAudioSource.PlayOneShot(typewriterSound);
            }

            yield return new WaitForSeconds(0.001f);
        }

        if (isTyping)
        {
            storyText.text = text;
        }

        isTyping = false;
    }

    private void ProcessTags(List<string> tags)
    {
        foreach (string tag in tags)
        {
            if (tag.StartsWith("scene:"))
            {
                string sceneName = tag.Substring(6);
                if (sceneName != currentScene)
                {
                    currentScene = sceneName;
                    ChangeScene(sceneName);
                }
            }

            // Inside InkyStoryManager

            // Check for #music trigger in the tags
            if (tag.StartsWith("music:"))
            {
                string songName = tag.Substring(7); // Extract song name after #music:
                musicManager.TriggerMusic(songName); // Trigger the music change in the AdaptiveMusicManager
            }

            // Check for #colour trigger in the tags
            if (tag.StartsWith("colour:"))
            {
                string paletteName = tag.Substring(8); // Extract palette name after #colour:
                colorManager.SwitchPaletteByName(paletteName); // Switch to the palette by name
            }

            if (tag.StartsWith("RESTART"))
            {
                RestartStory(); // Direct method call if not a coroutine
            }

            if (tag.StartsWith("sfx:"))
            {
                string sfxName = tag.Substring(4); // Extract the sound effect name after #sfx:
                soundEffectsManager.PlaySFX(sfxName); // Play the sound effect
            }

              if (tag.StartsWith("secret:"))
        {
            string secretKey = tag.Substring(7); // Extract the secret key
            secretUnlockManager.UnlockSecret(secretKey); // Notify the SecretUnlockManager
        }

            if (tag.StartsWith("autosave"))
            {
                string saveData = inkStory.state.ToJson(); // Save the current state of the Ink story
                SaveManager.Instance.AutoSave(saveData); // Call SaveManager to save
            }

        }
    }


    private void ChangeScene(string sceneName)
    {
        SceneDataSO sceneData = sceneLibrary.Find(scene => scene.sceneName == sceneName);

        if (sceneData != null)
        {
            StartCoroutine(FadeAndApplyScene(sceneData));
        }
        else
        {
            Debug.LogError("Scene not found: " + sceneName);
        }
    }

    private IEnumerator FadeOutTransitionPlane()
    {
        CanvasGroup transitionCanvasGroup = transitionPlane.GetComponent<CanvasGroup>();
        if (transitionCanvasGroup == null)
        {
            transitionCanvasGroup = transitionPlane.AddComponent<CanvasGroup>();
        }
        transitionCanvasGroup.alpha = 1f;

        float duration = 1f;
        float elapsedTime = 0f;

        while (elapsedTime < duration)
        {
            transitionCanvasGroup.alpha = Mathf.Lerp(1f, 0f, elapsedTime / duration);
            elapsedTime += Time.deltaTime;
            yield return null;
        }

        transitionCanvasGroup.alpha = 0f;
        transitionPlane.SetActive(false);
    }

    private IEnumerator FadeAndApplyScene(SceneDataSO sceneData)
    {
        CanvasGroup transitionCanvasGroup = transitionPlane.GetComponent<CanvasGroup>();
        if (transitionCanvasGroup == null)
        {
            transitionCanvasGroup = transitionPlane.AddComponent<CanvasGroup>();
        }

        transitionPlane.SetActive(true);

        float[] fadeSteps = { 0.2f, 0.4f, 0.6f, 0.8f, 1.0f };

        for (int i = 0; i < fadeSteps.Length; i++)
        {
            transitionCanvasGroup.alpha = fadeSteps[i];
            yield return new WaitForSeconds(0.1f);
        }

        yield return new WaitForSeconds(0.5f);

        foregroundPlane.GetComponent<Renderer>().material.mainTexture = sceneData.foreground;
        frontMidgroundPlane.GetComponent<Renderer>().material.mainTexture = sceneData.frontMidground;
        rearMidgroundPlane.GetComponent<Renderer>().material.mainTexture = sceneData.rearMidground;
        backgroundPlane.GetComponent<Renderer>().material.mainTexture = sceneData.background;

        for (int i = fadeSteps.Length - 1; i >= 0; i--)
        {
            transitionCanvasGroup.alpha = fadeSteps[i];
            yield return new WaitForSeconds(0.1f);
        }

        transitionCanvasGroup.alpha = 0f;
        transitionPlane.SetActive(false);
    }

    private void RefreshChoices()
    {
        ClearChoices();

        if (inkStory.currentChoices.Count > 0)
        {
            foreach (Ink.Runtime.Choice choice in inkStory.currentChoices)
            {
                Button choiceButton = Instantiate(choiceButtonPrefab, choicesContainer.transform);
                TextMeshProUGUI buttonText = choiceButton.GetComponentInChildren<TextMeshProUGUI>();
                buttonText.text = choice.text;

                // Apply color to the button and text
                colorManager.ApplyColorToButton(choiceButton); // Apply color to the button
                colorManager.ApplyColorToText(buttonText); // Apply color to the text

                // Special effect for the button (if applicable)
                if (inkStory.currentTags.Contains("bfx:") && specialEffectMaterial != null)
                {
                    Image buttonImage = choiceButton.GetComponent<Image>();
                    if (buttonImage != null)
                    {
                        buttonImage.material = specialEffectMaterial;
                    }
                }

                // Add listener for the button click
                choiceButton.onClick.AddListener(() => OnChoiceSelected(choice));

                // Setup CanvasGroup for fading
                CanvasGroup canvasGroup = choiceButton.GetComponent<CanvasGroup>();
                if (canvasGroup == null)
                    canvasGroup = choiceButton.gameObject.AddComponent<CanvasGroup>();
                canvasGroup.alpha = 0f;
            }

            fadeInCoroutine = StartCoroutine(FadeInChoices());
        }
        else
        {
            Button continueButton = Instantiate(choiceButtonPrefab, choicesContainer.transform);
            TextMeshProUGUI continueButtonText = continueButton.GetComponentInChildren<TextMeshProUGUI>();
            continueButtonText.text = "Click to continue";

            // Apply color to the continue button and text
            colorManager.ApplyColorToButton(continueButton); // Apply color to the button
            colorManager.ApplyColorToText(continueButtonText); // Apply color to the text

            continueButton.onClick.AddListener(OnContinueClicked);

            // Setup CanvasGroup for fading
            CanvasGroup canvasGroup = continueButton.GetComponent<CanvasGroup>();
            if (canvasGroup == null)
                canvasGroup = continueButton.gameObject.AddComponent<CanvasGroup>();
            canvasGroup.alpha = 0f;

            fadeInCoroutine = StartCoroutine(FadeInChoices());
        }
    }


    private IEnumerator FadeInChoices()
    {
        foreach (Transform choice in choicesContainer.transform)
        {
            CanvasGroup canvasGroup = choice.GetComponent<CanvasGroup>();
            float duration = 0.1f;
            float elapsedTime = 0f;

            while (elapsedTime < duration)
            {
                canvasGroup.alpha = Mathf.Lerp(0f, 1f, elapsedTime / duration);
                elapsedTime += Time.deltaTime;
                yield return null;
            }
            canvasGroup.alpha = 1f;

            yield return new WaitForSeconds(0.1f);
        }
    }

    private void OnContinueClicked()
    {
        StopFadeInCoroutine();
        ClearChoices();
        StartCoroutine(DisplayCurrentParagraph());
    }

    private void OnChoiceSelected(Ink.Runtime.Choice selectedChoice)
    {
        StopFadeInCoroutine();
        ClearChoices();
        inkStory.ChooseChoiceIndex(selectedChoice.index);
        StartCoroutine(DisplayCurrentParagraph());
    }

    private void StopFadeInCoroutine()
    {
        if (fadeInCoroutine != null)
        {
            StopCoroutine(fadeInCoroutine);
            fadeInCoroutine = null;
        }
    }

    private void ClearChoices()
    {
        foreach (Transform child in choicesContainer.transform)
        {
            Destroy(child.gameObject);
        }
    }

    public void ReloadStory()
    {
        // Reset the Ink story by reloading the Ink JSON text
        inkStory = new Story(inkJSONAsset.text); // Initialize the Ink story with the JSON asset
        string savedData = SaveManager.Instance.LoadSave(); // Load the saved data from PlayerPrefs

        if (!string.IsNullOrEmpty(savedData))
        {
            inkStory.state.LoadJson(savedData); // Load the saved state into the Ink story
        }

        /* Optionally reset other game variables like secrets, colors, or sound effects
        if (secretUnlockManager != null)
        {
            secretUnlockManager.ResetSecrets(); // Reset secrets
        }
        else
        {
            Debug.LogWarning("SecretUnlockManager is not assigned.");
        }
        */

        if (colorManager != null)
        {
            colorManager.ResetPalette(); // Reset the color palette
        }
        else
        {
            Debug.LogWarning("ColorManager is not assigned.");
        }

        // Reset UI elements if needed
        if (storyText != null)
        {
            storyText.text = ""; // Clear the story text
        }



        ClearChoices(); // Make sure this method exists to clear any displayed choices

        // Restart the story by displaying the first paragraph
        StartCoroutine(DisplayCurrentParagraph());

        // Optionally, reset music, effects, or other UI elements
        if (musicManager != null)
        {
            musicManager.StopMusic(); // Stop any music currently playing
        }
        else
        {
            Debug.LogWarning("MusicManager is not assigned.");
        }

    }
public void RestartStory()
{
    // Reset the Ink story by reloading the Ink JSON text
    if (inkJSONAsset != null)
    {
        inkStory = new Story(inkJSONAsset.text); // Reload the story from JSON
    }
    else
    {
        Debug.LogError("Ink JSON asset is missing or not assigned.");
    }

    /* Optionally reset other game variables like secrets, colors, or sound effects
    if (secretUnlockManager != null)
    {
        secretUnlockManager.ResetSecrets(); // Reset secrets
    }
    else
    {
        Debug.LogWarning("SecretUnlockManager is not assigned.");
    }
    */

    if (colorManager != null)
    {
        colorManager.ResetPalette(); // Reset the color palette
    }
    else
    {
        Debug.LogWarning("ColorManager is not assigned.");
    }

    // Reset UI elements if needed
    if (storyText != null)
    {
        storyText.text = ""; // Clear the story text
    }

    ClearChoices(); // Make sure this method exists to clear any displayed choices

        // Optionally, reset music, effects, or other UI elements
    if (musicManager != null)
    {
        musicManager.StopMusic(); // Stop any music currently playing
    }
    else
    {
        Debug.LogWarning("MusicManager is not assigned.");
    }

    // Restart the story by displaying the first paragraph
    StartCoroutine(DisplayCurrentParagraph());
}



}
