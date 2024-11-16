using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;

public class ButtonSound : MonoBehaviour, IPointerEnterHandler, IPointerClickHandler
{
    // You can optionally expose sounds for each button in the Inspector if needed
    [SerializeField] private bool useDefaultSounds = true;

    // Play sound on hover
    public void OnPointerEnter(PointerEventData eventData)
    {
        if (useDefaultSounds)
        {
            SoundManager.Instance.PlayHoverSound(); // Play the hover sound using SoundManager
        }
    }

    // Play sound on click
    public void OnPointerClick(PointerEventData eventData)
    {
        if (useDefaultSounds)
        {
            SoundManager.Instance.PlayClickSound(); // Play the click sound using SoundManager
        }
    }
}
