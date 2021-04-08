steam_game_server_apps : *ISteamApps;


ServerBIsSubscribed :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsSubscribed(steam_game_server_apps);
}


ServerBIsLowViolence :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsLowViolence(steam_game_server_apps);
}


ServerBIsCybercafe :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsCybercafe(steam_game_server_apps);
}


ServerBIsVACBanned :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsVACBanned(steam_game_server_apps);
}


ServerGetCurrentGameLanguage :: inline () -> string {
    return to_string(SteamAPI_ISteamApps_GetCurrentGameLanguage(steam_game_server_apps));
}


ServerGetAvailableGameLanguages :: inline () -> string {
    return to_string(SteamAPI_ISteamApps_GetAvailableGameLanguages(steam_game_server_apps));
}


ServerBIsSubscribedApp :: inline (appID: AppId_t) -> bool {
    return SteamAPI_ISteamApps_BIsSubscribedApp(steam_game_server_apps, appID);
}


ServerBIsDlcInstalled :: inline (appID: AppId_t) -> bool {
    return SteamAPI_ISteamApps_BIsDlcInstalled(steam_game_server_apps, appID);
}


ServerGetEarliestPurchaseUnixTime :: inline (nAppID: AppId_t) -> uint32 {
    return SteamAPI_ISteamApps_GetEarliestPurchaseUnixTime(steam_game_server_apps, nAppID);
}


ServerBIsSubscribedFromFreeWeekend :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsSubscribedFromFreeWeekend(steam_game_server_apps);
}


ServerGetDLCCount :: inline () -> s32 {
    return SteamAPI_ISteamApps_GetDLCCount(steam_game_server_apps);
}


ServerBGetDLCDataByIndex :: inline (iDLC: s32, pAppID: *AppId_t, pbAvailable: *bool, pchName: *char, cchNameBufferSize: s32) -> bool {
    return SteamAPI_ISteamApps_BGetDLCDataByIndex(steam_game_server_apps, iDLC, pAppID, pbAvailable, pchName, cchNameBufferSize);
}


ServerInstallDLC :: inline (nAppID: AppId_t) {
    SteamAPI_ISteamApps_InstallDLC(steam_game_server_apps, nAppID);
}


ServerUninstallDLC :: inline (nAppID: AppId_t) {
    SteamAPI_ISteamApps_UninstallDLC(steam_game_server_apps, nAppID);
}


ServerRequestAppProofOfPurchaseKey :: inline (nAppID: AppId_t) {
    SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey(steam_game_server_apps, nAppID);
}


ServerGetCurrentBetaName :: inline (pchName: *char, cchNameBufferSize: s32) -> bool {
    return SteamAPI_ISteamApps_GetCurrentBetaName(steam_game_server_apps, pchName, cchNameBufferSize);
}


ServerMarkContentCorrupt :: inline (bMissingFilesOnly: bool) -> bool {
    return SteamAPI_ISteamApps_MarkContentCorrupt(steam_game_server_apps, bMissingFilesOnly);
}


ServerGetInstalledDepots :: inline (appID: AppId_t, pvecDepots: *DepotId_t, cMaxDepots: uint32) -> uint32 {
    return SteamAPI_ISteamApps_GetInstalledDepots(steam_game_server_apps, appID, pvecDepots, cMaxDepots);
}


ServerGetAppInstallDir :: inline (appID: AppId_t, pchFolder: *char, cchFolderBufferSize: uint32) -> uint32 {
    return SteamAPI_ISteamApps_GetAppInstallDir(steam_game_server_apps, appID, pchFolder, cchFolderBufferSize);
}


ServerBIsAppInstalled :: inline (appID: AppId_t) -> bool {
    return SteamAPI_ISteamApps_BIsAppInstalled(steam_game_server_apps, appID);
}


ServerGetAppOwner :: inline () -> uint64_steamid {
    return SteamAPI_ISteamApps_GetAppOwner(steam_game_server_apps);
}


ServerGetLaunchQueryParam :: inline (pchKey: *char) -> string {
    return to_string(SteamAPI_ISteamApps_GetLaunchQueryParam(steam_game_server_apps, pchKey));
}


ServerGetDlcDownloadProgress :: inline (nAppID: AppId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool {
    return SteamAPI_ISteamApps_GetDlcDownloadProgress(steam_game_server_apps, nAppID, punBytesDownloaded, punBytesTotal);
}


ServerGetAppBuildId :: inline () -> s32 {
    return SteamAPI_ISteamApps_GetAppBuildId(steam_game_server_apps);
}


ServerRequestAllProofOfPurchaseKeys :: inline () {
    SteamAPI_ISteamApps_RequestAllProofOfPurchaseKeys(steam_game_server_apps);
}


ServerGetFileDetails :: inline (pszFileName: *char) -> SteamAPICall_t #must {
    return SteamAPI_ISteamApps_GetFileDetails(steam_game_server_apps, pszFileName);
}

ServerGetFileDetails :: inline (pszFileName: *char, callback: (FileDetailsResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerGetFileDetails(pszFileName),
        callback
    );
}

ServerGetFileDetails :: (pszFileName: *char, code: Code) #expand {
    RegisterCallResult(
        ServerGetFileDetails(pszFileName),
        (result: FileDetailsResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerGetLaunchCommandLine :: inline (pszCommandLine: *char, cubCommandLine: s32) -> s32 {
    return SteamAPI_ISteamApps_GetLaunchCommandLine(steam_game_server_apps, pszCommandLine, cubCommandLine);
}


ServerBIsSubscribedFromFamilySharing :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsSubscribedFromFamilySharing(steam_game_server_apps);
}


ServerBIsTimedTrial :: inline (punSecondsAllowed: *uint32, punSecondsPlayed: *uint32) -> bool {
    return SteamAPI_ISteamApps_BIsTimedTrial(steam_game_server_apps, punSecondsAllowed, punSecondsPlayed);
}
