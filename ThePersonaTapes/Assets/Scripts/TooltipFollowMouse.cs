using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEngine.EventSystems;
using System.Collections.Generic;

public class TooltipFollowMouse : MonoBehaviour
{
    [System.Serializable]
    public class PanelTooltipPair
    {
        public GameObject panel;       // Panel GameObject
        public string tooltipMessage;  // Corresponding tooltip message
    }

    public List<PanelTooltipPair> panelTooltipPairs; // List of panels and messages
    public GameObject tooltip; // Tooltip UI element
    public Vector2 offset = new Vector2(10f, 10f);

    private RectTransform tooltipRect;
    private Canvas canvas;
    private PanelTooltipPair currentPanelPair;

    void Start()
    {
        tooltip.SetActive(false); // Hide tooltip initially
        tooltipRect = tooltip.GetComponent<RectTransform>();

        // Find parent canvas
        canvas = tooltip.GetComponentInParent<Canvas>();
        if (canvas == null)
        {
            Debug.LogError("Tooltip must be a child of a Canvas.");
        }
    }

    void Update()
    {
        // Check if Escape key is pressed and hide tooltip if active
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            HideTooltip();
        }

        // Only update position if the tooltip is active
        if (currentPanelPair != null && tooltip.activeSelf)
        {
            // Update tooltip position to follow the mouse
            Vector2 localPoint;
            RectTransformUtility.ScreenPointToLocalPointInRectangle(
                canvas.transform as RectTransform,
                Input.mousePosition,
                canvas.worldCamera,
                out localPoint
            );

            // Move tooltip to the mouse position with offset
            tooltipRect.anchoredPosition = localPoint + offset;
        }
    }

    // Public methods for Event Triggers
    public void OnPointerEnter(GameObject panel)
    {
        // Find the corresponding tooltip message
        currentPanelPair = panelTooltipPairs.Find(pair => pair.panel == panel);
        if (currentPanelPair != null)
        {
            // Position tooltip before showing it
            SetTooltipPosition();

            // Show the tooltip after setting position
            ShowTooltip(currentPanelPair.tooltipMessage);
        }
    }

    public void OnPointerExit()
    {
        HideTooltip();
        currentPanelPair = null;
    }

    private void SetTooltipPosition()
    {
        // Set tooltip's initial position relative to the mouse position
        Vector2 localPoint;
        RectTransformUtility.ScreenPointToLocalPointInRectangle(
            canvas.transform as RectTransform,
            Input.mousePosition,
            canvas.worldCamera,
            out localPoint
        );
        tooltipRect.anchoredPosition = localPoint + offset;
    }

    private void ShowTooltip(string message)
    {
        // Update the tooltip's text component
        if (tooltip.GetComponent<Text>() != null)
            tooltip.GetComponent<Text>().text = message;
        else if (tooltip.GetComponent<TextMeshProUGUI>() != null)
            tooltip.GetComponent<TextMeshProUGUI>().text = message;

        // Activate the tooltip
        tooltip.SetActive(true);
    }

    private void HideTooltip()
    {
        tooltip.SetActive(false);
    }
}
