steam_game_server_utils : *ISteamUtils;
SteamGameServerUtils : SteamGameServerUtils_Namespace;


#scope_file


SteamGameServerUtils_Namespace :: struct {
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


SteamUtils_GetSecondsSinceAppActive :: inline () -> uint32 #foreign steam "SteamAPI_ISteamUtils_GetSeconds {
    return SteamUtils_GetSecondsSinceAppActive(steam_game_server_utils);
}


SteamUtils_GetSecondsSinceComputerActive :: inline () -> uint32 #foreign steam "SteamAPI_ISteamUtils_GetSecondsSince {
    return SteamUtils_GetSecondsSinceComputerActive(steam_game_server_utils);
}


SteamUtils_GetConnectedUniverse :: inline () -> EUniverse #foreign steam "SteamAPI_ISteamUtils_GetCon {
    return SteamUtils_GetConnectedUniverse(steam_game_server_utils);
}


SteamUtils_GetServerRealTime :: inline () -> uint32 #foreign steam "SteamAPI_ISteamUtils_Get {
    return SteamUtils_GetServerRealTime(steam_game_server_utils);
}


SteamUtils_GetIPCountry :: inline () -> *char #foreign steam "SteamAPI_ISteamUtil {
    return SteamUtils_GetIPCountry(steam_game_server_utils);
}


SteamUtils_GetImageSize :: inline (iImage: s32, pnWidth: *uint32, pnHeight: *uint32) -> bool #foreign steam "SteamAPI_ISteamUtil {
    return SteamUtils_GetImageSize(steam_game_server_utils, iImage, pnWidth, pnHeight);
}


SteamUtils_GetImageRGBA :: inline (iImage: s32, pubDest: *uint8, nDestBufferSize: s32) -> bool #foreign steam "SteamAPI_ISteamUtil {
    return SteamUtils_GetImageRGBA(steam_game_server_utils, iImage, pubDest, nDestBufferSize);
}


SteamUtils_GetCSERIPPort :: inline (unIP: *uint32, usPort: *uint16) -> bool #foreign steam "SteamAPI_ISteamUtils {
    return SteamUtils_GetCSERIPPort(steam_game_server_utils, unIP, usPort);
}


SteamUtils_GetCurrentBatteryPower :: inline () -> uint8 #foreign steam "SteamAPI_ISteamUtils_GetCurre {
    return SteamUtils_GetCurrentBatteryPower(steam_game_server_utils);
}


SteamUtils_GetAppID :: inline () -> uint32 #foreign steam "SteamAPI_ISteam {
    return SteamUtils_GetAppID(steam_game_server_utils);
}


SteamUtils_SetOverlayNotificationPosition :: inline (eNotificationPosition: ENotificationPosition) {
    SteamUtils_SetOverlayNotificationPosition(steam_game_server_utils, eNotificationPosition);
}


SteamUtils_IsAPICallCompleted :: inline (hSteamAPICall: SteamAPICall_t, pbFailed: *bool) -> bool #foreign steam "SteamAPI_ISteamUtils_IsAP {
    return SteamUtils_IsAPICallCompleted(steam_game_server_utils, hSteamAPICall, pbFailed);
}


SteamUtils_GetAPICallFailureReason :: inline (hSteamAPICall: SteamAPICall_t) -> ESteamAPICallFailure #foreign steam "SteamAPI_ISteamUtils_GetAPICal {
    return SteamUtils_GetAPICallFailureReason(steam_game_server_utils, hSteamAPICall);
}


SteamUtils_GetAPICallResult :: inline (hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: s32, iCallbackExpected: s32, pbFailed: *bool) -> bool #foreign steam "SteamAPI_ISteamUtils_Ge {
    return SteamUtils_GetAPICallResult(steam_game_server_utils, hSteamAPICall, pCallback, cubCallback, iCallbackExpected, pbFailed);
}


SteamUtils_GetIPCCallCount :: inline () -> uint32 #foreign steam "SteamAPI_ISteamUtils_G {
    return SteamUtils_GetIPCCallCount(steam_game_server_utils);
}


SteamUtils_SetWarningMessageHook :: inline (pFunction: SteamAPIWarningMessageHook_t) {
    SteamUtils_SetWarningMessageHook(steam_game_server_utils, pFunction);
}


SteamUtils_IsOverlayEnabled :: inline () -> bool #foreign steam "SteamAPI_ISteamUtils_Is {
    return SteamUtils_IsOverlayEnabled(steam_game_server_utils);
}


SteamUtils_BOverlayNeedsPresent :: inline () -> bool #foreign steam "SteamAPI_ISteamUtils_BOverl {
    return SteamUtils_BOverlayNeedsPresent(steam_game_server_utils);
}


SteamUtils_CheckFileSignature :: inline (szFileName: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUtils_Chec {
    return SteamUtils_CheckFileSignature(steam_game_server_utils, szFileName);
}


SteamUtils_ShowGamepadTextInput :: inline (eInputMode: EGamepadTextInputMode, eLineInputMode: EGamepadTextInputLineMode, pchDescription: *char, unCharMax: uint32, pchExistingText: *char) -> bool #foreign steam "SteamAPI_ISteamUtils_ShowGa {
    return SteamUtils_ShowGamepadTextInput(steam_game_server_utils, eInputMode, eLineInputMode, pchDescription, unCharMax, pchExistingText);
}


SteamUtils_GetEnteredGamepadTextLength :: inline () -> uint32 #foreign steam "SteamAPI_ISteamUtils_GetEnteredGam {
    return SteamUtils_GetEnteredGamepadTextLength(steam_game_server_utils);
}


SteamUtils_GetEnteredGamepadTextInput :: inline (pchText: *char, cchText: uint32) -> bool #foreign steam "SteamAPI_ISteamUtils_GetEnteredGa {
    return SteamUtils_GetEnteredGamepadTextInput(steam_game_server_utils, pchText, cchText);
}


SteamUtils_GetSteamUILanguage :: inline () -> *char #foreign steam "SteamAPI_ISteamUtils_GetS {
    return SteamUtils_GetSteamUILanguage(steam_game_server_utils);
}


SteamUtils_IsSteamRunningInVR :: inline () -> bool #foreign steam "SteamAPI_ISteamUtils_IsSt {
    return SteamUtils_IsSteamRunningInVR(steam_game_server_utils);
}


SteamUtils_SetOverlayNotificationInset :: inline (nHorizontalInset: s32, nVerticalInset: s32) {
    SteamUtils_SetOverlayNotificationInset(steam_game_server_utils, nHorizontalInset, nVerticalInset);
}


SteamUtils_IsSteamInBigPictureMode :: inline () -> bool #foreign steam "SteamAPI_ISteamUtils_IsSteamIn {
    return SteamUtils_IsSteamInBigPictureMode(steam_game_server_utils);
}


SteamUtils_StartVRDashboard :: inline () {
    SteamUtils_StartVRDashboard(steam_game_server_utils);
}


SteamUtils_IsVRHeadsetStreamingEnabled :: inline () -> bool #foreign steam "SteamAPI_ISteamUtils_IsVRHeadsetSt {
    return SteamUtils_IsVRHeadsetStreamingEnabled(steam_game_server_utils);
}


SteamUtils_SetVRHeadsetStreamingEnabled :: inline (bEnabled: bool) {
    SteamUtils_SetVRHeadsetStreamingEnabled(steam_game_server_utils, bEnabled);
}


SteamUtils_IsSteamChinaLauncher :: inline () -> bool #foreign steam "SteamAPI_ISteamUtils_IsStea {
    return SteamUtils_IsSteamChinaLauncher(steam_game_server_utils);
}


SteamUtils_InitFilterText :: inline (unFilterOptions: uint32) -> bool #foreign steam "SteamAPI_ISteamUtils_ {
    return SteamUtils_InitFilterText(steam_game_server_utils, unFilterOptions);
}


SteamUtils_FilterText :: inline (eContext: ETextFilteringContext, sourceSteamID: uint64_steamid, pchInputMessage: *char, pchOutFilteredText: *char, nByteSizeOutFilteredText: uint32) -> s32 #foreign steam "SteamAPI_ISteamUt {
    return SteamUtils_FilterText(steam_game_server_utils, eContext, sourceSteamID, pchInputMessage, pchOutFilteredText, nByteSizeOutFilteredText);
}


SteamUtils_GetIPv6ConnectivityState :: inline (eProtocol: ESteamIPv6ConnectivityProtocol) -> ESteamIPv6ConnectivityState #foreign steam "SteamAPI_ISteamUtils_GetIPv6Con {
    return SteamUtils_GetIPv6ConnectivityState(steam_game_server_utils, eProtocol);
}
