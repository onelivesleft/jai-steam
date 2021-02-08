steam_matchmaking_servers : *ISteamMatchmakingServers;

SteamMatchmakingServers : SteamMatchmakingServers_Namespace;


#scope_file


SteamMatchmakingServers_Namespace :: struct {
    // procs
          :: SteamMatchmakingServers_RequestInternetServerList
               :: SteamMatchmakingServers_RequestLANServerList
           :: SteamMatchmakingServers_RequestFriendsServerList
         :: SteamMatchmakingServers_RequestFavoritesServerList
           :: SteamMatchmakingServers_RequestHistoryServerList
         :: SteamMatchmakingServers_RequestSpectatorServerList
                     :: SteamMatchmakingServers_ReleaseRequest
                   :: SteamMatchmakingServers_GetServerDetails
                        :: SteamMatchmakingServers_CancelQuery
                       :: SteamMatchmakingServers_RefreshQuery
                       :: SteamMatchmakingServers_IsRefreshing
                     :: SteamMatchmakingServers_GetServerCount
                      :: SteamMatchmakingServers_RefreshServer
                         :: SteamMatchmakingServers_PingServer
                      :: SteamMatchmakingServers_PlayerDetails
                        :: SteamMatchmakingServers_ServerRules
                  :: SteamMatchmakingServers_CancelServerQuery
}


SteamMatchmakingServers_RequestInternetServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestInternetServerList(steam_matchmaking_servers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse);
}


SteamMatchmakingServers_RequestLANServerList :: inline (iApp: AppId_t, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestLANServerList(steam_matchmaking_servers, iApp: AppId_t, pRequestServersResponse: *ISteamMatchmakingServerListResponse);
}


SteamMatchmakingServers_RequestFriendsServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList(steam_matchmaking_servers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse);
}


SteamMatchmakingServers_RequestFavoritesServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList(steam_matchmaking_servers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse);
}


SteamMatchmakingServers_RequestHistoryServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList(steam_matchmaking_servers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse);
}


SteamMatchmakingServers_RequestSpectatorServerList :: inline (iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest {
    return SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList(steam_matchmaking_servers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse);
}


SteamMatchmakingServers_ReleaseRequest :: inline (hServerListRequest: HServerListRequest) {
    SteamAPI_ISteamMatchmakingServers_ReleaseRequest(steam_matchmaking_servers, hServerListRequest: HServerListRequest);
}


SteamMatchmakingServers_GetServerDetails :: inline (hRequest: HServerListRequest, iServer: s32) -> *gameserveritem_t {
    return SteamAPI_ISteamMatchmakingServers_GetServerDetails(steam_matchmaking_servers, hRequest: HServerListRequest, iServer: s32);
}


SteamMatchmakingServers_CancelQuery :: inline (hRequest: HServerListRequest) {
    SteamAPI_ISteamMatchmakingServers_CancelQuery(steam_matchmaking_servers, hRequest: HServerListRequest);
}


SteamMatchmakingServers_RefreshQuery :: inline (hRequest: HServerListRequest) {
    SteamAPI_ISteamMatchmakingServers_RefreshQuery(steam_matchmaking_servers, hRequest: HServerListRequest);
}


SteamMatchmakingServers_IsRefreshing :: inline (hRequest: HServerListRequest) -> bool {
    return SteamAPI_ISteamMatchmakingServers_IsRefreshing(steam_matchmaking_servers, hRequest: HServerListRequest);
}


SteamMatchmakingServers_GetServerCount :: inline (hRequest: HServerListRequest) -> s32 {
    return SteamAPI_ISteamMatchmakingServers_GetServerCount(steam_matchmaking_servers, hRequest: HServerListRequest);
}


SteamMatchmakingServers_RefreshServer :: inline (hRequest: HServerListRequest, iServer: s32) {
    SteamAPI_ISteamMatchmakingServers_RefreshServer(steam_matchmaking_servers, hRequest: HServerListRequest, iServer: s32);
}


SteamMatchmakingServers_PingServer :: inline (unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPingResponse) -> HServerQuery {
    return SteamAPI_ISteamMatchmakingServers_PingServer(steam_matchmaking_servers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPingResponse);
}


SteamMatchmakingServers_PlayerDetails :: inline (unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPlayersResponse) -> HServerQuery {
    return SteamAPI_ISteamMatchmakingServers_PlayerDetails(steam_matchmaking_servers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPlayersResponse);
}


SteamMatchmakingServers_ServerRules :: inline (unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingRulesResponse) -> HServerQuery {
    return SteamAPI_ISteamMatchmakingServers_ServerRules(steam_matchmaking_servers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingRulesResponse);
}


SteamMatchmakingServers_CancelServerQuery :: inline (hServerQuery: HServerQuery) {
    SteamAPI_ISteamMatchmakingServers_CancelServerQuery(steam_matchmaking_servers, hServerQuery: HServerQuery);
}
