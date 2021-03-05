steam_html_surface : *ISteamHTMLSurface;


InitHTMLSurface :: inline () -> bool {
    return SteamAPI_ISteamHTMLSurface_Init(steam_html_surface);
}


ShutdownHTMLSurface :: inline () -> bool {
    return SteamAPI_ISteamHTMLSurface_Shutdown(steam_html_surface);
}


CreateBrowser :: inline (pchUserAgent: *char, pchUserCSS: *char) -> SteamAPICall_t #must {
    return SteamAPI_ISteamHTMLSurface_CreateBrowser(steam_html_surface, pchUserAgent, pchUserCSS);
}

CreateBrowser :: inline (pchUserAgent: *char, pchUserCSS: *char, callback: (HTML_BrowserReady_t, bool) -> ()) {
    RegisterCallResult(
        CreateBrowser(pchUserAgent, pchUserCSS),
        callback
    );
}

//CreateBrowser :: (pchUserAgent: *char, pchUserCSS: *char, code: Code) #expand {
//    RegisterCallResult(
//        CreateBrowser(pchUserAgent, pchUserCSS),
//        (result: HTML_BrowserReady_t, io_failure: bool) -> () {
//            #insert code;
//        }
//    );
//}


RemoveBrowser :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_RemoveBrowser(steam_html_surface, unBrowserHandle);
}


LoadURL :: inline (unBrowserHandle: HHTMLBrowser, pchURL: *char, pchPostData: *char) {
    SteamAPI_ISteamHTMLSurface_LoadURL(steam_html_surface, unBrowserHandle, pchURL, pchPostData);
}


SetSize :: inline (unBrowserHandle: HHTMLBrowser, unWidth: uint32, unHeight: uint32) {
    SteamAPI_ISteamHTMLSurface_SetSize(steam_html_surface, unBrowserHandle, unWidth, unHeight);
}


StopLoad :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_StopLoad(steam_html_surface, unBrowserHandle);
}


Reload :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_Reload(steam_html_surface, unBrowserHandle);
}


GoBack :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_GoBack(steam_html_surface, unBrowserHandle);
}


GoForward :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_GoForward(steam_html_surface, unBrowserHandle);
}


AddHeader :: inline (unBrowserHandle: HHTMLBrowser, pchKey: *char, pchValue: *char) {
    SteamAPI_ISteamHTMLSurface_AddHeader(steam_html_surface, unBrowserHandle, pchKey, pchValue);
}


ExecuteJavascript :: inline (unBrowserHandle: HHTMLBrowser, pchScript: *char) {
    SteamAPI_ISteamHTMLSurface_ExecuteJavascript(steam_html_surface, unBrowserHandle, pchScript);
}


MouseUp :: inline (unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton) {
    SteamAPI_ISteamHTMLSurface_MouseUp(steam_html_surface, unBrowserHandle, eMouseButton);
}


MouseDown :: inline (unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton) {
    SteamAPI_ISteamHTMLSurface_MouseDown(steam_html_surface, unBrowserHandle, eMouseButton);
}


MouseDoubleClick :: inline (unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton) {
    SteamAPI_ISteamHTMLSurface_MouseDoubleClick(steam_html_surface, unBrowserHandle, eMouseButton);
}


MouseMove :: inline (unBrowserHandle: HHTMLBrowser, x: s32, y: s32) {
    SteamAPI_ISteamHTMLSurface_MouseMove(steam_html_surface, unBrowserHandle, x, y);
}


MouseWheel :: inline (unBrowserHandle: HHTMLBrowser, nDelta: int32) {
    SteamAPI_ISteamHTMLSurface_MouseWheel(steam_html_surface, unBrowserHandle, nDelta);
}


KeyDown :: inline (unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers, bIsSystemKey: bool) {
    SteamAPI_ISteamHTMLSurface_KeyDown(steam_html_surface, unBrowserHandle, nNativeKeyCode, eHTMLKeyModifiers, bIsSystemKey);
}


KeyUp :: inline (unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers) {
    SteamAPI_ISteamHTMLSurface_KeyUp(steam_html_surface, unBrowserHandle, nNativeKeyCode, eHTMLKeyModifiers);
}


KeyChar :: inline (unBrowserHandle: HHTMLBrowser, cUnicodeChar: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers) {
    SteamAPI_ISteamHTMLSurface_KeyChar(steam_html_surface, unBrowserHandle, cUnicodeChar, eHTMLKeyModifiers);
}


SetHorizontalScroll :: inline (unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) {
    SteamAPI_ISteamHTMLSurface_SetHorizontalScroll(steam_html_surface, unBrowserHandle, nAbsolutePixelScroll);
}


SetVerticalScroll :: inline (unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) {
    SteamAPI_ISteamHTMLSurface_SetVerticalScroll(steam_html_surface, unBrowserHandle, nAbsolutePixelScroll);
}


SetKeyFocus :: inline (unBrowserHandle: HHTMLBrowser, bHasKeyFocus: bool) {
    SteamAPI_ISteamHTMLSurface_SetKeyFocus(steam_html_surface, unBrowserHandle, bHasKeyFocus);
}


ViewSource :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_ViewSource(steam_html_surface, unBrowserHandle);
}


CopyToClipboard :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_CopyToClipboard(steam_html_surface, unBrowserHandle);
}


PasteFromClipboard :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_PasteFromClipboard(steam_html_surface, unBrowserHandle);
}


Find :: inline (unBrowserHandle: HHTMLBrowser, pchSearchStr: *char, bCurrentlyInFind: bool, bReverse: bool) {
    SteamAPI_ISteamHTMLSurface_Find(steam_html_surface, unBrowserHandle, pchSearchStr, bCurrentlyInFind, bReverse);
}


StopFind :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_StopFind(steam_html_surface, unBrowserHandle);
}


GetLinkAtPosition :: inline (unBrowserHandle: HHTMLBrowser, x: s32, y: s32) {
    SteamAPI_ISteamHTMLSurface_GetLinkAtPosition(steam_html_surface, unBrowserHandle, x, y);
}


SetCookie :: inline (pchHostname: *char, pchKey: *char, pchValue: *char, pchPath: *char, nExpires: RTime32, bSecure: bool, bHTTPOnly: bool) {
    SteamAPI_ISteamHTMLSurface_SetCookie(steam_html_surface, pchHostname, pchKey, pchValue, pchPath, nExpires, bSecure, bHTTPOnly);
}


SetPageScaleFactor :: inline (unBrowserHandle: HHTMLBrowser, flZoom: float, nPointX: s32, nPointY: s32) {
    SteamAPI_ISteamHTMLSurface_SetPageScaleFactor(steam_html_surface, unBrowserHandle, flZoom, nPointX, nPointY);
}


SetBackgroundMode :: inline (unBrowserHandle: HHTMLBrowser, bBackgroundMode: bool) {
    SteamAPI_ISteamHTMLSurface_SetBackgroundMode(steam_html_surface, unBrowserHandle, bBackgroundMode);
}


SetDPIScalingFactor :: inline (unBrowserHandle: HHTMLBrowser, flDPIScaling: float) {
    SteamAPI_ISteamHTMLSurface_SetDPIScalingFactor(steam_html_surface, unBrowserHandle, flDPIScaling);
}


OpenDeveloperTools :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_OpenDeveloperTools(steam_html_surface, unBrowserHandle);
}


AllowStartRequest :: inline (unBrowserHandle: HHTMLBrowser, bAllowed: bool) {
    SteamAPI_ISteamHTMLSurface_AllowStartRequest(steam_html_surface, unBrowserHandle, bAllowed);
}


JSDialogResponse :: inline (unBrowserHandle: HHTMLBrowser, bResult: bool) {
    SteamAPI_ISteamHTMLSurface_JSDialogResponse(steam_html_surface, unBrowserHandle, bResult);
}


FileLoadDialogResponse :: inline (unBrowserHandle: HHTMLBrowser, pchSelectedFiles: **char) {
    SteamAPI_ISteamHTMLSurface_FileLoadDialogResponse(steam_html_surface, unBrowserHandle, pchSelectedFiles);
}
