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


SteamUser_GetHSteamUser :: inline () -> HSteamUser #foreign steam "SteamAPI_ISteamUser {
    return SteamUser_GetHSteamUser(steam_user);
}


SteamUser_BLoggedOn :: inline () -> bool #foreign steam "SteamAPI_ISteam {
    return SteamUser_BLoggedOn(steam_user);
}


SteamUser_GetSteamID :: inline () -> uint64_steamid #foreign steam "SteamAPI_ISteamU {
    return SteamUser_GetSteamID(steam_user);
}


SteamUser_InitiateGameConnection :: inline (pAuthBlob: *void, cbMaxAuthBlob: s32, steamIDGameServer: uint64_steamid, unIPServer: uint32, usPortServer: uint16, bSecure: bool) -> s32 #foreign steam "SteamAPI_ISteamUser_Initiate {
    return SteamUser_InitiateGameConnection(steam_user, pAuthBlob, cbMaxAuthBlob, steamIDGameServer, unIPServer, usPortServer, bSecure);
}


SteamUser_TerminateGameConnection :: inline (unIPServer: uint32, usPortServer: uint16) {
    SteamUser_TerminateGameConnection(steam_user, unIPServer, usPortServer);
}


SteamUser_TrackAppUsageEvent :: inline (gameID: uint64_gameid, eAppUsageEvent: s32, pchExtraInfo: *char) {
    SteamUser_TrackAppUsageEvent(steam_user, gameID, eAppUsageEvent, pchExtraInfo);
}


SteamUser_GetUserDataFolder :: inline (pchBuffer: *char, cubBuffer: s32) -> bool #foreign steam "SteamAPI_ISteamUser_Get {
    return SteamUser_GetUserDataFolder(steam_user, pchBuffer, cubBuffer);
}


SteamUser_StartVoiceRecording :: inline () {
    SteamUser_StartVoiceRecording(steam_user);
}


SteamUser_StopVoiceRecording :: inline () {
    SteamUser_StopVoiceRecording(steam_user);
}


SteamUser_GetAvailableVoice :: inline (pcbCompressed: *uint32, pcbUncompressed_Deprecated: *uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult #foreign steam "SteamAPI_ISteamUser_Get {
    return SteamUser_GetAvailableVoice(steam_user, pcbCompressed, pcbUncompressed_Deprecated, nUncompressedVoiceDesiredSampleRate_Deprecated);
}


SteamUser_GetVoice :: inline (bWantCompressed: bool, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, bWantUncompressed_Deprecated: bool, pUncompressedDestBuffer_Deprecated: *void, cbUncompressedDestBufferSize_Deprecated: uint32, nUncompressBytesWritten_Deprecated: *uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult #foreign steam "SteamAPI_IStea {
    return SteamUser_GetVoice(steam_user, bWantCompressed, pDestBuffer, cbDestBufferSize, nBytesWritten, bWantUncompressed_Deprecated, pUncompressedDestBuffer_Deprecated, cbUncompressedDestBufferSize_Deprecated, nUncompressBytesWritten_Deprecated, nUncompressedVoiceDesiredSampleRate_Deprecated);
}


SteamUser_DecompressVoice :: inline (pCompressed: *void, cbCompressed: uint32, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, nDesiredSampleRate: uint32) -> EVoiceResult #foreign steam "SteamAPI_ISteamUser_D {
    return SteamUser_DecompressVoice(steam_user, pCompressed, cbCompressed, pDestBuffer, cbDestBufferSize, nBytesWritten, nDesiredSampleRate);
}


SteamUser_GetVoiceOptimalSampleRate :: inline () -> uint32 #foreign steam "SteamAPI_ISteamUser_GetVoiceOpt {
    return SteamUser_GetVoiceOptimalSampleRate(steam_user);
}


SteamUser_GetAuthSessionTicket :: inline (pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> HAuthTicket #foreign steam "SteamAPI_ISteamUser_GetAut {
    return SteamUser_GetAuthSessionTicket(steam_user, pTicket, cbMaxTicket, pcbTicket);
}


SteamUser_BeginAuthSession :: inline (pAuthTicket: *void, cbAuthTicket: s32, steamID: uint64_steamid) -> EBeginAuthSessionResult #foreign steam "SteamAPI_ISteamUser_Be {
    return SteamUser_BeginAuthSession(steam_user, pAuthTicket, cbAuthTicket, steamID);
}


SteamUser_EndAuthSession :: inline (steamID: uint64_steamid) {
    SteamUser_EndAuthSession(steam_user, steamID);
}


SteamUser_CancelAuthTicket :: inline (hAuthTicket: HAuthTicket) {
    SteamUser_CancelAuthTicket(steam_user, hAuthTicket);
}


SteamUser_UserHasLicenseForApp :: inline (steamID: uint64_steamid, appID: AppId_t) -> EUserHasLicenseForAppResult #foreign steam "SteamAPI_ISteamUser_UserHa {
    return SteamUser_UserHasLicenseForApp(steam_user, steamID, appID);
}


SteamUser_BIsBehindNAT :: inline () -> bool #foreign steam "SteamAPI_ISteamUse {
    return SteamUser_BIsBehindNAT(steam_user);
}


SteamUser_AdvertiseGame :: inline (steamIDGameServer: uint64_steamid, unIPServer: uint32, usPortServer: uint16) {
    SteamUser_AdvertiseGame(steam_user, steamIDGameServer, unIPServer, usPortServer);
}


SteamUser_RequestEncryptedAppTicket :: inline (pDataToInclude: *void, cbDataToInclude: s32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUser_RequestEncr {
    return SteamUser_RequestEncryptedAppTicket(steam_user, pDataToInclude, cbDataToInclude);
}


SteamUser_GetEncryptedAppTicket :: inline (pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> bool #foreign steam "SteamAPI_ISteamUser_GetEncr {
    return SteamUser_GetEncryptedAppTicket(steam_user, pTicket, cbMaxTicket, pcbTicket);
}


SteamUser_GetGameBadgeLevel :: inline (nSeries: s32, bFoil: bool) -> s32 #foreign steam "SteamAPI_ISteamUser_Get {
    return SteamUser_GetGameBadgeLevel(steam_user, nSeries, bFoil);
}


SteamUser_GetPlayerSteamLevel :: inline () -> s32 #foreign steam "SteamAPI_ISteamUser_GetPl {
    return SteamUser_GetPlayerSteamLevel(steam_user);
}


SteamUser_RequestStoreAuthURL :: inline (pchRedirectURL: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUser_Reque {
    return SteamUser_RequestStoreAuthURL(steam_user, pchRedirectURL);
}


SteamUser_BIsPhoneVerified :: inline () -> bool #foreign steam "SteamAPI_ISteamUser_BI {
    return SteamUser_BIsPhoneVerified(steam_user);
}


SteamUser_BIsTwoFactorEnabled :: inline () -> bool #foreign steam "SteamAPI_ISteamUser_BIsTw {
    return SteamUser_BIsTwoFactorEnabled(steam_user);
}


SteamUser_BIsPhoneIdentifying :: inline () -> bool #foreign steam "SteamAPI_ISteamUser_BIsPh {
    return SteamUser_BIsPhoneIdentifying(steam_user);
}


SteamUser_BIsPhoneRequiringVerification :: inline () -> bool #foreign steam "SteamAPI_ISteamUser_BIsPhoneRequiri {
    return SteamUser_BIsPhoneRequiringVerification(steam_user);
}


SteamUser_GetMarketEligibility :: inline () -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUser_GetMar {
    return SteamUser_GetMarketEligibility(steam_user);
}


SteamUser_GetDurationControl :: inline () -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUser_GetD {
    return SteamUser_GetDurationControl(steam_user);
}


SteamUser_BSetDurationControlOnlineState :: inline (eNewState: EDurationControlOnlineState) -> bool #foreign steam "SteamAPI_ISteamUser_BSetDurationCont {
    return SteamUser_BSetDurationControlOnlineState(steam_user, eNewState);
}
