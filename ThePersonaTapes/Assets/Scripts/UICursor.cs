using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class UICursor : MonoBehaviour
{
    private RectTransform rectTransform;
    private Camera uiCamera;
    private GraphicRaycaster graphicRaycaster;
    private PointerEventData pointerEventData;
    private EventSystem eventSystem;

    public float cursorZPosition = 10f; // Set this to a fixed z-position in front of the camera

    void Start()
    {
        rectTransform = GetComponent<RectTransform>();

        // Get the camera assigned to the canvas (Screen Space - Camera setup)
        uiCamera = Camera.main; // Use the main camera

        if (uiCamera == null)
        {
            Debug.LogError("Main Camera is not assigned. Please make sure there is a camera tagged as 'MainCamera'.");
        }

        graphicRaycaster = GetComponentInParent<Canvas>().GetComponent<GraphicRaycaster>();

        if (graphicRaycaster == null)
        {
            Debug.LogError("GraphicRaycaster not found. Ensure the Canvas has a GraphicRaycaster component.");
        }

        eventSystem = FindObjectOfType<EventSystem>();

        if (eventSystem == null)
        {
            Debug.LogError("EventSystem not found. Ensure there is an EventSystem in the scene.");
        }

        pointerEventData = new PointerEventData(eventSystem);
    }

    void Update()
    {
        // Update the position of the pointer event data to track mouse position
        pointerEventData.position = Input.mousePosition;

        // Use the GraphicRaycaster to cast a ray into the UI and check for hits
        System.Collections.Generic.List<RaycastResult> raycastResults = new System.Collections.Generic.List<RaycastResult>();
        graphicRaycaster.Raycast(pointerEventData, raycastResults);

        // Convert screen space position to world space using the canvas camera
        if (raycastResults.Count > 0)
        {
            // Get the mouse position in screen space
            Vector3 screenPosition = pointerEventData.position;

            // Set the z-depth to the cursorZPosition for a fixed distance from the camera
            screenPosition.z = cursorZPosition;

            // Convert screen space to world space
            Vector3 worldPosition = uiCamera.ScreenToWorldPoint(screenPosition);

            // Update the RectTransform position
            rectTransform.position = worldPosition;
        }
    }
}
