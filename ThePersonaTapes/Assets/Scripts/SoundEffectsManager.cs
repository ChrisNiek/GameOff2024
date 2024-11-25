using UnityEngine;
using System.Collections.Generic;

public class SoundEffectsManager : MonoBehaviour
{
    public AudioSource sfxAudioSource;  // AudioSource to play sound effects
    public List<AudioClip> soundEffects;  // List of sound effect clips

    private Dictionary<string, AudioClip> sfxDictionary = new Dictionary<string, AudioClip>();

    void Start()
    {
        // Initialize dictionary with sound effects for quick lookup
        foreach (var sfx in soundEffects)
        {
            sfxDictionary[sfx.name] = sfx;
        }

        if (sfxAudioSource == null)
        {
            Debug.LogError("AudioSource is not assigned in SoundEffectsManager!");
        }
    }

    // Method to play a sound effect by name
    public void PlaySFX(string sfxName)
    {
        if (sfxDictionary.ContainsKey(sfxName))
        {
            sfxAudioSource.PlayOneShot(sfxDictionary[sfxName]);
        }
        else
        {
            Debug.LogError($"Sound effect '{sfxName}' not found in SoundEffectsManager!");
        }
    }
}
