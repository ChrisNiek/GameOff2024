using UnityEngine;
using UnityEditor;

[CreateAssetMenu(fileName = "NewSceneData", menuName = "SceneData")]
public class SceneDataSO : ScriptableObject
{
    public string sceneName;
    public Texture foreground;
    public Texture frontMidground;
    public Texture rearMidground;
    public Texture background;

    // Automatically set the scene name to the asset's file name when created or modified in the editor
    private void OnValidate()
    {
        // Ensure this is done only in the editor (not at runtime)
        if (string.IsNullOrEmpty(sceneName))
        {
            sceneName = AssetDatabase.GetAssetPath(this);
            sceneName = System.IO.Path.GetFileNameWithoutExtension(sceneName);
        }
    }
}
