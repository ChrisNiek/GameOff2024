using UnityEngine;
using UnityEngine.EventSystems;

public class UICursor : MonoBehaviour
{
    private RectTransform rectTransform;
    private float fixedZPosition;

    void Start()
    {
        rectTransform = GetComponent<RectTransform>();
        // Store the initial z-position so it remains fixed
        fixedZPosition = rectTransform.position.z;

        // Hide the system cursor
        HideCursor();
    }

    void Update()
    {
        Vector3 mousePosition = Input.mousePosition;
        // Convert mouse position to world space with respect to the camera
        mousePosition.z = Camera.main.WorldToScreenPoint(rectTransform.position).z;
        Vector3 worldPosition = Camera.main.ScreenToWorldPoint(mousePosition);

        // Set the cursor's position, keeping the fixed z-position
        rectTransform.position = new Vector3(worldPosition.x, worldPosition.y, fixedZPosition);

        // Ensure the cursor remains hidden in WebGL
        if (Application.platform == RuntimePlatform.WebGLPlayer && Cursor.visible)
        {
            HideCursor();
        }
    }

    void HideCursor()
    {
        // Hide the cursor without locking it
        Cursor.visible = false;
        Cursor.lockState = CursorLockMode.None;
    }

    void OnApplicationFocus(bool hasFocus)
    {
        // Re-hide the cursor if the application regains focus
        if (hasFocus)
        {
            HideCursor();
        }
    }
}
