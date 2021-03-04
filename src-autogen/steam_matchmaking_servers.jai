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


SteamMatchmakingServers_RequestInternetServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam "SteamAPI_ISteamMatchmakingServers_RequestInte {
    return SteamMatchmakingServers_RequestInternetServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


SteamMatchmakingServers_RequestLANServerList :: inline (iApp: AppId_t, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam "SteamAPI_ISteamMatchmakingServers_Reques {
    return SteamMatchmakingServers_RequestLANServerList(steam_matchmaking_servers, iApp, pRequestServersResponse);
}


SteamMatchmakingServers_RequestFriendsServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam "SteamAPI_ISteamMatchmakingServers_RequestFri {
    return SteamMatchmakingServers_RequestFriendsServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


SteamMatchmakingServers_RequestFavoritesServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam "SteamAPI_ISteamMatchmakingServers_RequestFavor {
    return SteamMatchmakingServers_RequestFavoritesServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


SteamMatchmakingServers_RequestHistoryServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam "SteamAPI_ISteamMatchmakingServers_RequestHis {
    return SteamMatchmakingServers_RequestHistoryServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


SteamMatchmakingServers_RequestSpectatorServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam "SteamAPI_ISteamMatchmakingServers_RequestSpect {
    return SteamMatchmakingServers_RequestSpectatorServerList(steam_matchmaking_servers, iApp, ppchFilters, nFilters, pRequestServersResponse);
}


SteamMatchmakingServers_ReleaseRequest :: inline (hServerListRequest: HServerListRequest) {
    SteamMatchmakingServers_ReleaseRequest(steam_matchmaking_servers, hServerListRequest);
}


SteamMatchmakingServers_GetServerDetails :: inline (hRequest: HServerListRequest, iServer: s32) -> *gameserveritem_t #foreign steam "SteamAPI_ISteamMatchmakingServers_Ge {
    return SteamMatchmakingServers_GetServerDetails(steam_matchmaking_servers, hRequest, iServer);
}


SteamMatchmakingServers_CancelQuery :: inline (hRequest: HServerListRequest) {
    SteamMatchmakingServers_CancelQuery(steam_matchmaking_servers, hRequest);
}


SteamMatchmakingServers_RefreshQuery :: inline (hRequest: HServerListRequest) {
    SteamMatchmakingServers_RefreshQuery(steam_matchmaking_servers, hRequest);
}


SteamMatchmakingServers_IsRefreshing :: inline (hRequest: HServerListRequest) -> bool #foreign steam "SteamAPI_ISteamMatchmakingServer {
    return SteamMatchmakingServers_IsRefreshing(steam_matchmaking_servers, hRequest);
}


SteamMatchmakingServers_GetServerCount :: inline (hRequest: HServerListRequest) -> s32 #foreign steam "SteamAPI_ISteamMatchmakingServers_ {
    return SteamMatchmakingServers_GetServerCount(steam_matchmaking_servers, hRequest);
}


SteamMatchmakingServers_RefreshServer :: inline (hRequest: HServerListRequest, iServer: s32) {
    SteamMatchmakingServers_RefreshServer(steam_matchmaking_servers, hRequest, iServer);
}


SteamMatchmakingServers_PingServer :: inline (unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPingResponse) -> HServerQuery #foreign steam "SteamAPI_ISteamMatchmakingServ {
    return SteamMatchmakingServers_PingServer(steam_matchmaking_servers, unIP, usPort, pRequestServersResponse);
}


SteamMatchmakingServers_PlayerDetails :: inline (unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPlayersResponse) -> HServerQuery #foreign steam "SteamAPI_ISteamMatchmakingServers {
    return SteamMatchmakingServers_PlayerDetails(steam_matchmaking_servers, unIP, usPort, pRequestServersResponse);
}


SteamMatchmakingServers_ServerRules :: inline (unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingRulesResponse) -> HServerQuery #foreign steam "SteamAPI_ISteamMatchmakingServe {
    return SteamMatchmakingServers_ServerRules(steam_matchmaking_servers, unIP, usPort, pRequestServersResponse);
}


SteamMatchmakingServers_CancelServerQuery :: inline (hServerQuery: HServerQuery) {
    SteamMatchmakingServers_CancelServerQuery(steam_matchmaking_servers, hServerQuery);
}
