steam_music_remote : *ISteamMusicRemote;
SteamMusicRemote : SteamMusicRemote_Namespace;


#scope_file


SteamMusicRemote_Namespace :: struct {
    // procs
    RegisterSteamMusicRemote                           :: SteamMusicRemote_RegisterSteamMusicRemote;
    DeregisterSteamMusicRemote                         :: SteamMusicRemote_DeregisterSteamMusicRemote;
    BIsCurrentMusicRemote                              :: SteamMusicRemote_BIsCurrentMusicRemote;
    BActivationSuccess                                 :: SteamMusicRemote_BActivationSuccess;
    SetDisplayName                                     :: SteamMusicRemote_SetDisplayName;
    SetPNGIcon_64x64                                   :: SteamMusicRemote_SetPNGIcon_64x64;
    EnablePlayPrevious                                 :: SteamMusicRemote_EnablePlayPrevious;
    EnablePlayNext                                     :: SteamMusicRemote_EnablePlayNext;
    EnableShuffled                                     :: SteamMusicRemote_EnableShuffled;
    EnableLooped                                       :: SteamMusicRemote_EnableLooped;
    EnableQueue                                        :: SteamMusicRemote_EnableQueue;
    EnablePlaylists                                    :: SteamMusicRemote_EnablePlaylists;
    UpdatePlaybackStatus                               :: SteamMusicRemote_UpdatePlaybackStatus;
    UpdateShuffled                                     :: SteamMusicRemote_UpdateShuffled;
    UpdateLooped                                       :: SteamMusicRemote_UpdateLooped;
    UpdateVolume                                       :: SteamMusicRemote_UpdateVolume;
    CurrentEntryWillChange                             :: SteamMusicRemote_CurrentEntryWillChange;
    CurrentEntryIsAvailable                            :: SteamMusicRemote_CurrentEntryIsAvailable;
    UpdateCurrentEntryText                             :: SteamMusicRemote_UpdateCurrentEntryText;
    UpdateCurrentEntryElapsedSeconds                   :: SteamMusicRemote_UpdateCurrentEntryElapsedSeconds;
    UpdateCurrentEntryCoverArt                         :: SteamMusicRemote_UpdateCurrentEntryCoverArt;
    CurrentEntryDidChange                              :: SteamMusicRemote_CurrentEntryDidChange;
    QueueWillChange                                    :: SteamMusicRemote_QueueWillChange;
    ResetQueueEntries                                  :: SteamMusicRemote_ResetQueueEntries;
    SetQueueEntry                                      :: SteamMusicRemote_SetQueueEntry;
    SetCurrentQueueEntry                               :: SteamMusicRemote_SetCurrentQueueEntry;
    QueueDidChange                                     :: SteamMusicRemote_QueueDidChange;
    PlaylistWillChange                                 :: SteamMusicRemote_PlaylistWillChange;
    ResetPlaylistEntries                               :: SteamMusicRemote_ResetPlaylistEntries;
    SetPlaylistEntry                                   :: SteamMusicRemote_SetPlaylistEntry;
    SetCurrentPlaylistEntry                            :: SteamMusicRemote_SetCurrentPlaylistEntry;
    PlaylistDidChange                                  :: SteamMusicRemote_PlaylistDidChange;
}


SteamMusicRemote_RegisterSteamMusicRemote :: inline (pchName: *char) -> bool {
    return SteamAPI_ISteamMusicRemote_RegisterSteamMusicRemote(steam_music_remote, pchName);
}


SteamMusicRemote_DeregisterSteamMusicRemote :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_DeregisterSteamMusicRemote(steam_music_remote);
}


SteamMusicRemote_BIsCurrentMusicRemote :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_BIsCurrentMusicRemote(steam_music_remote);
}


SteamMusicRemote_BActivationSuccess :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_BActivationSuccess(steam_music_remote, bValue);
}


SteamMusicRemote_SetDisplayName :: inline (pchDisplayName: *char) -> bool {
    return SteamAPI_ISteamMusicRemote_SetDisplayName(steam_music_remote, pchDisplayName);
}


SteamMusicRemote_SetPNGIcon_64x64 :: inline (pvBuffer: *void, cbBufferLength: uint32) -> bool {
    return SteamAPI_ISteamMusicRemote_SetPNGIcon_64x64(steam_music_remote, pvBuffer, cbBufferLength);
}


SteamMusicRemote_EnablePlayPrevious :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnablePlayPrevious(steam_music_remote, bValue);
}


SteamMusicRemote_EnablePlayNext :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnablePlayNext(steam_music_remote, bValue);
}


SteamMusicRemote_EnableShuffled :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnableShuffled(steam_music_remote, bValue);
}


SteamMusicRemote_EnableLooped :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnableLooped(steam_music_remote, bValue);
}


SteamMusicRemote_EnableQueue :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnableQueue(steam_music_remote, bValue);
}


SteamMusicRemote_EnablePlaylists :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnablePlaylists(steam_music_remote, bValue);
}


SteamMusicRemote_UpdatePlaybackStatus :: inline (nStatus: AudioPlayback_Status) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdatePlaybackStatus(steam_music_remote, nStatus);
}


SteamMusicRemote_UpdateShuffled :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateShuffled(steam_music_remote, bValue);
}


SteamMusicRemote_UpdateLooped :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateLooped(steam_music_remote, bValue);
}


SteamMusicRemote_UpdateVolume :: inline (flValue: float) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateVolume(steam_music_remote, flValue);
}


SteamMusicRemote_CurrentEntryWillChange :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_CurrentEntryWillChange(steam_music_remote);
}


SteamMusicRemote_CurrentEntryIsAvailable :: inline (bAvailable: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_CurrentEntryIsAvailable(steam_music_remote, bAvailable);
}


SteamMusicRemote_UpdateCurrentEntryText :: inline (pchText: *char) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateCurrentEntryText(steam_music_remote, pchText);
}


SteamMusicRemote_UpdateCurrentEntryElapsedSeconds :: inline (nValue: s32) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds(steam_music_remote, nValue);
}


SteamMusicRemote_UpdateCurrentEntryCoverArt :: inline (pvBuffer: *void, cbBufferLength: uint32) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateCurrentEntryCoverArt(steam_music_remote, pvBuffer, cbBufferLength);
}


SteamMusicRemote_CurrentEntryDidChange :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_CurrentEntryDidChange(steam_music_remote);
}


SteamMusicRemote_QueueWillChange :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_QueueWillChange(steam_music_remote);
}


SteamMusicRemote_ResetQueueEntries :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_ResetQueueEntries(steam_music_remote);
}


SteamMusicRemote_SetQueueEntry :: inline (nID: s32, nPosition: s32, pchEntryText: *char) -> bool {
    return SteamAPI_ISteamMusicRemote_SetQueueEntry(steam_music_remote, nID, nPosition, pchEntryText);
}


SteamMusicRemote_SetCurrentQueueEntry :: inline (nID: s32) -> bool {
    return SteamAPI_ISteamMusicRemote_SetCurrentQueueEntry(steam_music_remote, nID);
}


SteamMusicRemote_QueueDidChange :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_QueueDidChange(steam_music_remote);
}


SteamMusicRemote_PlaylistWillChange :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_PlaylistWillChange(steam_music_remote);
}


SteamMusicRemote_ResetPlaylistEntries :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_ResetPlaylistEntries(steam_music_remote);
}


SteamMusicRemote_SetPlaylistEntry :: inline (nID: s32, nPosition: s32, pchEntryText: *char) -> bool {
    return SteamAPI_ISteamMusicRemote_SetPlaylistEntry(steam_music_remote, nID, nPosition, pchEntryText);
}


SteamMusicRemote_SetCurrentPlaylistEntry :: inline (nID: s32) -> bool {
    return SteamAPI_ISteamMusicRemote_SetCurrentPlaylistEntry(steam_music_remote, nID);
}


SteamMusicRemote_PlaylistDidChange :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_PlaylistDidChange(steam_music_remote);
}
