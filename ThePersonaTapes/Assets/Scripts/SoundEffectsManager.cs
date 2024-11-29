using UnityEngine;
using System.Collections;
using System.Collections.Generic;

public class SoundEffectsManager : MonoBehaviour
{
    public AudioSource sfxAudioSource; // AudioSource to play sound effects

    private Dictionary<string, AudioClip> sfxDictionary = new Dictionary<string, AudioClip>(); // Generic Dictionary for better performance
    private static SoundEffectsManager instance;

    // Path to the folder containing sound effects in Resources (adjust for any spaces)
    private string soundEffectsFolder = "Audio/Sound Effects";  // Correct path for "Sound Effects" folder

    void Awake()
    {
        // Ensure only one instance of SoundEffectsManager exists
        if (instance == null)
        {
            instance = this;
            DontDestroyOnLoad(gameObject);  // Keeps the manager alive across scenes
            InitializeSoundEffects();       // Initialize sound effects on first load
        }
        else
        {
            Destroy(gameObject);  // Destroy duplicate instance
            return;
        }
    }

    void InitializeSoundEffects()
    {
        // Only initialize if the dictionary is empty (first time)
        if (sfxDictionary.Count == 0)
        {
            // Load all AudioClips from the specified Resources folder
            AudioClip[] loadedSFX = Resources.LoadAll<AudioClip>(soundEffectsFolder);

            // Initialize dictionary with loaded sound effects
            foreach (AudioClip sfx in loadedSFX)
            {
                if (sfx != null)
                {
                    // Use the sound effect's name as a case-insensitive key in the dictionary
                    sfxDictionary[sfx.name.ToLower()] = sfx;
                    Debug.Log($"Loaded SFX: {sfx.name}");
                }
                else
                {
                    Debug.LogWarning("An unassigned sound effect was found in the array!");
                }
            }
            Debug.Log($"Total SFX loaded: {sfxDictionary.Count}");

            // Debug: List all loaded sound effects
            ListLoadedSFX();
        }
    }

    // Method to list all the loaded sound effects in the dictionary
    void ListLoadedSFX()
    {
        Debug.Log("List of Loaded SFX:");

        // Check if there are any loaded SFX
        if (sfxDictionary.Count > 0)
        {
            foreach (var sfx in sfxDictionary)
            {
                Debug.Log($"- {sfx.Key}");
            }
        }
        else
        {
            Debug.Log("No sound effects are loaded.");
        }
    }

    // Method to play a sound effect by name
    public void PlaySFX(string sfxName)
    {
        if (string.IsNullOrEmpty(sfxName))
        {
            Debug.LogError("Sound effect name is empty or null.");
            return;
        }

        sfxName = sfxName.ToLower(); // Convert to lowercase for case-insensitive comparison

        if (sfxDictionary.ContainsKey(sfxName))
        {
            sfxAudioSource.PlayOneShot(sfxDictionary[sfxName]);
            Debug.Log($"Playing SFX: {sfxName}");
        }
        else
        {
            Debug.LogError($"Sound effect '{sfxName}' not found!");
        }
    }

    // Optional: Load an SFX dynamically from the Resources folder (if not assigned in the Inspector)
    public void PlaySFXFromResources(string sfxName)
    {
        if (string.IsNullOrEmpty(sfxName))
        {
            Debug.LogError("Sound effect name is empty or null.");
            return;
        }

        AudioClip clip = Resources.Load<AudioClip>("Audio/" + sfxName);
        if (clip != null)
        {
            sfxAudioSource.PlayOneShot(clip);
            Debug.Log($"Playing SFX from Resources: {sfxName}");
        }
        else
        {
            Debug.LogError($"Sound effect '{sfxName}' not found in Resources/Audio folder!");
        }
    }
}
