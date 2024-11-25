using UnityEngine;

public class LightFlicker : MonoBehaviour
{
    public Light pointLight;  // Reference to the PointLight
    public float flickerSpeed = 1.0f;  // Speed of the flicker effect
    public float flickerAmount = 2.0f;  // Amount of light fluctuation

    private float originalIntensity;

    void Start()
    {
        if (pointLight == null)
        {
            pointLight = GetComponent<Light>();
        }

        // Store the original intensity of the light
        originalIntensity = pointLight.intensity;
    }

    void Update()
    {
        // Create a flicker effect by varying the intensity slightly
        float flicker = Mathf.PerlinNoise(Time.time * flickerSpeed, 0f) * flickerAmount;
        pointLight.intensity = originalIntensity + flicker;
    }
}
