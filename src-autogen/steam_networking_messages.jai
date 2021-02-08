steam_networking_messages : *ISteamNetworkingMessages;

SteamNetworkingMessages : SteamNetworkingMessages_Namespace;


#scope_file


SteamNetworkingMessages_Namespace :: struct {
    // procs
                  :: SteamNetworkingMessages_SendMessageToUser
           :: SteamNetworkingMessages_ReceiveMessagesOnChannel
              :: SteamNetworkingMessages_AcceptSessionWithUser
               :: SteamNetworkingMessages_CloseSessionWithUser
               :: SteamNetworkingMessages_CloseChannelWithUser
           :: SteamNetworkingMessages_GetSessionConnectionInfo
}


SteamNetworkingMessages_SendMessageToUser :: inline (identityRemote: *SteamNetworkingIdentity, pubData: *void, cubData: uint32, nSendFlags: s32, nRemoteChannel: s32) -> EResult {
    return SteamAPI_ISteamNetworkingMessages_SendMessageToUser(steam_networking_messages, identityRemote: *SteamNetworkingIdentity, pubData: *void, cubData: uint32, nSendFlags: s32, nRemoteChannel: s32);
}


SteamNetworkingMessages_ReceiveMessagesOnChannel :: inline (nLocalChannel: s32, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 {
    return SteamAPI_ISteamNetworkingMessages_ReceiveMessagesOnChannel(steam_networking_messages, nLocalChannel: s32, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32);
}


SteamNetworkingMessages_AcceptSessionWithUser :: inline (identityRemote: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingMessages_AcceptSessionWithUser(steam_networking_messages, identityRemote: *SteamNetworkingIdentity);
}


SteamNetworkingMessages_CloseSessionWithUser :: inline (identityRemote: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingMessages_CloseSessionWithUser(steam_networking_messages, identityRemote: *SteamNetworkingIdentity);
}


SteamNetworkingMessages_CloseChannelWithUser :: inline (identityRemote: *SteamNetworkingIdentity, nLocalChannel: s32) -> bool {
    return SteamAPI_ISteamNetworkingMessages_CloseChannelWithUser(steam_networking_messages, identityRemote: *SteamNetworkingIdentity, nLocalChannel: s32);
}


SteamNetworkingMessages_GetSessionConnectionInfo :: inline (identityRemote: *SteamNetworkingIdentity, pConnectionInfo: *SteamNetConnectionInfo_t, pQuickStatus: *SteamNetworkingQuickConnectionStatus) -> ESteamNetworkingConnectionState {
    return SteamAPI_ISteamNetworkingMessages_GetSessionConnectionInfo(steam_networking_messages, identityRemote: *SteamNetworkingIdentity, pConnectionInfo: *SteamNetConnectionInfo_t, pQuickStatus: *SteamNetworkingQuickConnectionStatus);
}
