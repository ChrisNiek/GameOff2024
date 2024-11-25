using UnityEngine;

public class CameraDollyAndWobble : MonoBehaviour
{
    public Vector3 startPosition;        // The position the camera starts from (set in the inspector)
    public Vector3 endPosition;          // The target position the camera moves to (set in the inspector)
    public float dollySpeed = 2f;        // Speed of the dolly effect
    public float wobbleAmount = 0.05f;   // Amount of subtle wobble
    public float wobbleSpeed = 1f;       // Speed of the wobble effect
    public float wobbleFrequency = 0.5f; // How often the wobble oscillates
    public Vector3 startRotation;        // The rotation the camera starts with (set in the inspector)
    public Vector3 endRotation;          // The target rotation the camera rotates to (set in the inspector)
    public float rotationDelay = 0f;     // Delay before starting the rotation tween (set in the inspector)
    public float wobbleFadeInDuration = 1f;  // Duration for the wobble to fade in after dolly/rotation

    private bool isDollyCompleted = false;    // Flag to indicate if the dolly has completed
    private bool isRotationDelayed = false;  // Flag to check if rotation is delayed
    private bool isWobbleStarted = false;    // Flag to check if the wobble effect has started
    private float rotationStartTime = 0f;    // Timer to start the rotation after the delay
    private float wobbleStartTime = 0f;      // Timer to smoothly fade in the wobble effect

    private float wobbleFadeInProgress = 0f; // Tracks the fade-in progress for the wobble
    private Vector3 finalPosition;           // To store the final position after dolly and rotation

    void Start()
    {
        // Set the camera's initial position and rotation
        transform.position = startPosition;
        transform.rotation = Quaternion.Euler(startRotation);
    }

    void Update()
    {
        // Dolly and Rotation effects: move and rotate the camera from start to end position and rotation
        if (!isDollyCompleted)
        {
            // Use a smooth easing function (EaseOut) for dolly to make it faster at the start
            float t = Mathf.Clamp01(Time.time * dollySpeed);  // Calculate normalized time value

            // Smooth step easing (faster at the start and slower at the end)
            float easeOutT = 1f - Mathf.Pow(1f - t, 3);  // Cubic ease-out function

            // Lerp position and Slerp rotation together
            transform.position = Vector3.Lerp(startPosition, endPosition, easeOutT);
            transform.rotation = Quaternion.Slerp(Quaternion.Euler(startRotation), Quaternion.Euler(endRotation), easeOutT);

            // Check if the camera has reached close to the end position and rotation
            if (Vector3.Distance(transform.position, endPosition) < 0.1f && Quaternion.Angle(transform.rotation, Quaternion.Euler(endRotation)) < 1f)
            {
                isDollyCompleted = true;
                finalPosition = transform.position;  // Store the final position after dolly and rotation
            }
        }

        // Start wobble smoothly after dolly and rotation are complete
        if (isDollyCompleted && !isWobbleStarted)
        {
            // Start the wobble fade-in after the dolly and rotation are finished
            wobbleStartTime = Time.time;
            isWobbleStarted = true;
        }

        if (isWobbleStarted)
        {
            // Smoothly fade in the wobble effect
            wobbleFadeInProgress = Mathf.Min(1f, (Time.time - wobbleStartTime) / wobbleFadeInDuration);

            // Apply the wobble effect with a smooth fade-in, based on the final position
            float wobbleX = Mathf.Sin(Time.time * wobbleSpeed) * wobbleAmount * wobbleFadeInProgress;
            float wobbleY = Mathf.Cos(Time.time * wobbleFrequency) * wobbleAmount * wobbleFadeInProgress;
            Vector3 wobble = new Vector3(wobbleX, wobbleY, 0f);

            transform.position = finalPosition + wobble; // Apply wobble to the final position
        }
    }
}
