steam_networking_messages : *ISteamNetworkingMessages;


SendMessageToUser :: inline (identityRemote: *SteamNetworkingIdentity, pubData: *void, cubData: uint32, nSendFlags: s32, nRemoteChannel: s32) -> EResult {
    return SteamAPI_ISteamNetworkingMessages_SendMessageToUser(steam_networking_messages, identityRemote, pubData, cubData, nSendFlags, nRemoteChannel);
}


ReceiveMessagesOnChannel :: inline (nLocalChannel: s32, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 {
    return SteamAPI_ISteamNetworkingMessages_ReceiveMessagesOnChannel(steam_networking_messages, nLocalChannel, ppOutMessages, nMaxMessages);
}


AcceptSessionWithUser :: inline (identityRemote: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingMessages_AcceptSessionWithUser(steam_networking_messages, identityRemote);
}


CloseSessionWithUser :: inline (identityRemote: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingMessages_CloseSessionWithUser(steam_networking_messages, identityRemote);
}


CloseChannelWithUser :: inline (identityRemote: *SteamNetworkingIdentity, nLocalChannel: s32) -> bool {
    return SteamAPI_ISteamNetworkingMessages_CloseChannelWithUser(steam_networking_messages, identityRemote, nLocalChannel);
}


GetSessionConnectionInfo :: inline (identityRemote: *SteamNetworkingIdentity, pConnectionInfo: *SteamNetConnectionInfo_t, pQuickStatus: *SteamNetworkingQuickConnectionStatus) -> ESteamNetworkingConnectionState {
    return SteamAPI_ISteamNetworkingMessages_GetSessionConnectionInfo(steam_networking_messages, identityRemote, pConnectionInfo, pQuickStatus);
}
