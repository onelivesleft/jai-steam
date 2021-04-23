steam_user : *ISteamUser;


GetHSteamUser :: inline () -> HSteamUser {
    return SteamAPI_ISteamUser_GetHSteamUser(steam_user);
}


BLoggedOn :: inline () -> bool {
    return SteamAPI_ISteamUser_BLoggedOn(steam_user);
}


GetSteamID :: inline () -> uint64_steamid {
    return SteamAPI_ISteamUser_GetSteamID(steam_user);
}


InitiateGameConnection :: inline (pAuthBlob: *void, cbMaxAuthBlob: s32, steamIDGameServer: uint64_steamid, unIPServer: uint32, usPortServer: uint16, bSecure: bool) -> s32 {
    return SteamAPI_ISteamUser_InitiateGameConnection(steam_user, pAuthBlob, cbMaxAuthBlob, steamIDGameServer, unIPServer, usPortServer, bSecure);
}


TerminateGameConnection :: inline (unIPServer: uint32, usPortServer: uint16) {
    SteamAPI_ISteamUser_TerminateGameConnection(steam_user, unIPServer, usPortServer);
}


TrackAppUsageEvent :: inline (gameID: uint64_gameid, eAppUsageEvent: s32, pchExtraInfo: *char) {
    SteamAPI_ISteamUser_TrackAppUsageEvent(steam_user, gameID, eAppUsageEvent, pchExtraInfo);
}


GetUserDataFolder :: inline (pchBuffer: *char, cubBuffer: s32) -> bool {
    return SteamAPI_ISteamUser_GetUserDataFolder(steam_user, pchBuffer, cubBuffer);
}


StartVoiceRecording :: inline () {
    SteamAPI_ISteamUser_StartVoiceRecording(steam_user);
}


StopVoiceRecording :: inline () {
    SteamAPI_ISteamUser_StopVoiceRecording(steam_user);
}


GetAvailableVoice :: inline (pcbCompressed: *uint32, pcbUncompressed_Deprecated: *uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult {
    return SteamAPI_ISteamUser_GetAvailableVoice(steam_user, pcbCompressed, pcbUncompressed_Deprecated, nUncompressedVoiceDesiredSampleRate_Deprecated);
}


GetVoice :: inline (bWantCompressed: bool, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, bWantUncompressed_Deprecated: bool, pUncompressedDestBuffer_Deprecated: *void, cbUncompressedDestBufferSize_Deprecated: uint32, nUncompressBytesWritten_Deprecated: *uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult {
    return SteamAPI_ISteamUser_GetVoice(steam_user, bWantCompressed, pDestBuffer, cbDestBufferSize, nBytesWritten, bWantUncompressed_Deprecated, pUncompressedDestBuffer_Deprecated, cbUncompressedDestBufferSize_Deprecated, nUncompressBytesWritten_Deprecated, nUncompressedVoiceDesiredSampleRate_Deprecated);
}


DecompressVoice :: inline (pCompressed: *void, cbCompressed: uint32, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, nDesiredSampleRate: uint32) -> EVoiceResult {
    return SteamAPI_ISteamUser_DecompressVoice(steam_user, pCompressed, cbCompressed, pDestBuffer, cbDestBufferSize, nBytesWritten, nDesiredSampleRate);
}


GetVoiceOptimalSampleRate :: inline () -> uint32 {
    return SteamAPI_ISteamUser_GetVoiceOptimalSampleRate(steam_user);
}


GetAuthSessionTicket :: inline (pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> HAuthTicket {
    return SteamAPI_ISteamUser_GetAuthSessionTicket(steam_user, pTicket, cbMaxTicket, pcbTicket);
}


BeginAuthSession :: inline (pAuthTicket: *void, cbAuthTicket: s32, steamID: uint64_steamid) -> EBeginAuthSessionResult {
    return SteamAPI_ISteamUser_BeginAuthSession(steam_user, pAuthTicket, cbAuthTicket, steamID);
}


EndAuthSession :: inline (steamID: uint64_steamid) {
    SteamAPI_ISteamUser_EndAuthSession(steam_user, steamID);
}


CancelAuthTicket :: inline (hAuthTicket: HAuthTicket) {
    SteamAPI_ISteamUser_CancelAuthTicket(steam_user, hAuthTicket);
}


UserHasLicenseForApp :: inline (steamID: uint64_steamid, appID: AppId_t) -> EUserHasLicenseForAppResult {
    return SteamAPI_ISteamUser_UserHasLicenseForApp(steam_user, steamID, appID);
}


BIsBehindNAT :: inline () -> bool {
    return SteamAPI_ISteamUser_BIsBehindNAT(steam_user);
}


AdvertiseGame :: inline (steamIDGameServer: uint64_steamid, unIPServer: uint32, usPortServer: uint16) {
    SteamAPI_ISteamUser_AdvertiseGame(steam_user, steamIDGameServer, unIPServer, usPortServer);
}


RequestEncryptedAppTicket :: inline (pDataToInclude: *void, cbDataToInclude: s32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUser_RequestEncryptedAppTicket(steam_user, pDataToInclude, cbDataToInclude);
}

RequestEncryptedAppTicket :: inline (pDataToInclude: *void, cbDataToInclude: s32, callback: (EncryptedAppTicketResponse_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := RequestEncryptedAppTicket(pDataToInclude, cbDataToInclude);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

RequestEncryptedAppTicket :: (pDataToInclude: *void, cbDataToInclude: s32, code: Code) -> SteamAPICall_t #expand {
    call_result_id := RequestEncryptedAppTicket(pDataToInclude, cbDataToInclude);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: EncryptedAppTicketResponse_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


GetEncryptedAppTicket :: inline (pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> bool {
    return SteamAPI_ISteamUser_GetEncryptedAppTicket(steam_user, pTicket, cbMaxTicket, pcbTicket);
}


GetGameBadgeLevel :: inline (nSeries: s32, bFoil: bool) -> s32 {
    return SteamAPI_ISteamUser_GetGameBadgeLevel(steam_user, nSeries, bFoil);
}


GetPlayerSteamLevel :: inline () -> s32 {
    return SteamAPI_ISteamUser_GetPlayerSteamLevel(steam_user);
}


RequestStoreAuthURL :: inline (pchRedirectURL: *char) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUser_RequestStoreAuthURL(steam_user, pchRedirectURL);
}

RequestStoreAuthURL :: inline (pchRedirectURL: *char, callback: (StoreAuthURLResponse_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := RequestStoreAuthURL(pchRedirectURL);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

RequestStoreAuthURL :: (pchRedirectURL: *char, code: Code) -> SteamAPICall_t #expand {
    call_result_id := RequestStoreAuthURL(pchRedirectURL);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: StoreAuthURLResponse_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


BIsPhoneVerified :: inline () -> bool {
    return SteamAPI_ISteamUser_BIsPhoneVerified(steam_user);
}


BIsTwoFactorEnabled :: inline () -> bool {
    return SteamAPI_ISteamUser_BIsTwoFactorEnabled(steam_user);
}


BIsPhoneIdentifying :: inline () -> bool {
    return SteamAPI_ISteamUser_BIsPhoneIdentifying(steam_user);
}


BIsPhoneRequiringVerification :: inline () -> bool {
    return SteamAPI_ISteamUser_BIsPhoneRequiringVerification(steam_user);
}


GetMarketEligibility :: inline () -> SteamAPICall_t #must {
    return SteamAPI_ISteamUser_GetMarketEligibility(steam_user);
}

GetMarketEligibility :: inline (callback: (MarketEligibilityResponse_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := GetMarketEligibility();
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

GetMarketEligibility :: (code: Code) -> SteamAPICall_t #expand {
    call_result_id := GetMarketEligibility();
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: MarketEligibilityResponse_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


GetDurationControl :: inline () -> SteamAPICall_t #must {
    return SteamAPI_ISteamUser_GetDurationControl(steam_user);
}

GetDurationControl :: inline (callback: (DurationControl_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := GetDurationControl();
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

GetDurationControl :: (code: Code) -> SteamAPICall_t #expand {
    call_result_id := GetDurationControl();
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: DurationControl_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


BSetDurationControlOnlineState :: inline (eNewState: EDurationControlOnlineState) -> bool {
    return SteamAPI_ISteamUser_BSetDurationControlOnlineState(steam_user, eNewState);
}
