using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Audio;

public class VolumeControl : MonoBehaviour
{
    public Slider volumeSlider;  // The UI Slider
    public AudioMixer audioMixer;  // Reference to the Audio Mixer

    // Start is called before the first frame update
    void Start()
    {
        // Initialize slider with current volume
        volumeSlider.value = PlayerPrefs.GetFloat("Volume", 0.75f); // Optionally, load saved volume
        volumeSlider.onValueChanged.AddListener(SetVolume);
    }

    // This function will be called when the slider value changes
    public void SetVolume(float value)
    {
        audioMixer.SetFloat("MasterVolume", Mathf.Log10(value) * 20); // Converts slider value to decibels
        PlayerPrefs.SetFloat("Volume", value); // Optionally save the volume setting
    }
}
