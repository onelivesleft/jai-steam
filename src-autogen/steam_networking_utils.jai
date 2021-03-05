steam_networking_utils : *ISteamNetworkingUtils;


AllocateMessage :: inline (cbAllocateBuffer: s32) -> *SteamNetworkingMessage_t {
    return SteamAPI_ISteamNetworkingUtils_AllocateMessage(steam_networking_utils, cbAllocateBuffer);
}


InitRelayNetworkAccess :: inline () {
    SteamAPI_ISteamNetworkingUtils_InitRelayNetworkAccess(steam_networking_utils);
}


GetRelayNetworkStatus :: inline (pDetails: *SteamRelayNetworkStatus_t) -> ESteamNetworkingAvailability {
    return SteamAPI_ISteamNetworkingUtils_GetRelayNetworkStatus(steam_networking_utils, pDetails);
}


GetLocalPingLocation :: inline (result: *SteamNetworkPingLocation_t) -> float {
    return SteamAPI_ISteamNetworkingUtils_GetLocalPingLocation(steam_networking_utils, result);
}


EstimatePingTimeBetweenTwoLocations :: inline (location1: *SteamNetworkPingLocation_t, location2: *SteamNetworkPingLocation_t) -> s32 {
    return SteamAPI_ISteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations(steam_networking_utils, location1, location2);
}


EstimatePingTimeFromLocalHost :: inline (remoteLocation: *SteamNetworkPingLocation_t) -> s32 {
    return SteamAPI_ISteamNetworkingUtils_EstimatePingTimeFromLocalHost(steam_networking_utils, remoteLocation);
}


ConvertPingLocationToString :: inline (location: *SteamNetworkPingLocation_t, pszBuf: *char, cchBufSize: s32) {
    SteamAPI_ISteamNetworkingUtils_ConvertPingLocationToString(steam_networking_utils, location, pszBuf, cchBufSize);
}


ParsePingLocationString :: inline (pszString: *char, result: *SteamNetworkPingLocation_t) -> bool {
    return SteamAPI_ISteamNetworkingUtils_ParsePingLocationString(steam_networking_utils, pszString, result);
}


CheckPingDataUpToDate :: inline (flMaxAgeSeconds: float) -> bool {
    return SteamAPI_ISteamNetworkingUtils_CheckPingDataUpToDate(steam_networking_utils, flMaxAgeSeconds);
}


GetPingToDataCenter :: inline (popID: SteamNetworkingPOPID, pViaRelayPoP: *SteamNetworkingPOPID) -> s32 {
    return SteamAPI_ISteamNetworkingUtils_GetPingToDataCenter(steam_networking_utils, popID, pViaRelayPoP);
}


GetDirectPingToPOP :: inline (popID: SteamNetworkingPOPID) -> s32 {
    return SteamAPI_ISteamNetworkingUtils_GetDirectPingToPOP(steam_networking_utils, popID);
}


GetPOPCount :: inline () -> s32 {
    return SteamAPI_ISteamNetworkingUtils_GetPOPCount(steam_networking_utils);
}


GetPOPList :: inline (list: *SteamNetworkingPOPID, nListSz: s32) -> s32 {
    return SteamAPI_ISteamNetworkingUtils_GetPOPList(steam_networking_utils, list, nListSz);
}


GetLocalTimestamp :: inline () -> SteamNetworkingMicroseconds {
    return SteamAPI_ISteamNetworkingUtils_GetLocalTimestamp(steam_networking_utils);
}


SetDebugOutputFunction :: inline (eDetailLevel: ESteamNetworkingSocketsDebugOutputType, pfnFunc: FSteamNetworkingSocketsDebugOutput) {
    SteamAPI_ISteamNetworkingUtils_SetDebugOutputFunction(steam_networking_utils, eDetailLevel, pfnFunc);
}


SetGlobalConfigValueInt32 :: inline (eValue: ESteamNetworkingConfigValue, val: int32) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueInt32(steam_networking_utils, eValue, val);
}


SetGlobalConfigValueFloat :: inline (eValue: ESteamNetworkingConfigValue, val: float) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueFloat(steam_networking_utils, eValue, val);
}


SetGlobalConfigValueString :: inline (eValue: ESteamNetworkingConfigValue, val: *char) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueString(steam_networking_utils, eValue, val);
}


SetGlobalConfigValuePtr :: inline (eValue: ESteamNetworkingConfigValue, val: *void) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValuePtr(steam_networking_utils, eValue, val);
}


SetConnectionConfigValueInt32 :: inline (hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: int32) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueInt32(steam_networking_utils, hConn, eValue, val);
}


SetConnectionConfigValueFloat :: inline (hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: float) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueFloat(steam_networking_utils, hConn, eValue, val);
}


SetConnectionConfigValueString :: inline (hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: *char) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueString(steam_networking_utils, hConn, eValue, val);
}


SteamNetConnectionStatusChanged :: inline (fnCallback: FnSteamNetConnectionStatusChanged) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamNetConnectionStatusChanged(steam_networking_utils, fnCallback);
}


SteamNetAuthenticationStatusChanged :: inline (fnCallback: FnSteamNetAuthenticationStatusChanged) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamNetAuthenticationStatusChanged(steam_networking_utils, fnCallback);
}


SteamRelayNetworkStatusChanged :: inline (fnCallback: FnSteamRelayNetworkStatusChanged) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamRelayNetworkStatusChanged(steam_networking_utils, fnCallback);
}


MessagesSessionRequest :: inline (fnCallback: FnSteamNetworkingMessagesSessionRequest) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_MessagesSessionRequest(steam_networking_utils, fnCallback);
}


MessagesSessionFailed :: inline (fnCallback: FnSteamNetworkingMessagesSessionFailed) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_MessagesSessionFailed(steam_networking_utils, fnCallback);
}


SetConfigValue :: inline (eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr_t, eDataType: ESteamNetworkingConfigDataType, pArg: *void) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetConfigValue(steam_networking_utils, eValue, eScopeType, scopeObj, eDataType, pArg);
}


SetConfigValueStruct :: inline (opt: *SteamNetworkingConfigValue_t, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr_t) -> bool {
    return SteamAPI_ISteamNetworkingUtils_SetConfigValueStruct(steam_networking_utils, opt, eScopeType, scopeObj);
}


GetConfigValue :: inline (eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr_t, pOutDataType: *ESteamNetworkingConfigDataType, pResult: *void, cbResult: *size_t) -> ESteamNetworkingGetConfigValueResult {
    return SteamAPI_ISteamNetworkingUtils_GetConfigValue(steam_networking_utils, eValue, eScopeType, scopeObj, pOutDataType, pResult, cbResult);
}


GetConfigValueInfo :: inline (eValue: ESteamNetworkingConfigValue, pOutName: **char, pOutDataType: *ESteamNetworkingConfigDataType, pOutScope: *ESteamNetworkingConfigScope, pOutNextValue: *ESteamNetworkingConfigValue) -> bool {
    return SteamAPI_ISteamNetworkingUtils_GetConfigValueInfo(steam_networking_utils, eValue, pOutName, pOutDataType, pOutScope, pOutNextValue);
}


GetFirstConfigValue :: inline () -> ESteamNetworkingConfigValue {
    return SteamAPI_ISteamNetworkingUtils_GetFirstConfigValue(steam_networking_utils);
}
