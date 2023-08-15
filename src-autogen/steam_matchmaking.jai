steam_matchmaking : *ISteamMatchmaking;


GetFavoriteGameCount :: inline () -> s32 {
    return SteamAPI_ISteamMatchmaking_GetFavoriteGameCount(steam_matchmaking);
}


GetFavoriteGame :: inline (iGame: s32, pnAppID: *AppId_t, pnIP: *uint32, pnConnPort: *uint16, pnQueryPort: *uint16, punFlags: *uint32, pRTime32LastPlayedOnServer: *uint32) -> bool {
    return SteamAPI_ISteamMatchmaking_GetFavoriteGame(steam_matchmaking, iGame, pnAppID, pnIP, pnConnPort, pnQueryPort, punFlags, pRTime32LastPlayedOnServer);
}


AddFavoriteGame :: inline (nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32, rTime32LastPlayedOnServer: uint32) -> s32 {
    return SteamAPI_ISteamMatchmaking_AddFavoriteGame(steam_matchmaking, nAppID, nIP, nConnPort, nQueryPort, unFlags, rTime32LastPlayedOnServer);
}


RemoveFavoriteGame :: inline (nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32) -> bool {
    return SteamAPI_ISteamMatchmaking_RemoveFavoriteGame(steam_matchmaking, nAppID, nIP, nConnPort, nQueryPort, unFlags);
}


RequestLobbyList :: inline () -> SteamAPICall_t {
    return SteamAPI_ISteamMatchmaking_RequestLobbyList(steam_matchmaking);
}

RequestLobbyList :: inline (callback: (LobbyMatchList_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := RequestLobbyList();
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

RequestLobbyList :: (code: Code) -> SteamAPICall_t #expand {
    call_result_id := RequestLobbyList();
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: LobbyMatchList_t, io_failure: bool) -> () {
                #insert,scope() code;
            }
        );
    }
    return call_result_id;
}


AddRequestLobbyListStringFilter :: inline (pchKeyToMatch: *char, pchValueToMatch: *char, eComparisonType: ELobbyComparison) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter(steam_matchmaking, pchKeyToMatch, pchValueToMatch, eComparisonType);
}


AddRequestLobbyListNumericalFilter :: inline (pchKeyToMatch: *char, nValueToMatch: s32, eComparisonType: ELobbyComparison) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter(steam_matchmaking, pchKeyToMatch, nValueToMatch, eComparisonType);
}


AddRequestLobbyListNearValueFilter :: inline (pchKeyToMatch: *char, nValueToBeCloseTo: s32) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter(steam_matchmaking, pchKeyToMatch, nValueToBeCloseTo);
}


AddRequestLobbyListFilterSlotsAvailable :: inline (nSlotsAvailable: s32) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable(steam_matchmaking, nSlotsAvailable);
}


AddRequestLobbyListDistanceFilter :: inline (eLobbyDistanceFilter: ELobbyDistanceFilter) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter(steam_matchmaking, eLobbyDistanceFilter);
}


AddRequestLobbyListResultCountFilter :: inline (cMaxResults: s32) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter(steam_matchmaking, cMaxResults);
}


AddRequestLobbyListCompatibleMembersFilter :: inline (steamIDLobby: uint64_steamid) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter(steam_matchmaking, steamIDLobby);
}


GetLobbyByIndex :: inline (iLobby: s32) -> uint64_steamid {
    return SteamAPI_ISteamMatchmaking_GetLobbyByIndex(steam_matchmaking, iLobby);
}


CreateLobby :: inline (eLobbyType: ELobbyType, cMaxMembers: s32) -> SteamAPICall_t {
    return SteamAPI_ISteamMatchmaking_CreateLobby(steam_matchmaking, eLobbyType, cMaxMembers);
}

CreateLobby :: inline (eLobbyType: ELobbyType, cMaxMembers: s32, callback: (LobbyCreated_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := CreateLobby(eLobbyType, cMaxMembers);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

CreateLobby :: (eLobbyType: ELobbyType, cMaxMembers: s32, code: Code) -> SteamAPICall_t #expand {
    call_result_id := CreateLobby(eLobbyType, cMaxMembers);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: LobbyCreated_t, io_failure: bool) -> () {
                #insert,scope() code;
            }
        );
    }
    return call_result_id;
}


JoinLobby :: inline (steamIDLobby: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamMatchmaking_JoinLobby(steam_matchmaking, steamIDLobby);
}

JoinLobby :: inline (steamIDLobby: uint64_steamid, callback: (LobbyEnter_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := JoinLobby(steamIDLobby);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

JoinLobby :: (steamIDLobby: uint64_steamid, code: Code) -> SteamAPICall_t #expand {
    call_result_id := JoinLobby(steamIDLobby);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: LobbyEnter_t, io_failure: bool) -> () {
                #insert,scope() code;
            }
        );
    }
    return call_result_id;
}


LeaveLobby :: inline (steamIDLobby: uint64_steamid) {
    SteamAPI_ISteamMatchmaking_LeaveLobby(steam_matchmaking, steamIDLobby);
}


InviteUserToLobby :: inline (steamIDLobby: uint64_steamid, steamIDInvitee: uint64_steamid) -> bool {
    return SteamAPI_ISteamMatchmaking_InviteUserToLobby(steam_matchmaking, steamIDLobby, steamIDInvitee);
}


GetNumLobbyMembers :: inline (steamIDLobby: uint64_steamid) -> s32 {
    return SteamAPI_ISteamMatchmaking_GetNumLobbyMembers(steam_matchmaking, steamIDLobby);
}


GetLobbyMemberByIndex :: inline (steamIDLobby: uint64_steamid, iMember: s32) -> uint64_steamid {
    return SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex(steam_matchmaking, steamIDLobby, iMember);
}


GetLobbyData :: inline (steamIDLobby: uint64_steamid, pchKey: *char) -> string {
    return to_string(SteamAPI_ISteamMatchmaking_GetLobbyData(steam_matchmaking, steamIDLobby, pchKey));
}


SetLobbyData :: inline (steamIDLobby: uint64_steamid, pchKey: *char, pchValue: *char) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyData(steam_matchmaking, steamIDLobby, pchKey, pchValue);
}


GetLobbyDataCount :: inline (steamIDLobby: uint64_steamid) -> s32 {
    return SteamAPI_ISteamMatchmaking_GetLobbyDataCount(steam_matchmaking, steamIDLobby);
}


GetLobbyDataByIndex :: inline (steamIDLobby: uint64_steamid, iLobbyData: s32, pchKey: *char, cchKeyBufferSize: s32, pchValue: *char, cchValueBufferSize: s32) -> bool {
    return SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex(steam_matchmaking, steamIDLobby, iLobbyData, pchKey, cchKeyBufferSize, pchValue, cchValueBufferSize);
}


DeleteLobbyData :: inline (steamIDLobby: uint64_steamid, pchKey: *char) -> bool {
    return SteamAPI_ISteamMatchmaking_DeleteLobbyData(steam_matchmaking, steamIDLobby, pchKey);
}


GetLobbyMemberData :: inline (steamIDLobby: uint64_steamid, steamIDUser: uint64_steamid, pchKey: *char) -> string {
    return to_string(SteamAPI_ISteamMatchmaking_GetLobbyMemberData(steam_matchmaking, steamIDLobby, steamIDUser, pchKey));
}


SetLobbyMemberData :: inline (steamIDLobby: uint64_steamid, pchKey: *char, pchValue: *char) {
    SteamAPI_ISteamMatchmaking_SetLobbyMemberData(steam_matchmaking, steamIDLobby, pchKey, pchValue);
}


SendLobbyChatMsg :: inline (steamIDLobby: uint64_steamid, pvMsgBody: *void, cubMsgBody: s32) -> bool {
    return SteamAPI_ISteamMatchmaking_SendLobbyChatMsg(steam_matchmaking, steamIDLobby, pvMsgBody, cubMsgBody);
}


GetLobbyChatEntry :: inline (steamIDLobby: uint64_steamid, iChatID: s32, pSteamIDUser: *CSteamID, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 {
    return SteamAPI_ISteamMatchmaking_GetLobbyChatEntry(steam_matchmaking, steamIDLobby, iChatID, pSteamIDUser, pvData, cubData, peChatEntryType);
}


RequestLobbyData :: inline (steamIDLobby: uint64_steamid) -> bool {
    return SteamAPI_ISteamMatchmaking_RequestLobbyData(steam_matchmaking, steamIDLobby);
}


SetLobbyGameServer :: inline (steamIDLobby: uint64_steamid, unGameServerIP: uint32, unGameServerPort: uint16, steamIDGameServer: uint64_steamid) {
    SteamAPI_ISteamMatchmaking_SetLobbyGameServer(steam_matchmaking, steamIDLobby, unGameServerIP, unGameServerPort, steamIDGameServer);
}


GetLobbyGameServer :: inline (steamIDLobby: uint64_steamid, punGameServerIP: *uint32, punGameServerPort: *uint16, psteamIDGameServer: *CSteamID) -> bool {
    return SteamAPI_ISteamMatchmaking_GetLobbyGameServer(steam_matchmaking, steamIDLobby, punGameServerIP, punGameServerPort, psteamIDGameServer);
}


SetLobbyMemberLimit :: inline (steamIDLobby: uint64_steamid, cMaxMembers: s32) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit(steam_matchmaking, steamIDLobby, cMaxMembers);
}


GetLobbyMemberLimit :: inline (steamIDLobby: uint64_steamid) -> s32 {
    return SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit(steam_matchmaking, steamIDLobby);
}


SetLobbyType :: inline (steamIDLobby: uint64_steamid, eLobbyType: ELobbyType) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyType(steam_matchmaking, steamIDLobby, eLobbyType);
}


SetLobbyJoinable :: inline (steamIDLobby: uint64_steamid, bLobbyJoinable: bool) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyJoinable(steam_matchmaking, steamIDLobby, bLobbyJoinable);
}


GetLobbyOwner :: inline (steamIDLobby: uint64_steamid) -> uint64_steamid {
    return SteamAPI_ISteamMatchmaking_GetLobbyOwner(steam_matchmaking, steamIDLobby);
}


SetLobbyOwner :: inline (steamIDLobby: uint64_steamid, steamIDNewOwner: uint64_steamid) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyOwner(steam_matchmaking, steamIDLobby, steamIDNewOwner);
}


SetLinkedLobby :: inline (steamIDLobby: uint64_steamid, steamIDLobbyDependent: uint64_steamid) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLinkedLobby(steam_matchmaking, steamIDLobby, steamIDLobbyDependent);
}
