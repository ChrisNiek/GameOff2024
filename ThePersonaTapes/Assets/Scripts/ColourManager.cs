using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEngine.Rendering.PostProcessing; // Include PostProcessing namespace

public class ColorManager : MonoBehaviour
{
    // Array of ColorPalette ScriptableObjects
    public ColorPalette[] colorPalettes;
    private int currentPaletteIndex = 0; // Index of the current color palette

    // References to UI elements and objects to update
    public Camera[] cameras; // Array to hold multiple cameras
    public TextMeshProUGUI[] textObjects;
    public RawImage[] rawImages;
    public Image[] buttonImages;
    public Button[] buttons;
    public SpriteRenderer[] sprites;
    public Image[] panelImages; // Add this for Panel UI Image components
    public Image cursorImage; // Add this for the mouse cursor image

    // Indices for each object type to determine which color to use
    public int textColorIndex = 0;
    public int rawImageColorIndex = 1;
    public int buttonNormalColorIndex = 2;
    public int spriteColorIndex = 3;
    public int cursorColorIndex = 3; // Add an index for cursor color

    // References for PostProcessing effects
    public PostProcessVolume postProcessVolume; // Reference to the PostProcessVolume component
    private Vignette vignetteEffect;
    private Bloom bloomEffect;

    private void Start()
    {
        // Apply the initial color palette at the start of the game
        ApplyColorPalette(currentPaletteIndex);
    }

    public void SwitchPaletteByName(string paletteName)
    {
        // Look for the palette by name
        for (int i = 0; i < colorPalettes.Length; i++)
        {
            if (colorPalettes[i].name == paletteName)
            {
                ChangePalette(i); // Switch to the palette at the found index
                return;
            }
        }

        Debug.LogError("Color palette not found: " + paletteName); // Log an error if the palette wasn't found
    }

    public void ChangePalette(int paletteIndex)
    {
        // Ensure the palette index is within bounds
        if (paletteIndex >= 0 && paletteIndex < colorPalettes.Length)
        {
            currentPaletteIndex = paletteIndex;
            ApplyColorPalette(currentPaletteIndex);
        }
    }

    private void ApplyColorPalette(int paletteIndex)
    {
        // Get the selected palette
        ColorPalette palette = colorPalettes[paletteIndex];

        // Update background color for each camera
        foreach (var camera in cameras)
        {
            if (camera != null)
            {
                camera.backgroundColor = palette.colors[0];  // Use the first color for background
            }
        }

        // Update TextMeshPro text color using the selected index
        foreach (var text in textObjects)
        {
            text.color = palette.colors[textColorIndex];  // Use text color index
        }

        // Update RawImage colors using the selected index
        foreach (var rawImage in rawImages)
        {
            rawImage.color = palette.colors[rawImageColorIndex];  // Use raw image color index
        }

        // Update Button colors (normal, highlighted, pressed) using selected indices
        foreach (var button in buttons)
        {
            var colors = button.colors;
            colors.normalColor = palette.colors[buttonNormalColorIndex];  // Use button normal color index
            colors.highlightedColor = palette.colors[1];  // You can choose a different index for highlighted
            colors.pressedColor = palette.colors[2];  // You can choose a different index for pressed
            button.colors = colors;
        }

        // Update Image components (for sprites) using the selected index
        foreach (var image in buttonImages)
        {
            image.color = palette.colors[buttonNormalColorIndex];  // Use the same button color
        }

        // Update SpriteRenderer components using the selected index
        foreach (var sprite in sprites)
        {
            sprite.color = palette.colors[spriteColorIndex];  // Use sprite color index
        }

        // Update Panel Image components using the selected color
        foreach (var panelImage in panelImages)
        {
            panelImage.color = palette.colors[rawImageColorIndex];  // Apply the same color for Panel Image
        }

        // Update Cursor Image color
        if (cursorImage != null)
        {
            cursorImage.color = palette.colors[cursorColorIndex];  // Apply cursor color from the palette
        }

        // Update PostProcessing effects (Vignette and Bloom)
        if (postProcessVolume != null)
        {
            // Check if the Vignette effect is enabled and update its color
            if (postProcessVolume.profile.TryGetSettings(out vignetteEffect))
            {
                vignetteEffect.color.value = palette.colors[1]; // Use the first color for vignette
            }

            // Check if the Bloom effect is enabled and update its color
            if (postProcessVolume.profile.TryGetSettings(out bloomEffect))
            {
                bloomEffect.color.value = palette.colors[3]; // Use the second color for bloom
            }
        }
    }

    // Apply color to newly instantiated TextMeshProUGUI
    public void ApplyColorToText(TextMeshProUGUI newText)
    {
        ColorPalette palette = colorPalettes[currentPaletteIndex];
        newText.color = palette.colors[textColorIndex];
    }

    // Apply color to newly instantiated Button
    public void ApplyColorToButton(Button newButton)
    {
        ColorPalette palette = colorPalettes[currentPaletteIndex];
        var colors = newButton.colors;
        colors.normalColor = palette.colors[buttonNormalColorIndex];
        colors.highlightedColor = palette.colors[1];  // Choose an appropriate index
        colors.pressedColor = palette.colors[2];  // Choose an appropriate index
        newButton.colors = colors;
    }

    // Apply color to newly instantiated RawImage
    public void ApplyColorToRawImage(RawImage newRawImage)
    {
        ColorPalette palette = colorPalettes[currentPaletteIndex];
        newRawImage.color = palette.colors[rawImageColorIndex];
    }

    // Apply color to newly instantiated SpriteRenderer
    public void ApplyColorToSprite(SpriteRenderer newSprite)
    {
        ColorPalette palette = colorPalettes[currentPaletteIndex];
        newSprite.color = palette.colors[spriteColorIndex];
    }

    // Apply color to newly instantiated Panel Image
    public void ApplyColorToPanelImage(Image newPanelImage)
    {
        ColorPalette palette = colorPalettes[currentPaletteIndex];
        newPanelImage.color = palette.colors[rawImageColorIndex];
    }
}
