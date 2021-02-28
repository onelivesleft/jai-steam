SteamAPI : SteamAPI_Namespace;


#scope_file


SteamAPI_Namespace :: struct {
    // procs
    SteamMatchmakingServerListResponse : struct {
        ServerResponded           :: SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded;
        ServerFailedToRespond     :: SteamMatchmakingServerListResponse_ServerFailedToRespond;
        RefreshComplete           :: SteamMatchmakingServerListResponse_RefreshComplete;
    };
    
    SteamMatchmakingServerListResponse_ServerResponded           :: SteamMatchmakingServerListResponse_ServerResponded;
    SteamMatchmakingServerListResponse_ServerFailedToRespond     :: SteamMatchmakingServerListResponse_ServerFailedToRespond;
    SteamMatchmakingServerListResponse_RefreshComplete           :: SteamMatchmakingServerListResponse_RefreshComplete;
    SteamMatchmakingPingResponse_ServerResponded                 :: SteamMatchmakingPingResponse_ServerResponded;
    SteamMatchmakingPingResponse_ServerFailedToRespond           :: SteamMatchmakingPingResponse_ServerFailedToRespond;
    SteamMatchmakingPlayersResponse_AddPlayerToList              :: SteamMatchmakingPlayersResponse_AddPlayerToList;
    SteamMatchmakingPlayersResponse_PlayersFailedToRespond       :: SteamMatchmakingPlayersResponse_PlayersFailedToRespond;
    SteamMatchmakingPlayersResponse_PlayersRefreshComplete       :: SteamMatchmakingPlayersResponse_PlayersRefreshComplete;
    SteamMatchmakingRulesResponse_RulesResponded                 :: SteamMatchmakingRulesResponse_RulesResponded;
    SteamMatchmakingRulesResponse_RulesFailedToRespond           :: SteamMatchmakingRulesResponse_RulesFailedToRespond;
    SteamMatchmakingRulesResponse_RulesRefreshComplete           :: SteamMatchmakingRulesResponse_RulesRefreshComplete;
    SteamIPAddress_t_IsSet                                       :: SteamIPAddress_t_IsSet;
    MatchMakingKeyValuePair_t_Construct                          :: MatchMakingKeyValuePair_t_Construct;
    servernetadr_t_Construct                                     :: servernetadr_t_Construct;
    servernetadr_t_Init                                          :: servernetadr_t_Init;
    servernetadr_t_GetQueryPort                                  :: servernetadr_t_GetQueryPort;
    servernetadr_t_SetQueryPort                                  :: servernetadr_t_SetQueryPort;
    servernetadr_t_GetConnectionPort                             :: servernetadr_t_GetConnectionPort;
    servernetadr_t_SetConnectionPort                             :: servernetadr_t_SetConnectionPort;
    servernetadr_t_GetIP                                         :: servernetadr_t_GetIP;
    servernetadr_t_SetIP                                         :: servernetadr_t_SetIP;
    servernetadr_t_GetConnectionAddressString                    :: servernetadr_t_GetConnectionAddressString;
    servernetadr_t_GetQueryAddressString                         :: servernetadr_t_GetQueryAddressString;
    servernetadr_t_IsLessThan                                    :: servernetadr_t_IsLessThan;
    servernetadr_t_Assign                                        :: servernetadr_t_Assign;
    gameserveritem_t_Construct                                   :: gameserveritem_t_Construct;
    gameserveritem_t_GetName                                     :: gameserveritem_t_GetName;
    gameserveritem_t_SetName                                     :: gameserveritem_t_SetName;
    SteamNetworkingIPAddr_Clear                                  :: SteamNetworkingIPAddr_Clear;
    SteamNetworkingIPAddr_IsIPv6AllZeros                         :: SteamNetworkingIPAddr_IsIPv6AllZeros;
    SteamNetworkingIPAddr_SetIPv6                                :: SteamNetworkingIPAddr_SetIPv6;
    SteamNetworkingIPAddr_SetIPv4                                :: SteamNetworkingIPAddr_SetIPv4;
    SteamNetworkingIPAddr_IsIPv4                                 :: SteamNetworkingIPAddr_IsIPv4;
    SteamNetworkingIPAddr_GetIPv4                                :: SteamNetworkingIPAddr_GetIPv4;
    SteamNetworkingIPAddr_SetIPv6LocalHost                       :: SteamNetworkingIPAddr_SetIPv6LocalHost;
    SteamNetworkingIPAddr_IsLocalHost                            :: SteamNetworkingIPAddr_IsLocalHost;
    SteamNetworkingIPAddr_ToString                               :: SteamNetworkingIPAddr_ToString;
    SteamNetworkingIPAddr_ParseString                            :: SteamNetworkingIPAddr_ParseString;
    SteamNetworkingIPAddr_IsEqualTo                              :: SteamNetworkingIPAddr_IsEqualTo;
    SteamNetworkingIdentity_Clear                                :: SteamNetworkingIdentity_Clear;
    SteamNetworkingIdentity_IsInvalid                            :: SteamNetworkingIdentity_IsInvalid;
    SteamNetworkingIdentity_SetSteamID                           :: SteamNetworkingIdentity_SetSteamID;
    SteamNetworkingIdentity_GetSteamID                           :: SteamNetworkingIdentity_GetSteamID;
    SteamNetworkingIdentity_SetSteamID64                         :: SteamNetworkingIdentity_SetSteamID64;
    SteamNetworkingIdentity_GetSteamID64                         :: SteamNetworkingIdentity_GetSteamID64;
    SteamNetworkingIdentity_SetXboxPairwiseID                    :: SteamNetworkingIdentity_SetXboxPairwiseID;
    SteamNetworkingIdentity_GetXboxPairwiseID                    :: SteamNetworkingIdentity_GetXboxPairwiseID;
    SteamNetworkingIdentity_SetIPAddr                            :: SteamNetworkingIdentity_SetIPAddr;
    SteamNetworkingIdentity_GetIPAddr                            :: SteamNetworkingIdentity_GetIPAddr;
    SteamNetworkingIdentity_SetLocalHost                         :: SteamNetworkingIdentity_SetLocalHost;
    SteamNetworkingIdentity_IsLocalHost                          :: SteamNetworkingIdentity_IsLocalHost;
    SteamNetworkingIdentity_SetGenericString                     :: SteamNetworkingIdentity_SetGenericString;
    SteamNetworkingIdentity_GetGenericString                     :: SteamNetworkingIdentity_GetGenericString;
    SteamNetworkingIdentity_SetGenericBytes                      :: SteamNetworkingIdentity_SetGenericBytes;
    SteamNetworkingIdentity_GetGenericBytes                      :: SteamNetworkingIdentity_GetGenericBytes;
    SteamNetworkingIdentity_IsEqualTo                            :: SteamNetworkingIdentity_IsEqualTo;
    SteamNetworkingIdentity_ToString                             :: SteamNetworkingIdentity_ToString;
    SteamNetworkingIdentity_ParseString                          :: SteamNetworkingIdentity_ParseString;
    SteamNetworkingMessage_t_Release                             :: SteamNetworkingMessage_t_Release;
    SteamNetworkingConfigValue_t_SetInt32                        :: SteamNetworkingConfigValue_t_SetInt32;
    SteamNetworkingConfigValue_t_SetInt64                        :: SteamNetworkingConfigValue_t_SetInt64;
    SteamNetworkingConfigValue_t_SetFloat                        :: SteamNetworkingConfigValue_t_SetFloat;
    SteamNetworkingConfigValue_t_SetPtr                          :: SteamNetworkingConfigValue_t_SetPtr;
    SteamNetworkingConfigValue_t_SetString                       :: SteamNetworkingConfigValue_t_SetString;
    SteamNetworkingPOPIDRender_c_str                             :: SteamNetworkingPOPIDRender_c_str;
    SteamNetworkingIdentityRender_c_str                          :: SteamNetworkingIdentityRender_c_str;
    SteamNetworkingIPAddrRender_c_str                            :: SteamNetworkingIPAddrRender_c_str;
    SteamDatagramHostedAddress_Clear                             :: SteamDatagramHostedAddress_Clear;
    SteamDatagramHostedAddress_GetPopID                          :: SteamDatagramHostedAddress_GetPopID;
    SteamDatagramHostedAddress_SetDevAddress                     :: SteamDatagramHostedAddress_SetDevAddress;
}


SteamMatchmakingServerListResponse_ServerResponded :: inline (hRequest: HServerListRequest, iServer: s32) {
    SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded(steam_api, hRequest, iServer);
}


SteamMatchmakingServerListResponse_ServerFailedToRespond :: inline (hRequest: HServerListRequest, iServer: s32) {
    SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond(steam_api, hRequest, iServer);
}


SteamMatchmakingServerListResponse_RefreshComplete :: inline (hRequest: HServerListRequest, response: EMatchMakingServerResponse) {
    SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete(steam_api, hRequest, response);
}


SteamMatchmakingPingResponse_ServerResponded :: inline (server: *gameserveritem_t) {
    SteamAPI_ISteamMatchmakingPingResponse_ServerResponded(steam_api, server);
}


SteamMatchmakingPingResponse_ServerFailedToRespond :: inline () {
    SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond(steam_api);
}


SteamMatchmakingPlayersResponse_AddPlayerToList :: inline (pchName: *char, nScore: s32, flTimePlayed: float) {
    SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList(steam_api, pchName, nScore, flTimePlayed);
}


SteamMatchmakingPlayersResponse_PlayersFailedToRespond :: inline () {
    SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond(steam_api);
}


SteamMatchmakingPlayersResponse_PlayersRefreshComplete :: inline () {
    SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete(steam_api);
}


SteamMatchmakingRulesResponse_RulesResponded :: inline (pchRule: *char, pchValue: *char) {
    SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded(steam_api, pchRule, pchValue);
}


SteamMatchmakingRulesResponse_RulesFailedToRespond :: inline () {
    SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond(steam_api);
}


SteamMatchmakingRulesResponse_RulesRefreshComplete :: inline () {
    SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete(steam_api);
}


SteamIPAddress_t_IsSet :: inline () -> bool {
    return SteamAPI_SteamIPAddress_t_IsSet(steam_api);
}


MatchMakingKeyValuePair_t_Construct :: inline () {
    SteamAPI_MatchMakingKeyValuePair_t_Construct(steam_api);
}


servernetadr_t_Construct :: inline () {
    SteamAPI_servernetadr_t_Construct(steam_api);
}


servernetadr_t_Init :: inline (ip: u32, usQueryPort: uint16, usConnectionPort: uint16) {
    SteamAPI_servernetadr_t_Init(steam_api, ip, usQueryPort, usConnectionPort);
}


servernetadr_t_GetQueryPort :: inline () -> uint16 {
    return SteamAPI_servernetadr_t_GetQueryPort(steam_api);
}


servernetadr_t_SetQueryPort :: inline (usPort: uint16) {
    SteamAPI_servernetadr_t_SetQueryPort(steam_api, usPort);
}


servernetadr_t_GetConnectionPort :: inline () -> uint16 {
    return SteamAPI_servernetadr_t_GetConnectionPort(steam_api);
}


servernetadr_t_SetConnectionPort :: inline (usPort: uint16) {
    SteamAPI_servernetadr_t_SetConnectionPort(steam_api, usPort);
}


servernetadr_t_GetIP :: inline () -> uint32 {
    return SteamAPI_servernetadr_t_GetIP(steam_api);
}


servernetadr_t_SetIP :: inline (unIP: uint32) {
    SteamAPI_servernetadr_t_SetIP(steam_api, unIP);
}


servernetadr_t_GetConnectionAddressString :: inline () -> string {
    return to_string(SteamAPI_servernetadr_t_GetConnectionAddressString(steam_api));
}


servernetadr_t_GetQueryAddressString :: inline () -> string {
    return to_string(SteamAPI_servernetadr_t_GetQueryAddressString(steam_api));
}


servernetadr_t_IsLessThan :: inline (netadr: *servernetadr_t) -> bool {
    return SteamAPI_servernetadr_t_IsLessThan(steam_api, netadr);
}


servernetadr_t_Assign :: inline (that: *servernetadr_t) {
    SteamAPI_servernetadr_t_Assign(steam_api, that);
}


gameserveritem_t_Construct :: inline () {
    SteamAPI_gameserveritem_t_Construct(steam_api);
}


gameserveritem_t_GetName :: inline () -> string {
    return to_string(SteamAPI_gameserveritem_t_GetName(steam_api));
}


gameserveritem_t_SetName :: inline (pName: *char) {
    SteamAPI_gameserveritem_t_SetName(steam_api, pName);
}


SteamNetworkingIPAddr_Clear :: inline () {
    SteamAPI_SteamNetworkingIPAddr_Clear(steam_api);
}


SteamNetworkingIPAddr_IsIPv6AllZeros :: inline () -> bool {
    return SteamAPI_SteamNetworkingIPAddr_IsIPv6AllZeros(steam_api);
}


SteamNetworkingIPAddr_SetIPv6 :: inline (ipv6: *uint8, nPort: uint16) {
    SteamAPI_SteamNetworkingIPAddr_SetIPv6(steam_api, ipv6, nPort);
}


SteamNetworkingIPAddr_SetIPv4 :: inline (nIP: uint32, nPort: uint16) {
    SteamAPI_SteamNetworkingIPAddr_SetIPv4(steam_api, nIP, nPort);
}


SteamNetworkingIPAddr_IsIPv4 :: inline () -> bool {
    return SteamAPI_SteamNetworkingIPAddr_IsIPv4(steam_api);
}


SteamNetworkingIPAddr_GetIPv4 :: inline () -> uint32 {
    return SteamAPI_SteamNetworkingIPAddr_GetIPv4(steam_api);
}


SteamNetworkingIPAddr_SetIPv6LocalHost :: inline (nPort: uint16) {
    SteamAPI_SteamNetworkingIPAddr_SetIPv6LocalHost(steam_api, nPort);
}


SteamNetworkingIPAddr_IsLocalHost :: inline () -> bool {
    return SteamAPI_SteamNetworkingIPAddr_IsLocalHost(steam_api);
}


SteamNetworkingIPAddr_ToString :: inline (buf: *char, cbBuf: uint32, bWithPort: bool) {
    SteamAPI_SteamNetworkingIPAddr_ToString(steam_api, buf, cbBuf, bWithPort);
}


SteamNetworkingIPAddr_ParseString :: inline (pszStr: *char) -> bool {
    return SteamAPI_SteamNetworkingIPAddr_ParseString(steam_api, pszStr);
}


SteamNetworkingIPAddr_IsEqualTo :: inline (x: *SteamNetworkingIPAddr) -> bool {
    return SteamAPI_SteamNetworkingIPAddr_IsEqualTo(steam_api, x);
}


SteamNetworkingIdentity_Clear :: inline () {
    SteamAPI_SteamNetworkingIdentity_Clear(steam_api);
}


SteamNetworkingIdentity_IsInvalid :: inline () -> bool {
    return SteamAPI_SteamNetworkingIdentity_IsInvalid(steam_api);
}


SteamNetworkingIdentity_SetSteamID :: inline (steamID: uint64_steamid) {
    SteamAPI_SteamNetworkingIdentity_SetSteamID(steam_api, steamID);
}


SteamNetworkingIdentity_GetSteamID :: inline () -> uint64_steamid {
    return SteamAPI_SteamNetworkingIdentity_GetSteamID(steam_api);
}


SteamNetworkingIdentity_SetSteamID64 :: inline (steamID: uint64) {
    SteamAPI_SteamNetworkingIdentity_SetSteamID64(steam_api, steamID);
}


SteamNetworkingIdentity_GetSteamID64 :: inline () -> uint64 {
    return SteamAPI_SteamNetworkingIdentity_GetSteamID64(steam_api);
}


SteamNetworkingIdentity_SetXboxPairwiseID :: inline (pszString: *char) -> bool {
    return SteamAPI_SteamNetworkingIdentity_SetXboxPairwiseID(steam_api, pszString);
}


SteamNetworkingIdentity_GetXboxPairwiseID :: inline () -> string {
    return to_string(SteamAPI_SteamNetworkingIdentity_GetXboxPairwiseID(steam_api));
}


SteamNetworkingIdentity_SetIPAddr :: inline (addr: *SteamNetworkingIPAddr) {
    SteamAPI_SteamNetworkingIdentity_SetIPAddr(steam_api, addr);
}


SteamNetworkingIdentity_GetIPAddr :: inline () -> *SteamNetworkingIPAddr {
    return SteamAPI_SteamNetworkingIdentity_GetIPAddr(steam_api);
}


SteamNetworkingIdentity_SetLocalHost :: inline () {
    SteamAPI_SteamNetworkingIdentity_SetLocalHost(steam_api);
}


SteamNetworkingIdentity_IsLocalHost :: inline () -> bool {
    return SteamAPI_SteamNetworkingIdentity_IsLocalHost(steam_api);
}


SteamNetworkingIdentity_SetGenericString :: inline (pszString: *char) -> bool {
    return SteamAPI_SteamNetworkingIdentity_SetGenericString(steam_api, pszString);
}


SteamNetworkingIdentity_GetGenericString :: inline () -> string {
    return to_string(SteamAPI_SteamNetworkingIdentity_GetGenericString(steam_api));
}


SteamNetworkingIdentity_SetGenericBytes :: inline (data: *void, cbLen: uint32) -> bool {
    return SteamAPI_SteamNetworkingIdentity_SetGenericBytes(steam_api, data, cbLen);
}


SteamNetworkingIdentity_GetGenericBytes :: inline (cbLen: *s32) -> *uint8 {
    return SteamAPI_SteamNetworkingIdentity_GetGenericBytes(steam_api, cbLen);
}


SteamNetworkingIdentity_IsEqualTo :: inline (x: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_SteamNetworkingIdentity_IsEqualTo(steam_api, x);
}


SteamNetworkingIdentity_ToString :: inline (buf: *char, cbBuf: uint32) {
    SteamAPI_SteamNetworkingIdentity_ToString(steam_api, buf, cbBuf);
}


SteamNetworkingIdentity_ParseString :: inline (pszStr: *char) -> bool {
    return SteamAPI_SteamNetworkingIdentity_ParseString(steam_api, pszStr);
}


SteamNetworkingMessage_t_Release :: inline () {
    SteamAPI_SteamNetworkingMessage_t_Release(steam_api);
}


SteamNetworkingConfigValue_t_SetInt32 :: inline (eVal: ESteamNetworkingConfigValue, data: int32_t) {
    SteamAPI_SteamNetworkingConfigValue_t_SetInt32(steam_api, eVal, data);
}


SteamNetworkingConfigValue_t_SetInt64 :: inline (eVal: ESteamNetworkingConfigValue, data: int64_t) {
    SteamAPI_SteamNetworkingConfigValue_t_SetInt64(steam_api, eVal, data);
}


SteamNetworkingConfigValue_t_SetFloat :: inline (eVal: ESteamNetworkingConfigValue, data: float) {
    SteamAPI_SteamNetworkingConfigValue_t_SetFloat(steam_api, eVal, data);
}


SteamNetworkingConfigValue_t_SetPtr :: inline (eVal: ESteamNetworkingConfigValue, data: *void) {
    SteamAPI_SteamNetworkingConfigValue_t_SetPtr(steam_api, eVal, data);
}


SteamNetworkingConfigValue_t_SetString :: inline (eVal: ESteamNetworkingConfigValue, data: *char) {
    SteamAPI_SteamNetworkingConfigValue_t_SetString(steam_api, eVal, data);
}


SteamNetworkingPOPIDRender_c_str :: inline () -> string {
    return to_string(SteamAPI_SteamNetworkingPOPIDRender_c_str(steam_api));
}


SteamNetworkingIdentityRender_c_str :: inline () -> string {
    return to_string(SteamAPI_SteamNetworkingIdentityRender_c_str(steam_api));
}


SteamNetworkingIPAddrRender_c_str :: inline () -> string {
    return to_string(SteamAPI_SteamNetworkingIPAddrRender_c_str(steam_api));
}


SteamDatagramHostedAddress_Clear :: inline () {
    SteamAPI_SteamDatagramHostedAddress_Clear(steam_api);
}


SteamDatagramHostedAddress_GetPopID :: inline () -> SteamNetworkingPOPID {
    return SteamAPI_SteamDatagramHostedAddress_GetPopID(steam_api);
}


SteamDatagramHostedAddress_SetDevAddress :: inline (nIP: uint32, nPort: uint16, popid: SteamNetworkingPOPID) {
    SteamAPI_SteamDatagramHostedAddress_SetDevAddress(steam_api, nIP, nPort, popid);
}
