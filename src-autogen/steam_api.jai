Steam : Steam_Namespace;


#scope_file


Steam_Namespace :: struct {
    Init                       :: Steam_Init;
    Shutdown                   :: Steam_Shutdown;
    RestartAppIfNecessary      :: SteamAPI_RestartAppIfNecessary;
    ReleaseCurrentThreadMemory :: SteamAPI_ReleaseCurrentThreadMemory;
    WriteMiniDump              :: SteamAPI_WriteMiniDump;
    SetMiniDumpComment         :: SteamAPI_SetMiniDumpComment;
    IsSteamRunning             :: SteamAPI_IsSteamRunning;
    GetSteamInstallPath        :: SteamAPI_GetSteamInstallPath;
    SetTryCatchCallbacks       :: SteamAPI_SetTryCatchCallbacks;
    UseBreakpadCrashHandler    :: SteamAPI_UseBreakpadCrashHandler;
    SetBreakpadAppID           :: SteamAPI_SetBreakpadAppID;

    SteamMatchmakingServerListResponse : struct {
        ServerResponded                :: SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded;
        ServerFailedToRespond          :: SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond;
        RefreshComplete                :: SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete;
    };

    SteamMatchmakingPingResponse : struct {
        ServerResponded                :: SteamAPI_ISteamMatchmakingPingResponse_ServerResponded;
        ServerFailedToRespond          :: SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond;
    };

    SteamMatchmakingPlayersResponse : struct {
        AddPlayerToList                :: SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList;
        PlayersFailedToRespond         :: SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond;
        PlayersRefreshComplete         :: SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete;
    };

    SteamMatchmakingRulesResponse : struct {
        RulesResponded                 :: SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded;
        RulesFailedToRespond           :: SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond;
        RulesRefreshComplete           :: SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete;
    };

    SteamIPAddress_t : struct {
        IsSet                          :: SteamAPI_SteamIPAddress_t_IsSet;
    };

    MatchMakingKeyValuePair_t : struct {
        Construct                      :: SteamAPI_MatchMakingKeyValuePair_t_Construct;
    };

    servernetadr_t : struct {
        Construct                      :: SteamAPI_servernetadr_t_Construct;
        Init                           :: SteamAPI_servernetadr_t_Init;
        GetQueryPort                   :: SteamAPI_servernetadr_t_GetQueryPort;
        SetQueryPort                   :: SteamAPI_servernetadr_t_SetQueryPort;
        GetConnectionPort              :: SteamAPI_servernetadr_t_GetConnectionPort;
        SetConnectionPort              :: SteamAPI_servernetadr_t_SetConnectionPort;
        GetIP                          :: SteamAPI_servernetadr_t_GetIP;
        SetIP                          :: SteamAPI_servernetadr_t_SetIP;
        GetConnectionAddressString     :: SteamAPI_servernetadr_t_GetConnectionAddressString;
        GetQueryAddressString          :: SteamAPI_servernetadr_t_GetQueryAddressString;
        IsLessThan                     :: SteamAPI_servernetadr_t_IsLessThan;
        Assign                         :: SteamAPI_servernetadr_t_Assign;
    };

    gameserveritem_t : struct {
        Construct                      :: SteamAPI_gameserveritem_t_Construct;
        GetName                        :: SteamAPI_gameserveritem_t_GetName;
        SetName                        :: SteamAPI_gameserveritem_t_SetName;
    };

    SteamNetworkingIPAddr : struct {
        Clear                          :: SteamAPI_SteamNetworkingIPAddr_Clear;
        IsIPv6AllZeros                 :: SteamAPI_SteamNetworkingIPAddr_IsIPv6AllZeros;
        SetIPv6                        :: SteamAPI_SteamNetworkingIPAddr_SetIPv6;
        SetIPv4                        :: SteamAPI_SteamNetworkingIPAddr_SetIPv4;
        IsIPv4                         :: SteamAPI_SteamNetworkingIPAddr_IsIPv4;
        GetIPv4                        :: SteamAPI_SteamNetworkingIPAddr_GetIPv4;
        SetIPv6LocalHost               :: SteamAPI_SteamNetworkingIPAddr_SetIPv6LocalHost;
        IsLocalHost                    :: SteamAPI_SteamNetworkingIPAddr_IsLocalHost;
        ToString                       :: SteamAPI_SteamNetworkingIPAddr_ToString;
        ParseString                    :: SteamAPI_SteamNetworkingIPAddr_ParseString;
        IsEqualTo                      :: SteamAPI_SteamNetworkingIPAddr_IsEqualTo;
    };

    SteamNetworkingIdentity : struct {
        Clear                          :: SteamAPI_SteamNetworkingIdentity_Clear;
        IsInvalid                      :: SteamAPI_SteamNetworkingIdentity_IsInvalid;
        SetSteamID                     :: SteamAPI_SteamNetworkingIdentity_SetSteamID;
        GetSteamID                     :: SteamAPI_SteamNetworkingIdentity_GetSteamID;
        SetSteamID64                   :: SteamAPI_SteamNetworkingIdentity_SetSteamID64;
        GetSteamID64                   :: SteamAPI_SteamNetworkingIdentity_GetSteamID64;
        SetXboxPairwiseID              :: SteamAPI_SteamNetworkingIdentity_SetXboxPairwiseID;
        GetXboxPairwiseID              :: SteamAPI_SteamNetworkingIdentity_GetXboxPairwiseID;
        SetIPAddr                      :: SteamAPI_SteamNetworkingIdentity_SetIPAddr;
        GetIPAddr                      :: SteamAPI_SteamNetworkingIdentity_GetIPAddr;
        SetLocalHost                   :: SteamAPI_SteamNetworkingIdentity_SetLocalHost;
        IsLocalHost                    :: SteamAPI_SteamNetworkingIdentity_IsLocalHost;
        SetGenericString               :: SteamAPI_SteamNetworkingIdentity_SetGenericString;
        GetGenericString               :: SteamAPI_SteamNetworkingIdentity_GetGenericString;
        SetGenericBytes                :: SteamAPI_SteamNetworkingIdentity_SetGenericBytes;
        GetGenericBytes                :: SteamAPI_SteamNetworkingIdentity_GetGenericBytes;
        IsEqualTo                      :: SteamAPI_SteamNetworkingIdentity_IsEqualTo;
        ToString                       :: SteamAPI_SteamNetworkingIdentity_ToString;
        ParseString                    :: SteamAPI_SteamNetworkingIdentity_ParseString;
    };

    SteamNetworkingMessage_t : struct {
        Release                        :: SteamAPI_SteamNetworkingMessage_t_Release;
    };

    SteamNetworkingConfigValue_t : struct {
        SetInt32                       :: SteamAPI_SteamNetworkingConfigValue_t_SetInt32;
        SetInt64                       :: SteamAPI_SteamNetworkingConfigValue_t_SetInt64;
        SetFloat                       :: SteamAPI_SteamNetworkingConfigValue_t_SetFloat;
        SetPtr                         :: SteamAPI_SteamNetworkingConfigValue_t_SetPtr;
        SetString                      :: SteamAPI_SteamNetworkingConfigValue_t_SetString;
    };

    SteamNetworkingPOPIDRender : struct {
        c_str                          :: SteamAPI_SteamNetworkingPOPIDRender_c_str;
    };

    SteamNetworkingIdentityRender : struct {
        c_str                          :: SteamAPI_SteamNetworkingIdentityRender_c_str;
    };

    SteamNetworkingIPAddrRender : struct {
        c_str                          :: SteamAPI_SteamNetworkingIPAddrRender_c_str;
    };

    SteamDatagramHostedAddress : struct {
        Clear                          :: SteamAPI_SteamDatagramHostedAddress_Clear;
        GetPopID                       :: SteamAPI_SteamDatagramHostedAddress_GetPopID;
        SetDevAddress                  :: SteamAPI_SteamDatagramHostedAddress_SetDevAddress;
    };
}
