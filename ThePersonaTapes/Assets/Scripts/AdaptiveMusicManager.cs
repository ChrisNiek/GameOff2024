using UnityEngine;
using System.Collections;

public class AdaptiveMusicManager : MonoBehaviour
{
    // AudioSource to play the current music
    public AudioSource audioSource;

    // List of audio clips to crossfade between
    public AudioClip[] musicClips;

    // Currently playing audio clip
    private AudioClip currentClip;

    // Duration of the fade (in seconds)
    public float fadeDuration = 2f;

    void Start()
    {
        // Ensure audioSource is assigned
        if (audioSource == null)
        {
            Debug.LogError("AudioSource is not assigned in AdaptiveMusicManager!");
        }
    }

    // Method to trigger a new song with fade out and fade in
    public void TriggerMusic(string songName)
    {
        // Check if songName is empty or null
        if (string.IsNullOrEmpty(songName))
        {
            Debug.LogError("Song name is empty or null.");
            return;
        }

        // Find the audio clip by name
        AudioClip newClip = System.Array.Find(musicClips, clip => clip.name == songName);
        if (newClip == null)
        {
            Debug.LogError($"AudioClip with name {songName} not found in musicClips.");
            return;
        }

        // If the new song is the same as the current one, do nothing
        if (newClip == currentClip && audioSource.isPlaying)
        {
            Debug.Log("Requested song is already playing.");
            return;
        }

        // Update the current clip to the new clip and start the fade-out and fade-in process
        currentClip = newClip;
        StartCoroutine(FadeOutIn(audioSource, newClip));
    }

    // Coroutine to fade out the old track and fade in the new track
    private IEnumerator FadeOutIn(AudioSource source, AudioClip newClip)
    {
        // Fade out the current song
        float startVolume = source.volume;
        float timeElapsed = 0f;

        while (timeElapsed < fadeDuration)
        {
            source.volume = Mathf.Lerp(startVolume, 0f, timeElapsed / fadeDuration);
            timeElapsed += Time.deltaTime;
            yield return null;
        }

        // Ensure final volume level is zero and stop the current song
        source.volume = 0f;
        source.Stop();

        // Change to the new clip and start playing
        source.clip = newClip;
        source.Play();

        // Fade in the new song
        timeElapsed = 0f;
        while (timeElapsed < fadeDuration)
        {
            source.volume = Mathf.Lerp(0f, startVolume, timeElapsed / fadeDuration);
            timeElapsed += Time.deltaTime;
            yield return null;
        }

        // Ensure final volume level is full
        source.volume = startVolume;
    }
}
