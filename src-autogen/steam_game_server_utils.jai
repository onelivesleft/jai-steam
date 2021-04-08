steam_game_server_utils : *ISteamUtils;


ServerGetSecondsSinceAppActive :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetSecondsSinceAppActive(steam_game_server_utils);
}


ServerGetSecondsSinceComputerActive :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetSecondsSinceComputerActive(steam_game_server_utils);
}


ServerGetConnectedUniverse :: inline () -> EUniverse {
    return SteamAPI_ISteamUtils_GetConnectedUniverse(steam_game_server_utils);
}


ServerGetServerRealTime :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetServerRealTime(steam_game_server_utils);
}


ServerGetIPCountry :: inline () -> string {
    return to_string(SteamAPI_ISteamUtils_GetIPCountry(steam_game_server_utils));
}


ServerGetImageSize :: inline (iImage: s32, pnWidth: *uint32, pnHeight: *uint32) -> bool {
    return SteamAPI_ISteamUtils_GetImageSize(steam_game_server_utils, iImage, pnWidth, pnHeight);
}


ServerGetImageRGBA :: inline (iImage: s32, pubDest: *uint8, nDestBufferSize: s32) -> bool {
    return SteamAPI_ISteamUtils_GetImageRGBA(steam_game_server_utils, iImage, pubDest, nDestBufferSize);
}


ServerGetCurrentBatteryPower :: inline () -> uint8 {
    return SteamAPI_ISteamUtils_GetCurrentBatteryPower(steam_game_server_utils);
}


ServerGetAppID :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetAppID(steam_game_server_utils);
}


ServerSetOverlayNotificationPosition :: inline (eNotificationPosition: ENotificationPosition) {
    SteamAPI_ISteamUtils_SetOverlayNotificationPosition(steam_game_server_utils, eNotificationPosition);
}


ServerIsAPICallCompleted :: inline (hSteamAPICall: SteamAPICall_t, pbFailed: *bool) -> bool {
    return SteamAPI_ISteamUtils_IsAPICallCompleted(steam_game_server_utils, hSteamAPICall, pbFailed);
}


ServerGetAPICallFailureReason :: inline (hSteamAPICall: SteamAPICall_t) -> ESteamAPICallFailure {
    return SteamAPI_ISteamUtils_GetAPICallFailureReason(steam_game_server_utils, hSteamAPICall);
}


ServerGetAPICallResult :: inline (hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: s32, iCallbackExpected: s32, pbFailed: *bool) -> bool {
    return SteamAPI_ISteamUtils_GetAPICallResult(steam_game_server_utils, hSteamAPICall, pCallback, cubCallback, iCallbackExpected, pbFailed);
}


ServerGetIPCCallCount :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetIPCCallCount(steam_game_server_utils);
}


ServerSetWarningMessageHook :: inline (pFunction: SteamAPIWarningMessageHook_t) {
    SteamAPI_ISteamUtils_SetWarningMessageHook(steam_game_server_utils, pFunction);
}


ServerIsOverlayEnabled :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsOverlayEnabled(steam_game_server_utils);
}


ServerBOverlayNeedsPresent :: inline () -> bool {
    return SteamAPI_ISteamUtils_BOverlayNeedsPresent(steam_game_server_utils);
}


ServerCheckFileSignature :: inline (szFileName: *char) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUtils_CheckFileSignature(steam_game_server_utils, szFileName);
}

ServerCheckFileSignature :: inline (szFileName: *char, callback: (CheckFileSignature_t, bool) -> ()) {
    RegisterCallResult(
        ServerCheckFileSignature(szFileName),
        callback
    );
}

ServerCheckFileSignature :: (szFileName: *char, code: Code) #expand {
    RegisterCallResult(
        ServerCheckFileSignature(szFileName),
        (result: CheckFileSignature_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerShowGamepadTextInput :: inline (eInputMode: EGamepadTextInputMode, eLineInputMode: EGamepadTextInputLineMode, pchDescription: *char, unCharMax: uint32, pchExistingText: *char) -> bool {
    return SteamAPI_ISteamUtils_ShowGamepadTextInput(steam_game_server_utils, eInputMode, eLineInputMode, pchDescription, unCharMax, pchExistingText);
}


ServerGetEnteredGamepadTextLength :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetEnteredGamepadTextLength(steam_game_server_utils);
}


ServerGetEnteredGamepadTextInput :: inline (pchText: *char, cchText: uint32) -> bool {
    return SteamAPI_ISteamUtils_GetEnteredGamepadTextInput(steam_game_server_utils, pchText, cchText);
}


ServerGetSteamUILanguage :: inline () -> string {
    return to_string(SteamAPI_ISteamUtils_GetSteamUILanguage(steam_game_server_utils));
}


ServerIsSteamRunningInVR :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsSteamRunningInVR(steam_game_server_utils);
}


ServerSetOverlayNotificationInset :: inline (nHorizontalInset: s32, nVerticalInset: s32) {
    SteamAPI_ISteamUtils_SetOverlayNotificationInset(steam_game_server_utils, nHorizontalInset, nVerticalInset);
}


ServerIsSteamInBigPictureMode :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsSteamInBigPictureMode(steam_game_server_utils);
}


ServerStartVRDashboard :: inline () {
    SteamAPI_ISteamUtils_StartVRDashboard(steam_game_server_utils);
}


ServerIsVRHeadsetStreamingEnabled :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsVRHeadsetStreamingEnabled(steam_game_server_utils);
}


ServerSetVRHeadsetStreamingEnabled :: inline (bEnabled: bool) {
    SteamAPI_ISteamUtils_SetVRHeadsetStreamingEnabled(steam_game_server_utils, bEnabled);
}


ServerIsSteamChinaLauncher :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsSteamChinaLauncher(steam_game_server_utils);
}


ServerInitFilterText :: inline (unFilterOptions: uint32) -> bool {
    return SteamAPI_ISteamUtils_InitFilterText(steam_game_server_utils, unFilterOptions);
}


ServerFilterText :: inline (eContext: ETextFilteringContext, sourceSteamID: uint64_steamid, pchInputMessage: *char, pchOutFilteredText: *char, nByteSizeOutFilteredText: uint32) -> s32 {
    return SteamAPI_ISteamUtils_FilterText(steam_game_server_utils, eContext, sourceSteamID, pchInputMessage, pchOutFilteredText, nByteSizeOutFilteredText);
}


ServerGetIPv6ConnectivityState :: inline (eProtocol: ESteamIPv6ConnectivityProtocol) -> ESteamIPv6ConnectivityState {
    return SteamAPI_ISteamUtils_GetIPv6ConnectivityState(steam_game_server_utils, eProtocol);
}
