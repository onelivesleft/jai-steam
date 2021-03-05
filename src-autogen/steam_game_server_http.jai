steam_game_server_http : *ISteamHTTP;


ServerCreateHTTPRequest :: inline (eHTTPRequestMethod: EHTTPMethod, pchAbsoluteURL: *char) -> HTTPRequestHandle {
    return SteamAPI_ISteamHTTP_CreateHTTPRequest(steam_game_server_http, eHTTPRequestMethod, pchAbsoluteURL);
}


ServerSetHTTPRequestContextValue :: inline (hRequest: HTTPRequestHandle, ulContextValue: uint64) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestContextValue(steam_game_server_http, hRequest, ulContextValue);
}


ServerSetHTTPRequestNetworkActivityTimeout :: inline (hRequest: HTTPRequestHandle, unTimeoutSeconds: uint32) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestNetworkActivityTimeout(steam_game_server_http, hRequest, unTimeoutSeconds);
}


ServerSetHTTPRequestHeaderValue :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, pchHeaderValue: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestHeaderValue(steam_game_server_http, hRequest, pchHeaderName, pchHeaderValue);
}


ServerSetHTTPRequestGetOrPostParameter :: inline (hRequest: HTTPRequestHandle, pchParamName: *char, pchParamValue: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestGetOrPostParameter(steam_game_server_http, hRequest, pchParamName, pchParamValue);
}


ServerSendHTTPRequest :: inline (hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool {
    return SteamAPI_ISteamHTTP_SendHTTPRequest(steam_game_server_http, hRequest, pCallHandle);
}


ServerSendHTTPRequestAndStreamResponse :: inline (hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool {
    return SteamAPI_ISteamHTTP_SendHTTPRequestAndStreamResponse(steam_game_server_http, hRequest, pCallHandle);
}


ServerDeferHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool {
    return SteamAPI_ISteamHTTP_DeferHTTPRequest(steam_game_server_http, hRequest);
}


ServerPrioritizeHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool {
    return SteamAPI_ISteamHTTP_PrioritizeHTTPRequest(steam_game_server_http, hRequest);
}


ServerGetHTTPResponseHeaderSize :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, unResponseHeaderSize: *uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseHeaderSize(steam_game_server_http, hRequest, pchHeaderName, unResponseHeaderSize);
}


ServerGetHTTPResponseHeaderValue :: inline (hRequest: HTTPRequestHandle, pchHeaderName: *char, pHeaderValueBuffer: *uint8, unBufferSize: uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseHeaderValue(steam_game_server_http, hRequest, pchHeaderName, pHeaderValueBuffer, unBufferSize);
}


ServerGetHTTPResponseBodySize :: inline (hRequest: HTTPRequestHandle, unBodySize: *uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseBodySize(steam_game_server_http, hRequest, unBodySize);
}


ServerGetHTTPResponseBodyData :: inline (hRequest: HTTPRequestHandle, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPResponseBodyData(steam_game_server_http, hRequest, pBodyDataBuffer, unBufferSize);
}


ServerGetHTTPStreamingResponseBodyData :: inline (hRequest: HTTPRequestHandle, cOffset: uint32, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPStreamingResponseBodyData(steam_game_server_http, hRequest, cOffset, pBodyDataBuffer, unBufferSize);
}


ServerReleaseHTTPRequest :: inline (hRequest: HTTPRequestHandle) -> bool {
    return SteamAPI_ISteamHTTP_ReleaseHTTPRequest(steam_game_server_http, hRequest);
}


ServerGetHTTPDownloadProgressPct :: inline (hRequest: HTTPRequestHandle, pflPercentOut: *float) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPDownloadProgressPct(steam_game_server_http, hRequest, pflPercentOut);
}


ServerSetHTTPRequestRawPostBody :: inline (hRequest: HTTPRequestHandle, pchContentType: *char, pubBody: *uint8, unBodyLen: uint32) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestRawPostBody(steam_game_server_http, hRequest, pchContentType, pubBody, unBodyLen);
}


ServerCreateCookieContainer :: inline (bAllowResponsesToModify: bool) -> HTTPCookieContainerHandle {
    return SteamAPI_ISteamHTTP_CreateCookieContainer(steam_game_server_http, bAllowResponsesToModify);
}


ServerReleaseCookieContainer :: inline (hCookieContainer: HTTPCookieContainerHandle) -> bool {
    return SteamAPI_ISteamHTTP_ReleaseCookieContainer(steam_game_server_http, hCookieContainer);
}


ServerSetCookie :: inline (hCookieContainer: HTTPCookieContainerHandle, pchHost: *char, pchUrl: *char, pchCookie: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetCookie(steam_game_server_http, hCookieContainer, pchHost, pchUrl, pchCookie);
}


ServerSetHTTPRequestCookieContainer :: inline (hRequest: HTTPRequestHandle, hCookieContainer: HTTPCookieContainerHandle) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestCookieContainer(steam_game_server_http, hRequest, hCookieContainer);
}


ServerSetHTTPRequestUserAgentInfo :: inline (hRequest: HTTPRequestHandle, pchUserAgentInfo: *char) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestUserAgentInfo(steam_game_server_http, hRequest, pchUserAgentInfo);
}


ServerSetHTTPRequestRequiresVerifiedCertificate :: inline (hRequest: HTTPRequestHandle, bRequireVerifiedCertificate: bool) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate(steam_game_server_http, hRequest, bRequireVerifiedCertificate);
}


ServerSetHTTPRequestAbsoluteTimeoutMS :: inline (hRequest: HTTPRequestHandle, unMilliseconds: uint32) -> bool {
    return SteamAPI_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS(steam_game_server_http, hRequest, unMilliseconds);
}


ServerGetHTTPRequestWasTimedOut :: inline (hRequest: HTTPRequestHandle, pbWasTimedOut: *bool) -> bool {
    return SteamAPI_ISteamHTTP_GetHTTPRequestWasTimedOut(steam_game_server_http, hRequest, pbWasTimedOut);
}
