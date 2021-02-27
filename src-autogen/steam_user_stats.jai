steam_user_stats : *ISteamUserStats;
SteamUserStats : SteamUserStats_Namespace;


#scope_file


SteamUserStats_Namespace :: struct {
    // procs
    RequestCurrentStats                                :: SteamUserStats_RequestCurrentStats;
    GetStatInt32                                       :: SteamUserStats_GetStatInt32;
    GetStatFloat                                       :: SteamUserStats_GetStatFloat;
    SetStatInt32                                       :: SteamUserStats_SetStatInt32;
    SetStatFloat                                       :: SteamUserStats_SetStatFloat;
    UpdateAvgRateStat                                  :: SteamUserStats_UpdateAvgRateStat;
    GetAchievement                                     :: SteamUserStats_GetAchievement;
    SetAchievement                                     :: SteamUserStats_SetAchievement;
    ClearAchievement                                   :: SteamUserStats_ClearAchievement;
    GetAchievementAndUnlockTime                        :: SteamUserStats_GetAchievementAndUnlockTime;
    StoreStats                                         :: SteamUserStats_StoreStats;
    GetAchievementIcon                                 :: SteamUserStats_GetAchievementIcon;
    GetAchievementDisplayAttribute                     :: SteamUserStats_GetAchievementDisplayAttribute;
    IndicateAchievementProgress                        :: SteamUserStats_IndicateAchievementProgress;
    GetNumAchievements                                 :: SteamUserStats_GetNumAchievements;
    GetAchievementName                                 :: SteamUserStats_GetAchievementName;
    RequestUserStats                                   :: SteamUserStats_RequestUserStats;
    GetUserStatInt32                                   :: SteamUserStats_GetUserStatInt32;
    GetUserStatFloat                                   :: SteamUserStats_GetUserStatFloat;
    GetUserAchievement                                 :: SteamUserStats_GetUserAchievement;
    GetUserAchievementAndUnlockTime                    :: SteamUserStats_GetUserAchievementAndUnlockTime;
    ResetAllStats                                      :: SteamUserStats_ResetAllStats;
    FindOrCreateLeaderboard                            :: SteamUserStats_FindOrCreateLeaderboard;
    FindLeaderboard                                    :: SteamUserStats_FindLeaderboard;
    GetLeaderboardName                                 :: SteamUserStats_GetLeaderboardName;
    GetLeaderboardEntryCount                           :: SteamUserStats_GetLeaderboardEntryCount;
    GetLeaderboardSortMethod                           :: SteamUserStats_GetLeaderboardSortMethod;
    GetLeaderboardDisplayType                          :: SteamUserStats_GetLeaderboardDisplayType;
    DownloadLeaderboardEntries                         :: SteamUserStats_DownloadLeaderboardEntries;
    DownloadLeaderboardEntriesForUsers                 :: SteamUserStats_DownloadLeaderboardEntriesForUsers;
    GetDownloadedLeaderboardEntry                      :: SteamUserStats_GetDownloadedLeaderboardEntry;
    UploadLeaderboardScore                             :: SteamUserStats_UploadLeaderboardScore;
    AttachLeaderboardUGC                               :: SteamUserStats_AttachLeaderboardUGC;
    GetNumberOfCurrentPlayers                          :: SteamUserStats_GetNumberOfCurrentPlayers;
    RequestGlobalAchievementPercentages                :: SteamUserStats_RequestGlobalAchievementPercentages;
    GetMostAchievedAchievementInfo                     :: SteamUserStats_GetMostAchievedAchievementInfo;
    GetNextMostAchievedAchievementInfo                 :: SteamUserStats_GetNextMostAchievedAchievementInfo;
    GetAchievementAchievedPercent                      :: SteamUserStats_GetAchievementAchievedPercent;
    RequestGlobalStats                                 :: SteamUserStats_RequestGlobalStats;
    GetGlobalStatInt64                                 :: SteamUserStats_GetGlobalStatInt64;
    GetGlobalStatDouble                                :: SteamUserStats_GetGlobalStatDouble;
    GetGlobalStatHistoryInt64                          :: SteamUserStats_GetGlobalStatHistoryInt64;
    GetGlobalStatHistoryDouble                         :: SteamUserStats_GetGlobalStatHistoryDouble;
    GetAchievementProgressLimitsInt32                  :: SteamUserStats_GetAchievementProgressLimitsInt32;
    GetAchievementProgressLimitsFloat                  :: SteamUserStats_GetAchievementProgressLimitsFloat;
}


SteamUserStats_RequestCurrentStats :: inline () -> bool {
    return SteamAPI_ISteamUserStats_RequestCurrentStats(steam_user_stats);
}


SteamUserStats_GetStatInt32 :: inline (pchName: *char, pData: *int32) -> bool {
    return SteamAPI_ISteamUserStats_GetStatInt32(steam_user_stats, pchName, pData);
}


SteamUserStats_GetStatFloat :: inline (pchName: *char, pData: *float) -> bool {
    return SteamAPI_ISteamUserStats_GetStatFloat(steam_user_stats, pchName, pData);
}


SteamUserStats_SetStatInt32 :: inline (pchName: *char, nData: int32) -> bool {
    return SteamAPI_ISteamUserStats_SetStatInt32(steam_user_stats, pchName, nData);
}


SteamUserStats_SetStatFloat :: inline (pchName: *char, fData: float) -> bool {
    return SteamAPI_ISteamUserStats_SetStatFloat(steam_user_stats, pchName, fData);
}


SteamUserStats_UpdateAvgRateStat :: inline (pchName: *char, flCountThisSession: float, dSessionLength: double) -> bool {
    return SteamAPI_ISteamUserStats_UpdateAvgRateStat(steam_user_stats, pchName, flCountThisSession, dSessionLength);
}


SteamUserStats_GetAchievement :: inline (pchName: *char, pbAchieved: *bool) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievement(steam_user_stats, pchName, pbAchieved);
}


SteamUserStats_SetAchievement :: inline (pchName: *char) -> bool {
    return SteamAPI_ISteamUserStats_SetAchievement(steam_user_stats, pchName);
}


SteamUserStats_ClearAchievement :: inline (pchName: *char) -> bool {
    return SteamAPI_ISteamUserStats_ClearAchievement(steam_user_stats, pchName);
}


SteamUserStats_GetAchievementAndUnlockTime :: inline (pchName: *char, pbAchieved: *bool, punUnlockTime: *uint32) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievementAndUnlockTime(steam_user_stats, pchName, pbAchieved, punUnlockTime);
}


SteamUserStats_StoreStats :: inline () -> bool {
    return SteamAPI_ISteamUserStats_StoreStats(steam_user_stats);
}


SteamUserStats_GetAchievementIcon :: inline (pchName: *char) -> s32 {
    return SteamAPI_ISteamUserStats_GetAchievementIcon(steam_user_stats, pchName);
}


SteamUserStats_GetAchievementDisplayAttribute :: inline (pchName: *char, pchKey: *char) -> string {
    return to_string(SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute(steam_user_stats, pchName, pchKey));
}


SteamUserStats_IndicateAchievementProgress :: inline (pchName: *char, nCurProgress: uint32, nMaxProgress: uint32) -> bool {
    return SteamAPI_ISteamUserStats_IndicateAchievementProgress(steam_user_stats, pchName, nCurProgress, nMaxProgress);
}


SteamUserStats_GetNumAchievements :: inline () -> uint32 {
    return SteamAPI_ISteamUserStats_GetNumAchievements(steam_user_stats);
}


SteamUserStats_GetAchievementName :: inline (iAchievement: uint32) -> string {
    return to_string(SteamAPI_ISteamUserStats_GetAchievementName(steam_user_stats, iAchievement));
}


SteamUserStats_RequestUserStats :: inline (steamIDUser: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_RequestUserStats(steam_user_stats, steamIDUser);
}


SteamUserStats_GetUserStatInt32 :: inline (steamIDUser: uint64_steamid, pchName: *char, pData: *int32) -> bool {
    return SteamAPI_ISteamUserStats_GetUserStatInt32(steam_user_stats, steamIDUser, pchName, pData);
}


SteamUserStats_GetUserStatFloat :: inline (steamIDUser: uint64_steamid, pchName: *char, pData: *float) -> bool {
    return SteamAPI_ISteamUserStats_GetUserStatFloat(steam_user_stats, steamIDUser, pchName, pData);
}


SteamUserStats_GetUserAchievement :: inline (steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool) -> bool {
    return SteamAPI_ISteamUserStats_GetUserAchievement(steam_user_stats, steamIDUser, pchName, pbAchieved);
}


SteamUserStats_GetUserAchievementAndUnlockTime :: inline (steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool, punUnlockTime: *uint32) -> bool {
    return SteamAPI_ISteamUserStats_GetUserAchievementAndUnlockTime(steam_user_stats, steamIDUser, pchName, pbAchieved, punUnlockTime);
}


SteamUserStats_ResetAllStats :: inline (bAchievementsToo: bool) -> bool {
    return SteamAPI_ISteamUserStats_ResetAllStats(steam_user_stats, bAchievementsToo);
}


SteamUserStats_FindOrCreateLeaderboard :: inline (pchLeaderboardName: *char, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_FindOrCreateLeaderboard(steam_user_stats, pchLeaderboardName, eLeaderboardSortMethod, eLeaderboardDisplayType);
}


SteamUserStats_FindLeaderboard :: inline (pchLeaderboardName: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_FindLeaderboard(steam_user_stats, pchLeaderboardName);
}


SteamUserStats_GetLeaderboardName :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> string {
    return to_string(SteamAPI_ISteamUserStats_GetLeaderboardName(steam_user_stats, hSteamLeaderboard));
}


SteamUserStats_GetLeaderboardEntryCount :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> s32 {
    return SteamAPI_ISteamUserStats_GetLeaderboardEntryCount(steam_user_stats, hSteamLeaderboard);
}


SteamUserStats_GetLeaderboardSortMethod :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardSortMethod {
    return SteamAPI_ISteamUserStats_GetLeaderboardSortMethod(steam_user_stats, hSteamLeaderboard);
}


SteamUserStats_GetLeaderboardDisplayType :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardDisplayType {
    return SteamAPI_ISteamUserStats_GetLeaderboardDisplayType(steam_user_stats, hSteamLeaderboard);
}


SteamUserStats_DownloadLeaderboardEntries :: inline (hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: s32, nRangeEnd: s32) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_DownloadLeaderboardEntries(steam_user_stats, hSteamLeaderboard, eLeaderboardDataRequest, nRangeStart, nRangeEnd);
}


SteamUserStats_DownloadLeaderboardEntriesForUsers :: inline (hSteamLeaderboard: SteamLeaderboard_t, prgUsers: *CSteamID, cUsers: s32) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_DownloadLeaderboardEntriesForUsers(steam_user_stats, hSteamLeaderboard, prgUsers, cUsers);
}


SteamUserStats_GetDownloadedLeaderboardEntry :: inline (hSteamLeaderboardEntries: SteamLeaderboardEntries_t, index: s32, pLeaderboardEntry: *LeaderboardEntry_t, pDetails: *int32, cDetailsMax: s32) -> bool {
    return SteamAPI_ISteamUserStats_GetDownloadedLeaderboardEntry(steam_user_stats, hSteamLeaderboardEntries, index, pLeaderboardEntry, pDetails, cDetailsMax);
}


SteamUserStats_UploadLeaderboardScore :: inline (hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: int32, pScoreDetails: *int32, cScoreDetailsCount: s32) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_UploadLeaderboardScore(steam_user_stats, hSteamLeaderboard, eLeaderboardUploadScoreMethod, nScore, pScoreDetails, cScoreDetailsCount);
}


SteamUserStats_AttachLeaderboardUGC :: inline (hSteamLeaderboard: SteamLeaderboard_t, hUGC: UGCHandle_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_AttachLeaderboardUGC(steam_user_stats, hSteamLeaderboard, hUGC);
}


SteamUserStats_GetNumberOfCurrentPlayers :: inline () -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers(steam_user_stats);
}


SteamUserStats_RequestGlobalAchievementPercentages :: inline () -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_RequestGlobalAchievementPercentages(steam_user_stats);
}


SteamUserStats_GetMostAchievedAchievementInfo :: inline (pchName: *char, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 {
    return SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo(steam_user_stats, pchName, unNameBufLen, pflPercent, pbAchieved);
}


SteamUserStats_GetNextMostAchievedAchievementInfo :: inline (iIteratorPrevious: s32, pchName: *char, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 {
    return SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo(steam_user_stats, iIteratorPrevious, pchName, unNameBufLen, pflPercent, pbAchieved);
}


SteamUserStats_GetAchievementAchievedPercent :: inline (pchName: *char, pflPercent: *float) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievementAchievedPercent(steam_user_stats, pchName, pflPercent);
}


SteamUserStats_RequestGlobalStats :: inline (nHistoryDays: s32) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_RequestGlobalStats(steam_user_stats, nHistoryDays);
}


SteamUserStats_GetGlobalStatInt64 :: inline (pchStatName: *char, pData: *int64) -> bool {
    return SteamAPI_ISteamUserStats_GetGlobalStatInt64(steam_user_stats, pchStatName, pData);
}


SteamUserStats_GetGlobalStatDouble :: inline (pchStatName: *char, pData: *double) -> bool {
    return SteamAPI_ISteamUserStats_GetGlobalStatDouble(steam_user_stats, pchStatName, pData);
}


SteamUserStats_GetGlobalStatHistoryInt64 :: inline (pchStatName: *char, pData: *int64, cubData: uint32) -> int32 {
    return SteamAPI_ISteamUserStats_GetGlobalStatHistoryInt64(steam_user_stats, pchStatName, pData, cubData);
}


SteamUserStats_GetGlobalStatHistoryDouble :: inline (pchStatName: *char, pData: *double, cubData: uint32) -> int32 {
    return SteamAPI_ISteamUserStats_GetGlobalStatHistoryDouble(steam_user_stats, pchStatName, pData, cubData);
}


SteamUserStats_GetAchievementProgressLimitsInt32 :: inline (pchName: *char, pnMinProgress: *int32, pnMaxProgress: *int32) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievementProgressLimitsInt32(steam_user_stats, pchName, pnMinProgress, pnMaxProgress);
}


SteamUserStats_GetAchievementProgressLimitsFloat :: inline (pchName: *char, pfMinProgress: *float, pfMaxProgress: *float) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievementProgressLimitsFloat(steam_user_stats, pchName, pfMinProgress, pfMaxProgress);
}
