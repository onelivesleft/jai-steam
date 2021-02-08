steam_utils : *ISteamUtils;
SteamUtils : SteamUtils_Namespace;


#scope_file


SteamUtils_Namespace :: struct {
    // procs
    GetSecondsSinceAppActive                           :: SteamUtils_GetSecondsSinceAppActive;
    GetSecondsSinceComputerActive                      :: SteamUtils_GetSecondsSinceComputerActive;
    GetConnectedUniverse                               :: SteamUtils_GetConnectedUniverse;
    GetServerRealTime                                  :: SteamUtils_GetServerRealTime;
    GetIPCountry                                       :: SteamUtils_GetIPCountry;
    GetImageSize                                       :: SteamUtils_GetImageSize;
    GetImageRGBA                                       :: SteamUtils_GetImageRGBA;
    GetCSERIPPort                                      :: SteamUtils_GetCSERIPPort;
    GetCurrentBatteryPower                             :: SteamUtils_GetCurrentBatteryPower;
    GetAppID                                           :: SteamUtils_GetAppID;
    SetOverlayNotificationPosition                     :: SteamUtils_SetOverlayNotificationPosition;
    IsAPICallCompleted                                 :: SteamUtils_IsAPICallCompleted;
    GetAPICallFailureReason                            :: SteamUtils_GetAPICallFailureReason;
    GetAPICallResult                                   :: SteamUtils_GetAPICallResult;
    GetIPCCallCount                                    :: SteamUtils_GetIPCCallCount;
    SetWarningMessageHook                              :: SteamUtils_SetWarningMessageHook;
    IsOverlayEnabled                                   :: SteamUtils_IsOverlayEnabled;
    BOverlayNeedsPresent                               :: SteamUtils_BOverlayNeedsPresent;
    CheckFileSignature                                 :: SteamUtils_CheckFileSignature;
    ShowGamepadTextInput                               :: SteamUtils_ShowGamepadTextInput;
    GetEnteredGamepadTextLength                        :: SteamUtils_GetEnteredGamepadTextLength;
    GetEnteredGamepadTextInput                         :: SteamUtils_GetEnteredGamepadTextInput;
    GetSteamUILanguage                                 :: SteamUtils_GetSteamUILanguage;
    IsSteamRunningInVR                                 :: SteamUtils_IsSteamRunningInVR;
    SetOverlayNotificationInset                        :: SteamUtils_SetOverlayNotificationInset;
    IsSteamInBigPictureMode                            :: SteamUtils_IsSteamInBigPictureMode;
    StartVRDashboard                                   :: SteamUtils_StartVRDashboard;
    IsVRHeadsetStreamingEnabled                        :: SteamUtils_IsVRHeadsetStreamingEnabled;
    SetVRHeadsetStreamingEnabled                       :: SteamUtils_SetVRHeadsetStreamingEnabled;
    IsSteamChinaLauncher                               :: SteamUtils_IsSteamChinaLauncher;
    InitFilterText                                     :: SteamUtils_InitFilterText;
    FilterText                                         :: SteamUtils_FilterText;
    GetIPv6ConnectivityState                           :: SteamUtils_GetIPv6ConnectivityState;
}


SteamUtils_GetSecondsSinceAppActive :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetSecondsSinceAppActive(steam_utils);
}


SteamUtils_GetSecondsSinceComputerActive :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetSecondsSinceComputerActive(steam_utils);
}


SteamUtils_GetConnectedUniverse :: inline () -> EUniverse {
    return SteamAPI_ISteamUtils_GetConnectedUniverse(steam_utils);
}


SteamUtils_GetServerRealTime :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetServerRealTime(steam_utils);
}


SteamUtils_GetIPCountry :: inline () -> *char {
    return SteamAPI_ISteamUtils_GetIPCountry(steam_utils);
}


SteamUtils_GetImageSize :: inline (iImage: s32, pnWidth: *uint32, pnHeight: *uint32) -> bool {
    return SteamAPI_ISteamUtils_GetImageSize(steam_utils, iImage, pnWidth, pnHeight);
}


SteamUtils_GetImageRGBA :: inline (iImage: s32, pubDest: *uint8, nDestBufferSize: s32) -> bool {
    return SteamAPI_ISteamUtils_GetImageRGBA(steam_utils, iImage, pubDest, nDestBufferSize);
}


SteamUtils_GetCSERIPPort :: inline (unIP: *uint32, usPort: *uint16) -> bool {
    return SteamAPI_ISteamUtils_GetCSERIPPort(steam_utils, unIP, usPort);
}


SteamUtils_GetCurrentBatteryPower :: inline () -> uint8 {
    return SteamAPI_ISteamUtils_GetCurrentBatteryPower(steam_utils);
}


SteamUtils_GetAppID :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetAppID(steam_utils);
}


SteamUtils_SetOverlayNotificationPosition :: inline (eNotificationPosition: ENotificationPosition) {
    SteamAPI_ISteamUtils_SetOverlayNotificationPosition(steam_utils, eNotificationPosition);
}


SteamUtils_IsAPICallCompleted :: inline (hSteamAPICall: SteamAPICall_t, pbFailed: *bool) -> bool {
    return SteamAPI_ISteamUtils_IsAPICallCompleted(steam_utils, hSteamAPICall, pbFailed);
}


SteamUtils_GetAPICallFailureReason :: inline (hSteamAPICall: SteamAPICall_t) -> ESteamAPICallFailure {
    return SteamAPI_ISteamUtils_GetAPICallFailureReason(steam_utils, hSteamAPICall);
}


SteamUtils_GetAPICallResult :: inline (hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: s32, iCallbackExpected: s32, pbFailed: *bool) -> bool {
    return SteamAPI_ISteamUtils_GetAPICallResult(steam_utils, hSteamAPICall, pCallback, cubCallback, iCallbackExpected, pbFailed);
}


SteamUtils_GetIPCCallCount :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetIPCCallCount(steam_utils);
}


SteamUtils_SetWarningMessageHook :: inline (pFunction: SteamAPIWarningMessageHook_t) {
    SteamAPI_ISteamUtils_SetWarningMessageHook(steam_utils, pFunction);
}


SteamUtils_IsOverlayEnabled :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsOverlayEnabled(steam_utils);
}


SteamUtils_BOverlayNeedsPresent :: inline () -> bool {
    return SteamAPI_ISteamUtils_BOverlayNeedsPresent(steam_utils);
}


SteamUtils_CheckFileSignature :: inline (szFileName: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamUtils_CheckFileSignature(steam_utils, szFileName);
}


SteamUtils_ShowGamepadTextInput :: inline (eInputMode: EGamepadTextInputMode, eLineInputMode: EGamepadTextInputLineMode, pchDescription: *char, unCharMax: uint32, pchExistingText: *char) -> bool {
    return SteamAPI_ISteamUtils_ShowGamepadTextInput(steam_utils, eInputMode, eLineInputMode, pchDescription, unCharMax, pchExistingText);
}


SteamUtils_GetEnteredGamepadTextLength :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetEnteredGamepadTextLength(steam_utils);
}


SteamUtils_GetEnteredGamepadTextInput :: inline (pchText: *char, cchText: uint32) -> bool {
    return SteamAPI_ISteamUtils_GetEnteredGamepadTextInput(steam_utils, pchText, cchText);
}


SteamUtils_GetSteamUILanguage :: inline () -> *char {
    return SteamAPI_ISteamUtils_GetSteamUILanguage(steam_utils);
}


SteamUtils_IsSteamRunningInVR :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsSteamRunningInVR(steam_utils);
}


SteamUtils_SetOverlayNotificationInset :: inline (nHorizontalInset: s32, nVerticalInset: s32) {
    SteamAPI_ISteamUtils_SetOverlayNotificationInset(steam_utils, nHorizontalInset, nVerticalInset);
}


SteamUtils_IsSteamInBigPictureMode :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsSteamInBigPictureMode(steam_utils);
}


SteamUtils_StartVRDashboard :: inline () {
    SteamAPI_ISteamUtils_StartVRDashboard(steam_utils);
}


SteamUtils_IsVRHeadsetStreamingEnabled :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsVRHeadsetStreamingEnabled(steam_utils);
}


SteamUtils_SetVRHeadsetStreamingEnabled :: inline (bEnabled: bool) {
    SteamAPI_ISteamUtils_SetVRHeadsetStreamingEnabled(steam_utils, bEnabled);
}


SteamUtils_IsSteamChinaLauncher :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsSteamChinaLauncher(steam_utils);
}


SteamUtils_InitFilterText :: inline (unFilterOptions: uint32) -> bool {
    return SteamAPI_ISteamUtils_InitFilterText(steam_utils, unFilterOptions);
}


SteamUtils_FilterText :: inline (eContext: ETextFilteringContext, sourceSteamID: uint64_steamid, pchInputMessage: *char, pchOutFilteredText: *char, nByteSizeOutFilteredText: uint32) -> s32 {
    return SteamAPI_ISteamUtils_FilterText(steam_utils, eContext, sourceSteamID, pchInputMessage, pchOutFilteredText, nByteSizeOutFilteredText);
}


SteamUtils_GetIPv6ConnectivityState :: inline (eProtocol: ESteamIPv6ConnectivityProtocol) -> ESteamIPv6ConnectivityState {
    return SteamAPI_ISteamUtils_GetIPv6ConnectivityState(steam_utils, eProtocol);
}
