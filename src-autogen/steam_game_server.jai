steam_game_server : *ISteamGameServer;
SteamGameServer : SteamGameServer_Namespace;


#scope_file


SteamGameServer_Namespace :: struct {
    // procs
    SetProduct                                         :: SteamGameServer_SetProduct;
    SetGameDescription                                 :: SteamGameServer_SetGameDescription;
    SetModDir                                          :: SteamGameServer_SetModDir;
    SetDedicatedServer                                 :: SteamGameServer_SetDedicatedServer;
    LogOn                                              :: SteamGameServer_LogOn;
    LogOnAnonymous                                     :: SteamGameServer_LogOnAnonymous;
    LogOff                                             :: SteamGameServer_LogOff;
    BLoggedOn                                          :: SteamGameServer_BLoggedOn;
    BSecure                                            :: SteamGameServer_BSecure;
    GetSteamID                                         :: SteamGameServer_GetSteamID;
    WasRestartRequested                                :: SteamGameServer_WasRestartRequested;
    SetMaxPlayerCount                                  :: SteamGameServer_SetMaxPlayerCount;
    SetBotPlayerCount                                  :: SteamGameServer_SetBotPlayerCount;
    SetServerName                                      :: SteamGameServer_SetServerName;
    SetMapName                                         :: SteamGameServer_SetMapName;
    SetPasswordProtected                               :: SteamGameServer_SetPasswordProtected;
    SetSpectatorPort                                   :: SteamGameServer_SetSpectatorPort;
    SetSpectatorServerName                             :: SteamGameServer_SetSpectatorServerName;
    ClearAllKeyValues                                  :: SteamGameServer_ClearAllKeyValues;
    SetKeyValue                                        :: SteamGameServer_SetKeyValue;
    SetGameTags                                        :: SteamGameServer_SetGameTags;
    SetGameData                                        :: SteamGameServer_SetGameData;
    SetRegion                                          :: SteamGameServer_SetRegion;
    SendUserConnectAndAuthenticate                     :: SteamGameServer_SendUserConnectAndAuthenticate;
    CreateUnauthenticatedUserConnection                :: SteamGameServer_CreateUnauthenticatedUserConnection;
    SendUserDisconnect                                 :: SteamGameServer_SendUserDisconnect;
    BUpdateUserData                                    :: SteamGameServer_BUpdateUserData;
    GetAuthSessionTicket                               :: SteamGameServer_GetAuthSessionTicket;
    BeginAuthSession                                   :: SteamGameServer_BeginAuthSession;
    EndAuthSession                                     :: SteamGameServer_EndAuthSession;
    CancelAuthTicket                                   :: SteamGameServer_CancelAuthTicket;
    UserHasLicenseForApp                               :: SteamGameServer_UserHasLicenseForApp;
    RequestUserGroupStatus                             :: SteamGameServer_RequestUserGroupStatus;
    GetGameplayStats                                   :: SteamGameServer_GetGameplayStats;
    GetServerReputation                                :: SteamGameServer_GetServerReputation;
    GetPublicIP                                        :: SteamGameServer_GetPublicIP;
    HandleIncomingPacket                               :: SteamGameServer_HandleIncomingPacket;
    GetNextOutgoingPacket                              :: SteamGameServer_GetNextOutgoingPacket;
    EnableHeartbeats                                   :: SteamGameServer_EnableHeartbeats;
    SetHeartbeatInterval                               :: SteamGameServer_SetHeartbeatInterval;
    ForceHeartbeat                                     :: SteamGameServer_ForceHeartbeat;
    AssociateWithClan                                  :: SteamGameServer_AssociateWithClan;
    ComputeNewPlayerCompatibility                      :: SteamGameServer_ComputeNewPlayerCompatibility;
}


SteamGameServer_SetProduct :: inline (pszProduct: *char) {
    SteamAPI_ISteamGameServer_SetProduct(steam_game_server, pszProduct);
}


SteamGameServer_SetGameDescription :: inline (pszGameDescription: *char) {
    SteamAPI_ISteamGameServer_SetGameDescription(steam_game_server, pszGameDescription);
}


SteamGameServer_SetModDir :: inline (pszModDir: *char) {
    SteamAPI_ISteamGameServer_SetModDir(steam_game_server, pszModDir);
}


SteamGameServer_SetDedicatedServer :: inline (bDedicated: bool) {
    SteamAPI_ISteamGameServer_SetDedicatedServer(steam_game_server, bDedicated);
}


SteamGameServer_LogOn :: inline (pszToken: *char) {
    SteamAPI_ISteamGameServer_LogOn(steam_game_server, pszToken);
}


SteamGameServer_LogOnAnonymous :: inline () {
    SteamAPI_ISteamGameServer_LogOnAnonymous(steam_game_server);
}


SteamGameServer_LogOff :: inline () {
    SteamAPI_ISteamGameServer_LogOff(steam_game_server);
}


SteamGameServer_BLoggedOn :: inline () -> bool {
    return SteamAPI_ISteamGameServer_BLoggedOn(steam_game_server);
}


SteamGameServer_BSecure :: inline () -> bool {
    return SteamAPI_ISteamGameServer_BSecure(steam_game_server);
}


SteamGameServer_GetSteamID :: inline () -> uint64_steamid {
    return SteamAPI_ISteamGameServer_GetSteamID(steam_game_server);
}


SteamGameServer_WasRestartRequested :: inline () -> bool {
    return SteamAPI_ISteamGameServer_WasRestartRequested(steam_game_server);
}


SteamGameServer_SetMaxPlayerCount :: inline (cPlayersMax: s32) {
    SteamAPI_ISteamGameServer_SetMaxPlayerCount(steam_game_server, cPlayersMax);
}


SteamGameServer_SetBotPlayerCount :: inline (cBotplayers: s32) {
    SteamAPI_ISteamGameServer_SetBotPlayerCount(steam_game_server, cBotplayers);
}


SteamGameServer_SetServerName :: inline (pszServerName: *char) {
    SteamAPI_ISteamGameServer_SetServerName(steam_game_server, pszServerName);
}


SteamGameServer_SetMapName :: inline (pszMapName: *char) {
    SteamAPI_ISteamGameServer_SetMapName(steam_game_server, pszMapName);
}


SteamGameServer_SetPasswordProtected :: inline (bPasswordProtected: bool) {
    SteamAPI_ISteamGameServer_SetPasswordProtected(steam_game_server, bPasswordProtected);
}


SteamGameServer_SetSpectatorPort :: inline (unSpectatorPort: uint16) {
    SteamAPI_ISteamGameServer_SetSpectatorPort(steam_game_server, unSpectatorPort);
}


SteamGameServer_SetSpectatorServerName :: inline (pszSpectatorServerName: *char) {
    SteamAPI_ISteamGameServer_SetSpectatorServerName(steam_game_server, pszSpectatorServerName);
}


SteamGameServer_ClearAllKeyValues :: inline () {
    SteamAPI_ISteamGameServer_ClearAllKeyValues(steam_game_server);
}


SteamGameServer_SetKeyValue :: inline (pKey: *char, pValue: *char) {
    SteamAPI_ISteamGameServer_SetKeyValue(steam_game_server, pKey, pValue);
}


SteamGameServer_SetGameTags :: inline (pchGameTags: *char) {
    SteamAPI_ISteamGameServer_SetGameTags(steam_game_server, pchGameTags);
}


SteamGameServer_SetGameData :: inline (pchGameData: *char) {
    SteamAPI_ISteamGameServer_SetGameData(steam_game_server, pchGameData);
}


SteamGameServer_SetRegion :: inline (pszRegion: *char) {
    SteamAPI_ISteamGameServer_SetRegion(steam_game_server, pszRegion);
}


SteamGameServer_SendUserConnectAndAuthenticate :: inline (unIPClient: uint32, pvAuthBlob: *void, cubAuthBlobSize: uint32, pSteamIDUser: *CSteamID) -> bool {
    return SteamAPI_ISteamGameServer_SendUserConnectAndAuthenticate(steam_game_server, unIPClient, pvAuthBlob, cubAuthBlobSize, pSteamIDUser);
}


SteamGameServer_CreateUnauthenticatedUserConnection :: inline () -> uint64_steamid {
    return SteamAPI_ISteamGameServer_CreateUnauthenticatedUserConnection(steam_game_server);
}


SteamGameServer_SendUserDisconnect :: inline (steamIDUser: uint64_steamid) {
    SteamAPI_ISteamGameServer_SendUserDisconnect(steam_game_server, steamIDUser);
}


SteamGameServer_BUpdateUserData :: inline (steamIDUser: uint64_steamid, pchPlayerName: *char, uScore: uint32) -> bool {
    return SteamAPI_ISteamGameServer_BUpdateUserData(steam_game_server, steamIDUser, pchPlayerName, uScore);
}


SteamGameServer_GetAuthSessionTicket :: inline (pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> HAuthTicket {
    return SteamAPI_ISteamGameServer_GetAuthSessionTicket(steam_game_server, pTicket, cbMaxTicket, pcbTicket);
}


SteamGameServer_BeginAuthSession :: inline (pAuthTicket: *void, cbAuthTicket: s32, steamID: uint64_steamid) -> EBeginAuthSessionResult {
    return SteamAPI_ISteamGameServer_BeginAuthSession(steam_game_server, pAuthTicket, cbAuthTicket, steamID);
}


SteamGameServer_EndAuthSession :: inline (steamID: uint64_steamid) {
    SteamAPI_ISteamGameServer_EndAuthSession(steam_game_server, steamID);
}


SteamGameServer_CancelAuthTicket :: inline (hAuthTicket: HAuthTicket) {
    SteamAPI_ISteamGameServer_CancelAuthTicket(steam_game_server, hAuthTicket);
}


SteamGameServer_UserHasLicenseForApp :: inline (steamID: uint64_steamid, appID: AppId_t) -> EUserHasLicenseForAppResult {
    return SteamAPI_ISteamGameServer_UserHasLicenseForApp(steam_game_server, steamID, appID);
}


SteamGameServer_RequestUserGroupStatus :: inline (steamIDUser: uint64_steamid, steamIDGroup: uint64_steamid) -> bool {
    return SteamAPI_ISteamGameServer_RequestUserGroupStatus(steam_game_server, steamIDUser, steamIDGroup);
}


SteamGameServer_GetGameplayStats :: inline () {
    SteamAPI_ISteamGameServer_GetGameplayStats(steam_game_server);
}


SteamGameServer_GetServerReputation :: inline () -> SteamAPICall_t {
    return SteamAPI_ISteamGameServer_GetServerReputation(steam_game_server);
}


SteamGameServer_GetPublicIP :: inline () -> SteamIPAddress_t {
    return SteamAPI_ISteamGameServer_GetPublicIP(steam_game_server);
}


SteamGameServer_HandleIncomingPacket :: inline (pData: *void, cbData: s32, srcIP: uint32, srcPort: uint16) -> bool {
    return SteamAPI_ISteamGameServer_HandleIncomingPacket(steam_game_server, pData, cbData, srcIP, srcPort);
}


SteamGameServer_GetNextOutgoingPacket :: inline (pOut: *void, cbMaxOut: s32, pNetAdr: *uint32, pPort: *uint16) -> s32 {
    return SteamAPI_ISteamGameServer_GetNextOutgoingPacket(steam_game_server, pOut, cbMaxOut, pNetAdr, pPort);
}


SteamGameServer_EnableHeartbeats :: inline (bActive: bool) {
    SteamAPI_ISteamGameServer_EnableHeartbeats(steam_game_server, bActive);
}


SteamGameServer_SetHeartbeatInterval :: inline (iHeartbeatInterval: s32) {
    SteamAPI_ISteamGameServer_SetHeartbeatInterval(steam_game_server, iHeartbeatInterval);
}


SteamGameServer_ForceHeartbeat :: inline () {
    SteamAPI_ISteamGameServer_ForceHeartbeat(steam_game_server);
}


SteamGameServer_AssociateWithClan :: inline (steamIDClan: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamGameServer_AssociateWithClan(steam_game_server, steamIDClan);
}


SteamGameServer_ComputeNewPlayerCompatibility :: inline (steamIDNewPlayer: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamGameServer_ComputeNewPlayerCompatibility(steam_game_server, steamIDNewPlayer);
}
