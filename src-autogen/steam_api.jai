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
    RunCallbacks               :: SteamAPI_RunCallbacks;

    hmakingServerListResponse : struct {
        ServerResponded                :: SteamMatchmakingServerListResponse_ServerResponded;
        ServerFailedToRespond          :: SteamMatchmakingServerListResponse_ServerFailedToRespond;
        RefreshComplete                :: SteamMatchmakingServerListResponse_RefreshComplete;
    };

    hmakingPingResponse : struct {
        ServerResponded                :: SteamMatchmakingPingResponse_ServerResponded;
        ServerFailedToRespond          :: SteamMatchmakingPingResponse_ServerFailedToRespond;
    };

    hmakingPlayersResponse : struct {
        AddPlayerToList                :: SteamMatchmakingPlayersResponse_AddPlayerToList;
        PlayersFailedToRespond         :: SteamMatchmakingPlayersResponse_PlayersFailedToRespond;
        PlayersRefreshComplete         :: SteamMatchmakingPlayersResponse_PlayersRefreshComplete;
    };

    hmakingRulesResponse : struct {
        RulesResponded                 :: SteamMatchmakingRulesResponse_RulesResponded;
        RulesFailedToRespond           :: SteamMatchmakingRulesResponse_RulesFailedToRespond;
        RulesRefreshComplete           :: SteamMatchmakingRulesResponse_RulesRefreshComplete;
    };

    dress_t : struct {
        IsSet                          :: SteamIPAddress_t_IsSet;
    };

    ngKeyValuePair_t : struct {
        Construct                      :: MatchMakingKeyValuePair_t_Construct;
    };

    adr_t : struct {
        Construct                      :: servernetadr_t_Construct;
        Init                           :: servernetadr_t_Init;
        GetQueryPort                   :: servernetadr_t_GetQueryPort;
        SetQueryPort                   :: servernetadr_t_SetQueryPort;
        GetConnectionPort              :: servernetadr_t_GetConnectionPort;
        SetConnectionPort              :: servernetadr_t_SetConnectionPort;
        GetIP                          :: servernetadr_t_GetIP;
        SetIP                          :: servernetadr_t_SetIP;
        GetConnectionAddressString     :: servernetadr_t_GetConnectionAddressString;
        GetQueryAddressString          :: servernetadr_t_GetQueryAddressString;
        IsLessThan                     :: servernetadr_t_IsLessThan;
        Assign                         :: servernetadr_t_Assign;
    };

    ritem_t : struct {
        Construct                      :: gameserveritem_t_Construct;
        GetName                        :: gameserveritem_t_GetName;
        SetName                        :: gameserveritem_t_SetName;
    };

    orkingIPAddr : struct {
        Clear                          :: SteamNetworkingIPAddr_Clear;
        IsIPv6AllZeros                 :: SteamNetworkingIPAddr_IsIPv6AllZeros;
        SetIPv6                        :: SteamNetworkingIPAddr_SetIPv6;
        SetIPv4                        :: SteamNetworkingIPAddr_SetIPv4;
        IsIPv4                         :: SteamNetworkingIPAddr_IsIPv4;
        GetIPv4                        :: SteamNetworkingIPAddr_GetIPv4;
        SetIPv6LocalHost               :: SteamNetworkingIPAddr_SetIPv6LocalHost;
        IsLocalHost                    :: SteamNetworkingIPAddr_IsLocalHost;
        ToString                       :: SteamNetworkingIPAddr_ToString;
        ParseString                    :: SteamNetworkingIPAddr_ParseString;
        IsEqualTo                      :: SteamNetworkingIPAddr_IsEqualTo;
    };

    orkingIdentity : struct {
        Clear                          :: SteamNetworkingIdentity_Clear;
        IsInvalid                      :: SteamNetworkingIdentity_IsInvalid;
        SetSteamID                     :: SteamNetworkingIdentity_SetSteamID;
        GetSteamID                     :: SteamNetworkingIdentity_GetSteamID;
        SetSteamID64                   :: SteamNetworkingIdentity_SetSteamID64;
        GetSteamID64                   :: SteamNetworkingIdentity_GetSteamID64;
        SetXboxPairwiseID              :: SteamNetworkingIdentity_SetXboxPairwiseID;
        GetXboxPairwiseID              :: SteamNetworkingIdentity_GetXboxPairwiseID;
        SetIPAddr                      :: SteamNetworkingIdentity_SetIPAddr;
        GetIPAddr                      :: SteamNetworkingIdentity_GetIPAddr;
        SetLocalHost                   :: SteamNetworkingIdentity_SetLocalHost;
        IsLocalHost                    :: SteamNetworkingIdentity_IsLocalHost;
        SetGenericString               :: SteamNetworkingIdentity_SetGenericString;
        GetGenericString               :: SteamNetworkingIdentity_GetGenericString;
        SetGenericBytes                :: SteamNetworkingIdentity_SetGenericBytes;
        GetGenericBytes                :: SteamNetworkingIdentity_GetGenericBytes;
        IsEqualTo                      :: SteamNetworkingIdentity_IsEqualTo;
        ToString                       :: SteamNetworkingIdentity_ToString;
        ParseString                    :: SteamNetworkingIdentity_ParseString;
    };

    orkingMessage_t : struct {
        Release                        :: SteamNetworkingMessage_t_Release;
    };

    orkingConfigValue_t : struct {
        SetInt32                       :: SteamNetworkingConfigValue_t_SetInt32;
        SetInt64                       :: SteamNetworkingConfigValue_t_SetInt64;
        SetFloat                       :: SteamNetworkingConfigValue_t_SetFloat;
        SetPtr                         :: SteamNetworkingConfigValue_t_SetPtr;
        SetString                      :: SteamNetworkingConfigValue_t_SetString;
    };

    orkingPOPIDRender : struct {
        c_str                          :: SteamNetworkingPOPIDRender_c_str;
    };

    orkingIdentityRender : struct {
        c_str                          :: SteamNetworkingIdentityRender_c_str;
    };

    orkingIPAddrRender : struct {
        c_str                          :: SteamNetworkingIPAddrRender_c_str;
    };

    gramHostedAddress : struct {
        Clear                          :: SteamDatagramHostedAddress_Clear;
        GetPopID                       :: SteamDatagramHostedAddress_GetPopID;
        SetDevAddress                  :: SteamDatagramHostedAddress_SetDevAddress;
    };
}
