steam_client : *ISteamClient;
SteamClient : SteamClient_Namespace;


#scope_file


SteamClient_Namespace :: struct {
    // procs
    CreateSteamPipe                                    :: SteamClient_CreateSteamPipe;
    BReleaseSteamPipe                                  :: SteamClient_BReleaseSteamPipe;
    ConnectToGlobalUser                                :: SteamClient_ConnectToGlobalUser;
    CreateLocalUser                                    :: SteamClient_CreateLocalUser;
    ReleaseUser                                        :: SteamClient_ReleaseUser;
    GetISteamUser                                      :: SteamClient_GetISteamUser;
    GetISteamGameServer                                :: SteamClient_GetISteamGameServer;
    SetLocalIPBinding                                  :: SteamClient_SetLocalIPBinding;
    GetISteamFriends                                   :: SteamClient_GetISteamFriends;
    GetISteamUtils                                     :: SteamClient_GetISteamUtils;
    GetISteamMatchmaking                               :: SteamClient_GetISteamMatchmaking;
    GetISteamMatchmakingServers                        :: SteamClient_GetISteamMatchmakingServers;
    GetISteamGenericInterface                          :: SteamClient_GetISteamGenericInterface;
    GetISteamUserStats                                 :: SteamClient_GetISteamUserStats;
    GetISteamGameServerStats                           :: SteamClient_GetISteamGameServerStats;
    GetISteamApps                                      :: SteamClient_GetISteamApps;
    GetISteamNetworking                                :: SteamClient_GetISteamNetworking;
    GetISteamRemoteStorage                             :: SteamClient_GetISteamRemoteStorage;
    GetISteamScreenshots                               :: SteamClient_GetISteamScreenshots;
    GetISteamGameSearch                                :: SteamClient_GetISteamGameSearch;
    GetIPCCallCount                                    :: SteamClient_GetIPCCallCount;
    SetWarningMessageHook                              :: SteamClient_SetWarningMessageHook;
    BShutdownIfAllPipesClosed                          :: SteamClient_BShutdownIfAllPipesClosed;
    GetISteamHTTP                                      :: SteamClient_GetISteamHTTP;
    GetISteamController                                :: SteamClient_GetISteamController;
    GetISteamUGC                                       :: SteamClient_GetISteamUGC;
    GetISteamAppList                                   :: SteamClient_GetISteamAppList;
    GetISteamMusic                                     :: SteamClient_GetISteamMusic;
    GetISteamMusicRemote                               :: SteamClient_GetISteamMusicRemote;
    GetISteamHTMLSurface                               :: SteamClient_GetISteamHTMLSurface;
    GetISteamInventory                                 :: SteamClient_GetISteamInventory;
    GetISteamVideo                                     :: SteamClient_GetISteamVideo;
    GetISteamParentalSettings                          :: SteamClient_GetISteamParentalSettings;
    GetISteamInput                                     :: SteamClient_GetISteamInput;
    GetISteamParties                                   :: SteamClient_GetISteamParties;
    GetISteamRemotePlay                                :: SteamClient_GetISteamRemotePlay;
}


SteamClient_CreateSteamPipe :: inline () -> HSteamPipe {
    return SteamAPI_ISteamClient_CreateSteamPipe(steam_client);
}


SteamClient_BReleaseSteamPipe :: inline (hSteamPipe: HSteamPipe) -> bool {
    return SteamAPI_ISteamClient_BReleaseSteamPipe(steam_client, hSteamPipe);
}


SteamClient_ConnectToGlobalUser :: inline (hSteamPipe: HSteamPipe) -> HSteamUser {
    return SteamAPI_ISteamClient_ConnectToGlobalUser(steam_client, hSteamPipe);
}


SteamClient_CreateLocalUser :: inline (phSteamPipe: *HSteamPipe, eAccountType: EAccountType) -> HSteamUser {
    return SteamAPI_ISteamClient_CreateLocalUser(steam_client, phSteamPipe, eAccountType);
}


SteamClient_ReleaseUser :: inline (hSteamPipe: HSteamPipe, hUser: HSteamUser) {
    SteamAPI_ISteamClient_ReleaseUser(steam_client, hSteamPipe, hUser);
}


SteamClient_GetISteamUser :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUser {
    return SteamAPI_ISteamClient_GetISteamUser(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamGameServer :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamGameServer {
    return SteamAPI_ISteamClient_GetISteamGameServer(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_SetLocalIPBinding :: inline (unIP: *SteamIPAddress_t, usPort: uint16) {
    SteamAPI_ISteamClient_SetLocalIPBinding(steam_client, unIP, usPort);
}


SteamClient_GetISteamFriends :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamFriends {
    return SteamAPI_ISteamClient_GetISteamFriends(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamUtils :: inline (hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUtils {
    return SteamAPI_ISteamClient_GetISteamUtils(steam_client, hSteamPipe, pchVersion);
}


SteamClient_GetISteamMatchmaking :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMatchmaking {
    return SteamAPI_ISteamClient_GetISteamMatchmaking(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamMatchmakingServers :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMatchmakingServers {
    return SteamAPI_ISteamClient_GetISteamMatchmakingServers(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamGenericInterface :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) {
    SteamAPI_ISteamClient_GetISteamGenericInterface(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamUserStats :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUserStats {
    return SteamAPI_ISteamClient_GetISteamUserStats(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamGameServerStats :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamGameServerStats {
    return SteamAPI_ISteamClient_GetISteamGameServerStats(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamApps :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamApps {
    return SteamAPI_ISteamClient_GetISteamApps(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamNetworking :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamNetworking {
    return SteamAPI_ISteamClient_GetISteamNetworking(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamRemoteStorage :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamRemoteStorage {
    return SteamAPI_ISteamClient_GetISteamRemoteStorage(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamScreenshots :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamScreenshots {
    return SteamAPI_ISteamClient_GetISteamScreenshots(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamGameSearch :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamGameSearch {
    return SteamAPI_ISteamClient_GetISteamGameSearch(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetIPCCallCount :: inline () -> uint32 {
    return SteamAPI_ISteamClient_GetIPCCallCount(steam_client);
}


SteamClient_SetWarningMessageHook :: inline (pFunction: SteamAPIWarningMessageHook_t) {
    SteamAPI_ISteamClient_SetWarningMessageHook(steam_client, pFunction);
}


SteamClient_BShutdownIfAllPipesClosed :: inline () -> bool {
    return SteamAPI_ISteamClient_BShutdownIfAllPipesClosed(steam_client);
}


SteamClient_GetISteamHTTP :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamHTTP {
    return SteamAPI_ISteamClient_GetISteamHTTP(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamController :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamController {
    return SteamAPI_ISteamClient_GetISteamController(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamUGC :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUGC {
    return SteamAPI_ISteamClient_GetISteamUGC(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamAppList :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamAppList {
    return SteamAPI_ISteamClient_GetISteamAppList(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamMusic :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMusic {
    return SteamAPI_ISteamClient_GetISteamMusic(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamMusicRemote :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMusicRemote {
    return SteamAPI_ISteamClient_GetISteamMusicRemote(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamHTMLSurface :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamHTMLSurface {
    return SteamAPI_ISteamClient_GetISteamHTMLSurface(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamInventory :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamInventory {
    return SteamAPI_ISteamClient_GetISteamInventory(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamVideo :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamVideo {
    return SteamAPI_ISteamClient_GetISteamVideo(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamParentalSettings :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamParentalSettings {
    return SteamAPI_ISteamClient_GetISteamParentalSettings(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamInput :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamInput {
    return SteamAPI_ISteamClient_GetISteamInput(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamParties :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamParties {
    return SteamAPI_ISteamClient_GetISteamParties(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamRemotePlay :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamRemotePlay {
    return SteamAPI_ISteamClient_GetISteamRemotePlay(steam_client, hSteamUser, hSteamPipe, pchVersion);
}
