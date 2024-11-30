using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;
using System.Collections;

public class SceneTransitionScript : MonoBehaviour
{
    public Camera mainCamera;            // Reference to the camera
    public Image fadeImage;              // UI Image used for fade effect
    public AudioSource backgroundMusic;  // AudioSource for background music to fade out
    public float zoomDuration = 2f;      // Time to increase the FOV
    public float maxFov = 80f;           // Max field of view (zoomed in)
    public float fadeDuration = 2f;      // Time for fade to black
    public float musicFadeDuration = 2f; // Duration for fading out music
    public string sceneToLoad = "SceneName"; // The name of the scene to load after transition
    public Button playButton;            // Reference to the play button (optional)

    private float targetFov;             // The target field of view
    private float currentFov;            // The current field of view
    private bool isTransitioning = false; // Flag to track if the transition is happening

    private void Start()
    {
        if (mainCamera == null)
        {
            mainCamera = Camera.main;  // Default to the main camera if not assigned
        }

        if (fadeImage == null)
        {
            Debug.LogError("Fade Image is not assigned.");
        }

        if (backgroundMusic == null)
        {
            Debug.LogWarning("Background music is not assigned.");
        }

        // Optionally disable the button at the start if you don't want it active initially
        if (playButton != null)
        {
            playButton.interactable = true;
        }
    }

    // Method to manually trigger the transition, but only if it's not already happening
    public void StartSceneTransition()
    {
        if (isTransitioning) return;  // Prevent activation if transition is already in progress

        isTransitioning = true; // Set flag to indicate transition has started

        // Optionally disable the button to prevent spamming
        if (playButton != null)
        {
            playButton.interactable = false;
        }

        StartCoroutine(ZoomFadeMusicAndLoad());
    }

    private IEnumerator ZoomFadeMusicAndLoad()
    {
        // Initialize starting values for FOV, fade, and music volume
        targetFov = maxFov;
        currentFov = mainCamera.fieldOfView;

        float fadeAlpha = 0f; // Local variable for fade effect
        float musicVolumeStart = backgroundMusic ? backgroundMusic.volume : 0f;

        float elapsedTime = 0f;

        // Simultaneously update FOV, fade alpha, and music volume
        while (elapsedTime < Mathf.Max(zoomDuration, fadeDuration, musicFadeDuration))
        {
            // Lerp FOV
            mainCamera.fieldOfView = Mathf.Lerp(currentFov, targetFov, elapsedTime / zoomDuration);

            // Lerp fade (alpha)
            fadeAlpha = Mathf.Lerp(0f, 1f, elapsedTime / fadeDuration);
            fadeImage.color = new Color(0f, 0f, 0f, fadeAlpha);

            // Fade music (volume)
            if (backgroundMusic != null)
            {
                backgroundMusic.volume = Mathf.Lerp(musicVolumeStart, 0f, elapsedTime / musicFadeDuration);
            }

            elapsedTime += Time.deltaTime;
            yield return null;
        }

        // Ensure final values
        mainCamera.fieldOfView = targetFov;
        fadeImage.color = new Color(0f, 0f, 0f, 1f);

        if (backgroundMusic != null)
        {
            backgroundMusic.volume = 0f; // Ensure music volume is fully faded
        }

        // Load the new scene after fading out
        SceneManager.LoadScene(sceneToLoad);
    }
}
