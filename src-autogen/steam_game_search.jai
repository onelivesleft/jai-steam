steam_game_search : *ISteamGameSearch;

SteamGameSearch : SteamGameSearch_Namespace;


#scope_file


SteamGameSearch_Namespace :: struct {
    // procs
                :: SteamGameSearch_AddGameSearchParams
             :: SteamGameSearch_SearchForGameWithLobby
                  :: SteamGameSearch_SearchForGameSolo
                         :: SteamGameSearch_AcceptGame
                        :: SteamGameSearch_DeclineGame
          :: SteamGameSearch_RetrieveConnectionDetails
                      :: SteamGameSearch_EndGameSearch
                  :: SteamGameSearch_SetGameHostParams
               :: SteamGameSearch_SetConnectionDetails
              :: SteamGameSearch_RequestPlayersForGame
               :: SteamGameSearch_HostConfirmGameStart
        :: SteamGameSearch_CancelRequestPlayersForGame
                 :: SteamGameSearch_SubmitPlayerResult
                            :: SteamGameSearch_EndGame
}


SteamGameSearch_AddGameSearchParams :: inline (pchKeyToFind: *char, pchValuesToFind: *char) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_AddGameSearchParams(steam_game_search, pchKeyToFind: *char, pchValuesToFind: *char);
}


SteamGameSearch_SearchForGameWithLobby :: inline (steamIDLobby: uint64_steamid, nPlayerMin: s32, nPlayerMax: s32) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_SearchForGameWithLobby(steam_game_search, steamIDLobby: uint64_steamid, nPlayerMin: s32, nPlayerMax: s32);
}


SteamGameSearch_SearchForGameSolo :: inline (nPlayerMin: s32, nPlayerMax: s32) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_SearchForGameSolo(steam_game_search, nPlayerMin: s32, nPlayerMax: s32);
}


SteamGameSearch_AcceptGame :: inline () -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_AcceptGame(steam_game_search);
}


SteamGameSearch_DeclineGame :: inline () -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_DeclineGame(steam_game_search);
}


SteamGameSearch_RetrieveConnectionDetails :: inline (steamIDHost: uint64_steamid, pchConnectionDetails: *char, cubConnectionDetails: s32) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_RetrieveConnectionDetails(steam_game_search, steamIDHost: uint64_steamid, pchConnectionDetails: *char, cubConnectionDetails: s32);
}


SteamGameSearch_EndGameSearch :: inline () -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_EndGameSearch(steam_game_search);
}


SteamGameSearch_SetGameHostParams :: inline (pchKey: *char, pchValue: *char) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_SetGameHostParams(steam_game_search, pchKey: *char, pchValue: *char);
}


SteamGameSearch_SetConnectionDetails :: inline (pchConnectionDetails: *char, cubConnectionDetails: s32) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_SetConnectionDetails(steam_game_search, pchConnectionDetails: *char, cubConnectionDetails: s32);
}


SteamGameSearch_RequestPlayersForGame :: inline (nPlayerMin: s32, nPlayerMax: s32, nMaxTeamSize: s32) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_RequestPlayersForGame(steam_game_search, nPlayerMin: s32, nPlayerMax: s32, nMaxTeamSize: s32);
}


SteamGameSearch_HostConfirmGameStart :: inline (ullUniqueGameID: uint64) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_HostConfirmGameStart(steam_game_search, ullUniqueGameID: uint64);
}


SteamGameSearch_CancelRequestPlayersForGame :: inline () -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_CancelRequestPlayersForGame(steam_game_search);
}


SteamGameSearch_SubmitPlayerResult :: inline (ullUniqueGameID: uint64, steamIDPlayer: uint64_steamid, EPlayerResult: EPlayerResult_t) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_SubmitPlayerResult(steam_game_search, ullUniqueGameID: uint64, steamIDPlayer: uint64_steamid, EPlayerResult: EPlayerResult_t);
}


SteamGameSearch_EndGame :: inline (ullUniqueGameID: uint64) -> EGameSearchErrorCode_t {
    return SteamAPI_ISteamGameSearch_EndGame(steam_game_search, ullUniqueGameID: uint64);
}
