steam_game_server_networking : *ISteamNetworking;


ServerSendP2PPacket :: inline (steamIDRemote: uint64_steamid, pubData: *void, cubData: uint32, eP2PSendType: EP2PSend, nChannel: s32) -> bool {
    return SteamAPI_ISteamNetworking_SendP2PPacket(steam_game_server_networking, steamIDRemote, pubData, cubData, eP2PSendType, nChannel);
}


ServerIsP2PPacketAvailable :: inline (pcubMsgSize: *uint32, nChannel: s32) -> bool {
    return SteamAPI_ISteamNetworking_IsP2PPacketAvailable(steam_game_server_networking, pcubMsgSize, nChannel);
}


ServerReadP2PPacket :: inline (pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, psteamIDRemote: *CSteamID, nChannel: s32) -> bool {
    return SteamAPI_ISteamNetworking_ReadP2PPacket(steam_game_server_networking, pubDest, cubDest, pcubMsgSize, psteamIDRemote, nChannel);
}


ServerAcceptP2PSessionWithUser :: inline (steamIDRemote: uint64_steamid) -> bool {
    return SteamAPI_ISteamNetworking_AcceptP2PSessionWithUser(steam_game_server_networking, steamIDRemote);
}


ServerCloseP2PSessionWithUser :: inline (steamIDRemote: uint64_steamid) -> bool {
    return SteamAPI_ISteamNetworking_CloseP2PSessionWithUser(steam_game_server_networking, steamIDRemote);
}


ServerCloseP2PChannelWithUser :: inline (steamIDRemote: uint64_steamid, nChannel: s32) -> bool {
    return SteamAPI_ISteamNetworking_CloseP2PChannelWithUser(steam_game_server_networking, steamIDRemote, nChannel);
}


ServerGetP2PSessionState :: inline (steamIDRemote: uint64_steamid, pConnectionState: *P2PSessionState_t) -> bool {
    return SteamAPI_ISteamNetworking_GetP2PSessionState(steam_game_server_networking, steamIDRemote, pConnectionState);
}


ServerAllowP2PPacketRelay :: inline (bAllow: bool) -> bool {
    return SteamAPI_ISteamNetworking_AllowP2PPacketRelay(steam_game_server_networking, bAllow);
}


ServerCreateListenSocket :: inline (nVirtualP2PPort: s32, nIP: SteamIPAddress_t, nPort: uint16, bAllowUseOfPacketRelay: bool) -> SNetListenSocket_t {
    return SteamAPI_ISteamNetworking_CreateListenSocket(steam_game_server_networking, nVirtualP2PPort, nIP, nPort, bAllowUseOfPacketRelay);
}


ServerCreateP2PConnectionSocket :: inline (steamIDTarget: uint64_steamid, nVirtualPort: s32, nTimeoutSec: s32, bAllowUseOfPacketRelay: bool) -> SNetSocket_t {
    return SteamAPI_ISteamNetworking_CreateP2PConnectionSocket(steam_game_server_networking, steamIDTarget, nVirtualPort, nTimeoutSec, bAllowUseOfPacketRelay);
}


ServerCreateConnectionSocket :: inline (nIP: SteamIPAddress_t, nPort: uint16, nTimeoutSec: s32) -> SNetSocket_t {
    return SteamAPI_ISteamNetworking_CreateConnectionSocket(steam_game_server_networking, nIP, nPort, nTimeoutSec);
}


ServerDestroySocket :: inline (hSocket: SNetSocket_t, bNotifyRemoteEnd: bool) -> bool {
    return SteamAPI_ISteamNetworking_DestroySocket(steam_game_server_networking, hSocket, bNotifyRemoteEnd);
}


ServerDestroyListenSocket :: inline (hSocket: SNetListenSocket_t, bNotifyRemoteEnd: bool) -> bool {
    return SteamAPI_ISteamNetworking_DestroyListenSocket(steam_game_server_networking, hSocket, bNotifyRemoteEnd);
}


ServerSendDataOnSocket :: inline (hSocket: SNetSocket_t, pubData: *void, cubData: uint32, bReliable: bool) -> bool {
    return SteamAPI_ISteamNetworking_SendDataOnSocket(steam_game_server_networking, hSocket, pubData, cubData, bReliable);
}


ServerIsDataAvailableOnSocket :: inline (hSocket: SNetSocket_t, pcubMsgSize: *uint32) -> bool {
    return SteamAPI_ISteamNetworking_IsDataAvailableOnSocket(steam_game_server_networking, hSocket, pcubMsgSize);
}


ServerRetrieveDataFromSocket :: inline (hSocket: SNetSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32) -> bool {
    return SteamAPI_ISteamNetworking_RetrieveDataFromSocket(steam_game_server_networking, hSocket, pubDest, cubDest, pcubMsgSize);
}


ServerIsDataAvailable :: inline (hListenSocket: SNetListenSocket_t, pcubMsgSize: *uint32, phSocket: *SNetSocket_t) -> bool {
    return SteamAPI_ISteamNetworking_IsDataAvailable(steam_game_server_networking, hListenSocket, pcubMsgSize, phSocket);
}


ServerRetrieveData :: inline (hListenSocket: SNetListenSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, phSocket: *SNetSocket_t) -> bool {
    return SteamAPI_ISteamNetworking_RetrieveData(steam_game_server_networking, hListenSocket, pubDest, cubDest, pcubMsgSize, phSocket);
}


ServerGetSocketInfo :: inline (hSocket: SNetSocket_t, pSteamIDRemote: *CSteamID, peSocketStatus: *s32, punIPRemote: *SteamIPAddress_t, punPortRemote: *uint16) -> bool {
    return SteamAPI_ISteamNetworking_GetSocketInfo(steam_game_server_networking, hSocket, pSteamIDRemote, peSocketStatus, punIPRemote, punPortRemote);
}


ServerGetListenSocketInfo :: inline (hListenSocket: SNetListenSocket_t, pnIP: *SteamIPAddress_t, pnPort: *uint16) -> bool {
    return SteamAPI_ISteamNetworking_GetListenSocketInfo(steam_game_server_networking, hListenSocket, pnIP, pnPort);
}


ServerGetSocketConnectionType :: inline (hSocket: SNetSocket_t) -> ESNetSocketConnectionType {
    return SteamAPI_ISteamNetworking_GetSocketConnectionType(steam_game_server_networking, hSocket);
}


ServerGetMaxPacketSize :: inline (hSocket: SNetSocket_t) -> s32 {
    return SteamAPI_ISteamNetworking_GetMaxPacketSize(steam_game_server_networking, hSocket);
}
