steam_remote_play : *ISteamRemotePlay;


GetSessionCount :: inline () -> uint32 {
    return SteamAPI_ISteamRemotePlay_GetSessionCount(steam_remote_play);
}


GetSessionID :: inline (iSessionIndex: s32) -> RemotePlaySessionID_t {
    return SteamAPI_ISteamRemotePlay_GetSessionID(steam_remote_play, iSessionIndex);
}


GetSessionSteamID :: inline (unSessionID: RemotePlaySessionID_t) -> uint64_steamid {
    return SteamAPI_ISteamRemotePlay_GetSessionSteamID(steam_remote_play, unSessionID);
}


GetSessionClientName :: inline (unSessionID: RemotePlaySessionID_t) -> string {
    return to_string(SteamAPI_ISteamRemotePlay_GetSessionClientName(steam_remote_play, unSessionID));
}


GetSessionClientFormFactor :: inline (unSessionID: RemotePlaySessionID_t) -> ESteamDeviceFormFactor {
    return SteamAPI_ISteamRemotePlay_GetSessionClientFormFactor(steam_remote_play, unSessionID);
}


BGetSessionClientResolution :: inline (unSessionID: RemotePlaySessionID_t, pnResolutionX: *s32, pnResolutionY: *s32) -> bool {
    return SteamAPI_ISteamRemotePlay_BGetSessionClientResolution(steam_remote_play, unSessionID, pnResolutionX, pnResolutionY);
}


BSendRemotePlayTogetherInvite :: inline (steamIDFriend: uint64_steamid) -> bool {
    return SteamAPI_ISteamRemotePlay_BSendRemotePlayTogetherInvite(steam_remote_play, steamIDFriend);
}
