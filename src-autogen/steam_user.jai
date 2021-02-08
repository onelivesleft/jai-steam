steam_user : *ISteamUser;

SteamUser : SteamUser_Namespace;


#scope_file


SteamUser_Namespace :: struct {
    // procs
                      :: SteamUser_GetHSteamUser
                          :: SteamUser_BLoggedOn
                         :: SteamUser_GetSteamID
             :: SteamUser_InitiateGameConnection
            :: SteamUser_TerminateGameConnection
                 :: SteamUser_TrackAppUsageEvent
                  :: SteamUser_GetUserDataFolder
                :: SteamUser_StartVoiceRecording
                 :: SteamUser_StopVoiceRecording
                  :: SteamUser_GetAvailableVoice
                           :: SteamUser_GetVoice
                    :: SteamUser_DecompressVoice
          :: SteamUser_GetVoiceOptimalSampleRate
               :: SteamUser_GetAuthSessionTicket
                   :: SteamUser_BeginAuthSession
                     :: SteamUser_EndAuthSession
                   :: SteamUser_CancelAuthTicket
               :: SteamUser_UserHasLicenseForApp
                       :: SteamUser_BIsBehindNAT
                      :: SteamUser_AdvertiseGame
          :: SteamUser_RequestEncryptedAppTicket
              :: SteamUser_GetEncryptedAppTicket
                  :: SteamUser_GetGameBadgeLevel
                :: SteamUser_GetPlayerSteamLevel
                :: SteamUser_RequestStoreAuthURL
                   :: SteamUser_BIsPhoneVerified
                :: SteamUser_BIsTwoFactorEnabled
                :: SteamUser_BIsPhoneIdentifying
      :: SteamUser_BIsPhoneRequiringVerification
               :: SteamUser_GetMarketEligibility
                 :: SteamUser_GetDurationControl
     :: SteamUser_BSetDurationControlOnlineState
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
    return SteamAPI_ISteamUser_InitiateGameConnection(steam_user, pAuthBlob: *void, cbMaxAuthBlob: s32, steamIDGameServer: uint64_steamid, unIPServer: uint32, usPortServer: uint16, bSecure: bool);
}


SteamUser_TerminateGameConnection :: inline (unIPServer: uint32, usPortServer: uint16) {
    SteamAPI_ISteamUser_TerminateGameConnection(steam_user, unIPServer: uint32, usPortServer: uint16);
}


SteamUser_TrackAppUsageEvent :: inline (gameID: uint64_gameid, eAppUsageEvent: s32, pchExtraInfo: *char) {
    SteamAPI_ISteamUser_TrackAppUsageEvent(steam_user, gameID: uint64_gameid, eAppUsageEvent: s32, pchExtraInfo: *char);
}


SteamUser_GetUserDataFolder :: inline (pchBuffer: *char, cubBuffer: s32) -> bool {
    return SteamAPI_ISteamUser_GetUserDataFolder(steam_user, pchBuffer: *char, cubBuffer: s32);
}


SteamUser_StartVoiceRecording :: inline () {
    SteamAPI_ISteamUser_StartVoiceRecording(steam_user);
}


SteamUser_StopVoiceRecording :: inline () {
    SteamAPI_ISteamUser_StopVoiceRecording(steam_user);
}


SteamUser_GetAvailableVoice :: inline (pcbCompressed: *uint32, pcbUncompressed_Deprecated: *uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult {
    return SteamAPI_ISteamUser_GetAvailableVoice(steam_user, pcbCompressed: *uint32, pcbUncompressed_Deprecated: *uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32);
}


SteamUser_GetVoice :: inline (bWantCompressed: bool, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, bWantUncompressed_Deprecated: bool, pUncompressedDestBuffer_Deprecated: *void, cbUncompressedDestBufferSize_Deprecated: uint32, nUncompressBytesWritten_Deprecated: *uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult {
    return SteamAPI_ISteamUser_GetVoice(steam_user, bWantCompressed: bool, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, bWantUncompressed_Deprecated: bool, pUncompressedDestBuffer_Deprecated: *void, cbUncompressedDestBufferSize_Deprecated: uint32, nUncompressBytesWritten_Deprecated: *uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32);
}


SteamUser_DecompressVoice :: inline (pCompressed: *void, cbCompressed: uint32, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, nDesiredSampleRate: uint32) -> EVoiceResult {
    return SteamAPI_ISteamUser_DecompressVoice(steam_user, pCompressed: *void, cbCompressed: uint32, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, nDesiredSampleRate: uint32);
}


SteamUser_GetVoiceOptimalSampleRate :: inline () -> uint32 {
    return SteamAPI_ISteamUser_GetVoiceOptimalSampleRate(steam_user);
}


SteamUser_GetAuthSessionTicket :: inline (pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> HAuthTicket {
    return SteamAPI_ISteamUser_GetAuthSessionTicket(steam_user, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32);
}


SteamUser_BeginAuthSession :: inline (pAuthTicket: *void, cbAuthTicket: s32, steamID: uint64_steamid) -> EBeginAuthSessionResult {
    return SteamAPI_ISteamUser_BeginAuthSession(steam_user, pAuthTicket: *void, cbAuthTicket: s32, steamID: uint64_steamid);
}


SteamUser_EndAuthSession :: inline (steamID: uint64_steamid) {
    SteamAPI_ISteamUser_EndAuthSession(steam_user, steamID: uint64_steamid);
}


SteamUser_CancelAuthTicket :: inline (hAuthTicket: HAuthTicket) {
    SteamAPI_ISteamUser_CancelAuthTicket(steam_user, hAuthTicket: HAuthTicket);
}


SteamUser_UserHasLicenseForApp :: inline (steamID: uint64_steamid, appID: AppId_t) -> EUserHasLicenseForAppResult {
    return SteamAPI_ISteamUser_UserHasLicenseForApp(steam_user, steamID: uint64_steamid, appID: AppId_t);
}


SteamUser_BIsBehindNAT :: inline () -> bool {
    return SteamAPI_ISteamUser_BIsBehindNAT(steam_user);
}


SteamUser_AdvertiseGame :: inline (steamIDGameServer: uint64_steamid, unIPServer: uint32, usPortServer: uint16) {
    SteamAPI_ISteamUser_AdvertiseGame(steam_user, steamIDGameServer: uint64_steamid, unIPServer: uint32, usPortServer: uint16);
}


SteamUser_RequestEncryptedAppTicket :: inline (pDataToInclude: *void, cbDataToInclude: s32) -> SteamAPICall_t {
    return SteamAPI_ISteamUser_RequestEncryptedAppTicket(steam_user, pDataToInclude: *void, cbDataToInclude: s32);
}


SteamUser_GetEncryptedAppTicket :: inline (pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> bool {
    return SteamAPI_ISteamUser_GetEncryptedAppTicket(steam_user, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32);
}


SteamUser_GetGameBadgeLevel :: inline (nSeries: s32, bFoil: bool) -> s32 {
    return SteamAPI_ISteamUser_GetGameBadgeLevel(steam_user, nSeries: s32, bFoil: bool);
}


SteamUser_GetPlayerSteamLevel :: inline () -> s32 {
    return SteamAPI_ISteamUser_GetPlayerSteamLevel(steam_user);
}


SteamUser_RequestStoreAuthURL :: inline (pchRedirectURL: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamUser_RequestStoreAuthURL(steam_user, pchRedirectURL: *char);
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


SteamUser_GetMarketEligibility :: inline () -> SteamAPICall_t {
    return SteamAPI_ISteamUser_GetMarketEligibility(steam_user);
}


SteamUser_GetDurationControl :: inline () -> SteamAPICall_t {
    return SteamAPI_ISteamUser_GetDurationControl(steam_user);
}


SteamUser_BSetDurationControlOnlineState :: inline (eNewState: EDurationControlOnlineState) -> bool {
    return SteamAPI_ISteamUser_BSetDurationControlOnlineState(steam_user, eNewState: EDurationControlOnlineState);
}
