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


SteamMusic_BIsEnabled :: inline () -> bool #foreign steam "SteamAPI_ISteamMu {
    return SteamMusic_BIsEnabled(steam_music);
}


SteamMusic_BIsPlaying :: inline () -> bool #foreign steam "SteamAPI_ISteamMu {
    return SteamMusic_BIsPlaying(steam_music);
}


SteamMusic_GetPlaybackStatus :: inline () -> AudioPlayback_Status #foreign steam "SteamAPI_ISteamMusic_Get {
    return SteamMusic_GetPlaybackStatus(steam_music);
}


SteamMusic_Play :: inline () {
    SteamMusic_Play(steam_music);
}


SteamMusic_Pause :: inline () {
    SteamMusic_Pause(steam_music);
}


SteamMusic_PlayPrevious :: inline () {
    SteamMusic_PlayPrevious(steam_music);
}


SteamMusic_PlayNext :: inline () {
    SteamMusic_PlayNext(steam_music);
}


SteamMusic_SetVolume :: inline (flVolume: float) {
    SteamMusic_SetVolume(steam_music, flVolume);
}


SteamMusic_GetVolume :: inline () -> float #foreign steam "SteamAPI_ISteamM {
    return SteamMusic_GetVolume(steam_music);
}
