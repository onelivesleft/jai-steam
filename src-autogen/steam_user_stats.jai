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


SteamUserStats_RequestCurrentStats :: inline () -> bool #foreign steam "SteamAPI_ISteamUserStats_Reque {
    return SteamUserStats_RequestCurrentStats(steam_user_stats);
}


SteamUserStats_GetStatInt32 :: inline (pchName: *char, pData: *int32) -> bool #foreign steam "SteamAPI_ISteamUserStat {
    return SteamUserStats_GetStatInt32(steam_user_stats, pchName, pData);
}


SteamUserStats_GetStatFloat :: inline (pchName: *char, pData: *float) -> bool #foreign steam "SteamAPI_ISteamUserStat {
    return SteamUserStats_GetStatFloat(steam_user_stats, pchName, pData);
}


SteamUserStats_SetStatInt32 :: inline (pchName: *char, nData: int32) -> bool #foreign steam "SteamAPI_ISteamUserStat {
    return SteamUserStats_SetStatInt32(steam_user_stats, pchName, nData);
}


SteamUserStats_SetStatFloat :: inline (pchName: *char, fData: float) -> bool #foreign steam "SteamAPI_ISteamUserStat {
    return SteamUserStats_SetStatFloat(steam_user_stats, pchName, fData);
}


SteamUserStats_UpdateAvgRateStat :: inline (pchName: *char, flCountThisSession: float, dSessionLength: double) -> bool #foreign steam "SteamAPI_ISteamUserStats_Upd {
    return SteamUserStats_UpdateAvgRateStat(steam_user_stats, pchName, flCountThisSession, dSessionLength);
}


SteamUserStats_GetAchievement :: inline (pchName: *char, pbAchieved: *bool) -> bool #foreign steam "SteamAPI_ISteamUserStats_ {
    return SteamUserStats_GetAchievement(steam_user_stats, pchName, pbAchieved);
}


SteamUserStats_SetAchievement :: inline (pchName: *char) -> bool #foreign steam "SteamAPI_ISteamUserStats_ {
    return SteamUserStats_SetAchievement(steam_user_stats, pchName);
}


SteamUserStats_ClearAchievement :: inline (pchName: *char) -> bool #foreign steam "SteamAPI_ISteamUserStats_Cl {
    return SteamUserStats_ClearAchievement(steam_user_stats, pchName);
}


SteamUserStats_GetAchievementAndUnlockTime :: inline (pchName: *char, pbAchieved: *bool, punUnlockTime: *uint32) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetAchievemen {
    return SteamUserStats_GetAchievementAndUnlockTime(steam_user_stats, pchName, pbAchieved, punUnlockTime);
}


SteamUserStats_StoreStats :: inline () -> bool #foreign steam "SteamAPI_ISteamUserSt {
    return SteamUserStats_StoreStats(steam_user_stats);
}


SteamUserStats_GetAchievementIcon :: inline (pchName: *char) -> s32 #foreign steam "SteamAPI_ISteamUserStats_GetA {
    return SteamUserStats_GetAchievementIcon(steam_user_stats, pchName);
}


SteamUserStats_GetAchievementDisplayAttribute :: inline (pchName: *char, pchKey: *char) -> *char #foreign steam "SteamAPI_ISteamUserStats_GetAchievementDi {
    return SteamUserStats_GetAchievementDisplayAttribute(steam_user_stats, pchName, pchKey);
}


SteamUserStats_IndicateAchievementProgress :: inline (pchName: *char, nCurProgress: uint32, nMaxProgress: uint32) -> bool #foreign steam "SteamAPI_ISteamUserStats_IndicateAchie {
    return SteamUserStats_IndicateAchievementProgress(steam_user_stats, pchName, nCurProgress, nMaxProgress);
}


SteamUserStats_GetNumAchievements :: inline () -> uint32 #foreign steam "SteamAPI_ISteamUserStats_GetN {
    return SteamUserStats_GetNumAchievements(steam_user_stats);
}


SteamUserStats_GetAchievementName :: inline (iAchievement: uint32) -> *char #foreign steam "SteamAPI_ISteamUserStats_GetA {
    return SteamUserStats_GetAchievementName(steam_user_stats, iAchievement);
}


SteamUserStats_RequestUserStats :: inline (steamIDUser: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_Re {
    return SteamUserStats_RequestUserStats(steam_user_stats, steamIDUser);
}


SteamUserStats_GetUserStatInt32 :: inline (steamIDUser: uint64_steamid, pchName: *char, pData: *int32) -> bool #foreign steam "SteamAPI_ISteamUserStats_Ge {
    return SteamUserStats_GetUserStatInt32(steam_user_stats, steamIDUser, pchName, pData);
}


SteamUserStats_GetUserStatFloat :: inline (steamIDUser: uint64_steamid, pchName: *char, pData: *float) -> bool #foreign steam "SteamAPI_ISteamUserStats_Ge {
    return SteamUserStats_GetUserStatFloat(steam_user_stats, steamIDUser, pchName, pData);
}


SteamUserStats_GetUserAchievement :: inline (steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetU {
    return SteamUserStats_GetUserAchievement(steam_user_stats, steamIDUser, pchName, pbAchieved);
}


SteamUserStats_GetUserAchievementAndUnlockTime :: inline (steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool, punUnlockTime: *uint32) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetUserAchievemen {
    return SteamUserStats_GetUserAchievementAndUnlockTime(steam_user_stats, steamIDUser, pchName, pbAchieved, punUnlockTime);
}


SteamUserStats_ResetAllStats :: inline (bAchievementsToo: bool) -> bool #foreign steam "SteamAPI_ISteamUserStats {
    return SteamUserStats_ResetAllStats(steam_user_stats, bAchievementsToo);
}


SteamUserStats_FindOrCreateLeaderboard :: inline (pchLeaderboardName: *char, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_FindOrCre {
    return SteamUserStats_FindOrCreateLeaderboard(steam_user_stats, pchLeaderboardName, eLeaderboardSortMethod, eLeaderboardDisplayType);
}


SteamUserStats_FindLeaderboard :: inline (pchLeaderboardName: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_F {
    return SteamUserStats_FindLeaderboard(steam_user_stats, pchLeaderboardName);
}


SteamUserStats_GetLeaderboardName :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> *char #foreign steam "SteamAPI_ISteamUserStats_GetL {
    return SteamUserStats_GetLeaderboardName(steam_user_stats, hSteamLeaderboard);
}


SteamUserStats_GetLeaderboardEntryCount :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> s32 #foreign steam "SteamAPI_ISteamUserStats_GetLeaderb {
    return SteamUserStats_GetLeaderboardEntryCount(steam_user_stats, hSteamLeaderboard);
}


SteamUserStats_GetLeaderboardSortMethod :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardSortMethod #foreign steam "SteamAPI_ISteamUserStats_GetLeaderb {
    return SteamUserStats_GetLeaderboardSortMethod(steam_user_stats, hSteamLeaderboard);
}


SteamUserStats_GetLeaderboardDisplayType :: inline (hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardDisplayType #foreign steam "SteamAPI_ISteamUserStats_GetLeaderbo {
    return SteamUserStats_GetLeaderboardDisplayType(steam_user_stats, hSteamLeaderboard);
}


SteamUserStats_DownloadLeaderboardEntries :: inline (hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: s32, nRangeEnd: s32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_DownloadLead {
    return SteamUserStats_DownloadLeaderboardEntries(steam_user_stats, hSteamLeaderboard, eLeaderboardDataRequest, nRangeStart, nRangeEnd);
}


SteamUserStats_DownloadLeaderboardEntriesForUsers :: inline (hSteamLeaderboard: SteamLeaderboard_t, prgUsers: *CSteamID, cUsers: s32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_DownloadLeaderboardE {
    return SteamUserStats_DownloadLeaderboardEntriesForUsers(steam_user_stats, hSteamLeaderboard, prgUsers, cUsers);
}


SteamUserStats_GetDownloadedLeaderboardEntry :: inline (hSteamLeaderboardEntries: SteamLeaderboardEntries_t, index: s32, pLeaderboardEntry: *LeaderboardEntry_t, pDetails: *int32, cDetailsMax: s32) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetDownloadedLe {
    return SteamUserStats_GetDownloadedLeaderboardEntry(steam_user_stats, hSteamLeaderboardEntries, index, pLeaderboardEntry, pDetails, cDetailsMax);
}


SteamUserStats_UploadLeaderboardScore :: inline (hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: int32, pScoreDetails: *int32, cScoreDetailsCount: s32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_UploadLe {
    return SteamUserStats_UploadLeaderboardScore(steam_user_stats, hSteamLeaderboard, eLeaderboardUploadScoreMethod, nScore, pScoreDetails, cScoreDetailsCount);
}


SteamUserStats_AttachLeaderboardUGC :: inline (hSteamLeaderboard: SteamLeaderboard_t, hUGC: UGCHandle_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_Attach {
    return SteamUserStats_AttachLeaderboardUGC(steam_user_stats, hSteamLeaderboard, hUGC);
}


SteamUserStats_GetNumberOfCurrentPlayers :: inline () -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_GetNumberOf {
    return SteamUserStats_GetNumberOfCurrentPlayers(steam_user_stats);
}


SteamUserStats_RequestGlobalAchievementPercentages :: inline () -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_RequestGlobalAchievem {
    return SteamUserStats_RequestGlobalAchievementPercentages(steam_user_stats);
}


SteamUserStats_GetMostAchievedAchievementInfo :: inline (pchName: *char, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 #foreign steam "SteamAPI_ISteamUserStats_GetMostAchievedA {
    return SteamUserStats_GetMostAchievedAchievementInfo(steam_user_stats, pchName, unNameBufLen, pflPercent, pbAchieved);
}


SteamUserStats_GetNextMostAchievedAchievementInfo :: inline (iIteratorPrevious: s32, pchName: *char, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 #foreign steam "SteamAPI_ISteamUserStats_GetNextMostAchievedA {
    return SteamUserStats_GetNextMostAchievedAchievementInfo(steam_user_stats, iIteratorPrevious, pchName, unNameBufLen, pflPercent, pbAchieved);
}


SteamUserStats_GetAchievementAchievedPercent :: inline (pchName: *char, pflPercent: *float) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetAchievementA {
    return SteamUserStats_GetAchievementAchievedPercent(steam_user_stats, pchName, pflPercent);
}


SteamUserStats_RequestGlobalStats :: inline (nHistoryDays: s32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_Requ {
    return SteamUserStats_RequestGlobalStats(steam_user_stats, nHistoryDays);
}


SteamUserStats_GetGlobalStatInt64 :: inline (pchStatName: *char, pData: *int64) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetG {
    return SteamUserStats_GetGlobalStatInt64(steam_user_stats, pchStatName, pData);
}


SteamUserStats_GetGlobalStatDouble :: inline (pchStatName: *char, pData: *double) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetGl {
    return SteamUserStats_GetGlobalStatDouble(steam_user_stats, pchStatName, pData);
}


SteamUserStats_GetGlobalStatHistoryInt64 :: inline (pchStatName: *char, pData: *int64, cubData: uint32) -> int32 #foreign steam "SteamAPI_ISteamUserStats_GetGlobalSt {
    return SteamUserStats_GetGlobalStatHistoryInt64(steam_user_stats, pchStatName, pData, cubData);
}


SteamUserStats_GetGlobalStatHistoryDouble :: inline (pchStatName: *char, pData: *double, cubData: uint32) -> int32 #foreign steam "SteamAPI_ISteamUserStats_GetGlobalSta {
    return SteamUserStats_GetGlobalStatHistoryDouble(steam_user_stats, pchStatName, pData, cubData);
}


SteamUserStats_GetAchievementProgressLimitsInt32 :: inline (pchName: *char, pnMinProgress: *int32, pnMaxProgress: *int32) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetAchievementProgr {
    return SteamUserStats_GetAchievementProgressLimitsInt32(steam_user_stats, pchName, pnMinProgress, pnMaxProgress);
}


SteamUserStats_GetAchievementProgressLimitsFloat :: inline (pchName: *char, pfMinProgress: *float, pfMaxProgress: *float) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetAchievementProgr {
    return SteamUserStats_GetAchievementProgressLimitsFloat(steam_user_stats, pchName, pfMinProgress, pfMaxProgress);
}
