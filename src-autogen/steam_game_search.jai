steam_game_search : *ISteamGameSearch;


AddGameSearchParams :: inline (pchKeyToFind: *char, pchValuesToFind: *char) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_AddGameSearchParams(steam_game_search, pchKeyToFind, pchValuesToFind);
}


SearchForGameWithLobby :: inline (steamIDLobby: uint64_steamid, nPlayerMin: s32, nPlayerMax: s32) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_SearchForGameWithLobby(steam_game_search, steamIDLobby, nPlayerMin, nPlayerMax);
}


SearchForGameSolo :: inline (nPlayerMin: s32, nPlayerMax: s32) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_SearchForGameSolo(steam_game_search, nPlayerMin, nPlayerMax);
}


AcceptGame :: inline () -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_AcceptGame(steam_game_search);
}


DeclineGame :: inline () -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_DeclineGame(steam_game_search);
}


RetrieveConnectionDetails :: inline (steamIDHost: uint64_steamid, pchConnectionDetails: *char, cubConnectionDetails: s32) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_RetrieveConnectionDetails(steam_game_search, steamIDHost, pchConnectionDetails, cubConnectionDetails);
}


EndGameSearch :: inline () -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_EndGameSearch(steam_game_search);
}


SetGameHostParams :: inline (pchKey: *char, pchValue: *char) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_SetGameHostParams(steam_game_search, pchKey, pchValue);
}


SetConnectionDetails :: inline (pchConnectionDetails: *char, cubConnectionDetails: s32) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_SetConnectionDetails(steam_game_search, pchConnectionDetails, cubConnectionDetails);
}


RequestPlayersForGame :: inline (nPlayerMin: s32, nPlayerMax: s32, nMaxTeamSize: s32) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_RequestPlayersForGame(steam_game_search, nPlayerMin, nPlayerMax, nMaxTeamSize);
}


HostConfirmGameStart :: inline (ullUniqueGameID: uint64) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_HostConfirmGameStart(steam_game_search, ullUniqueGameID);
}


CancelRequestPlayersForGame :: inline () -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_CancelRequestPlayersForGame(steam_game_search);
}


SubmitPlayerResult :: inline (ullUniqueGameID: uint64, steamIDPlayer: uint64_steamid, EPlayerResult: EPlayerResult_t) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_SubmitPlayerResult(steam_game_search, ullUniqueGameID, steamIDPlayer, EPlayerResult);
}


EndGame :: inline (ullUniqueGameID: uint64) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_EndGame(steam_game_search, ullUniqueGameID);
}
