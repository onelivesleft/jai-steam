steam_networking_sockets : *ISteamNetworkingSockets;

SteamNetworkingSockets : SteamNetworkingSockets_Namespace;


#scope_file


SteamNetworkingSockets_Namespace :: struct {
    // procs
               :: SteamNetworkingSockets_CreateListenSocketIP
                 :: SteamNetworkingSockets_ConnectByIPAddress
              :: SteamNetworkingSockets_CreateListenSocketP2P
                         :: SteamNetworkingSockets_ConnectP2P
                   :: SteamNetworkingSockets_AcceptConnection
                    :: SteamNetworkingSockets_CloseConnection
                  :: SteamNetworkingSockets_CloseListenSocket
              :: SteamNetworkingSockets_SetConnectionUserData
              :: SteamNetworkingSockets_GetConnectionUserData
                  :: SteamNetworkingSockets_SetConnectionName
                  :: SteamNetworkingSockets_GetConnectionName
            :: SteamNetworkingSockets_SendMessageToConnection
                       :: SteamNetworkingSockets_SendMessages
          :: SteamNetworkingSockets_FlushMessagesOnConnection
        :: SteamNetworkingSockets_ReceiveMessagesOnConnection
                  :: SteamNetworkingSockets_GetConnectionInfo
           :: SteamNetworkingSockets_GetQuickConnectionStatus
        :: SteamNetworkingSockets_GetDetailedConnectionStatus
             :: SteamNetworkingSockets_GetListenSocketAddress
                   :: SteamNetworkingSockets_CreateSocketPair
                        :: SteamNetworkingSockets_GetIdentity
                 :: SteamNetworkingSockets_InitAuthentication
            :: SteamNetworkingSockets_GetAuthenticationStatus
                    :: SteamNetworkingSockets_CreatePollGroup
                   :: SteamNetworkingSockets_DestroyPollGroup
             :: SteamNetworkingSockets_SetConnectionPollGroup
         :: SteamNetworkingSockets_ReceiveMessagesOnPollGroup
            :: SteamNetworkingSockets_ReceivedRelayAuthTicket
       :: SteamNetworkingSockets_FindRelayAuthTicketForServer
     :: SteamNetworkingSockets_ConnectToHostedDedicatedServer
       :: SteamNetworkingSockets_GetHostedDedicatedServerPort
      :: SteamNetworkingSockets_GetHostedDedicatedServerPOPID
    :: SteamNetworkingSockets_GetHostedDedicatedServerAddress
    :: SteamNetworkingSockets_CreateHostedDedicatedServerListenSocket
      :: SteamNetworkingSockets_GetGameCoordinatorServerLogin
          :: SteamNetworkingSockets_ConnectP2PCustomSignaling
            :: SteamNetworkingSockets_ReceivedP2PCustomSignal
              :: SteamNetworkingSockets_GetCertificateRequest
                     :: SteamNetworkingSockets_SetCertificate
                       :: SteamNetworkingSockets_RunCallbacks
}


SteamNetworkingSockets_CreateListenSocketIP :: inline (localAddress: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket {
    return SteamAPI_ISteamNetworkingSockets_CreateListenSocketIP(steam_networking_sockets, localAddress: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t);
}


SteamNetworkingSockets_ConnectByIPAddress :: inline (address: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectByIPAddress(steam_networking_sockets, address: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t);
}


SteamNetworkingSockets_CreateListenSocketP2P :: inline (nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket {
    return SteamAPI_ISteamNetworkingSockets_CreateListenSocketP2P(steam_networking_sockets, nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t);
}


SteamNetworkingSockets_ConnectP2P :: inline (identityRemote: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectP2P(steam_networking_sockets, identityRemote: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t);
}


SteamNetworkingSockets_AcceptConnection :: inline (hConn: HSteamNetConnection) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_AcceptConnection(steam_networking_sockets, hConn: HSteamNetConnection);
}


SteamNetworkingSockets_CloseConnection :: inline (hPeer: HSteamNetConnection, nReason: s32, pszDebug: *char, bEnableLinger: bool) -> bool {
    return SteamAPI_ISteamNetworkingSockets_CloseConnection(steam_networking_sockets, hPeer: HSteamNetConnection, nReason: s32, pszDebug: *char, bEnableLinger: bool);
}


SteamNetworkingSockets_CloseListenSocket :: inline (hSocket: HSteamListenSocket) -> bool {
    return SteamAPI_ISteamNetworkingSockets_CloseListenSocket(steam_networking_sockets, hSocket: HSteamListenSocket);
}


SteamNetworkingSockets_SetConnectionUserData :: inline (hPeer: HSteamNetConnection, nUserData: int64) -> bool {
    return SteamAPI_ISteamNetworkingSockets_SetConnectionUserData(steam_networking_sockets, hPeer: HSteamNetConnection, nUserData: int64);
}


SteamNetworkingSockets_GetConnectionUserData :: inline (hPeer: HSteamNetConnection) -> int64 {
    return SteamAPI_ISteamNetworkingSockets_GetConnectionUserData(steam_networking_sockets, hPeer: HSteamNetConnection);
}


SteamNetworkingSockets_SetConnectionName :: inline (hPeer: HSteamNetConnection, pszName: *char) {
    SteamAPI_ISteamNetworkingSockets_SetConnectionName(steam_networking_sockets, hPeer: HSteamNetConnection, pszName: *char);
}


SteamNetworkingSockets_GetConnectionName :: inline (hPeer: HSteamNetConnection, pszName: *char, nMaxLen: s32) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetConnectionName(steam_networking_sockets, hPeer: HSteamNetConnection, pszName: *char, nMaxLen: s32);
}


SteamNetworkingSockets_SendMessageToConnection :: inline (hConn: HSteamNetConnection, pData: *void, cbData: uint32, nSendFlags: s32, pOutMessageNumber: *int64) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_SendMessageToConnection(steam_networking_sockets, hConn: HSteamNetConnection, pData: *void, cbData: uint32, nSendFlags: s32, pOutMessageNumber: *int64);
}


SteamNetworkingSockets_SendMessages :: inline (nMessages: s32, pMessages: **SteamNetworkingMessage_t, pOutMessageNumberOrResult: *int64) {
    SteamAPI_ISteamNetworkingSockets_SendMessages(steam_networking_sockets, nMessages: s32, pMessages: **SteamNetworkingMessage_t, pOutMessageNumberOrResult: *int64);
}


SteamNetworkingSockets_FlushMessagesOnConnection :: inline (hConn: HSteamNetConnection) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_FlushMessagesOnConnection(steam_networking_sockets, hConn: HSteamNetConnection);
}


SteamNetworkingSockets_ReceiveMessagesOnConnection :: inline (hConn: HSteamNetConnection, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnConnection(steam_networking_sockets, hConn: HSteamNetConnection, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32);
}


SteamNetworkingSockets_GetConnectionInfo :: inline (hConn: HSteamNetConnection, pInfo: *SteamNetConnectionInfo_t) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetConnectionInfo(steam_networking_sockets, hConn: HSteamNetConnection, pInfo: *SteamNetConnectionInfo_t);
}


SteamNetworkingSockets_GetQuickConnectionStatus :: inline (hConn: HSteamNetConnection, pStats: *SteamNetworkingQuickConnectionStatus) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetQuickConnectionStatus(steam_networking_sockets, hConn: HSteamNetConnection, pStats: *SteamNetworkingQuickConnectionStatus);
}


SteamNetworkingSockets_GetDetailedConnectionStatus :: inline (hConn: HSteamNetConnection, pszBuf: *char, cbBuf: s32) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_GetDetailedConnectionStatus(steam_networking_sockets, hConn: HSteamNetConnection, pszBuf: *char, cbBuf: s32);
}


SteamNetworkingSockets_GetListenSocketAddress :: inline (hSocket: HSteamListenSocket, address: *SteamNetworkingIPAddr) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetListenSocketAddress(steam_networking_sockets, hSocket: HSteamListenSocket, address: *SteamNetworkingIPAddr);
}


SteamNetworkingSockets_CreateSocketPair :: inline (pOutConnection1: *HSteamNetConnection, pOutConnection2: *HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: *SteamNetworkingIdentity, pIdentity2: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingSockets_CreateSocketPair(steam_networking_sockets, pOutConnection1: *HSteamNetConnection, pOutConnection2: *HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: *SteamNetworkingIdentity, pIdentity2: *SteamNetworkingIdentity);
}


SteamNetworkingSockets_GetIdentity :: inline (pIdentity: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetIdentity(steam_networking_sockets, pIdentity: *SteamNetworkingIdentity);
}


SteamNetworkingSockets_InitAuthentication :: inline () -> ESteamNetworkingAvailability {
    return SteamAPI_ISteamNetworkingSockets_InitAuthentication(steam_networking_sockets);
}


SteamNetworkingSockets_GetAuthenticationStatus :: inline (pDetails: *SteamNetAuthenticationStatus_t) -> ESteamNetworkingAvailability {
    return SteamAPI_ISteamNetworkingSockets_GetAuthenticationStatus(steam_networking_sockets, pDetails: *SteamNetAuthenticationStatus_t);
}


SteamNetworkingSockets_CreatePollGroup :: inline () -> HSteamNetPollGroup {
    return SteamAPI_ISteamNetworkingSockets_CreatePollGroup(steam_networking_sockets);
}


SteamNetworkingSockets_DestroyPollGroup :: inline (hPollGroup: HSteamNetPollGroup) -> bool {
    return SteamAPI_ISteamNetworkingSockets_DestroyPollGroup(steam_networking_sockets, hPollGroup: HSteamNetPollGroup);
}


SteamNetworkingSockets_SetConnectionPollGroup :: inline (hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup) -> bool {
    return SteamAPI_ISteamNetworkingSockets_SetConnectionPollGroup(steam_networking_sockets, hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup);
}


SteamNetworkingSockets_ReceiveMessagesOnPollGroup :: inline (hPollGroup: HSteamNetPollGroup, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnPollGroup(steam_networking_sockets, hPollGroup: HSteamNetPollGroup, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32);
}


SteamNetworkingSockets_ReceivedRelayAuthTicket :: inline (pvTicket: *void, cbTicket: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> bool {
    return SteamAPI_ISteamNetworkingSockets_ReceivedRelayAuthTicket(steam_networking_sockets, pvTicket: *void, cbTicket: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket);
}


SteamNetworkingSockets_FindRelayAuthTicketForServer :: inline (identityGameServer: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_FindRelayAuthTicketForServer(steam_networking_sockets, identityGameServer: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket);
}


SteamNetworkingSockets_ConnectToHostedDedicatedServer :: inline (identityTarget: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectToHostedDedicatedServer(steam_networking_sockets, identityTarget: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t);
}


SteamNetworkingSockets_GetHostedDedicatedServerPort :: inline () -> uint16 {
    return SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPort(steam_networking_sockets);
}


SteamNetworkingSockets_GetHostedDedicatedServerPOPID :: inline () -> SteamNetworkingPOPID {
    return SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPOPID(steam_networking_sockets);
}


SteamNetworkingSockets_GetHostedDedicatedServerAddress :: inline (pRouting: *SteamDatagramHostedAddress) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerAddress(steam_networking_sockets, pRouting: *SteamDatagramHostedAddress);
}


SteamNetworkingSockets_CreateHostedDedicatedServerListenSocket :: inline (nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket {
    return SteamAPI_ISteamNetworkingSockets_CreateHostedDedicatedServerListenSocket(steam_networking_sockets, nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t);
}


SteamNetworkingSockets_GetGameCoordinatorServerLogin :: inline (pLoginInfo: *SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: *s32, pBlob: *void) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_GetGameCoordinatorServerLogin(steam_networking_sockets, pLoginInfo: *SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: *s32, pBlob: *void);
}


SteamNetworkingSockets_ConnectP2PCustomSignaling :: inline (pSignaling: *ISteamNetworkingConnectionCustomSignaling, pPeerIdentity: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectP2PCustomSignaling(steam_networking_sockets, pSignaling: *ISteamNetworkingConnectionCustomSignaling, pPeerIdentity: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t);
}


SteamNetworkingSockets_ReceivedP2PCustomSignal :: inline (pMsg: *void, cbMsg: s32, pContext: *ISteamNetworkingCustomSignalingRecvContext) -> bool {
    return SteamAPI_ISteamNetworkingSockets_ReceivedP2PCustomSignal(steam_networking_sockets, pMsg: *void, cbMsg: s32, pContext: *ISteamNetworkingCustomSignalingRecvContext);
}


SteamNetworkingSockets_GetCertificateRequest :: inline (pcbBlob: *s32, pBlob: *void, errMsg: *SteamNetworkingErrMsg) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetCertificateRequest(steam_networking_sockets, pcbBlob: *s32, pBlob: *void, errMsg: *SteamNetworkingErrMsg);
}


SteamNetworkingSockets_SetCertificate :: inline (pCertificate: *void, cbCertificate: s32, errMsg: *SteamNetworkingErrMsg) -> bool {
    return SteamAPI_ISteamNetworkingSockets_SetCertificate(steam_networking_sockets, pCertificate: *void, cbCertificate: s32, errMsg: *SteamNetworkingErrMsg);
}


SteamNetworkingSockets_RunCallbacks :: inline () {
    SteamAPI_ISteamNetworkingSockets_RunCallbacks(steam_networking_sockets);
}
