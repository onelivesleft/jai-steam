steam_remote_play : *ISteamRemotePlay;
SteamRemotePlay : SteamRemotePlay_Namespace;


#scope_file


SteamRemotePlay_Namespace :: struct {
    // procs
    GetSessionCount                                    :: SteamRemotePlay_GetSessionCount;
    GetSessionID                                       :: SteamRemotePlay_GetSessionID;
    GetSessionSteamID                                  :: SteamRemotePlay_GetSessionSteamID;
    GetSessionClientName                               :: SteamRemotePlay_GetSessionClientName;
    GetSessionClientFormFactor                         :: SteamRemotePlay_GetSessionClientFormFactor;
    BGetSessionClientResolution                        :: SteamRemotePlay_BGetSessionClientResolution;
    BSendRemotePlayTogetherInvite                      :: SteamRemotePlay_BSendRemotePlayTogetherInvite;
}


SteamRemotePlay_GetSessionCount :: inline () -> uint32 {
    return SteamAPI_ISteamRemotePlay_GetSessionCount(steam_remote_play);
}


SteamRemotePlay_GetSessionID :: inline (iSessionIndex: s32) -> RemotePlaySessionID_t {
    return SteamAPI_ISteamRemotePlay_GetSessionID(steam_remote_play, iSessionIndex);
}


SteamRemotePlay_GetSessionSteamID :: inline (unSessionID: RemotePlaySessionID_t) -> uint64_steamid {
    return SteamAPI_ISteamRemotePlay_GetSessionSteamID(steam_remote_play, unSessionID);
}


SteamRemotePlay_GetSessionClientName :: inline (unSessionID: RemotePlaySessionID_t) -> *char {
    return SteamAPI_ISteamRemotePlay_GetSessionClientName(steam_remote_play, unSessionID);
}


SteamRemotePlay_GetSessionClientFormFactor :: inline (unSessionID: RemotePlaySessionID_t) -> ESteamDeviceFormFactor {
    return SteamAPI_ISteamRemotePlay_GetSessionClientFormFactor(steam_remote_play, unSessionID);
}


SteamRemotePlay_BGetSessionClientResolution :: inline (unSessionID: RemotePlaySessionID_t, pnResolutionX: *s32, pnResolutionY: *s32) -> bool {
    return SteamAPI_ISteamRemotePlay_BGetSessionClientResolution(steam_remote_play, unSessionID, pnResolutionX, pnResolutionY);
}


SteamRemotePlay_BSendRemotePlayTogetherInvite :: inline (steamIDFriend: uint64_steamid) -> bool {
    return SteamAPI_ISteamRemotePlay_BSendRemotePlayTogetherInvite(steam_remote_play, steamIDFriend);
}
