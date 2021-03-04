steam_user : *ISteamUser;
SteamUser : SteamUser_Namespace;


#scope_file


SteamUser_Namespace :: struct {
    // procs
    GetHSteamUser                                      :: SteamUser_GetHSteamUser;
    BLoggedOn                                          :: SteamUser_BLoggedOn;
    GetSteamID                                         :: SteamUser_GetSteamID;
    InitiateGameConnection                             :: SteamUser_InitiateGameConnection;
    TerminateGameConnection                            :: SteamUser_TerminateGameConnection;
    TrackAppUsageEvent                                 :: SteamUser_TrackAppUsageEvent;
    GetUserDataFolder                                  :: SteamUser_GetUserDataFolder;
    StartVoiceRecording                                :: SteamUser_StartVoiceRecording;
    StopVoiceRecording                                 :: SteamUser_StopVoiceRecording;
    GetAvailableVoice                                  :: SteamUser_GetAvailableVoice;
    GetVoice                                           :: SteamUser_GetVoice;
    DecompressVoice                                    :: SteamUser_DecompressVoice;
    GetVoiceOptimalSampleRate                          :: SteamUser_GetVoiceOptimalSampleRate;
    GetAuthSessionTicket                               :: SteamUser_GetAuthSessionTicket;
    BeginAuthSession                                   :: SteamUser_BeginAuthSession;
    EndAuthSession                                     :: SteamUser_EndAuthSession;
    CancelAuthTicket                                   :: SteamUser_CancelAuthTicket;
    UserHasLicenseForApp                               :: SteamUser_UserHasLicenseForApp;
    BIsBehindNAT                                       :: SteamUser_BIsBehindNAT;
    AdvertiseGame                                      :: SteamUser_AdvertiseGame;
    RequestEncryptedAppTicket                          :: SteamUser_RequestEncryptedAppTicket;
    GetEncryptedAppTicket                              :: SteamUser_GetEncryptedAppTicket;
    GetGameBadgeLevel                                  :: SteamUser_GetGameBadgeLevel;
    GetPlayerSteamLevel                                :: SteamUser_GetPlayerSteamLevel;
    RequestStoreAuthURL                                :: SteamUser_RequestStoreAuthURL;
    BIsPhoneVerified                                   :: SteamUser_BIsPhoneVerified;
    BIsTwoFactorEnabled                                :: SteamUser_BIsTwoFactorEnabled;
    BIsPhoneIdentifying                                :: SteamUser_BIsPhoneIdentifying;
    BIsPhoneRequiringVerification                      :: SteamUser_BIsPhoneRequiringVerification;
    GetMarketEligibility                               :: SteamUser_GetMarketEligibility;
    GetDurationControl                                 :: SteamUser_GetDurationControl;
    BSetDurationControlOnlineState                     :: SteamUser_BSetDurationControlOnlineState;
}


SteamUser_GetHSteamUser :: inline () -> HSteamUser {
    return SteamAPI_ISteamUser_GetHSteamUser(steam_user);
}


SteamUser_BLoggedOn :: inline () -> bool {
    return SteamAPI_ISteamUser_BLoggedOn(steam_user);
}


SteamUser_GetSteamID :: inline () -> uint64_steamid {
    return SteamAPI_ISteamUser_GetSteamID(steam_user);
}


SteamUser_InitiateGameConnection :: inline (pAuthBlob: *void, cbMaxAuthBlob: s32, steamIDGameServer: uint64_steamid, unIPServer: uint32, usPortServer: uint16, bSecure: bool) -> s32 {
    return SteamAPI_ISteamUser_InitiateGameConnection(steam_user, pAuthBlob, cbMaxAuthBlob, steamIDGameServer, unIPServer, usPortServer, bSecure);
}


SteamUser_TerminateGameConnection :: inline (unIPServer: uint32, usPortServer: uint16) {
    SteamAPI_ISteamUser_TerminateGameConnection(steam_user, unIPServer, usPortServer);
}


SteamUser_TrackAppUsageEvent :: inline (gameID: uint64_gameid, eAppUsageEvent: s32, pchExtraInfo: *char) {
    SteamAPI_ISteamUser_TrackAppUsageEvent(steam_user, gameID, eAppUsageEvent, pchExtraInfo);
}


SteamUser_GetUserDataFolder :: inline (pchBuffer: *char, cubBuffer: s32) -> bool {
    return SteamAPI_ISteamUser_GetUserDataFolder(steam_user, pchBuffer, cubBuffer);
}


SteamUser_StartVoiceRecording :: inline () {
    SteamAPI_ISteamUser_StartVoiceRecording(steam_user);
}


SteamUser_StopVoiceRecording :: inline () {
    SteamAPI_ISteamUser_StopVoiceRecording(steam_user);
}


SteamUser_GetAvailableVoice :: inline (pcbCompressed: *uint32, pcbUncompressed_Deprecated: *uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult {
    return SteamAPI_ISteamUser_GetAvailableVoice(steam_user, pcbCompressed, pcbUncompressed_Deprecated, nUncompressedVoiceDesiredSampleRate_Deprecated);
}


SteamUser_GetVoice :: inline (bWantCompressed: bool, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, bWantUncompressed_Deprecated: bool, pUncompressedDestBuffer_Deprecated: *void, cbUncompressedDestBufferSize_Deprecated: uint32, nUncompressBytesWritten_Deprecated: *uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult {
    return SteamAPI_ISteamUser_GetVoice(steam_user, bWantCompressed, pDestBuffer, cbDestBufferSize, nBytesWritten, bWantUncompressed_Deprecated, pUncompressedDestBuffer_Deprecated, cbUncompressedDestBufferSize_Deprecated, nUncompressBytesWritten_Deprecated, nUncompressedVoiceDesiredSampleRate_Deprecated);
}


SteamUser_DecompressVoice :: inline (pCompressed: *void, cbCompressed: uint32, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, nDesiredSampleRate: uint32) -> EVoiceResult {
    return SteamAPI_ISteamUser_DecompressVoice(steam_user, pCompressed, cbCompressed, pDestBuffer, cbDestBufferSize, nBytesWritten, nDesiredSampleRate);
}


SteamUser_GetVoiceOptimalSampleRate :: inline () -> uint32 {
    return SteamAPI_ISteamUser_GetVoiceOptimalSampleRate(steam_user);
}


SteamUser_GetAuthSessionTicket :: inline (pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> HAuthTicket {
    return SteamAPI_ISteamUser_GetAuthSessionTicket(steam_user, pTicket, cbMaxTicket, pcbTicket);
}


SteamUser_BeginAuthSession :: inline (pAuthTicket: *void, cbAuthTicket: s32, steamID: uint64_steamid) -> EBeginAuthSessionResult {
    return SteamAPI_ISteamUser_BeginAuthSession(steam_user, pAuthTicket, cbAuthTicket, steamID);
}


SteamUser_EndAuthSession :: inline (steamID: uint64_steamid) {
    SteamAPI_ISteamUser_EndAuthSession(steam_user, steamID);
}


SteamUser_CancelAuthTicket :: inline (hAuthTicket: HAuthTicket) {
    SteamAPI_ISteamUser_CancelAuthTicket(steam_user, hAuthTicket);
}


SteamUser_UserHasLicenseForApp :: inline (steamID: uint64_steamid, appID: AppId_t) -> EUserHasLicenseForAppResult {
    return SteamAPI_ISteamUser_UserHasLicenseForApp(steam_user, steamID, appID);
}


SteamUser_BIsBehindNAT :: inline () -> bool {
    return SteamAPI_ISteamUser_BIsBehindNAT(steam_user);
}


SteamUser_AdvertiseGame :: inline (steamIDGameServer: uint64_steamid, unIPServer: uint32, usPortServer: uint16) {
    SteamAPI_ISteamUser_AdvertiseGame(steam_user, steamIDGameServer, unIPServer, usPortServer);
}


SteamUser_RequestEncryptedAppTicket :: inline (pDataToInclude: *void, cbDataToInclude: s32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUser_RequestEncryptedAppTicket(steam_user, pDataToInclude, cbDataToInclude);
}


SteamUser_GetEncryptedAppTicket :: inline (pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> bool {
    return SteamAPI_ISteamUser_GetEncryptedAppTicket(steam_user, pTicket, cbMaxTicket, pcbTicket);
}


SteamUser_GetGameBadgeLevel :: inline (nSeries: s32, bFoil: bool) -> s32 {
    return SteamAPI_ISteamUser_GetGameBadgeLevel(steam_user, nSeries, bFoil);
}


SteamUser_GetPlayerSteamLevel :: inline () -> s32 {
    return SteamAPI_ISteamUser_GetPlayerSteamLevel(steam_user);
}


SteamUser_RequestStoreAuthURL :: inline (pchRedirectURL: *char) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUser_RequestStoreAuthURL(steam_user, pchRedirectURL);
}


SteamUser_BIsPhoneVerified :: inline () -> bool {
    return SteamAPI_ISteamUser_BIsPhoneVerified(steam_user);
}


SteamUser_BIsTwoFactorEnabled :: inline () -> bool {
    return SteamAPI_ISteamUser_BIsTwoFactorEnabled(steam_user);
}


SteamUser_BIsPhoneIdentifying :: inline () -> bool {
    return SteamAPI_ISteamUser_BIsPhoneIdentifying(steam_user);
}


SteamUser_BIsPhoneRequiringVerification :: inline () -> bool {
    return SteamAPI_ISteamUser_BIsPhoneRequiringVerification(steam_user);
}


SteamUser_GetMarketEligibility :: inline () -> SteamAPICall_t #must {
    return SteamAPI_ISteamUser_GetMarketEligibility(steam_user);
}


SteamUser_GetDurationControl :: inline () -> SteamAPICall_t #must {
    return SteamAPI_ISteamUser_GetDurationControl(steam_user);
}


SteamUser_BSetDurationControlOnlineState :: inline (eNewState: EDurationControlOnlineState) -> bool {
    return SteamAPI_ISteamUser_BSetDurationControlOnlineState(steam_user, eNewState);
}
