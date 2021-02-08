steam_apps : *ISteamApps;

SteamApps : SteamApps_Namespace;


#scope_file


SteamApps_Namespace :: struct {
    // procs
                      :: SteamApps_BIsSubscribed
                     :: SteamApps_BIsLowViolence
                       :: SteamApps_BIsCybercafe
                       :: SteamApps_BIsVACBanned
             :: SteamApps_GetCurrentGameLanguage
          :: SteamApps_GetAvailableGameLanguages
                   :: SteamApps_BIsSubscribedApp
                    :: SteamApps_BIsDlcInstalled
        :: SteamApps_GetEarliestPurchaseUnixTime
       :: SteamApps_BIsSubscribedFromFreeWeekend
                        :: SteamApps_GetDLCCount
                 :: SteamApps_BGetDLCDataByIndex
                         :: SteamApps_InstallDLC
                       :: SteamApps_UninstallDLC
       :: SteamApps_RequestAppProofOfPurchaseKey
                 :: SteamApps_GetCurrentBetaName
                 :: SteamApps_MarkContentCorrupt
                 :: SteamApps_GetInstalledDepots
                   :: SteamApps_GetAppInstallDir
                    :: SteamApps_BIsAppInstalled
                        :: SteamApps_GetAppOwner
                :: SteamApps_GetLaunchQueryParam
             :: SteamApps_GetDlcDownloadProgress
                      :: SteamApps_GetAppBuildId
      :: SteamApps_RequestAllProofOfPurchaseKeys
                     :: SteamApps_GetFileDetails
               :: SteamApps_GetLaunchCommandLine
     :: SteamApps_BIsSubscribedFromFamilySharing
                      :: SteamApps_BIsTimedTrial
}


SteamApps_BIsSubscribed :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsSubscribed(steam_apps);
}


SteamApps_BIsLowViolence :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsLowViolence(steam_apps);
}


SteamApps_BIsCybercafe :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsCybercafe(steam_apps);
}


SteamApps_BIsVACBanned :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsVACBanned(steam_apps);
}


SteamApps_GetCurrentGameLanguage :: inline () -> *char {
    return SteamAPI_ISteamApps_GetCurrentGameLanguage(steam_apps);
}


SteamApps_GetAvailableGameLanguages :: inline () -> *char {
    return SteamAPI_ISteamApps_GetAvailableGameLanguages(steam_apps);
}


SteamApps_BIsSubscribedApp :: inline (appID: AppId_t) -> bool {
    return SteamAPI_ISteamApps_BIsSubscribedApp(steam_apps, appID: AppId_t);
}


SteamApps_BIsDlcInstalled :: inline (appID: AppId_t) -> bool {
    return SteamAPI_ISteamApps_BIsDlcInstalled(steam_apps, appID: AppId_t);
}


SteamApps_GetEarliestPurchaseUnixTime :: inline (nAppID: AppId_t) -> uint32 {
    return SteamAPI_ISteamApps_GetEarliestPurchaseUnixTime(steam_apps, nAppID: AppId_t);
}


SteamApps_BIsSubscribedFromFreeWeekend :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsSubscribedFromFreeWeekend(steam_apps);
}


SteamApps_GetDLCCount :: inline () -> s32 {
    return SteamAPI_ISteamApps_GetDLCCount(steam_apps);
}


SteamApps_BGetDLCDataByIndex :: inline (iDLC: s32, pAppID: *AppId_t, pbAvailable: *bool, pchName: *char, cchNameBufferSize: s32) -> bool {
    return SteamAPI_ISteamApps_BGetDLCDataByIndex(steam_apps, iDLC: s32, pAppID: *AppId_t, pbAvailable: *bool, pchName: *char, cchNameBufferSize: s32);
}


SteamApps_InstallDLC :: inline (nAppID: AppId_t) {
    SteamAPI_ISteamApps_InstallDLC(steam_apps, nAppID: AppId_t);
}


SteamApps_UninstallDLC :: inline (nAppID: AppId_t) {
    SteamAPI_ISteamApps_UninstallDLC(steam_apps, nAppID: AppId_t);
}


SteamApps_RequestAppProofOfPurchaseKey :: inline (nAppID: AppId_t) {
    SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey(steam_apps, nAppID: AppId_t);
}


SteamApps_GetCurrentBetaName :: inline (pchName: *char, cchNameBufferSize: s32) -> bool {
    return SteamAPI_ISteamApps_GetCurrentBetaName(steam_apps, pchName: *char, cchNameBufferSize: s32);
}


SteamApps_MarkContentCorrupt :: inline (bMissingFilesOnly: bool) -> bool {
    return SteamAPI_ISteamApps_MarkContentCorrupt(steam_apps, bMissingFilesOnly: bool);
}


SteamApps_GetInstalledDepots :: inline (appID: AppId_t, pvecDepots: *DepotId_t, cMaxDepots: uint32) -> uint32 {
    return SteamAPI_ISteamApps_GetInstalledDepots(steam_apps, appID: AppId_t, pvecDepots: *DepotId_t, cMaxDepots: uint32);
}


SteamApps_GetAppInstallDir :: inline (appID: AppId_t, pchFolder: *char, cchFolderBufferSize: uint32) -> uint32 {
    return SteamAPI_ISteamApps_GetAppInstallDir(steam_apps, appID: AppId_t, pchFolder: *char, cchFolderBufferSize: uint32);
}


SteamApps_BIsAppInstalled :: inline (appID: AppId_t) -> bool {
    return SteamAPI_ISteamApps_BIsAppInstalled(steam_apps, appID: AppId_t);
}


SteamApps_GetAppOwner :: inline () -> uint64_steamid {
    return SteamAPI_ISteamApps_GetAppOwner(steam_apps);
}


SteamApps_GetLaunchQueryParam :: inline (pchKey: *char) -> *char {
    return SteamAPI_ISteamApps_GetLaunchQueryParam(steam_apps, pchKey: *char);
}


SteamApps_GetDlcDownloadProgress :: inline (nAppID: AppId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool {
    return SteamAPI_ISteamApps_GetDlcDownloadProgress(steam_apps, nAppID: AppId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64);
}


SteamApps_GetAppBuildId :: inline () -> s32 {
    return SteamAPI_ISteamApps_GetAppBuildId(steam_apps);
}


SteamApps_RequestAllProofOfPurchaseKeys :: inline () {
    SteamAPI_ISteamApps_RequestAllProofOfPurchaseKeys(steam_apps);
}


SteamApps_GetFileDetails :: inline (pszFileName: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamApps_GetFileDetails(steam_apps, pszFileName: *char);
}


SteamApps_GetLaunchCommandLine :: inline (pszCommandLine: *char, cubCommandLine: s32) -> s32 {
    return SteamAPI_ISteamApps_GetLaunchCommandLine(steam_apps, pszCommandLine: *char, cubCommandLine: s32);
}


SteamApps_BIsSubscribedFromFamilySharing :: inline () -> bool {
    return SteamAPI_ISteamApps_BIsSubscribedFromFamilySharing(steam_apps);
}


SteamApps_BIsTimedTrial :: inline (punSecondsAllowed: *uint32, punSecondsPlayed: *uint32) -> bool {
    return SteamAPI_ISteamApps_BIsTimedTrial(steam_apps, punSecondsAllowed: *uint32, punSecondsPlayed: *uint32);
}
