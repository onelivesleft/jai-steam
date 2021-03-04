steam_networking_messages : *ISteamNetworkingMessages;
SteamNetworkingMessages : SteamNetworkingMessages_Namespace;


#scope_file


SteamNetworkingMessages_Namespace :: struct {
    // procs
    SendMessageToUser                                  :: SteamNetworkingMessages_SendMessageToUser;
    ReceiveMessagesOnChannel                           :: SteamNetworkingMessages_ReceiveMessagesOnChannel;
    AcceptSessionWithUser                              :: SteamNetworkingMessages_AcceptSessionWithUser;
    CloseSessionWithUser                               :: SteamNetworkingMessages_CloseSessionWithUser;
    CloseChannelWithUser                               :: SteamNetworkingMessages_CloseChannelWithUser;
    GetSessionConnectionInfo                           :: SteamNetworkingMessages_GetSessionConnectionInfo;
}


SteamNetworkingMessages_SendMessageToUser :: inline (identityRemote: *SteamNetworkingIdentity, pubData: *void, cubData: uint32, nSendFlags: s32, nRemoteChannel: s32) -> EResult #foreign steam "SteamAPI_ISteamNetworkingMessages_Sen {
    return SteamNetworkingMessages_SendMessageToUser(steam_networking_messages, identityRemote, pubData, cubData, nSendFlags, nRemoteChannel);
}


SteamNetworkingMessages_ReceiveMessagesOnChannel :: inline (nLocalChannel: s32, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 #foreign steam "SteamAPI_ISteamNetworkingMessages_ReceiveMes {
    return SteamNetworkingMessages_ReceiveMessagesOnChannel(steam_networking_messages, nLocalChannel, ppOutMessages, nMaxMessages);
}


SteamNetworkingMessages_AcceptSessionWithUser :: inline (identityRemote: *SteamNetworkingIdentity) -> bool #foreign steam "SteamAPI_ISteamNetworkingMessages_AcceptS {
    return SteamNetworkingMessages_AcceptSessionWithUser(steam_networking_messages, identityRemote);
}


SteamNetworkingMessages_CloseSessionWithUser :: inline (identityRemote: *SteamNetworkingIdentity) -> bool #foreign steam "SteamAPI_ISteamNetworkingMessages_CloseS {
    return SteamNetworkingMessages_CloseSessionWithUser(steam_networking_messages, identityRemote);
}


SteamNetworkingMessages_CloseChannelWithUser :: inline (identityRemote: *SteamNetworkingIdentity, nLocalChannel: s32) -> bool #foreign steam "SteamAPI_ISteamNetworkingMessages_CloseC {
    return SteamNetworkingMessages_CloseChannelWithUser(steam_networking_messages, identityRemote, nLocalChannel);
}


SteamNetworkingMessages_GetSessionConnectionInfo :: inline (identityRemote: *SteamNetworkingIdentity, pConnectionInfo: *SteamNetConnectionInfo_t, pQuickStatus: *SteamNetworkingQuickConnectionStatus) -> ESteamNetworkingConnectionState #foreign steam "SteamAPI_ISteamNetworkingMessages_GetSession {
    return SteamNetworkingMessages_GetSessionConnectionInfo(steam_networking_messages, identityRemote, pConnectionInfo, pQuickStatus);
}
