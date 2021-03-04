steam_networking_sockets : *ISteamNetworkingSockets;
SteamNetworkingSockets : SteamNetworkingSockets_Namespace;


#scope_file


SteamNetworkingSockets_Namespace :: struct {
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


SteamNetworkingSockets_CreateListenSocketIP :: inline (localAddress: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #foreign steam "SteamAPI_ISteamNetworkingSockets_Create {
    return SteamNetworkingSockets_CreateListenSocketIP(steam_networking_sockets, localAddress, nOptions, pOptions);
}


SteamNetworkingSockets_ConnectByIPAddress :: inline (address: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #foreign steam "SteamAPI_ISteamNetworkingSockets_Conn {
    return SteamNetworkingSockets_ConnectByIPAddress(steam_networking_sockets, address, nOptions, pOptions);
}


SteamNetworkingSockets_CreateListenSocketP2P :: inline (nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #foreign steam "SteamAPI_ISteamNetworkingSockets_CreateL {
    return SteamNetworkingSockets_CreateListenSocketP2P(steam_networking_sockets, nLocalVirtualPort, nOptions, pOptions);
}


SteamNetworkingSockets_ConnectP2P :: inline (identityRemote: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #foreign steam "SteamAPI_ISteamNetworkingSock {
    return SteamNetworkingSockets_ConnectP2P(steam_networking_sockets, identityRemote, nRemoteVirtualPort, nOptions, pOptions);
}


SteamNetworkingSockets_AcceptConnection :: inline (hConn: HSteamNetConnection) -> EResult #foreign steam "SteamAPI_ISteamNetworkingSockets_Ac {
    return SteamNetworkingSockets_AcceptConnection(steam_networking_sockets, hConn);
}


SteamNetworkingSockets_CloseConnection :: inline (hPeer: HSteamNetConnection, nReason: s32, pszDebug: *char, bEnableLinger: bool) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_C {
    return SteamNetworkingSockets_CloseConnection(steam_networking_sockets, hPeer, nReason, pszDebug, bEnableLinger);
}


SteamNetworkingSockets_CloseListenSocket :: inline (hSocket: HSteamListenSocket) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_Clo {
    return SteamNetworkingSockets_CloseListenSocket(steam_networking_sockets, hSocket);
}


SteamNetworkingSockets_SetConnectionUserData :: inline (hPeer: HSteamNetConnection, nUserData: int64) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_SetConn {
    return SteamNetworkingSockets_SetConnectionUserData(steam_networking_sockets, hPeer, nUserData);
}


SteamNetworkingSockets_GetConnectionUserData :: inline (hPeer: HSteamNetConnection) -> int64 #foreign steam "SteamAPI_ISteamNetworkingSockets_GetConn {
    return SteamNetworkingSockets_GetConnectionUserData(steam_networking_sockets, hPeer);
}


SteamNetworkingSockets_SetConnectionName :: inline (hPeer: HSteamNetConnection, pszName: *char) {
    SteamNetworkingSockets_SetConnectionName(steam_networking_sockets, hPeer, pszName);
}


SteamNetworkingSockets_GetConnectionName :: inline (hPeer: HSteamNetConnection, pszName: *char, nMaxLen: s32) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_Get {
    return SteamNetworkingSockets_GetConnectionName(steam_networking_sockets, hPeer, pszName, nMaxLen);
}


SteamNetworkingSockets_SendMessageToConnection :: inline (hConn: HSteamNetConnection, pData: *void, cbData: uint32, nSendFlags: s32, pOutMessageNumber: *int64) -> EResult #foreign steam "SteamAPI_ISteamNetworkingSockets_SendMessa {
    return SteamNetworkingSockets_SendMessageToConnection(steam_networking_sockets, hConn, pData, cbData, nSendFlags, pOutMessageNumber);
}


SteamNetworkingSockets_SendMessages :: inline (nMessages: s32, pMessages: **SteamNetworkingMessage_t, pOutMessageNumberOrResult: *int64) {
    SteamNetworkingSockets_SendMessages(steam_networking_sockets, nMessages, pMessages, pOutMessageNumberOrResult);
}


SteamNetworkingSockets_FlushMessagesOnConnection :: inline (hConn: HSteamNetConnection) -> EResult #foreign steam "SteamAPI_ISteamNetworkingSockets_FlushMessag {
    return SteamNetworkingSockets_FlushMessagesOnConnection(steam_networking_sockets, hConn);
}


SteamNetworkingSockets_ReceiveMessagesOnConnection :: inline (hConn: HSteamNetConnection, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 #foreign steam "SteamAPI_ISteamNetworkingSockets_ReceiveMessag {
    return SteamNetworkingSockets_ReceiveMessagesOnConnection(steam_networking_sockets, hConn, ppOutMessages, nMaxMessages);
}


SteamNetworkingSockets_GetConnectionInfo :: inline (hConn: HSteamNetConnection, pInfo: *SteamNetConnectionInfo_t) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_Get {
    return SteamNetworkingSockets_GetConnectionInfo(steam_networking_sockets, hConn, pInfo);
}


SteamNetworkingSockets_GetQuickConnectionStatus :: inline (hConn: HSteamNetConnection, pStats: *SteamNetworkingQuickConnectionStatus) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_GetQuickCo {
    return SteamNetworkingSockets_GetQuickConnectionStatus(steam_networking_sockets, hConn, pStats);
}


SteamNetworkingSockets_GetDetailedConnectionStatus :: inline (hConn: HSteamNetConnection, pszBuf: *char, cbBuf: s32) -> s32 #foreign steam "SteamAPI_ISteamNetworkingSockets_GetDetailedCo {
    return SteamNetworkingSockets_GetDetailedConnectionStatus(steam_networking_sockets, hConn, pszBuf, cbBuf);
}


SteamNetworkingSockets_GetListenSocketAddress :: inline (hSocket: HSteamListenSocket, address: *SteamNetworkingIPAddr) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_GetListe {
    return SteamNetworkingSockets_GetListenSocketAddress(steam_networking_sockets, hSocket, address);
}


SteamNetworkingSockets_CreateSocketPair :: inline (pOutConnection1: *HSteamNetConnection, pOutConnection2: *HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: *SteamNetworkingIdentity, pIdentity2: *SteamNetworkingIdentity) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_Cr {
    return SteamNetworkingSockets_CreateSocketPair(steam_networking_sockets, pOutConnection1, pOutConnection2, bUseNetworkLoopback, pIdentity1, pIdentity2);
}


SteamNetworkingSockets_GetIdentity :: inline (pIdentity: *SteamNetworkingIdentity) -> bool #foreign steam "SteamAPI_ISteamNetworkingSocke {
    return SteamNetworkingSockets_GetIdentity(steam_networking_sockets, pIdentity);
}


SteamNetworkingSockets_InitAuthentication :: inline () -> ESteamNetworkingAvailability #foreign steam "SteamAPI_ISteamNetworkingSockets_Init {
    return SteamNetworkingSockets_InitAuthentication(steam_networking_sockets);
}


SteamNetworkingSockets_GetAuthenticationStatus :: inline (pDetails: *SteamNetAuthenticationStatus_t) -> ESteamNetworkingAvailability #foreign steam "SteamAPI_ISteamNetworkingSockets_GetAuthen {
    return SteamNetworkingSockets_GetAuthenticationStatus(steam_networking_sockets, pDetails);
}


SteamNetworkingSockets_CreatePollGroup :: inline () -> HSteamNetPollGroup #foreign steam "SteamAPI_ISteamNetworkingSockets_C {
    return SteamNetworkingSockets_CreatePollGroup(steam_networking_sockets);
}


SteamNetworkingSockets_DestroyPollGroup :: inline (hPollGroup: HSteamNetPollGroup) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_De {
    return SteamNetworkingSockets_DestroyPollGroup(steam_networking_sockets, hPollGroup);
}


SteamNetworkingSockets_SetConnectionPollGroup :: inline (hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_SetConne {
    return SteamNetworkingSockets_SetConnectionPollGroup(steam_networking_sockets, hConn, hPollGroup);
}


SteamNetworkingSockets_ReceiveMessagesOnPollGroup :: inline (hPollGroup: HSteamNetPollGroup, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 #foreign steam "SteamAPI_ISteamNetworkingSockets_ReceiveMessa {
    return SteamNetworkingSockets_ReceiveMessagesOnPollGroup(steam_networking_sockets, hPollGroup, ppOutMessages, nMaxMessages);
}


SteamNetworkingSockets_ReceivedRelayAuthTicket :: inline (pvTicket: *void, cbTicket: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_ReceivedR {
    return SteamNetworkingSockets_ReceivedRelayAuthTicket(steam_networking_sockets, pvTicket, cbTicket, pOutParsedTicket);
}


SteamNetworkingSockets_FindRelayAuthTicketForServer :: inline (identityGameServer: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> s32 #foreign steam "SteamAPI_ISteamNetworkingSockets_FindRelayAuthT {
    return SteamNetworkingSockets_FindRelayAuthTicketForServer(steam_networking_sockets, identityGameServer, nRemoteVirtualPort, pOutParsedTicket);
}


SteamNetworkingSockets_ConnectToHostedDedicatedServer :: inline (identityTarget: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #foreign steam "SteamAPI_ISteamNetworkingSockets_ConnectToHostedD {
    return SteamNetworkingSockets_ConnectToHostedDedicatedServer(steam_networking_sockets, identityTarget, nRemoteVirtualPort, nOptions, pOptions);
}


SteamNetworkingSockets_GetHostedDedicatedServerPort :: inline () -> uint16 #foreign steam "SteamAPI_ISteamNetworkingSockets_GetHostedDedic {
    return SteamNetworkingSockets_GetHostedDedicatedServerPort(steam_networking_sockets);
}


SteamNetworkingSockets_GetHostedDedicatedServerPOPID :: inline () -> SteamNetworkingPOPID #foreign steam "SteamAPI_ISteamNetworkingSockets_GetHostedDedica {
    return SteamNetworkingSockets_GetHostedDedicatedServerPOPID(steam_networking_sockets);
}


SteamNetworkingSockets_GetHostedDedicatedServerAddress :: inline (pRouting: *SteamDatagramHostedAddress) -> EResult #foreign steam "SteamAPI_ISteamNetworkingSockets_GetHostedDedicate {
    return SteamNetworkingSockets_GetHostedDedicatedServerAddress(steam_networking_sockets, pRouting);
}


SteamNetworkingSockets_CreateHostedDedicatedServerListenSocket :: inline (nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #foreign steam "SteamAPI_ISteamNetworkingSockets_CreateHostedDedicatedServ {
    return SteamNetworkingSockets_CreateHostedDedicatedServerListenSocket(steam_networking_sockets, nLocalVirtualPort, nOptions, pOptions);
}


SteamNetworkingSockets_GetGameCoordinatorServerLogin :: inline (pLoginInfo: *SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: *s32, pBlob: *void) -> EResult #foreign steam "SteamAPI_ISteamNetworkingSockets_GetGameCoordina {
    return SteamNetworkingSockets_GetGameCoordinatorServerLogin(steam_networking_sockets, pLoginInfo, pcbSignedBlob, pBlob);
}


SteamNetworkingSockets_ConnectP2PCustomSignaling :: inline (pSignaling: *ISteamNetworkingConnectionCustomSignaling, pPeerIdentity: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #foreign steam "SteamAPI_ISteamNetworkingSockets_ConnectP2PC {
    return SteamNetworkingSockets_ConnectP2PCustomSignaling(steam_networking_sockets, pSignaling, pPeerIdentity, nRemoteVirtualPort, nOptions, pOptions);
}


SteamNetworkingSockets_ReceivedP2PCustomSignal :: inline (pMsg: *void, cbMsg: s32, pContext: *ISteamNetworkingCustomSignalingRecvContext) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_ReceivedP {
    return SteamNetworkingSockets_ReceivedP2PCustomSignal(steam_networking_sockets, pMsg, cbMsg, pContext);
}


SteamNetworkingSockets_GetCertificateRequest :: inline (pcbBlob: *s32, pBlob: *void, errMsg: *SteamNetworkingErrMsg) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_GetCert {
    return SteamNetworkingSockets_GetCertificateRequest(steam_networking_sockets, pcbBlob, pBlob, errMsg);
}


SteamNetworkingSockets_SetCertificate :: inline (pCertificate: *void, cbCertificate: s32, errMsg: *SteamNetworkingErrMsg) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_ {
    return SteamNetworkingSockets_SetCertificate(steam_networking_sockets, pCertificate, cbCertificate, errMsg);
}


SteamNetworkingSockets_RunCallbacks :: inline () {
    SteamNetworkingSockets_RunCallbacks(steam_networking_sockets);
}
