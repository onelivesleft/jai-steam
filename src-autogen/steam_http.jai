steam_http : *ISteamHTTP;


CreateHTTPRequest :: inline (eHTTPRequestMethod: EHTTPMethod, pchAbsoluteURL: *char) -> HTTPRequestHandle {
    return SteamAPI_ISteamHTTP_CreateHTTPRequest(steam_http, eHTTPRequestMethod, pchAbsoluteURL);
}


SetHTTPRequestContextValue :: inline (hRequest: HTTPRequestHandle, ulContextValue: uint64) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestContextValue(steam_http, hRequest, ulContextValue);
}


SetHTTPRequestNetworkActivityTimeout :: inline (hRequest: HTTPRequestHandle, unTimeoutSeconds: uint32) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestNetworkActivityTimeout(steam_http, hRequest, unTimeoutSeconds);
}


SetHTTPRequestHeaderValue :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, pchHeaderValue: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestHeaderValue(steam_http, hRequest, pchHeaderName, pchHeaderValue);
}


SetHTTPRequestGetOrPostParameter :: inline (hRequest: HTTPRequestHandle, pchParamName: *char, pchParamValue: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestGetOrPostParameter(steam_http, hRequest, pchParamName, pchParamValue);
}


SendHTTPRequest :: inline (hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool {
    return SteamAPI_ISteamHTTP_SendHTTPRequest(steam_http, hRequest, pCallHandle);
}


SendHTTPRequestAndStreamResponse :: inline (hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool {
    return SteamAPI_ISteamHTTP_SendHTTPRequestAndStreamResponse(steam_http, hRequest, pCallHandle);
}


DeferHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool {
    return SteamAPI_ISteamHTTP_DeferHTTPRequest(steam_http, hRequest);
}


PrioritizeHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool {
    return SteamAPI_ISteamHTTP_PrioritizeHTTPRequest(steam_http, hRequest);
}


GetHTTPResponseHeaderSize :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, unResponseHeaderSize: *uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseHeaderSize(steam_http, hRequest, pchHeaderName, unResponseHeaderSize);
}


GetHTTPResponseHeaderValue :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, pHeaderValueBuffer: *uint8, unBufferSize: uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseHeaderValue(steam_http, hRequest, pchHeaderName, pHeaderValueBuffer, unBufferSize);
}


GetHTTPResponseBodySize :: inline (hRequest: HTTPRequestHandle, unBodySize: *uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseBodySize(steam_http, hRequest, unBodySize);
}


GetHTTPResponseBodyData :: inline (hRequest: HTTPRequestHandle, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseBodyData(steam_http, hRequest, pBodyDataBuffer, unBufferSize);
}


GetHTTPStreamingResponseBodyData :: inline (hRequest: HTTPRequestHandle, cOffset: uint32, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPStreamingResponseBodyData(steam_http, hRequest, cOffset, pBodyDataBuffer, unBufferSize);
}


ReleaseHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool {
    return SteamAPI_ISteamHTTP_ReleaseHTTPRequest(steam_http, hRequest);
}


GetHTTPDownloadProgressPct :: inline (hRequest: HTTPRequestHandle, pflPercentOut: *float) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPDownloadProgressPct(steam_http, hRequest, pflPercentOut);
}


SetHTTPRequestRawPostBody :: inline (hRequest: HTTPRequestHandle, pchContentType: *char, pubBody: *uint8, unBodyLen: uint32) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestRawPostBody(steam_http, hRequest, pchContentType, pubBody, unBodyLen);
}


CreateCookieContainer :: inline (bAllowResponsesToModify: bool) -> HTTPCookieContainerHandle {
    return SteamAPI_ISteamHTTP_CreateCookieContainer(steam_http, bAllowResponsesToModify);
}


ReleaseCookieContainer :: inline (hCookieContainer: HTTPCookieContainerHandle) -> bool {
    return SteamAPI_ISteamHTTP_ReleaseCookieContainer(steam_http, hCookieContainer);
}


SetCookie :: inline (hCookieContainer: HTTPCookieContainerHandle, pchHost: *char, pchUrl: *char, pchCookie: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetCookie(steam_http, hCookieContainer, pchHost, pchUrl, pchCookie);
}


SetHTTPRequestCookieContainer :: inline (hRequest: HTTPRequestHandle, hCookieContainer: HTTPCookieContainerHandle) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestCookieContainer(steam_http, hRequest, hCookieContainer);
}


SetHTTPRequestUserAgentInfo :: inline (hRequest: HTTPRequestHandle, pchUserAgentInfo: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestUserAgentInfo(steam_http, hRequest, pchUserAgentInfo);
}


SetHTTPRequestRequiresVerifiedCertificate :: inline (hRequest: HTTPRequestHandle, bRequireVerifiedCertificate: bool) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate(steam_http, hRequest, bRequireVerifiedCertificate);
}


SetHTTPRequestAbsoluteTimeoutMS :: inline (hRequest: HTTPRequestHandle, unMilliseconds: uint32) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS(steam_http, hRequest, unMilliseconds);
}


GetHTTPRequestWasTimedOut :: inline (hRequest: HTTPRequestHandle, pbWasTimedOut: *bool) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPRequestWasTimedOut(steam_http, hRequest, pbWasTimedOut);
}
