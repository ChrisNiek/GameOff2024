using UnityEngine;

public class CameraTilt : MonoBehaviour
{
    [SerializeField] private float maxTiltAngle = 10f;       // Maximum tilt angle in degrees
    [SerializeField] private float tiltSpeed = 5f;           // Speed of the tilt
    [SerializeField] private float maxPanDistance = 0.5f;    // Maximum panning distance for parallax effect
    [SerializeField] private float panSpeed = 2f;            // Speed of the panning

    private Quaternion initialRotation;      // Initial rotation of the camera
    private Vector3 initialPosition;         // Initial position of the camera

    void Start()
    {
        // Store the initial rotation and position of the camera
        initialRotation = transform.rotation;
        initialPosition = transform.position;
    }

    void Update()
    {
        // Get the mouse position in screen space
        Vector3 mousePosition = Input.mousePosition;

        // Normalize the mouse position to get values between -1 and 1
        float xTilt = (mousePosition.x / Screen.width - 0.5f) * 2f;
        float yTilt = (mousePosition.y / Screen.height - 0.5f) * 2f;

        // Clamp the tilt values by maxTiltAngle
        xTilt = Mathf.Clamp(xTilt * maxTiltAngle, -maxTiltAngle, maxTiltAngle);
        yTilt = Mathf.Clamp(yTilt * maxTiltAngle, -maxTiltAngle, maxTiltAngle);

        // Calculate the target rotation as a tilt from the initial rotation
        Quaternion targetRotation = initialRotation * Quaternion.Euler(-yTilt, xTilt, 0);

        // Smoothly interpolate to the target rotation
        transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, tiltSpeed * Time.deltaTime);

        // Calculate the target position for the parallax effect (panning in the opposite direction of the tilt)
        Vector3 targetPosition = initialPosition + new Vector3(-xTilt / maxTiltAngle * maxPanDistance, -yTilt / maxTiltAngle * maxPanDistance, 0);

        // Smoothly interpolate to the target position
        transform.position = Vector3.Lerp(transform.position, targetPosition, panSpeed * Time.deltaTime);
    }
}
