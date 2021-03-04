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


SteamFriends_GetPersonaName :: inline () -> *char #foreign steam "SteamAPI_ISteamFriends_ {
    return SteamFriends_GetPersonaName(steam_friends);
}


SteamFriends_SetPersonaName :: inline (pchPersonaName: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamFriends_ {
    return SteamFriends_SetPersonaName(steam_friends, pchPersonaName);
}


SteamFriends_GetPersonaState :: inline () -> EPersonaState #foreign steam "SteamAPI_ISteamFriends_G {
    return SteamFriends_GetPersonaState(steam_friends);
}


SteamFriends_GetFriendCount :: inline (iFriendFlags: s32) -> s32 #foreign steam "SteamAPI_ISteamFriends_ {
    return SteamFriends_GetFriendCount(steam_friends, iFriendFlags);
}


SteamFriends_GetFriendByIndex :: inline (iFriend: s32, iFriendFlags: s32) -> uint64_steamid #foreign steam "SteamAPI_ISteamFriends_Ge {
    return SteamFriends_GetFriendByIndex(steam_friends, iFriend, iFriendFlags);
}


SteamFriends_GetFriendRelationship :: inline (steamIDFriend: uint64_steamid) -> EFriendRelationship #foreign steam "SteamAPI_ISteamFriends_GetFrie {
    return SteamFriends_GetFriendRelationship(steam_friends, steamIDFriend);
}


SteamFriends_GetFriendPersonaState :: inline (steamIDFriend: uint64_steamid) -> EPersonaState #foreign steam "SteamAPI_ISteamFriends_GetFrie {
    return SteamFriends_GetFriendPersonaState(steam_friends, steamIDFriend);
}


SteamFriends_GetFriendPersonaName :: inline (steamIDFriend: uint64_steamid) -> *char #foreign steam "SteamAPI_ISteamFriends_GetFri {
    return SteamFriends_GetFriendPersonaName(steam_friends, steamIDFriend);
}


SteamFriends_GetFriendGamePlayed :: inline (steamIDFriend: uint64_steamid, pFriendGameInfo: *FriendGameInfo_t) -> bool #foreign steam "SteamAPI_ISteamFriends_GetFr {
    return SteamFriends_GetFriendGamePlayed(steam_friends, steamIDFriend, pFriendGameInfo);
}


SteamFriends_GetFriendPersonaNameHistory :: inline (steamIDFriend: uint64_steamid, iPersonaName: s32) -> *char #foreign steam "SteamAPI_ISteamFriends_GetFriendPers {
    return SteamFriends_GetFriendPersonaNameHistory(steam_friends, steamIDFriend, iPersonaName);
}


SteamFriends_GetFriendSteamLevel :: inline (steamIDFriend: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetFr {
    return SteamFriends_GetFriendSteamLevel(steam_friends, steamIDFriend);
}


SteamFriends_GetPlayerNickname :: inline (steamIDPlayer: uint64_steamid) -> *char #foreign steam "SteamAPI_ISteamFriends_Get {
    return SteamFriends_GetPlayerNickname(steam_friends, steamIDPlayer);
}


SteamFriends_GetFriendsGroupCount :: inline () -> s32 #foreign steam "SteamAPI_ISteamFriends_GetFri {
    return SteamFriends_GetFriendsGroupCount(steam_friends);
}


SteamFriends_GetFriendsGroupIDByIndex :: inline (iFG: s32) -> FriendsGroupID_t #foreign steam "SteamAPI_ISteamFriends_GetFriends {
    return SteamFriends_GetFriendsGroupIDByIndex(steam_friends, iFG);
}


SteamFriends_GetFriendsGroupName :: inline (friendsGroupID: FriendsGroupID_t) -> *char #foreign steam "SteamAPI_ISteamFriends_GetFr {
    return SteamFriends_GetFriendsGroupName(steam_friends, friendsGroupID);
}


SteamFriends_GetFriendsGroupMembersCount :: inline (friendsGroupID: FriendsGroupID_t) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetFriendsGro {
    return SteamFriends_GetFriendsGroupMembersCount(steam_friends, friendsGroupID);
}


SteamFriends_GetFriendsGroupMembersList :: inline (friendsGroupID: FriendsGroupID_t, pOutSteamIDMembers: *CSteamID, nMembersCount: s32) {
    SteamFriends_GetFriendsGroupMembersList(steam_friends, friendsGroupID, pOutSteamIDMembers, nMembersCount);
}


SteamFriends_HasFriend :: inline (steamIDFriend: uint64_steamid, iFriendFlags: s32) -> bool #foreign steam "SteamAPI_ISteamFri {
    return SteamFriends_HasFriend(steam_friends, steamIDFriend, iFriendFlags);
}


SteamFriends_GetClanCount :: inline () -> s32 #foreign steam "SteamAPI_ISteamFriend {
    return SteamFriends_GetClanCount(steam_friends);
}


SteamFriends_GetClanByIndex :: inline (iClan: s32) -> uint64_steamid #foreign steam "SteamAPI_ISteamFriends_ {
    return SteamFriends_GetClanByIndex(steam_friends, iClan);
}


SteamFriends_GetClanName :: inline (steamIDClan: uint64_steamid) -> *char #foreign steam "SteamAPI_ISteamFrien {
    return SteamFriends_GetClanName(steam_friends, steamIDClan);
}


SteamFriends_GetClanTag :: inline (steamIDClan: uint64_steamid) -> *char #foreign steam "SteamAPI_ISteamFrie {
    return SteamFriends_GetClanTag(steam_friends, steamIDClan);
}


SteamFriends_GetClanActivityCounts :: inline (steamIDClan: uint64_steamid, pnOnline: *s32, pnInGame: *s32, pnChatting: *s32) -> bool #foreign steam "SteamAPI_ISteamFriends_GetClan {
    return SteamFriends_GetClanActivityCounts(steam_friends, steamIDClan, pnOnline, pnInGame, pnChatting);
}


SteamFriends_DownloadClanActivityCounts :: inline (psteamIDClans: *CSteamID, cClansToRequest: s32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamFriends_DownloadClan {
    return SteamFriends_DownloadClanActivityCounts(steam_friends, psteamIDClans, cClansToRequest);
}


SteamFriends_GetFriendCountFromSource :: inline (steamIDSource: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetFriendC {
    return SteamFriends_GetFriendCountFromSource(steam_friends, steamIDSource);
}


SteamFriends_GetFriendFromSourceByIndex :: inline (steamIDSource: uint64_steamid, iFriend: s32) -> uint64_steamid #foreign steam "SteamAPI_ISteamFriends_GetFriendFro {
    return SteamFriends_GetFriendFromSourceByIndex(steam_friends, steamIDSource, iFriend);
}


SteamFriends_IsUserInSource :: inline (steamIDUser: uint64_steamid, steamIDSource: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_ {
    return SteamFriends_IsUserInSource(steam_friends, steamIDUser, steamIDSource);
}


SteamFriends_SetInGameVoiceSpeaking :: inline (steamIDUser: uint64_steamid, bSpeaking: bool) {
    SteamFriends_SetInGameVoiceSpeaking(steam_friends, steamIDUser, bSpeaking);
}


SteamFriends_ActivateGameOverlay :: inline (pchDialog: *char) {
    SteamFriends_ActivateGameOverlay(steam_friends, pchDialog);
}


SteamFriends_ActivateGameOverlayToUser :: inline (pchDialog: *char, steamID: uint64_steamid) {
    SteamFriends_ActivateGameOverlayToUser(steam_friends, pchDialog, steamID);
}


SteamFriends_ActivateGameOverlayToWebPage :: inline (pchURL: *char, eMode: EActivateGameOverlayToWebPageMode) {
    SteamFriends_ActivateGameOverlayToWebPage(steam_friends, pchURL, eMode);
}


SteamFriends_ActivateGameOverlayToStore :: inline (nAppID: AppId_t, eFlag: EOverlayToStoreFlag) {
    SteamFriends_ActivateGameOverlayToStore(steam_friends, nAppID, eFlag);
}


SteamFriends_SetPlayedWith :: inline (steamIDUserPlayedWith: uint64_steamid) {
    SteamFriends_SetPlayedWith(steam_friends, steamIDUserPlayedWith);
}


SteamFriends_ActivateGameOverlayInviteDialog :: inline (steamIDLobby: uint64_steamid) {
    SteamFriends_ActivateGameOverlayInviteDialog(steam_friends, steamIDLobby);
}


SteamFriends_GetSmallFriendAvatar :: inline (steamIDFriend: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetSma {
    return SteamFriends_GetSmallFriendAvatar(steam_friends, steamIDFriend);
}


SteamFriends_GetMediumFriendAvatar :: inline (steamIDFriend: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetMedi {
    return SteamFriends_GetMediumFriendAvatar(steam_friends, steamIDFriend);
}


SteamFriends_GetLargeFriendAvatar :: inline (steamIDFriend: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetLar {
    return SteamFriends_GetLargeFriendAvatar(steam_friends, steamIDFriend);
}


SteamFriends_RequestUserInformation :: inline (steamIDUser: uint64_steamid, bRequireNameOnly: bool) -> bool #foreign steam "SteamAPI_ISteamFriends_RequestU {
    return SteamFriends_RequestUserInformation(steam_friends, steamIDUser, bRequireNameOnly);
}


SteamFriends_RequestClanOfficerList :: inline (steamIDClan: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamFriends_RequestC {
    return SteamFriends_RequestClanOfficerList(steam_friends, steamIDClan);
}


SteamFriends_GetClanOwner :: inline (steamIDClan: uint64_steamid) -> uint64_steamid #foreign steam "SteamAPI_ISteamFriend {
    return SteamFriends_GetClanOwner(steam_friends, steamIDClan);
}


SteamFriends_GetClanOfficerCount :: inline (steamIDClan: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetCl {
    return SteamFriends_GetClanOfficerCount(steam_friends, steamIDClan);
}


SteamFriends_GetClanOfficerByIndex :: inline (steamIDClan: uint64_steamid, iOfficer: s32) -> uint64_steamid #foreign steam "SteamAPI_ISteamFriends_GetClan {
    return SteamFriends_GetClanOfficerByIndex(steam_friends, steamIDClan, iOfficer);
}


SteamFriends_GetUserRestrictions :: inline () -> uint32 #foreign steam "SteamAPI_ISteamFriends_GetUs {
    return SteamFriends_GetUserRestrictions(steam_friends);
}


SteamFriends_SetRichPresence :: inline (pchKey: *char, pchValue: *char) -> bool #foreign steam "SteamAPI_ISteamFriends_S {
    return SteamFriends_SetRichPresence(steam_friends, pchKey, pchValue);
}


SteamFriends_ClearRichPresence :: inline () {
    SteamFriends_ClearRichPresence(steam_friends);
}


SteamFriends_GetFriendRichPresence :: inline (steamIDFriend: uint64_steamid, pchKey: *char) -> *char #foreign steam "SteamAPI_ISteamFriends_GetFrie {
    return SteamFriends_GetFriendRichPresence(steam_friends, steamIDFriend, pchKey);
}


SteamFriends_GetFriendRichPresenceKeyCount :: inline (steamIDFriend: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetFriendRichPr {
    return SteamFriends_GetFriendRichPresenceKeyCount(steam_friends, steamIDFriend);
}


SteamFriends_GetFriendRichPresenceKeyByIndex :: inline (steamIDFriend: uint64_steamid, iKey: s32) -> *char #foreign steam "SteamAPI_ISteamFriends_GetFriendRichPres {
    return SteamFriends_GetFriendRichPresenceKeyByIndex(steam_friends, steamIDFriend, iKey);
}


SteamFriends_RequestFriendRichPresence :: inline (steamIDFriend: uint64_steamid) {
    SteamFriends_RequestFriendRichPresence(steam_friends, steamIDFriend);
}


SteamFriends_InviteUserToGame :: inline (steamIDFriend: uint64_steamid, pchConnectString: *char) -> bool #foreign steam "SteamAPI_ISteamFriends_In {
    return SteamFriends_InviteUserToGame(steam_friends, steamIDFriend, pchConnectString);
}


SteamFriends_GetCoplayFriendCount :: inline () -> s32 #foreign steam "SteamAPI_ISteamFriends_GetCop {
    return SteamFriends_GetCoplayFriendCount(steam_friends);
}


SteamFriends_GetCoplayFriend :: inline (iCoplayFriend: s32) -> uint64_steamid #foreign steam "SteamAPI_ISteamFriends_G {
    return SteamFriends_GetCoplayFriend(steam_friends, iCoplayFriend);
}


SteamFriends_GetFriendCoplayTime :: inline (steamIDFriend: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetFr {
    return SteamFriends_GetFriendCoplayTime(steam_friends, steamIDFriend);
}


SteamFriends_GetFriendCoplayGame :: inline (steamIDFriend: uint64_steamid) -> AppId_t #foreign steam "SteamAPI_ISteamFriends_GetFr {
    return SteamFriends_GetFriendCoplayGame(steam_friends, steamIDFriend);
}


SteamFriends_JoinClanChatRoom :: inline (steamIDClan: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamFriends_Jo {
    return SteamFriends_JoinClanChatRoom(steam_friends, steamIDClan);
}


SteamFriends_LeaveClanChatRoom :: inline (steamIDClan: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_Lea {
    return SteamFriends_LeaveClanChatRoom(steam_friends, steamIDClan);
}


SteamFriends_GetClanChatMemberCount :: inline (steamIDClan: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetClanC {
    return SteamFriends_GetClanChatMemberCount(steam_friends, steamIDClan);
}


SteamFriends_GetChatMemberByIndex :: inline (steamIDClan: uint64_steamid, iUser: s32) -> uint64_steamid #foreign steam "SteamAPI_ISteamFriends_GetCha {
    return SteamFriends_GetChatMemberByIndex(steam_friends, steamIDClan, iUser);
}


SteamFriends_SendClanChatMessage :: inline (steamIDClanChat: uint64_steamid, pchText: *char) -> bool #foreign steam "SteamAPI_ISteamFriends_SendC {
    return SteamFriends_SendClanChatMessage(steam_friends, steamIDClanChat, pchText);
}


SteamFriends_GetClanChatMessage :: inline (steamIDClanChat: uint64_steamid, iMessage: s32, prgchText: *void, cchTextMax: s32, peChatEntryType: *EChatEntryType, psteamidChatter: *CSteamID) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetC {
    return SteamFriends_GetClanChatMessage(steam_friends, steamIDClanChat, iMessage, prgchText, cchTextMax, peChatEntryType, psteamidChatter);
}


SteamFriends_IsClanChatAdmin :: inline (steamIDClanChat: uint64_steamid, steamIDUser: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_I {
    return SteamFriends_IsClanChatAdmin(steam_friends, steamIDClanChat, steamIDUser);
}


SteamFriends_IsClanChatWindowOpenInSteam :: inline (steamIDClanChat: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_IsClanChatWin {
    return SteamFriends_IsClanChatWindowOpenInSteam(steam_friends, steamIDClanChat);
}


SteamFriends_OpenClanChatWindowInSteam :: inline (steamIDClanChat: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_OpenClanCha {
    return SteamFriends_OpenClanChatWindowInSteam(steam_friends, steamIDClanChat);
}


SteamFriends_CloseClanChatWindowInSteam :: inline (steamIDClanChat: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_CloseClanCha {
    return SteamFriends_CloseClanChatWindowInSteam(steam_friends, steamIDClanChat);
}


SteamFriends_SetListenForFriendsMessages :: inline (bInterceptEnabled: bool) -> bool #foreign steam "SteamAPI_ISteamFriends_SetListenForF {
    return SteamFriends_SetListenForFriendsMessages(steam_friends, bInterceptEnabled);
}


SteamFriends_ReplyToFriendMessage :: inline (steamIDFriend: uint64_steamid, pchMsgToSend: *char) -> bool #foreign steam "SteamAPI_ISteamFriends_ReplyT {
    return SteamFriends_ReplyToFriendMessage(steam_friends, steamIDFriend, pchMsgToSend);
}


SteamFriends_GetFriendMessage :: inline (steamIDFriend: uint64_steamid, iMessageID: s32, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 #foreign steam "SteamAPI_ISteamFriends_Ge {
    return SteamFriends_GetFriendMessage(steam_friends, steamIDFriend, iMessageID, pvData, cubData, peChatEntryType);
}


SteamFriends_GetFollowerCount :: inline (steamID: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamFriends_Ge {
    return SteamFriends_GetFollowerCount(steam_friends, steamID);
}


SteamFriends_IsFollowing :: inline (steamID: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamFrien {
    return SteamFriends_IsFollowing(steam_friends, steamID);
}


SteamFriends_EnumerateFollowingList :: inline (unStartIndex: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamFriends_Enumerat {
    return SteamFriends_EnumerateFollowingList(steam_friends, unStartIndex);
}


SteamFriends_IsClanPublic :: inline (steamIDClan: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriend {
    return SteamFriends_IsClanPublic(steam_friends, steamIDClan);
}


SteamFriends_IsClanOfficialGameGroup :: inline (steamIDClan: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_IsClanOff {
    return SteamFriends_IsClanOfficialGameGroup(steam_friends, steamIDClan);
}


SteamFriends_GetNumChatsWithUnreadPriorityMessages :: inline () -> s32 #foreign steam "SteamAPI_ISteamFriends_GetNumChatsWithUnreadPr {
    return SteamFriends_GetNumChatsWithUnreadPriorityMessages(steam_friends);
}


SteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog :: inline (steamIDLobby: uint64_steamid) {
    SteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog(steam_friends, steamIDLobby);
}


SteamFriends_RegisterProtocolInOverlayBrowser :: inline (pchProtocol: *char) -> bool #foreign steam "SteamAPI_ISteamFriends_RegisterProtocolIn {
    return SteamFriends_RegisterProtocolInOverlayBrowser(steam_friends, pchProtocol);
}
