using UnityEngine;
using System.Collections;

public class PreloadSoundEffects : MonoBehaviour
{
    public AudioSource sfxAudioSource;
    private Hashtable sfxDictionary = new Hashtable();

    void Start()
    {
        // Load all audio clips in the Resources/Audio folder
        AudioClip[] soundEffects = Resources.LoadAll<AudioClip>("Audio");

        foreach (AudioClip sfx in soundEffects)
        {
            if (sfx != null)
            {
                sfxDictionary[sfx.name.ToLower()] = sfx;
                Debug.Log($"Preloaded SFX: {sfx.name}");
            }
        }

        Debug.Log($"Total SFX preloaded: {sfxDictionary.Count}");
    }

    public void PlaySFX(string sfxName)
    {
        if (string.IsNullOrEmpty(sfxName))
        {
            Debug.LogError("Sound effect name is empty or null.");
            return;
        }

        sfxName = sfxName.ToLower();

        if (sfxDictionary.ContainsKey(sfxName))
        {
            sfxAudioSource.PlayOneShot((AudioClip)sfxDictionary[sfxName]);
        }
        else
        {
            Debug.LogError($"Sound effect '{sfxName}' not found!");
        }
    }
}
