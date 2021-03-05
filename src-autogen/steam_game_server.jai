steam_game_server : *ISteamGameServer;


ServerSetProduct :: inline (pszProduct: *char) {
    SteamAPI_ISteamGameServer_SetProduct(steam_game_server, pszProduct);
}


ServerSetGameDescription :: inline (pszGameDescription: *char) {
    SteamAPI_ISteamGameServer_SetGameDescription(steam_game_server, pszGameDescription);
}


ServerSetModDir :: inline (pszModDir: *char) {
    SteamAPI_ISteamGameServer_SetModDir(steam_game_server, pszModDir);
}


ServerSetDedicatedServer :: inline (bDedicated: bool) {
    SteamAPI_ISteamGameServer_SetDedicatedServer(steam_game_server, bDedicated);
}


ServerLogOn :: inline (pszToken: *char) {
    SteamAPI_ISteamGameServer_LogOn(steam_game_server, pszToken);
}


ServerLogOnAnonymous :: inline () {
    SteamAPI_ISteamGameServer_LogOnAnonymous(steam_game_server);
}


ServerLogOff :: inline () {
    SteamAPI_ISteamGameServer_LogOff(steam_game_server);
}


ServerBLoggedOn :: inline () -> bool {
    return SteamAPI_ISteamGameServer_BLoggedOn(steam_game_server);
}


ServerBSecure :: inline () -> bool {
    return SteamAPI_ISteamGameServer_BSecure(steam_game_server);
}


ServerGetSteamID :: inline () -> uint64_steamid {
    return SteamAPI_ISteamGameServer_GetSteamID(steam_game_server);
}


ServerWasRestartRequested :: inline () -> bool {
    return SteamAPI_ISteamGameServer_WasRestartRequested(steam_game_server);
}


ServerSetMaxPlayerCount :: inline (cPlayersMax: s32) {
    SteamAPI_ISteamGameServer_SetMaxPlayerCount(steam_game_server, cPlayersMax);
}


ServerSetBotPlayerCount :: inline (cBotplayers: s32) {
    SteamAPI_ISteamGameServer_SetBotPlayerCount(steam_game_server, cBotplayers);
}


ServerSetServerName :: inline (pszServerName: *char) {
    SteamAPI_ISteamGameServer_SetServerName(steam_game_server, pszServerName);
}


ServerSetMapName :: inline (pszMapName: *char) {
    SteamAPI_ISteamGameServer_SetMapName(steam_game_server, pszMapName);
}


ServerSetPasswordProtected :: inline (bPasswordProtected: bool) {
    SteamAPI_ISteamGameServer_SetPasswordProtected(steam_game_server, bPasswordProtected);
}


ServerSetSpectatorPort :: inline (unSpectatorPort: uint16) {
    SteamAPI_ISteamGameServer_SetSpectatorPort(steam_game_server, unSpectatorPort);
}


ServerSetSpectatorServerName :: inline (pszSpectatorServerName: *char) {
    SteamAPI_ISteamGameServer_SetSpectatorServerName(steam_game_server, pszSpectatorServerName);
}


ServerClearAllKeyValues :: inline () {
    SteamAPI_ISteamGameServer_ClearAllKeyValues(steam_game_server);
}


ServerSetKeyValue :: inline (pKey: *char, pValue: *char) {
    SteamAPI_ISteamGameServer_SetKeyValue(steam_game_server, pKey, pValue);
}


ServerSetGameTags :: inline (pchGameTags: *char) {
    SteamAPI_ISteamGameServer_SetGameTags(steam_game_server, pchGameTags);
}


ServerSetGameData :: inline (pchGameData: *char) {
    SteamAPI_ISteamGameServer_SetGameData(steam_game_server, pchGameData);
}


ServerSetRegion :: inline (pszRegion: *char) {
    SteamAPI_ISteamGameServer_SetRegion(steam_game_server, pszRegion);
}


ServerSendUserConnectAndAuthenticate :: inline (unIPClient: uint32, pvAuthBlob: *void, cubAuthBlobSize: uint32, pSteamIDUser: *CSteamID) -> bool {
    return SteamAPI_ISteamGameServer_SendUserConnectAndAuthenticate(steam_game_server, unIPClient, pvAuthBlob, cubAuthBlobSize, pSteamIDUser);
}


ServerCreateUnauthenticatedUserConnection :: inline () -> uint64_steamid {
    return SteamAPI_ISteamGameServer_CreateUnauthenticatedUserConnection(steam_game_server);
}


ServerSendUserDisconnect :: inline (steamIDUser: uint64_steamid) {
    SteamAPI_ISteamGameServer_SendUserDisconnect(steam_game_server, steamIDUser);
}


ServerBUpdateUserData :: inline (steamIDUser: uint64_steamid, pchPlayerName: *char, uScore: uint32) -> bool {
    return SteamAPI_ISteamGameServer_BUpdateUserData(steam_game_server, steamIDUser, pchPlayerName, uScore);
}


ServerGetAuthSessionTicket :: inline (pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> HAuthTicket {
    return SteamAPI_ISteamGameServer_GetAuthSessionTicket(steam_game_server, pTicket, cbMaxTicket, pcbTicket);
}


ServerBeginAuthSession :: inline (pAuthTicket: *void, cbAuthTicket: s32, steamID: uint64_steamid) -> EBeginAuthSessionResult {
    return SteamAPI_ISteamGameServer_BeginAuthSession(steam_game_server, pAuthTicket, cbAuthTicket, steamID);
}


ServerEndAuthSession :: inline (steamID: uint64_steamid) {
    SteamAPI_ISteamGameServer_EndAuthSession(steam_game_server, steamID);
}


ServerCancelAuthTicket :: inline (hAuthTicket: HAuthTicket) {
    SteamAPI_ISteamGameServer_CancelAuthTicket(steam_game_server, hAuthTicket);
}


ServerUserHasLicenseForApp :: inline (steamID: uint64_steamid, appID: AppId_t) -> EUserHasLicenseForAppResult {
    return SteamAPI_ISteamGameServer_UserHasLicenseForApp(steam_game_server, steamID, appID);
}


ServerRequestUserGroupStatus :: inline (steamIDUser: uint64_steamid, steamIDGroup: uint64_steamid) -> bool {
    return SteamAPI_ISteamGameServer_RequestUserGroupStatus(steam_game_server, steamIDUser, steamIDGroup);
}


ServerGetGameplayStats :: inline () {
    SteamAPI_ISteamGameServer_GetGameplayStats(steam_game_server);
}


ServerGetServerReputation :: inline () -> SteamAPICall_t #must {
    return SteamAPI_ISteamGameServer_GetServerReputation(steam_game_server);
}

ServerGetServerReputation :: inline (callback: (GSReputation_t, bool) -> ()) {
    RegisterCallResult(
        ServerGetServerReputation(),
        callback
    );
}

//ServerGetServerReputation :: (code: Code) #expand {
//    RegisterCallResult(
//        ServerGetServerReputation(),
//        (result: GSReputation_t, io_failure: bool) -> () {
//            #insert code;
//        }
//    );
//}


ServerGetPublicIP :: inline () -> SteamIPAddress_t {
    return SteamAPI_ISteamGameServer_GetPublicIP(steam_game_server);
}


ServerHandleIncomingPacket :: inline (pData: *void, cbData: s32, srcIP: uint32, srcPort: uint16) -> bool {
    return SteamAPI_ISteamGameServer_HandleIncomingPacket(steam_game_server, pData, cbData, srcIP, srcPort);
}


ServerGetNextOutgoingPacket :: inline (pOut: *void, cbMaxOut: s32, pNetAdr: *uint32, pPort: *uint16) -> s32 {
    return SteamAPI_ISteamGameServer_GetNextOutgoingPacket(steam_game_server, pOut, cbMaxOut, pNetAdr, pPort);
}


ServerEnableHeartbeats :: inline (bActive: bool) {
    SteamAPI_ISteamGameServer_EnableHeartbeats(steam_game_server, bActive);
}


ServerSetHeartbeatInterval :: inline (iHeartbeatInterval: s32) {
    SteamAPI_ISteamGameServer_SetHeartbeatInterval(steam_game_server, iHeartbeatInterval);
}


ServerForceHeartbeat :: inline () {
    SteamAPI_ISteamGameServer_ForceHeartbeat(steam_game_server);
}


ServerAssociateWithClan :: inline (steamIDClan: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamGameServer_AssociateWithClan(steam_game_server, steamIDClan);
}

ServerAssociateWithClan :: inline (steamIDClan: uint64_steamid, callback: (AssociateWithClanResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerAssociateWithClan(steamIDClan),
        callback
    );
}

//ServerAssociateWithClan :: (steamIDClan: uint64_steamid, code: Code) #expand {
//    RegisterCallResult(
//        ServerAssociateWithClan(steamIDClan),
//        (result: AssociateWithClanResult_t, io_failure: bool) -> () {
//            #insert code;
//        }
//    );
//}


ServerComputeNewPlayerCompatibility :: inline (steamIDNewPlayer: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamGameServer_ComputeNewPlayerCompatibility(steam_game_server, steamIDNewPlayer);
}

ServerComputeNewPlayerCompatibility :: inline (steamIDNewPlayer: uint64_steamid, callback: (ComputeNewPlayerCompatibilityResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerComputeNewPlayerCompatibility(steamIDNewPlayer),
        callback
    );
}

//ServerComputeNewPlayerCompatibility :: (steamIDNewPlayer: uint64_steamid, code: Code) #expand {
//    RegisterCallResult(
//        ServerComputeNewPlayerCompatibility(steamIDNewPlayer),
//        (result: ComputeNewPlayerCompatibilityResult_t, io_failure: bool) -> () {
//            #insert code;
//        }
//    );
//}
