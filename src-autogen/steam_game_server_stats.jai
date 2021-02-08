steam_game_server_stats : *ISteamGameServerStats;
SteamGameServerStats : SteamGameServerStats_Namespace;


#scope_file


SteamGameServerStats_Namespace :: struct {
    // procs
    RequestUserStats                                   :: SteamGameServerStats_RequestUserStats;
    GetUserStatInt32                                   :: SteamGameServerStats_GetUserStatInt32;
    GetUserStatFloat                                   :: SteamGameServerStats_GetUserStatFloat;
    GetUserAchievement                                 :: SteamGameServerStats_GetUserAchievement;
    SetUserStatInt32                                   :: SteamGameServerStats_SetUserStatInt32;
    SetUserStatFloat                                   :: SteamGameServerStats_SetUserStatFloat;
    UpdateUserAvgRateStat                              :: SteamGameServerStats_UpdateUserAvgRateStat;
    SetUserAchievement                                 :: SteamGameServerStats_SetUserAchievement;
    ClearUserAchievement                               :: SteamGameServerStats_ClearUserAchievement;
    StoreUserStats                                     :: SteamGameServerStats_StoreUserStats;
}


SteamGameServerStats_RequestUserStats :: inline (steamIDUser: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamGameServerStats_RequestUserStats(steam_game_server_stats, steamIDUser);
}


SteamGameServerStats_GetUserStatInt32 :: inline (steamIDUser: uint64_steamid, pchName: *char, pData: *int32) -> bool {
    return SteamAPI_ISteamGameServerStats_GetUserStatInt32(steam_game_server_stats, steamIDUser, pchName, pData);
}


SteamGameServerStats_GetUserStatFloat :: inline (steamIDUser: uint64_steamid, pchName: *char, pData: *float) -> bool {
    return SteamAPI_ISteamGameServerStats_GetUserStatFloat(steam_game_server_stats, steamIDUser, pchName, pData);
}


SteamGameServerStats_GetUserAchievement :: inline (steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool) -> bool {
    return SteamAPI_ISteamGameServerStats_GetUserAchievement(steam_game_server_stats, steamIDUser, pchName, pbAchieved);
}


SteamGameServerStats_SetUserStatInt32 :: inline (steamIDUser: uint64_steamid, pchName: *char, nData: int32) -> bool {
    return SteamAPI_ISteamGameServerStats_SetUserStatInt32(steam_game_server_stats, steamIDUser, pchName, nData);
}


SteamGameServerStats_SetUserStatFloat :: inline (steamIDUser: uint64_steamid, pchName: *char, fData: float) -> bool {
    return SteamAPI_ISteamGameServerStats_SetUserStatFloat(steam_game_server_stats, steamIDUser, pchName, fData);
}


SteamGameServerStats_UpdateUserAvgRateStat :: inline (steamIDUser: uint64_steamid, pchName: *char, flCountThisSession: float, dSessionLength: double) -> bool {
    return SteamAPI_ISteamGameServerStats_UpdateUserAvgRateStat(steam_game_server_stats, steamIDUser, pchName, flCountThisSession, dSessionLength);
}


SteamGameServerStats_SetUserAchievement :: inline (steamIDUser: uint64_steamid, pchName: *char) -> bool {
    return SteamAPI_ISteamGameServerStats_SetUserAchievement(steam_game_server_stats, steamIDUser, pchName);
}


SteamGameServerStats_ClearUserAchievement :: inline (steamIDUser: uint64_steamid, pchName: *char) -> bool {
    return SteamAPI_ISteamGameServerStats_ClearUserAchievement(steam_game_server_stats, steamIDUser, pchName);
}


SteamGameServerStats_StoreUserStats :: inline (steamIDUser: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamGameServerStats_StoreUserStats(steam_game_server_stats, steamIDUser);
}
