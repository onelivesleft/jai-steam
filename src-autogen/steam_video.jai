steam_video : *ISteamVideo;


GetVideoURL :: inline (unVideoAppID: AppId_t) {
    SteamAPI_ISteamVideo_GetVideoURL(steam_video, unVideoAppID);
}


IsBroadcasting :: inline (pnNumViewers: *s32) -> bool {
    return SteamAPI_ISteamVideo_IsBroadcasting(steam_video, pnNumViewers);
}


GetOPFSettings :: inline (unVideoAppID: AppId_t) {
    SteamAPI_ISteamVideo_GetOPFSettings(steam_video, unVideoAppID);
}


GetOPFStringForApp :: inline (unVideoAppID: AppId_t, pchBuffer: *char, pnBufferSize: *int32) -> bool {
    return SteamAPI_ISteamVideo_GetOPFStringForApp(steam_video, unVideoAppID, pchBuffer, pnBufferSize);
}
