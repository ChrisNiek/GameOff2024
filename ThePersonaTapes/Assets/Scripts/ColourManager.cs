using UnityEngine;
using UnityEngine.UI;
using TMPro;
using System.Collections;
using UnityEngine.Rendering.PostProcessing; // Include PostProcessing namespace

public class ColorManager : MonoBehaviour
{
    // Array of ColorPalette ScriptableObjects
    public ColorPalette[] colorPalettes;
    private int currentPaletteIndex = 0; // Index of the current color palette

    // References to UI elements and objects to update
    public Camera[] cameras;
    public TextMeshProUGUI[] textObjects;
    public RawImage[] rawImages;
    public Image[] buttonImages;
    public Button[] buttons;
    public Slider[] sliders; // Added reference for sliders
    public SpriteRenderer[] sprites;
    public Image[] panelImages;
    public Image cursorImage;

    // Indices for each object type to determine which color to use
    public int textColorIndex = 0;
    public int rawImageColorIndex = 1;
    public int buttonNormalColorIndex = 2;
    public int buttonPressedColorIndex = 1;  // New index for highlighted color
    public int buttonSelectedColorIndex = 2;  // New index for highlighted color
    public int buttonHighlightColorIndex = 3;  // New index for highlighted color
    public int sliderBackgroundColorIndex = 4; // New index for slider background color
    public int spriteColorIndex = 3;
    public int cursorColorIndex = 3;

    // Transition duration
    public float transitionDuration = 1.0f;

    // References for PostProcessing effects
    public PostProcessVolume postProcessVolume;
    private Vignette vignetteEffect;
    private Bloom bloomEffect;

    private void Start()
    {
        // Apply the initial color palette at the start of the game
        ApplyColorPalette(currentPaletteIndex);
    }

    // Add these methods inside the ColorManager class:
    public void ApplyColorToButton(Button button)
    {
        if (button != null)
        {
            var colors = button.colors;
            colors.normalColor = colorPalettes[currentPaletteIndex].colors[buttonNormalColorIndex];
            colors.highlightedColor = colorPalettes[currentPaletteIndex].colors[buttonHighlightColorIndex];
            colors.pressedColor = colorPalettes[currentPaletteIndex].colors[buttonPressedColorIndex];
            colors.selectedColor = colorPalettes[currentPaletteIndex].colors[buttonSelectedColorIndex];
            button.colors = colors;
        }
    }

    public void ApplyColorToText(TextMeshProUGUI text)
    {
        if (text != null)
        {
            text.color = colorPalettes[currentPaletteIndex].colors[textColorIndex];
        }
    }

    public void ApplyColorToSlider(Slider slider)
    {
        if (slider != null)
        {
            // Apply background color to the slider
            ColorBlock colors = slider.colors;
            colors.normalColor = colorPalettes[currentPaletteIndex].colors[sliderBackgroundColorIndex];
            slider.colors = colors;
        }
    }

    public void SwitchPaletteByName(string paletteName)
    {
        for (int i = 0; i < colorPalettes.Length; i++)
        {
            if (colorPalettes[i].name == paletteName)
            {
                ChangePalette(i);
                return;
            }
        }
        Debug.LogError("Color palette not found: " + paletteName);
    }

    public void ChangePalette(int paletteIndex)
    {
        if (paletteIndex >= 0 && paletteIndex < colorPalettes.Length)
        {
            currentPaletteIndex = paletteIndex;
            ApplyColorPalette(currentPaletteIndex);
        }
    }

    private void ApplyColorPalette(int paletteIndex)
    {
        ColorPalette palette = colorPalettes[paletteIndex];

        foreach (var camera in cameras)
        {
            if (camera != null)
            {
                StartCoroutine(LerpCameraColor(camera, palette.colors[0]));
            }
        }

        foreach (var text in textObjects)
        {
            StartCoroutine(LerpTextColor(text, palette.colors[textColorIndex]));
        }

        foreach (var rawImage in rawImages)
        {
            StartCoroutine(LerpImageColor(rawImage, palette.colors[rawImageColorIndex]));
        }

        foreach (var button in buttons)
        {
            StartCoroutine(LerpButtonColor(button, palette));
        }

        foreach (var image in buttonImages)
        {
            StartCoroutine(LerpImageColor(image, palette.colors[buttonNormalColorIndex]));
        }

        foreach (var slider in sliders) // Apply color change to sliders
        {
            ApplyColorToSlider(slider);
        }

        foreach (var sprite in sprites)
        {
            StartCoroutine(LerpSpriteColor(sprite, palette.colors[spriteColorIndex]));
        }

        foreach (var panelImage in panelImages)
        {
            StartCoroutine(LerpImageColor(panelImage, palette.colors[rawImageColorIndex]));
        }

        if (cursorImage != null)
        {
            StartCoroutine(LerpImageColor(cursorImage, palette.colors[cursorColorIndex]));
        }

        UpdatePostProcessingEffects(palette);
    }

    private void UpdatePostProcessingEffects(ColorPalette palette)
    {
        if (postProcessVolume != null)
        {
            if (postProcessVolume.profile.TryGetSettings(out vignetteEffect))
            {
                vignetteEffect.color.value = palette.colors[1];
            }
            if (postProcessVolume.profile.TryGetSettings(out bloomEffect))
            {
                bloomEffect.color.value = palette.colors[3];
            }
        }
    }

    // Coroutine to smoothly transition button colors
    private IEnumerator LerpButtonColor(Button button, ColorPalette palette)
    {
        var colors = button.colors;
        Color startNormalColor = colors.normalColor;
        Color startHighlightColor = colors.highlightedColor;

        float elapsedTime = 0f;

        while (elapsedTime < transitionDuration)
        {
            colors.normalColor = Color.Lerp(startNormalColor, palette.colors[buttonNormalColorIndex], elapsedTime / transitionDuration);
            colors.highlightedColor = Color.Lerp(startHighlightColor, palette.colors[buttonHighlightColorIndex], elapsedTime / transitionDuration);
            button.colors = colors;

            elapsedTime += Time.deltaTime;
            yield return null;
        }

        colors.normalColor = palette.colors[buttonNormalColorIndex];
        colors.highlightedColor = palette.colors[buttonHighlightColorIndex];
        colors.pressedColor = palette.colors[buttonPressedColorIndex];
        colors.selectedColor = palette.colors[buttonSelectedColorIndex];
        button.colors = colors;
    }

    // Smooth transitions for other elements
    private IEnumerator LerpCameraColor(Camera camera, Color targetColor)
    {
        Color startColor = camera.backgroundColor;
        float elapsedTime = 0f;
        while (elapsedTime < transitionDuration)
        {
            camera.backgroundColor = Color.Lerp(startColor, targetColor, elapsedTime / transitionDuration);
            elapsedTime += Time.deltaTime;
            yield return null;
        }
        camera.backgroundColor = targetColor;
    }

    private IEnumerator LerpTextColor(TextMeshProUGUI text, Color targetColor)
    {
        Color startColor = text.color;
        float elapsedTime = 0f;
        while (elapsedTime < transitionDuration)
        {
            text.color = Color.Lerp(startColor, targetColor, elapsedTime / transitionDuration);
            elapsedTime += Time.deltaTime;
            yield return null;
        }
        text.color = targetColor;
    }

    private IEnumerator LerpImageColor(Graphic image, Color targetColor)
    {
        Color startColor = image.color;
        float elapsedTime = 0f;
        while (elapsedTime < transitionDuration)
        {
            image.color = Color.Lerp(startColor, targetColor, elapsedTime / transitionDuration);
            elapsedTime += Time.deltaTime;
            yield return null;
        }
        image.color = targetColor;
    }

    private IEnumerator LerpSpriteColor(SpriteRenderer sprite, Color targetColor)
    {
        Color startColor = sprite.color;
        float elapsedTime = 0f;
        while (elapsedTime < transitionDuration)
        {
            sprite.color = Color.Lerp(startColor, targetColor, elapsedTime / transitionDuration);
            elapsedTime += Time.deltaTime;
            yield return null;
        }
        sprite.color = targetColor;
    }

    public void ResetPalette()
    {
        // Reset to the first palette or a default palette index
        ChangePalette(0); // Assuming the first palette is the default
    }

}
