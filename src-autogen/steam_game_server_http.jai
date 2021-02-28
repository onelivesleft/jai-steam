steam_game_server_http : *ISteamHTTP;
SteamGameServerHTTP : SteamGameServerHTTP_Namespace;


#scope_file


SteamGameServerHTTP_Namespace :: struct {
    // procs
    CreateHTTPRequest                                  :: SteamHTTP_CreateHTTPRequest;
    SetHTTPRequestContextValue                         :: SteamHTTP_SetHTTPRequestContextValue;
    SetHTTPRequestNetworkActivityTimeout               :: SteamHTTP_SetHTTPRequestNetworkActivityTimeout;
    SetHTTPRequestHeaderValue                          :: SteamHTTP_SetHTTPRequestHeaderValue;
    SetHTTPRequestGetOrPostParameter                   :: SteamHTTP_SetHTTPRequestGetOrPostParameter;
    SendHTTPRequest                                    :: SteamHTTP_SendHTTPRequest;
    SendHTTPRequestAndStreamResponse                   :: SteamHTTP_SendHTTPRequestAndStreamResponse;
    DeferHTTPRequest                                   :: SteamHTTP_DeferHTTPRequest;
    PrioritizeHTTPRequest                              :: SteamHTTP_PrioritizeHTTPRequest;
    GetHTTPResponseHeaderSize                          :: SteamHTTP_GetHTTPResponseHeaderSize;
    GetHTTPResponseHeaderValue                         :: SteamHTTP_GetHTTPResponseHeaderValue;
    GetHTTPResponseBodySize                            :: SteamHTTP_GetHTTPResponseBodySize;
    GetHTTPResponseBodyData                            :: SteamHTTP_GetHTTPResponseBodyData;
    GetHTTPStreamingResponseBodyData                   :: SteamHTTP_GetHTTPStreamingResponseBodyData;
    ReleaseHTTPRequest                                 :: SteamHTTP_ReleaseHTTPRequest;
    GetHTTPDownloadProgressPct                         :: SteamHTTP_GetHTTPDownloadProgressPct;
    SetHTTPRequestRawPostBody                          :: SteamHTTP_SetHTTPRequestRawPostBody;
    CreateCookieContainer                              :: SteamHTTP_CreateCookieContainer;
    ReleaseCookieContainer                             :: SteamHTTP_ReleaseCookieContainer;
    SetCookie                                          :: SteamHTTP_SetCookie;
    SetHTTPRequestCookieContainer                      :: SteamHTTP_SetHTTPRequestCookieContainer;
    SetHTTPRequestUserAgentInfo                        :: SteamHTTP_SetHTTPRequestUserAgentInfo;
    SetHTTPRequestRequiresVerifiedCertificate          :: SteamHTTP_SetHTTPRequestRequiresVerifiedCertificate;
    SetHTTPRequestAbsoluteTimeoutMS                    :: SteamHTTP_SetHTTPRequestAbsoluteTimeoutMS;
    GetHTTPRequestWasTimedOut                          :: SteamHTTP_GetHTTPRequestWasTimedOut;
}


SteamHTTP_CreateHTTPRequest :: inline (eHTTPRequestMethod: EHTTPMethod, pchAbsoluteURL: *char) -> HTTPRequestHandle {
    return SteamAPI_ISteamHTTP_CreateHTTPRequest(steam_game_server_http, eHTTPRequestMethod, pchAbsoluteURL);
}


SteamHTTP_SetHTTPRequestContextValue :: inline (hRequest: HTTPRequestHandle, ulContextValue: uint64) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestContextValue(steam_game_server_http, hRequest, ulContextValue);
}


SteamHTTP_SetHTTPRequestNetworkActivityTimeout :: inline (hRequest: HTTPRequestHandle, unTimeoutSeconds: uint32) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestNetworkActivityTimeout(steam_game_server_http, hRequest, unTimeoutSeconds);
}


SteamHTTP_SetHTTPRequestHeaderValue :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, pchHeaderValue: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestHeaderValue(steam_game_server_http, hRequest, pchHeaderName, pchHeaderValue);
}


SteamHTTP_SetHTTPRequestGetOrPostParameter :: inline (hRequest: HTTPRequestHandle, pchParamName: *char, pchParamValue: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestGetOrPostParameter(steam_game_server_http, hRequest, pchParamName, pchParamValue);
}


SteamHTTP_SendHTTPRequest :: inline (hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool {
    return SteamAPI_ISteamHTTP_SendHTTPRequest(steam_game_server_http, hRequest, pCallHandle);
}


SteamHTTP_SendHTTPRequestAndStreamResponse :: inline (hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool {
    return SteamAPI_ISteamHTTP_SendHTTPRequestAndStreamResponse(steam_game_server_http, hRequest, pCallHandle);
}


SteamHTTP_DeferHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool {
    return SteamAPI_ISteamHTTP_DeferHTTPRequest(steam_game_server_http, hRequest);
}


SteamHTTP_PrioritizeHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool {
    return SteamAPI_ISteamHTTP_PrioritizeHTTPRequest(steam_game_server_http, hRequest);
}


SteamHTTP_GetHTTPResponseHeaderSize :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, unResponseHeaderSize: *uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseHeaderSize(steam_game_server_http, hRequest, pchHeaderName, unResponseHeaderSize);
}


SteamHTTP_GetHTTPResponseHeaderValue :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, pHeaderValueBuffer: *uint8, unBufferSize: uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseHeaderValue(steam_game_server_http, hRequest, pchHeaderName, pHeaderValueBuffer, unBufferSize);
}


SteamHTTP_GetHTTPResponseBodySize :: inline (hRequest: HTTPRequestHandle, unBodySize: *uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseBodySize(steam_game_server_http, hRequest, unBodySize);
}


SteamHTTP_GetHTTPResponseBodyData :: inline (hRequest: HTTPRequestHandle, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseBodyData(steam_game_server_http, hRequest, pBodyDataBuffer, unBufferSize);
}


SteamHTTP_GetHTTPStreamingResponseBodyData :: inline (hRequest: HTTPRequestHandle, cOffset: uint32, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPStreamingResponseBodyData(steam_game_server_http, hRequest, cOffset, pBodyDataBuffer, unBufferSize);
}


SteamHTTP_ReleaseHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool {
    return SteamAPI_ISteamHTTP_ReleaseHTTPRequest(steam_game_server_http, hRequest);
}


SteamHTTP_GetHTTPDownloadProgressPct :: inline (hRequest: HTTPRequestHandle, pflPercentOut: *float) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPDownloadProgressPct(steam_game_server_http, hRequest, pflPercentOut);
}


SteamHTTP_SetHTTPRequestRawPostBody :: inline (hRequest: HTTPRequestHandle, pchContentType: *char, pubBody: *uint8, unBodyLen: uint32) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestRawPostBody(steam_game_server_http, hRequest, pchContentType, pubBody, unBodyLen);
}


SteamHTTP_CreateCookieContainer :: inline (bAllowResponsesToModify: bool) -> HTTPCookieContainerHandle {
    return SteamAPI_ISteamHTTP_CreateCookieContainer(steam_game_server_http, bAllowResponsesToModify);
}


SteamHTTP_ReleaseCookieContainer :: inline (hCookieContainer: HTTPCookieContainerHandle) -> bool {
    return SteamAPI_ISteamHTTP_ReleaseCookieContainer(steam_game_server_http, hCookieContainer);
}


SteamHTTP_SetCookie :: inline (hCookieContainer: HTTPCookieContainerHandle, pchHost: *char, pchUrl: *char, pchCookie: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetCookie(steam_game_server_http, hCookieContainer, pchHost, pchUrl, pchCookie);
}


SteamHTTP_SetHTTPRequestCookieContainer :: inline (hRequest: HTTPRequestHandle, hCookieContainer: HTTPCookieContainerHandle) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestCookieContainer(steam_game_server_http, hRequest, hCookieContainer);
}


SteamHTTP_SetHTTPRequestUserAgentInfo :: inline (hRequest: HTTPRequestHandle, pchUserAgentInfo: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestUserAgentInfo(steam_game_server_http, hRequest, pchUserAgentInfo);
}


SteamHTTP_SetHTTPRequestRequiresVerifiedCertificate :: inline (hRequest: HTTPRequestHandle, bRequireVerifiedCertificate: bool) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate(steam_game_server_http, hRequest, bRequireVerifiedCertificate);
}


SteamHTTP_SetHTTPRequestAbsoluteTimeoutMS :: inline (hRequest: HTTPRequestHandle, unMilliseconds: uint32) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS(steam_game_server_http, hRequest, unMilliseconds);
}


SteamHTTP_GetHTTPRequestWasTimedOut :: inline (hRequest: HTTPRequestHandle, pbWasTimedOut: *bool) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPRequestWasTimedOut(steam_game_server_http, hRequest, pbWasTimedOut);
}
