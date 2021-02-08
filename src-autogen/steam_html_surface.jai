steam_html_surface : *ISteamHTMLSurface;
SteamHTMLSurface : SteamHTMLSurface_Namespace;


#scope_file


SteamHTMLSurface_Namespace :: struct {
    // procs
    Init                                               :: SteamHTMLSurface_Init;
    Shutdown                                           :: SteamHTMLSurface_Shutdown;
    CreateBrowser                                      :: SteamHTMLSurface_CreateBrowser;
    RemoveBrowser                                      :: SteamHTMLSurface_RemoveBrowser;
    LoadURL                                            :: SteamHTMLSurface_LoadURL;
    SetSize                                            :: SteamHTMLSurface_SetSize;
    StopLoad                                           :: SteamHTMLSurface_StopLoad;
    Reload                                             :: SteamHTMLSurface_Reload;
    GoBack                                             :: SteamHTMLSurface_GoBack;
    GoForward                                          :: SteamHTMLSurface_GoForward;
    AddHeader                                          :: SteamHTMLSurface_AddHeader;
    ExecuteJavascript                                  :: SteamHTMLSurface_ExecuteJavascript;
    MouseUp                                            :: SteamHTMLSurface_MouseUp;
    MouseDown                                          :: SteamHTMLSurface_MouseDown;
    MouseDoubleClick                                   :: SteamHTMLSurface_MouseDoubleClick;
    MouseMove                                          :: SteamHTMLSurface_MouseMove;
    MouseWheel                                         :: SteamHTMLSurface_MouseWheel;
    KeyDown                                            :: SteamHTMLSurface_KeyDown;
    KeyUp                                              :: SteamHTMLSurface_KeyUp;
    KeyChar                                            :: SteamHTMLSurface_KeyChar;
    SetHorizontalScroll                                :: SteamHTMLSurface_SetHorizontalScroll;
    SetVerticalScroll                                  :: SteamHTMLSurface_SetVerticalScroll;
    SetKeyFocus                                        :: SteamHTMLSurface_SetKeyFocus;
    ViewSource                                         :: SteamHTMLSurface_ViewSource;
    CopyToClipboard                                    :: SteamHTMLSurface_CopyToClipboard;
    PasteFromClipboard                                 :: SteamHTMLSurface_PasteFromClipboard;
    Find                                               :: SteamHTMLSurface_Find;
    StopFind                                           :: SteamHTMLSurface_StopFind;
    GetLinkAtPosition                                  :: SteamHTMLSurface_GetLinkAtPosition;
    SetCookie                                          :: SteamHTMLSurface_SetCookie;
    SetPageScaleFactor                                 :: SteamHTMLSurface_SetPageScaleFactor;
    SetBackgroundMode                                  :: SteamHTMLSurface_SetBackgroundMode;
    SetDPIScalingFactor                                :: SteamHTMLSurface_SetDPIScalingFactor;
    OpenDeveloperTools                                 :: SteamHTMLSurface_OpenDeveloperTools;
    AllowStartRequest                                  :: SteamHTMLSurface_AllowStartRequest;
    JSDialogResponse                                   :: SteamHTMLSurface_JSDialogResponse;
    FileLoadDialogResponse                             :: SteamHTMLSurface_FileLoadDialogResponse;
}


SteamHTMLSurface_Init :: inline () -> bool {
    return SteamAPI_ISteamHTMLSurface_Init(steam_html_surface);
}


SteamHTMLSurface_Shutdown :: inline () -> bool {
    return SteamAPI_ISteamHTMLSurface_Shutdown(steam_html_surface);
}


SteamHTMLSurface_CreateBrowser :: inline (pchUserAgent: *char, pchUserCSS: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamHTMLSurface_CreateBrowser(steam_html_surface, pchUserAgent, pchUserCSS);
}


SteamHTMLSurface_RemoveBrowser :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_RemoveBrowser(steam_html_surface, unBrowserHandle);
}


SteamHTMLSurface_LoadURL :: inline (unBrowserHandle: HHTMLBrowser, pchURL: *char, pchPostData: *char) {
    SteamAPI_ISteamHTMLSurface_LoadURL(steam_html_surface, unBrowserHandle, pchURL, pchPostData);
}


SteamHTMLSurface_SetSize :: inline (unBrowserHandle: HHTMLBrowser, unWidth: uint32, unHeight: uint32) {
    SteamAPI_ISteamHTMLSurface_SetSize(steam_html_surface, unBrowserHandle, unWidth, unHeight);
}


SteamHTMLSurface_StopLoad :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_StopLoad(steam_html_surface, unBrowserHandle);
}


SteamHTMLSurface_Reload :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_Reload(steam_html_surface, unBrowserHandle);
}


SteamHTMLSurface_GoBack :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_GoBack(steam_html_surface, unBrowserHandle);
}


SteamHTMLSurface_GoForward :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_GoForward(steam_html_surface, unBrowserHandle);
}


SteamHTMLSurface_AddHeader :: inline (unBrowserHandle: HHTMLBrowser, pchKey: *char, pchValue: *char) {
    SteamAPI_ISteamHTMLSurface_AddHeader(steam_html_surface, unBrowserHandle, pchKey, pchValue);
}


SteamHTMLSurface_ExecuteJavascript :: inline (unBrowserHandle: HHTMLBrowser, pchScript: *char) {
    SteamAPI_ISteamHTMLSurface_ExecuteJavascript(steam_html_surface, unBrowserHandle, pchScript);
}


SteamHTMLSurface_MouseUp :: inline (unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton) {
    SteamAPI_ISteamHTMLSurface_MouseUp(steam_html_surface, unBrowserHandle, eMouseButton);
}


SteamHTMLSurface_MouseDown :: inline (unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton) {
    SteamAPI_ISteamHTMLSurface_MouseDown(steam_html_surface, unBrowserHandle, eMouseButton);
}


SteamHTMLSurface_MouseDoubleClick :: inline (unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton) {
    SteamAPI_ISteamHTMLSurface_MouseDoubleClick(steam_html_surface, unBrowserHandle, eMouseButton);
}


SteamHTMLSurface_MouseMove :: inline (unBrowserHandle: HHTMLBrowser, x: s32, y: s32) {
    SteamAPI_ISteamHTMLSurface_MouseMove(steam_html_surface, unBrowserHandle, x, y);
}


SteamHTMLSurface_MouseWheel :: inline (unBrowserHandle: HHTMLBrowser, nDelta: int32) {
    SteamAPI_ISteamHTMLSurface_MouseWheel(steam_html_surface, unBrowserHandle, nDelta);
}


SteamHTMLSurface_KeyDown :: inline (unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers, bIsSystemKey: bool) {
    SteamAPI_ISteamHTMLSurface_KeyDown(steam_html_surface, unBrowserHandle, nNativeKeyCode, eHTMLKeyModifiers, bIsSystemKey);
}


SteamHTMLSurface_KeyUp :: inline (unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers) {
    SteamAPI_ISteamHTMLSurface_KeyUp(steam_html_surface, unBrowserHandle, nNativeKeyCode, eHTMLKeyModifiers);
}


SteamHTMLSurface_KeyChar :: inline (unBrowserHandle: HHTMLBrowser, cUnicodeChar: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers) {
    SteamAPI_ISteamHTMLSurface_KeyChar(steam_html_surface, unBrowserHandle, cUnicodeChar, eHTMLKeyModifiers);
}


SteamHTMLSurface_SetHorizontalScroll :: inline (unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) {
    SteamAPI_ISteamHTMLSurface_SetHorizontalScroll(steam_html_surface, unBrowserHandle, nAbsolutePixelScroll);
}


SteamHTMLSurface_SetVerticalScroll :: inline (unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) {
    SteamAPI_ISteamHTMLSurface_SetVerticalScroll(steam_html_surface, unBrowserHandle, nAbsolutePixelScroll);
}


SteamHTMLSurface_SetKeyFocus :: inline (unBrowserHandle: HHTMLBrowser, bHasKeyFocus: bool) {
    SteamAPI_ISteamHTMLSurface_SetKeyFocus(steam_html_surface, unBrowserHandle, bHasKeyFocus);
}


SteamHTMLSurface_ViewSource :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_ViewSource(steam_html_surface, unBrowserHandle);
}


SteamHTMLSurface_CopyToClipboard :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_CopyToClipboard(steam_html_surface, unBrowserHandle);
}


SteamHTMLSurface_PasteFromClipboard :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_PasteFromClipboard(steam_html_surface, unBrowserHandle);
}


SteamHTMLSurface_Find :: inline (unBrowserHandle: HHTMLBrowser, pchSearchStr: *char, bCurrentlyInFind: bool, bReverse: bool) {
    SteamAPI_ISteamHTMLSurface_Find(steam_html_surface, unBrowserHandle, pchSearchStr, bCurrentlyInFind, bReverse);
}


SteamHTMLSurface_StopFind :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_StopFind(steam_html_surface, unBrowserHandle);
}


SteamHTMLSurface_GetLinkAtPosition :: inline (unBrowserHandle: HHTMLBrowser, x: s32, y: s32) {
    SteamAPI_ISteamHTMLSurface_GetLinkAtPosition(steam_html_surface, unBrowserHandle, x, y);
}


SteamHTMLSurface_SetCookie :: inline (pchHostname: *char, pchKey: *char, pchValue: *char, pchPath: *char, nExpires: RTime32, bSecure: bool, bHTTPOnly: bool) {
    SteamAPI_ISteamHTMLSurface_SetCookie(steam_html_surface, pchHostname, pchKey, pchValue, pchPath, nExpires, bSecure, bHTTPOnly);
}


SteamHTMLSurface_SetPageScaleFactor :: inline (unBrowserHandle: HHTMLBrowser, flZoom: float, nPointX: s32, nPointY: s32) {
    SteamAPI_ISteamHTMLSurface_SetPageScaleFactor(steam_html_surface, unBrowserHandle, flZoom, nPointX, nPointY);
}


SteamHTMLSurface_SetBackgroundMode :: inline (unBrowserHandle: HHTMLBrowser, bBackgroundMode: bool) {
    SteamAPI_ISteamHTMLSurface_SetBackgroundMode(steam_html_surface, unBrowserHandle, bBackgroundMode);
}


SteamHTMLSurface_SetDPIScalingFactor :: inline (unBrowserHandle: HHTMLBrowser, flDPIScaling: float) {
    SteamAPI_ISteamHTMLSurface_SetDPIScalingFactor(steam_html_surface, unBrowserHandle, flDPIScaling);
}


SteamHTMLSurface_OpenDeveloperTools :: inline (unBrowserHandle: HHTMLBrowser) {
    SteamAPI_ISteamHTMLSurface_OpenDeveloperTools(steam_html_surface, unBrowserHandle);
}


SteamHTMLSurface_AllowStartRequest :: inline (unBrowserHandle: HHTMLBrowser, bAllowed: bool) {
    SteamAPI_ISteamHTMLSurface_AllowStartRequest(steam_html_surface, unBrowserHandle, bAllowed);
}


SteamHTMLSurface_JSDialogResponse :: inline (unBrowserHandle: HHTMLBrowser, bResult: bool) {
    SteamAPI_ISteamHTMLSurface_JSDialogResponse(steam_html_surface, unBrowserHandle, bResult);
}


SteamHTMLSurface_FileLoadDialogResponse :: inline (unBrowserHandle: HHTMLBrowser, pchSelectedFiles: **char) {
    SteamAPI_ISteamHTMLSurface_FileLoadDialogResponse(steam_html_surface, unBrowserHandle, pchSelectedFiles);
}
