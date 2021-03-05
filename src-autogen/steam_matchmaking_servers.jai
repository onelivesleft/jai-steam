steam_matchmaking_servers : *ISteamMatchmakingServers;


RequestInternetServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestInternetServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


RequestLANServerList :: inline (iApp: AppId_t, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestLANServerList(steam_matchmaking_servers, iApp, pRequestServersResponse);
}


RequestFriendsServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


RequestFavoritesServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


RequestHistoryServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


RequestSpectatorServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


ReleaseRequest :: inline (hServerListRequest: HServerListRequest) {
    SteamAPI_ISteamMatchmakingServers_ReleaseRequest(steam_matchmaking_servers, hServerListRequest);
}


GetServerDetails :: inline (hRequest: HServerListRequest, iServer: s32) -> *gameserveritem_t {
    return SteamAPI_ISteamMatchmakingServers_GetServerDetails(steam_matchmaking_servers, hRequest, iServer);
}


CancelQuery :: inline (hRequest: HServerListRequest) {
    SteamAPI_ISteamMatchmakingServers_CancelQuery(steam_matchmaking_servers, hRequest);
}


RefreshQuery :: inline (hRequest: HServerListRequest) {
    SteamAPI_ISteamMatchmakingServers_RefreshQuery(steam_matchmaking_servers, hRequest);
}


IsRefreshing :: inline (hRequest: HServerListRequest) -> bool {
    return SteamAPI_ISteamMatchmakingServers_IsRefreshing(steam_matchmaking_servers, hRequest);
}


GetServerCount :: inline (hRequest: HServerListRequest) -> s32 {
    return SteamAPI_ISteamMatchmakingServers_GetServerCount(steam_matchmaking_servers, hRequest);
}


RefreshServer :: inline (hRequest: HServerListRequest, iServer: s32) {
    SteamAPI_ISteamMatchmakingServers_RefreshServer(steam_matchmaking_servers, hRequest, iServer);
}


PingServer :: inline (unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPingResponse) -> HServerQuery {
    return SteamAPI_ISteamMatchmakingServers_PingServer(steam_matchmaking_servers, unIP, usPort, pRequestServersResponse);
}


PlayerDetails :: inline (unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPlayersResponse) -> HServerQuery {
    return SteamAPI_ISteamMatchmakingServers_PlayerDetails(steam_matchmaking_servers, unIP, usPort, pRequestServersResponse);
}


ServerRules :: inline (unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingRulesResponse) -> HServerQuery {
    return SteamAPI_ISteamMatchmakingServers_ServerRules(steam_matchmaking_servers, unIP, usPort, pRequestServersResponse);
}


CancelServerQuery :: inline (hServerQuery: HServerQuery) {
    SteamAPI_ISteamMatchmakingServers_CancelServerQuery(steam_matchmaking_servers, hServerQuery);
}
