using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class ButtonSound : MonoBehaviour, IPointerEnterHandler, IPointerClickHandler
{
    [SerializeField] private bool useDefaultSounds = true;
    private SoundManager soundManager; // Reference to SoundManager

    void Start()
    {
        // Find the SoundManager in the scene
        soundManager = FindObjectOfType<SoundManager>();

        // Optional: Log an error if SoundManager is not found
        if (soundManager == null)
        {
            Debug.LogError("SoundManager not found in the scene!");
        }
    }

    // Play sound on hover
    public void OnPointerEnter(PointerEventData eventData)
    {
        if (useDefaultSounds && soundManager != null)
        {
            soundManager.PlayHoverSound();  // Use the instance reference
        }
    }

    // Play sound on click
    public void OnPointerClick(PointerEventData eventData)
    {
        if (useDefaultSounds && soundManager != null)
        {
            soundManager.PlayClickSound();  // Use the instance reference
        }
    }
}
