steam_utils : *ISteamUtils;

SteamUtils : SteamUtils_Namespace;


#scope_file


SteamUtils_Namespace :: struct {
    // procs
           :: SteamUtils_GetSecondsSinceAppActive
      :: SteamUtils_GetSecondsSinceComputerActive
               :: SteamUtils_GetConnectedUniverse
                  :: SteamUtils_GetServerRealTime
                       :: SteamUtils_GetIPCountry
                       :: SteamUtils_GetImageSize
                       :: SteamUtils_GetImageRGBA
                      :: SteamUtils_GetCSERIPPort
             :: SteamUtils_GetCurrentBatteryPower
                           :: SteamUtils_GetAppID
     :: SteamUtils_SetOverlayNotificationPosition
                 :: SteamUtils_IsAPICallCompleted
            :: SteamUtils_GetAPICallFailureReason
                   :: SteamUtils_GetAPICallResult
                    :: SteamUtils_GetIPCCallCount
              :: SteamUtils_SetWarningMessageHook
                   :: SteamUtils_IsOverlayEnabled
               :: SteamUtils_BOverlayNeedsPresent
                 :: SteamUtils_CheckFileSignature
               :: SteamUtils_ShowGamepadTextInput
        :: SteamUtils_GetEnteredGamepadTextLength
         :: SteamUtils_GetEnteredGamepadTextInput
                 :: SteamUtils_GetSteamUILanguage
                 :: SteamUtils_IsSteamRunningInVR
        :: SteamUtils_SetOverlayNotificationInset
            :: SteamUtils_IsSteamInBigPictureMode
                   :: SteamUtils_StartVRDashboard
        :: SteamUtils_IsVRHeadsetStreamingEnabled
       :: SteamUtils_SetVRHeadsetStreamingEnabled
               :: SteamUtils_IsSteamChinaLauncher
                     :: SteamUtils_InitFilterText
                         :: SteamUtils_FilterText
           :: SteamUtils_GetIPv6ConnectivityState
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
    return SteamAPI_ISteamUtils_GetImageSize(steam_utils, iImage: s32, pnWidth: *uint32, pnHeight: *uint32);
}


SteamUtils_GetImageRGBA :: inline (iImage: s32, pubDest: *uint8, nDestBufferSize: s32) -> bool {
    return SteamAPI_ISteamUtils_GetImageRGBA(steam_utils, iImage: s32, pubDest: *uint8, nDestBufferSize: s32);
}


SteamUtils_GetCSERIPPort :: inline (unIP: *uint32, usPort: *uint16) -> bool {
    return SteamAPI_ISteamUtils_GetCSERIPPort(steam_utils, unIP: *uint32, usPort: *uint16);
}


SteamUtils_GetCurrentBatteryPower :: inline () -> uint8 {
    return SteamAPI_ISteamUtils_GetCurrentBatteryPower(steam_utils);
}


SteamUtils_GetAppID :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetAppID(steam_utils);
}


SteamUtils_SetOverlayNotificationPosition :: inline (eNotificationPosition: ENotificationPosition) {
    SteamAPI_ISteamUtils_SetOverlayNotificationPosition(steam_utils, eNotificationPosition: ENotificationPosition);
}


SteamUtils_IsAPICallCompleted :: inline (hSteamAPICall: SteamAPICall_t, pbFailed: *bool) -> bool {
    return SteamAPI_ISteamUtils_IsAPICallCompleted(steam_utils, hSteamAPICall: SteamAPICall_t, pbFailed: *bool);
}


SteamUtils_GetAPICallFailureReason :: inline (hSteamAPICall: SteamAPICall_t) -> ESteamAPICallFailure {
    return SteamAPI_ISteamUtils_GetAPICallFailureReason(steam_utils, hSteamAPICall: SteamAPICall_t);
}


SteamUtils_GetAPICallResult :: inline (hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: s32, iCallbackExpected: s32, pbFailed: *bool) -> bool {
    return SteamAPI_ISteamUtils_GetAPICallResult(steam_utils, hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: s32, iCallbackExpected: s32, pbFailed: *bool);
}


SteamUtils_GetIPCCallCount :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetIPCCallCount(steam_utils);
}


SteamUtils_SetWarningMessageHook :: inline (pFunction: SteamAPIWarningMessageHook_t) {
    SteamAPI_ISteamUtils_SetWarningMessageHook(steam_utils, pFunction: SteamAPIWarningMessageHook_t);
}


SteamUtils_IsOverlayEnabled :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsOverlayEnabled(steam_utils);
}


SteamUtils_BOverlayNeedsPresent :: inline () -> bool {
    return SteamAPI_ISteamUtils_BOverlayNeedsPresent(steam_utils);
}


SteamUtils_CheckFileSignature :: inline (szFileName: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamUtils_CheckFileSignature(steam_utils, szFileName: *char);
}


SteamUtils_ShowGamepadTextInput :: inline (eInputMode: EGamepadTextInputMode, eLineInputMode: EGamepadTextInputLineMode, pchDescription: *char, unCharMax: uint32, pchExistingText: *char) -> bool {
    return SteamAPI_ISteamUtils_ShowGamepadTextInput(steam_utils, eInputMode: EGamepadTextInputMode, eLineInputMode: EGamepadTextInputLineMode, pchDescription: *char, unCharMax: uint32, pchExistingText: *char);
}


SteamUtils_GetEnteredGamepadTextLength :: inline () -> uint32 {
    return SteamAPI_ISteamUtils_GetEnteredGamepadTextLength(steam_utils);
}


SteamUtils_GetEnteredGamepadTextInput :: inline (pchText: *char, cchText: uint32) -> bool {
    return SteamAPI_ISteamUtils_GetEnteredGamepadTextInput(steam_utils, pchText: *char, cchText: uint32);
}


SteamUtils_GetSteamUILanguage :: inline () -> *char {
    return SteamAPI_ISteamUtils_GetSteamUILanguage(steam_utils);
}


SteamUtils_IsSteamRunningInVR :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsSteamRunningInVR(steam_utils);
}


SteamUtils_SetOverlayNotificationInset :: inline (nHorizontalInset: s32, nVerticalInset: s32) {
    SteamAPI_ISteamUtils_SetOverlayNotificationInset(steam_utils, nHorizontalInset: s32, nVerticalInset: s32);
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
    SteamAPI_ISteamUtils_SetVRHeadsetStreamingEnabled(steam_utils, bEnabled: bool);
}


SteamUtils_IsSteamChinaLauncher :: inline () -> bool {
    return SteamAPI_ISteamUtils_IsSteamChinaLauncher(steam_utils);
}


SteamUtils_InitFilterText :: inline (unFilterOptions: uint32) -> bool {
    return SteamAPI_ISteamUtils_InitFilterText(steam_utils, unFilterOptions: uint32);
}


SteamUtils_FilterText :: inline (eContext: ETextFilteringContext, sourceSteamID: uint64_steamid, pchInputMessage: *char, pchOutFilteredText: *char, nByteSizeOutFilteredText: uint32) -> s32 {
    return SteamAPI_ISteamUtils_FilterText(steam_utils, eContext: ETextFilteringContext, sourceSteamID: uint64_steamid, pchInputMessage: *char, pchOutFilteredText: *char, nByteSizeOutFilteredText: uint32);
}


SteamUtils_GetIPv6ConnectivityState :: inline (eProtocol: ESteamIPv6ConnectivityProtocol) -> ESteamIPv6ConnectivityState {
    return SteamAPI_ISteamUtils_GetIPv6ConnectivityState(steam_utils, eProtocol: ESteamIPv6ConnectivityProtocol);
}
