steam_friends : *ISteamFriends;
SteamFriends : SteamFriends_Namespace;


#scope_file


SteamFriends_Namespace :: struct {
    // procs
    GetPersonaName                                     :: SteamFriends_GetPersonaName;
    SetPersonaName                                     :: SteamFriends_SetPersonaName;
    GetPersonaState                                    :: SteamFriends_GetPersonaState;
    GetFriendCount                                     :: SteamFriends_GetFriendCount;
    GetFriendByIndex                                   :: SteamFriends_GetFriendByIndex;
    GetFriendRelationship                              :: SteamFriends_GetFriendRelationship;
    GetFriendPersonaState                              :: SteamFriends_GetFriendPersonaState;
    GetFriendPersonaName                               :: SteamFriends_GetFriendPersonaName;
    GetFriendGamePlayed                                :: SteamFriends_GetFriendGamePlayed;
    GetFriendPersonaNameHistory                        :: SteamFriends_GetFriendPersonaNameHistory;
    GetFriendSteamLevel                                :: SteamFriends_GetFriendSteamLevel;
    GetPlayerNickname                                  :: SteamFriends_GetPlayerNickname;
    GetFriendsGroupCount                               :: SteamFriends_GetFriendsGroupCount;
    GetFriendsGroupIDByIndex                           :: SteamFriends_GetFriendsGroupIDByIndex;
    GetFriendsGroupName                                :: SteamFriends_GetFriendsGroupName;
    GetFriendsGroupMembersCount                        :: SteamFriends_GetFriendsGroupMembersCount;
    GetFriendsGroupMembersList                         :: SteamFriends_GetFriendsGroupMembersList;
    HasFriend                                          :: SteamFriends_HasFriend;
    GetClanCount                                       :: SteamFriends_GetClanCount;
    GetClanByIndex                                     :: SteamFriends_GetClanByIndex;
    GetClanName                                        :: SteamFriends_GetClanName;
    GetClanTag                                         :: SteamFriends_GetClanTag;
    GetClanActivityCounts                              :: SteamFriends_GetClanActivityCounts;
    DownloadClanActivityCounts                         :: SteamFriends_DownloadClanActivityCounts;
    GetFriendCountFromSource                           :: SteamFriends_GetFriendCountFromSource;
    GetFriendFromSourceByIndex                         :: SteamFriends_GetFriendFromSourceByIndex;
    IsUserInSource                                     :: SteamFriends_IsUserInSource;
    SetInGameVoiceSpeaking                             :: SteamFriends_SetInGameVoiceSpeaking;
    ActivateGameOverlay                                :: SteamFriends_ActivateGameOverlay;
    ActivateGameOverlayToUser                          :: SteamFriends_ActivateGameOverlayToUser;
    ActivateGameOverlayToWebPage                       :: SteamFriends_ActivateGameOverlayToWebPage;
    ActivateGameOverlayToStore                         :: SteamFriends_ActivateGameOverlayToStore;
    SetPlayedWith                                      :: SteamFriends_SetPlayedWith;
    ActivateGameOverlayInviteDialog                    :: SteamFriends_ActivateGameOverlayInviteDialog;
    GetSmallFriendAvatar                               :: SteamFriends_GetSmallFriendAvatar;
    GetMediumFriendAvatar                              :: SteamFriends_GetMediumFriendAvatar;
    GetLargeFriendAvatar                               :: SteamFriends_GetLargeFriendAvatar;
    RequestUserInformation                             :: SteamFriends_RequestUserInformation;
    RequestClanOfficerList                             :: SteamFriends_RequestClanOfficerList;
    GetClanOwner                                       :: SteamFriends_GetClanOwner;
    GetClanOfficerCount                                :: SteamFriends_GetClanOfficerCount;
    GetClanOfficerByIndex                              :: SteamFriends_GetClanOfficerByIndex;
    GetUserRestrictions                                :: SteamFriends_GetUserRestrictions;
    SetRichPresence                                    :: SteamFriends_SetRichPresence;
    ClearRichPresence                                  :: SteamFriends_ClearRichPresence;
    GetFriendRichPresence                              :: SteamFriends_GetFriendRichPresence;
    GetFriendRichPresenceKeyCount                      :: SteamFriends_GetFriendRichPresenceKeyCount;
    GetFriendRichPresenceKeyByIndex                    :: SteamFriends_GetFriendRichPresenceKeyByIndex;
    RequestFriendRichPresence                          :: SteamFriends_RequestFriendRichPresence;
    InviteUserToGame                                   :: SteamFriends_InviteUserToGame;
    GetCoplayFriendCount                               :: SteamFriends_GetCoplayFriendCount;
    GetCoplayFriend                                    :: SteamFriends_GetCoplayFriend;
    GetFriendCoplayTime                                :: SteamFriends_GetFriendCoplayTime;
    GetFriendCoplayGame                                :: SteamFriends_GetFriendCoplayGame;
    JoinClanChatRoom                                   :: SteamFriends_JoinClanChatRoom;
    LeaveClanChatRoom                                  :: SteamFriends_LeaveClanChatRoom;
    GetClanChatMemberCount                             :: SteamFriends_GetClanChatMemberCount;
    GetChatMemberByIndex                               :: SteamFriends_GetChatMemberByIndex;
    SendClanChatMessage                                :: SteamFriends_SendClanChatMessage;
    GetClanChatMessage                                 :: SteamFriends_GetClanChatMessage;
    IsClanChatAdmin                                    :: SteamFriends_IsClanChatAdmin;
    IsClanChatWindowOpenInSteam                        :: SteamFriends_IsClanChatWindowOpenInSteam;
    OpenClanChatWindowInSteam                          :: SteamFriends_OpenClanChatWindowInSteam;
    CloseClanChatWindowInSteam                         :: SteamFriends_CloseClanChatWindowInSteam;
    SetListenForFriendsMessages                        :: SteamFriends_SetListenForFriendsMessages;
    ReplyToFriendMessage                               :: SteamFriends_ReplyToFriendMessage;
    GetFriendMessage                                   :: SteamFriends_GetFriendMessage;
    GetFollowerCount                                   :: SteamFriends_GetFollowerCount;
    IsFollowing                                        :: SteamFriends_IsFollowing;
    EnumerateFollowingList                             :: SteamFriends_EnumerateFollowingList;
    IsClanPublic                                       :: SteamFriends_IsClanPublic;
    IsClanOfficialGameGroup                            :: SteamFriends_IsClanOfficialGameGroup;
    GetNumChatsWithUnreadPriorityMessages              :: SteamFriends_GetNumChatsWithUnreadPriorityMessages;
    ActivateGameOverlayRemotePlayTogetherInviteDialog  :: SteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog;
    RegisterProtocolInOverlayBrowser                   :: SteamFriends_RegisterProtocolInOverlayBrowser;
}


SteamFriends_GetPersonaName :: inline () -> string {
    return to_string(SteamAPI_ISteamFriends_GetPersonaName(steam_friends));
}


SteamFriends_SetPersonaName :: inline (pchPersonaName: *char) -> SteamAPICall_t #must {
    return SteamAPI_ISteamFriends_SetPersonaName(steam_friends, pchPersonaName);
}


SteamFriends_GetPersonaState :: inline () -> EPersonaState {
    return SteamAPI_ISteamFriends_GetPersonaState(steam_friends);
}


SteamFriends_GetFriendCount :: inline (iFriendFlags: s32) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendCount(steam_friends, iFriendFlags);
}


SteamFriends_GetFriendByIndex :: inline (iFriend: s32, iFriendFlags: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetFriendByIndex(steam_friends, iFriend, iFriendFlags);
}


SteamFriends_GetFriendRelationship :: inline (steamIDFriend: uint64_steamid) -> EFriendRelationship {
    return SteamAPI_ISteamFriends_GetFriendRelationship(steam_friends, steamIDFriend);
}


SteamFriends_GetFriendPersonaState :: inline (steamIDFriend: uint64_steamid) -> EPersonaState {
    return SteamAPI_ISteamFriends_GetFriendPersonaState(steam_friends, steamIDFriend);
}


SteamFriends_GetFriendPersonaName :: inline (steamIDFriend: uint64_steamid) -> string {
    return to_string(SteamAPI_ISteamFriends_GetFriendPersonaName(steam_friends, steamIDFriend));
}


SteamFriends_GetFriendGamePlayed :: inline (steamIDFriend: uint64_steamid, pFriendGameInfo: *FriendGameInfo_t) -> bool {
    return SteamAPI_ISteamFriends_GetFriendGamePlayed(steam_friends, steamIDFriend, pFriendGameInfo);
}


SteamFriends_GetFriendPersonaNameHistory :: inline (steamIDFriend: uint64_steamid, iPersonaName: s32) -> string {
    return to_string(SteamAPI_ISteamFriends_GetFriendPersonaNameHistory(steam_friends, steamIDFriend, iPersonaName));
}


SteamFriends_GetFriendSteamLevel :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendSteamLevel(steam_friends, steamIDFriend);
}


SteamFriends_GetPlayerNickname :: inline (steamIDPlayer: uint64_steamid) -> string {
    return to_string(SteamAPI_ISteamFriends_GetPlayerNickname(steam_friends, steamIDPlayer));
}


SteamFriends_GetFriendsGroupCount :: inline () -> s32 {
    return SteamAPI_ISteamFriends_GetFriendsGroupCount(steam_friends);
}


SteamFriends_GetFriendsGroupIDByIndex :: inline (iFG: s32) -> FriendsGroupID_t {
    return SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex(steam_friends, iFG);
}


SteamFriends_GetFriendsGroupName :: inline (friendsGroupID: FriendsGroupID_t) -> string {
    return to_string(SteamAPI_ISteamFriends_GetFriendsGroupName(steam_friends, friendsGroupID));
}


SteamFriends_GetFriendsGroupMembersCount :: inline (friendsGroupID: FriendsGroupID_t) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendsGroupMembersCount(steam_friends, friendsGroupID);
}


SteamFriends_GetFriendsGroupMembersList :: inline (friendsGroupID: FriendsGroupID_t, pOutSteamIDMembers: *CSteamID, nMembersCount: s32) {
    SteamAPI_ISteamFriends_GetFriendsGroupMembersList(steam_friends, friendsGroupID, pOutSteamIDMembers, nMembersCount);
}


SteamFriends_HasFriend :: inline (steamIDFriend: uint64_steamid, iFriendFlags: s32) -> bool {
    return SteamAPI_ISteamFriends_HasFriend(steam_friends, steamIDFriend, iFriendFlags);
}


SteamFriends_GetClanCount :: inline () -> s32 {
    return SteamAPI_ISteamFriends_GetClanCount(steam_friends);
}


SteamFriends_GetClanByIndex :: inline (iClan: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetClanByIndex(steam_friends, iClan);
}


SteamFriends_GetClanName :: inline (steamIDClan: uint64_steamid) -> string {
    return to_string(SteamAPI_ISteamFriends_GetClanName(steam_friends, steamIDClan));
}


SteamFriends_GetClanTag :: inline (steamIDClan: uint64_steamid) -> string {
    return to_string(SteamAPI_ISteamFriends_GetClanTag(steam_friends, steamIDClan));
}


SteamFriends_GetClanActivityCounts :: inline (steamIDClan: uint64_steamid, pnOnline: *s32, pnInGame: *s32, pnChatting: *s32) -> bool {
    return SteamAPI_ISteamFriends_GetClanActivityCounts(steam_friends, steamIDClan, pnOnline, pnInGame, pnChatting);
}


SteamFriends_DownloadClanActivityCounts :: inline (psteamIDClans: *CSteamID, cClansToRequest: s32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamFriends_DownloadClanActivityCounts(steam_friends, psteamIDClans, cClansToRequest);
}


SteamFriends_GetFriendCountFromSource :: inline (steamIDSource: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendCountFromSource(steam_friends, steamIDSource);
}


SteamFriends_GetFriendFromSourceByIndex :: inline (steamIDSource: uint64_steamid, iFriend: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetFriendFromSourceByIndex(steam_friends, steamIDSource, iFriend);
}


SteamFriends_IsUserInSource :: inline (steamIDUser: uint64_steamid, steamIDSource: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsUserInSource(steam_friends, steamIDUser, steamIDSource);
}


SteamFriends_SetInGameVoiceSpeaking :: inline (steamIDUser: uint64_steamid, bSpeaking: bool) {
    SteamAPI_ISteamFriends_SetInGameVoiceSpeaking(steam_friends, steamIDUser, bSpeaking);
}


SteamFriends_ActivateGameOverlay :: inline (pchDialog: *char) {
    SteamAPI_ISteamFriends_ActivateGameOverlay(steam_friends, pchDialog);
}


SteamFriends_ActivateGameOverlayToUser :: inline (pchDialog: *char, steamID: uint64_steamid) {
    SteamAPI_ISteamFriends_ActivateGameOverlayToUser(steam_friends, pchDialog, steamID);
}


SteamFriends_ActivateGameOverlayToWebPage :: inline (pchURL: *char, eMode: EActivateGameOverlayToWebPageMode) {
    SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage(steam_friends, pchURL, eMode);
}


SteamFriends_ActivateGameOverlayToStore :: inline (nAppID: AppId_t, eFlag: EOverlayToStoreFlag) {
    SteamAPI_ISteamFriends_ActivateGameOverlayToStore(steam_friends, nAppID, eFlag);
}


SteamFriends_SetPlayedWith :: inline (steamIDUserPlayedWith: uint64_steamid) {
    SteamAPI_ISteamFriends_SetPlayedWith(steam_friends, steamIDUserPlayedWith);
}


SteamFriends_ActivateGameOverlayInviteDialog :: inline (steamIDLobby: uint64_steamid) {
    SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog(steam_friends, steamIDLobby);
}


SteamFriends_GetSmallFriendAvatar :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetSmallFriendAvatar(steam_friends, steamIDFriend);
}


SteamFriends_GetMediumFriendAvatar :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetMediumFriendAvatar(steam_friends, steamIDFriend);
}


SteamFriends_GetLargeFriendAvatar :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetLargeFriendAvatar(steam_friends, steamIDFriend);
}


SteamFriends_RequestUserInformation :: inline (steamIDUser: uint64_steamid, bRequireNameOnly: bool) -> bool {
    return SteamAPI_ISteamFriends_RequestUserInformation(steam_friends, steamIDUser, bRequireNameOnly);
}


SteamFriends_RequestClanOfficerList :: inline (steamIDClan: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamFriends_RequestClanOfficerList(steam_friends, steamIDClan);
}


SteamFriends_GetClanOwner :: inline (steamIDClan: uint64_steamid) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetClanOwner(steam_friends, steamIDClan);
}


SteamFriends_GetClanOfficerCount :: inline (steamIDClan: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetClanOfficerCount(steam_friends, steamIDClan);
}


SteamFriends_GetClanOfficerByIndex :: inline (steamIDClan: uint64_steamid, iOfficer: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetClanOfficerByIndex(steam_friends, steamIDClan, iOfficer);
}


SteamFriends_GetUserRestrictions :: inline () -> uint32 {
    return SteamAPI_ISteamFriends_GetUserRestrictions(steam_friends);
}


SteamFriends_SetRichPresence :: inline (pchKey: *char, pchValue: *char) -> bool {
    return SteamAPI_ISteamFriends_SetRichPresence(steam_friends, pchKey, pchValue);
}


SteamFriends_ClearRichPresence :: inline () {
    SteamAPI_ISteamFriends_ClearRichPresence(steam_friends);
}


SteamFriends_GetFriendRichPresence :: inline (steamIDFriend: uint64_steamid, pchKey: *char) -> string {
    return to_string(SteamAPI_ISteamFriends_GetFriendRichPresence(steam_friends, steamIDFriend, pchKey));
}


SteamFriends_GetFriendRichPresenceKeyCount :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount(steam_friends, steamIDFriend);
}


SteamFriends_GetFriendRichPresenceKeyByIndex :: inline (steamIDFriend: uint64_steamid, iKey: s32) -> string {
    return to_string(SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex(steam_friends, steamIDFriend, iKey));
}


SteamFriends_RequestFriendRichPresence :: inline (steamIDFriend: uint64_steamid) {
    SteamAPI_ISteamFriends_RequestFriendRichPresence(steam_friends, steamIDFriend);
}


SteamFriends_InviteUserToGame :: inline (steamIDFriend: uint64_steamid, pchConnectString: *char) -> bool {
    return SteamAPI_ISteamFriends_InviteUserToGame(steam_friends, steamIDFriend, pchConnectString);
}


SteamFriends_GetCoplayFriendCount :: inline () -> s32 {
    return SteamAPI_ISteamFriends_GetCoplayFriendCount(steam_friends);
}


SteamFriends_GetCoplayFriend :: inline (iCoplayFriend: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetCoplayFriend(steam_friends, iCoplayFriend);
}


SteamFriends_GetFriendCoplayTime :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendCoplayTime(steam_friends, steamIDFriend);
}


SteamFriends_GetFriendCoplayGame :: inline (steamIDFriend: uint64_steamid) -> AppId_t {
    return SteamAPI_ISteamFriends_GetFriendCoplayGame(steam_friends, steamIDFriend);
}


SteamFriends_JoinClanChatRoom :: inline (steamIDClan: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamFriends_JoinClanChatRoom(steam_friends, steamIDClan);
}


SteamFriends_LeaveClanChatRoom :: inline (steamIDClan: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_LeaveClanChatRoom(steam_friends, steamIDClan);
}


SteamFriends_GetClanChatMemberCount :: inline (steamIDClan: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetClanChatMemberCount(steam_friends, steamIDClan);
}


SteamFriends_GetChatMemberByIndex :: inline (steamIDClan: uint64_steamid, iUser: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetChatMemberByIndex(steam_friends, steamIDClan, iUser);
}


SteamFriends_SendClanChatMessage :: inline (steamIDClanChat: uint64_steamid, pchText: *char) -> bool {
    return SteamAPI_ISteamFriends_SendClanChatMessage(steam_friends, steamIDClanChat, pchText);
}


SteamFriends_GetClanChatMessage :: inline (steamIDClanChat: uint64_steamid, iMessage: s32, prgchText: *void, cchTextMax: s32, peChatEntryType: *EChatEntryType, psteamidChatter: *CSteamID) -> s32 {
    return SteamAPI_ISteamFriends_GetClanChatMessage(steam_friends, steamIDClanChat, iMessage, prgchText, cchTextMax, peChatEntryType, psteamidChatter);
}


SteamFriends_IsClanChatAdmin :: inline (steamIDClanChat: uint64_steamid, steamIDUser: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsClanChatAdmin(steam_friends, steamIDClanChat, steamIDUser);
}


SteamFriends_IsClanChatWindowOpenInSteam :: inline (steamIDClanChat: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam(steam_friends, steamIDClanChat);
}


SteamFriends_OpenClanChatWindowInSteam :: inline (steamIDClanChat: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_OpenClanChatWindowInSteam(steam_friends, steamIDClanChat);
}


SteamFriends_CloseClanChatWindowInSteam :: inline (steamIDClanChat: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_CloseClanChatWindowInSteam(steam_friends, steamIDClanChat);
}


SteamFriends_SetListenForFriendsMessages :: inline (bInterceptEnabled: bool) -> bool {
    return SteamAPI_ISteamFriends_SetListenForFriendsMessages(steam_friends, bInterceptEnabled);
}


SteamFriends_ReplyToFriendMessage :: inline (steamIDFriend: uint64_steamid, pchMsgToSend: *char) -> bool {
    return SteamAPI_ISteamFriends_ReplyToFriendMessage(steam_friends, steamIDFriend, pchMsgToSend);
}


SteamFriends_GetFriendMessage :: inline (steamIDFriend: uint64_steamid, iMessageID: s32, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendMessage(steam_friends, steamIDFriend, iMessageID, pvData, cubData, peChatEntryType);
}


SteamFriends_GetFollowerCount :: inline (steamID: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamFriends_GetFollowerCount(steam_friends, steamID);
}


SteamFriends_IsFollowing :: inline (steamID: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamFriends_IsFollowing(steam_friends, steamID);
}


SteamFriends_EnumerateFollowingList :: inline (unStartIndex: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamFriends_EnumerateFollowingList(steam_friends, unStartIndex);
}


SteamFriends_IsClanPublic :: inline (steamIDClan: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsClanPublic(steam_friends, steamIDClan);
}


SteamFriends_IsClanOfficialGameGroup :: inline (steamIDClan: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsClanOfficialGameGroup(steam_friends, steamIDClan);
}


SteamFriends_GetNumChatsWithUnreadPriorityMessages :: inline () -> s32 {
    return SteamAPI_ISteamFriends_GetNumChatsWithUnreadPriorityMessages(steam_friends);
}


SteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog :: inline (steamIDLobby: uint64_steamid) {
    SteamAPI_ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog(steam_friends, steamIDLobby);
}


SteamFriends_RegisterProtocolInOverlayBrowser :: inline (pchProtocol: *char) -> bool {
    return SteamAPI_ISteamFriends_RegisterProtocolInOverlayBrowser(steam_friends, pchProtocol);
}
