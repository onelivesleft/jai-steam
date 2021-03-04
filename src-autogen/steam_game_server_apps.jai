steam_game_server_apps : *ISteamApps;
SteamGameServerApps : SteamGameServerApps_Namespace;


#scope_file


SteamGameServerApps_Namespace :: struct {
    // procs
    BIsSubscribed                                      :: SteamApps_BIsSubscribed;
    BIsLowViolence                                     :: SteamApps_BIsLowViolence;
    BIsCybercafe                                       :: SteamApps_BIsCybercafe;
    BIsVACBanned                                       :: SteamApps_BIsVACBanned;
    GetCurrentGameLanguage                             :: SteamApps_GetCurrentGameLanguage;
    GetAvailableGameLanguages                          :: SteamApps_GetAvailableGameLanguages;
    BIsSubscribedApp                                   :: SteamApps_BIsSubscribedApp;
    BIsDlcInstalled                                    :: SteamApps_BIsDlcInstalled;
    GetEarliestPurchaseUnixTime                        :: SteamApps_GetEarliestPurchaseUnixTime;
    BIsSubscribedFromFreeWeekend                       :: SteamApps_BIsSubscribedFromFreeWeekend;
    GetDLCCount                                        :: SteamApps_GetDLCCount;
    BGetDLCDataByIndex                                 :: SteamApps_BGetDLCDataByIndex;
    InstallDLC                                         :: SteamApps_InstallDLC;
    UninstallDLC                                       :: SteamApps_UninstallDLC;
    RequestAppProofOfPurchaseKey                       :: SteamApps_RequestAppProofOfPurchaseKey;
    GetCurrentBetaName                                 :: SteamApps_GetCurrentBetaName;
    MarkContentCorrupt                                 :: SteamApps_MarkContentCorrupt;
    GetInstalledDepots                                 :: SteamApps_GetInstalledDepots;
    GetAppInstallDir                                   :: SteamApps_GetAppInstallDir;
    BIsAppInstalled                                    :: SteamApps_BIsAppInstalled;
    GetAppOwner                                        :: SteamApps_GetAppOwner;
    GetLaunchQueryParam                                :: SteamApps_GetLaunchQueryParam;
    GetDlcDownloadProgress                             :: SteamApps_GetDlcDownloadProgress;
    GetAppBuildId                                      :: SteamApps_GetAppBuildId;
    RequestAllProofOfPurchaseKeys                      :: SteamApps_RequestAllProofOfPurchaseKeys;
    GetFileDetails                                     :: SteamApps_GetFileDetails;
    GetLaunchCommandLine                               :: SteamApps_GetLaunchCommandLine;
    BIsSubscribedFromFamilySharing                     :: SteamApps_BIsSubscribedFromFamilySharing;
    BIsTimedTrial                                      :: SteamApps_BIsTimedTrial;
}


SteamApps_BIsSubscribed :: inline () -> bool #foreign steam "SteamAPI_ISteamApps {
    return SteamApps_BIsSubscribed(steam_game_server_apps);
}


SteamApps_BIsLowViolence :: inline () -> bool #foreign steam "SteamAPI_ISteamApps_ {
    return SteamApps_BIsLowViolence(steam_game_server_apps);
}


SteamApps_BIsCybercafe :: inline () -> bool #foreign steam "SteamAPI_ISteamApp {
    return SteamApps_BIsCybercafe(steam_game_server_apps);
}


SteamApps_BIsVACBanned :: inline () -> bool #foreign steam "SteamAPI_ISteamApp {
    return SteamApps_BIsVACBanned(steam_game_server_apps);
}


SteamApps_GetCurrentGameLanguage :: inline () -> *char #foreign steam "SteamAPI_ISteamApps_GetCurre {
    return SteamApps_GetCurrentGameLanguage(steam_game_server_apps);
}


SteamApps_GetAvailableGameLanguages :: inline () -> *char #foreign steam "SteamAPI_ISteamApps_GetAvailabl {
    return SteamApps_GetAvailableGameLanguages(steam_game_server_apps);
}


SteamApps_BIsSubscribedApp :: inline (appID: AppId_t) -> bool #foreign steam "SteamAPI_ISteamApps_BI {
    return SteamApps_BIsSubscribedApp(steam_game_server_apps, appID);
}


SteamApps_BIsDlcInstalled :: inline (appID: AppId_t) -> bool #foreign steam "SteamAPI_ISteamApps_B {
    return SteamApps_BIsDlcInstalled(steam_game_server_apps, appID);
}


SteamApps_GetEarliestPurchaseUnixTime :: inline (nAppID: AppId_t) -> uint32 #foreign steam "SteamAPI_ISteamApps_GetEarliestPu {
    return SteamApps_GetEarliestPurchaseUnixTime(steam_game_server_apps, nAppID);
}


SteamApps_BIsSubscribedFromFreeWeekend :: inline () -> bool #foreign steam "SteamAPI_ISteamApps_BIsSubscribedF {
    return SteamApps_BIsSubscribedFromFreeWeekend(steam_game_server_apps);
}


SteamApps_GetDLCCount :: inline () -> s32 #foreign steam "SteamAPI_ISteamAp {
    return SteamApps_GetDLCCount(steam_game_server_apps);
}


SteamApps_BGetDLCDataByIndex :: inline (iDLC: s32, pAppID: *AppId_t, pbAvailable: *bool, pchName: *char, cchNameBufferSize: s32) -> bool #foreign steam "SteamAPI_ISteamApps_BGet {
    return SteamApps_BGetDLCDataByIndex(steam_game_server_apps, iDLC, pAppID, pbAvailable, pchName, cchNameBufferSize);
}


SteamApps_InstallDLC :: inline (nAppID: AppId_t) {
    SteamApps_InstallDLC(steam_game_server_apps, nAppID);
}


SteamApps_UninstallDLC :: inline (nAppID: AppId_t) {
    SteamApps_UninstallDLC(steam_game_server_apps, nAppID);
}


SteamApps_RequestAppProofOfPurchaseKey :: inline (nAppID: AppId_t) {
    SteamApps_RequestAppProofOfPurchaseKey(steam_game_server_apps, nAppID);
}


SteamApps_GetCurrentBetaName :: inline (pchName: *char, cchNameBufferSize: s32) -> bool #foreign steam "SteamAPI_ISteamApps_GetC {
    return SteamApps_GetCurrentBetaName(steam_game_server_apps, pchName, cchNameBufferSize);
}


SteamApps_MarkContentCorrupt :: inline (bMissingFilesOnly: bool) -> bool #foreign steam "SteamAPI_ISteamApps_Mark {
    return SteamApps_MarkContentCorrupt(steam_game_server_apps, bMissingFilesOnly);
}


SteamApps_GetInstalledDepots :: inline (appID: AppId_t, pvecDepots: *DepotId_t, cMaxDepots: uint32) -> uint32 #foreign steam "SteamAPI_ISteamApps_GetI {
    return SteamApps_GetInstalledDepots(steam_game_server_apps, appID, pvecDepots, cMaxDepots);
}


SteamApps_GetAppInstallDir :: inline (appID: AppId_t, pchFolder: *char, cchFolderBufferSize: uint32) -> uint32 #foreign steam "SteamAPI_ISteamApps_Ge {
    return SteamApps_GetAppInstallDir(steam_game_server_apps, appID, pchFolder, cchFolderBufferSize);
}


SteamApps_BIsAppInstalled :: inline (appID: AppId_t) -> bool #foreign steam "SteamAPI_ISteamApps_B {
    return SteamApps_BIsAppInstalled(steam_game_server_apps, appID);
}


SteamApps_GetAppOwner :: inline () -> uint64_steamid #foreign steam "SteamAPI_ISteamAp {
    return SteamApps_GetAppOwner(steam_game_server_apps);
}


SteamApps_GetLaunchQueryParam :: inline (pchKey: *char) -> *char #foreign steam "SteamAPI_ISteamApps_GetLa {
    return SteamApps_GetLaunchQueryParam(steam_game_server_apps, pchKey);
}


SteamApps_GetDlcDownloadProgress :: inline (nAppID: AppId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool #foreign steam "SteamAPI_ISteamApps_GetDlcDo {
    return SteamApps_GetDlcDownloadProgress(steam_game_server_apps, nAppID, punBytesDownloaded, punBytesTotal);
}


SteamApps_GetAppBuildId :: inline () -> s32 #foreign steam "SteamAPI_ISteamApps {
    return SteamApps_GetAppBuildId(steam_game_server_apps);
}


SteamApps_RequestAllProofOfPurchaseKeys :: inline () {
    SteamApps_RequestAllProofOfPurchaseKeys(steam_game_server_apps);
}


SteamApps_GetFileDetails :: inline (pszFileName: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamApps_ {
    return SteamApps_GetFileDetails(steam_game_server_apps, pszFileName);
}


SteamApps_GetLaunchCommandLine :: inline (pszCommandLine: *char, cubCommandLine: s32) -> s32 #foreign steam "SteamAPI_ISteamApps_GetLau {
    return SteamApps_GetLaunchCommandLine(steam_game_server_apps, pszCommandLine, cubCommandLine);
}


SteamApps_BIsSubscribedFromFamilySharing :: inline () -> bool #foreign steam "SteamAPI_ISteamApps_BIsSubscribedFro {
    return SteamApps_BIsSubscribedFromFamilySharing(steam_game_server_apps);
}


SteamApps_BIsTimedTrial :: inline (punSecondsAllowed: *uint32, punSecondsPlayed: *uint32) -> bool #foreign steam "SteamAPI_ISteamApps {
    return SteamApps_BIsTimedTrial(steam_game_server_apps, punSecondsAllowed, punSecondsPlayed);
}
