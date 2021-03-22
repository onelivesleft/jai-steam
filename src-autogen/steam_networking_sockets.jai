steam_networking_sockets : *ISteamNetworkingSockets;


CreateListenSocketIP :: inline (localAddress: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket {
    return SteamAPI_ISteamNetworkingSockets_CreateListenSocketIP(steam_networking_sockets, localAddress, nOptions, pOptions);
}


ConnectByIPAddress :: inline (address: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectByIPAddress(steam_networking_sockets, address, nOptions, pOptions);
}


CreateListenSocketP2P :: inline (nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket {
    return SteamAPI_ISteamNetworkingSockets_CreateListenSocketP2P(steam_networking_sockets, nLocalVirtualPort, nOptions, pOptions);
}


ConnectP2P :: inline (identityRemote: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectP2P(steam_networking_sockets, identityRemote, nRemoteVirtualPort, nOptions, pOptions);
}


AcceptConnection :: inline (hConn: HSteamNetConnection) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_AcceptConnection(steam_networking_sockets, hConn);
}


CloseConnection :: inline (hPeer: HSteamNetConnection, nReason: s32, pszDebug: *char, bEnableLinger: bool) -> bool {
    return SteamAPI_ISteamNetworkingSockets_CloseConnection(steam_networking_sockets, hPeer, nReason, pszDebug, bEnableLinger);
}


CloseListenSocket :: inline (hSocket: HSteamListenSocket) -> bool {
    return SteamAPI_ISteamNetworkingSockets_CloseListenSocket(steam_networking_sockets, hSocket);
}


SetConnectionUserData :: inline (hPeer: HSteamNetConnection, nUserData: int64) -> bool {
    return SteamAPI_ISteamNetworkingSockets_SetConnectionUserData(steam_networking_sockets, hPeer, nUserData);
}


GetConnectionUserData :: inline (hPeer: HSteamNetConnection) -> int64 {
    return SteamAPI_ISteamNetworkingSockets_GetConnectionUserData(steam_networking_sockets, hPeer);
}


SetConnectionName :: inline (hPeer: HSteamNetConnection, pszName: *char) {
    SteamAPI_ISteamNetworkingSockets_SetConnectionName(steam_networking_sockets, hPeer, pszName);
}


GetConnectionName :: inline (hPeer: HSteamNetConnection, pszName: *char, nMaxLen: s32) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetConnectionName(steam_networking_sockets, hPeer, pszName, nMaxLen);
}


SendMessageToConnection :: inline (hConn: HSteamNetConnection, pData: *void, cbData: uint32, nSendFlags: s32, pOutMessageNumber: *int64) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_SendMessageToConnection(steam_networking_sockets, hConn, pData, cbData, nSendFlags, pOutMessageNumber);
}


SendMessages :: inline (nMessages: s32, pMessages: **SteamNetworkingMessage_t, pOutMessageNumberOrResult: *int64) {
    SteamAPI_ISteamNetworkingSockets_SendMessages(steam_networking_sockets, nMessages, pMessages, pOutMessageNumberOrResult);
}


FlushMessagesOnConnection :: inline (hConn: HSteamNetConnection) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_FlushMessagesOnConnection(steam_networking_sockets, hConn);
}


ReceiveMessagesOnConnection :: inline (hConn: HSteamNetConnection, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnConnection(steam_networking_sockets, hConn, ppOutMessages, nMaxMessages);
}


GetConnectionInfo :: inline (hConn: HSteamNetConnection, pInfo: *SteamNetConnectionInfo_t) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetConnectionInfo(steam_networking_sockets, hConn, pInfo);
}


GetQuickConnectionStatus :: inline (hConn: HSteamNetConnection, pStats: *SteamNetworkingQuickConnectionStatus) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetQuickConnectionStatus(steam_networking_sockets, hConn, pStats);
}


GetDetailedConnectionStatus :: inline (hConn: HSteamNetConnection, pszBuf: *char, cbBuf: s32) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_GetDetailedConnectionStatus(steam_networking_sockets, hConn, pszBuf, cbBuf);
}


GetListenSocketAddress :: inline (hSocket: HSteamListenSocket, address: *SteamNetworkingIPAddr) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetListenSocketAddress(steam_networking_sockets, hSocket, address);
}


CreateSocketPair :: inline (pOutConnection1: *HSteamNetConnection, pOutConnection2: *HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: *SteamNetworkingIdentity, pIdentity2: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingSockets_CreateSocketPair(steam_networking_sockets, pOutConnection1, pOutConnection2, bUseNetworkLoopback, pIdentity1, pIdentity2);
}


GetIdentity :: inline (pIdentity: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetIdentity(steam_networking_sockets, pIdentity);
}


InitAuthentication :: inline () -> ESteamNetworkingAvailability {
    return SteamAPI_ISteamNetworkingSockets_InitAuthentication(steam_networking_sockets);
}


GetAuthenticationStatus :: inline (pDetails: *SteamNetAuthenticationStatus_t) -> ESteamNetworkingAvailability {
    return SteamAPI_ISteamNetworkingSockets_GetAuthenticationStatus(steam_networking_sockets, pDetails);
}


CreatePollGroup :: inline () -> HSteamNetPollGroup {
    return SteamAPI_ISteamNetworkingSockets_CreatePollGroup(steam_networking_sockets);
}


DestroyPollGroup :: inline (hPollGroup: HSteamNetPollGroup) -> bool {
    return SteamAPI_ISteamNetworkingSockets_DestroyPollGroup(steam_networking_sockets, hPollGroup);
}


SetConnectionPollGroup :: inline (hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup) -> bool {
    return SteamAPI_ISteamNetworkingSockets_SetConnectionPollGroup(steam_networking_sockets, hConn, hPollGroup);
}


ReceiveMessagesOnPollGroup :: inline (hPollGroup: HSteamNetPollGroup, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnPollGroup(steam_networking_sockets, hPollGroup, ppOutMessages, nMaxMessages);
}


ReceivedRelayAuthTicket :: inline (pvTicket: *void, cbTicket: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> bool {
    return SteamAPI_ISteamNetworkingSockets_ReceivedRelayAuthTicket(steam_networking_sockets, pvTicket, cbTicket, pOutParsedTicket);
}


FindRelayAuthTicketForServer :: inline (identityGameServer: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_FindRelayAuthTicketForServer(steam_networking_sockets, identityGameServer, nRemoteVirtualPort, pOutParsedTicket);
}


ConnectToHostedDedicatedServer :: inline (identityTarget: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectToHostedDedicatedServer(steam_networking_sockets, identityTarget, nRemoteVirtualPort, nOptions, pOptions);
}


GetHostedDedicatedServerPort :: inline () -> uint16 {
    return SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPort(steam_networking_sockets);
}


GetHostedDedicatedServerPOPID :: inline () -> SteamNetworkingPOPID {
    return SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPOPID(steam_networking_sockets);
}


GetHostedDedicatedServerAddress :: inline (pRouting: *SteamDatagramHostedAddress) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerAddress(steam_networking_sockets, pRouting);
}


CreateHostedDedicatedServerListenSocket :: inline (nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket {
    return SteamAPI_ISteamNetworkingSockets_CreateHostedDedicatedServerListenSocket(steam_networking_sockets, nLocalVirtualPort, nOptions, pOptions);
}


GetGameCoordinatorServerLogin :: inline (pLoginInfo: *SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: *s32, pBlob: *void) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_GetGameCoordinatorServerLogin(steam_networking_sockets, pLoginInfo, pcbSignedBlob, pBlob);
}


ConnectP2PCustomSignaling :: inline (pSignaling: *ISteamNetworkingConnectionSignaling, pPeerIdentity: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectP2PCustomSignaling(steam_networking_sockets, pSignaling, pPeerIdentity, nRemoteVirtualPort, nOptions, pOptions);
}


ReceivedP2PCustomSignal :: inline (pMsg: *void, cbMsg: s32, pContext: *ISteamNetworkingSignalingRecvContext) -> bool {
    return SteamAPI_ISteamNetworkingSockets_ReceivedP2PCustomSignal(steam_networking_sockets, pMsg, cbMsg, pContext);
}


GetCertificateRequest :: inline (pcbBlob: *s32, pBlob: *void, errMsg: *SteamNetworkingErrMsg) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetCertificateRequest(steam_networking_sockets, pcbBlob, pBlob, errMsg);
}


SetCertificate :: inline (pCertificate: *void, cbCertificate: s32, errMsg: *SteamNetworkingErrMsg) -> bool {
    return SteamAPI_ISteamNetworkingSockets_SetCertificate(steam_networking_sockets, pCertificate, cbCertificate, errMsg);
}
