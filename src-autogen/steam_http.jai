steam_http : *ISteamHTTP;

SteamHTTP : SteamHTTP_Namespace;


#scope_file


SteamHTTP_Namespace :: struct {
    // procs
                  :: SteamHTTP_CreateHTTPRequest
         :: SteamHTTP_SetHTTPRequestContextValue
    :: SteamHTTP_SetHTTPRequestNetworkActivityTimeout
          :: SteamHTTP_SetHTTPRequestHeaderValue
    :: SteamHTTP_SetHTTPRequestGetOrPostParameter
                    :: SteamHTTP_SendHTTPRequest
    :: SteamHTTP_SendHTTPRequestAndStreamResponse
                   :: SteamHTTP_DeferHTTPRequest
              :: SteamHTTP_PrioritizeHTTPRequest
          :: SteamHTTP_GetHTTPResponseHeaderSize
         :: SteamHTTP_GetHTTPResponseHeaderValue
            :: SteamHTTP_GetHTTPResponseBodySize
            :: SteamHTTP_GetHTTPResponseBodyData
    :: SteamHTTP_GetHTTPStreamingResponseBodyData
                 :: SteamHTTP_ReleaseHTTPRequest
         :: SteamHTTP_GetHTTPDownloadProgressPct
          :: SteamHTTP_SetHTTPRequestRawPostBody
              :: SteamHTTP_CreateCookieContainer
             :: SteamHTTP_ReleaseCookieContainer
                          :: SteamHTTP_SetCookie
      :: SteamHTTP_SetHTTPRequestCookieContainer
        :: SteamHTTP_SetHTTPRequestUserAgentInfo
    :: SteamHTTP_SetHTTPRequestRequiresVerifiedCertificate
    :: SteamHTTP_SetHTTPRequestAbsoluteTimeoutMS
          :: SteamHTTP_GetHTTPRequestWasTimedOut
}


SteamHTTP_CreateHTTPRequest :: inline (eHTTPRequestMethod: EHTTPMethod, pchAbsoluteURL: *char) -> HTTPRequestHandle {
    return SteamAPI_ISteamHTTP_CreateHTTPRequest(steam_http, eHTTPRequestMethod: EHTTPMethod, pchAbsoluteURL: *char);
}


SteamHTTP_SetHTTPRequestContextValue :: inline (hRequest: HTTPRequestHandle, ulContextValue: uint64) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestContextValue(steam_http, hRequest: HTTPRequestHandle, ulContextValue: uint64);
}


SteamHTTP_SetHTTPRequestNetworkActivityTimeout :: inline (hRequest: HTTPRequestHandle, unTimeoutSeconds: uint32) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestNetworkActivityTimeout(steam_http, hRequest: HTTPRequestHandle, unTimeoutSeconds: uint32);
}


SteamHTTP_SetHTTPRequestHeaderValue :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, pchHeaderValue: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestHeaderValue(steam_http, hRequest: HTTPRequestHandle, pchHeaderName: *char, pchHeaderValue: *char);
}


SteamHTTP_SetHTTPRequestGetOrPostParameter :: inline (hRequest: HTTPRequestHandle, pchParamName: *char, pchParamValue: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestGetOrPostParameter(steam_http, hRequest: HTTPRequestHandle, pchParamName: *char, pchParamValue: *char);
}


SteamHTTP_SendHTTPRequest :: inline (hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool {
    return SteamAPI_ISteamHTTP_SendHTTPRequest(steam_http, hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t);
}


SteamHTTP_SendHTTPRequestAndStreamResponse :: inline (hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool {
    return SteamAPI_ISteamHTTP_SendHTTPRequestAndStreamResponse(steam_http, hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t);
}


SteamHTTP_DeferHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool {
    return SteamAPI_ISteamHTTP_DeferHTTPRequest(steam_http, hRequest: HTTPRequestHandle);
}


SteamHTTP_PrioritizeHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool {
    return SteamAPI_ISteamHTTP_PrioritizeHTTPRequest(steam_http, hRequest: HTTPRequestHandle);
}


SteamHTTP_GetHTTPResponseHeaderSize :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, unResponseHeaderSize: *uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseHeaderSize(steam_http, hRequest: HTTPRequestHandle, pchHeaderName: *char, unResponseHeaderSize: *uint32);
}


SteamHTTP_GetHTTPResponseHeaderValue :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, pHeaderValueBuffer: *uint8, unBufferSize: uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseHeaderValue(steam_http, hRequest: HTTPRequestHandle, pchHeaderName: *char, pHeaderValueBuffer: *uint8, unBufferSize: uint32);
}


SteamHTTP_GetHTTPResponseBodySize :: inline (hRequest: HTTPRequestHandle, unBodySize: *uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseBodySize(steam_http, hRequest: HTTPRequestHandle, unBodySize: *uint32);
}


SteamHTTP_GetHTTPResponseBodyData :: inline (hRequest: HTTPRequestHandle, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseBodyData(steam_http, hRequest: HTTPRequestHandle, pBodyDataBuffer: *uint8, unBufferSize: uint32);
}


SteamHTTP_GetHTTPStreamingResponseBodyData :: inline (hRequest: HTTPRequestHandle, cOffset: uint32, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPStreamingResponseBodyData(steam_http, hRequest: HTTPRequestHandle, cOffset: uint32, pBodyDataBuffer: *uint8, unBufferSize: uint32);
}


SteamHTTP_ReleaseHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool {
    return SteamAPI_ISteamHTTP_ReleaseHTTPRequest(steam_http, hRequest: HTTPRequestHandle);
}


SteamHTTP_GetHTTPDownloadProgressPct :: inline (hRequest: HTTPRequestHandle, pflPercentOut: *float) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPDownloadProgressPct(steam_http, hRequest: HTTPRequestHandle, pflPercentOut: *float);
}


SteamHTTP_SetHTTPRequestRawPostBody :: inline (hRequest: HTTPRequestHandle, pchContentType: *char, pubBody: *uint8, unBodyLen: uint32) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestRawPostBody(steam_http, hRequest: HTTPRequestHandle, pchContentType: *char, pubBody: *uint8, unBodyLen: uint32);
}


SteamHTTP_CreateCookieContainer :: inline (bAllowResponsesToModify: bool) -> HTTPCookieContainerHandle {
    return SteamAPI_ISteamHTTP_CreateCookieContainer(steam_http, bAllowResponsesToModify: bool);
}


SteamHTTP_ReleaseCookieContainer :: inline (hCookieContainer: HTTPCookieContainerHandle) -> bool {
    return SteamAPI_ISteamHTTP_ReleaseCookieContainer(steam_http, hCookieContainer: HTTPCookieContainerHandle);
}


SteamHTTP_SetCookie :: inline (hCookieContainer: HTTPCookieContainerHandle, pchHost: *char, pchUrl: *char, pchCookie: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetCookie(steam_http, hCookieContainer: HTTPCookieContainerHandle, pchHost: *char, pchUrl: *char, pchCookie: *char);
}


SteamHTTP_SetHTTPRequestCookieContainer :: inline (hRequest: HTTPRequestHandle, hCookieContainer: HTTPCookieContainerHandle) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestCookieContainer(steam_http, hRequest: HTTPRequestHandle, hCookieContainer: HTTPCookieContainerHandle);
}


SteamHTTP_SetHTTPRequestUserAgentInfo :: inline (hRequest: HTTPRequestHandle, pchUserAgentInfo: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestUserAgentInfo(steam_http, hRequest: HTTPRequestHandle, pchUserAgentInfo: *char);
}


SteamHTTP_SetHTTPRequestRequiresVerifiedCertificate :: inline (hRequest: HTTPRequestHandle, bRequireVerifiedCertificate: bool) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate(steam_http, hRequest: HTTPRequestHandle, bRequireVerifiedCertificate: bool);
}


SteamHTTP_SetHTTPRequestAbsoluteTimeoutMS :: inline (hRequest: HTTPRequestHandle, unMilliseconds: uint32) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS(steam_http, hRequest: HTTPRequestHandle, unMilliseconds: uint32);
}


SteamHTTP_GetHTTPRequestWasTimedOut :: inline (hRequest: HTTPRequestHandle, pbWasTimedOut: *bool) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPRequestWasTimedOut(steam_http, hRequest: HTTPRequestHandle, pbWasTimedOut: *bool);
}
