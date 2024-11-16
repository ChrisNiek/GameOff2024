using UnityEngine;
using UnityEngine.SceneManagement;

public class ResolutionManager : MonoBehaviour
{
    private float targetAspect = 1280f / 960f;

    void Awake()
    {
        // Ensure this object persists across scenes
        DontDestroyOnLoad(gameObject);

        // Set initial resolution and aspect ratio
        SetResolution();

        // Subscribe to scene loaded event
        SceneManager.sceneLoaded += OnSceneLoaded;

        Cursor.visible = false;
    }

    void OnSceneLoaded(Scene scene, LoadSceneMode mode)
    {
        // Reapply resolution and aspect ratio on scene load
        SetResolution();
    }

    void SetResolution()
    {
        // Check if we're in WebGL to avoid using unsupported screen modes
#if UNITY_WEBGL
            AdjustAspectRatio();
#else
        Screen.SetResolution(1280, 960, FullScreenMode.FullScreenWindow);
        AdjustAspectRatio();
#endif
    }

    void AdjustAspectRatio()
    {
        float windowAspect = (float)Screen.width / (float)Screen.height;
        float scaleHeight = windowAspect / targetAspect;

        Camera mainCamera = GameObject.Find("MainCamera")?.GetComponent<Camera>();
        if (mainCamera == null)
        {
            Debug.LogError("MainCamera not found! Make sure your camera is named 'MainCamera'.");
            return;
        }

        if (scaleHeight < 1.0f)
        {
            // Black bars on top and bottom
            Rect rect = mainCamera.rect;
            rect.width = 1.0f;
            rect.height = scaleHeight;
            rect.x = 0;
            rect.y = (1.0f - scaleHeight) / 2.0f;
            mainCamera.rect = rect;
        }
        else
        {
            // Black bars on the sides
            float scaleWidth = 1.0f / scaleHeight;
            Rect rect = mainCamera.rect;
            rect.width = scaleWidth;
            rect.height = 1.0f;
            rect.x = (1.0f - scaleWidth) / 2.0f;
            rect.y = 0;
            mainCamera.rect = rect;
        }
    }

    void OnDestroy()
    {
        // Unsubscribe from the scene loaded event to prevent memory leaks
        SceneManager.sceneLoaded -= OnSceneLoaded;
    }
}
