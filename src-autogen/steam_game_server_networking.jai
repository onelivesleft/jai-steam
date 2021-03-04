steam_game_server_networking : *ISteamNetworking;
SteamGameServerNetworking : SteamGameServerNetworking_Namespace;


#scope_file


SteamGameServerNetworking_Namespace :: struct {
    // procs
    SendP2PPacket                                      :: SteamNetworking_SendP2PPacket;
    IsP2PPacketAvailable                               :: SteamNetworking_IsP2PPacketAvailable;
    ReadP2PPacket                                      :: SteamNetworking_ReadP2PPacket;
    AcceptP2PSessionWithUser                           :: SteamNetworking_AcceptP2PSessionWithUser;
    CloseP2PSessionWithUser                            :: SteamNetworking_CloseP2PSessionWithUser;
    CloseP2PChannelWithUser                            :: SteamNetworking_CloseP2PChannelWithUser;
    GetP2PSessionState                                 :: SteamNetworking_GetP2PSessionState;
    AllowP2PPacketRelay                                :: SteamNetworking_AllowP2PPacketRelay;
    CreateListenSocket                                 :: SteamNetworking_CreateListenSocket;
    CreateP2PConnectionSocket                          :: SteamNetworking_CreateP2PConnectionSocket;
    CreateConnectionSocket                             :: SteamNetworking_CreateConnectionSocket;
    DestroySocket                                      :: SteamNetworking_DestroySocket;
    DestroyListenSocket                                :: SteamNetworking_DestroyListenSocket;
    SendDataOnSocket                                   :: SteamNetworking_SendDataOnSocket;
    IsDataAvailableOnSocket                            :: SteamNetworking_IsDataAvailableOnSocket;
    RetrieveDataFromSocket                             :: SteamNetworking_RetrieveDataFromSocket;
    IsDataAvailable                                    :: SteamNetworking_IsDataAvailable;
    RetrieveData                                       :: SteamNetworking_RetrieveData;
    GetSocketInfo                                      :: SteamNetworking_GetSocketInfo;
    GetListenSocketInfo                                :: SteamNetworking_GetListenSocketInfo;
    GetSocketConnectionType                            :: SteamNetworking_GetSocketConnectionType;
    GetMaxPacketSize                                   :: SteamNetworking_GetMaxPacketSize;
}


SteamNetworking_SendP2PPacket :: inline (steamIDRemote: uint64_steamid, pubData: *void, cubData: uint32, eP2PSendType: EP2PSend, nChannel: s32) -> bool #foreign steam "SteamAPI_ISteamNetworking {
    return SteamNetworking_SendP2PPacket(steam_game_server_networking, steamIDRemote, pubData, cubData, eP2PSendType, nChannel);
}


SteamNetworking_IsP2PPacketAvailable :: inline (pcubMsgSize: *uint32, nChannel: s32) -> bool #foreign steam "SteamAPI_ISteamNetworking_IsP2PP {
    return SteamNetworking_IsP2PPacketAvailable(steam_game_server_networking, pcubMsgSize, nChannel);
}


SteamNetworking_ReadP2PPacket :: inline (pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, psteamIDRemote: *CSteamID, nChannel: s32) -> bool #foreign steam "SteamAPI_ISteamNetworking {
    return SteamNetworking_ReadP2PPacket(steam_game_server_networking, pubDest, cubDest, pcubMsgSize, psteamIDRemote, nChannel);
}


SteamNetworking_AcceptP2PSessionWithUser :: inline (steamIDRemote: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamNetworking_AcceptP2PS {
    return SteamNetworking_AcceptP2PSessionWithUser(steam_game_server_networking, steamIDRemote);
}


SteamNetworking_CloseP2PSessionWithUser :: inline (steamIDRemote: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamNetworking_CloseP2PS {
    return SteamNetworking_CloseP2PSessionWithUser(steam_game_server_networking, steamIDRemote);
}


SteamNetworking_CloseP2PChannelWithUser :: inline (steamIDRemote: uint64_steamid, nChannel: s32) -> bool #foreign steam "SteamAPI_ISteamNetworking_CloseP2PC {
    return SteamNetworking_CloseP2PChannelWithUser(steam_game_server_networking, steamIDRemote, nChannel);
}


SteamNetworking_GetP2PSessionState :: inline (steamIDRemote: uint64_steamid, pConnectionState: *P2PSessionState_t) -> bool #foreign steam "SteamAPI_ISteamNetworking_GetP {
    return SteamNetworking_GetP2PSessionState(steam_game_server_networking, steamIDRemote, pConnectionState);
}


SteamNetworking_AllowP2PPacketRelay :: inline (bAllow: bool) -> bool #foreign steam "SteamAPI_ISteamNetworking_Allow {
    return SteamNetworking_AllowP2PPacketRelay(steam_game_server_networking, bAllow);
}


SteamNetworking_CreateListenSocket :: inline (nVirtualP2PPort: s32, nIP: SteamIPAddress_t, nPort: uint16, bAllowUseOfPacketRelay: bool) -> SNetListenSocket_t #foreign steam "SteamAPI_ISteamNetworking_Crea {
    return SteamNetworking_CreateListenSocket(steam_game_server_networking, nVirtualP2PPort, nIP, nPort, bAllowUseOfPacketRelay);
}


SteamNetworking_CreateP2PConnectionSocket :: inline (steamIDTarget: uint64_steamid, nVirtualPort: s32, nTimeoutSec: s32, bAllowUseOfPacketRelay: bool) -> SNetSocket_t #foreign steam "SteamAPI_ISteamNetworking_CreateP2PCo {
    return SteamNetworking_CreateP2PConnectionSocket(steam_game_server_networking, steamIDTarget, nVirtualPort, nTimeoutSec, bAllowUseOfPacketRelay);
}


SteamNetworking_CreateConnectionSocket :: inline (nIP: SteamIPAddress_t, nPort: uint16, nTimeoutSec: s32) -> SNetSocket_t #foreign steam "SteamAPI_ISteamNetworking_CreateCo {
    return SteamNetworking_CreateConnectionSocket(steam_game_server_networking, nIP, nPort, nTimeoutSec);
}


SteamNetworking_DestroySocket :: inline (hSocket: SNetSocket_t, bNotifyRemoteEnd: bool) -> bool #foreign steam "SteamAPI_ISteamNetworking {
    return SteamNetworking_DestroySocket(steam_game_server_networking, hSocket, bNotifyRemoteEnd);
}


SteamNetworking_DestroyListenSocket :: inline (hSocket: SNetListenSocket_t, bNotifyRemoteEnd: bool) -> bool #foreign steam "SteamAPI_ISteamNetworking_Destr {
    return SteamNetworking_DestroyListenSocket(steam_game_server_networking, hSocket, bNotifyRemoteEnd);
}


SteamNetworking_SendDataOnSocket :: inline (hSocket: SNetSocket_t, pubData: *void, cubData: uint32, bReliable: bool) -> bool #foreign steam "SteamAPI_ISteamNetworking_Se {
    return SteamNetworking_SendDataOnSocket(steam_game_server_networking, hSocket, pubData, cubData, bReliable);
}


SteamNetworking_IsDataAvailableOnSocket :: inline (hSocket: SNetSocket_t, pcubMsgSize: *uint32) -> bool #foreign steam "SteamAPI_ISteamNetworking_IsDataAva {
    return SteamNetworking_IsDataAvailableOnSocket(steam_game_server_networking, hSocket, pcubMsgSize);
}


SteamNetworking_RetrieveDataFromSocket :: inline (hSocket: SNetSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32) -> bool #foreign steam "SteamAPI_ISteamNetworking_Retrieve {
    return SteamNetworking_RetrieveDataFromSocket(steam_game_server_networking, hSocket, pubDest, cubDest, pcubMsgSize);
}


SteamNetworking_IsDataAvailable :: inline (hListenSocket: SNetListenSocket_t, pcubMsgSize: *uint32, phSocket: *SNetSocket_t) -> bool #foreign steam "SteamAPI_ISteamNetworking_I {
    return SteamNetworking_IsDataAvailable(steam_game_server_networking, hListenSocket, pcubMsgSize, phSocket);
}


SteamNetworking_RetrieveData :: inline (hListenSocket: SNetListenSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, phSocket: *SNetSocket_t) -> bool #foreign steam "SteamAPI_ISteamNetworkin {
    return SteamNetworking_RetrieveData(steam_game_server_networking, hListenSocket, pubDest, cubDest, pcubMsgSize, phSocket);
}


SteamNetworking_GetSocketInfo :: inline (hSocket: SNetSocket_t, pSteamIDRemote: *CSteamID, peSocketStatus: *s32, punIPRemote: *SteamIPAddress_t, punPortRemote: *uint16) -> bool #foreign steam "SteamAPI_ISteamNetworking {
    return SteamNetworking_GetSocketInfo(steam_game_server_networking, hSocket, pSteamIDRemote, peSocketStatus, punIPRemote, punPortRemote);
}


SteamNetworking_GetListenSocketInfo :: inline (hListenSocket: SNetListenSocket_t, pnIP: *SteamIPAddress_t, pnPort: *uint16) -> bool #foreign steam "SteamAPI_ISteamNetworking_GetLi {
    return SteamNetworking_GetListenSocketInfo(steam_game_server_networking, hListenSocket, pnIP, pnPort);
}


SteamNetworking_GetSocketConnectionType :: inline (hSocket: SNetSocket_t) -> ESNetSocketConnectionType #foreign steam "SteamAPI_ISteamNetworking_GetSocket {
    return SteamNetworking_GetSocketConnectionType(steam_game_server_networking, hSocket);
}


SteamNetworking_GetMaxPacketSize :: inline (hSocket: SNetSocket_t) -> s32 #foreign steam "SteamAPI_ISteamNetworking_Ge {
    return SteamNetworking_GetMaxPacketSize(steam_game_server_networking, hSocket);
}
