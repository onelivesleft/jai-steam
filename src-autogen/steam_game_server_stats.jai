steam_game_server_stats : *ISteamGameServerStats;


ServerRequestUserStats :: inline (steamIDUser: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamGameServerStats_RequestUserStats(steam_game_server_stats, steamIDUser);
}

ServerRequestUserStats :: inline (steamIDUser: uint64_steamid, callback: (GSStatsReceived_t, bool) -> ()) {
    RegisterCallResult(
        ServerRequestUserStats(steamIDUser),
        callback
    );
}

ServerRequestUserStats :: (steamIDUser: uint64_steamid, code: Code) #expand {
    RegisterCallResult(
        ServerRequestUserStats(steamIDUser),
        (result: GSStatsReceived_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


ServerGetUserStatInt32 :: inline (steamIDUser: uint64_steamid, pchName: *char, pData: *int32) -> bool {
    return SteamAPI_ISteamGameServerStats_GetUserStatInt32(steam_game_server_stats, steamIDUser, pchName, pData);
}


ServerGetUserStatFloat :: inline (steamIDUser: uint64_steamid, pchName: *char, pData: *float) -> bool {
    return SteamAPI_ISteamGameServerStats_GetUserStatFloat(steam_game_server_stats, steamIDUser, pchName, pData);
}


ServerGetUserAchievement :: inline (steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool) -> bool {
    return SteamAPI_ISteamGameServerStats_GetUserAchievement(steam_game_server_stats, steamIDUser, pchName, pbAchieved);
}


ServerSetUserStatInt32 :: inline (steamIDUser: uint64_steamid, pchName: *char, nData: int32) -> bool {
    return SteamAPI_ISteamGameServerStats_SetUserStatInt32(steam_game_server_stats, steamIDUser, pchName, nData);
}


ServerSetUserStatFloat :: inline (steamIDUser: uint64_steamid, pchName: *char, fData: float) -> bool {
    return SteamAPI_ISteamGameServerStats_SetUserStatFloat(steam_game_server_stats, steamIDUser, pchName, fData);
}


ServerUpdateUserAvgRateStat :: inline (steamIDUser: uint64_steamid, pchName: *char, flCountThisSession: float, dSessionLength: double) -> bool {
    return SteamAPI_ISteamGameServerStats_UpdateUserAvgRateStat(steam_game_server_stats, steamIDUser, pchName, flCountThisSession, dSessionLength);
}


ServerSetUserAchievement :: inline (steamIDUser: uint64_steamid, pchName: *char) -> bool {
    return SteamAPI_ISteamGameServerStats_SetUserAchievement(steam_game_server_stats, steamIDUser, pchName);
}


ServerClearUserAchievement :: inline (steamIDUser: uint64_steamid, pchName: *char) -> bool {
    return SteamAPI_ISteamGameServerStats_ClearUserAchievement(steam_game_server_stats, steamIDUser, pchName);
}


ServerStoreUserStats :: inline (steamIDUser: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamGameServerStats_StoreUserStats(steam_game_server_stats, steamIDUser);
}

ServerStoreUserStats :: inline (steamIDUser: uint64_steamid, callback: (GSStatsStored_t, bool) -> ()) {
    RegisterCallResult(
        ServerStoreUserStats(steamIDUser),
        callback
    );
}

ServerStoreUserStats :: (steamIDUser: uint64_steamid, code: Code) #expand {
    RegisterCallResult(
        ServerStoreUserStats(steamIDUser),
        (result: GSStatsStored_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}
