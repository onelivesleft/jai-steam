steam_game_server : *ISteamGameServer;

SteamGameServer : SteamGameServer_Namespace;


#scope_file


SteamGameServer_Namespace :: struct {
    // procs
                         :: SteamGameServer_SetProduct
                 :: SteamGameServer_SetGameDescription
                          :: SteamGameServer_SetModDir
                 :: SteamGameServer_SetDedicatedServer
                              :: SteamGameServer_LogOn
                     :: SteamGameServer_LogOnAnonymous
                             :: SteamGameServer_LogOff
                          :: SteamGameServer_BLoggedOn
                            :: SteamGameServer_BSecure
                         :: SteamGameServer_GetSteamID
                :: SteamGameServer_WasRestartRequested
                  :: SteamGameServer_SetMaxPlayerCount
                  :: SteamGameServer_SetBotPlayerCount
                      :: SteamGameServer_SetServerName
                         :: SteamGameServer_SetMapName
               :: SteamGameServer_SetPasswordProtected
                   :: SteamGameServer_SetSpectatorPort
             :: SteamGameServer_SetSpectatorServerName
                  :: SteamGameServer_ClearAllKeyValues
                        :: SteamGameServer_SetKeyValue
                        :: SteamGameServer_SetGameTags
                        :: SteamGameServer_SetGameData
                          :: SteamGameServer_SetRegion
     :: SteamGameServer_SendUserConnectAndAuthenticate
    :: SteamGameServer_CreateUnauthenticatedUserConnection
                 :: SteamGameServer_SendUserDisconnect
                    :: SteamGameServer_BUpdateUserData
               :: SteamGameServer_GetAuthSessionTicket
                   :: SteamGameServer_BeginAuthSession
                     :: SteamGameServer_EndAuthSession
                   :: SteamGameServer_CancelAuthTicket
               :: SteamGameServer_UserHasLicenseForApp
             :: SteamGameServer_RequestUserGroupStatus
                   :: SteamGameServer_GetGameplayStats
                :: SteamGameServer_GetServerReputation
                        :: SteamGameServer_GetPublicIP
               :: SteamGameServer_HandleIncomingPacket
              :: SteamGameServer_GetNextOutgoingPacket
                   :: SteamGameServer_EnableHeartbeats
               :: SteamGameServer_SetHeartbeatInterval
                     :: SteamGameServer_ForceHeartbeat
                  :: SteamGameServer_AssociateWithClan
      :: SteamGameServer_ComputeNewPlayerCompatibility
}


SteamGameServer_SetProduct :: inline (pszProduct: *char) {
    SteamAPI_ISteamGameServer_SetProduct(steam_game_server, pszProduct: *char);
}


SteamGameServer_SetGameDescription :: inline (pszGameDescription: *char) {
    SteamAPI_ISteamGameServer_SetGameDescription(steam_game_server, pszGameDescription: *char);
}


SteamGameServer_SetModDir :: inline (pszModDir: *char) {
    SteamAPI_ISteamGameServer_SetModDir(steam_game_server, pszModDir: *char);
}


SteamGameServer_SetDedicatedServer :: inline (bDedicated: bool) {
    SteamAPI_ISteamGameServer_SetDedicatedServer(steam_game_server, bDedicated: bool);
}


SteamGameServer_LogOn :: inline (pszToken: *char) {
    SteamAPI_ISteamGameServer_LogOn(steam_game_server, pszToken: *char);
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
    SteamAPI_ISteamGameServer_SetMaxPlayerCount(steam_game_server, cPlayersMax: s32);
}


SteamGameServer_SetBotPlayerCount :: inline (cBotplayers: s32) {
    SteamAPI_ISteamGameServer_SetBotPlayerCount(steam_game_server, cBotplayers: s32);
}


SteamGameServer_SetServerName :: inline (pszServerName: *char) {
    SteamAPI_ISteamGameServer_SetServerName(steam_game_server, pszServerName: *char);
}


SteamGameServer_SetMapName :: inline (pszMapName: *char) {
    SteamAPI_ISteamGameServer_SetMapName(steam_game_server, pszMapName: *char);
}


SteamGameServer_SetPasswordProtected :: inline (bPasswordProtected: bool) {
    SteamAPI_ISteamGameServer_SetPasswordProtected(steam_game_server, bPasswordProtected: bool);
}


SteamGameServer_SetSpectatorPort :: inline (unSpectatorPort: uint16) {
    SteamAPI_ISteamGameServer_SetSpectatorPort(steam_game_server, unSpectatorPort: uint16);
}


SteamGameServer_SetSpectatorServerName :: inline (pszSpectatorServerName: *char) {
    SteamAPI_ISteamGameServer_SetSpectatorServerName(steam_game_server, pszSpectatorServerName: *char);
}


SteamGameServer_ClearAllKeyValues :: inline () {
    SteamAPI_ISteamGameServer_ClearAllKeyValues(steam_game_server);
}


SteamGameServer_SetKeyValue :: inline (pKey: *char, pValue: *char) {
    SteamAPI_ISteamGameServer_SetKeyValue(steam_game_server, pKey: *char, pValue: *char);
}


SteamGameServer_SetGameTags :: inline (pchGameTags: *char) {
    SteamAPI_ISteamGameServer_SetGameTags(steam_game_server, pchGameTags: *char);
}


SteamGameServer_SetGameData :: inline (pchGameData: *char) {
    SteamAPI_ISteamGameServer_SetGameData(steam_game_server, pchGameData: *char);
}


SteamGameServer_SetRegion :: inline (pszRegion: *char) {
    SteamAPI_ISteamGameServer_SetRegion(steam_game_server, pszRegion: *char);
}


SteamGameServer_SendUserConnectAndAuthenticate :: inline (unIPClient: uint32, pvAuthBlob: *void, cubAuthBlobSize: uint32, pSteamIDUser: *CSteamID) -> bool {
    return SteamAPI_ISteamGameServer_SendUserConnectAndAuthenticate(steam_game_server, unIPClient: uint32, pvAuthBlob: *void, cubAuthBlobSize: uint32, pSteamIDUser: *CSteamID);
}


SteamGameServer_CreateUnauthenticatedUserConnection :: inline () -> uint64_steamid {
    return SteamAPI_ISteamGameServer_CreateUnauthenticatedUserConnection(steam_game_server);
}


SteamGameServer_SendUserDisconnect :: inline (steamIDUser: uint64_steamid) {
    SteamAPI_ISteamGameServer_SendUserDisconnect(steam_game_server, steamIDUser: uint64_steamid);
}


SteamGameServer_BUpdateUserData :: inline (steamIDUser: uint64_steamid, pchPlayerName: *char, uScore: uint32) -> bool {
    return SteamAPI_ISteamGameServer_BUpdateUserData(steam_game_server, steamIDUser: uint64_steamid, pchPlayerName: *char, uScore: uint32);
}


SteamGameServer_GetAuthSessionTicket :: inline (pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> HAuthTicket {
    return SteamAPI_ISteamGameServer_GetAuthSessionTicket(steam_game_server, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32);
}


SteamGameServer_BeginAuthSession :: inline (pAuthTicket: *void, cbAuthTicket: s32, steamID: uint64_steamid) -> EBeginAuthSessionResult {
    return SteamAPI_ISteamGameServer_BeginAuthSession(steam_game_server, pAuthTicket: *void, cbAuthTicket: s32, steamID: uint64_steamid);
}


SteamGameServer_EndAuthSession :: inline (steamID: uint64_steamid) {
    SteamAPI_ISteamGameServer_EndAuthSession(steam_game_server, steamID: uint64_steamid);
}


SteamGameServer_CancelAuthTicket :: inline (hAuthTicket: HAuthTicket) {
    SteamAPI_ISteamGameServer_CancelAuthTicket(steam_game_server, hAuthTicket: HAuthTicket);
}


SteamGameServer_UserHasLicenseForApp :: inline (steamID: uint64_steamid, appID: AppId_t) -> EUserHasLicenseForAppResult {
    return SteamAPI_ISteamGameServer_UserHasLicenseForApp(steam_game_server, steamID: uint64_steamid, appID: AppId_t);
}


SteamGameServer_RequestUserGroupStatus :: inline (steamIDUser: uint64_steamid, steamIDGroup: uint64_steamid) -> bool {
    return SteamAPI_ISteamGameServer_RequestUserGroupStatus(steam_game_server, steamIDUser: uint64_steamid, steamIDGroup: uint64_steamid);
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
    return SteamAPI_ISteamGameServer_HandleIncomingPacket(steam_game_server, pData: *void, cbData: s32, srcIP: uint32, srcPort: uint16);
}


SteamGameServer_GetNextOutgoingPacket :: inline (pOut: *void, cbMaxOut: s32, pNetAdr: *uint32, pPort: *uint16) -> s32 {
    return SteamAPI_ISteamGameServer_GetNextOutgoingPacket(steam_game_server, pOut: *void, cbMaxOut: s32, pNetAdr: *uint32, pPort: *uint16);
}


SteamGameServer_EnableHeartbeats :: inline (bActive: bool) {
    SteamAPI_ISteamGameServer_EnableHeartbeats(steam_game_server, bActive: bool);
}


SteamGameServer_SetHeartbeatInterval :: inline (iHeartbeatInterval: s32) {
    SteamAPI_ISteamGameServer_SetHeartbeatInterval(steam_game_server, iHeartbeatInterval: s32);
}


SteamGameServer_ForceHeartbeat :: inline () {
    SteamAPI_ISteamGameServer_ForceHeartbeat(steam_game_server);
}


SteamGameServer_AssociateWithClan :: inline (steamIDClan: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamGameServer_AssociateWithClan(steam_game_server, steamIDClan: uint64_steamid);
}


SteamGameServer_ComputeNewPlayerCompatibility :: inline (steamIDNewPlayer: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamGameServer_ComputeNewPlayerCompatibility(steam_game_server, steamIDNewPlayer: uint64_steamid);
}
