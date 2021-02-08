steam_music_remote : *ISteamMusicRemote;

SteamMusicRemote : SteamMusicRemote_Namespace;


#scope_file


SteamMusicRemote_Namespace :: struct {
    // procs
           :: SteamMusicRemote_RegisterSteamMusicRemote
         :: SteamMusicRemote_DeregisterSteamMusicRemote
              :: SteamMusicRemote_BIsCurrentMusicRemote
                 :: SteamMusicRemote_BActivationSuccess
                     :: SteamMusicRemote_SetDisplayName
                   :: SteamMusicRemote_SetPNGIcon_64x64
                 :: SteamMusicRemote_EnablePlayPrevious
                     :: SteamMusicRemote_EnablePlayNext
                     :: SteamMusicRemote_EnableShuffled
                       :: SteamMusicRemote_EnableLooped
                        :: SteamMusicRemote_EnableQueue
                    :: SteamMusicRemote_EnablePlaylists
               :: SteamMusicRemote_UpdatePlaybackStatus
                     :: SteamMusicRemote_UpdateShuffled
                       :: SteamMusicRemote_UpdateLooped
                       :: SteamMusicRemote_UpdateVolume
             :: SteamMusicRemote_CurrentEntryWillChange
            :: SteamMusicRemote_CurrentEntryIsAvailable
             :: SteamMusicRemote_UpdateCurrentEntryText
    :: SteamMusicRemote_UpdateCurrentEntryElapsedSeconds
         :: SteamMusicRemote_UpdateCurrentEntryCoverArt
              :: SteamMusicRemote_CurrentEntryDidChange
                    :: SteamMusicRemote_QueueWillChange
                  :: SteamMusicRemote_ResetQueueEntries
                      :: SteamMusicRemote_SetQueueEntry
               :: SteamMusicRemote_SetCurrentQueueEntry
                     :: SteamMusicRemote_QueueDidChange
                 :: SteamMusicRemote_PlaylistWillChange
               :: SteamMusicRemote_ResetPlaylistEntries
                   :: SteamMusicRemote_SetPlaylistEntry
            :: SteamMusicRemote_SetCurrentPlaylistEntry
                  :: SteamMusicRemote_PlaylistDidChange
}


SteamMusicRemote_RegisterSteamMusicRemote :: inline (pchName: *char) -> bool {
    return SteamAPI_ISteamMusicRemote_RegisterSteamMusicRemote(steam_music_remote, pchName: *char);
}


SteamMusicRemote_DeregisterSteamMusicRemote :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_DeregisterSteamMusicRemote(steam_music_remote);
}


SteamMusicRemote_BIsCurrentMusicRemote :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_BIsCurrentMusicRemote(steam_music_remote);
}


SteamMusicRemote_BActivationSuccess :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_BActivationSuccess(steam_music_remote, bValue: bool);
}


SteamMusicRemote_SetDisplayName :: inline (pchDisplayName: *char) -> bool {
    return SteamAPI_ISteamMusicRemote_SetDisplayName(steam_music_remote, pchDisplayName: *char);
}


SteamMusicRemote_SetPNGIcon_64x64 :: inline (pvBuffer: *void, cbBufferLength: uint32) -> bool {
    return SteamAPI_ISteamMusicRemote_SetPNGIcon_64x64(steam_music_remote, pvBuffer: *void, cbBufferLength: uint32);
}


SteamMusicRemote_EnablePlayPrevious :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnablePlayPrevious(steam_music_remote, bValue: bool);
}


SteamMusicRemote_EnablePlayNext :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnablePlayNext(steam_music_remote, bValue: bool);
}


SteamMusicRemote_EnableShuffled :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnableShuffled(steam_music_remote, bValue: bool);
}


SteamMusicRemote_EnableLooped :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnableLooped(steam_music_remote, bValue: bool);
}


SteamMusicRemote_EnableQueue :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnableQueue(steam_music_remote, bValue: bool);
}


SteamMusicRemote_EnablePlaylists :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnablePlaylists(steam_music_remote, bValue: bool);
}


SteamMusicRemote_UpdatePlaybackStatus :: inline (nStatus: AudioPlayback_Status) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdatePlaybackStatus(steam_music_remote, nStatus: AudioPlayback_Status);
}


SteamMusicRemote_UpdateShuffled :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateShuffled(steam_music_remote, bValue: bool);
}


SteamMusicRemote_UpdateLooped :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateLooped(steam_music_remote, bValue: bool);
}


SteamMusicRemote_UpdateVolume :: inline (flValue: float) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateVolume(steam_music_remote, flValue: float);
}


SteamMusicRemote_CurrentEntryWillChange :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_CurrentEntryWillChange(steam_music_remote);
}


SteamMusicRemote_CurrentEntryIsAvailable :: inline (bAvailable: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_CurrentEntryIsAvailable(steam_music_remote, bAvailable: bool);
}


SteamMusicRemote_UpdateCurrentEntryText :: inline (pchText: *char) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateCurrentEntryText(steam_music_remote, pchText: *char);
}


SteamMusicRemote_UpdateCurrentEntryElapsedSeconds :: inline (nValue: s32) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds(steam_music_remote, nValue: s32);
}


SteamMusicRemote_UpdateCurrentEntryCoverArt :: inline (pvBuffer: *void, cbBufferLength: uint32) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateCurrentEntryCoverArt(steam_music_remote, pvBuffer: *void, cbBufferLength: uint32);
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
    return SteamAPI_ISteamMusicRemote_SetQueueEntry(steam_music_remote, nID: s32, nPosition: s32, pchEntryText: *char);
}


SteamMusicRemote_SetCurrentQueueEntry :: inline (nID: s32) -> bool {
    return SteamAPI_ISteamMusicRemote_SetCurrentQueueEntry(steam_music_remote, nID: s32);
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
    return SteamAPI_ISteamMusicRemote_SetPlaylistEntry(steam_music_remote, nID: s32, nPosition: s32, pchEntryText: *char);
}


SteamMusicRemote_SetCurrentPlaylistEntry :: inline (nID: s32) -> bool {
    return SteamAPI_ISteamMusicRemote_SetCurrentPlaylistEntry(steam_music_remote, nID: s32);
}


SteamMusicRemote_PlaylistDidChange :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_PlaylistDidChange(steam_music_remote);
}
