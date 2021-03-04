steam_video : *ISteamVideo;
SteamVideo : SteamVideo_Namespace;


#scope_file


SteamVideo_Namespace :: struct {
    // procs
    GetVideoURL                                        :: SteamVideo_GetVideoURL;
    IsBroadcasting                                     :: SteamVideo_IsBroadcasting;
    GetOPFSettings                                     :: SteamVideo_GetOPFSettings;
    GetOPFStringForApp                                 :: SteamVideo_GetOPFStringForApp;
}


SteamVideo_GetVideoURL :: inline (unVideoAppID: AppId_t) {
    SteamVideo_GetVideoURL(steam_video, unVideoAppID);
}


SteamVideo_IsBroadcasting :: inline (pnNumViewers: *s32) -> bool #foreign steam "SteamAPI_ISteamVideo_ {
    return SteamVideo_IsBroadcasting(steam_video, pnNumViewers);
}


SteamVideo_GetOPFSettings :: inline (unVideoAppID: AppId_t) {
    SteamVideo_GetOPFSettings(steam_video, unVideoAppID);
}


SteamVideo_GetOPFStringForApp :: inline (unVideoAppID: AppId_t, pchBuffer: *char, pnBufferSize: *int32) -> bool #foreign steam "SteamAPI_ISteamVideo_GetO {
    return SteamVideo_GetOPFStringForApp(steam_video, unVideoAppID, pchBuffer, pnBufferSize);
}
