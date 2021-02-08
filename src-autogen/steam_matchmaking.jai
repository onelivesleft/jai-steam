steam_matchmaking : *ISteamMatchmaking;
SteamMatchmaking : SteamMatchmaking_Namespace;


#scope_file


SteamMatchmaking_Namespace :: struct {
    // procs
    GetFavoriteGameCount                               :: SteamMatchmaking_GetFavoriteGameCount;
    GetFavoriteGame                                    :: SteamMatchmaking_GetFavoriteGame;
    AddFavoriteGame                                    :: SteamMatchmaking_AddFavoriteGame;
    RemoveFavoriteGame                                 :: SteamMatchmaking_RemoveFavoriteGame;
    RequestLobbyList                                   :: SteamMatchmaking_RequestLobbyList;
    AddRequestLobbyListStringFilter                    :: SteamMatchmaking_AddRequestLobbyListStringFilter;
    AddRequestLobbyListNumericalFilter                 :: SteamMatchmaking_AddRequestLobbyListNumericalFilter;
    AddRequestLobbyListNearValueFilter                 :: SteamMatchmaking_AddRequestLobbyListNearValueFilter;
    AddRequestLobbyListFilterSlotsAvailable            :: SteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable;
    AddRequestLobbyListDistanceFilter                  :: SteamMatchmaking_AddRequestLobbyListDistanceFilter;
    AddRequestLobbyListResultCountFilter               :: SteamMatchmaking_AddRequestLobbyListResultCountFilter;
    AddRequestLobbyListCompatibleMembersFilter         :: SteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter;
    GetLobbyByIndex                                    :: SteamMatchmaking_GetLobbyByIndex;
    CreateLobby                                        :: SteamMatchmaking_CreateLobby;
    JoinLobby                                          :: SteamMatchmaking_JoinLobby;
    LeaveLobby                                         :: SteamMatchmaking_LeaveLobby;
    InviteUserToLobby                                  :: SteamMatchmaking_InviteUserToLobby;
    GetNumLobbyMembers                                 :: SteamMatchmaking_GetNumLobbyMembers;
    GetLobbyMemberByIndex                              :: SteamMatchmaking_GetLobbyMemberByIndex;
    GetLobbyData                                       :: SteamMatchmaking_GetLobbyData;
    SetLobbyData                                       :: SteamMatchmaking_SetLobbyData;
    GetLobbyDataCount                                  :: SteamMatchmaking_GetLobbyDataCount;
    GetLobbyDataByIndex                                :: SteamMatchmaking_GetLobbyDataByIndex;
    DeleteLobbyData                                    :: SteamMatchmaking_DeleteLobbyData;
    GetLobbyMemberData                                 :: SteamMatchmaking_GetLobbyMemberData;
    SetLobbyMemberData                                 :: SteamMatchmaking_SetLobbyMemberData;
    SendLobbyChatMsg                                   :: SteamMatchmaking_SendLobbyChatMsg;
    GetLobbyChatEntry                                  :: SteamMatchmaking_GetLobbyChatEntry;
    RequestLobbyData                                   :: SteamMatchmaking_RequestLobbyData;
    SetLobbyGameServer                                 :: SteamMatchmaking_SetLobbyGameServer;
    GetLobbyGameServer                                 :: SteamMatchmaking_GetLobbyGameServer;
    SetLobbyMemberLimit                                :: SteamMatchmaking_SetLobbyMemberLimit;
    GetLobbyMemberLimit                                :: SteamMatchmaking_GetLobbyMemberLimit;
    SetLobbyType                                       :: SteamMatchmaking_SetLobbyType;
    SetLobbyJoinable                                   :: SteamMatchmaking_SetLobbyJoinable;
    GetLobbyOwner                                      :: SteamMatchmaking_GetLobbyOwner;
    SetLobbyOwner                                      :: SteamMatchmaking_SetLobbyOwner;
    SetLinkedLobby                                     :: SteamMatchmaking_SetLinkedLobby;
}


SteamMatchmaking_GetFavoriteGameCount :: inline () -> s32 {
    return SteamAPI_ISteamMatchmaking_GetFavoriteGameCount(steam_matchmaking);
}


SteamMatchmaking_GetFavoriteGame :: inline (iGame: s32, pnAppID: *AppId_t, pnIP: *uint32, pnConnPort: *uint16, pnQueryPort: *uint16, punFlags: *uint32, pRTime32LastPlayedOnServer: *uint32) -> bool {
    return SteamAPI_ISteamMatchmaking_GetFavoriteGame(steam_matchmaking, iGame, pnAppID, pnIP, pnConnPort, pnQueryPort, punFlags, pRTime32LastPlayedOnServer);
}


SteamMatchmaking_AddFavoriteGame :: inline (nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32, rTime32LastPlayedOnServer: uint32) -> s32 {
    return SteamAPI_ISteamMatchmaking_AddFavoriteGame(steam_matchmaking, nAppID, nIP, nConnPort, nQueryPort, unFlags, rTime32LastPlayedOnServer);
}


SteamMatchmaking_RemoveFavoriteGame :: inline (nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32) -> bool {
    return SteamAPI_ISteamMatchmaking_RemoveFavoriteGame(steam_matchmaking, nAppID, nIP, nConnPort, nQueryPort, unFlags);
}


SteamMatchmaking_RequestLobbyList :: inline () -> SteamAPICall_t {
    return SteamAPI_ISteamMatchmaking_RequestLobbyList(steam_matchmaking);
}


SteamMatchmaking_AddRequestLobbyListStringFilter :: inline (pchKeyToMatch: *char, pchValueToMatch: *char, eComparisonType: ELobbyComparison) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter(steam_matchmaking, pchKeyToMatch, pchValueToMatch, eComparisonType);
}


SteamMatchmaking_AddRequestLobbyListNumericalFilter :: inline (pchKeyToMatch: *char, nValueToMatch: s32, eComparisonType: ELobbyComparison) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter(steam_matchmaking, pchKeyToMatch, nValueToMatch, eComparisonType);
}


SteamMatchmaking_AddRequestLobbyListNearValueFilter :: inline (pchKeyToMatch: *char, nValueToBeCloseTo: s32) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter(steam_matchmaking, pchKeyToMatch, nValueToBeCloseTo);
}


SteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable :: inline (nSlotsAvailable: s32) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable(steam_matchmaking, nSlotsAvailable);
}


SteamMatchmaking_AddRequestLobbyListDistanceFilter :: inline (eLobbyDistanceFilter: ELobbyDistanceFilter) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter(steam_matchmaking, eLobbyDistanceFilter);
}


SteamMatchmaking_AddRequestLobbyListResultCountFilter :: inline (cMaxResults: s32) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter(steam_matchmaking, cMaxResults);
}


SteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter :: inline (steamIDLobby: uint64_steamid) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter(steam_matchmaking, steamIDLobby);
}


SteamMatchmaking_GetLobbyByIndex :: inline (iLobby: s32) -> uint64_steamid {
    return SteamAPI_ISteamMatchmaking_GetLobbyByIndex(steam_matchmaking, iLobby);
}


SteamMatchmaking_CreateLobby :: inline (eLobbyType: ELobbyType, cMaxMembers: s32) -> SteamAPICall_t {
    return SteamAPI_ISteamMatchmaking_CreateLobby(steam_matchmaking, eLobbyType, cMaxMembers);
}


SteamMatchmaking_JoinLobby :: inline (steamIDLobby: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamMatchmaking_JoinLobby(steam_matchmaking, steamIDLobby);
}


SteamMatchmaking_LeaveLobby :: inline (steamIDLobby: uint64_steamid) {
    SteamAPI_ISteamMatchmaking_LeaveLobby(steam_matchmaking, steamIDLobby);
}


SteamMatchmaking_InviteUserToLobby :: inline (steamIDLobby: uint64_steamid, steamIDInvitee: uint64_steamid) -> bool {
    return SteamAPI_ISteamMatchmaking_InviteUserToLobby(steam_matchmaking, steamIDLobby, steamIDInvitee);
}


SteamMatchmaking_GetNumLobbyMembers :: inline (steamIDLobby: uint64_steamid) -> s32 {
    return SteamAPI_ISteamMatchmaking_GetNumLobbyMembers(steam_matchmaking, steamIDLobby);
}


SteamMatchmaking_GetLobbyMemberByIndex :: inline (steamIDLobby: uint64_steamid, iMember: s32) -> uint64_steamid {
    return SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex(steam_matchmaking, steamIDLobby, iMember);
}


SteamMatchmaking_GetLobbyData :: inline (steamIDLobby: uint64_steamid, pchKey: *char) -> *char {
    return SteamAPI_ISteamMatchmaking_GetLobbyData(steam_matchmaking, steamIDLobby, pchKey);
}


SteamMatchmaking_SetLobbyData :: inline (steamIDLobby: uint64_steamid, pchKey: *char, pchValue: *char) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyData(steam_matchmaking, steamIDLobby, pchKey, pchValue);
}


SteamMatchmaking_GetLobbyDataCount :: inline (steamIDLobby: uint64_steamid) -> s32 {
    return SteamAPI_ISteamMatchmaking_GetLobbyDataCount(steam_matchmaking, steamIDLobby);
}


SteamMatchmaking_GetLobbyDataByIndex :: inline (steamIDLobby: uint64_steamid, iLobbyData: s32, pchKey: *char, cchKeyBufferSize: s32, pchValue: *char, cchValueBufferSize: s32) -> bool {
    return SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex(steam_matchmaking, steamIDLobby, iLobbyData, pchKey, cchKeyBufferSize, pchValue, cchValueBufferSize);
}


SteamMatchmaking_DeleteLobbyData :: inline (steamIDLobby: uint64_steamid, pchKey: *char) -> bool {
    return SteamAPI_ISteamMatchmaking_DeleteLobbyData(steam_matchmaking, steamIDLobby, pchKey);
}


SteamMatchmaking_GetLobbyMemberData :: inline (steamIDLobby: uint64_steamid, steamIDUser: uint64_steamid, pchKey: *char) -> *char {
    return SteamAPI_ISteamMatchmaking_GetLobbyMemberData(steam_matchmaking, steamIDLobby, steamIDUser, pchKey);
}


SteamMatchmaking_SetLobbyMemberData :: inline (steamIDLobby: uint64_steamid, pchKey: *char, pchValue: *char) {
    SteamAPI_ISteamMatchmaking_SetLobbyMemberData(steam_matchmaking, steamIDLobby, pchKey, pchValue);
}


SteamMatchmaking_SendLobbyChatMsg :: inline (steamIDLobby: uint64_steamid, pvMsgBody: *void, cubMsgBody: s32) -> bool {
    return SteamAPI_ISteamMatchmaking_SendLobbyChatMsg(steam_matchmaking, steamIDLobby, pvMsgBody, cubMsgBody);
}


SteamMatchmaking_GetLobbyChatEntry :: inline (steamIDLobby: uint64_steamid, iChatID: s32, pSteamIDUser: *CSteamID, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 {
    return SteamAPI_ISteamMatchmaking_GetLobbyChatEntry(steam_matchmaking, steamIDLobby, iChatID, pSteamIDUser, pvData, cubData, peChatEntryType);
}


SteamMatchmaking_RequestLobbyData :: inline (steamIDLobby: uint64_steamid) -> bool {
    return SteamAPI_ISteamMatchmaking_RequestLobbyData(steam_matchmaking, steamIDLobby);
}


SteamMatchmaking_SetLobbyGameServer :: inline (steamIDLobby: uint64_steamid, unGameServerIP: uint32, unGameServerPort: uint16, steamIDGameServer: uint64_steamid) {
    SteamAPI_ISteamMatchmaking_SetLobbyGameServer(steam_matchmaking, steamIDLobby, unGameServerIP, unGameServerPort, steamIDGameServer);
}


SteamMatchmaking_GetLobbyGameServer :: inline (steamIDLobby: uint64_steamid, punGameServerIP: *uint32, punGameServerPort: *uint16, psteamIDGameServer: *CSteamID) -> bool {
    return SteamAPI_ISteamMatchmaking_GetLobbyGameServer(steam_matchmaking, steamIDLobby, punGameServerIP, punGameServerPort, psteamIDGameServer);
}


SteamMatchmaking_SetLobbyMemberLimit :: inline (steamIDLobby: uint64_steamid, cMaxMembers: s32) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit(steam_matchmaking, steamIDLobby, cMaxMembers);
}


SteamMatchmaking_GetLobbyMemberLimit :: inline (steamIDLobby: uint64_steamid) -> s32 {
    return SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit(steam_matchmaking, steamIDLobby);
}


SteamMatchmaking_SetLobbyType :: inline (steamIDLobby: uint64_steamid, eLobbyType: ELobbyType) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyType(steam_matchmaking, steamIDLobby, eLobbyType);
}


SteamMatchmaking_SetLobbyJoinable :: inline (steamIDLobby: uint64_steamid, bLobbyJoinable: bool) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyJoinable(steam_matchmaking, steamIDLobby, bLobbyJoinable);
}


SteamMatchmaking_GetLobbyOwner :: inline (steamIDLobby: uint64_steamid) -> uint64_steamid {
    return SteamAPI_ISteamMatchmaking_GetLobbyOwner(steam_matchmaking, steamIDLobby);
}


SteamMatchmaking_SetLobbyOwner :: inline (steamIDLobby: uint64_steamid, steamIDNewOwner: uint64_steamid) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyOwner(steam_matchmaking, steamIDLobby, steamIDNewOwner);
}


SteamMatchmaking_SetLinkedLobby :: inline (steamIDLobby: uint64_steamid, steamIDLobbyDependent: uint64_steamid) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLinkedLobby(steam_matchmaking, steamIDLobby, steamIDLobbyDependent);
}
