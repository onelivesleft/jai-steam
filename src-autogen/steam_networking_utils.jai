steam_networking_utils : *ISteamNetworkingUtils;
SteamNetworkingUtils : SteamNetworkingUtils_Namespace;


#scope_file


SteamNetworkingUtils_Namespace :: struct {
    // procs
    AllocateMessage                                    :: SteamNetworkingUtils_AllocateMessage;
    InitRelayNetworkAccess                             :: SteamNetworkingUtils_InitRelayNetworkAccess;
    GetRelayNetworkStatus                              :: SteamNetworkingUtils_GetRelayNetworkStatus;
    GetLocalPingLocation                               :: SteamNetworkingUtils_GetLocalPingLocation;
    EstimatePingTimeBetweenTwoLocations                :: SteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations;
    EstimatePingTimeFromLocalHost                      :: SteamNetworkingUtils_EstimatePingTimeFromLocalHost;
    ConvertPingLocationToString                        :: SteamNetworkingUtils_ConvertPingLocationToString;
    ParsePingLocationString                            :: SteamNetworkingUtils_ParsePingLocationString;
    CheckPingDataUpToDate                              :: SteamNetworkingUtils_CheckPingDataUpToDate;
    GetPingToDataCenter                                :: SteamNetworkingUtils_GetPingToDataCenter;
    GetDirectPingToPOP                                 :: SteamNetworkingUtils_GetDirectPingToPOP;
    GetPOPCount                                        :: SteamNetworkingUtils_GetPOPCount;
    GetPOPList                                         :: SteamNetworkingUtils_GetPOPList;
    GetLocalTimestamp                                  :: SteamNetworkingUtils_GetLocalTimestamp;
    SetDebugOutputFunction                             :: SteamNetworkingUtils_SetDebugOutputFunction;
    SetGlobalConfigValueInt32                          :: SteamNetworkingUtils_SetGlobalConfigValueInt32;
    SetGlobalConfigValueFloat                          :: SteamNetworkingUtils_SetGlobalConfigValueFloat;
    SetGlobalConfigValueString                         :: SteamNetworkingUtils_SetGlobalConfigValueString;
    SetGlobalConfigValuePtr                            :: SteamNetworkingUtils_SetGlobalConfigValuePtr;
    SetConnectionConfigValueInt32                      :: SteamNetworkingUtils_SetConnectionConfigValueInt32;
    SetConnectionConfigValueFloat                      :: SteamNetworkingUtils_SetConnectionConfigValueFloat;
    SetConnectionConfigValueString                     :: SteamNetworkingUtils_SetConnectionConfigValueString;
    SetGlobalCallback_SteamNetConnectionStatusChanged  :: SteamNetworkingUtils_SetGlobalCallback_SteamNetConnectionStatusChanged;
    SetGlobalCallback_SteamNetAuthenticationStatusChanged:: SteamNetworkingUtils_SetGlobalCallback_SteamNetAuthenticationStatusChanged;
    SetGlobalCallback_SteamRelayNetworkStatusChanged   :: SteamNetworkingUtils_SetGlobalCallback_SteamRelayNetworkStatusChanged;
    SetGlobalCallback_MessagesSessionRequest           :: SteamNetworkingUtils_SetGlobalCallback_MessagesSessionRequest;
    SetGlobalCallback_MessagesSessionFailed            :: SteamNetworkingUtils_SetGlobalCallback_MessagesSessionFailed;
    SetConfigValue                                     :: SteamNetworkingUtils_SetConfigValue;
    SetConfigValueStruct                               :: SteamNetworkingUtils_SetConfigValueStruct;
    GetConfigValue                                     :: SteamNetworkingUtils_GetConfigValue;
    GetConfigValueInfo                                 :: SteamNetworkingUtils_GetConfigValueInfo;
    GetFirstConfigValue                                :: SteamNetworkingUtils_GetFirstConfigValue;
    SteamNetworkingIPAddr_ToString                     :: SteamNetworkingUtils_SteamNetworkingIPAddr_ToString;
    SteamNetworkingIPAddr_ParseString                  :: SteamNetworkingUtils_SteamNetworkingIPAddr_ParseString;
    SteamNetworkingIdentity_ToString                   :: SteamNetworkingUtils_SteamNetworkingIdentity_ToString;
    SteamNetworkingIdentity_ParseString                :: SteamNetworkingUtils_SteamNetworkingIdentity_ParseString;
}


SteamNetworkingUtils_AllocateMessage :: inline (cbAllocateBuffer: s32) -> *SteamNetworkingMessage_t {
    return SteamAPI_ISteamNetworkingUtils_AllocateMessage(steam_networking_utils, cbAllocateBuffer);
}


SteamNetworkingUtils_InitRelayNetworkAccess :: inline () {
    SteamAPI_ISteamNetworkingUtils_InitRelayNetworkAccess(steam_networking_utils);
}


SteamNetworkingUtils_GetRelayNetworkStatus :: inline (pDetails: *SteamRelayNetworkStatus_t) -> ESteamNetworkingAvailability {
    return SteamAPI_ISteamNetworkingUtils_GetRelayNetworkStatus(steam_networking_utils, pDetails);
}


SteamNetworkingUtils_GetLocalPingLocation :: inline (result: *SteamNetworkPingLocation_t) -> float {
    return SteamAPI_ISteamNetworkingUtils_GetLocalPingLocation(steam_networking_utils, result);
}


SteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations :: inline (location1: *SteamNetworkPingLocation_t, location2: *SteamNetworkPingLocation_t) -> s32 {
    return SteamAPI_ISteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations(steam_networking_utils, location1, location2);
}


SteamNetworkingUtils_EstimatePingTimeFromLocalHost :: inline (remoteLocation: *SteamNetworkPingLocation_t) -> s32 {
    return SteamAPI_ISteamNetworkingUtils_EstimatePingTimeFromLocalHost(steam_networking_utils, remoteLocation);
}


SteamNetworkingUtils_ConvertPingLocationToString :: inline (location: *SteamNetworkPingLocation_t, pszBuf: *char, cchBufSize: s32) {
    SteamAPI_ISteamNetworkingUtils_ConvertPingLocationToString(steam_networking_utils, location, pszBuf, cchBufSize);
}


SteamNetworkingUtils_ParsePingLocationString :: inline (pszString: *char, result: *SteamNetworkPingLocation_t) -> bool {
    return SteamAPI_ISteamNetworkingUtils_ParsePingLocationString(steam_networking_utils, pszString, result);
}


SteamNetworkingUtils_CheckPingDataUpToDate :: inline (flMaxAgeSeconds: float) -> bool {
    return SteamAPI_ISteamNetworkingUtils_CheckPingDataUpToDate(steam_networking_utils, flMaxAgeSeconds);
}


SteamNetworkingUtils_GetPingToDataCenter :: inline (popID: SteamNetworkingPOPID, pViaRelayPoP: *SteamNetworkingPOPID) -> s32 {
    return SteamAPI_ISteamNetworkingUtils_GetPingToDataCenter(steam_networking_utils, popID, pViaRelayPoP);
}


SteamNetworkingUtils_GetDirectPingToPOP :: inline (popID: SteamNetworkingPOPID) -> s32 {
    return SteamAPI_ISteamNetworkingUtils_GetDirectPingToPOP(steam_networking_utils, popID);
}


SteamNetworkingUtils_GetPOPCount :: inline () -> s32 {
    return SteamAPI_ISteamNetworkingUtils_GetPOPCount(steam_networking_utils);
}


SteamNetworkingUtils_GetPOPList :: inline (list: *SteamNetworkingPOPID, nListSz: s32) -> s32 {
    return SteamAPI_ISteamNetworkingUtils_GetPOPList(steam_networking_utils, list, nListSz);
}


SteamNetworkingUtils_GetLocalTimestamp :: inline () -> SteamNetworkingMicroseconds {
    return SteamAPI_ISteamNetworkingUtils_GetLocalTimestamp(steam_networking_utils);
}


SteamNetworkingUtils_SetDebugOutputFunction :: inline (eDetailLevel: ESteamNetworkingSocketsDebugOutputType, pfnFunc: FSteamNetworkingSocketsDebugOutput) {
    SteamAPI_ISteamNetworkingUtils_SetDebugOutputFunction(steam_networking_utils, eDetailLevel, pfnFunc);
}


SteamNetworkingUtils_SetGlobalConfigValueInt32 :: inline (eValue: ESteamNetworkingConfigValue, val: int32) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueInt32(steam_networking_utils, eValue, val);
}


SteamNetworkingUtils_SetGlobalConfigValueFloat :: inline (eValue: ESteamNetworkingConfigValue, val: float) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueFloat(steam_networking_utils, eValue, val);
}


SteamNetworkingUtils_SetGlobalConfigValueString :: inline (eValue: ESteamNetworkingConfigValue, val: *char) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueString(steam_networking_utils, eValue, val);
}


SteamNetworkingUtils_SetGlobalConfigValuePtr :: inline (eValue: ESteamNetworkingConfigValue, val: *void) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValuePtr(steam_networking_utils, eValue, val);
}


SteamNetworkingUtils_SetConnectionConfigValueInt32 :: inline (hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: int32) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueInt32(steam_networking_utils, hConn, eValue, val);
}


SteamNetworkingUtils_SetConnectionConfigValueFloat :: inline (hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: float) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueFloat(steam_networking_utils, hConn, eValue, val);
}


SteamNetworkingUtils_SetConnectionConfigValueString :: inline (hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: *char) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueString(steam_networking_utils, hConn, eValue, val);
}


SteamNetworkingUtils_SetGlobalCallback_SteamNetConnectionStatusChanged :: inline (fnCallback: FnSteamNetConnectionStatusChanged) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamNetConnectionStatusChanged(steam_networking_utils, fnCallback);
}


SteamNetworkingUtils_SetGlobalCallback_SteamNetAuthenticationStatusChanged :: inline (fnCallback: FnSteamNetAuthenticationStatusChanged) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamNetAuthenticationStatusChanged(steam_networking_utils, fnCallback);
}


SteamNetworkingUtils_SetGlobalCallback_SteamRelayNetworkStatusChanged :: inline (fnCallback: FnSteamRelayNetworkStatusChanged) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamRelayNetworkStatusChanged(steam_networking_utils, fnCallback);
}


SteamNetworkingUtils_SetGlobalCallback_MessagesSessionRequest :: inline (fnCallback: FnSteamNetworkingMessagesSessionRequest) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_MessagesSessionRequest(steam_networking_utils, fnCallback);
}


SteamNetworkingUtils_SetGlobalCallback_MessagesSessionFailed :: inline (fnCallback: FnSteamNetworkingMessagesSessionFailed) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_MessagesSessionFailed(steam_networking_utils, fnCallback);
}


SteamNetworkingUtils_SetConfigValue :: inline (eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr_t, eDataType: ESteamNetworkingConfigDataType, pArg: *void) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetConfigValue(steam_networking_utils, eValue, eScopeType, scopeObj, eDataType, pArg);
}


SteamNetworkingUtils_SetConfigValueStruct :: inline (opt: *SteamNetworkingConfigValue_t, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr_t) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetConfigValueStruct(steam_networking_utils, opt, eScopeType, scopeObj);
}


SteamNetworkingUtils_GetConfigValue :: inline (eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr_t, pOutDataType: *ESteamNetworkingConfigDataType, pResult: *void, cbResult: *size_t) -> ESteamNetworkingGetConfigValueResult {
    return SteamAPI_ISteamNetworkingUtils_GetConfigValue(steam_networking_utils, eValue, eScopeType, scopeObj, pOutDataType, pResult, cbResult);
}


SteamNetworkingUtils_GetConfigValueInfo :: inline (eValue: ESteamNetworkingConfigValue, pOutName: **char, pOutDataType: *ESteamNetworkingConfigDataType, pOutScope: *ESteamNetworkingConfigScope, pOutNextValue: *ESteamNetworkingConfigValue) -> bool {
    return SteamAPI_ISteamNetworkingUtils_GetConfigValueInfo(steam_networking_utils, eValue, pOutName, pOutDataType, pOutScope, pOutNextValue);
}


SteamNetworkingUtils_GetFirstConfigValue :: inline () -> ESteamNetworkingConfigValue {
    return SteamAPI_ISteamNetworkingUtils_GetFirstConfigValue(steam_networking_utils);
}


SteamNetworkingUtils_SteamNetworkingIPAddr_ToString :: inline (addr: *SteamNetworkingIPAddr, buf: *char, cbBuf: uint32, bWithPort: bool) {
    SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ToString(steam_networking_utils, addr, buf, cbBuf, bWithPort);
}


SteamNetworkingUtils_SteamNetworkingIPAddr_ParseString :: inline (pAddr: *SteamNetworkingIPAddr, pszStr: *char) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ParseString(steam_networking_utils, pAddr, pszStr);
}


SteamNetworkingUtils_SteamNetworkingIdentity_ToString :: inline (identity: *SteamNetworkingIdentity, buf: *char, cbBuf: uint32) {
    SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ToString(steam_networking_utils, identity, buf, cbBuf);
}


SteamNetworkingUtils_SteamNetworkingIdentity_ParseString :: inline (pIdentity: *SteamNetworkingIdentity, pszStr: *char) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ParseString(steam_networking_utils, pIdentity, pszStr);
}
