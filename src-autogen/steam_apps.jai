steam_apps : *ISteamApps;


BIsSubscribed :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsSubscribed(steam_apps);
}


BIsLowViolence :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsLowViolence(steam_apps);
}


BIsCybercafe :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsCybercafe(steam_apps);
}


BIsVACBanned :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsVACBanned(steam_apps);
}


GetCurrentGameLanguage :: inline () -> string {
    return to_string(SteamAPI_ISteamApps_GetCurrentGameLanguage(steam_apps));
}


GetAvailableGameLanguages :: inline () -> string {
    return to_string(SteamAPI_ISteamApps_GetAvailableGameLanguages(steam_apps));
}


BIsSubscribedApp :: inline (appID: AppId_t) -> bool {
    return SteamAPI_ISteamApps_BIsSubscribedApp(steam_apps, appID);
}


BIsDlcInstalled :: inline (appID: AppId_t) -> bool {
    return SteamAPI_ISteamApps_BIsDlcInstalled(steam_apps, appID);
}


GetEarliestPurchaseUnixTime :: inline (nAppID: AppId_t) -> uint32 {
    return SteamAPI_ISteamApps_GetEarliestPurchaseUnixTime(steam_apps, nAppID);
}


BIsSubscribedFromFreeWeekend :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsSubscribedFromFreeWeekend(steam_apps);
}


GetDLCCount :: inline () -> s32 {
    return SteamAPI_ISteamApps_GetDLCCount(steam_apps);
}


BGetDLCDataByIndex :: inline (iDLC: s32, pAppID: *AppId_t, pbAvailable: *bool, pchName: *char, cchNameBufferSize: s32) -> bool {
    return SteamAPI_ISteamApps_BGetDLCDataByIndex(steam_apps, iDLC, pAppID, pbAvailable, pchName, cchNameBufferSize);
}


InstallDLC :: inline (nAppID: AppId_t) {
    SteamAPI_ISteamApps_InstallDLC(steam_apps, nAppID);
}


UninstallDLC :: inline (nAppID: AppId_t) {
    SteamAPI_ISteamApps_UninstallDLC(steam_apps, nAppID);
}


RequestAppProofOfPurchaseKey :: inline (nAppID: AppId_t) {
    SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey(steam_apps, nAppID);
}


GetCurrentBetaName :: inline (pchName: *char, cchNameBufferSize: s32) -> bool {
    return SteamAPI_ISteamApps_GetCurrentBetaName(steam_apps, pchName, cchNameBufferSize);
}


MarkContentCorrupt :: inline (bMissingFilesOnly: bool) -> bool {
    return SteamAPI_ISteamApps_MarkContentCorrupt(steam_apps, bMissingFilesOnly);
}


GetInstalledDepots :: inline (appID: AppId_t, pvecDepots: *DepotId_t, cMaxDepots: uint32) -> uint32 {
    return SteamAPI_ISteamApps_GetInstalledDepots(steam_apps, appID, pvecDepots, cMaxDepots);
}


GetAppInstallDir :: inline (appID: AppId_t, pchFolder: *char, cchFolderBufferSize: uint32) -> uint32 {
    return SteamAPI_ISteamApps_GetAppInstallDir(steam_apps, appID, pchFolder, cchFolderBufferSize);
}


BIsAppInstalled :: inline (appID: AppId_t) -> bool {
    return SteamAPI_ISteamApps_BIsAppInstalled(steam_apps, appID);
}


GetAppOwner :: inline () -> uint64_steamid {
    return SteamAPI_ISteamApps_GetAppOwner(steam_apps);
}


GetLaunchQueryParam :: inline (pchKey: *char) -> string {
    return to_string(SteamAPI_ISteamApps_GetLaunchQueryParam(steam_apps, pchKey));
}


GetDlcDownloadProgress :: inline (nAppID: AppId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool {
    return SteamAPI_ISteamApps_GetDlcDownloadProgress(steam_apps, nAppID, punBytesDownloaded, punBytesTotal);
}


GetAppBuildId :: inline () -> s32 {
    return SteamAPI_ISteamApps_GetAppBuildId(steam_apps);
}


RequestAllProofOfPurchaseKeys :: inline () {
    SteamAPI_ISteamApps_RequestAllProofOfPurchaseKeys(steam_apps);
}


GetFileDetails :: inline (pszFileName: *char) -> SteamAPICall_t #must {
    return SteamAPI_ISteamApps_GetFileDetails(steam_apps, pszFileName);
}

GetFileDetails :: inline (pszFileName: *char, callback: (FileDetailsResult_t, bool) -> ()) {
    RegisterCallResult(
        GetFileDetails(pszFileName),
        callback
    );
}

//GetFileDetails :: (pszFileName: *char, code: Code) #expand {
//    RegisterCallResult(
//        GetFileDetails(pszFileName),
//        (result: FileDetailsResult_t, io_failure: bool) -> () {
//            #insert code;
//        }
//    );
//}


GetLaunchCommandLine :: inline (pszCommandLine: *char, cubCommandLine: s32) -> s32 {
    return SteamAPI_ISteamApps_GetLaunchCommandLine(steam_apps, pszCommandLine, cubCommandLine);
}


BIsSubscribedFromFamilySharing :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsSubscribedFromFamilySharing(steam_apps);
}


BIsTimedTrial :: inline (punSecondsAllowed: *uint32, punSecondsPlayed: *uint32) -> bool {
    return SteamAPI_ISteamApps_BIsTimedTrial(steam_apps, punSecondsAllowed, punSecondsPlayed);
}
