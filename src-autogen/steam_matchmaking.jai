steam_matchmaking : *ISteamMatchmaking;

SteamMatchmaking : SteamMatchmaking_Namespace;


#scope_file


SteamMatchmaking_Namespace :: struct {
    // procs
               :: SteamMatchmaking_GetFavoriteGameCount
                    :: SteamMatchmaking_GetFavoriteGame
                    :: SteamMatchmaking_AddFavoriteGame
                 :: SteamMatchmaking_RemoveFavoriteGame
                   :: SteamMatchmaking_RequestLobbyList
    :: SteamMatchmaking_AddRequestLobbyListStringFilter
    :: SteamMatchmaking_AddRequestLobbyListNumericalFilter
    :: SteamMatchmaking_AddRequestLobbyListNearValueFilter
    :: SteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable
    :: SteamMatchmaking_AddRequestLobbyListDistanceFilter
    :: SteamMatchmaking_AddRequestLobbyListResultCountFilter
    :: SteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter
                    :: SteamMatchmaking_GetLobbyByIndex
                        :: SteamMatchmaking_CreateLobby
                          :: SteamMatchmaking_JoinLobby
                         :: SteamMatchmaking_LeaveLobby
                  :: SteamMatchmaking_InviteUserToLobby
                 :: SteamMatchmaking_GetNumLobbyMembers
              :: SteamMatchmaking_GetLobbyMemberByIndex
                       :: SteamMatchmaking_GetLobbyData
                       :: SteamMatchmaking_SetLobbyData
                  :: SteamMatchmaking_GetLobbyDataCount
                :: SteamMatchmaking_GetLobbyDataByIndex
                    :: SteamMatchmaking_DeleteLobbyData
                 :: SteamMatchmaking_GetLobbyMemberData
                 :: SteamMatchmaking_SetLobbyMemberData
                   :: SteamMatchmaking_SendLobbyChatMsg
                  :: SteamMatchmaking_GetLobbyChatEntry
                   :: SteamMatchmaking_RequestLobbyData
                 :: SteamMatchmaking_SetLobbyGameServer
                 :: SteamMatchmaking_GetLobbyGameServer
                :: SteamMatchmaking_SetLobbyMemberLimit
                :: SteamMatchmaking_GetLobbyMemberLimit
                       :: SteamMatchmaking_SetLobbyType
                   :: SteamMatchmaking_SetLobbyJoinable
                      :: SteamMatchmaking_GetLobbyOwner
                      :: SteamMatchmaking_SetLobbyOwner
                     :: SteamMatchmaking_SetLinkedLobby
}


SteamMatchmaking_GetFavoriteGameCount :: inline () -> s32 {
    return SteamAPI_ISteamMatchmaking_GetFavoriteGameCount(steam_matchmaking);
}


SteamMatchmaking_GetFavoriteGame :: inline (iGame: s32, pnAppID: *AppId_t, pnIP: *uint32, pnConnPort: *uint16, pnQueryPort: *uint16, punFlags: *uint32, pRTime32LastPlayedOnServer: *uint32) -> bool {
    return SteamAPI_ISteamMatchmaking_GetFavoriteGame(steam_matchmaking, iGame: s32, pnAppID: *AppId_t, pnIP: *uint32, pnConnPort: *uint16, pnQueryPort: *uint16, punFlags: *uint32, pRTime32LastPlayedOnServer: *uint32);
}


SteamMatchmaking_AddFavoriteGame :: inline (nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32, rTime32LastPlayedOnServer: uint32) -> s32 {
    return SteamAPI_ISteamMatchmaking_AddFavoriteGame(steam_matchmaking, nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32, rTime32LastPlayedOnServer: uint32);
}


SteamMatchmaking_RemoveFavoriteGame :: inline (nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32) -> bool {
    return SteamAPI_ISteamMatchmaking_RemoveFavoriteGame(steam_matchmaking, nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32);
}


SteamMatchmaking_RequestLobbyList :: inline () -> SteamAPICall_t {
    return SteamAPI_ISteamMatchmaking_RequestLobbyList(steam_matchmaking);
}


SteamMatchmaking_AddRequestLobbyListStringFilter :: inline (pchKeyToMatch: *char, pchValueToMatch: *char, eComparisonType: ELobbyComparison) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter(steam_matchmaking, pchKeyToMatch: *char, pchValueToMatch: *char, eComparisonType: ELobbyComparison);
}


SteamMatchmaking_AddRequestLobbyListNumericalFilter :: inline (pchKeyToMatch: *char, nValueToMatch: s32, eComparisonType: ELobbyComparison) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter(steam_matchmaking, pchKeyToMatch: *char, nValueToMatch: s32, eComparisonType: ELobbyComparison);
}


SteamMatchmaking_AddRequestLobbyListNearValueFilter :: inline (pchKeyToMatch: *char, nValueToBeCloseTo: s32) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter(steam_matchmaking, pchKeyToMatch: *char, nValueToBeCloseTo: s32);
}


SteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable :: inline (nSlotsAvailable: s32) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable(steam_matchmaking, nSlotsAvailable: s32);
}


SteamMatchmaking_AddRequestLobbyListDistanceFilter :: inline (eLobbyDistanceFilter: ELobbyDistanceFilter) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter(steam_matchmaking, eLobbyDistanceFilter: ELobbyDistanceFilter);
}


SteamMatchmaking_AddRequestLobbyListResultCountFilter :: inline (cMaxResults: s32) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter(steam_matchmaking, cMaxResults: s32);
}


SteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter :: inline (steamIDLobby: uint64_steamid) {
    SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter(steam_matchmaking, steamIDLobby: uint64_steamid);
}


SteamMatchmaking_GetLobbyByIndex :: inline (iLobby: s32) -> uint64_steamid {
    return SteamAPI_ISteamMatchmaking_GetLobbyByIndex(steam_matchmaking, iLobby: s32);
}


SteamMatchmaking_CreateLobby :: inline (eLobbyType: ELobbyType, cMaxMembers: s32) -> SteamAPICall_t {
    return SteamAPI_ISteamMatchmaking_CreateLobby(steam_matchmaking, eLobbyType: ELobbyType, cMaxMembers: s32);
}


SteamMatchmaking_JoinLobby :: inline (steamIDLobby: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamMatchmaking_JoinLobby(steam_matchmaking, steamIDLobby: uint64_steamid);
}


SteamMatchmaking_LeaveLobby :: inline (steamIDLobby: uint64_steamid) {
    SteamAPI_ISteamMatchmaking_LeaveLobby(steam_matchmaking, steamIDLobby: uint64_steamid);
}


SteamMatchmaking_InviteUserToLobby :: inline (steamIDLobby: uint64_steamid, steamIDInvitee: uint64_steamid) -> bool {
    return SteamAPI_ISteamMatchmaking_InviteUserToLobby(steam_matchmaking, steamIDLobby: uint64_steamid, steamIDInvitee: uint64_steamid);
}


SteamMatchmaking_GetNumLobbyMembers :: inline (steamIDLobby: uint64_steamid) -> s32 {
    return SteamAPI_ISteamMatchmaking_GetNumLobbyMembers(steam_matchmaking, steamIDLobby: uint64_steamid);
}


SteamMatchmaking_GetLobbyMemberByIndex :: inline (steamIDLobby: uint64_steamid, iMember: s32) -> uint64_steamid {
    return SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex(steam_matchmaking, steamIDLobby: uint64_steamid, iMember: s32);
}


SteamMatchmaking_GetLobbyData :: inline (steamIDLobby: uint64_steamid, pchKey: *char) -> *char {
    return SteamAPI_ISteamMatchmaking_GetLobbyData(steam_matchmaking, steamIDLobby: uint64_steamid, pchKey: *char);
}


SteamMatchmaking_SetLobbyData :: inline (steamIDLobby: uint64_steamid, pchKey: *char, pchValue: *char) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyData(steam_matchmaking, steamIDLobby: uint64_steamid, pchKey: *char, pchValue: *char);
}


SteamMatchmaking_GetLobbyDataCount :: inline (steamIDLobby: uint64_steamid) -> s32 {
    return SteamAPI_ISteamMatchmaking_GetLobbyDataCount(steam_matchmaking, steamIDLobby: uint64_steamid);
}


SteamMatchmaking_GetLobbyDataByIndex :: inline (steamIDLobby: uint64_steamid, iLobbyData: s32, pchKey: *char, cchKeyBufferSize: s32, pchValue: *char, cchValueBufferSize: s32) -> bool {
    return SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex(steam_matchmaking, steamIDLobby: uint64_steamid, iLobbyData: s32, pchKey: *char, cchKeyBufferSize: s32, pchValue: *char, cchValueBufferSize: s32);
}


SteamMatchmaking_DeleteLobbyData :: inline (steamIDLobby: uint64_steamid, pchKey: *char) -> bool {
    return SteamAPI_ISteamMatchmaking_DeleteLobbyData(steam_matchmaking, steamIDLobby: uint64_steamid, pchKey: *char);
}


SteamMatchmaking_GetLobbyMemberData :: inline (steamIDLobby: uint64_steamid, steamIDUser: uint64_steamid, pchKey: *char) -> *char {
    return SteamAPI_ISteamMatchmaking_GetLobbyMemberData(steam_matchmaking, steamIDLobby: uint64_steamid, steamIDUser: uint64_steamid, pchKey: *char);
}


SteamMatchmaking_SetLobbyMemberData :: inline (steamIDLobby: uint64_steamid, pchKey: *char, pchValue: *char) {
    SteamAPI_ISteamMatchmaking_SetLobbyMemberData(steam_matchmaking, steamIDLobby: uint64_steamid, pchKey: *char, pchValue: *char);
}


SteamMatchmaking_SendLobbyChatMsg :: inline (steamIDLobby: uint64_steamid, pvMsgBody: *void, cubMsgBody: s32) -> bool {
    return SteamAPI_ISteamMatchmaking_SendLobbyChatMsg(steam_matchmaking, steamIDLobby: uint64_steamid, pvMsgBody: *void, cubMsgBody: s32);
}


SteamMatchmaking_GetLobbyChatEntry :: inline (steamIDLobby: uint64_steamid, iChatID: s32, pSteamIDUser: *CSteamID, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 {
    return SteamAPI_ISteamMatchmaking_GetLobbyChatEntry(steam_matchmaking, steamIDLobby: uint64_steamid, iChatID: s32, pSteamIDUser: *CSteamID, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType);
}


SteamMatchmaking_RequestLobbyData :: inline (steamIDLobby: uint64_steamid) -> bool {
    return SteamAPI_ISteamMatchmaking_RequestLobbyData(steam_matchmaking, steamIDLobby: uint64_steamid);
}


SteamMatchmaking_SetLobbyGameServer :: inline (steamIDLobby: uint64_steamid, unGameServerIP: uint32, unGameServerPort: uint16, steamIDGameServer: uint64_steamid) {
    SteamAPI_ISteamMatchmaking_SetLobbyGameServer(steam_matchmaking, steamIDLobby: uint64_steamid, unGameServerIP: uint32, unGameServerPort: uint16, steamIDGameServer: uint64_steamid);
}


SteamMatchmaking_GetLobbyGameServer :: inline (steamIDLobby: uint64_steamid, punGameServerIP: *uint32, punGameServerPort: *uint16, psteamIDGameServer: *CSteamID) -> bool {
    return SteamAPI_ISteamMatchmaking_GetLobbyGameServer(steam_matchmaking, steamIDLobby: uint64_steamid, punGameServerIP: *uint32, punGameServerPort: *uint16, psteamIDGameServer: *CSteamID);
}


SteamMatchmaking_SetLobbyMemberLimit :: inline (steamIDLobby: uint64_steamid, cMaxMembers: s32) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit(steam_matchmaking, steamIDLobby: uint64_steamid, cMaxMembers: s32);
}


SteamMatchmaking_GetLobbyMemberLimit :: inline (steamIDLobby: uint64_steamid) -> s32 {
    return SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit(steam_matchmaking, steamIDLobby: uint64_steamid);
}


SteamMatchmaking_SetLobbyType :: inline (steamIDLobby: uint64_steamid, eLobbyType: ELobbyType) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyType(steam_matchmaking, steamIDLobby: uint64_steamid, eLobbyType: ELobbyType);
}


SteamMatchmaking_SetLobbyJoinable :: inline (steamIDLobby: uint64_steamid, bLobbyJoinable: bool) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyJoinable(steam_matchmaking, steamIDLobby: uint64_steamid, bLobbyJoinable: bool);
}


SteamMatchmaking_GetLobbyOwner :: inline (steamIDLobby: uint64_steamid) -> uint64_steamid {
    return SteamAPI_ISteamMatchmaking_GetLobbyOwner(steam_matchmaking, steamIDLobby: uint64_steamid);
}


SteamMatchmaking_SetLobbyOwner :: inline (steamIDLobby: uint64_steamid, steamIDNewOwner: uint64_steamid) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLobbyOwner(steam_matchmaking, steamIDLobby: uint64_steamid, steamIDNewOwner: uint64_steamid);
}


SteamMatchmaking_SetLinkedLobby :: inline (steamIDLobby: uint64_steamid, steamIDLobbyDependent: uint64_steamid) -> bool {
    return SteamAPI_ISteamMatchmaking_SetLinkedLobby(steam_matchmaking, steamIDLobby: uint64_steamid, steamIDLobbyDependent: uint64_steamid);
}
