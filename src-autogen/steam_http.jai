steam_http : *ISteamHTTP;
SteamHTTP : SteamHTTP_Namespace;


#scope_file


SteamHTTP_Namespace :: struct {
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


SteamHTTP_CreateHTTPRequest :: inline (eHTTPRequestMethod: EHTTPMethod, pchAbsoluteURL: *char) -> HTTPRequestHandle #foreign steam "SteamAPI_ISteamHTTP_Cre {
    return SteamHTTP_CreateHTTPRequest(steam_http, eHTTPRequestMethod, pchAbsoluteURL);
}


SteamHTTP_SetHTTPRequestContextValue :: inline (hRequest: HTTPRequestHandle, ulContextValue: uint64) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPReque {
    return SteamHTTP_SetHTTPRequestContextValue(steam_http, hRequest, ulContextValue);
}


SteamHTTP_SetHTTPRequestNetworkActivityTimeout :: inline (hRequest: HTTPRequestHandle, unTimeoutSeconds: uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequestNetworkA {
    return SteamHTTP_SetHTTPRequestNetworkActivityTimeout(steam_http, hRequest, unTimeoutSeconds);
}


SteamHTTP_SetHTTPRequestHeaderValue :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, pchHeaderValue: *char) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequ {
    return SteamHTTP_SetHTTPRequestHeaderValue(steam_http, hRequest, pchHeaderName, pchHeaderValue);
}


SteamHTTP_SetHTTPRequestGetOrPostParameter :: inline (hRequest: HTTPRequestHandle, pchParamName: *char, pchParamValue: *char) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequestGetO {
    return SteamHTTP_SetHTTPRequestGetOrPostParameter(steam_http, hRequest, pchParamName, pchParamValue);
}


SteamHTTP_SendHTTPRequest :: inline (hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool #foreign steam "SteamAPI_ISteamHTTP_S {
    return SteamHTTP_SendHTTPRequest(steam_http, hRequest, pCallHandle);
}


SteamHTTP_SendHTTPRequestAndStreamResponse :: inline (hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool #foreign steam "SteamAPI_ISteamHTTP_SendHTTPRequestAnd {
    return SteamHTTP_SendHTTPRequestAndStreamResponse(steam_http, hRequest, pCallHandle);
}


SteamHTTP_DeferHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool #foreign steam "SteamAPI_ISteamHTTP_De {
    return SteamHTTP_DeferHTTPRequest(steam_http, hRequest);
}


SteamHTTP_PrioritizeHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool #foreign steam "SteamAPI_ISteamHTTP_Priorit {
    return SteamHTTP_PrioritizeHTTPRequest(steam_http, hRequest);
}


SteamHTTP_GetHTTPResponseHeaderSize :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, unResponseHeaderSize: *uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_GetHTTPResp {
    return SteamHTTP_GetHTTPResponseHeaderSize(steam_http, hRequest, pchHeaderName, unResponseHeaderSize);
}


SteamHTTP_GetHTTPResponseHeaderValue :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, pHeaderValueBuffer: *uint8, unBufferSize: uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_GetHTTPRespo {
    return SteamHTTP_GetHTTPResponseHeaderValue(steam_http, hRequest, pchHeaderName, pHeaderValueBuffer, unBufferSize);
}


SteamHTTP_GetHTTPResponseBodySize :: inline (hRequest: HTTPRequestHandle, unBodySize: *uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_GetHTTPRe {
    return SteamHTTP_GetHTTPResponseBodySize(steam_http, hRequest, unBodySize);
}


SteamHTTP_GetHTTPResponseBodyData :: inline (hRequest: HTTPRequestHandle, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_GetHTTPRe {
    return SteamHTTP_GetHTTPResponseBodyData(steam_http, hRequest, pBodyDataBuffer, unBufferSize);
}


SteamHTTP_GetHTTPStreamingResponseBodyData :: inline (hRequest: HTTPRequestHandle, cOffset: uint32, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_GetHTTPStreamingRe {
    return SteamHTTP_GetHTTPStreamingResponseBodyData(steam_http, hRequest, cOffset, pBodyDataBuffer, unBufferSize);
}


SteamHTTP_ReleaseHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool #foreign steam "SteamAPI_ISteamHTTP_Rele {
    return SteamHTTP_ReleaseHTTPRequest(steam_http, hRequest);
}


SteamHTTP_GetHTTPDownloadProgressPct :: inline (hRequest: HTTPRequestHandle, pflPercentOut: *float) -> bool #foreign steam "SteamAPI_ISteamHTTP_GetHTTPDownl {
    return SteamHTTP_GetHTTPDownloadProgressPct(steam_http, hRequest, pflPercentOut);
}


SteamHTTP_SetHTTPRequestRawPostBody :: inline (hRequest: HTTPRequestHandle, pchContentType: *char, pubBody: *uint8, unBodyLen: uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequ {
    return SteamHTTP_SetHTTPRequestRawPostBody(steam_http, hRequest, pchContentType, pubBody, unBodyLen);
}


SteamHTTP_CreateCookieContainer :: inline (bAllowResponsesToModify: bool) -> HTTPCookieContainerHandle #foreign steam "SteamAPI_ISteamHTTP_CreateC {
    return SteamHTTP_CreateCookieContainer(steam_http, bAllowResponsesToModify);
}


SteamHTTP_ReleaseCookieContainer :: inline (hCookieContainer: HTTPCookieContainerHandle) -> bool #foreign steam "SteamAPI_ISteamHTTP_ReleaseC {
    return SteamHTTP_ReleaseCookieContainer(steam_http, hCookieContainer);
}


SteamHTTP_SetCookie :: inline (hCookieContainer: HTTPCookieContainerHandle, pchHost: *char, pchUrl: *char, pchCookie: *char) -> bool #foreign steam "SteamAPI_ISteam {
    return SteamHTTP_SetCookie(steam_http, hCookieContainer, pchHost, pchUrl, pchCookie);
}


SteamHTTP_SetHTTPRequestCookieContainer :: inline (hRequest: HTTPRequestHandle, hCookieContainer: HTTPCookieContainerHandle) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequestC {
    return SteamHTTP_SetHTTPRequestCookieContainer(steam_http, hRequest, hCookieContainer);
}


SteamHTTP_SetHTTPRequestUserAgentInfo :: inline (hRequest: HTTPRequestHandle, pchUserAgentInfo: *char) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPReques {
    return SteamHTTP_SetHTTPRequestUserAgentInfo(steam_http, hRequest, pchUserAgentInfo);
}


SteamHTTP_SetHTTPRequestRequiresVerifiedCertificate :: inline (hRequest: HTTPRequestHandle, bRequireVerifiedCertificate: bool) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerif {
    return SteamHTTP_SetHTTPRequestRequiresVerifiedCertificate(steam_http, hRequest, bRequireVerifiedCertificate);
}


SteamHTTP_SetHTTPRequestAbsoluteTimeoutMS :: inline (hRequest: HTTPRequestHandle, unMilliseconds: uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequestAbs {
    return SteamHTTP_SetHTTPRequestAbsoluteTimeoutMS(steam_http, hRequest, unMilliseconds);
}


SteamHTTP_GetHTTPRequestWasTimedOut :: inline (hRequest: HTTPRequestHandle, pbWasTimedOut: *bool) -> bool #foreign steam "SteamAPI_ISteamHTTP_GetHTTPRequ {
    return SteamHTTP_GetHTTPRequestWasTimedOut(steam_http, hRequest, pbWasTimedOut);
}
