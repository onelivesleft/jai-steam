steam_game_server_networking_sockets : *ISteamNetworkingSockets;
SteamGameServerNetworkingSockets : SteamGameServerNetworkingSockets_Namespace;


#scope_file


SteamGameServerNetworkingSockets_Namespace :: struct {
    // procs
    CreateListenSocketIP                               :: SteamNetworkingSockets_CreateListenSocketIP;
    ConnectByIPAddress                                 :: SteamNetworkingSockets_ConnectByIPAddress;
    CreateListenSocketP2P                              :: SteamNetworkingSockets_CreateListenSocketP2P;
    ConnectP2P                                         :: SteamNetworkingSockets_ConnectP2P;
    AcceptConnection                                   :: SteamNetworkingSockets_AcceptConnection;
    CloseConnection                                    :: SteamNetworkingSockets_CloseConnection;
    CloseListenSocket                                  :: SteamNetworkingSockets_CloseListenSocket;
    SetConnectionUserData                              :: SteamNetworkingSockets_SetConnectionUserData;
    GetConnectionUserData                              :: SteamNetworkingSockets_GetConnectionUserData;
    SetConnectionName                                  :: SteamNetworkingSockets_SetConnectionName;
    GetConnectionName                                  :: SteamNetworkingSockets_GetConnectionName;
    SendMessageToConnection                            :: SteamNetworkingSockets_SendMessageToConnection;
    SendMessages                                       :: SteamNetworkingSockets_SendMessages;
    FlushMessagesOnConnection                          :: SteamNetworkingSockets_FlushMessagesOnConnection;
    ReceiveMessagesOnConnection                        :: SteamNetworkingSockets_ReceiveMessagesOnConnection;
    GetConnectionInfo                                  :: SteamNetworkingSockets_GetConnectionInfo;
    GetQuickConnectionStatus                           :: SteamNetworkingSockets_GetQuickConnectionStatus;
    GetDetailedConnectionStatus                        :: SteamNetworkingSockets_GetDetailedConnectionStatus;
    GetListenSocketAddress                             :: SteamNetworkingSockets_GetListenSocketAddress;
    CreateSocketPair                                   :: SteamNetworkingSockets_CreateSocketPair;
    GetIdentity                                        :: SteamNetworkingSockets_GetIdentity;
    InitAuthentication                                 :: SteamNetworkingSockets_InitAuthentication;
    GetAuthenticationStatus                            :: SteamNetworkingSockets_GetAuthenticationStatus;
    CreatePollGroup                                    :: SteamNetworkingSockets_CreatePollGroup;
    DestroyPollGroup                                   :: SteamNetworkingSockets_DestroyPollGroup;
    SetConnectionPollGroup                             :: SteamNetworkingSockets_SetConnectionPollGroup;
    ReceiveMessagesOnPollGroup                         :: SteamNetworkingSockets_ReceiveMessagesOnPollGroup;
    ReceivedRelayAuthTicket                            :: SteamNetworkingSockets_ReceivedRelayAuthTicket;
    FindRelayAuthTicketForServer                       :: SteamNetworkingSockets_FindRelayAuthTicketForServer;
    ConnectToHostedDedicatedServer                     :: SteamNetworkingSockets_ConnectToHostedDedicatedServer;
    GetHostedDedicatedServerPort                       :: SteamNetworkingSockets_GetHostedDedicatedServerPort;
    GetHostedDedicatedServerPOPID                      :: SteamNetworkingSockets_GetHostedDedicatedServerPOPID;
    GetHostedDedicatedServerAddress                    :: SteamNetworkingSockets_GetHostedDedicatedServerAddress;
    CreateHostedDedicatedServerListenSocket            :: SteamNetworkingSockets_CreateHostedDedicatedServerListenSocket;
    GetGameCoordinatorServerLogin                      :: SteamNetworkingSockets_GetGameCoordinatorServerLogin;
    ConnectP2PCustomSignaling                          :: SteamNetworkingSockets_ConnectP2PCustomSignaling;
    ReceivedP2PCustomSignal                            :: SteamNetworkingSockets_ReceivedP2PCustomSignal;
    GetCertificateRequest                              :: SteamNetworkingSockets_GetCertificateRequest;
    SetCertificate                                     :: SteamNetworkingSockets_SetCertificate;
    RunCallbacks                                       :: SteamNetworkingSockets_RunCallbacks;
}


SteamNetworkingSockets_CreateListenSocketIP :: inline (localAddress: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket {
    return SteamAPI_ISteamNetworkingSockets_CreateListenSocketIP(steam_game_server_networking_sockets, localAddress, nOptions, pOptions);
}


SteamNetworkingSockets_ConnectByIPAddress :: inline (address: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectByIPAddress(steam_game_server_networking_sockets, address, nOptions, pOptions);
}


SteamNetworkingSockets_CreateListenSocketP2P :: inline (nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket {
    return SteamAPI_ISteamNetworkingSockets_CreateListenSocketP2P(steam_game_server_networking_sockets, nLocalVirtualPort, nOptions, pOptions);
}


SteamNetworkingSockets_ConnectP2P :: inline (identityRemote: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectP2P(steam_game_server_networking_sockets, identityRemote, nRemoteVirtualPort, nOptions, pOptions);
}


SteamNetworkingSockets_AcceptConnection :: inline (hConn: HSteamNetConnection) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_AcceptConnection(steam_game_server_networking_sockets, hConn);
}


SteamNetworkingSockets_CloseConnection :: inline (hPeer: HSteamNetConnection, nReason: s32, pszDebug: *char, bEnableLinger: bool) -> bool {
    return SteamAPI_ISteamNetworkingSockets_CloseConnection(steam_game_server_networking_sockets, hPeer, nReason, pszDebug, bEnableLinger);
}


SteamNetworkingSockets_CloseListenSocket :: inline (hSocket: HSteamListenSocket) -> bool {
    return SteamAPI_ISteamNetworkingSockets_CloseListenSocket(steam_game_server_networking_sockets, hSocket);
}


SteamNetworkingSockets_SetConnectionUserData :: inline (hPeer: HSteamNetConnection, nUserData: int64) -> bool {
    return SteamAPI_ISteamNetworkingSockets_SetConnectionUserData(steam_game_server_networking_sockets, hPeer, nUserData);
}


SteamNetworkingSockets_GetConnectionUserData :: inline (hPeer: HSteamNetConnection) -> int64 {
    return SteamAPI_ISteamNetworkingSockets_GetConnectionUserData(steam_game_server_networking_sockets, hPeer);
}


SteamNetworkingSockets_SetConnectionName :: inline (hPeer: HSteamNetConnection, pszName: *char) {
    SteamAPI_ISteamNetworkingSockets_SetConnectionName(steam_game_server_networking_sockets, hPeer, pszName);
}


SteamNetworkingSockets_GetConnectionName :: inline (hPeer: HSteamNetConnection, pszName: *char, nMaxLen: s32) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetConnectionName(steam_game_server_networking_sockets, hPeer, pszName, nMaxLen);
}


SteamNetworkingSockets_SendMessageToConnection :: inline (hConn: HSteamNetConnection, pData: *void, cbData: uint32, nSendFlags: s32, pOutMessageNumber: *int64) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_SendMessageToConnection(steam_game_server_networking_sockets, hConn, pData, cbData, nSendFlags, pOutMessageNumber);
}


SteamNetworkingSockets_SendMessages :: inline (nMessages: s32, pMessages: **SteamNetworkingMessage_t, pOutMessageNumberOrResult: *int64) {
    SteamAPI_ISteamNetworkingSockets_SendMessages(steam_game_server_networking_sockets, nMessages, pMessages, pOutMessageNumberOrResult);
}


SteamNetworkingSockets_FlushMessagesOnConnection :: inline (hConn: HSteamNetConnection) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_FlushMessagesOnConnection(steam_game_server_networking_sockets, hConn);
}


SteamNetworkingSockets_ReceiveMessagesOnConnection :: inline (hConn: HSteamNetConnection, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnConnection(steam_game_server_networking_sockets, hConn, ppOutMessages, nMaxMessages);
}


SteamNetworkingSockets_GetConnectionInfo :: inline (hConn: HSteamNetConnection, pInfo: *SteamNetConnectionInfo_t) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetConnectionInfo(steam_game_server_networking_sockets, hConn, pInfo);
}


SteamNetworkingSockets_GetQuickConnectionStatus :: inline (hConn: HSteamNetConnection, pStats: *SteamNetworkingQuickConnectionStatus) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetQuickConnectionStatus(steam_game_server_networking_sockets, hConn, pStats);
}


SteamNetworkingSockets_GetDetailedConnectionStatus :: inline (hConn: HSteamNetConnection, pszBuf: *char, cbBuf: s32) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_GetDetailedConnectionStatus(steam_game_server_networking_sockets, hConn, pszBuf, cbBuf);
}


SteamNetworkingSockets_GetListenSocketAddress :: inline (hSocket: HSteamListenSocket, address: *SteamNetworkingIPAddr) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetListenSocketAddress(steam_game_server_networking_sockets, hSocket, address);
}


SteamNetworkingSockets_CreateSocketPair :: inline (pOutConnection1: *HSteamNetConnection, pOutConnection2: *HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: *SteamNetworkingIdentity, pIdentity2: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingSockets_CreateSocketPair(steam_game_server_networking_sockets, pOutConnection1, pOutConnection2, bUseNetworkLoopback, pIdentity1, pIdentity2);
}


SteamNetworkingSockets_GetIdentity :: inline (pIdentity: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetIdentity(steam_game_server_networking_sockets, pIdentity);
}


SteamNetworkingSockets_InitAuthentication :: inline () -> ESteamNetworkingAvailability {
    return SteamAPI_ISteamNetworkingSockets_InitAuthentication(steam_game_server_networking_sockets);
}


SteamNetworkingSockets_GetAuthenticationStatus :: inline (pDetails: *SteamNetAuthenticationStatus_t) -> ESteamNetworkingAvailability {
    return SteamAPI_ISteamNetworkingSockets_GetAuthenticationStatus(steam_game_server_networking_sockets, pDetails);
}


SteamNetworkingSockets_CreatePollGroup :: inline () -> HSteamNetPollGroup {
    return SteamAPI_ISteamNetworkingSockets_CreatePollGroup(steam_game_server_networking_sockets);
}


SteamNetworkingSockets_DestroyPollGroup :: inline (hPollGroup: HSteamNetPollGroup) -> bool {
    return SteamAPI_ISteamNetworkingSockets_DestroyPollGroup(steam_game_server_networking_sockets, hPollGroup);
}


SteamNetworkingSockets_SetConnectionPollGroup :: inline (hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup) -> bool {
    return SteamAPI_ISteamNetworkingSockets_SetConnectionPollGroup(steam_game_server_networking_sockets, hConn, hPollGroup);
}


SteamNetworkingSockets_ReceiveMessagesOnPollGroup :: inline (hPollGroup: HSteamNetPollGroup, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnPollGroup(steam_game_server_networking_sockets, hPollGroup, ppOutMessages, nMaxMessages);
}


SteamNetworkingSockets_ReceivedRelayAuthTicket :: inline (pvTicket: *void, cbTicket: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> bool {
    return SteamAPI_ISteamNetworkingSockets_ReceivedRelayAuthTicket(steam_game_server_networking_sockets, pvTicket, cbTicket, pOutParsedTicket);
}


SteamNetworkingSockets_FindRelayAuthTicketForServer :: inline (identityGameServer: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_FindRelayAuthTicketForServer(steam_game_server_networking_sockets, identityGameServer, nRemoteVirtualPort, pOutParsedTicket);
}


SteamNetworkingSockets_ConnectToHostedDedicatedServer :: inline (identityTarget: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectToHostedDedicatedServer(steam_game_server_networking_sockets, identityTarget, nRemoteVirtualPort, nOptions, pOptions);
}


SteamNetworkingSockets_GetHostedDedicatedServerPort :: inline () -> uint16 {
    return SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPort(steam_game_server_networking_sockets);
}


SteamNetworkingSockets_GetHostedDedicatedServerPOPID :: inline () -> SteamNetworkingPOPID {
    return SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPOPID(steam_game_server_networking_sockets);
}


SteamNetworkingSockets_GetHostedDedicatedServerAddress :: inline (pRouting: *SteamDatagramHostedAddress) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerAddress(steam_game_server_networking_sockets, pRouting);
}


SteamNetworkingSockets_CreateHostedDedicatedServerListenSocket :: inline (nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket {
    return SteamAPI_ISteamNetworkingSockets_CreateHostedDedicatedServerListenSocket(steam_game_server_networking_sockets, nLocalVirtualPort, nOptions, pOptions);
}


SteamNetworkingSockets_GetGameCoordinatorServerLogin :: inline (pLoginInfo: *SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: *s32, pBlob: *void) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_GetGameCoordinatorServerLogin(steam_game_server_networking_sockets, pLoginInfo, pcbSignedBlob, pBlob);
}


SteamNetworkingSockets_ConnectP2PCustomSignaling :: inline (pSignaling: *ISteamNetworkingConnectionCustomSignaling, pPeerIdentity: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectP2PCustomSignaling(steam_game_server_networking_sockets, pSignaling, pPeerIdentity, nRemoteVirtualPort, nOptions, pOptions);
}


SteamNetworkingSockets_ReceivedP2PCustomSignal :: inline (pMsg: *void, cbMsg: s32, pContext: *ISteamNetworkingCustomSignalingRecvContext) -> bool {
    return SteamAPI_ISteamNetworkingSockets_ReceivedP2PCustomSignal(steam_game_server_networking_sockets, pMsg, cbMsg, pContext);
}


SteamNetworkingSockets_GetCertificateRequest :: inline (pcbBlob: *s32, pBlob: *void, errMsg: *SteamNetworkingErrMsg) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetCertificateRequest(steam_game_server_networking_sockets, pcbBlob, pBlob, errMsg);
}


SteamNetworkingSockets_SetCertificate :: inline (pCertificate: *void, cbCertificate: s32, errMsg: *SteamNetworkingErrMsg) -> bool {
    return SteamAPI_ISteamNetworkingSockets_SetCertificate(steam_game_server_networking_sockets, pCertificate, cbCertificate, errMsg);
}


SteamNetworkingSockets_RunCallbacks :: inline () {
    SteamAPI_ISteamNetworkingSockets_RunCallbacks(steam_game_server_networking_sockets);
}
