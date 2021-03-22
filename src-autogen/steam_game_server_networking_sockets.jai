steam_game_server_networking_sockets : *ISteamNetworkingSockets;


ServerCreateListenSocketIP :: inline (localAddress: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket {
    return SteamAPI_ISteamNetworkingSockets_CreateListenSocketIP(steam_game_server_networking_sockets, localAddress, nOptions, pOptions);
}


ServerConnectByIPAddress :: inline (address: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectByIPAddress(steam_game_server_networking_sockets, address, nOptions, pOptions);
}


ServerCreateListenSocketP2P :: inline (nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket {
    return SteamAPI_ISteamNetworkingSockets_CreateListenSocketP2P(steam_game_server_networking_sockets, nLocalVirtualPort, nOptions, pOptions);
}


ServerConnectP2P :: inline (identityRemote: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectP2P(steam_game_server_networking_sockets, identityRemote, nRemoteVirtualPort, nOptions, pOptions);
}


ServerAcceptConnection :: inline (hConn: HSteamNetConnection) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_AcceptConnection(steam_game_server_networking_sockets, hConn);
}


ServerCloseConnection :: inline (hPeer: HSteamNetConnection, nReason: s32, pszDebug: *char, bEnableLinger: bool) -> bool {
    return SteamAPI_ISteamNetworkingSockets_CloseConnection(steam_game_server_networking_sockets, hPeer, nReason, pszDebug, bEnableLinger);
}


ServerCloseListenSocket :: inline (hSocket: HSteamListenSocket) -> bool {
    return SteamAPI_ISteamNetworkingSockets_CloseListenSocket(steam_game_server_networking_sockets, hSocket);
}


ServerSetConnectionUserData :: inline (hPeer: HSteamNetConnection, nUserData: int64) -> bool {
    return SteamAPI_ISteamNetworkingSockets_SetConnectionUserData(steam_game_server_networking_sockets, hPeer, nUserData);
}


ServerGetConnectionUserData :: inline (hPeer: HSteamNetConnection) -> int64 {
    return SteamAPI_ISteamNetworkingSockets_GetConnectionUserData(steam_game_server_networking_sockets, hPeer);
}


ServerSetConnectionName :: inline (hPeer: HSteamNetConnection, pszName: *char) {
    SteamAPI_ISteamNetworkingSockets_SetConnectionName(steam_game_server_networking_sockets, hPeer, pszName);
}


ServerGetConnectionName :: inline (hPeer: HSteamNetConnection, pszName: *char, nMaxLen: s32) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetConnectionName(steam_game_server_networking_sockets, hPeer, pszName, nMaxLen);
}


ServerSendMessageToConnection :: inline (hConn: HSteamNetConnection, pData: *void, cbData: uint32, nSendFlags: s32, pOutMessageNumber: *int64) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_SendMessageToConnection(steam_game_server_networking_sockets, hConn, pData, cbData, nSendFlags, pOutMessageNumber);
}


ServerSendMessages :: inline (nMessages: s32, pMessages: **SteamNetworkingMessage_t, pOutMessageNumberOrResult: *int64) {
    SteamAPI_ISteamNetworkingSockets_SendMessages(steam_game_server_networking_sockets, nMessages, pMessages, pOutMessageNumberOrResult);
}


ServerFlushMessagesOnConnection :: inline (hConn: HSteamNetConnection) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_FlushMessagesOnConnection(steam_game_server_networking_sockets, hConn);
}


ServerReceiveMessagesOnConnection :: inline (hConn: HSteamNetConnection, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnConnection(steam_game_server_networking_sockets, hConn, ppOutMessages, nMaxMessages);
}


ServerGetConnectionInfo :: inline (hConn: HSteamNetConnection, pInfo: *SteamNetConnectionInfo_t) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetConnectionInfo(steam_game_server_networking_sockets, hConn, pInfo);
}


ServerGetQuickConnectionStatus :: inline (hConn: HSteamNetConnection, pStats: *SteamNetworkingQuickConnectionStatus) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetQuickConnectionStatus(steam_game_server_networking_sockets, hConn, pStats);
}


ServerGetDetailedConnectionStatus :: inline (hConn: HSteamNetConnection, pszBuf: *char, cbBuf: s32) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_GetDetailedConnectionStatus(steam_game_server_networking_sockets, hConn, pszBuf, cbBuf);
}


ServerGetListenSocketAddress :: inline (hSocket: HSteamListenSocket, address: *SteamNetworkingIPAddr) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetListenSocketAddress(steam_game_server_networking_sockets, hSocket, address);
}


ServerCreateSocketPair :: inline (pOutConnection1: *HSteamNetConnection, pOutConnection2: *HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: *SteamNetworkingIdentity, pIdentity2: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingSockets_CreateSocketPair(steam_game_server_networking_sockets, pOutConnection1, pOutConnection2, bUseNetworkLoopback, pIdentity1, pIdentity2);
}


ServerGetIdentity :: inline (pIdentity: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetIdentity(steam_game_server_networking_sockets, pIdentity);
}


ServerInitAuthentication :: inline () -> ESteamNetworkingAvailability {
    return SteamAPI_ISteamNetworkingSockets_InitAuthentication(steam_game_server_networking_sockets);
}


ServerGetAuthenticationStatus :: inline (pDetails: *SteamNetAuthenticationStatus_t) -> ESteamNetworkingAvailability {
    return SteamAPI_ISteamNetworkingSockets_GetAuthenticationStatus(steam_game_server_networking_sockets, pDetails);
}


ServerCreatePollGroup :: inline () -> HSteamNetPollGroup {
    return SteamAPI_ISteamNetworkingSockets_CreatePollGroup(steam_game_server_networking_sockets);
}


ServerDestroyPollGroup :: inline (hPollGroup: HSteamNetPollGroup) -> bool {
    return SteamAPI_ISteamNetworkingSockets_DestroyPollGroup(steam_game_server_networking_sockets, hPollGroup);
}


ServerSetConnectionPollGroup :: inline (hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup) -> bool {
    return SteamAPI_ISteamNetworkingSockets_SetConnectionPollGroup(steam_game_server_networking_sockets, hConn, hPollGroup);
}


ServerReceiveMessagesOnPollGroup :: inline (hPollGroup: HSteamNetPollGroup, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnPollGroup(steam_game_server_networking_sockets, hPollGroup, ppOutMessages, nMaxMessages);
}


ServerReceivedRelayAuthTicket :: inline (pvTicket: *void, cbTicket: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> bool {
    return SteamAPI_ISteamNetworkingSockets_ReceivedRelayAuthTicket(steam_game_server_networking_sockets, pvTicket, cbTicket, pOutParsedTicket);
}


ServerFindRelayAuthTicketForServer :: inline (identityGameServer: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> s32 {
    return SteamAPI_ISteamNetworkingSockets_FindRelayAuthTicketForServer(steam_game_server_networking_sockets, identityGameServer, nRemoteVirtualPort, pOutParsedTicket);
}


ServerConnectToHostedDedicatedServer :: inline (identityTarget: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectToHostedDedicatedServer(steam_game_server_networking_sockets, identityTarget, nRemoteVirtualPort, nOptions, pOptions);
}


ServerGetHostedDedicatedServerPort :: inline () -> uint16 {
    return SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPort(steam_game_server_networking_sockets);
}


ServerGetHostedDedicatedServerPOPID :: inline () -> SteamNetworkingPOPID {
    return SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPOPID(steam_game_server_networking_sockets);
}


ServerGetHostedDedicatedServerAddress :: inline (pRouting: *SteamDatagramHostedAddress) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerAddress(steam_game_server_networking_sockets, pRouting);
}


ServerCreateHostedDedicatedServerListenSocket :: inline (nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket {
    return SteamAPI_ISteamNetworkingSockets_CreateHostedDedicatedServerListenSocket(steam_game_server_networking_sockets, nLocalVirtualPort, nOptions, pOptions);
}


ServerGetGameCoordinatorServerLogin :: inline (pLoginInfo: *SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: *s32, pBlob: *void) -> EResult {
    return SteamAPI_ISteamNetworkingSockets_GetGameCoordinatorServerLogin(steam_game_server_networking_sockets, pLoginInfo, pcbSignedBlob, pBlob);
}


ServerConnectP2PCustomSignaling :: inline (pSignaling: *ISteamNetworkingConnectionSignaling, pPeerIdentity: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection {
    return SteamAPI_ISteamNetworkingSockets_ConnectP2PCustomSignaling(steam_game_server_networking_sockets, pSignaling, pPeerIdentity, nRemoteVirtualPort, nOptions, pOptions);
}


ServerReceivedP2PCustomSignal :: inline (pMsg: *void, cbMsg: s32, pContext: *ISteamNetworkingSignalingRecvContext) -> bool {
    return SteamAPI_ISteamNetworkingSockets_ReceivedP2PCustomSignal(steam_game_server_networking_sockets, pMsg, cbMsg, pContext);
}


ServerGetCertificateRequest :: inline (pcbBlob: *s32, pBlob: *void, errMsg: *SteamNetworkingErrMsg) -> bool {
    return SteamAPI_ISteamNetworkingSockets_GetCertificateRequest(steam_game_server_networking_sockets, pcbBlob, pBlob, errMsg);
}


ServerSetCertificate :: inline (pCertificate: *void, cbCertificate: s32, errMsg: *SteamNetworkingErrMsg) -> bool {
    return SteamAPI_ISteamNetworkingSockets_SetCertificate(steam_game_server_networking_sockets, pCertificate, cbCertificate, errMsg);
}
