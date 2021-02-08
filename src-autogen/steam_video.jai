steam_video : *ISteamVideo;

SteamVideo : SteamVideo_Namespace;


#scope_file


SteamVideo_Namespace :: struct {
    // procs
                        :: SteamVideo_GetVideoURL
                     :: SteamVideo_IsBroadcasting
                     :: SteamVideo_GetOPFSettings
                 :: SteamVideo_GetOPFStringForApp
}


SteamVideo_GetVideoURL :: inline (unVideoAppID: AppId_t) {
    SteamAPI_ISteamVideo_GetVideoURL(steam_video, unVideoAppID: AppId_t);
}


SteamVideo_IsBroadcasting :: inline (pnNumViewers: *s32) -> bool {
    return SteamAPI_ISteamVideo_IsBroadcasting(steam_video, pnNumViewers: *s32);
}


SteamVideo_GetOPFSettings :: inline (unVideoAppID: AppId_t) {
    SteamAPI_ISteamVideo_GetOPFSettings(steam_video, unVideoAppID: AppId_t);
}


SteamVideo_GetOPFStringForApp :: inline (unVideoAppID: AppId_t, pchBuffer: *char, pnBufferSize: *int32) -> bool {
    return SteamAPI_ISteamVideo_GetOPFStringForApp(steam_video, unVideoAppID: AppId_t, pchBuffer: *char, pnBufferSize: *int32);
}
