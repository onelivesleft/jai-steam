steam_htmlsurface : *ISteamHTMLSurface;

SteamHTMLSurface : SteamHTMLSurface_Namespace;


#scope_file


SteamHTMLSurface_Namespace :: struct {
    // procs
                               :: SteamHTMLSurface_Init
                           :: SteamHTMLSurface_Shutdown
                      :: SteamHTMLSurface_CreateBrowser
                      :: SteamHTMLSurface_RemoveBrowser
                            :: SteamHTMLSurface_LoadURL
                            :: SteamHTMLSurface_SetSize
                           :: SteamHTMLSurface_StopLoad
                             :: SteamHTMLSurface_Reload
                             :: SteamHTMLSurface_GoBack
                          :: SteamHTMLSurface_GoForward
                          :: SteamHTMLSurface_AddHeader
                  :: SteamHTMLSurface_ExecuteJavascript
                            :: SteamHTMLSurface_MouseUp
                          :: SteamHTMLSurface_MouseDown
                   :: SteamHTMLSurface_MouseDoubleClick
                          :: SteamHTMLSurface_MouseMove
                         :: SteamHTMLSurface_MouseWheel
                            :: SteamHTMLSurface_KeyDown
                              :: SteamHTMLSurface_KeyUp
                            :: SteamHTMLSurface_KeyChar
                :: SteamHTMLSurface_SetHorizontalScroll
                  :: SteamHTMLSurface_SetVerticalScroll
                        :: SteamHTMLSurface_SetKeyFocus
                         :: SteamHTMLSurface_ViewSource
                    :: SteamHTMLSurface_CopyToClipboard
                 :: SteamHTMLSurface_PasteFromClipboard
                               :: SteamHTMLSurface_Find
                           :: SteamHTMLSurface_StopFind
                  :: SteamHTMLSurface_GetLinkAtPosition
                          :: SteamHTMLSurface_SetCookie
                 :: SteamHTMLSurface_SetPageScaleFactor
                  :: SteamHTMLSurface_SetBackgroundMode
                :: SteamHTMLSurface_SetDPIScalingFactor
                 :: SteamHTMLSurface_OpenDeveloperTools
                  :: SteamHTMLSurface_AllowStartRequest
                   :: SteamHTMLSurface_JSDialogResponse
             :: SteamHTMLSurface_FileLoadDialogResponse
}


SteamHTMLSurface_Init :: inline () -> bool {
    return SteamAPI_ISteamHTMLSurface_Init(steam_htmlsurface);
}


SteamHTMLSurface_Shutdown :: inline () -> bool {
    return SteamAPI_ISteamHTMLSurface_Shutdown(steam_htmlsurface);
}


SteamHTMLSurface_CreateBrowser :: inline (pchUserAgent: *char, pchUserCSS: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamHTMLSurface_CreateBrowser(steam_htmlsurface, pchUserAgent: *char, pchUserCSS: *char);
}


SteamHTMLSurface_RemoveBrowser :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_RemoveBrowser(steam_htmlsurface, unBrowserHandle: HHTMLBrowser);
}


SteamHTMLSurface_LoadURL :: inline (unBrowserHandle: HHTMLBrowser, pchURL: *char, pchPostData: *char) {
    SteamAPI_ISteamHTMLSurface_LoadURL(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, pchURL: *char, pchPostData: *char);
}


SteamHTMLSurface_SetSize :: inline (unBrowserHandle: HHTMLBrowser, unWidth: uint32, unHeight: uint32) {
    SteamAPI_ISteamHTMLSurface_SetSize(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, unWidth: uint32, unHeight: uint32);
}


SteamHTMLSurface_StopLoad :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_StopLoad(steam_htmlsurface, unBrowserHandle: HHTMLBrowser);
}


SteamHTMLSurface_Reload :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_Reload(steam_htmlsurface, unBrowserHandle: HHTMLBrowser);
}


SteamHTMLSurface_GoBack :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_GoBack(steam_htmlsurface, unBrowserHandle: HHTMLBrowser);
}


SteamHTMLSurface_GoForward :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_GoForward(steam_htmlsurface, unBrowserHandle: HHTMLBrowser);
}


SteamHTMLSurface_AddHeader :: inline (unBrowserHandle: HHTMLBrowser, pchKey: *char, pchValue: *char) {
    SteamAPI_ISteamHTMLSurface_AddHeader(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, pchKey: *char, pchValue: *char);
}


SteamHTMLSurface_ExecuteJavascript :: inline (unBrowserHandle: HHTMLBrowser, pchScript: *char) {
    SteamAPI_ISteamHTMLSurface_ExecuteJavascript(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, pchScript: *char);
}


SteamHTMLSurface_MouseUp :: inline (unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton) {
    SteamAPI_ISteamHTMLSurface_MouseUp(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton);
}


SteamHTMLSurface_MouseDown :: inline (unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton) {
    SteamAPI_ISteamHTMLSurface_MouseDown(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton);
}


SteamHTMLSurface_MouseDoubleClick :: inline (unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton) {
    SteamAPI_ISteamHTMLSurface_MouseDoubleClick(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton);
}


SteamHTMLSurface_MouseMove :: inline (unBrowserHandle: HHTMLBrowser, x: s32, y: s32) {
    SteamAPI_ISteamHTMLSurface_MouseMove(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, x: s32, y: s32);
}


SteamHTMLSurface_MouseWheel :: inline (unBrowserHandle: HHTMLBrowser, nDelta: int32) {
    SteamAPI_ISteamHTMLSurface_MouseWheel(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, nDelta: int32);
}


SteamHTMLSurface_KeyDown :: inline (unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers, bIsSystemKey: bool) {
    SteamAPI_ISteamHTMLSurface_KeyDown(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers, bIsSystemKey: bool);
}


SteamHTMLSurface_KeyUp :: inline (unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers) {
    SteamAPI_ISteamHTMLSurface_KeyUp(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers);
}


SteamHTMLSurface_KeyChar :: inline (unBrowserHandle: HHTMLBrowser, cUnicodeChar: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers) {
    SteamAPI_ISteamHTMLSurface_KeyChar(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, cUnicodeChar: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers);
}


SteamHTMLSurface_SetHorizontalScroll :: inline (unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) {
    SteamAPI_ISteamHTMLSurface_SetHorizontalScroll(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32);
}


SteamHTMLSurface_SetVerticalScroll :: inline (unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) {
    SteamAPI_ISteamHTMLSurface_SetVerticalScroll(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32);
}


SteamHTMLSurface_SetKeyFocus :: inline (unBrowserHandle: HHTMLBrowser, bHasKeyFocus: bool) {
    SteamAPI_ISteamHTMLSurface_SetKeyFocus(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, bHasKeyFocus: bool);
}


SteamHTMLSurface_ViewSource :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_ViewSource(steam_htmlsurface, unBrowserHandle: HHTMLBrowser);
}


SteamHTMLSurface_CopyToClipboard :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_CopyToClipboard(steam_htmlsurface, unBrowserHandle: HHTMLBrowser);
}


SteamHTMLSurface_PasteFromClipboard :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_PasteFromClipboard(steam_htmlsurface, unBrowserHandle: HHTMLBrowser);
}


SteamHTMLSurface_Find :: inline (unBrowserHandle: HHTMLBrowser, pchSearchStr: *char, bCurrentlyInFind: bool, bReverse: bool) {
    SteamAPI_ISteamHTMLSurface_Find(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, pchSearchStr: *char, bCurrentlyInFind: bool, bReverse: bool);
}


SteamHTMLSurface_StopFind :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_StopFind(steam_htmlsurface, unBrowserHandle: HHTMLBrowser);
}


SteamHTMLSurface_GetLinkAtPosition :: inline (unBrowserHandle: HHTMLBrowser, x: s32, y: s32) {
    SteamAPI_ISteamHTMLSurface_GetLinkAtPosition(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, x: s32, y: s32);
}


SteamHTMLSurface_SetCookie :: inline (pchHostname: *char, pchKey: *char, pchValue: *char, pchPath: *char, nExpires: RTime32, bSecure: bool, bHTTPOnly: bool) {
    SteamAPI_ISteamHTMLSurface_SetCookie(steam_htmlsurface, pchHostname: *char, pchKey: *char, pchValue: *char, pchPath: *char, nExpires: RTime32, bSecure: bool, bHTTPOnly: bool);
}


SteamHTMLSurface_SetPageScaleFactor :: inline (unBrowserHandle: HHTMLBrowser, flZoom: float, nPointX: s32, nPointY: s32) {
    SteamAPI_ISteamHTMLSurface_SetPageScaleFactor(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, flZoom: float, nPointX: s32, nPointY: s32);
}


SteamHTMLSurface_SetBackgroundMode :: inline (unBrowserHandle: HHTMLBrowser, bBackgroundMode: bool) {
    SteamAPI_ISteamHTMLSurface_SetBackgroundMode(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, bBackgroundMode: bool);
}


SteamHTMLSurface_SetDPIScalingFactor :: inline (unBrowserHandle: HHTMLBrowser, flDPIScaling: float) {
    SteamAPI_ISteamHTMLSurface_SetDPIScalingFactor(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, flDPIScaling: float);
}


SteamHTMLSurface_OpenDeveloperTools :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_OpenDeveloperTools(steam_htmlsurface, unBrowserHandle: HHTMLBrowser);
}


SteamHTMLSurface_AllowStartRequest :: inline (unBrowserHandle: HHTMLBrowser, bAllowed: bool) {
    SteamAPI_ISteamHTMLSurface_AllowStartRequest(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, bAllowed: bool);
}


SteamHTMLSurface_JSDialogResponse :: inline (unBrowserHandle: HHTMLBrowser, bResult: bool) {
    SteamAPI_ISteamHTMLSurface_JSDialogResponse(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, bResult: bool);
}


SteamHTMLSurface_FileLoadDialogResponse :: inline (unBrowserHandle: HHTMLBrowser, pchSelectedFiles: **char) {
    SteamAPI_ISteamHTMLSurface_FileLoadDialogResponse(steam_htmlsurface, unBrowserHandle: HHTMLBrowser, pchSelectedFiles: **char);
}
