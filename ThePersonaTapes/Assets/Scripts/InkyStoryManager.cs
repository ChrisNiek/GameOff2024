using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using Ink.Runtime;

public class InkyStoryManager : MonoBehaviour
{
    public TextMeshProUGUI storyText;
    public GameObject choicesContainer;
    public Button choiceButtonPrefab;
    public TextAsset inkJSONAsset;

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

    private Story inkStory;
    private Coroutine fadeInCoroutine;
    private string currentScene;
    private bool isTyping = false;  // Flag to track if the typewriter effect is active

    void Start()
    {
        inkStory = new Story(inkJSONAsset.text);
        transitionPlane.SetActive(true);
        StartCoroutine(FadeOutTransitionPlane());  // Fade out on start
        StartCoroutine(DisplayCurrentParagraph());
    }

    void Update()
    {
        // Check for left mouse click (button 0 is the left mouse button)
        if (Input.GetMouseButtonDown(0) && isTyping)
        {
            // Skip the typewriter effect on click
            StopCoroutine(TypewriterEffect(inkStory.currentText));
            storyText.text = inkStory.currentText; // Immediately display full text
            isTyping = false;  // End typing effect
        }
    }

    private IEnumerator DisplayCurrentParagraph()
    {
        storyText.text = "";

        if (inkStory.canContinue)
        {
            string paragraph = inkStory.Continue();
            storyText.text = "";

            ProcessTags(inkStory.currentTags);

            CanvasGroup storyCanvasGroup = storyText.GetComponent<CanvasGroup>();
            if (storyCanvasGroup == null)
            {
                storyCanvasGroup = storyText.gameObject.AddComponent<CanvasGroup>();
            }
            storyCanvasGroup.alpha = 1f;

            // Start typewriter effect
            yield return StartCoroutine(TypewriterEffect(paragraph));

            RefreshChoices();
        }
    }

    private IEnumerator TypewriterEffect(string text)
    {
        isTyping = true; // Start typing
        storyText.text = "";

        for (int i = 0; i < text.Length; i++)
        {
            if (!isTyping) break; // Exit early if user clicks and skips

            storyText.text += text[i];

            if (!char.IsWhiteSpace(text[i]) && typewriterAudioSource && typewriterSound)
            {
                typewriterAudioSource.pitch = Random.Range(minPitch, maxPitch);
                typewriterAudioSource.PlayOneShot(typewriterSound);
            }

            yield return new WaitForSeconds(0.01f); // Speed of typewriter effect
        }

        // If typing is interrupted, show the whole text immediately
        if (isTyping)
        {
            storyText.text = text;
        }

        isTyping = false; // End typing effect
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

        // Define opacity steps for chunky fade effect (20% increments)
        float[] fadeSteps = { 0.2f, 0.4f, 0.6f, 0.8f, 1.0f };

        // Fade in using chunky steps
        for (int i = 0; i < fadeSteps.Length; i++)
        {
            transitionCanvasGroup.alpha = fadeSteps[i];
            yield return new WaitForSeconds(0.1f); // Pause between steps for the chunky effect
        }

        // Pause at full opacity to indicate the scene change
        yield return new WaitForSeconds(0.5f);

        // Apply new textures to scene planes
        foregroundPlane.GetComponent<Renderer>().material.mainTexture = sceneData.foreground;
        frontMidgroundPlane.GetComponent<Renderer>().material.mainTexture = sceneData.frontMidground;
        rearMidgroundPlane.GetComponent<Renderer>().material.mainTexture = sceneData.rearMidground;
        backgroundPlane.GetComponent<Renderer>().material.mainTexture = sceneData.background;

        // Fade out in chunky steps
        for (int i = fadeSteps.Length - 1; i >= 0; i--)
        {
            transitionCanvasGroup.alpha = fadeSteps[i];
            yield return new WaitForSeconds(0.1f); // Pause between steps for the chunky effect
        }

        transitionCanvasGroup.alpha = 0f;
        transitionPlane.SetActive(false); // Hide transition plane after fade out
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

                choiceButton.onClick.AddListener(() => OnChoiceSelected(choice));

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
            continueButton.onClick.AddListener(OnContinueClicked);

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
}
