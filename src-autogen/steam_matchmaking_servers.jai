steam_matchmaking_servers : *ISteamMatchmakingServers;
SteamMatchmakingServers : SteamMatchmakingServers_Namespace;


#scope_file


SteamMatchmakingServers_Namespace :: struct {
    // procs
    RequestInternetServerList                          :: SteamMatchmakingServers_RequestInternetServerList;
    RequestLANServerList                               :: SteamMatchmakingServers_RequestLANServerList;
    RequestFriendsServerList                           :: SteamMatchmakingServers_RequestFriendsServerList;
    RequestFavoritesServerList                         :: SteamMatchmakingServers_RequestFavoritesServerList;
    RequestHistoryServerList                           :: SteamMatchmakingServers_RequestHistoryServerList;
    RequestSpectatorServerList                         :: SteamMatchmakingServers_RequestSpectatorServerList;
    ReleaseRequest                                     :: SteamMatchmakingServers_ReleaseRequest;
    GetServerDetails                                   :: SteamMatchmakingServers_GetServerDetails;
    CancelQuery                                        :: SteamMatchmakingServers_CancelQuery;
    RefreshQuery                                       :: SteamMatchmakingServers_RefreshQuery;
    IsRefreshing                                       :: SteamMatchmakingServers_IsRefreshing;
    GetServerCount                                     :: SteamMatchmakingServers_GetServerCount;
    RefreshServer                                      :: SteamMatchmakingServers_RefreshServer;
    PingServer                                         :: SteamMatchmakingServers_PingServer;
    PlayerDetails                                      :: SteamMatchmakingServers_PlayerDetails;
    ServerRules                                        :: SteamMatchmakingServers_ServerRules;
    CancelServerQuery                                  :: SteamMatchmakingServers_CancelServerQuery;
}


SteamMatchmakingServers_RequestInternetServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestInternetServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


SteamMatchmakingServers_RequestLANServerList :: inline (iApp: AppId_t, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestLANServerList(steam_matchmaking_servers, iApp, pRequestServersResponse);
}


SteamMatchmakingServers_RequestFriendsServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


SteamMatchmakingServers_RequestFavoritesServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


SteamMatchmakingServers_RequestHistoryServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


SteamMatchmakingServers_RequestSpectatorServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


SteamMatchmakingServers_ReleaseRequest :: inline (hServerListRequest: HServerListRequest) {
    SteamAPI_ISteamMatchmakingServers_ReleaseRequest(steam_matchmaking_servers, hServerListRequest);
}


SteamMatchmakingServers_GetServerDetails :: inline (hRequest: HServerListRequest, iServer: s32) -> *gameserveritem_t {
    return SteamAPI_ISteamMatchmakingServers_GetServerDetails(steam_matchmaking_servers, hRequest, iServer);
}


SteamMatchmakingServers_CancelQuery :: inline (hRequest: HServerListRequest) {
    SteamAPI_ISteamMatchmakingServers_CancelQuery(steam_matchmaking_servers, hRequest);
}


SteamMatchmakingServers_RefreshQuery :: inline (hRequest: HServerListRequest) {
    SteamAPI_ISteamMatchmakingServers_RefreshQuery(steam_matchmaking_servers, hRequest);
}


SteamMatchmakingServers_IsRefreshing :: inline (hRequest: HServerListRequest) -> bool {
    return SteamAPI_ISteamMatchmakingServers_IsRefreshing(steam_matchmaking_servers, hRequest);
}


SteamMatchmakingServers_GetServerCount :: inline (hRequest: HServerListRequest) -> s32 {
    return SteamAPI_ISteamMatchmakingServers_GetServerCount(steam_matchmaking_servers, hRequest);
}


SteamMatchmakingServers_RefreshServer :: inline (hRequest: HServerListRequest, iServer: s32) {
    SteamAPI_ISteamMatchmakingServers_RefreshServer(steam_matchmaking_servers, hRequest, iServer);
}


SteamMatchmakingServers_PingServer :: inline (unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPingResponse) -> HServerQuery {
    return SteamAPI_ISteamMatchmakingServers_PingServer(steam_matchmaking_servers, unIP, usPort, pRequestServersResponse);
}


SteamMatchmakingServers_PlayerDetails :: inline (unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPlayersResponse) -> HServerQuery {
    return SteamAPI_ISteamMatchmakingServers_PlayerDetails(steam_matchmaking_servers, unIP, usPort, pRequestServersResponse);
}


SteamMatchmakingServers_ServerRules :: inline (unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingRulesResponse) -> HServerQuery {
    return SteamAPI_ISteamMatchmakingServers_ServerRules(steam_matchmaking_servers, unIP, usPort, pRequestServersResponse);
}


SteamMatchmakingServers_CancelServerQuery :: inline (hServerQuery: HServerQuery) {
    SteamAPI_ISteamMatchmakingServers_CancelServerQuery(steam_matchmaking_servers, hServerQuery);
}
