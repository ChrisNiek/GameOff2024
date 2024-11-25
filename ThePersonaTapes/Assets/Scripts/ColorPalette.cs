using UnityEngine;

[CreateAssetMenu(fileName = "NewColorPalette", menuName = "Color Palette")]
public class ColorPalette : ScriptableObject
{
    public string paletteName;
    // List of 4 colors that can be assigned to objects
    public Color[] colors = new Color[4];
}
