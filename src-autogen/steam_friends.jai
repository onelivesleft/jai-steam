steam_friends : *ISteamFriends;

SteamFriends : SteamFriends_Namespace;


#scope_file


SteamFriends_Namespace :: struct {
    // procs
                     :: SteamFriends_GetPersonaName
                     :: SteamFriends_SetPersonaName
                    :: SteamFriends_GetPersonaState
                     :: SteamFriends_GetFriendCount
                   :: SteamFriends_GetFriendByIndex
              :: SteamFriends_GetFriendRelationship
              :: SteamFriends_GetFriendPersonaState
               :: SteamFriends_GetFriendPersonaName
                :: SteamFriends_GetFriendGamePlayed
        :: SteamFriends_GetFriendPersonaNameHistory
                :: SteamFriends_GetFriendSteamLevel
                  :: SteamFriends_GetPlayerNickname
               :: SteamFriends_GetFriendsGroupCount
           :: SteamFriends_GetFriendsGroupIDByIndex
                :: SteamFriends_GetFriendsGroupName
        :: SteamFriends_GetFriendsGroupMembersCount
         :: SteamFriends_GetFriendsGroupMembersList
                          :: SteamFriends_HasFriend
                       :: SteamFriends_GetClanCount
                     :: SteamFriends_GetClanByIndex
                        :: SteamFriends_GetClanName
                         :: SteamFriends_GetClanTag
              :: SteamFriends_GetClanActivityCounts
         :: SteamFriends_DownloadClanActivityCounts
           :: SteamFriends_GetFriendCountFromSource
         :: SteamFriends_GetFriendFromSourceByIndex
                     :: SteamFriends_IsUserInSource
             :: SteamFriends_SetInGameVoiceSpeaking
                :: SteamFriends_ActivateGameOverlay
          :: SteamFriends_ActivateGameOverlayToUser
       :: SteamFriends_ActivateGameOverlayToWebPage
         :: SteamFriends_ActivateGameOverlayToStore
                      :: SteamFriends_SetPlayedWith
    :: SteamFriends_ActivateGameOverlayInviteDialog
               :: SteamFriends_GetSmallFriendAvatar
              :: SteamFriends_GetMediumFriendAvatar
               :: SteamFriends_GetLargeFriendAvatar
             :: SteamFriends_RequestUserInformation
             :: SteamFriends_RequestClanOfficerList
                       :: SteamFriends_GetClanOwner
                :: SteamFriends_GetClanOfficerCount
              :: SteamFriends_GetClanOfficerByIndex
                :: SteamFriends_GetUserRestrictions
                    :: SteamFriends_SetRichPresence
                  :: SteamFriends_ClearRichPresence
              :: SteamFriends_GetFriendRichPresence
      :: SteamFriends_GetFriendRichPresenceKeyCount
    :: SteamFriends_GetFriendRichPresenceKeyByIndex
          :: SteamFriends_RequestFriendRichPresence
                   :: SteamFriends_InviteUserToGame
               :: SteamFriends_GetCoplayFriendCount
                    :: SteamFriends_GetCoplayFriend
                :: SteamFriends_GetFriendCoplayTime
                :: SteamFriends_GetFriendCoplayGame
                   :: SteamFriends_JoinClanChatRoom
                  :: SteamFriends_LeaveClanChatRoom
             :: SteamFriends_GetClanChatMemberCount
               :: SteamFriends_GetChatMemberByIndex
                :: SteamFriends_SendClanChatMessage
                 :: SteamFriends_GetClanChatMessage
                    :: SteamFriends_IsClanChatAdmin
        :: SteamFriends_IsClanChatWindowOpenInSteam
          :: SteamFriends_OpenClanChatWindowInSteam
         :: SteamFriends_CloseClanChatWindowInSteam
        :: SteamFriends_SetListenForFriendsMessages
               :: SteamFriends_ReplyToFriendMessage
                   :: SteamFriends_GetFriendMessage
                   :: SteamFriends_GetFollowerCount
                        :: SteamFriends_IsFollowing
             :: SteamFriends_EnumerateFollowingList
                       :: SteamFriends_IsClanPublic
            :: SteamFriends_IsClanOfficialGameGroup
    :: SteamFriends_GetNumChatsWithUnreadPriorityMessages
    :: SteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog
    :: SteamFriends_RegisterProtocolInOverlayBrowser
}


SteamFriends_GetPersonaName :: inline () -> *char {
    return SteamAPI_ISteamFriends_GetPersonaName(steam_friends);
}


SteamFriends_SetPersonaName :: inline (pchPersonaName: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamFriends_SetPersonaName(steam_friends, pchPersonaName: *char);
}


SteamFriends_GetPersonaState :: inline () -> EPersonaState {
    return SteamAPI_ISteamFriends_GetPersonaState(steam_friends);
}


SteamFriends_GetFriendCount :: inline (iFriendFlags: s32) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendCount(steam_friends, iFriendFlags: s32);
}


SteamFriends_GetFriendByIndex :: inline (iFriend: s32, iFriendFlags: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetFriendByIndex(steam_friends, iFriend: s32, iFriendFlags: s32);
}


SteamFriends_GetFriendRelationship :: inline (steamIDFriend: uint64_steamid) -> EFriendRelationship {
    return SteamAPI_ISteamFriends_GetFriendRelationship(steam_friends, steamIDFriend: uint64_steamid);
}


SteamFriends_GetFriendPersonaState :: inline (steamIDFriend: uint64_steamid) -> EPersonaState {
    return SteamAPI_ISteamFriends_GetFriendPersonaState(steam_friends, steamIDFriend: uint64_steamid);
}


SteamFriends_GetFriendPersonaName :: inline (steamIDFriend: uint64_steamid) -> *char {
    return SteamAPI_ISteamFriends_GetFriendPersonaName(steam_friends, steamIDFriend: uint64_steamid);
}


SteamFriends_GetFriendGamePlayed :: inline (steamIDFriend: uint64_steamid, pFriendGameInfo: *FriendGameInfo_t) -> bool {
    return SteamAPI_ISteamFriends_GetFriendGamePlayed(steam_friends, steamIDFriend: uint64_steamid, pFriendGameInfo: *FriendGameInfo_t);
}


SteamFriends_GetFriendPersonaNameHistory :: inline (steamIDFriend: uint64_steamid, iPersonaName: s32) -> *char {
    return SteamAPI_ISteamFriends_GetFriendPersonaNameHistory(steam_friends, steamIDFriend: uint64_steamid, iPersonaName: s32);
}


SteamFriends_GetFriendSteamLevel :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendSteamLevel(steam_friends, steamIDFriend: uint64_steamid);
}


SteamFriends_GetPlayerNickname :: inline (steamIDPlayer: uint64_steamid) -> *char {
    return SteamAPI_ISteamFriends_GetPlayerNickname(steam_friends, steamIDPlayer: uint64_steamid);
}


SteamFriends_GetFriendsGroupCount :: inline () -> s32 {
    return SteamAPI_ISteamFriends_GetFriendsGroupCount(steam_friends);
}


SteamFriends_GetFriendsGroupIDByIndex :: inline (iFG: s32) -> FriendsGroupID_t {
    return SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex(steam_friends, iFG: s32);
}


SteamFriends_GetFriendsGroupName :: inline (friendsGroupID: FriendsGroupID_t) -> *char {
    return SteamAPI_ISteamFriends_GetFriendsGroupName(steam_friends, friendsGroupID: FriendsGroupID_t);
}


SteamFriends_GetFriendsGroupMembersCount :: inline (friendsGroupID: FriendsGroupID_t) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendsGroupMembersCount(steam_friends, friendsGroupID: FriendsGroupID_t);
}


SteamFriends_GetFriendsGroupMembersList :: inline (friendsGroupID: FriendsGroupID_t, pOutSteamIDMembers: *CSteamID, nMembersCount: s32) {
    SteamAPI_ISteamFriends_GetFriendsGroupMembersList(steam_friends, friendsGroupID: FriendsGroupID_t, pOutSteamIDMembers: *CSteamID, nMembersCount: s32);
}


SteamFriends_HasFriend :: inline (steamIDFriend: uint64_steamid, iFriendFlags: s32) -> bool {
    return SteamAPI_ISteamFriends_HasFriend(steam_friends, steamIDFriend: uint64_steamid, iFriendFlags: s32);
}


SteamFriends_GetClanCount :: inline () -> s32 {
    return SteamAPI_ISteamFriends_GetClanCount(steam_friends);
}


SteamFriends_GetClanByIndex :: inline (iClan: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetClanByIndex(steam_friends, iClan: s32);
}


SteamFriends_GetClanName :: inline (steamIDClan: uint64_steamid) -> *char {
    return SteamAPI_ISteamFriends_GetClanName(steam_friends, steamIDClan: uint64_steamid);
}


SteamFriends_GetClanTag :: inline (steamIDClan: uint64_steamid) -> *char {
    return SteamAPI_ISteamFriends_GetClanTag(steam_friends, steamIDClan: uint64_steamid);
}


SteamFriends_GetClanActivityCounts :: inline (steamIDClan: uint64_steamid, pnOnline: *s32, pnInGame: *s32, pnChatting: *s32) -> bool {
    return SteamAPI_ISteamFriends_GetClanActivityCounts(steam_friends, steamIDClan: uint64_steamid, pnOnline: *s32, pnInGame: *s32, pnChatting: *s32);
}


SteamFriends_DownloadClanActivityCounts :: inline (psteamIDClans: *CSteamID, cClansToRequest: s32) -> SteamAPICall_t {
    return SteamAPI_ISteamFriends_DownloadClanActivityCounts(steam_friends, psteamIDClans: *CSteamID, cClansToRequest: s32);
}


SteamFriends_GetFriendCountFromSource :: inline (steamIDSource: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendCountFromSource(steam_friends, steamIDSource: uint64_steamid);
}


SteamFriends_GetFriendFromSourceByIndex :: inline (steamIDSource: uint64_steamid, iFriend: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetFriendFromSourceByIndex(steam_friends, steamIDSource: uint64_steamid, iFriend: s32);
}


SteamFriends_IsUserInSource :: inline (steamIDUser: uint64_steamid, steamIDSource: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsUserInSource(steam_friends, steamIDUser: uint64_steamid, steamIDSource: uint64_steamid);
}


SteamFriends_SetInGameVoiceSpeaking :: inline (steamIDUser: uint64_steamid, bSpeaking: bool) {
    SteamAPI_ISteamFriends_SetInGameVoiceSpeaking(steam_friends, steamIDUser: uint64_steamid, bSpeaking: bool);
}


SteamFriends_ActivateGameOverlay :: inline (pchDialog: *char) {
    SteamAPI_ISteamFriends_ActivateGameOverlay(steam_friends, pchDialog: *char);
}


SteamFriends_ActivateGameOverlayToUser :: inline (pchDialog: *char, steamID: uint64_steamid) {
    SteamAPI_ISteamFriends_ActivateGameOverlayToUser(steam_friends, pchDialog: *char, steamID: uint64_steamid);
}


SteamFriends_ActivateGameOverlayToWebPage :: inline (pchURL: *char, eMode: EActivateGameOverlayToWebPageMode) {
    SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage(steam_friends, pchURL: *char, eMode: EActivateGameOverlayToWebPageMode);
}


SteamFriends_ActivateGameOverlayToStore :: inline (nAppID: AppId_t, eFlag: EOverlayToStoreFlag) {
    SteamAPI_ISteamFriends_ActivateGameOverlayToStore(steam_friends, nAppID: AppId_t, eFlag: EOverlayToStoreFlag);
}


SteamFriends_SetPlayedWith :: inline (steamIDUserPlayedWith: uint64_steamid) {
    SteamAPI_ISteamFriends_SetPlayedWith(steam_friends, steamIDUserPlayedWith: uint64_steamid);
}


SteamFriends_ActivateGameOverlayInviteDialog :: inline (steamIDLobby: uint64_steamid) {
    SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog(steam_friends, steamIDLobby: uint64_steamid);
}


SteamFriends_GetSmallFriendAvatar :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetSmallFriendAvatar(steam_friends, steamIDFriend: uint64_steamid);
}


SteamFriends_GetMediumFriendAvatar :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetMediumFriendAvatar(steam_friends, steamIDFriend: uint64_steamid);
}


SteamFriends_GetLargeFriendAvatar :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetLargeFriendAvatar(steam_friends, steamIDFriend: uint64_steamid);
}


SteamFriends_RequestUserInformation :: inline (steamIDUser: uint64_steamid, bRequireNameOnly: bool) -> bool {
    return SteamAPI_ISteamFriends_RequestUserInformation(steam_friends, steamIDUser: uint64_steamid, bRequireNameOnly: bool);
}


SteamFriends_RequestClanOfficerList :: inline (steamIDClan: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamFriends_RequestClanOfficerList(steam_friends, steamIDClan: uint64_steamid);
}


SteamFriends_GetClanOwner :: inline (steamIDClan: uint64_steamid) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetClanOwner(steam_friends, steamIDClan: uint64_steamid);
}


SteamFriends_GetClanOfficerCount :: inline (steamIDClan: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetClanOfficerCount(steam_friends, steamIDClan: uint64_steamid);
}


SteamFriends_GetClanOfficerByIndex :: inline (steamIDClan: uint64_steamid, iOfficer: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetClanOfficerByIndex(steam_friends, steamIDClan: uint64_steamid, iOfficer: s32);
}


SteamFriends_GetUserRestrictions :: inline () -> uint32 {
    return SteamAPI_ISteamFriends_GetUserRestrictions(steam_friends);
}


SteamFriends_SetRichPresence :: inline (pchKey: *char, pchValue: *char) -> bool {
    return SteamAPI_ISteamFriends_SetRichPresence(steam_friends, pchKey: *char, pchValue: *char);
}


SteamFriends_ClearRichPresence :: inline () {
    SteamAPI_ISteamFriends_ClearRichPresence(steam_friends);
}


SteamFriends_GetFriendRichPresence :: inline (steamIDFriend: uint64_steamid, pchKey: *char) -> *char {
    return SteamAPI_ISteamFriends_GetFriendRichPresence(steam_friends, steamIDFriend: uint64_steamid, pchKey: *char);
}


SteamFriends_GetFriendRichPresenceKeyCount :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount(steam_friends, steamIDFriend: uint64_steamid);
}


SteamFriends_GetFriendRichPresenceKeyByIndex :: inline (steamIDFriend: uint64_steamid, iKey: s32) -> *char {
    return SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex(steam_friends, steamIDFriend: uint64_steamid, iKey: s32);
}


SteamFriends_RequestFriendRichPresence :: inline (steamIDFriend: uint64_steamid) {
    SteamAPI_ISteamFriends_RequestFriendRichPresence(steam_friends, steamIDFriend: uint64_steamid);
}


SteamFriends_InviteUserToGame :: inline (steamIDFriend: uint64_steamid, pchConnectString: *char) -> bool {
    return SteamAPI_ISteamFriends_InviteUserToGame(steam_friends, steamIDFriend: uint64_steamid, pchConnectString: *char);
}


SteamFriends_GetCoplayFriendCount :: inline () -> s32 {
    return SteamAPI_ISteamFriends_GetCoplayFriendCount(steam_friends);
}


SteamFriends_GetCoplayFriend :: inline (iCoplayFriend: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetCoplayFriend(steam_friends, iCoplayFriend: s32);
}


SteamFriends_GetFriendCoplayTime :: inline (steamIDFriend: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendCoplayTime(steam_friends, steamIDFriend: uint64_steamid);
}


SteamFriends_GetFriendCoplayGame :: inline (steamIDFriend: uint64_steamid) -> AppId_t {
    return SteamAPI_ISteamFriends_GetFriendCoplayGame(steam_friends, steamIDFriend: uint64_steamid);
}


SteamFriends_JoinClanChatRoom :: inline (steamIDClan: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamFriends_JoinClanChatRoom(steam_friends, steamIDClan: uint64_steamid);
}


SteamFriends_LeaveClanChatRoom :: inline (steamIDClan: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_LeaveClanChatRoom(steam_friends, steamIDClan: uint64_steamid);
}


SteamFriends_GetClanChatMemberCount :: inline (steamIDClan: uint64_steamid) -> s32 {
    return SteamAPI_ISteamFriends_GetClanChatMemberCount(steam_friends, steamIDClan: uint64_steamid);
}


SteamFriends_GetChatMemberByIndex :: inline (steamIDClan: uint64_steamid, iUser: s32) -> uint64_steamid {
    return SteamAPI_ISteamFriends_GetChatMemberByIndex(steam_friends, steamIDClan: uint64_steamid, iUser: s32);
}


SteamFriends_SendClanChatMessage :: inline (steamIDClanChat: uint64_steamid, pchText: *char) -> bool {
    return SteamAPI_ISteamFriends_SendClanChatMessage(steam_friends, steamIDClanChat: uint64_steamid, pchText: *char);
}


SteamFriends_GetClanChatMessage :: inline (steamIDClanChat: uint64_steamid, iMessage: s32, prgchText: *void, cchTextMax: s32, peChatEntryType: *EChatEntryType, psteamidChatter: *CSteamID) -> s32 {
    return SteamAPI_ISteamFriends_GetClanChatMessage(steam_friends, steamIDClanChat: uint64_steamid, iMessage: s32, prgchText: *void, cchTextMax: s32, peChatEntryType: *EChatEntryType, psteamidChatter: *CSteamID);
}


SteamFriends_IsClanChatAdmin :: inline (steamIDClanChat: uint64_steamid, steamIDUser: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsClanChatAdmin(steam_friends, steamIDClanChat: uint64_steamid, steamIDUser: uint64_steamid);
}


SteamFriends_IsClanChatWindowOpenInSteam :: inline (steamIDClanChat: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam(steam_friends, steamIDClanChat: uint64_steamid);
}


SteamFriends_OpenClanChatWindowInSteam :: inline (steamIDClanChat: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_OpenClanChatWindowInSteam(steam_friends, steamIDClanChat: uint64_steamid);
}


SteamFriends_CloseClanChatWindowInSteam :: inline (steamIDClanChat: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_CloseClanChatWindowInSteam(steam_friends, steamIDClanChat: uint64_steamid);
}


SteamFriends_SetListenForFriendsMessages :: inline (bInterceptEnabled: bool) -> bool {
    return SteamAPI_ISteamFriends_SetListenForFriendsMessages(steam_friends, bInterceptEnabled: bool);
}


SteamFriends_ReplyToFriendMessage :: inline (steamIDFriend: uint64_steamid, pchMsgToSend: *char) -> bool {
    return SteamAPI_ISteamFriends_ReplyToFriendMessage(steam_friends, steamIDFriend: uint64_steamid, pchMsgToSend: *char);
}


SteamFriends_GetFriendMessage :: inline (steamIDFriend: uint64_steamid, iMessageID: s32, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 {
    return SteamAPI_ISteamFriends_GetFriendMessage(steam_friends, steamIDFriend: uint64_steamid, iMessageID: s32, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType);
}


SteamFriends_GetFollowerCount :: inline (steamID: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamFriends_GetFollowerCount(steam_friends, steamID: uint64_steamid);
}


SteamFriends_IsFollowing :: inline (steamID: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamFriends_IsFollowing(steam_friends, steamID: uint64_steamid);
}


SteamFriends_EnumerateFollowingList :: inline (unStartIndex: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamFriends_EnumerateFollowingList(steam_friends, unStartIndex: uint32);
}


SteamFriends_IsClanPublic :: inline (steamIDClan: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsClanPublic(steam_friends, steamIDClan: uint64_steamid);
}


SteamFriends_IsClanOfficialGameGroup :: inline (steamIDClan: uint64_steamid) -> bool {
    return SteamAPI_ISteamFriends_IsClanOfficialGameGroup(steam_friends, steamIDClan: uint64_steamid);
}


SteamFriends_GetNumChatsWithUnreadPriorityMessages :: inline () -> s32 {
    return SteamAPI_ISteamFriends_GetNumChatsWithUnreadPriorityMessages(steam_friends);
}


SteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog :: inline (steamIDLobby: uint64_steamid) {
    SteamAPI_ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog(steam_friends, steamIDLobby: uint64_steamid);
}


SteamFriends_RegisterProtocolInOverlayBrowser :: inline (pchProtocol: *char) -> bool {
    return SteamAPI_ISteamFriends_RegisterProtocolInOverlayBrowser(steam_friends, pchProtocol: *char);
}
