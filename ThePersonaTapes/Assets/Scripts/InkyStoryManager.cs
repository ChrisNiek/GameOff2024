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

    public List<SceneData> sceneLibrary = new List<SceneData>(); // List of scenes that can be modified in the Inspector

    private Story inkStory;
    private Coroutine fadeInCoroutine;
    private string currentSceneName = ""; // To keep track of the current scene

    void Start()
    {
        inkStory = new Story(inkJSONAsset.text);
        StartCoroutine(DisplayCurrentParagraph());
    }

    private IEnumerator DisplayCurrentParagraph()
    {
        storyText.text = "";

        if (inkStory.canContinue)
        {
            string paragraph = inkStory.Continue();
            storyText.text = paragraph;

            // Check for tags and handle scene changes
            ProcessTags(inkStory.currentTags);

            // Start fading in the story text
            CanvasGroup storyCanvasGroup = storyText.GetComponent<CanvasGroup>();
            if (storyCanvasGroup == null)
            {
                storyCanvasGroup = storyText.gameObject.AddComponent<CanvasGroup>();
            }
            storyCanvasGroup.alpha = 0f;

            yield return StartCoroutine(FadeInText(storyCanvasGroup, 0.50f));

            // After text is fully displayed, refresh choices
            RefreshChoices();
        }
    }

    private void ProcessTags(List<string> tags)
    {
        foreach (string tag in tags)
        {
            // Check for scene change tags (e.g., #scene:Beach)
            if (tag.StartsWith("scene:"))
            {
                string sceneName = tag.Substring(6);  // Extract scene name after "scene:"
                Debug.Log("Scene change detected: " + sceneName);
                ChangeScene(sceneName);  // Pass scene name to SceneChanger
            }
        }
    }

    private void ChangeScene(string sceneName)
    {
        // Check if the new scene name is different from the current one
        if (sceneName == currentSceneName)
        {
            Debug.Log("Scene transition skipped, already in scene: " + sceneName);
            return; // Skip the transition if the scene is the same
        }

        SceneData sceneData = sceneLibrary.Find(scene => scene.sceneName == sceneName);

        if (sceneData != null)
        {
            currentSceneName = sceneName; // Update current scene name
            StartCoroutine(FadeAndApplyScene(sceneData));
        }
        else
        {
            Debug.LogError("Scene not found: " + sceneName);
        }
    }

    private IEnumerator FadeAndApplyScene(SceneData sceneData)
    {
        // Ensure transition plane has a CanvasGroup for fading
        CanvasGroup transitionCanvasGroup = transitionPlane.GetComponent<CanvasGroup>();
        if (transitionCanvasGroup == null)
        {
            transitionCanvasGroup = transitionPlane.AddComponent<CanvasGroup>();
        }

        float duration = 1f; // Duration of each fade in/out transition
        float elapsedTime = 0f;

        // Check if transition alpha is already 1 (for initial load fade-out)
        if (transitionCanvasGroup.alpha < 1f)
        {
            // Fade in transition
            transitionPlane.SetActive(true);
            transitionCanvasGroup.alpha = 0f;

            while (elapsedTime < duration)
            {
                transitionCanvasGroup.alpha = Mathf.Lerp(0f, 1f, elapsedTime / duration);
                elapsedTime += Time.deltaTime;
                yield return null;
            }
            transitionCanvasGroup.alpha = 1f;
        }
        else
        {
            // If alpha is already 1, keep transition plane active and reset elapsedTime
            transitionPlane.SetActive(true);
            elapsedTime = 0f;
        }

        // Set new textures for planes
        foregroundPlane.GetComponent<Renderer>().material.mainTexture = sceneData.foreground;
        frontMidgroundPlane.GetComponent<Renderer>().material.mainTexture = sceneData.frontMidground;
        rearMidgroundPlane.GetComponent<Renderer>().material.mainTexture = sceneData.rearMidground;
        backgroundPlane.GetComponent<Renderer>().material.mainTexture = sceneData.background;

        // Fade out transition
        elapsedTime = 0f;
        while (elapsedTime < duration)
        {
            transitionCanvasGroup.alpha = Mathf.Lerp(1f, 0f, elapsedTime / duration);
            elapsedTime += Time.deltaTime;
            yield return null;
        }
        transitionCanvasGroup.alpha = 0f;
        transitionPlane.SetActive(false);  // Hide transition plane after fade
    }


    private IEnumerator FadeInText(CanvasGroup canvasGroup, float duration)
    {
        float elapsedTime = 0f;
        while (elapsedTime < duration)
        {
            canvasGroup.alpha = Mathf.Lerp(0f, 1f, elapsedTime / duration);
            elapsedTime += Time.deltaTime;
            yield return null;
        }
        canvasGroup.alpha = 1f;
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

[System.Serializable]
public class SceneData
{
    public string sceneName;  // Scene name to identify the scene in Ink
    public Texture2D foreground;
    public Texture2D frontMidground;
    public Texture2D rearMidground;
    public Texture2D background;

    public SceneData(string sceneName, Texture2D foreground, Texture2D frontMidground, Texture2D rearMidground, Texture2D background)
    {
        this.sceneName = sceneName;
        this.foreground = foreground;
        this.frontMidground = frontMidground;
        this.rearMidground = rearMidground;
        this.background = background;
    }
}
