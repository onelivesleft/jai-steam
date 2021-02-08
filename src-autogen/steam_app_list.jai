steam_app_list : *ISteamAppList;

SteamAppList : SteamAppList_Namespace;


#scope_file


SteamAppList_Namespace :: struct {
    // procs
                :: SteamAppList_GetNumInstalledApps
                   :: SteamAppList_GetInstalledApps
                         :: SteamAppList_GetAppName
                   :: SteamAppList_GetAppInstallDir
                      :: SteamAppList_GetAppBuildId
}


SteamAppList_GetNumInstalledApps :: inline () -> uint32 {
    return SteamAPI_ISteamAppList_GetNumInstalledApps(steam_app_list);
}


SteamAppList_GetInstalledApps :: inline (pvecAppID: *AppId_t, unMaxAppIDs: uint32) -> uint32 {
    return SteamAPI_ISteamAppList_GetInstalledApps(steam_app_list, pvecAppID: *AppId_t, unMaxAppIDs: uint32);
}


SteamAppList_GetAppName :: inline (nAppID: AppId_t, pchName: *char, cchNameMax: s32) -> s32 {
    return SteamAPI_ISteamAppList_GetAppName(steam_app_list, nAppID: AppId_t, pchName: *char, cchNameMax: s32);
}


SteamAppList_GetAppInstallDir :: inline (nAppID: AppId_t, pchDirectory: *char, cchNameMax: s32) -> s32 {
    return SteamAPI_ISteamAppList_GetAppInstallDir(steam_app_list, nAppID: AppId_t, pchDirectory: *char, cchNameMax: s32);
}


SteamAppList_GetAppBuildId :: inline (nAppID: AppId_t) -> s32 {
    return SteamAPI_ISteamAppList_GetAppBuildId(steam_app_list, nAppID: AppId_t);
}
