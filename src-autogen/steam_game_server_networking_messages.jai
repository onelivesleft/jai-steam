steam_game_server_networking_messages : *ISteamNetworkingMessages;
SteamGameServerNetworkingMessages : SteamGameServerNetworkingMessages_Namespace;


#scope_file


SteamGameServerNetworkingMessages_Namespace :: struct {
    // procs
    SendMessageToUser                                  :: SteamNetworkingMessages_SendMessageToUser;
    ReceiveMessagesOnChannel                           :: SteamNetworkingMessages_ReceiveMessagesOnChannel;
    AcceptSessionWithUser                              :: SteamNetworkingMessages_AcceptSessionWithUser;
    CloseSessionWithUser                               :: SteamNetworkingMessages_CloseSessionWithUser;
    CloseChannelWithUser                               :: SteamNetworkingMessages_CloseChannelWithUser;
    GetSessionConnectionInfo                           :: SteamNetworkingMessages_GetSessionConnectionInfo;
}


SteamNetworkingMessages_SendMessageToUser :: inline (identityRemote: *SteamNetworkingIdentity, pubData: *void, cubData: uint32, nSendFlags: s32, nRemoteChannel: s32) -> EResult {
    return SteamAPI_ISteamNetworkingMessages_SendMessageToUser(steam_game_server_networking_messages, identityRemote, pubData, cubData, nSendFlags, nRemoteChannel);
}


SteamNetworkingMessages_ReceiveMessagesOnChannel :: inline (nLocalChannel: s32, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 {
    return SteamAPI_ISteamNetworkingMessages_ReceiveMessagesOnChannel(steam_game_server_networking_messages, nLocalChannel, ppOutMessages, nMaxMessages);
}


SteamNetworkingMessages_AcceptSessionWithUser :: inline (identityRemote: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingMessages_AcceptSessionWithUser(steam_game_server_networking_messages, identityRemote);
}


SteamNetworkingMessages_CloseSessionWithUser :: inline (identityRemote: *SteamNetworkingIdentity) -> bool {
    return SteamAPI_ISteamNetworkingMessages_CloseSessionWithUser(steam_game_server_networking_messages, identityRemote);
}


SteamNetworkingMessages_CloseChannelWithUser :: inline (identityRemote: *SteamNetworkingIdentity, nLocalChannel: s32) -> bool {
    return SteamAPI_ISteamNetworkingMessages_CloseChannelWithUser(steam_game_server_networking_messages, identityRemote, nLocalChannel);
}


SteamNetworkingMessages_GetSessionConnectionInfo :: inline (identityRemote: *SteamNetworkingIdentity, pConnectionInfo: *SteamNetConnectionInfo_t, pQuickStatus: *SteamNetworkingQuickConnectionStatus) -> ESteamNetworkingConnectionState {
    return SteamAPI_ISteamNetworkingMessages_GetSessionConnectionInfo(steam_game_server_networking_messages, identityRemote, pConnectionInfo, pQuickStatus);
}
