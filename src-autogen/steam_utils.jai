steam_utils : *ISteamUtils;


GetSecondsSinceAppActive :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetSecondsSinceAppActive(steam_utils);
}


GetSecondsSinceComputerActive :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetSecondsSinceComputerActive(steam_utils);
}


GetConnectedUniverse :: inline () -> EUniverse {
    return SteamAPI_ISteamUtils_GetConnectedUniverse(steam_utils);
}


GetServerRealTime :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetServerRealTime(steam_utils);
}


GetIPCountry :: inline () -> string {
    return to_string(SteamAPI_ISteamUtils_GetIPCountry(steam_utils));
}


GetImageSize :: inline (iImage: s32, pnWidth: *uint32, pnHeight: *uint32) -> bool {
    return SteamAPI_ISteamUtils_GetImageSize(steam_utils, iImage, pnWidth, pnHeight);
}


GetImageRGBA :: inline (iImage: s32, pubDest: *uint8, nDestBufferSize: s32) -> bool {
    return SteamAPI_ISteamUtils_GetImageRGBA(steam_utils, iImage, pubDest, nDestBufferSize);
}


GetCSERIPPort :: inline (unIP: *uint32, usPort: *uint16) -> bool {
    return SteamAPI_ISteamUtils_GetCSERIPPort(steam_utils, unIP, usPort);
}


GetCurrentBatteryPower :: inline () -> uint8 {
    return SteamAPI_ISteamUtils_GetCurrentBatteryPower(steam_utils);
}


GetAppID :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetAppID(steam_utils);
}


SetOverlayNotificationPosition :: inline (eNotificationPosition: ENotificationPosition) {
    SteamAPI_ISteamUtils_SetOverlayNotificationPosition(steam_utils, eNotificationPosition);
}


IsAPICallCompleted :: inline (hSteamAPICall: SteamAPICall_t, pbFailed: *bool) -> bool {
    return SteamAPI_ISteamUtils_IsAPICallCompleted(steam_utils, hSteamAPICall, pbFailed);
}


GetAPICallFailureReason :: inline (hSteamAPICall: SteamAPICall_t) -> ESteamAPICallFailure {
    return SteamAPI_ISteamUtils_GetAPICallFailureReason(steam_utils, hSteamAPICall);
}


GetAPICallResult :: inline (hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: s32, iCallbackExpected: s32, pbFailed: *bool) -> bool {
    return SteamAPI_ISteamUtils_GetAPICallResult(steam_utils, hSteamAPICall, pCallback, cubCallback, iCallbackExpected, pbFailed);
}


GetIPCCallCount :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetIPCCallCount(steam_utils);
}


SetWarningMessageHook :: inline (pFunction: SteamAPIWarningMessageHook_t) {
    SteamAPI_ISteamUtils_SetWarningMessageHook(steam_utils, pFunction);
}


IsOverlayEnabled :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsOverlayEnabled(steam_utils);
}


BOverlayNeedsPresent :: inline () -> bool {
    return SteamAPI_ISteamUtils_BOverlayNeedsPresent(steam_utils);
}


CheckFileSignature :: inline (szFileName: *char) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUtils_CheckFileSignature(steam_utils, szFileName);
}

CheckFileSignature :: inline (szFileName: *char, callback: (CheckFileSignature_t, bool) -> ()) {
    RegisterCallResult(
        CheckFileSignature(szFileName),
        callback
    );
}

//CheckFileSignature :: (szFileName: *char, code: Code) #expand {
//    RegisterCallResult(
//        CheckFileSignature(szFileName),
//        (result: CheckFileSignature_t, io_failure: bool) -> () {
//            #insert code;
//        }
//    );
//}


ShowGamepadTextInput :: inline (eInputMode: EGamepadTextInputMode, eLineInputMode: EGamepadTextInputLineMode, pchDescription: *char, unCharMax: uint32, pchExistingText: *char) -> bool {
    return SteamAPI_ISteamUtils_ShowGamepadTextInput(steam_utils, eInputMode, eLineInputMode, pchDescription, unCharMax, pchExistingText);
}


GetEnteredGamepadTextLength :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetEnteredGamepadTextLength(steam_utils);
}


GetEnteredGamepadTextInput :: inline (pchText: *char, cchText: uint32) -> bool {
    return SteamAPI_ISteamUtils_GetEnteredGamepadTextInput(steam_utils, pchText, cchText);
}


GetSteamUILanguage :: inline () -> string {
    return to_string(SteamAPI_ISteamUtils_GetSteamUILanguage(steam_utils));
}


IsSteamRunningInVR :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsSteamRunningInVR(steam_utils);
}


SetOverlayNotificationInset :: inline (nHorizontalInset: s32, nVerticalInset: s32) {
    SteamAPI_ISteamUtils_SetOverlayNotificationInset(steam_utils, nHorizontalInset, nVerticalInset);
}


IsSteamInBigPictureMode :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsSteamInBigPictureMode(steam_utils);
}


StartVRDashboard :: inline () {
    SteamAPI_ISteamUtils_StartVRDashboard(steam_utils);
}


IsVRHeadsetStreamingEnabled :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsVRHeadsetStreamingEnabled(steam_utils);
}


SetVRHeadsetStreamingEnabled :: inline (bEnabled: bool) {
    SteamAPI_ISteamUtils_SetVRHeadsetStreamingEnabled(steam_utils, bEnabled);
}


IsSteamChinaLauncher :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsSteamChinaLauncher(steam_utils);
}


InitFilterText :: inline (unFilterOptions: uint32) -> bool {
    return SteamAPI_ISteamUtils_InitFilterText(steam_utils, unFilterOptions);
}


FilterText :: inline (eContext: ETextFilteringContext, sourceSteamID: uint64_steamid, pchInputMessage: *char, pchOutFilteredText: *char, nByteSizeOutFilteredText: uint32) -> s32 {
    return SteamAPI_ISteamUtils_FilterText(steam_utils, eContext, sourceSteamID, pchInputMessage, pchOutFilteredText, nByteSizeOutFilteredText);
}


GetIPv6ConnectivityState :: inline (eProtocol: ESteamIPv6ConnectivityProtocol) -> ESteamIPv6ConnectivityState {
    return SteamAPI_ISteamUtils_GetIPv6ConnectivityState(steam_utils, eProtocol);
}
