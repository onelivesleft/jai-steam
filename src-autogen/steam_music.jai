steam_music : *ISteamMusic;
SteamMusic : SteamMusic_Namespace;


#scope_file


SteamMusic_Namespace :: struct {
    // procs
    BIsEnabled                                         :: SteamMusic_BIsEnabled;
    BIsPlaying                                         :: SteamMusic_BIsPlaying;
    GetPlaybackStatus                                  :: SteamMusic_GetPlaybackStatus;
    Play                                               :: SteamMusic_Play;
    Pause                                              :: SteamMusic_Pause;
    PlayPrevious                                       :: SteamMusic_PlayPrevious;
    PlayNext                                           :: SteamMusic_PlayNext;
    SetVolume                                          :: SteamMusic_SetVolume;
    GetVolume                                          :: SteamMusic_GetVolume;
}


SteamMusic_BIsEnabled :: inline () -> bool {
    return SteamAPI_ISteamMusic_BIsEnabled(steam_music);
}


SteamMusic_BIsPlaying :: inline () -> bool {
    return SteamAPI_ISteamMusic_BIsPlaying(steam_music);
}


SteamMusic_GetPlaybackStatus :: inline () -> AudioPlayback_Status {
    return SteamAPI_ISteamMusic_GetPlaybackStatus(steam_music);
}


SteamMusic_Play :: inline () {
    SteamAPI_ISteamMusic_Play(steam_music);
}


SteamMusic_Pause :: inline () {
    SteamAPI_ISteamMusic_Pause(steam_music);
}


SteamMusic_PlayPrevious :: inline () {
    SteamAPI_ISteamMusic_PlayPrevious(steam_music);
}


SteamMusic_PlayNext :: inline () {
    SteamAPI_ISteamMusic_PlayNext(steam_music);
}


SteamMusic_SetVolume :: inline (flVolume: float) {
    SteamAPI_ISteamMusic_SetVolume(steam_music, flVolume);
}


SteamMusic_GetVolume :: inline () -> float {
    return SteamAPI_ISteamMusic_GetVolume(steam_music);
}
