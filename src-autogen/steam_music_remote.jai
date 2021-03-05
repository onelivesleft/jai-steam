steam_music_remote : *ISteamMusicRemote;


RegisterSteamMusicRemote :: inline (pchName: *char) -> bool {
    return SteamAPI_ISteamMusicRemote_RegisterSteamMusicRemote(steam_music_remote, pchName);
}


DeregisterSteamMusicRemote :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_DeregisterSteamMusicRemote(steam_music_remote);
}


BIsCurrentMusicRemote :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_BIsCurrentMusicRemote(steam_music_remote);
}


BActivationSuccess :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_BActivationSuccess(steam_music_remote, bValue);
}


SetDisplayName :: inline (pchDisplayName: *char) -> bool {
    return SteamAPI_ISteamMusicRemote_SetDisplayName(steam_music_remote, pchDisplayName);
}


SetPNGIcon_64x64 :: inline (pvBuffer: *void, cbBufferLength: uint32) -> bool {
    return SteamAPI_ISteamMusicRemote_SetPNGIcon_64x64(steam_music_remote, pvBuffer, cbBufferLength);
}


EnablePlayPrevious :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnablePlayPrevious(steam_music_remote, bValue);
}


EnablePlayNext :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnablePlayNext(steam_music_remote, bValue);
}


EnableShuffled :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnableShuffled(steam_music_remote, bValue);
}


EnableLooped :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnableLooped(steam_music_remote, bValue);
}


EnableQueue :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnableQueue(steam_music_remote, bValue);
}


EnablePlaylists :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_EnablePlaylists(steam_music_remote, bValue);
}


UpdatePlaybackStatus :: inline (nStatus: AudioPlayback_Status) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdatePlaybackStatus(steam_music_remote, nStatus);
}


UpdateShuffled :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateShuffled(steam_music_remote, bValue);
}


UpdateLooped :: inline (bValue: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateLooped(steam_music_remote, bValue);
}


UpdateVolume :: inline (flValue: float) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateVolume(steam_music_remote, flValue);
}


CurrentEntryWillChange :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_CurrentEntryWillChange(steam_music_remote);
}


CurrentEntryIsAvailable :: inline (bAvailable: bool) -> bool {
    return SteamAPI_ISteamMusicRemote_CurrentEntryIsAvailable(steam_music_remote, bAvailable);
}


UpdateCurrentEntryText :: inline (pchText: *char) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateCurrentEntryText(steam_music_remote, pchText);
}


UpdateCurrentEntryElapsedSeconds :: inline (nValue: s32) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds(steam_music_remote, nValue);
}


UpdateCurrentEntryCoverArt :: inline (pvBuffer: *void, cbBufferLength: uint32) -> bool {
    return SteamAPI_ISteamMusicRemote_UpdateCurrentEntryCoverArt(steam_music_remote, pvBuffer, cbBufferLength);
}


CurrentEntryDidChange :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_CurrentEntryDidChange(steam_music_remote);
}


QueueWillChange :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_QueueWillChange(steam_music_remote);
}


ResetQueueEntries :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_ResetQueueEntries(steam_music_remote);
}


SetQueueEntry :: inline (nID: s32, nPosition: s32, pchEntryText: *char) -> bool {
    return SteamAPI_ISteamMusicRemote_SetQueueEntry(steam_music_remote, nID, nPosition, pchEntryText);
}


SetCurrentQueueEntry :: inline (nID: s32) -> bool {
    return SteamAPI_ISteamMusicRemote_SetCurrentQueueEntry(steam_music_remote, nID);
}


QueueDidChange :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_QueueDidChange(steam_music_remote);
}


PlaylistWillChange :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_PlaylistWillChange(steam_music_remote);
}


ResetPlaylistEntries :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_ResetPlaylistEntries(steam_music_remote);
}


SetPlaylistEntry :: inline (nID: s32, nPosition: s32, pchEntryText: *char) -> bool {
    return SteamAPI_ISteamMusicRemote_SetPlaylistEntry(steam_music_remote, nID, nPosition, pchEntryText);
}


SetCurrentPlaylistEntry :: inline (nID: s32) -> bool {
    return SteamAPI_ISteamMusicRemote_SetCurrentPlaylistEntry(steam_music_remote, nID);
}


PlaylistDidChange :: inline () -> bool {
    return SteamAPI_ISteamMusicRemote_PlaylistDidChange(steam_music_remote);
}
