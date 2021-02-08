steam_user_stats : *ISteamUserStats;

SteamUserStats : SteamUserStats_Namespace;


#scope_file


SteamUserStats_Namespace :: struct {
    // procs
                :: SteamUserStats_RequestCurrentStats
                       :: SteamUserStats_GetStatInt32
                       :: SteamUserStats_GetStatFloat
                       :: SteamUserStats_SetStatInt32
                       :: SteamUserStats_SetStatFloat
                  :: SteamUserStats_UpdateAvgRateStat
                     :: SteamUserStats_GetAchievement
                     :: SteamUserStats_SetAchievement
                   :: SteamUserStats_ClearAchievement
        :: SteamUserStats_GetAchievementAndUnlockTime
                         :: SteamUserStats_StoreStats
                 :: SteamUserStats_GetAchievementIcon
     :: SteamUserStats_GetAchievementDisplayAttribute
        :: SteamUserStats_IndicateAchievementProgress
                 :: SteamUserStats_GetNumAchievements
                 :: SteamUserStats_GetAchievementName
                   :: SteamUserStats_RequestUserStats
                   :: SteamUserStats_GetUserStatInt32
                   :: SteamUserStats_GetUserStatFloat
                 :: SteamUserStats_GetUserAchievement
    :: SteamUserStats_GetUserAchievementAndUnlockTime
                      :: SteamUserStats_ResetAllStats
            :: SteamUserStats_FindOrCreateLeaderboard
                    :: SteamUserStats_FindLeaderboard
                 :: SteamUserStats_GetLeaderboardName
           :: SteamUserStats_GetLeaderboardEntryCount
           :: SteamUserStats_GetLeaderboardSortMethod
          :: SteamUserStats_GetLeaderboardDisplayType
         :: SteamUserStats_DownloadLeaderboardEntries
    :: SteamUserStats_DownloadLeaderboardEntriesForUsers
      :: SteamUserStats_GetDownloadedLeaderboardEntry
             :: SteamUserStats_UploadLeaderboardScore
               :: SteamUserStats_AttachLeaderboardUGC
          :: SteamUserStats_GetNumberOfCurrentPlayers
    :: SteamUserStats_RequestGlobalAchievementPercentages
     :: SteamUserStats_GetMostAchievedAchievementInfo
    :: SteamUserStats_GetNextMostAchievedAchievementInfo
      :: SteamUserStats_GetAchievementAchievedPercent
                 :: SteamUserStats_RequestGlobalStats
                 :: SteamUserStats_GetGlobalStatInt64
                :: SteamUserStats_GetGlobalStatDouble
          :: SteamUserStats_GetGlobalStatHistoryInt64
         :: SteamUserStats_GetGlobalStatHistoryDouble
    :: SteamUserStats_GetAchievementProgressLimitsInt32
    :: SteamUserStats_GetAchievementProgressLimitsFloat
}


SteamUserStats_RequestCurrentStats :: inline () -> bool {
    return SteamAPI_ISteamUserStats_RequestCurrentStats(steam_user_stats);
}


SteamUserStats_GetStatInt32 :: inline (pchName: *char, pData: *int32) -> bool {
    return SteamAPI_ISteamUserStats_GetStatInt32(steam_user_stats, pchName: *char, pData: *int32);
}


SteamUserStats_GetStatFloat :: inline (pchName: *char, pData: *float) -> bool {
    return SteamAPI_ISteamUserStats_GetStatFloat(steam_user_stats, pchName: *char, pData: *float);
}


SteamUserStats_SetStatInt32 :: inline (pchName: *char, nData: int32) -> bool {
    return SteamAPI_ISteamUserStats_SetStatInt32(steam_user_stats, pchName: *char, nData: int32);
}


SteamUserStats_SetStatFloat :: inline (pchName: *char, fData: float) -> bool {
    return SteamAPI_ISteamUserStats_SetStatFloat(steam_user_stats, pchName: *char, fData: float);
}


SteamUserStats_UpdateAvgRateStat :: inline (pchName: *char, flCountThisSession: float, dSessionLength: double) -> bool {
    return SteamAPI_ISteamUserStats_UpdateAvgRateStat(steam_user_stats, pchName: *char, flCountThisSession: float, dSessionLength: double);
}


SteamUserStats_GetAchievement :: inline (pchName: *char, pbAchieved: *bool) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievement(steam_user_stats, pchName: *char, pbAchieved: *bool);
}


SteamUserStats_SetAchievement :: inline (pchName: *char) -> bool {
    return SteamAPI_ISteamUserStats_SetAchievement(steam_user_stats, pchName: *char);
}


SteamUserStats_ClearAchievement :: inline (pchName: *char) -> bool {
    return SteamAPI_ISteamUserStats_ClearAchievement(steam_user_stats, pchName: *char);
}


SteamUserStats_GetAchievementAndUnlockTime :: inline (pchName: *char, pbAchieved: *bool, punUnlockTime: *uint32) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievementAndUnlockTime(steam_user_stats, pchName: *char, pbAchieved: *bool, punUnlockTime: *uint32);
}


SteamUserStats_StoreStats :: inline () -> bool {
    return SteamAPI_ISteamUserStats_StoreStats(steam_user_stats);
}


SteamUserStats_GetAchievementIcon :: inline (pchName: *char) -> s32 {
    return SteamAPI_ISteamUserStats_GetAchievementIcon(steam_user_stats, pchName: *char);
}


SteamUserStats_GetAchievementDisplayAttribute :: inline (pchName: *char, pchKey: *char) -> *char {
    return SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute(steam_user_stats, pchName: *char, pchKey: *char);
}


SteamUserStats_IndicateAchievementProgress :: inline (pchName: *char, nCurProgress: uint32, nMaxProgress: uint32) -> bool {
    return SteamAPI_ISteamUserStats_IndicateAchievementProgress(steam_user_stats, pchName: *char, nCurProgress: uint32, nMaxProgress: uint32);
}


SteamUserStats_GetNumAchievements :: inline () -> uint32 {
    return SteamAPI_ISteamUserStats_GetNumAchievements(steam_user_stats);
}


SteamUserStats_GetAchievementName :: inline (iAchievement: uint32) -> *char {
    return SteamAPI_ISteamUserStats_GetAchievementName(steam_user_stats, iAchievement: uint32);
}


SteamUserStats_RequestUserStats :: inline (steamIDUser: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_RequestUserStats(steam_user_stats, steamIDUser: uint64_steamid);
}


SteamUserStats_GetUserStatInt32 :: inline (steamIDUser: uint64_steamid, pchName: *char, pData: *int32) -> bool {
    return SteamAPI_ISteamUserStats_GetUserStatInt32(steam_user_stats, steamIDUser: uint64_steamid, pchName: *char, pData: *int32);
}


SteamUserStats_GetUserStatFloat :: inline (steamIDUser: uint64_steamid, pchName: *char, pData: *float) -> bool {
    return SteamAPI_ISteamUserStats_GetUserStatFloat(steam_user_stats, steamIDUser: uint64_steamid, pchName: *char, pData: *float);
}


SteamUserStats_GetUserAchievement :: inline (steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool) -> bool {
    return SteamAPI_ISteamUserStats_GetUserAchievement(steam_user_stats, steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool);
}


SteamUserStats_GetUserAchievementAndUnlockTime :: inline (steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool, punUnlockTime: *uint32) -> bool {
    return SteamAPI_ISteamUserStats_GetUserAchievementAndUnlockTime(steam_user_stats, steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool, punUnlockTime: *uint32);
}


SteamUserStats_ResetAllStats :: inline (bAchievementsToo: bool) -> bool {
    return SteamAPI_ISteamUserStats_ResetAllStats(steam_user_stats, bAchievementsToo: bool);
}


SteamUserStats_FindOrCreateLeaderboard :: inline (pchLeaderboardName: *char, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_FindOrCreateLeaderboard(steam_user_stats, pchLeaderboardName: *char, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType);
}


SteamUserStats_FindLeaderboard :: inline (pchLeaderboardName: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_FindLeaderboard(steam_user_stats, pchLeaderboardName: *char);
}


SteamUserStats_GetLeaderboardName :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> *char {
    return SteamAPI_ISteamUserStats_GetLeaderboardName(steam_user_stats, hSteamLeaderboard: SteamLeaderboard_t);
}


SteamUserStats_GetLeaderboardEntryCount :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> s32 {
    return SteamAPI_ISteamUserStats_GetLeaderboardEntryCount(steam_user_stats, hSteamLeaderboard: SteamLeaderboard_t);
}


SteamUserStats_GetLeaderboardSortMethod :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardSortMethod {
    return SteamAPI_ISteamUserStats_GetLeaderboardSortMethod(steam_user_stats, hSteamLeaderboard: SteamLeaderboard_t);
}


SteamUserStats_GetLeaderboardDisplayType :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardDisplayType {
    return SteamAPI_ISteamUserStats_GetLeaderboardDisplayType(steam_user_stats, hSteamLeaderboard: SteamLeaderboard_t);
}


SteamUserStats_DownloadLeaderboardEntries :: inline (hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: s32, nRangeEnd: s32) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_DownloadLeaderboardEntries(steam_user_stats, hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: s32, nRangeEnd: s32);
}


SteamUserStats_DownloadLeaderboardEntriesForUsers :: inline (hSteamLeaderboard: SteamLeaderboard_t, prgUsers: *CSteamID, cUsers: s32) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_DownloadLeaderboardEntriesForUsers(steam_user_stats, hSteamLeaderboard: SteamLeaderboard_t, prgUsers: *CSteamID, cUsers: s32);
}


SteamUserStats_GetDownloadedLeaderboardEntry :: inline (hSteamLeaderboardEntries: SteamLeaderboardEntries_t, index: s32, pLeaderboardEntry: *LeaderboardEntry_t, pDetails: *int32, cDetailsMax: s32) -> bool {
    return SteamAPI_ISteamUserStats_GetDownloadedLeaderboardEntry(steam_user_stats, hSteamLeaderboardEntries: SteamLeaderboardEntries_t, index: s32, pLeaderboardEntry: *LeaderboardEntry_t, pDetails: *int32, cDetailsMax: s32);
}


SteamUserStats_UploadLeaderboardScore :: inline (hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: int32, pScoreDetails: *int32, cScoreDetailsCount: s32) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_UploadLeaderboardScore(steam_user_stats, hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: int32, pScoreDetails: *int32, cScoreDetailsCount: s32);
}


SteamUserStats_AttachLeaderboardUGC :: inline (hSteamLeaderboard: SteamLeaderboard_t, hUGC: UGCHandle_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_AttachLeaderboardUGC(steam_user_stats, hSteamLeaderboard: SteamLeaderboard_t, hUGC: UGCHandle_t);
}


SteamUserStats_GetNumberOfCurrentPlayers :: inline () -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers(steam_user_stats);
}


SteamUserStats_RequestGlobalAchievementPercentages :: inline () -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_RequestGlobalAchievementPercentages(steam_user_stats);
}


SteamUserStats_GetMostAchievedAchievementInfo :: inline (pchName: *char, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 {
    return SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo(steam_user_stats, pchName: *char, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool);
}


SteamUserStats_GetNextMostAchievedAchievementInfo :: inline (iIteratorPrevious: s32, pchName: *char, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 {
    return SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo(steam_user_stats, iIteratorPrevious: s32, pchName: *char, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool);
}


SteamUserStats_GetAchievementAchievedPercent :: inline (pchName: *char, pflPercent: *float) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievementAchievedPercent(steam_user_stats, pchName: *char, pflPercent: *float);
}


SteamUserStats_RequestGlobalStats :: inline (nHistoryDays: s32) -> SteamAPICall_t {
    return SteamAPI_ISteamUserStats_RequestGlobalStats(steam_user_stats, nHistoryDays: s32);
}


SteamUserStats_GetGlobalStatInt64 :: inline (pchStatName: *char, pData: *int64) -> bool {
    return SteamAPI_ISteamUserStats_GetGlobalStatInt64(steam_user_stats, pchStatName: *char, pData: *int64);
}


SteamUserStats_GetGlobalStatDouble :: inline (pchStatName: *char, pData: *double) -> bool {
    return SteamAPI_ISteamUserStats_GetGlobalStatDouble(steam_user_stats, pchStatName: *char, pData: *double);
}


SteamUserStats_GetGlobalStatHistoryInt64 :: inline (pchStatName: *char, pData: *int64, cubData: uint32) -> int32 {
    return SteamAPI_ISteamUserStats_GetGlobalStatHistoryInt64(steam_user_stats, pchStatName: *char, pData: *int64, cubData: uint32);
}


SteamUserStats_GetGlobalStatHistoryDouble :: inline (pchStatName: *char, pData: *double, cubData: uint32) -> int32 {
    return SteamAPI_ISteamUserStats_GetGlobalStatHistoryDouble(steam_user_stats, pchStatName: *char, pData: *double, cubData: uint32);
}


SteamUserStats_GetAchievementProgressLimitsInt32 :: inline (pchName: *char, pnMinProgress: *int32, pnMaxProgress: *int32) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievementProgressLimitsInt32(steam_user_stats, pchName: *char, pnMinProgress: *int32, pnMaxProgress: *int32);
}


SteamUserStats_GetAchievementProgressLimitsFloat :: inline (pchName: *char, pfMinProgress: *float, pfMaxProgress: *float) -> bool {
    return SteamAPI_ISteamUserStats_GetAchievementProgressLimitsFloat(steam_user_stats, pchName: *char, pfMinProgress: *float, pfMaxProgress: *float);
}
