using UnityEngine;
using UnityEngine.UI;
using System.Collections;

public class FadeOutAndDeactivate : MonoBehaviour
{
    public Image imageToFade;  // The image to fade out
    public float fadeDuration = 2f;  // Duration of the fade out

    private CanvasGroup canvasGroup;

    void Start()
    {
        // Ensure the image starts fully visible
        canvasGroup = imageToFade.GetComponent<CanvasGroup>();
        if (canvasGroup == null)
        {
            canvasGroup = imageToFade.gameObject.AddComponent<CanvasGroup>();
        }
        canvasGroup.alpha = 1f;  // Start fully visible
        {
            StartCoroutine(FadeOutAndDeactivateCoroutine());
        }
    }
  

    private IEnumerator FadeOutAndDeactivateCoroutine()
    {
        float elapsedTime = 0f;

        // Fade out the image
        while (elapsedTime < fadeDuration)
        {
            elapsedTime += Time.deltaTime;
            canvasGroup.alpha = Mathf.Lerp(1f, 0f, elapsedTime / fadeDuration);
            yield return null;
        }

        canvasGroup.alpha = 0f;  // Ensure it's fully transparent at the end

        // Deactivate the image after fading out
        imageToFade.gameObject.SetActive(false);
    }
}
