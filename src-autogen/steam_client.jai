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


SteamClient_CreateSteamPipe :: inline () -> HSteamPipe #foreign steam "SteamAPI_ISteamClient_C {
    return SteamClient_CreateSteamPipe(steam_client);
}


SteamClient_BReleaseSteamPipe :: inline (hSteamPipe: HSteamPipe) -> bool #foreign steam "SteamAPI_ISteamClient_BRe {
    return SteamClient_BReleaseSteamPipe(steam_client, hSteamPipe);
}


SteamClient_ConnectToGlobalUser :: inline (hSteamPipe: HSteamPipe) -> HSteamUser #foreign steam "SteamAPI_ISteamClient_Conne {
    return SteamClient_ConnectToGlobalUser(steam_client, hSteamPipe);
}


SteamClient_CreateLocalUser :: inline (phSteamPipe: *HSteamPipe, eAccountType: EAccountType) -> HSteamUser #foreign steam "SteamAPI_ISteamClient_C {
    return SteamClient_CreateLocalUser(steam_client, phSteamPipe, eAccountType);
}


SteamClient_ReleaseUser :: inline (hSteamPipe: HSteamPipe, hUser: HSteamUser) {
    SteamClient_ReleaseUser(steam_client, hSteamPipe, hUser);
}


SteamClient_GetISteamUser :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUser #foreign steam "SteamAPI_ISteamClient {
    return SteamClient_GetISteamUser(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamGameServer :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamGameServer #foreign steam "SteamAPI_ISteamClient_GetIS {
    return SteamClient_GetISteamGameServer(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_SetLocalIPBinding :: inline (unIP: *SteamIPAddress_t, usPort: uint16) {
    SteamClient_SetLocalIPBinding(steam_client, unIP, usPort);
}


SteamClient_GetISteamFriends :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamFriends #foreign steam "SteamAPI_ISteamClient_Ge {
    return SteamClient_GetISteamFriends(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamUtils :: inline (hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUtils #foreign steam "SteamAPI_ISteamClient_ {
    return SteamClient_GetISteamUtils(steam_client, hSteamPipe, pchVersion);
}


SteamClient_GetISteamMatchmaking :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMatchmaking #foreign steam "SteamAPI_ISteamClient_GetISt {
    return SteamClient_GetISteamMatchmaking(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamMatchmakingServers :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMatchmakingServers #foreign steam "SteamAPI_ISteamClient_GetISteamMatc {
    return SteamClient_GetISteamMatchmakingServers(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamGenericInterface :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) {
    SteamClient_GetISteamGenericInterface(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamUserStats :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUserStats #foreign steam "SteamAPI_ISteamClient_GetI {
    return SteamClient_GetISteamUserStats(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamGameServerStats :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamGameServerStats #foreign steam "SteamAPI_ISteamClient_GetISteamG {
    return SteamClient_GetISteamGameServerStats(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamApps :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamApps #foreign steam "SteamAPI_ISteamClient {
    return SteamClient_GetISteamApps(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamNetworking :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamNetworking #foreign steam "SteamAPI_ISteamClient_GetIS {
    return SteamClient_GetISteamNetworking(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamRemoteStorage :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamRemoteStorage #foreign steam "SteamAPI_ISteamClient_GetIStea {
    return SteamClient_GetISteamRemoteStorage(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamScreenshots :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamScreenshots #foreign steam "SteamAPI_ISteamClient_GetISt {
    return SteamClient_GetISteamScreenshots(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamGameSearch :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamGameSearch #foreign steam "SteamAPI_ISteamClient_GetIS {
    return SteamClient_GetISteamGameSearch(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetIPCCallCount :: inline () -> uint32 #foreign steam "SteamAPI_ISteamClient_G {
    return SteamClient_GetIPCCallCount(steam_client);
}


SteamClient_SetWarningMessageHook :: inline (pFunction: SteamAPIWarningMessageHook_t) {
    SteamClient_SetWarningMessageHook(steam_client, pFunction);
}


SteamClient_BShutdownIfAllPipesClosed :: inline () -> bool #foreign steam "SteamAPI_ISteamClient_BShutdownIf {
    return SteamClient_BShutdownIfAllPipesClosed(steam_client);
}


SteamClient_GetISteamHTTP :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamHTTP #foreign steam "SteamAPI_ISteamClient {
    return SteamClient_GetISteamHTTP(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamController :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamController #foreign steam "SteamAPI_ISteamClient_GetIS {
    return SteamClient_GetISteamController(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamUGC :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUGC #foreign steam "SteamAPI_ISteamClien {
    return SteamClient_GetISteamUGC(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamAppList :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamAppList #foreign steam "SteamAPI_ISteamClient_Ge {
    return SteamClient_GetISteamAppList(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamMusic :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMusic #foreign steam "SteamAPI_ISteamClient_ {
    return SteamClient_GetISteamMusic(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamMusicRemote :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMusicRemote #foreign steam "SteamAPI_ISteamClient_GetISt {
    return SteamClient_GetISteamMusicRemote(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamHTMLSurface :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamHTMLSurface #foreign steam "SteamAPI_ISteamClient_GetISt {
    return SteamClient_GetISteamHTMLSurface(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamInventory :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamInventory #foreign steam "SteamAPI_ISteamClient_GetI {
    return SteamClient_GetISteamInventory(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamVideo :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamVideo #foreign steam "SteamAPI_ISteamClient_ {
    return SteamClient_GetISteamVideo(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamParentalSettings :: inline (hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamParentalSettings #foreign steam "SteamAPI_ISteamClient_GetISteamPa {
    return SteamClient_GetISteamParentalSettings(steam_client, hSteamuser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamInput :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamInput #foreign steam "SteamAPI_ISteamClient_ {
    return SteamClient_GetISteamInput(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamParties :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamParties #foreign steam "SteamAPI_ISteamClient_Ge {
    return SteamClient_GetISteamParties(steam_client, hSteamUser, hSteamPipe, pchVersion);
}


SteamClient_GetISteamRemotePlay :: inline (hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamRemotePlay #foreign steam "SteamAPI_ISteamClient_GetIS {
    return SteamClient_GetISteamRemotePlay(steam_client, hSteamUser, hSteamPipe, pchVersion);
}
