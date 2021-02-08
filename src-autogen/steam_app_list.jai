steam_app_list : *ISteamAppList;
SteamAppList : SteamAppList_Namespace;


#scope_file


SteamAppList_Namespace :: struct {
    // procs
    GetNumInstalledApps                                :: SteamAppList_GetNumInstalledApps;
    GetInstalledApps                                   :: SteamAppList_GetInstalledApps;
    GetAppName                                         :: SteamAppList_GetAppName;
    GetAppInstallDir                                   :: SteamAppList_GetAppInstallDir;
    GetAppBuildId                                      :: SteamAppList_GetAppBuildId;
}


SteamAppList_GetNumInstalledApps :: inline () -> uint32 {
    return SteamAPI_ISteamAppList_GetNumInstalledApps(steam_app_list);
}


SteamAppList_GetInstalledApps :: inline (pvecAppID: *AppId_t, unMaxAppIDs: uint32) -> uint32 {
    return SteamAPI_ISteamAppList_GetInstalledApps(steam_app_list, pvecAppID, unMaxAppIDs);
}


SteamAppList_GetAppName :: inline (nAppID: AppId_t, pchName: *char, cchNameMax: s32) -> s32 {
    return SteamAPI_ISteamAppList_GetAppName(steam_app_list, nAppID, pchName, cchNameMax);
}


SteamAppList_GetAppInstallDir :: inline (nAppID: AppId_t, pchDirectory: *char, cchNameMax: s32) -> s32 {
    return SteamAPI_ISteamAppList_GetAppInstallDir(steam_app_list, nAppID, pchDirectory, cchNameMax);
}


SteamAppList_GetAppBuildId :: inline (nAppID: AppId_t) -> s32 {
    return SteamAPI_ISteamAppList_GetAppBuildId(steam_app_list, nAppID);
}
