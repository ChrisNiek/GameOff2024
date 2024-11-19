using UnityEngine;
using System.Collections.Generic;

[CreateAssetMenu(fileName = "NewSong", menuName = "Music/SongData")]
public class SongData : ScriptableObject
{
    public string songName; // The name of the song
    public List<Track> tracks; // List of tracks in the song

    // Optionally, you can add more properties like fade-in time, fade-out time, etc.

    [System.Serializable]
    public class Track
    {
        public List<AudioClip> audioClips; // List of audio clips in this track
        public bool loop; // Should this track loop?
    }
}
