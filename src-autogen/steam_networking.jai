steam_networking : *ISteamNetworking;

SteamNetworking : SteamNetworking_Namespace;


#scope_file


SteamNetworking_Namespace :: struct {
    // procs
                      :: SteamNetworking_SendP2PPacket
               :: SteamNetworking_IsP2PPacketAvailable
                      :: SteamNetworking_ReadP2PPacket
           :: SteamNetworking_AcceptP2PSessionWithUser
            :: SteamNetworking_CloseP2PSessionWithUser
            :: SteamNetworking_CloseP2PChannelWithUser
                 :: SteamNetworking_GetP2PSessionState
                :: SteamNetworking_AllowP2PPacketRelay
                 :: SteamNetworking_CreateListenSocket
          :: SteamNetworking_CreateP2PConnectionSocket
             :: SteamNetworking_CreateConnectionSocket
                      :: SteamNetworking_DestroySocket
                :: SteamNetworking_DestroyListenSocket
                   :: SteamNetworking_SendDataOnSocket
            :: SteamNetworking_IsDataAvailableOnSocket
             :: SteamNetworking_RetrieveDataFromSocket
                    :: SteamNetworking_IsDataAvailable
                       :: SteamNetworking_RetrieveData
                      :: SteamNetworking_GetSocketInfo
                :: SteamNetworking_GetListenSocketInfo
            :: SteamNetworking_GetSocketConnectionType
                   :: SteamNetworking_GetMaxPacketSize
}


SteamNetworking_SendP2PPacket :: inline (steamIDRemote: uint64_steamid, pubData: *void, cubData: uint32, eP2PSendType: EP2PSend, nChannel: s32) -> bool {
    return SteamAPI_ISteamNetworking_SendP2PPacket(steam_networking, steamIDRemote: uint64_steamid, pubData: *void, cubData: uint32, eP2PSendType: EP2PSend, nChannel: s32);
}


SteamNetworking_IsP2PPacketAvailable :: inline (pcubMsgSize: *uint32, nChannel: s32) -> bool {
    return SteamAPI_ISteamNetworking_IsP2PPacketAvailable(steam_networking, pcubMsgSize: *uint32, nChannel: s32);
}


SteamNetworking_ReadP2PPacket :: inline (pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, psteamIDRemote: *CSteamID, nChannel: s32) -> bool {
    return SteamAPI_ISteamNetworking_ReadP2PPacket(steam_networking, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, psteamIDRemote: *CSteamID, nChannel: s32);
}


SteamNetworking_AcceptP2PSessionWithUser :: inline (steamIDRemote: uint64_steamid) -> bool {
    return SteamAPI_ISteamNetworking_AcceptP2PSessionWithUser(steam_networking, steamIDRemote: uint64_steamid);
}


SteamNetworking_CloseP2PSessionWithUser :: inline (steamIDRemote: uint64_steamid) -> bool {
    return SteamAPI_ISteamNetworking_CloseP2PSessionWithUser(steam_networking, steamIDRemote: uint64_steamid);
}


SteamNetworking_CloseP2PChannelWithUser :: inline (steamIDRemote: uint64_steamid, nChannel: s32) -> bool {
    return SteamAPI_ISteamNetworking_CloseP2PChannelWithUser(steam_networking, steamIDRemote: uint64_steamid, nChannel: s32);
}


SteamNetworking_GetP2PSessionState :: inline (steamIDRemote: uint64_steamid, pConnectionState: *P2PSessionState_t) -> bool {
    return SteamAPI_ISteamNetworking_GetP2PSessionState(steam_networking, steamIDRemote: uint64_steamid, pConnectionState: *P2PSessionState_t);
}


SteamNetworking_AllowP2PPacketRelay :: inline (bAllow: bool) -> bool {
    return SteamAPI_ISteamNetworking_AllowP2PPacketRelay(steam_networking, bAllow: bool);
}


SteamNetworking_CreateListenSocket :: inline (nVirtualP2PPort: s32, nIP: SteamIPAddress_t, nPort: uint16, bAllowUseOfPacketRelay: bool) -> SNetListenSocket_t {
    return SteamAPI_ISteamNetworking_CreateListenSocket(steam_networking, nVirtualP2PPort: s32, nIP: SteamIPAddress_t, nPort: uint16, bAllowUseOfPacketRelay: bool);
}


SteamNetworking_CreateP2PConnectionSocket :: inline (steamIDTarget: uint64_steamid, nVirtualPort: s32, nTimeoutSec: s32, bAllowUseOfPacketRelay: bool) -> SNetSocket_t {
    return SteamAPI_ISteamNetworking_CreateP2PConnectionSocket(steam_networking, steamIDTarget: uint64_steamid, nVirtualPort: s32, nTimeoutSec: s32, bAllowUseOfPacketRelay: bool);
}


SteamNetworking_CreateConnectionSocket :: inline (nIP: SteamIPAddress_t, nPort: uint16, nTimeoutSec: s32) -> SNetSocket_t {
    return SteamAPI_ISteamNetworking_CreateConnectionSocket(steam_networking, nIP: SteamIPAddress_t, nPort: uint16, nTimeoutSec: s32);
}


SteamNetworking_DestroySocket :: inline (hSocket: SNetSocket_t, bNotifyRemoteEnd: bool) -> bool {
    return SteamAPI_ISteamNetworking_DestroySocket(steam_networking, hSocket: SNetSocket_t, bNotifyRemoteEnd: bool);
}


SteamNetworking_DestroyListenSocket :: inline (hSocket: SNetListenSocket_t, bNotifyRemoteEnd: bool) -> bool {
    return SteamAPI_ISteamNetworking_DestroyListenSocket(steam_networking, hSocket: SNetListenSocket_t, bNotifyRemoteEnd: bool);
}


SteamNetworking_SendDataOnSocket :: inline (hSocket: SNetSocket_t, pubData: *void, cubData: uint32, bReliable: bool) -> bool {
    return SteamAPI_ISteamNetworking_SendDataOnSocket(steam_networking, hSocket: SNetSocket_t, pubData: *void, cubData: uint32, bReliable: bool);
}


SteamNetworking_IsDataAvailableOnSocket :: inline (hSocket: SNetSocket_t, pcubMsgSize: *uint32) -> bool {
    return SteamAPI_ISteamNetworking_IsDataAvailableOnSocket(steam_networking, hSocket: SNetSocket_t, pcubMsgSize: *uint32);
}


SteamNetworking_RetrieveDataFromSocket :: inline (hSocket: SNetSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32) -> bool {
    return SteamAPI_ISteamNetworking_RetrieveDataFromSocket(steam_networking, hSocket: SNetSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32);
}


SteamNetworking_IsDataAvailable :: inline (hListenSocket: SNetListenSocket_t, pcubMsgSize: *uint32, phSocket: *SNetSocket_t) -> bool {
    return SteamAPI_ISteamNetworking_IsDataAvailable(steam_networking, hListenSocket: SNetListenSocket_t, pcubMsgSize: *uint32, phSocket: *SNetSocket_t);
}


SteamNetworking_RetrieveData :: inline (hListenSocket: SNetListenSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, phSocket: *SNetSocket_t) -> bool {
    return SteamAPI_ISteamNetworking_RetrieveData(steam_networking, hListenSocket: SNetListenSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, phSocket: *SNetSocket_t);
}


SteamNetworking_GetSocketInfo :: inline (hSocket: SNetSocket_t, pSteamIDRemote: *CSteamID, peSocketStatus: *s32, punIPRemote: *SteamIPAddress_t, punPortRemote: *uint16) -> bool {
    return SteamAPI_ISteamNetworking_GetSocketInfo(steam_networking, hSocket: SNetSocket_t, pSteamIDRemote: *CSteamID, peSocketStatus: *s32, punIPRemote: *SteamIPAddress_t, punPortRemote: *uint16);
}


SteamNetworking_GetListenSocketInfo :: inline (hListenSocket: SNetListenSocket_t, pnIP: *SteamIPAddress_t, pnPort: *uint16) -> bool {
    return SteamAPI_ISteamNetworking_GetListenSocketInfo(steam_networking, hListenSocket: SNetListenSocket_t, pnIP: *SteamIPAddress_t, pnPort: *uint16);
}


SteamNetworking_GetSocketConnectionType :: inline (hSocket: SNetSocket_t) -> ESNetSocketConnectionType {
    return SteamAPI_ISteamNetworking_GetSocketConnectionType(steam_networking, hSocket: SNetSocket_t);
}


SteamNetworking_GetMaxPacketSize :: inline (hSocket: SNetSocket_t) -> s32 {
    return SteamAPI_ISteamNetworking_GetMaxPacketSize(steam_networking, hSocket: SNetSocket_t);
}
