using UnityEngine;

public class SoundManager : MonoBehaviour
{
    private AudioSource audioSource; // The AudioSource for playing sounds

    // Sounds to be assigned in the Inspector
    public AudioClip hoverSound;
    public AudioClip clickSound;

    // Variables for random pitch range
    public float minPitch = 0.8f; // Minimum pitch
    public float maxPitch = 1.2f; // Maximum pitch

    private void Awake()
    {
        // Create an AudioSource if none exists
        audioSource = gameObject.AddComponent<AudioSource>();
    }

    // Play hover sound with random pitch
    public void PlayHoverSound()
    {
        if (hoverSound != null && audioSource != null)
        {
            // Set a random pitch between minPitch and maxPitch
            audioSource.pitch = Random.Range(minPitch, maxPitch);
            audioSource.PlayOneShot(hoverSound);
        }
    }

    // Play click sound with random pitch
    public void PlayClickSound()
    {
        if (clickSound != null && audioSource != null)
        {
            // Set a random pitch between minPitch and maxPitch
            audioSource.pitch = Random.Range(minPitch, maxPitch);
            audioSource.PlayOneShot(clickSound);
        }
    }
}
