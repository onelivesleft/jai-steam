steam_friends : *ISteamFriends;


GetPersonaName :: inline () -> string {
    return to_string(SteamAPI_ISteamFriends_GetPersonaName(steam_friends));
}


SetPersonaName :: inline (pchPersonaName: *char) -> SteamAPICall_t #must {
    return SteamAPI_ISteamFriends_SetPersonaName(steam_friends, pchPersonaName);
}

SetPersonaName :: inline (pchPersonaName: *char, callback: (SetPersonaNameResponse_t, bool) -> ()) {
    RegisterCallResult(
        SetPersonaName(pchPersonaName),
        callback
    );
}

SetPersonaName :: (pchPersonaName: *char, code: Code) #expand {
    RegisterCallResult(
        SetPersonaName(pchPersonaName),
        (result: SetPersonaNameResponse_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


GetPersonaState :: inline () -> EPersonaState {
    return SteamAPI_ISteamFriends_GetPersonaState(steam_friends);
}


GetFriendCount :: inline (iFriendFlags: s32) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendCount(steam_friends, iFriendFlags);
}


GetFriendByIndex :: inline (iFriend: s32, iFriendFlags: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetFriendByIndex(steam_friends, iFriend, iFriendFlags);
}


GetFriendRelationship :: inline (steamIDFriend: uint64_steamid) -> EFriendRelationship {
    return SteamAPI_ISteamFriends_GetFriendRelationship(steam_friends, steamIDFriend);
}


GetFriendPersonaState :: inline (steamIDFriend: uint64_steamid) -> EPersonaState {
    return SteamAPI_ISteamFriends_GetFriendPersonaState(steam_friends, steamIDFriend);
}


GetFriendPersonaName :: inline (steamIDFriend: uint64_steamid) -> string {
    return to_string(SteamAPI_ISteamFriends_GetFriendPersonaName(steam_friends, steamIDFriend));
}


GetFriendGamePlayed :: inline (steamIDFriend: uint64_steamid, pFriendGameInfo: *FriendGameInfo_t) -> bool {
    return SteamAPI_ISteamFriends_GetFriendGamePlayed(steam_friends, steamIDFriend, pFriendGameInfo);
}


GetFriendPersonaNameHistory :: inline (steamIDFriend: uint64_steamid, iPersonaName: s32) -> string {
    return to_string(SteamAPI_ISteamFriends_GetFriendPersonaNameHistory(steam_friends, steamIDFriend, iPersonaName));
}


GetFriendSteamLevel :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendSteamLevel(steam_friends, steamIDFriend);
}


GetPlayerNickname :: inline (steamIDPlayer: uint64_steamid) -> string {
    return to_string(SteamAPI_ISteamFriends_GetPlayerNickname(steam_friends, steamIDPlayer));
}


GetFriendsGroupCount :: inline () -> s32 {
    return SteamAPI_ISteamFriends_GetFriendsGroupCount(steam_friends);
}


GetFriendsGroupIDByIndex :: inline (iFG: s32) -> FriendsGroupID_t {
    return SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex(steam_friends, iFG);
}


GetFriendsGroupName :: inline (friendsGroupID: FriendsGroupID_t) -> string {
    return to_string(SteamAPI_ISteamFriends_GetFriendsGroupName(steam_friends, friendsGroupID));
}


GetFriendsGroupMembersCount :: inline (friendsGroupID: FriendsGroupID_t) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendsGroupMembersCount(steam_friends, friendsGroupID);
}


GetFriendsGroupMembersList :: inline (friendsGroupID: FriendsGroupID_t, pOutSteamIDMembers: *CSteamID, nMembersCount: s32) {
    SteamAPI_ISteamFriends_GetFriendsGroupMembersList(steam_friends, friendsGroupID, pOutSteamIDMembers, nMembersCount);
}


HasFriend :: inline (steamIDFriend: uint64_steamid, iFriendFlags: s32) -> bool {
    return SteamAPI_ISteamFriends_HasFriend(steam_friends, steamIDFriend, iFriendFlags);
}


GetClanCount :: inline () -> s32 {
    return SteamAPI_ISteamFriends_GetClanCount(steam_friends);
}


GetClanByIndex :: inline (iClan: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetClanByIndex(steam_friends, iClan);
}


GetClanName :: inline (steamIDClan: uint64_steamid) -> string {
    return to_string(SteamAPI_ISteamFriends_GetClanName(steam_friends, steamIDClan));
}


GetClanTag :: inline (steamIDClan: uint64_steamid) -> string {
    return to_string(SteamAPI_ISteamFriends_GetClanTag(steam_friends, steamIDClan));
}


GetClanActivityCounts :: inline (steamIDClan: uint64_steamid, pnOnline: *s32, pnInGame: *s32, pnChatting: *s32) -> bool {
    return SteamAPI_ISteamFriends_GetClanActivityCounts(steam_friends, steamIDClan, pnOnline, pnInGame, pnChatting);
}


DownloadClanActivityCounts :: inline (psteamIDClans: *CSteamID, cClansToRequest: s32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamFriends_DownloadClanActivityCounts(steam_friends, psteamIDClans, cClansToRequest);
}

DownloadClanActivityCounts :: inline (psteamIDClans: *CSteamID, cClansToRequest: s32, callback: (DownloadClanActivityCountsResult_t, bool) -> ()) {
    RegisterCallResult(
        DownloadClanActivityCounts(psteamIDClans, cClansToRequest),
        callback
    );
}

DownloadClanActivityCounts :: (psteamIDClans: *CSteamID, cClansToRequest: s32, code: Code) #expand {
    RegisterCallResult(
        DownloadClanActivityCounts(psteamIDClans, cClansToRequest),
        (result: DownloadClanActivityCountsResult_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


GetFriendCountFromSource :: inline (steamIDSource: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendCountFromSource(steam_friends, steamIDSource);
}


GetFriendFromSourceByIndex :: inline (steamIDSource: uint64_steamid, iFriend: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetFriendFromSourceByIndex(steam_friends, steamIDSource, iFriend);
}


IsUserInSource :: inline (steamIDUser: uint64_steamid, steamIDSource: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsUserInSource(steam_friends, steamIDUser, steamIDSource);
}


SetInGameVoiceSpeaking :: inline (steamIDUser: uint64_steamid, bSpeaking: bool) {
    SteamAPI_ISteamFriends_SetInGameVoiceSpeaking(steam_friends, steamIDUser, bSpeaking);
}


ActivateGameOverlay :: inline (pchDialog: *char) {
    SteamAPI_ISteamFriends_ActivateGameOverlay(steam_friends, pchDialog);
}


ActivateGameOverlayToUser :: inline (pchDialog: *char, steamID: uint64_steamid) {
    SteamAPI_ISteamFriends_ActivateGameOverlayToUser(steam_friends, pchDialog, steamID);
}


ActivateGameOverlayToWebPage :: inline (pchURL: *char, eMode: EActivateGameOverlayToWebPageMode) {
    SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage(steam_friends, pchURL, eMode);
}


ActivateGameOverlayToStore :: inline (nAppID: AppId_t, eFlag: EOverlayToStoreFlag) {
    SteamAPI_ISteamFriends_ActivateGameOverlayToStore(steam_friends, nAppID, eFlag);
}


SetPlayedWith :: inline (steamIDUserPlayedWith: uint64_steamid) {
    SteamAPI_ISteamFriends_SetPlayedWith(steam_friends, steamIDUserPlayedWith);
}


ActivateGameOverlayInviteDialog :: inline (steamIDLobby: uint64_steamid) {
    SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog(steam_friends, steamIDLobby);
}


GetSmallFriendAvatar :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetSmallFriendAvatar(steam_friends, steamIDFriend);
}


GetMediumFriendAvatar :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetMediumFriendAvatar(steam_friends, steamIDFriend);
}


GetLargeFriendAvatar :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetLargeFriendAvatar(steam_friends, steamIDFriend);
}


RequestUserInformation :: inline (steamIDUser: uint64_steamid, bRequireNameOnly: bool) -> bool {
    return SteamAPI_ISteamFriends_RequestUserInformation(steam_friends, steamIDUser, bRequireNameOnly);
}


RequestClanOfficerList :: inline (steamIDClan: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamFriends_RequestClanOfficerList(steam_friends, steamIDClan);
}

RequestClanOfficerList :: inline (steamIDClan: uint64_steamid, callback: (ClanOfficerListResponse_t, bool) -> ()) {
    RegisterCallResult(
        RequestClanOfficerList(steamIDClan),
        callback
    );
}

RequestClanOfficerList :: (steamIDClan: uint64_steamid, code: Code) #expand {
    RegisterCallResult(
        RequestClanOfficerList(steamIDClan),
        (result: ClanOfficerListResponse_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


GetClanOwner :: inline (steamIDClan: uint64_steamid) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetClanOwner(steam_friends, steamIDClan);
}


GetClanOfficerCount :: inline (steamIDClan: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetClanOfficerCount(steam_friends, steamIDClan);
}


GetClanOfficerByIndex :: inline (steamIDClan: uint64_steamid, iOfficer: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetClanOfficerByIndex(steam_friends, steamIDClan, iOfficer);
}


GetUserRestrictions :: inline () -> uint32 {
    return SteamAPI_ISteamFriends_GetUserRestrictions(steam_friends);
}


SetRichPresence :: inline (pchKey: *char, pchValue: *char) -> bool {
    return SteamAPI_ISteamFriends_SetRichPresence(steam_friends, pchKey, pchValue);
}


ClearRichPresence :: inline () {
    SteamAPI_ISteamFriends_ClearRichPresence(steam_friends);
}


GetFriendRichPresence :: inline (steamIDFriend: uint64_steamid, pchKey: *char) -> string {
    return to_string(SteamAPI_ISteamFriends_GetFriendRichPresence(steam_friends, steamIDFriend, pchKey));
}


GetFriendRichPresenceKeyCount :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount(steam_friends, steamIDFriend);
}


GetFriendRichPresenceKeyByIndex :: inline (steamIDFriend: uint64_steamid, iKey: s32) -> string {
    return to_string(SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex(steam_friends, steamIDFriend, iKey));
}


RequestFriendRichPresence :: inline (steamIDFriend: uint64_steamid) {
    SteamAPI_ISteamFriends_RequestFriendRichPresence(steam_friends, steamIDFriend);
}


InviteUserToGame :: inline (steamIDFriend: uint64_steamid, pchConnectString: *char) -> bool {
    return SteamAPI_ISteamFriends_InviteUserToGame(steam_friends, steamIDFriend, pchConnectString);
}


GetCoplayFriendCount :: inline () -> s32 {
    return SteamAPI_ISteamFriends_GetCoplayFriendCount(steam_friends);
}


GetCoplayFriend :: inline (iCoplayFriend: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetCoplayFriend(steam_friends, iCoplayFriend);
}


GetFriendCoplayTime :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendCoplayTime(steam_friends, steamIDFriend);
}


GetFriendCoplayGame :: inline (steamIDFriend: uint64_steamid) -> AppId_t {
    return SteamAPI_ISteamFriends_GetFriendCoplayGame(steam_friends, steamIDFriend);
}


JoinClanChatRoom :: inline (steamIDClan: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamFriends_JoinClanChatRoom(steam_friends, steamIDClan);
}

JoinClanChatRoom :: inline (steamIDClan: uint64_steamid, callback: (JoinClanChatRoomCompletionResult_t, bool) -> ()) {
    RegisterCallResult(
        JoinClanChatRoom(steamIDClan),
        callback
    );
}

JoinClanChatRoom :: (steamIDClan: uint64_steamid, code: Code) #expand {
    RegisterCallResult(
        JoinClanChatRoom(steamIDClan),
        (result: JoinClanChatRoomCompletionResult_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


LeaveClanChatRoom :: inline (steamIDClan: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_LeaveClanChatRoom(steam_friends, steamIDClan);
}


GetClanChatMemberCount :: inline (steamIDClan: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetClanChatMemberCount(steam_friends, steamIDClan);
}


GetChatMemberByIndex :: inline (steamIDClan: uint64_steamid, iUser: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetChatMemberByIndex(steam_friends, steamIDClan, iUser);
}


SendClanChatMessage :: inline (steamIDClanChat: uint64_steamid, pchText: *char) -> bool {
    return SteamAPI_ISteamFriends_SendClanChatMessage(steam_friends, steamIDClanChat, pchText);
}


GetClanChatMessage :: inline (steamIDClanChat: uint64_steamid, iMessage: s32, prgchText: *void, cchTextMax: s32, peChatEntryType: *EChatEntryType, psteamidChatter: *CSteamID) -> s32 {
    return SteamAPI_ISteamFriends_GetClanChatMessage(steam_friends, steamIDClanChat, iMessage, prgchText, cchTextMax, peChatEntryType, psteamidChatter);
}


IsClanChatAdmin :: inline (steamIDClanChat: uint64_steamid, steamIDUser: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsClanChatAdmin(steam_friends, steamIDClanChat, steamIDUser);
}


IsClanChatWindowOpenInSteam :: inline (steamIDClanChat: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam(steam_friends, steamIDClanChat);
}


OpenClanChatWindowInSteam :: inline (steamIDClanChat: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_OpenClanChatWindowInSteam(steam_friends, steamIDClanChat);
}


CloseClanChatWindowInSteam :: inline (steamIDClanChat: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_CloseClanChatWindowInSteam(steam_friends, steamIDClanChat);
}


SetListenForFriendsMessages :: inline (bInterceptEnabled: bool) -> bool {
    return SteamAPI_ISteamFriends_SetListenForFriendsMessages(steam_friends, bInterceptEnabled);
}


ReplyToFriendMessage :: inline (steamIDFriend: uint64_steamid, pchMsgToSend: *char) -> bool {
    return SteamAPI_ISteamFriends_ReplyToFriendMessage(steam_friends, steamIDFriend, pchMsgToSend);
}


GetFriendMessage :: inline (steamIDFriend: uint64_steamid, iMessageID: s32, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendMessage(steam_friends, steamIDFriend, iMessageID, pvData, cubData, peChatEntryType);
}


GetFollowerCount :: inline (steamID: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamFriends_GetFollowerCount(steam_friends, steamID);
}

GetFollowerCount :: inline (steamID: uint64_steamid, callback: (FriendsGetFollowerCount_t, bool) -> ()) {
    RegisterCallResult(
        GetFollowerCount(steamID),
        callback
    );
}

GetFollowerCount :: (steamID: uint64_steamid, code: Code) #expand {
    RegisterCallResult(
        GetFollowerCount(steamID),
        (result: FriendsGetFollowerCount_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


IsFollowing :: inline (steamID: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamFriends_IsFollowing(steam_friends, steamID);
}

IsFollowing :: inline (steamID: uint64_steamid, callback: (FriendsIsFollowing_t, bool) -> ()) {
    RegisterCallResult(
        IsFollowing(steamID),
        callback
    );
}

IsFollowing :: (steamID: uint64_steamid, code: Code) #expand {
    RegisterCallResult(
        IsFollowing(steamID),
        (result: FriendsIsFollowing_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


EnumerateFollowingList :: inline (unStartIndex: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamFriends_EnumerateFollowingList(steam_friends, unStartIndex);
}

EnumerateFollowingList :: inline (unStartIndex: uint32, callback: (FriendsEnumerateFollowingList_t, bool) -> ()) {
    RegisterCallResult(
        EnumerateFollowingList(unStartIndex),
        callback
    );
}

EnumerateFollowingList :: (unStartIndex: uint32, code: Code) #expand {
    RegisterCallResult(
        EnumerateFollowingList(unStartIndex),
        (result: FriendsEnumerateFollowingList_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


IsClanPublic :: inline (steamIDClan: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsClanPublic(steam_friends, steamIDClan);
}


IsClanOfficialGameGroup :: inline (steamIDClan: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsClanOfficialGameGroup(steam_friends, steamIDClan);
}


GetNumChatsWithUnreadPriorityMessages :: inline () -> s32 {
    return SteamAPI_ISteamFriends_GetNumChatsWithUnreadPriorityMessages(steam_friends);
}


ActivateGameOverlayRemotePlayTogetherInviteDialog :: inline (steamIDLobby: uint64_steamid) {
    SteamAPI_ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog(steam_friends, steamIDLobby);
}


RegisterProtocolInOverlayBrowser :: inline (pchProtocol: *char) -> bool {
    return SteamAPI_ISteamFriends_RegisterProtocolInOverlayBrowser(steam_friends, pchProtocol);
}


ActivateGameOverlayInviteDialogConnectString :: inline (pchConnectString: *char) {
    SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialogConnectString(steam_friends, pchConnectString);
}
