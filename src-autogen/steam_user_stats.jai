steam_user_stats : *ISteamUserStats;


RequestCurrentStats :: inline () -> bool {
    return SteamAPI_ISteamUserStats_RequestCurrentStats(steam_user_stats);
}


GetStatInt32 :: inline (pchName: *char, pData: *int32) -> bool {
    return SteamAPI_ISteamUserStats_GetStatInt32(steam_user_stats, pchName, pData);
}


GetStatFloat :: inline (pchName: *char, pData: *float) -> bool {
    return SteamAPI_ISteamUserStats_GetStatFloat(steam_user_stats, pchName, pData);
}


SetStatInt32 :: inline (pchName: *char, nData: int32) -> bool {
    return SteamAPI_ISteamUserStats_SetStatInt32(steam_user_stats, pchName, nData);
}


SetStatFloat :: inline (pchName: *char, fData: float) -> bool {
    return SteamAPI_ISteamUserStats_SetStatFloat(steam_user_stats, pchName, fData);
}


UpdateAvgRateStat :: inline (pchName: *char, flCountThisSession: float, dSessionLength: double) -> bool {
    return SteamAPI_ISteamUserStats_UpdateAvgRateStat(steam_user_stats, pchName, flCountThisSession, dSessionLength);
}


GetAchievement :: inline (pchName: *char, pbAchieved: *bool) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievement(steam_user_stats, pchName, pbAchieved);
}


SetAchievement :: inline (pchName: *char) -> bool {
    return SteamAPI_ISteamUserStats_SetAchievement(steam_user_stats, pchName);
}


ClearAchievement :: inline (pchName: *char) -> bool {
    return SteamAPI_ISteamUserStats_ClearAchievement(steam_user_stats, pchName);
}


GetAchievementAndUnlockTime :: inline (pchName: *char, pbAchieved: *bool, punUnlockTime: *uint32) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievementAndUnlockTime(steam_user_stats, pchName, pbAchieved, punUnlockTime);
}


StoreStats :: inline () -> bool {
    return SteamAPI_ISteamUserStats_StoreStats(steam_user_stats);
}


GetAchievementIcon :: inline (pchName: *char) -> s32 {
    return SteamAPI_ISteamUserStats_GetAchievementIcon(steam_user_stats, pchName);
}


GetAchievementDisplayAttribute :: inline (pchName: *char, pchKey: *char) -> string {
    return to_string(SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute(steam_user_stats, pchName, pchKey));
}


IndicateAchievementProgress :: inline (pchName: *char, nCurProgress: uint32, nMaxProgress: uint32) -> bool {
    return SteamAPI_ISteamUserStats_IndicateAchievementProgress(steam_user_stats, pchName, nCurProgress, nMaxProgress);
}


GetNumAchievements :: inline () -> uint32 {
    return SteamAPI_ISteamUserStats_GetNumAchievements(steam_user_stats);
}


GetAchievementName :: inline (iAchievement: uint32) -> string {
    return to_string(SteamAPI_ISteamUserStats_GetAchievementName(steam_user_stats, iAchievement));
}


RequestUserStats :: inline (steamIDUser: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUserStats_RequestUserStats(steam_user_stats, steamIDUser);
}

RequestUserStats :: inline (steamIDUser: uint64_steamid, callback: (UserStatsReceived_t, bool) -> ()) {
    RegisterCallResult(
        RequestUserStats(steamIDUser),
        callback
    );
}

RequestUserStats :: (steamIDUser: uint64_steamid, code: Code) #expand {
    RegisterCallResult(
        RequestUserStats(steamIDUser),
        (result: UserStatsReceived_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


GetUserStatInt32 :: inline (steamIDUser: uint64_steamid, pchName: *char, pData: *int32) -> bool {
    return SteamAPI_ISteamUserStats_GetUserStatInt32(steam_user_stats, steamIDUser, pchName, pData);
}


GetUserStatFloat :: inline (steamIDUser: uint64_steamid, pchName: *char, pData: *float) -> bool {
    return SteamAPI_ISteamUserStats_GetUserStatFloat(steam_user_stats, steamIDUser, pchName, pData);
}


GetUserAchievement :: inline (steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool) -> bool {
    return SteamAPI_ISteamUserStats_GetUserAchievement(steam_user_stats, steamIDUser, pchName, pbAchieved);
}


GetUserAchievementAndUnlockTime :: inline (steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool, punUnlockTime: *uint32) -> bool {
    return SteamAPI_ISteamUserStats_GetUserAchievementAndUnlockTime(steam_user_stats, steamIDUser, pchName, pbAchieved, punUnlockTime);
}


ResetAllStats :: inline (bAchievementsToo: bool) -> bool {
    return SteamAPI_ISteamUserStats_ResetAllStats(steam_user_stats, bAchievementsToo);
}


FindOrCreateLeaderboard :: inline (pchLeaderboardName: *char, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUserStats_FindOrCreateLeaderboard(steam_user_stats, pchLeaderboardName, eLeaderboardSortMethod, eLeaderboardDisplayType);
}

FindOrCreateLeaderboard :: inline (pchLeaderboardName: *char, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType, callback: (LeaderboardFindResult_t, bool) -> ()) {
    RegisterCallResult(
        FindOrCreateLeaderboard(pchLeaderboardName, eLeaderboardSortMethod, eLeaderboardDisplayType),
        callback
    );
}

FindOrCreateLeaderboard :: (pchLeaderboardName: *char, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType, code: Code) #expand {
    RegisterCallResult(
        FindOrCreateLeaderboard(pchLeaderboardName, eLeaderboardSortMethod, eLeaderboardDisplayType),
        (result: LeaderboardFindResult_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


FindLeaderboard :: inline (pchLeaderboardName: *char) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUserStats_FindLeaderboard(steam_user_stats, pchLeaderboardName);
}

FindLeaderboard :: inline (pchLeaderboardName: *char, callback: (LeaderboardFindResult_t, bool) -> ()) {
    RegisterCallResult(
        FindLeaderboard(pchLeaderboardName),
        callback
    );
}

FindLeaderboard :: (pchLeaderboardName: *char, code: Code) #expand {
    RegisterCallResult(
        FindLeaderboard(pchLeaderboardName),
        (result: LeaderboardFindResult_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


GetLeaderboardName :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> string {
    return to_string(SteamAPI_ISteamUserStats_GetLeaderboardName(steam_user_stats, hSteamLeaderboard));
}


GetLeaderboardEntryCount :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> s32 {
    return SteamAPI_ISteamUserStats_GetLeaderboardEntryCount(steam_user_stats, hSteamLeaderboard);
}


GetLeaderboardSortMethod :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardSortMethod {
    return SteamAPI_ISteamUserStats_GetLeaderboardSortMethod(steam_user_stats, hSteamLeaderboard);
}


GetLeaderboardDisplayType :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardDisplayType {
    return SteamAPI_ISteamUserStats_GetLeaderboardDisplayType(steam_user_stats, hSteamLeaderboard);
}


DownloadLeaderboardEntries :: inline (hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: s32, nRangeEnd: s32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUserStats_DownloadLeaderboardEntries(steam_user_stats, hSteamLeaderboard, eLeaderboardDataRequest, nRangeStart, nRangeEnd);
}

DownloadLeaderboardEntries :: inline (hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: s32, nRangeEnd: s32, callback: (LeaderboardScoresDownloaded_t, bool) -> ()) {
    RegisterCallResult(
        DownloadLeaderboardEntries(hSteamLeaderboard, eLeaderboardDataRequest, nRangeStart, nRangeEnd),
        callback
    );
}

DownloadLeaderboardEntries :: (hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: s32, nRangeEnd: s32, code: Code) #expand {
    RegisterCallResult(
        DownloadLeaderboardEntries(hSteamLeaderboard, eLeaderboardDataRequest, nRangeStart, nRangeEnd),
        (result: LeaderboardScoresDownloaded_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


DownloadLeaderboardEntriesForUsers :: inline (hSteamLeaderboard: SteamLeaderboard_t, prgUsers: *CSteamID, cUsers: s32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUserStats_DownloadLeaderboardEntriesForUsers(steam_user_stats, hSteamLeaderboard, prgUsers, cUsers);
}

DownloadLeaderboardEntriesForUsers :: inline (hSteamLeaderboard: SteamLeaderboard_t, prgUsers: *CSteamID, cUsers: s32, callback: (LeaderboardScoresDownloaded_t, bool) -> ()) {
    RegisterCallResult(
        DownloadLeaderboardEntriesForUsers(hSteamLeaderboard, prgUsers, cUsers),
        callback
    );
}

DownloadLeaderboardEntriesForUsers :: (hSteamLeaderboard: SteamLeaderboard_t, prgUsers: *CSteamID, cUsers: s32, code: Code) #expand {
    RegisterCallResult(
        DownloadLeaderboardEntriesForUsers(hSteamLeaderboard, prgUsers, cUsers),
        (result: LeaderboardScoresDownloaded_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


GetDownloadedLeaderboardEntry :: inline (hSteamLeaderboardEntries: SteamLeaderboardEntries_t, index: s32, pLeaderboardEntry: *LeaderboardEntry_t, pDetails: *int32, cDetailsMax: s32) -> bool {
    return SteamAPI_ISteamUserStats_GetDownloadedLeaderboardEntry(steam_user_stats, hSteamLeaderboardEntries, index, pLeaderboardEntry, pDetails, cDetailsMax);
}


UploadLeaderboardScore :: inline (hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: int32, pScoreDetails: *int32, cScoreDetailsCount: s32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUserStats_UploadLeaderboardScore(steam_user_stats, hSteamLeaderboard, eLeaderboardUploadScoreMethod, nScore, pScoreDetails, cScoreDetailsCount);
}

UploadLeaderboardScore :: inline (hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: int32, pScoreDetails: *int32, cScoreDetailsCount: s32, callback: (LeaderboardScoreUploaded_t, bool) -> ()) {
    RegisterCallResult(
        UploadLeaderboardScore(hSteamLeaderboard, eLeaderboardUploadScoreMethod, nScore, pScoreDetails, cScoreDetailsCount),
        callback
    );
}

UploadLeaderboardScore :: (hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: int32, pScoreDetails: *int32, cScoreDetailsCount: s32, code: Code) #expand {
    RegisterCallResult(
        UploadLeaderboardScore(hSteamLeaderboard, eLeaderboardUploadScoreMethod, nScore, pScoreDetails, cScoreDetailsCount),
        (result: LeaderboardScoreUploaded_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


AttachLeaderboardUGC :: inline (hSteamLeaderboard: SteamLeaderboard_t, hUGC: UGCHandle_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUserStats_AttachLeaderboardUGC(steam_user_stats, hSteamLeaderboard, hUGC);
}

AttachLeaderboardUGC :: inline (hSteamLeaderboard: SteamLeaderboard_t, hUGC: UGCHandle_t, callback: (LeaderboardUGCSet_t, bool) -> ()) {
    RegisterCallResult(
        AttachLeaderboardUGC(hSteamLeaderboard, hUGC),
        callback
    );
}

AttachLeaderboardUGC :: (hSteamLeaderboard: SteamLeaderboard_t, hUGC: UGCHandle_t, code: Code) #expand {
    RegisterCallResult(
        AttachLeaderboardUGC(hSteamLeaderboard, hUGC),
        (result: LeaderboardUGCSet_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


GetNumberOfCurrentPlayers :: inline () -> SteamAPICall_t #must {
    return SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers(steam_user_stats);
}

GetNumberOfCurrentPlayers :: inline (callback: (NumberOfCurrentPlayers_t, bool) -> ()) {
    RegisterCallResult(
        GetNumberOfCurrentPlayers(),
        callback
    );
}

GetNumberOfCurrentPlayers :: (code: Code) #expand {
    RegisterCallResult(
        GetNumberOfCurrentPlayers(),
        (result: NumberOfCurrentPlayers_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


RequestGlobalAchievementPercentages :: inline () -> SteamAPICall_t #must {
    return SteamAPI_ISteamUserStats_RequestGlobalAchievementPercentages(steam_user_stats);
}

RequestGlobalAchievementPercentages :: inline (callback: (GlobalAchievementPercentagesReady_t, bool) -> ()) {
    RegisterCallResult(
        RequestGlobalAchievementPercentages(),
        callback
    );
}

RequestGlobalAchievementPercentages :: (code: Code) #expand {
    RegisterCallResult(
        RequestGlobalAchievementPercentages(),
        (result: GlobalAchievementPercentagesReady_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


GetMostAchievedAchievementInfo :: inline (pchName: *char, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 {
    return SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo(steam_user_stats, pchName, unNameBufLen, pflPercent, pbAchieved);
}


GetNextMostAchievedAchievementInfo :: inline (iIteratorPrevious: s32, pchName: *char, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 {
    return SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo(steam_user_stats, iIteratorPrevious, pchName, unNameBufLen, pflPercent, pbAchieved);
}


GetAchievementAchievedPercent :: inline (pchName: *char, pflPercent: *float) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievementAchievedPercent(steam_user_stats, pchName, pflPercent);
}


RequestGlobalStats :: inline (nHistoryDays: s32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUserStats_RequestGlobalStats(steam_user_stats, nHistoryDays);
}

RequestGlobalStats :: inline (nHistoryDays: s32, callback: (GlobalStatsReceived_t, bool) -> ()) {
    RegisterCallResult(
        RequestGlobalStats(nHistoryDays),
        callback
    );
}

RequestGlobalStats :: (nHistoryDays: s32, code: Code) #expand {
    RegisterCallResult(
        RequestGlobalStats(nHistoryDays),
        (result: GlobalStatsReceived_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


GetGlobalStatInt64 :: inline (pchStatName: *char, pData: *int64) -> bool {
    return SteamAPI_ISteamUserStats_GetGlobalStatInt64(steam_user_stats, pchStatName, pData);
}


GetGlobalStatDouble :: inline (pchStatName: *char, pData: *double) -> bool {
    return SteamAPI_ISteamUserStats_GetGlobalStatDouble(steam_user_stats, pchStatName, pData);
}


GetGlobalStatHistoryInt64 :: inline (pchStatName: *char, pData: *int64, cubData: uint32) -> int32 {
    return SteamAPI_ISteamUserStats_GetGlobalStatHistoryInt64(steam_user_stats, pchStatName, pData, cubData);
}


GetGlobalStatHistoryDouble :: inline (pchStatName: *char, pData: *double, cubData: uint32) -> int32 {
    return SteamAPI_ISteamUserStats_GetGlobalStatHistoryDouble(steam_user_stats, pchStatName, pData, cubData);
}


GetAchievementProgressLimitsInt32 :: inline (pchName: *char, pnMinProgress: *int32, pnMaxProgress: *int32) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievementProgressLimitsInt32(steam_user_stats, pchName, pnMinProgress, pnMaxProgress);
}


GetAchievementProgressLimitsFloat :: inline (pchName: *char, pfMinProgress: *float, pfMaxProgress: *float) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievementProgressLimitsFloat(steam_user_stats, pchName, pfMinProgress, pfMaxProgress);
}
