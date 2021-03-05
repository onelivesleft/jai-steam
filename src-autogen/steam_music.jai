steam_music : *ISteamMusic;


BIsEnabled :: inline () -> bool {
    return SteamAPI_ISteamMusic_BIsEnabled(steam_music);
}


BIsPlaying :: inline () -> bool {
    return SteamAPI_ISteamMusic_BIsPlaying(steam_music);
}


GetPlaybackStatus :: inline () -> AudioPlayback_Status {
    return SteamAPI_ISteamMusic_GetPlaybackStatus(steam_music);
}


Play :: inline () {
    SteamAPI_ISteamMusic_Play(steam_music);
}


Pause :: inline () {
    SteamAPI_ISteamMusic_Pause(steam_music);
}


PlayPrevious :: inline () {
    SteamAPI_ISteamMusic_PlayPrevious(steam_music);
}


PlayNext :: inline () {
    SteamAPI_ISteamMusic_PlayNext(steam_music);
}


SetVolume :: inline (flVolume: float) {
    SteamAPI_ISteamMusic_SetVolume(steam_music, flVolume);
}


GetVolume :: inline () -> float {
    return SteamAPI_ISteamMusic_GetVolume(steam_music);
}
