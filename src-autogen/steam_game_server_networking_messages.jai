steam_game_server_networking_messages : *ISteamNetworkingMessages;


ServerSendMessageToUser :: inline (identityRemote: *SteamNetworkingIdentity, pubData: *void, cubData: uint32, nSendFlags: s32, nRemoteChannel: s32) -> EResult {
    return SteamAPI_ISteamNetworkingMessages_SendMessageToUser(steam_game_server_networking_messages, identityRemote, pubData, cubData, nSendFlags, nRemoteChannel);
}


ServerReceiveMessagesOnChannel :: inline (nLocalChannel: s32, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 {
    return SteamAPI_ISteamNetworkingMessages_ReceiveMessagesOnChannel(steam_game_server_networking_messages, nLocalChannel, ppOutMessages, nMaxMessages);
}


ServerAcceptSessionWithUser :: inline (identityRemote: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingMessages_AcceptSessionWithUser(steam_game_server_networking_messages, identityRemote);
}


ServerCloseSessionWithUser :: inline (identityRemote: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingMessages_CloseSessionWithUser(steam_game_server_networking_messages, identityRemote);
}


ServerCloseChannelWithUser :: inline (identityRemote: *SteamNetworkingIdentity, nLocalChannel: s32) -> bool {
    return SteamAPI_ISteamNetworkingMessages_CloseChannelWithUser(steam_game_server_networking_messages, identityRemote, nLocalChannel);
}


ServerGetSessionConnectionInfo :: inline (identityRemote: *SteamNetworkingIdentity, pConnectionInfo: *SteamNetConnectionInfo_t, pQuickStatus: *SteamNetworkingQuickConnectionStatus) -> ESteamNetworkingConnectionState {
    return SteamAPI_ISteamNetworkingMessages_GetSessionConnectionInfo(steam_game_server_networking_messages, identityRemote, pConnectionInfo, pQuickStatus);
}
