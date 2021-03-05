steam_client : *ISteamClient;


CreateSteamPipe :: inline () -> HSteamPipe {
    return SteamAPI_ISteamClient_CreateSteamPipe(steam_client);
}


BReleaseSteamPipe :: inline (hSteamPipe: HSteamPipe) -> bool {
    return SteamAPI_ISteamClient_BReleaseSteamPipe(steam_client, hSteamPipe);
}


ConnectToGlobalUser :: inline (hSteamPipe: HSteamPipe) -> HSteamUser {
    return SteamAPI_ISteamClient_ConnectToGlobalUser(steam_client, hSteamPipe);
}


CreateLocalUser :: inline (phSteamPipe: *HSteamPipe, eAccountType: EAccountType) -> HSteamUser {
    return SteamAPI_ISteamClient_CreateLocalUser(steam_client, phSteamPipe, eAccountType);
}


ReleaseUser :: inline (hSteamPipe: HSteamPipe, hUser: HSteamUser) {
    SteamAPI_ISteamClient_ReleaseUser(steam_client, hSteamPipe, hUser);
}


GetISteamUser :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUser {
    return SteamAPI_ISteamClient_GetISteamUser(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


GetISteamGameServer :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamGameServer {
    return SteamAPI_ISteamClient_GetISteamGameServer(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SetLocalIPBinding :: inline (unIP: *SteamIPAddress_t, usPort: uint16) {
    SteamAPI_ISteamClient_SetLocalIPBinding(steam_client, unIP, usPort);
}


GetISteamFriends :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamFriends {
    return SteamAPI_ISteamClient_GetISteamFriends(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


GetISteamUtils :: inline (hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUtils {
    return SteamAPI_ISteamClient_GetISteamUtils(steam_client, hSteamPipe, pchVersion);
}


GetISteamMatchmaking :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMatchmaking {
    return SteamAPI_ISteamClient_GetISteamMatchmaking(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


GetISteamMatchmakingServers :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMatchmakingServers {
    return SteamAPI_ISteamClient_GetISteamMatchmakingServers(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


GetISteamGenericInterface :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) {
    SteamAPI_ISteamClient_GetISteamGenericInterface(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


GetISteamUserStats :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUserStats {
    return SteamAPI_ISteamClient_GetISteamUserStats(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


GetISteamGameServerStats :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamGameServerStats {
    return SteamAPI_ISteamClient_GetISteamGameServerStats(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


GetISteamApps :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamApps {
    return SteamAPI_ISteamClient_GetISteamApps(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


GetISteamNetworking :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamNetworking {
    return SteamAPI_ISteamClient_GetISteamNetworking(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


GetISteamRemoteStorage :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamRemoteStorage {
    return SteamAPI_ISteamClient_GetISteamRemoteStorage(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


GetISteamScreenshots :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamScreenshots {
    return SteamAPI_ISteamClient_GetISteamScreenshots(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


GetISteamGameSearch :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamGameSearch {
    return SteamAPI_ISteamClient_GetISteamGameSearch(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


BShutdownIfAllPipesClosed :: inline () -> bool {
    return SteamAPI_ISteamClient_BShutdownIfAllPipesClosed(steam_client);
}


GetISteamHTTP :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamHTTP {
    return SteamAPI_ISteamClient_GetISteamHTTP(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


GetISteamController :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamController {
    return SteamAPI_ISteamClient_GetISteamController(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


GetISteamUGC :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUGC {
    return SteamAPI_ISteamClient_GetISteamUGC(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


GetISteamAppList :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamAppList {
    return SteamAPI_ISteamClient_GetISteamAppList(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


GetISteamMusic :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMusic {
    return SteamAPI_ISteamClient_GetISteamMusic(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


GetISteamMusicRemote :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMusicRemote {
    return SteamAPI_ISteamClient_GetISteamMusicRemote(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


GetISteamHTMLSurface :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamHTMLSurface {
    return SteamAPI_ISteamClient_GetISteamHTMLSurface(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


GetISteamInventory :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamInventory {
    return SteamAPI_ISteamClient_GetISteamInventory(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


GetISteamVideo :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamVideo {
    return SteamAPI_ISteamClient_GetISteamVideo(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


GetISteamParentalSettings :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamParentalSettings {
    return SteamAPI_ISteamClient_GetISteamParentalSettings(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


GetISteamInput :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamInput {
    return SteamAPI_ISteamClient_GetISteamInput(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


GetISteamParties :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamParties {
    return SteamAPI_ISteamClient_GetISteamParties(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


GetISteamRemotePlay :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamRemotePlay {
    return SteamAPI_ISteamClient_GetISteamRemotePlay(steam_client, hSteamUser, hSteamPipe, pchVersion);
}
