STEAMCLIENT_INTERFACE_VERSION :: "SteamClient020";

#scope_module
SteamInternal_CreateInterface :: (version: *u8) -> *ISteamClient #foreign steam;
#scope_export

SteamClient :: () -> *ISteamClient {
    return SteamInternal_CreateInterface(STEAMCLIENT_INTERFACE_VERSION);
}


// ISteamClient
CreateSteamPipe :: (self: *ISteamClient) -> HSteamPipe #foreign steam "SteamAPI_ISteamClient_CreateSteamPipe";
BReleaseSteamPipe :: (self: *ISteamClient, hSteamPipe: HSteamPipe) -> bool #foreign steam "SteamAPI_ISteamClient_BReleaseSteamPipe";
ConnectToGlobalUser :: (self: *ISteamClient, hSteamPipe: HSteamPipe) -> HSteamUser #foreign steam "SteamAPI_ISteamClient_ConnectToGlobalUser";
CreateLocalUser :: (self: *ISteamClient, phSteamPipe: *HSteamPipe, eAccountType: EAccountType) -> HSteamUser #foreign steam "SteamAPI_ISteamClient_CreateLocalUser";
ReleaseUser :: (self: *ISteamClient, hSteamPipe: HSteamPipe, hUser: HSteamUser) #foreign steam "SteamAPI_ISteamClient_ReleaseUser";
GetISteamUser :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUser #foreign steam "SteamAPI_ISteamClient_GetISteamUser";
GetISteamGameServer :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamGameServer #foreign steam "SteamAPI_ISteamClient_GetISteamGameServer";
SetLocalIPBinding :: (self: *ISteamClient, unIP: *SteamIPAddress_t, usPort: uint16) #foreign steam "SteamAPI_ISteamClient_SetLocalIPBinding";
GetISteamFriends :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamFriends #foreign steam "SteamAPI_ISteamClient_GetISteamFriends";
GetISteamUtils :: (self: *ISteamClient, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUtils #foreign steam "SteamAPI_ISteamClient_GetISteamUtils";
GetISteamMatchmaking :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMatchmaking #foreign steam "SteamAPI_ISteamClient_GetISteamMatchmaking";
GetISteamMatchmakingServers :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMatchmakingServers #foreign steam "SteamAPI_ISteamClient_GetISteamMatchmakingServers";
GetISteamGenericInterface :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) #foreign steam "SteamAPI_ISteamClient_GetISteamGenericInterface";
GetISteamUserStats :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUserStats #foreign steam "SteamAPI_ISteamClient_GetISteamUserStats";
GetISteamGameServerStats :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamGameServerStats #foreign steam "SteamAPI_ISteamClient_GetISteamGameServerStats";
GetISteamApps :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamApps #foreign steam "SteamAPI_ISteamClient_GetISteamApps";
GetISteamNetworking :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamNetworking #foreign steam "SteamAPI_ISteamClient_GetISteamNetworking";
GetISteamRemoteStorage :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamRemoteStorage #foreign steam "SteamAPI_ISteamClient_GetISteamRemoteStorage";
GetISteamScreenshots :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamScreenshots #foreign steam "SteamAPI_ISteamClient_GetISteamScreenshots";
GetISteamGameSearch :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamGameSearch #foreign steam "SteamAPI_ISteamClient_GetISteamGameSearch";
GetIPCCallCount :: (self: *ISteamClient) -> uint32 #foreign steam "SteamAPI_ISteamClient_GetIPCCallCount";
SetWarningMessageHook :: (self: *ISteamClient, pFunction: SteamAPIWarningMessageHook_t) #foreign steam "SteamAPI_ISteamClient_SetWarningMessageHook";
BShutdownIfAllPipesClosed :: (self: *ISteamClient) -> bool #foreign steam "SteamAPI_ISteamClient_BShutdownIfAllPipesClosed";
GetISteamHTTP :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamHTTP #foreign steam "SteamAPI_ISteamClient_GetISteamHTTP";
GetISteamController :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamController #foreign steam "SteamAPI_ISteamClient_GetISteamController";
GetISteamUGC :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamUGC #foreign steam "SteamAPI_ISteamClient_GetISteamUGC";
GetISteamAppList :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamAppList #foreign steam "SteamAPI_ISteamClient_GetISteamAppList";
GetISteamMusic :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMusic #foreign steam "SteamAPI_ISteamClient_GetISteamMusic";
GetISteamMusicRemote :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamMusicRemote #foreign steam "SteamAPI_ISteamClient_GetISteamMusicRemote";
GetISteamHTMLSurface :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamHTMLSurface #foreign steam "SteamAPI_ISteamClient_GetISteamHTMLSurface";
GetISteamInventory :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamInventory #foreign steam "SteamAPI_ISteamClient_GetISteamInventory";
GetISteamVideo :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamVideo #foreign steam "SteamAPI_ISteamClient_GetISteamVideo";
GetISteamParentalSettings :: (self: *ISteamClient, hSteamuser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamParentalSettings #foreign steam "SteamAPI_ISteamClient_GetISteamParentalSettings";
GetISteamInput :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamInput #foreign steam "SteamAPI_ISteamClient_GetISteamInput";
GetISteamParties :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamParties #foreign steam "SteamAPI_ISteamClient_GetISteamParties";
GetISteamRemotePlay :: (self: *ISteamClient, hSteamUser: HSteamUser, hSteamPipe: HSteamPipe, pchVersion: *char) -> *ISteamRemotePlay #foreign steam "SteamAPI_ISteamClient_GetISteamRemotePlay";

// ISteamUser
SteamUser :: () -> *ISteamUser #foreign steam "SteamAPI_SteamUser_v021";
GetHSteamUser :: (self: *ISteamUser) -> HSteamUser #foreign steam "SteamAPI_ISteamUser_GetHSteamUser";
BLoggedOn :: (self: *ISteamUser) -> bool #foreign steam "SteamAPI_ISteamUser_BLoggedOn";
GetSteamID :: (self: *ISteamUser) -> uint64_steamid #foreign steam "SteamAPI_ISteamUser_GetSteamID";
InitiateGameConnection :: (self: *ISteamUser, pAuthBlob: *void, cbMaxAuthBlob: s32, steamIDGameServer: uint64_steamid, unIPServer: uint32, usPortServer: uint16, bSecure: bool) -> s32 #foreign steam "SteamAPI_ISteamUser_InitiateGameConnection";
TerminateGameConnection :: (self: *ISteamUser, unIPServer: uint32, usPortServer: uint16) #foreign steam "SteamAPI_ISteamUser_TerminateGameConnection";
TrackAppUsageEvent :: (self: *ISteamUser, gameID: uint64_gameid, eAppUsageEvent: s32, pchExtraInfo: *char) #foreign steam "SteamAPI_ISteamUser_TrackAppUsageEvent";
GetUserDataFolder :: (self: *ISteamUser, pchBuffer: *char, cubBuffer: s32) -> bool #foreign steam "SteamAPI_ISteamUser_GetUserDataFolder";
StartVoiceRecording :: (self: *ISteamUser) #foreign steam "SteamAPI_ISteamUser_StartVoiceRecording";
StopVoiceRecording :: (self: *ISteamUser) #foreign steam "SteamAPI_ISteamUser_StopVoiceRecording";
GetAvailableVoice :: (self: *ISteamUser, pcbCompressed: *uint32, pcbUncompressed_Deprecated: *uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult #foreign steam "SteamAPI_ISteamUser_GetAvailableVoice";
GetVoice :: (self: *ISteamUser, bWantCompressed: bool, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, bWantUncompressed_Deprecated: bool, pUncompressedDestBuffer_Deprecated: *void, cbUncompressedDestBufferSize_Deprecated: uint32, nUncompressBytesWritten_Deprecated: *uint32, nUncompressedVoiceDesiredSampleRate_Deprecated: uint32) -> EVoiceResult #foreign steam "SteamAPI_ISteamUser_GetVoice";
DecompressVoice :: (self: *ISteamUser, pCompressed: *void, cbCompressed: uint32, pDestBuffer: *void, cbDestBufferSize: uint32, nBytesWritten: *uint32, nDesiredSampleRate: uint32) -> EVoiceResult #foreign steam "SteamAPI_ISteamUser_DecompressVoice";
GetVoiceOptimalSampleRate :: (self: *ISteamUser) -> uint32 #foreign steam "SteamAPI_ISteamUser_GetVoiceOptimalSampleRate";
GetAuthSessionTicket :: (self: *ISteamUser, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> HAuthTicket #foreign steam "SteamAPI_ISteamUser_GetAuthSessionTicket";
BeginAuthSession :: (self: *ISteamUser, pAuthTicket: *void, cbAuthTicket: s32, steamID: uint64_steamid) -> EBeginAuthSessionResult #foreign steam "SteamAPI_ISteamUser_BeginAuthSession";
EndAuthSession :: (self: *ISteamUser, steamID: uint64_steamid) #foreign steam "SteamAPI_ISteamUser_EndAuthSession";
CancelAuthTicket :: (self: *ISteamUser, hAuthTicket: HAuthTicket) #foreign steam "SteamAPI_ISteamUser_CancelAuthTicket";
UserHasLicenseForApp :: (self: *ISteamUser, steamID: uint64_steamid, appID: AppId_t) -> EUserHasLicenseForAppResult #foreign steam "SteamAPI_ISteamUser_UserHasLicenseForApp";
BIsBehindNAT :: (self: *ISteamUser) -> bool #foreign steam "SteamAPI_ISteamUser_BIsBehindNAT";
AdvertiseGame :: (self: *ISteamUser, steamIDGameServer: uint64_steamid, unIPServer: uint32, usPortServer: uint16) #foreign steam "SteamAPI_ISteamUser_AdvertiseGame";
RequestEncryptedAppTicket :: (self: *ISteamUser, pDataToInclude: *void, cbDataToInclude: s32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUser_RequestEncryptedAppTicket";
GetEncryptedAppTicket :: (self: *ISteamUser, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> bool #foreign steam "SteamAPI_ISteamUser_GetEncryptedAppTicket";
GetGameBadgeLevel :: (self: *ISteamUser, nSeries: s32, bFoil: bool) -> s32 #foreign steam "SteamAPI_ISteamUser_GetGameBadgeLevel";
GetPlayerSteamLevel :: (self: *ISteamUser) -> s32 #foreign steam "SteamAPI_ISteamUser_GetPlayerSteamLevel";
RequestStoreAuthURL :: (self: *ISteamUser, pchRedirectURL: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUser_RequestStoreAuthURL";
BIsPhoneVerified :: (self: *ISteamUser) -> bool #foreign steam "SteamAPI_ISteamUser_BIsPhoneVerified";
BIsTwoFactorEnabled :: (self: *ISteamUser) -> bool #foreign steam "SteamAPI_ISteamUser_BIsTwoFactorEnabled";
BIsPhoneIdentifying :: (self: *ISteamUser) -> bool #foreign steam "SteamAPI_ISteamUser_BIsPhoneIdentifying";
BIsPhoneRequiringVerification :: (self: *ISteamUser) -> bool #foreign steam "SteamAPI_ISteamUser_BIsPhoneRequiringVerification";
GetMarketEligibility :: (self: *ISteamUser) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUser_GetMarketEligibility";
GetDurationControl :: (self: *ISteamUser) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUser_GetDurationControl";
BSetDurationControlOnlineState :: (self: *ISteamUser, eNewState: EDurationControlOnlineState) -> bool #foreign steam "SteamAPI_ISteamUser_BSetDurationControlOnlineState";

// ISteamFriends
SteamFriends :: () -> *ISteamFriends #foreign steam "SteamAPI_SteamFriends_v017";
GetPersonaName :: (self: *ISteamFriends) -> *char #foreign steam "SteamAPI_ISteamFriends_GetPersonaName";
SetPersonaName :: (self: *ISteamFriends, pchPersonaName: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamFriends_SetPersonaName";
GetPersonaState :: (self: *ISteamFriends) -> EPersonaState #foreign steam "SteamAPI_ISteamFriends_GetPersonaState";
GetFriendCount :: (self: *ISteamFriends, iFriendFlags: s32) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetFriendCount";
GetFriendByIndex :: (self: *ISteamFriends, iFriend: s32, iFriendFlags: s32) -> uint64_steamid #foreign steam "SteamAPI_ISteamFriends_GetFriendByIndex";
GetFriendRelationship :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> EFriendRelationship #foreign steam "SteamAPI_ISteamFriends_GetFriendRelationship";
GetFriendPersonaState :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> EPersonaState #foreign steam "SteamAPI_ISteamFriends_GetFriendPersonaState";
GetFriendPersonaName :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> *char #foreign steam "SteamAPI_ISteamFriends_GetFriendPersonaName";
GetFriendGamePlayed :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, pFriendGameInfo: *FriendGameInfo_t) -> bool #foreign steam "SteamAPI_ISteamFriends_GetFriendGamePlayed";
GetFriendPersonaNameHistory :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, iPersonaName: s32) -> *char #foreign steam "SteamAPI_ISteamFriends_GetFriendPersonaNameHistory";
GetFriendSteamLevel :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetFriendSteamLevel";
GetPlayerNickname :: (self: *ISteamFriends, steamIDPlayer: uint64_steamid) -> *char #foreign steam "SteamAPI_ISteamFriends_GetPlayerNickname";
GetFriendsGroupCount :: (self: *ISteamFriends) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetFriendsGroupCount";
GetFriendsGroupIDByIndex :: (self: *ISteamFriends, iFG: s32) -> FriendsGroupID_t #foreign steam "SteamAPI_ISteamFriends_GetFriendsGroupIDByIndex";
GetFriendsGroupName :: (self: *ISteamFriends, friendsGroupID: FriendsGroupID_t) -> *char #foreign steam "SteamAPI_ISteamFriends_GetFriendsGroupName";
GetFriendsGroupMembersCount :: (self: *ISteamFriends, friendsGroupID: FriendsGroupID_t) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetFriendsGroupMembersCount";
GetFriendsGroupMembersList :: (self: *ISteamFriends, friendsGroupID: FriendsGroupID_t, pOutSteamIDMembers: *CSteamID, nMembersCount: s32) #foreign steam "SteamAPI_ISteamFriends_GetFriendsGroupMembersList";
HasFriend :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, iFriendFlags: s32) -> bool #foreign steam "SteamAPI_ISteamFriends_HasFriend";
GetClanCount :: (self: *ISteamFriends) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetClanCount";
GetClanByIndex :: (self: *ISteamFriends, iClan: s32) -> uint64_steamid #foreign steam "SteamAPI_ISteamFriends_GetClanByIndex";
GetClanName :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> *char #foreign steam "SteamAPI_ISteamFriends_GetClanName";
GetClanTag :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> *char #foreign steam "SteamAPI_ISteamFriends_GetClanTag";
GetClanActivityCounts :: (self: *ISteamFriends, steamIDClan: uint64_steamid, pnOnline: *s32, pnInGame: *s32, pnChatting: *s32) -> bool #foreign steam "SteamAPI_ISteamFriends_GetClanActivityCounts";
DownloadClanActivityCounts :: (self: *ISteamFriends, psteamIDClans: *CSteamID, cClansToRequest: s32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamFriends_DownloadClanActivityCounts";
GetFriendCountFromSource :: (self: *ISteamFriends, steamIDSource: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetFriendCountFromSource";
GetFriendFromSourceByIndex :: (self: *ISteamFriends, steamIDSource: uint64_steamid, iFriend: s32) -> uint64_steamid #foreign steam "SteamAPI_ISteamFriends_GetFriendFromSourceByIndex";
IsUserInSource :: (self: *ISteamFriends, steamIDUser: uint64_steamid, steamIDSource: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_IsUserInSource";
SetInGameVoiceSpeaking :: (self: *ISteamFriends, steamIDUser: uint64_steamid, bSpeaking: bool) #foreign steam "SteamAPI_ISteamFriends_SetInGameVoiceSpeaking";
ActivateGameOverlay :: (self: *ISteamFriends, pchDialog: *char) #foreign steam "SteamAPI_ISteamFriends_ActivateGameOverlay";
ActivateGameOverlayToUser :: (self: *ISteamFriends, pchDialog: *char, steamID: uint64_steamid) #foreign steam "SteamAPI_ISteamFriends_ActivateGameOverlayToUser";
ActivateGameOverlayToWebPage :: (self: *ISteamFriends, pchURL: *char, eMode: EActivateGameOverlayToWebPageMode) #foreign steam "SteamAPI_ISteamFriends_ActivateGameOverlayToWebPage";
ActivateGameOverlayToStore :: (self: *ISteamFriends, nAppID: AppId_t, eFlag: EOverlayToStoreFlag) #foreign steam "SteamAPI_ISteamFriends_ActivateGameOverlayToStore";
SetPlayedWith :: (self: *ISteamFriends, steamIDUserPlayedWith: uint64_steamid) #foreign steam "SteamAPI_ISteamFriends_SetPlayedWith";
ActivateGameOverlayInviteDialog :: (self: *ISteamFriends, steamIDLobby: uint64_steamid) #foreign steam "SteamAPI_ISteamFriends_ActivateGameOverlayInviteDialog";
GetSmallFriendAvatar :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetSmallFriendAvatar";
GetMediumFriendAvatar :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetMediumFriendAvatar";
GetLargeFriendAvatar :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetLargeFriendAvatar";
RequestUserInformation :: (self: *ISteamFriends, steamIDUser: uint64_steamid, bRequireNameOnly: bool) -> bool #foreign steam "SteamAPI_ISteamFriends_RequestUserInformation";
RequestClanOfficerList :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamFriends_RequestClanOfficerList";
GetClanOwner :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> uint64_steamid #foreign steam "SteamAPI_ISteamFriends_GetClanOwner";
GetClanOfficerCount :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetClanOfficerCount";
GetClanOfficerByIndex :: (self: *ISteamFriends, steamIDClan: uint64_steamid, iOfficer: s32) -> uint64_steamid #foreign steam "SteamAPI_ISteamFriends_GetClanOfficerByIndex";
GetUserRestrictions :: (self: *ISteamFriends) -> uint32 #foreign steam "SteamAPI_ISteamFriends_GetUserRestrictions";
SetRichPresence :: (self: *ISteamFriends, pchKey: *char, pchValue: *char) -> bool #foreign steam "SteamAPI_ISteamFriends_SetRichPresence";
ClearRichPresence :: (self: *ISteamFriends) #foreign steam "SteamAPI_ISteamFriends_ClearRichPresence";
GetFriendRichPresence :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, pchKey: *char) -> *char #foreign steam "SteamAPI_ISteamFriends_GetFriendRichPresence";
GetFriendRichPresenceKeyCount :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetFriendRichPresenceKeyCount";
GetFriendRichPresenceKeyByIndex :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, iKey: s32) -> *char #foreign steam "SteamAPI_ISteamFriends_GetFriendRichPresenceKeyByIndex";
RequestFriendRichPresence :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) #foreign steam "SteamAPI_ISteamFriends_RequestFriendRichPresence";
InviteUserToGame :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, pchConnectString: *char) -> bool #foreign steam "SteamAPI_ISteamFriends_InviteUserToGame";
GetCoplayFriendCount :: (self: *ISteamFriends) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetCoplayFriendCount";
GetCoplayFriend :: (self: *ISteamFriends, iCoplayFriend: s32) -> uint64_steamid #foreign steam "SteamAPI_ISteamFriends_GetCoplayFriend";
GetFriendCoplayTime :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetFriendCoplayTime";
GetFriendCoplayGame :: (self: *ISteamFriends, steamIDFriend: uint64_steamid) -> AppId_t #foreign steam "SteamAPI_ISteamFriends_GetFriendCoplayGame";
JoinClanChatRoom :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamFriends_JoinClanChatRoom";
LeaveClanChatRoom :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_LeaveClanChatRoom";
GetClanChatMemberCount :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetClanChatMemberCount";
GetChatMemberByIndex :: (self: *ISteamFriends, steamIDClan: uint64_steamid, iUser: s32) -> uint64_steamid #foreign steam "SteamAPI_ISteamFriends_GetChatMemberByIndex";
SendClanChatMessage :: (self: *ISteamFriends, steamIDClanChat: uint64_steamid, pchText: *char) -> bool #foreign steam "SteamAPI_ISteamFriends_SendClanChatMessage";
GetClanChatMessage :: (self: *ISteamFriends, steamIDClanChat: uint64_steamid, iMessage: s32, prgchText: *void, cchTextMax: s32, peChatEntryType: *EChatEntryType, psteamidChatter: *CSteamID) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetClanChatMessage";
IsClanChatAdmin :: (self: *ISteamFriends, steamIDClanChat: uint64_steamid, steamIDUser: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_IsClanChatAdmin";
IsClanChatWindowOpenInSteam :: (self: *ISteamFriends, steamIDClanChat: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_IsClanChatWindowOpenInSteam";
OpenClanChatWindowInSteam :: (self: *ISteamFriends, steamIDClanChat: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_OpenClanChatWindowInSteam";
CloseClanChatWindowInSteam :: (self: *ISteamFriends, steamIDClanChat: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_CloseClanChatWindowInSteam";
SetListenForFriendsMessages :: (self: *ISteamFriends, bInterceptEnabled: bool) -> bool #foreign steam "SteamAPI_ISteamFriends_SetListenForFriendsMessages";
ReplyToFriendMessage :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, pchMsgToSend: *char) -> bool #foreign steam "SteamAPI_ISteamFriends_ReplyToFriendMessage";
GetFriendMessage :: (self: *ISteamFriends, steamIDFriend: uint64_steamid, iMessageID: s32, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetFriendMessage";
GetFollowerCount :: (self: *ISteamFriends, steamID: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamFriends_GetFollowerCount";
IsFollowing :: (self: *ISteamFriends, steamID: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamFriends_IsFollowing";
EnumerateFollowingList :: (self: *ISteamFriends, unStartIndex: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamFriends_EnumerateFollowingList";
IsClanPublic :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_IsClanPublic";
IsClanOfficialGameGroup :: (self: *ISteamFriends, steamIDClan: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamFriends_IsClanOfficialGameGroup";
GetNumChatsWithUnreadPriorityMessages :: (self: *ISteamFriends) -> s32 #foreign steam "SteamAPI_ISteamFriends_GetNumChatsWithUnreadPriorityMessages";
ActivateGameOverlayRemotePlayTogetherInviteDialog :: (self: *ISteamFriends, steamIDLobby: uint64_steamid) #foreign steam "SteamAPI_ISteamFriends_ActivateGameOverlayRemotePlayTogetherInviteDialog";
RegisterProtocolInOverlayBrowser :: (self: *ISteamFriends, pchProtocol: *char) -> bool #foreign steam "SteamAPI_ISteamFriends_RegisterProtocolInOverlayBrowser";

// ISteamUtils
SteamUtils :: () -> *ISteamUtils #foreign steam "SteamAPI_SteamUtils_v010";
SteamGameServerUtils :: () -> *ISteamUtils #foreign steam "SteamAPI_SteamGameServerUtils_v010";
GetSecondsSinceAppActive :: (self: *ISteamUtils) -> uint32 #foreign steam "SteamAPI_ISteamUtils_GetSecondsSinceAppActive";
GetSecondsSinceComputerActive :: (self: *ISteamUtils) -> uint32 #foreign steam "SteamAPI_ISteamUtils_GetSecondsSinceComputerActive";
GetConnectedUniverse :: (self: *ISteamUtils) -> EUniverse #foreign steam "SteamAPI_ISteamUtils_GetConnectedUniverse";
GetServerRealTime :: (self: *ISteamUtils) -> uint32 #foreign steam "SteamAPI_ISteamUtils_GetServerRealTime";
GetIPCountry :: (self: *ISteamUtils) -> *char #foreign steam "SteamAPI_ISteamUtils_GetIPCountry";
GetImageSize :: (self: *ISteamUtils, iImage: s32, pnWidth: *uint32, pnHeight: *uint32) -> bool #foreign steam "SteamAPI_ISteamUtils_GetImageSize";
GetImageRGBA :: (self: *ISteamUtils, iImage: s32, pubDest: *uint8, nDestBufferSize: s32) -> bool #foreign steam "SteamAPI_ISteamUtils_GetImageRGBA";
GetCSERIPPort :: (self: *ISteamUtils, unIP: *uint32, usPort: *uint16) -> bool #foreign steam "SteamAPI_ISteamUtils_GetCSERIPPort";
GetCurrentBatteryPower :: (self: *ISteamUtils) -> uint8 #foreign steam "SteamAPI_ISteamUtils_GetCurrentBatteryPower";
GetAppID :: (self: *ISteamUtils) -> uint32 #foreign steam "SteamAPI_ISteamUtils_GetAppID";
SetOverlayNotificationPosition :: (self: *ISteamUtils, eNotificationPosition: ENotificationPosition) #foreign steam "SteamAPI_ISteamUtils_SetOverlayNotificationPosition";
IsAPICallCompleted :: (self: *ISteamUtils, hSteamAPICall: SteamAPICall_t, pbFailed: *bool) -> bool #foreign steam "SteamAPI_ISteamUtils_IsAPICallCompleted";
GetAPICallFailureReason :: (self: *ISteamUtils, hSteamAPICall: SteamAPICall_t) -> ESteamAPICallFailure #foreign steam "SteamAPI_ISteamUtils_GetAPICallFailureReason";
GetAPICallResult :: (self: *ISteamUtils, hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: s32, iCallbackExpected: s32, pbFailed: *bool) -> bool #foreign steam "SteamAPI_ISteamUtils_GetAPICallResult";
GetIPCCallCount :: (self: *ISteamUtils) -> uint32 #foreign steam "SteamAPI_ISteamUtils_GetIPCCallCount";
SetWarningMessageHook :: (self: *ISteamUtils, pFunction: SteamAPIWarningMessageHook_t) #foreign steam "SteamAPI_ISteamUtils_SetWarningMessageHook";
IsOverlayEnabled :: (self: *ISteamUtils) -> bool #foreign steam "SteamAPI_ISteamUtils_IsOverlayEnabled";
BOverlayNeedsPresent :: (self: *ISteamUtils) -> bool #foreign steam "SteamAPI_ISteamUtils_BOverlayNeedsPresent";
CheckFileSignature :: (self: *ISteamUtils, szFileName: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUtils_CheckFileSignature";
ShowGamepadTextInput :: (self: *ISteamUtils, eInputMode: EGamepadTextInputMode, eLineInputMode: EGamepadTextInputLineMode, pchDescription: *char, unCharMax: uint32, pchExistingText: *char) -> bool #foreign steam "SteamAPI_ISteamUtils_ShowGamepadTextInput";
GetEnteredGamepadTextLength :: (self: *ISteamUtils) -> uint32 #foreign steam "SteamAPI_ISteamUtils_GetEnteredGamepadTextLength";
GetEnteredGamepadTextInput :: (self: *ISteamUtils, pchText: *char, cchText: uint32) -> bool #foreign steam "SteamAPI_ISteamUtils_GetEnteredGamepadTextInput";
GetSteamUILanguage :: (self: *ISteamUtils) -> *char #foreign steam "SteamAPI_ISteamUtils_GetSteamUILanguage";
IsSteamRunningInVR :: (self: *ISteamUtils) -> bool #foreign steam "SteamAPI_ISteamUtils_IsSteamRunningInVR";
SetOverlayNotificationInset :: (self: *ISteamUtils, nHorizontalInset: s32, nVerticalInset: s32) #foreign steam "SteamAPI_ISteamUtils_SetOverlayNotificationInset";
IsSteamInBigPictureMode :: (self: *ISteamUtils) -> bool #foreign steam "SteamAPI_ISteamUtils_IsSteamInBigPictureMode";
StartVRDashboard :: (self: *ISteamUtils) #foreign steam "SteamAPI_ISteamUtils_StartVRDashboard";
IsVRHeadsetStreamingEnabled :: (self: *ISteamUtils) -> bool #foreign steam "SteamAPI_ISteamUtils_IsVRHeadsetStreamingEnabled";
SetVRHeadsetStreamingEnabled :: (self: *ISteamUtils, bEnabled: bool) #foreign steam "SteamAPI_ISteamUtils_SetVRHeadsetStreamingEnabled";
IsSteamChinaLauncher :: (self: *ISteamUtils) -> bool #foreign steam "SteamAPI_ISteamUtils_IsSteamChinaLauncher";
InitFilterText :: (self: *ISteamUtils, unFilterOptions: uint32) -> bool #foreign steam "SteamAPI_ISteamUtils_InitFilterText";
FilterText :: (self: *ISteamUtils, eContext: ETextFilteringContext, sourceSteamID: uint64_steamid, pchInputMessage: *char, pchOutFilteredText: *char, nByteSizeOutFilteredText: uint32) -> s32 #foreign steam "SteamAPI_ISteamUtils_FilterText";
GetIPv6ConnectivityState :: (self: *ISteamUtils, eProtocol: ESteamIPv6ConnectivityProtocol) -> ESteamIPv6ConnectivityState #foreign steam "SteamAPI_ISteamUtils_GetIPv6ConnectivityState";

// ISteamMatchmaking
SteamMatchmaking :: () -> *ISteamMatchmaking #foreign steam "SteamAPI_SteamMatchmaking_v009";
GetFavoriteGameCount :: (self: *ISteamMatchmaking) -> s32 #foreign steam "SteamAPI_ISteamMatchmaking_GetFavoriteGameCount";
GetFavoriteGame :: (self: *ISteamMatchmaking, iGame: s32, pnAppID: *AppId_t, pnIP: *uint32, pnConnPort: *uint16, pnQueryPort: *uint16, punFlags: *uint32, pRTime32LastPlayedOnServer: *uint32) -> bool #foreign steam "SteamAPI_ISteamMatchmaking_GetFavoriteGame";
AddFavoriteGame :: (self: *ISteamMatchmaking, nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32, rTime32LastPlayedOnServer: uint32) -> s32 #foreign steam "SteamAPI_ISteamMatchmaking_AddFavoriteGame";
RemoveFavoriteGame :: (self: *ISteamMatchmaking, nAppID: AppId_t, nIP: uint32, nConnPort: uint16, nQueryPort: uint16, unFlags: uint32) -> bool #foreign steam "SteamAPI_ISteamMatchmaking_RemoveFavoriteGame";
RequestLobbyList :: (self: *ISteamMatchmaking) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamMatchmaking_RequestLobbyList";
AddRequestLobbyListStringFilter :: (self: *ISteamMatchmaking, pchKeyToMatch: *char, pchValueToMatch: *char, eComparisonType: ELobbyComparison) #foreign steam "SteamAPI_ISteamMatchmaking_AddRequestLobbyListStringFilter";
AddRequestLobbyListNumericalFilter :: (self: *ISteamMatchmaking, pchKeyToMatch: *char, nValueToMatch: s32, eComparisonType: ELobbyComparison) #foreign steam "SteamAPI_ISteamMatchmaking_AddRequestLobbyListNumericalFilter";
AddRequestLobbyListNearValueFilter :: (self: *ISteamMatchmaking, pchKeyToMatch: *char, nValueToBeCloseTo: s32) #foreign steam "SteamAPI_ISteamMatchmaking_AddRequestLobbyListNearValueFilter";
AddRequestLobbyListFilterSlotsAvailable :: (self: *ISteamMatchmaking, nSlotsAvailable: s32) #foreign steam "SteamAPI_ISteamMatchmaking_AddRequestLobbyListFilterSlotsAvailable";
AddRequestLobbyListDistanceFilter :: (self: *ISteamMatchmaking, eLobbyDistanceFilter: ELobbyDistanceFilter) #foreign steam "SteamAPI_ISteamMatchmaking_AddRequestLobbyListDistanceFilter";
AddRequestLobbyListResultCountFilter :: (self: *ISteamMatchmaking, cMaxResults: s32) #foreign steam "SteamAPI_ISteamMatchmaking_AddRequestLobbyListResultCountFilter";
AddRequestLobbyListCompatibleMembersFilter :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) #foreign steam "SteamAPI_ISteamMatchmaking_AddRequestLobbyListCompatibleMembersFilter";
GetLobbyByIndex :: (self: *ISteamMatchmaking, iLobby: s32) -> uint64_steamid #foreign steam "SteamAPI_ISteamMatchmaking_GetLobbyByIndex";
CreateLobby :: (self: *ISteamMatchmaking, eLobbyType: ELobbyType, cMaxMembers: s32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamMatchmaking_CreateLobby";
JoinLobby :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamMatchmaking_JoinLobby";
LeaveLobby :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) #foreign steam "SteamAPI_ISteamMatchmaking_LeaveLobby";
InviteUserToLobby :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, steamIDInvitee: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamMatchmaking_InviteUserToLobby";
GetNumLobbyMembers :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamMatchmaking_GetNumLobbyMembers";
GetLobbyMemberByIndex :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, iMember: s32) -> uint64_steamid #foreign steam "SteamAPI_ISteamMatchmaking_GetLobbyMemberByIndex";
GetLobbyData :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, pchKey: *char) -> *char #foreign steam "SteamAPI_ISteamMatchmaking_GetLobbyData";
SetLobbyData :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, pchKey: *char, pchValue: *char) -> bool #foreign steam "SteamAPI_ISteamMatchmaking_SetLobbyData";
GetLobbyDataCount :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamMatchmaking_GetLobbyDataCount";
GetLobbyDataByIndex :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, iLobbyData: s32, pchKey: *char, cchKeyBufferSize: s32, pchValue: *char, cchValueBufferSize: s32) -> bool #foreign steam "SteamAPI_ISteamMatchmaking_GetLobbyDataByIndex";
DeleteLobbyData :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, pchKey: *char) -> bool #foreign steam "SteamAPI_ISteamMatchmaking_DeleteLobbyData";
GetLobbyMemberData :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, steamIDUser: uint64_steamid, pchKey: *char) -> *char #foreign steam "SteamAPI_ISteamMatchmaking_GetLobbyMemberData";
SetLobbyMemberData :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, pchKey: *char, pchValue: *char) #foreign steam "SteamAPI_ISteamMatchmaking_SetLobbyMemberData";
SendLobbyChatMsg :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, pvMsgBody: *void, cubMsgBody: s32) -> bool #foreign steam "SteamAPI_ISteamMatchmaking_SendLobbyChatMsg";
GetLobbyChatEntry :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, iChatID: s32, pSteamIDUser: *CSteamID, pvData: *void, cubData: s32, peChatEntryType: *EChatEntryType) -> s32 #foreign steam "SteamAPI_ISteamMatchmaking_GetLobbyChatEntry";
RequestLobbyData :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamMatchmaking_RequestLobbyData";
SetLobbyGameServer :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, unGameServerIP: uint32, unGameServerPort: uint16, steamIDGameServer: uint64_steamid) #foreign steam "SteamAPI_ISteamMatchmaking_SetLobbyGameServer";
GetLobbyGameServer :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, punGameServerIP: *uint32, punGameServerPort: *uint16, psteamIDGameServer: *CSteamID) -> bool #foreign steam "SteamAPI_ISteamMatchmaking_GetLobbyGameServer";
SetLobbyMemberLimit :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, cMaxMembers: s32) -> bool #foreign steam "SteamAPI_ISteamMatchmaking_SetLobbyMemberLimit";
GetLobbyMemberLimit :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) -> s32 #foreign steam "SteamAPI_ISteamMatchmaking_GetLobbyMemberLimit";
SetLobbyType :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, eLobbyType: ELobbyType) -> bool #foreign steam "SteamAPI_ISteamMatchmaking_SetLobbyType";
SetLobbyJoinable :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, bLobbyJoinable: bool) -> bool #foreign steam "SteamAPI_ISteamMatchmaking_SetLobbyJoinable";
GetLobbyOwner :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid) -> uint64_steamid #foreign steam "SteamAPI_ISteamMatchmaking_GetLobbyOwner";
SetLobbyOwner :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, steamIDNewOwner: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamMatchmaking_SetLobbyOwner";
SetLinkedLobby :: (self: *ISteamMatchmaking, steamIDLobby: uint64_steamid, steamIDLobbyDependent: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamMatchmaking_SetLinkedLobby";

// ISteamMatchmakingServerListResponse
ServerResponded :: (self: *ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, iServer: s32) #foreign steam "SteamAPI_ISteamMatchmakingServerListResponse_ServerResponded";
ServerFailedToRespond :: (self: *ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, iServer: s32) #foreign steam "SteamAPI_ISteamMatchmakingServerListResponse_ServerFailedToRespond";
RefreshComplete :: (self: *ISteamMatchmakingServerListResponse, hRequest: HServerListRequest, response: EMatchMakingServerResponse) #foreign steam "SteamAPI_ISteamMatchmakingServerListResponse_RefreshComplete";

// ISteamMatchmakingPingResponse
ServerResponded :: (self: *ISteamMatchmakingPingResponse, server: *gameserveritem_t) #foreign steam "SteamAPI_ISteamMatchmakingPingResponse_ServerResponded";
ServerFailedToRespond :: (self: *ISteamMatchmakingPingResponse) #foreign steam "SteamAPI_ISteamMatchmakingPingResponse_ServerFailedToRespond";

// ISteamMatchmakingPlayersResponse
AddPlayerToList :: (self: *ISteamMatchmakingPlayersResponse, pchName: *char, nScore: s32, flTimePlayed: float) #foreign steam "SteamAPI_ISteamMatchmakingPlayersResponse_AddPlayerToList";
PlayersFailedToRespond :: (self: *ISteamMatchmakingPlayersResponse) #foreign steam "SteamAPI_ISteamMatchmakingPlayersResponse_PlayersFailedToRespond";
PlayersRefreshComplete :: (self: *ISteamMatchmakingPlayersResponse) #foreign steam "SteamAPI_ISteamMatchmakingPlayersResponse_PlayersRefreshComplete";

// ISteamMatchmakingRulesResponse
RulesResponded :: (self: *ISteamMatchmakingRulesResponse, pchRule: *char, pchValue: *char) #foreign steam "SteamAPI_ISteamMatchmakingRulesResponse_RulesResponded";
RulesFailedToRespond :: (self: *ISteamMatchmakingRulesResponse) #foreign steam "SteamAPI_ISteamMatchmakingRulesResponse_RulesFailedToRespond";
RulesRefreshComplete :: (self: *ISteamMatchmakingRulesResponse) #foreign steam "SteamAPI_ISteamMatchmakingRulesResponse_RulesRefreshComplete";

// ISteamMatchmakingServers
SteamMatchmakingServers :: () -> *ISteamMatchmakingServers #foreign steam "SteamAPI_SteamMatchmakingServers_v002";
RequestInternetServerList :: (self: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam "SteamAPI_ISteamMatchmakingServers_RequestInternetServerList";
RequestLANServerList :: (self: *ISteamMatchmakingServers, iApp: AppId_t, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam "SteamAPI_ISteamMatchmakingServers_RequestLANServerList";
RequestFriendsServerList :: (self: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam "SteamAPI_ISteamMatchmakingServers_RequestFriendsServerList";
RequestFavoritesServerList :: (self: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam "SteamAPI_ISteamMatchmakingServers_RequestFavoritesServerList";
RequestHistoryServerList :: (self: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam "SteamAPI_ISteamMatchmakingServers_RequestHistoryServerList";
RequestSpectatorServerList :: (self: *ISteamMatchmakingServers, iApp: AppId_t, ppchFilters: **MatchMakingKeyValuePair_t, nFilters: uint32, pRequestServersResponse: *ISteamMatchmakingServerListResponse) -> HServerListRequest #foreign steam "SteamAPI_ISteamMatchmakingServers_RequestSpectatorServerList";
ReleaseRequest :: (self: *ISteamMatchmakingServers, hServerListRequest: HServerListRequest) #foreign steam "SteamAPI_ISteamMatchmakingServers_ReleaseRequest";
GetServerDetails :: (self: *ISteamMatchmakingServers, hRequest: HServerListRequest, iServer: s32) -> *gameserveritem_t #foreign steam "SteamAPI_ISteamMatchmakingServers_GetServerDetails";
CancelQuery :: (self: *ISteamMatchmakingServers, hRequest: HServerListRequest) #foreign steam "SteamAPI_ISteamMatchmakingServers_CancelQuery";
RefreshQuery :: (self: *ISteamMatchmakingServers, hRequest: HServerListRequest) #foreign steam "SteamAPI_ISteamMatchmakingServers_RefreshQuery";
IsRefreshing :: (self: *ISteamMatchmakingServers, hRequest: HServerListRequest) -> bool #foreign steam "SteamAPI_ISteamMatchmakingServers_IsRefreshing";
GetServerCount :: (self: *ISteamMatchmakingServers, hRequest: HServerListRequest) -> s32 #foreign steam "SteamAPI_ISteamMatchmakingServers_GetServerCount";
RefreshServer :: (self: *ISteamMatchmakingServers, hRequest: HServerListRequest, iServer: s32) #foreign steam "SteamAPI_ISteamMatchmakingServers_RefreshServer";
PingServer :: (self: *ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPingResponse) -> HServerQuery #foreign steam "SteamAPI_ISteamMatchmakingServers_PingServer";
PlayerDetails :: (self: *ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingPlayersResponse) -> HServerQuery #foreign steam "SteamAPI_ISteamMatchmakingServers_PlayerDetails";
ServerRules :: (self: *ISteamMatchmakingServers, unIP: uint32, usPort: uint16, pRequestServersResponse: *ISteamMatchmakingRulesResponse) -> HServerQuery #foreign steam "SteamAPI_ISteamMatchmakingServers_ServerRules";
CancelServerQuery :: (self: *ISteamMatchmakingServers, hServerQuery: HServerQuery) #foreign steam "SteamAPI_ISteamMatchmakingServers_CancelServerQuery";

// ISteamGameSearch
SteamGameSearch :: () -> *ISteamGameSearch #foreign steam "SteamAPI_SteamGameSearch_v001";
AddGameSearchParams :: (self: *ISteamGameSearch, pchKeyToFind: *char, pchValuesToFind: *char) -> EGameSearchErrorCode_t #foreign steam "SteamAPI_ISteamGameSearch_AddGameSearchParams";
SearchForGameWithLobby :: (self: *ISteamGameSearch, steamIDLobby: uint64_steamid, nPlayerMin: s32, nPlayerMax: s32) -> EGameSearchErrorCode_t #foreign steam "SteamAPI_ISteamGameSearch_SearchForGameWithLobby";
SearchForGameSolo :: (self: *ISteamGameSearch, nPlayerMin: s32, nPlayerMax: s32) -> EGameSearchErrorCode_t #foreign steam "SteamAPI_ISteamGameSearch_SearchForGameSolo";
AcceptGame :: (self: *ISteamGameSearch) -> EGameSearchErrorCode_t #foreign steam "SteamAPI_ISteamGameSearch_AcceptGame";
DeclineGame :: (self: *ISteamGameSearch) -> EGameSearchErrorCode_t #foreign steam "SteamAPI_ISteamGameSearch_DeclineGame";
RetrieveConnectionDetails :: (self: *ISteamGameSearch, steamIDHost: uint64_steamid, pchConnectionDetails: *char, cubConnectionDetails: s32) -> EGameSearchErrorCode_t #foreign steam "SteamAPI_ISteamGameSearch_RetrieveConnectionDetails";
EndGameSearch :: (self: *ISteamGameSearch) -> EGameSearchErrorCode_t #foreign steam "SteamAPI_ISteamGameSearch_EndGameSearch";
SetGameHostParams :: (self: *ISteamGameSearch, pchKey: *char, pchValue: *char) -> EGameSearchErrorCode_t #foreign steam "SteamAPI_ISteamGameSearch_SetGameHostParams";
SetConnectionDetails :: (self: *ISteamGameSearch, pchConnectionDetails: *char, cubConnectionDetails: s32) -> EGameSearchErrorCode_t #foreign steam "SteamAPI_ISteamGameSearch_SetConnectionDetails";
RequestPlayersForGame :: (self: *ISteamGameSearch, nPlayerMin: s32, nPlayerMax: s32, nMaxTeamSize: s32) -> EGameSearchErrorCode_t #foreign steam "SteamAPI_ISteamGameSearch_RequestPlayersForGame";
HostConfirmGameStart :: (self: *ISteamGameSearch, ullUniqueGameID: uint64) -> EGameSearchErrorCode_t #foreign steam "SteamAPI_ISteamGameSearch_HostConfirmGameStart";
CancelRequestPlayersForGame :: (self: *ISteamGameSearch) -> EGameSearchErrorCode_t #foreign steam "SteamAPI_ISteamGameSearch_CancelRequestPlayersForGame";
SubmitPlayerResult :: (self: *ISteamGameSearch, ullUniqueGameID: uint64, steamIDPlayer: uint64_steamid, EPlayerResult: EPlayerResult_t) -> EGameSearchErrorCode_t #foreign steam "SteamAPI_ISteamGameSearch_SubmitPlayerResult";
EndGame :: (self: *ISteamGameSearch, ullUniqueGameID: uint64) -> EGameSearchErrorCode_t #foreign steam "SteamAPI_ISteamGameSearch_EndGame";

// ISteamParties
SteamParties :: () -> *ISteamParties #foreign steam "SteamAPI_SteamParties_v002";
GetNumActiveBeacons :: (self: *ISteamParties) -> uint32 #foreign steam "SteamAPI_ISteamParties_GetNumActiveBeacons";
GetBeaconByIndex :: (self: *ISteamParties, unIndex: uint32) -> PartyBeaconID_t #foreign steam "SteamAPI_ISteamParties_GetBeaconByIndex";
GetBeaconDetails :: (self: *ISteamParties, ulBeaconID: PartyBeaconID_t, pSteamIDBeaconOwner: *CSteamID, pLocation: *SteamPartyBeaconLocation_t, pchMetadata: *char, cchMetadata: s32) -> bool #foreign steam "SteamAPI_ISteamParties_GetBeaconDetails";
JoinParty :: (self: *ISteamParties, ulBeaconID: PartyBeaconID_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamParties_JoinParty";
GetNumAvailableBeaconLocations :: (self: *ISteamParties, puNumLocations: *uint32) -> bool #foreign steam "SteamAPI_ISteamParties_GetNumAvailableBeaconLocations";
GetAvailableBeaconLocations :: (self: *ISteamParties, pLocationList: *SteamPartyBeaconLocation_t, uMaxNumLocations: uint32) -> bool #foreign steam "SteamAPI_ISteamParties_GetAvailableBeaconLocations";
CreateBeacon :: (self: *ISteamParties, unOpenSlots: uint32, pBeaconLocation: *SteamPartyBeaconLocation_t, pchConnectString: *char, pchMetadata: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamParties_CreateBeacon";
OnReservationCompleted :: (self: *ISteamParties, ulBeacon: PartyBeaconID_t, steamIDUser: uint64_steamid) #foreign steam "SteamAPI_ISteamParties_OnReservationCompleted";
CancelReservation :: (self: *ISteamParties, ulBeacon: PartyBeaconID_t, steamIDUser: uint64_steamid) #foreign steam "SteamAPI_ISteamParties_CancelReservation";
ChangeNumOpenSlots :: (self: *ISteamParties, ulBeacon: PartyBeaconID_t, unOpenSlots: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamParties_ChangeNumOpenSlots";
DestroyBeacon :: (self: *ISteamParties, ulBeacon: PartyBeaconID_t) -> bool #foreign steam "SteamAPI_ISteamParties_DestroyBeacon";
GetBeaconLocationData :: (self: *ISteamParties, BeaconLocation: SteamPartyBeaconLocation_t, eData: ESteamPartyBeaconLocationData, pchDataStringOut: *char, cchDataStringOut: s32) -> bool #foreign steam "SteamAPI_ISteamParties_GetBeaconLocationData";

// ISteamRemoteStorage
SteamRemoteStorage :: () -> *ISteamRemoteStorage #foreign steam "SteamAPI_SteamRemoteStorage_v014";
FileWrite :: (self: *ISteamRemoteStorage, pchFile: *char, pvData: *void, cubData: int32) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_FileWrite";
FileRead :: (self: *ISteamRemoteStorage, pchFile: *char, pvData: *void, cubDataToRead: int32) -> int32 #foreign steam "SteamAPI_ISteamRemoteStorage_FileRead";
FileWriteAsync :: (self: *ISteamRemoteStorage, pchFile: *char, pvData: *void, cubData: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_FileWriteAsync";
FileReadAsync :: (self: *ISteamRemoteStorage, pchFile: *char, nOffset: uint32, cubToRead: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_FileReadAsync";
FileReadAsyncComplete :: (self: *ISteamRemoteStorage, hReadCall: SteamAPICall_t, pvBuffer: *void, cubToRead: uint32) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_FileReadAsyncComplete";
FileForget :: (self: *ISteamRemoteStorage, pchFile: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_FileForget";
FileDelete :: (self: *ISteamRemoteStorage, pchFile: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_FileDelete";
FileShare :: (self: *ISteamRemoteStorage, pchFile: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_FileShare";
SetSyncPlatforms :: (self: *ISteamRemoteStorage, pchFile: *char, eRemoteStoragePlatform: ERemoteStoragePlatform) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_SetSyncPlatforms";
FileWriteStreamOpen :: (self: *ISteamRemoteStorage, pchFile: *char) -> UGCFileWriteStreamHandle_t #foreign steam "SteamAPI_ISteamRemoteStorage_FileWriteStreamOpen";
FileWriteStreamWriteChunk :: (self: *ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t, pvData: *void, cubData: int32) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_FileWriteStreamWriteChunk";
FileWriteStreamClose :: (self: *ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_FileWriteStreamClose";
FileWriteStreamCancel :: (self: *ISteamRemoteStorage, writeHandle: UGCFileWriteStreamHandle_t) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_FileWriteStreamCancel";
FileExists :: (self: *ISteamRemoteStorage, pchFile: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_FileExists";
FilePersisted :: (self: *ISteamRemoteStorage, pchFile: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_FilePersisted";
GetFileSize :: (self: *ISteamRemoteStorage, pchFile: *char) -> int32 #foreign steam "SteamAPI_ISteamRemoteStorage_GetFileSize";
GetFileTimestamp :: (self: *ISteamRemoteStorage, pchFile: *char) -> int64 #foreign steam "SteamAPI_ISteamRemoteStorage_GetFileTimestamp";
GetSyncPlatforms :: (self: *ISteamRemoteStorage, pchFile: *char) -> ERemoteStoragePlatform #foreign steam "SteamAPI_ISteamRemoteStorage_GetSyncPlatforms";
GetFileCount :: (self: *ISteamRemoteStorage) -> int32 #foreign steam "SteamAPI_ISteamRemoteStorage_GetFileCount";
GetFileNameAndSize :: (self: *ISteamRemoteStorage, iFile: s32, pnFileSizeInBytes: *int32) -> *char #foreign steam "SteamAPI_ISteamRemoteStorage_GetFileNameAndSize";
GetQuota :: (self: *ISteamRemoteStorage, pnTotalBytes: *uint64, puAvailableBytes: *uint64) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_GetQuota";
IsCloudEnabledForAccount :: (self: *ISteamRemoteStorage) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount";
IsCloudEnabledForApp :: (self: *ISteamRemoteStorage) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp";
SetCloudEnabledForApp :: (self: *ISteamRemoteStorage, bEnabled: bool) #foreign steam "SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp";
UGCDownload :: (self: *ISteamRemoteStorage, hContent: UGCHandle_t, unPriority: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_UGCDownload";
GetUGCDownloadProgress :: (self: *ISteamRemoteStorage, hContent: UGCHandle_t, pnBytesDownloaded: *int32, pnBytesExpected: *int32) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_GetUGCDownloadProgress";
GetUGCDetails :: (self: *ISteamRemoteStorage, hContent: UGCHandle_t, pnAppID: *AppId_t, ppchName: **char, pnFileSizeInBytes: *int32, pSteamIDOwner: *CSteamID) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_GetUGCDetails";
UGCRead :: (self: *ISteamRemoteStorage, hContent: UGCHandle_t, pvData: *void, cubDataToRead: int32, cOffset: uint32, eAction: EUGCReadAction) -> int32 #foreign steam "SteamAPI_ISteamRemoteStorage_UGCRead";
GetCachedUGCCount :: (self: *ISteamRemoteStorage) -> int32 #foreign steam "SteamAPI_ISteamRemoteStorage_GetCachedUGCCount";
GetCachedUGCHandle :: (self: *ISteamRemoteStorage, iCachedContent: int32) -> UGCHandle_t #foreign steam "SteamAPI_ISteamRemoteStorage_GetCachedUGCHandle";
PublishWorkshopFile :: (self: *ISteamRemoteStorage, pchFile: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_PublishWorkshopFile";
CreatePublishedFileUpdateRequest :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> PublishedFileUpdateHandle_t #foreign steam "SteamAPI_ISteamRemoteStorage_CreatePublishedFileUpdateRequest";
UpdatePublishedFileFile :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchFile: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileFile";
UpdatePublishedFilePreviewFile :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchPreviewFile: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_UpdatePublishedFilePreviewFile";
UpdatePublishedFileTitle :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchTitle: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTitle";
UpdatePublishedFileDescription :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchDescription: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileDescription";
UpdatePublishedFileVisibility :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileVisibility";
UpdatePublishedFileTags :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pTags: *SteamParamStringArray_t) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTags";
CommitPublishedFileUpdate :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_CommitPublishedFileUpdate";
GetPublishedFileDetails :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_GetPublishedFileDetails";
DeletePublishedFile :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_DeletePublishedFile";
EnumerateUserPublishedFiles :: (self: *ISteamRemoteStorage, unStartIndex: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_EnumerateUserPublishedFiles";
SubscribePublishedFile :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_SubscribePublishedFile";
EnumerateUserSubscribedFiles :: (self: *ISteamRemoteStorage, unStartIndex: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_EnumerateUserSubscribedFiles";
UnsubscribePublishedFile :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_UnsubscribePublishedFile";
UpdatePublishedFileSetChangeDescription :: (self: *ISteamRemoteStorage, updateHandle: PublishedFileUpdateHandle_t, pchChangeDescription: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription";
GetPublishedItemVoteDetails :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_GetPublishedItemVoteDetails";
UpdateUserPublishedItemVote :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_UpdateUserPublishedItemVote";
GetUserPublishedItemVoteDetails :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_GetUserPublishedItemVoteDetails";
EnumerateUserSharedWorkshopFiles :: (self: *ISteamRemoteStorage, steamId: uint64_steamid, unStartIndex: uint32, pRequiredTags: *SteamParamStringArray_t, pExcludedTags: *SteamParamStringArray_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles";
PublishVideo :: (self: *ISteamRemoteStorage, eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: *char, pchVideoIdentifier: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_PublishVideo";
SetUserPublishedFileAction :: (self: *ISteamRemoteStorage, unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_SetUserPublishedFileAction";
EnumeratePublishedFilesByUserAction :: (self: *ISteamRemoteStorage, eAction: EWorkshopFileAction, unStartIndex: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_EnumeratePublishedFilesByUserAction";
EnumeratePublishedWorkshopFiles :: (self: *ISteamRemoteStorage, eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: *SteamParamStringArray_t, pUserTags: *SteamParamStringArray_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_EnumeratePublishedWorkshopFiles";
UGCDownloadToLocation :: (self: *ISteamRemoteStorage, hContent: UGCHandle_t, pchLocation: *char, unPriority: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_UGCDownloadToLocation";

// ISteamUserStats
SteamUserStats :: () -> *ISteamUserStats #foreign steam "SteamAPI_SteamUserStats_v012";
RequestCurrentStats :: (self: *ISteamUserStats) -> bool #foreign steam "SteamAPI_ISteamUserStats_RequestCurrentStats";
GetStatInt32 :: (self: *ISteamUserStats, pchName: *char, pData: *int32) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetStatInt32";
GetStatFloat :: (self: *ISteamUserStats, pchName: *char, pData: *float) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetStatFloat";
SetStatInt32 :: (self: *ISteamUserStats, pchName: *char, nData: int32) -> bool #foreign steam "SteamAPI_ISteamUserStats_SetStatInt32";
SetStatFloat :: (self: *ISteamUserStats, pchName: *char, fData: float) -> bool #foreign steam "SteamAPI_ISteamUserStats_SetStatFloat";
UpdateAvgRateStat :: (self: *ISteamUserStats, pchName: *char, flCountThisSession: float, dSessionLength: double) -> bool #foreign steam "SteamAPI_ISteamUserStats_UpdateAvgRateStat";
GetAchievement :: (self: *ISteamUserStats, pchName: *char, pbAchieved: *bool) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetAchievement";
SetAchievement :: (self: *ISteamUserStats, pchName: *char) -> bool #foreign steam "SteamAPI_ISteamUserStats_SetAchievement";
ClearAchievement :: (self: *ISteamUserStats, pchName: *char) -> bool #foreign steam "SteamAPI_ISteamUserStats_ClearAchievement";
GetAchievementAndUnlockTime :: (self: *ISteamUserStats, pchName: *char, pbAchieved: *bool, punUnlockTime: *uint32) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetAchievementAndUnlockTime";
StoreStats :: (self: *ISteamUserStats) -> bool #foreign steam "SteamAPI_ISteamUserStats_StoreStats";
GetAchievementIcon :: (self: *ISteamUserStats, pchName: *char) -> s32 #foreign steam "SteamAPI_ISteamUserStats_GetAchievementIcon";
GetAchievementDisplayAttribute :: (self: *ISteamUserStats, pchName: *char, pchKey: *char) -> *char #foreign steam "SteamAPI_ISteamUserStats_GetAchievementDisplayAttribute";
IndicateAchievementProgress :: (self: *ISteamUserStats, pchName: *char, nCurProgress: uint32, nMaxProgress: uint32) -> bool #foreign steam "SteamAPI_ISteamUserStats_IndicateAchievementProgress";
GetNumAchievements :: (self: *ISteamUserStats) -> uint32 #foreign steam "SteamAPI_ISteamUserStats_GetNumAchievements";
GetAchievementName :: (self: *ISteamUserStats, iAchievement: uint32) -> *char #foreign steam "SteamAPI_ISteamUserStats_GetAchievementName";
RequestUserStats :: (self: *ISteamUserStats, steamIDUser: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_RequestUserStats";
GetUserStatInt32 :: (self: *ISteamUserStats, steamIDUser: uint64_steamid, pchName: *char, pData: *int32) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetUserStatInt32";
GetUserStatFloat :: (self: *ISteamUserStats, steamIDUser: uint64_steamid, pchName: *char, pData: *float) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetUserStatFloat";
GetUserAchievement :: (self: *ISteamUserStats, steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetUserAchievement";
GetUserAchievementAndUnlockTime :: (self: *ISteamUserStats, steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool, punUnlockTime: *uint32) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetUserAchievementAndUnlockTime";
ResetAllStats :: (self: *ISteamUserStats, bAchievementsToo: bool) -> bool #foreign steam "SteamAPI_ISteamUserStats_ResetAllStats";
FindOrCreateLeaderboard :: (self: *ISteamUserStats, pchLeaderboardName: *char, eLeaderboardSortMethod: ELeaderboardSortMethod, eLeaderboardDisplayType: ELeaderboardDisplayType) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_FindOrCreateLeaderboard";
FindLeaderboard :: (self: *ISteamUserStats, pchLeaderboardName: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_FindLeaderboard";
GetLeaderboardName :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> *char #foreign steam "SteamAPI_ISteamUserStats_GetLeaderboardName";
GetLeaderboardEntryCount :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> s32 #foreign steam "SteamAPI_ISteamUserStats_GetLeaderboardEntryCount";
GetLeaderboardSortMethod :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardSortMethod #foreign steam "SteamAPI_ISteamUserStats_GetLeaderboardSortMethod";
GetLeaderboardDisplayType :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t) -> ELeaderboardDisplayType #foreign steam "SteamAPI_ISteamUserStats_GetLeaderboardDisplayType";
DownloadLeaderboardEntries :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardDataRequest: ELeaderboardDataRequest, nRangeStart: s32, nRangeEnd: s32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_DownloadLeaderboardEntries";
DownloadLeaderboardEntriesForUsers :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, prgUsers: *CSteamID, cUsers: s32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_DownloadLeaderboardEntriesForUsers";
GetDownloadedLeaderboardEntry :: (self: *ISteamUserStats, hSteamLeaderboardEntries: SteamLeaderboardEntries_t, index: s32, pLeaderboardEntry: *LeaderboardEntry_t, pDetails: *int32, cDetailsMax: s32) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetDownloadedLeaderboardEntry";
UploadLeaderboardScore :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, eLeaderboardUploadScoreMethod: ELeaderboardUploadScoreMethod, nScore: int32, pScoreDetails: *int32, cScoreDetailsCount: s32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_UploadLeaderboardScore";
AttachLeaderboardUGC :: (self: *ISteamUserStats, hSteamLeaderboard: SteamLeaderboard_t, hUGC: UGCHandle_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_AttachLeaderboardUGC";
GetNumberOfCurrentPlayers :: (self: *ISteamUserStats) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers";
RequestGlobalAchievementPercentages :: (self: *ISteamUserStats) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_RequestGlobalAchievementPercentages";
GetMostAchievedAchievementInfo :: (self: *ISteamUserStats, pchName: *char, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 #foreign steam "SteamAPI_ISteamUserStats_GetMostAchievedAchievementInfo";
GetNextMostAchievedAchievementInfo :: (self: *ISteamUserStats, iIteratorPrevious: s32, pchName: *char, unNameBufLen: uint32, pflPercent: *float, pbAchieved: *bool) -> s32 #foreign steam "SteamAPI_ISteamUserStats_GetNextMostAchievedAchievementInfo";
GetAchievementAchievedPercent :: (self: *ISteamUserStats, pchName: *char, pflPercent: *float) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetAchievementAchievedPercent";
RequestGlobalStats :: (self: *ISteamUserStats, nHistoryDays: s32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUserStats_RequestGlobalStats";
GetGlobalStatInt64 :: (self: *ISteamUserStats, pchStatName: *char, pData: *int64) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetGlobalStatInt64";
GetGlobalStatDouble :: (self: *ISteamUserStats, pchStatName: *char, pData: *double) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetGlobalStatDouble";
GetGlobalStatHistoryInt64 :: (self: *ISteamUserStats, pchStatName: *char, pData: *int64, cubData: uint32) -> int32 #foreign steam "SteamAPI_ISteamUserStats_GetGlobalStatHistoryInt64";
GetGlobalStatHistoryDouble :: (self: *ISteamUserStats, pchStatName: *char, pData: *double, cubData: uint32) -> int32 #foreign steam "SteamAPI_ISteamUserStats_GetGlobalStatHistoryDouble";
GetAchievementProgressLimitsInt32 :: (self: *ISteamUserStats, pchName: *char, pnMinProgress: *int32, pnMaxProgress: *int32) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetAchievementProgressLimitsInt32";
GetAchievementProgressLimitsFloat :: (self: *ISteamUserStats, pchName: *char, pfMinProgress: *float, pfMaxProgress: *float) -> bool #foreign steam "SteamAPI_ISteamUserStats_GetAchievementProgressLimitsFloat";

// ISteamApps
SteamApps :: () -> *ISteamApps #foreign steam "SteamAPI_SteamApps_v008";
SteamGameServerApps :: () -> *ISteamApps #foreign steam "SteamAPI_SteamGameServerApps_v008";
BIsSubscribed :: (self: *ISteamApps) -> bool #foreign steam "SteamAPI_ISteamApps_BIsSubscribed";
BIsLowViolence :: (self: *ISteamApps) -> bool #foreign steam "SteamAPI_ISteamApps_BIsLowViolence";
BIsCybercafe :: (self: *ISteamApps) -> bool #foreign steam "SteamAPI_ISteamApps_BIsCybercafe";
BIsVACBanned :: (self: *ISteamApps) -> bool #foreign steam "SteamAPI_ISteamApps_BIsVACBanned";
GetCurrentGameLanguage :: (self: *ISteamApps) -> *char #foreign steam "SteamAPI_ISteamApps_GetCurrentGameLanguage";
GetAvailableGameLanguages :: (self: *ISteamApps) -> *char #foreign steam "SteamAPI_ISteamApps_GetAvailableGameLanguages";
BIsSubscribedApp :: (self: *ISteamApps, appID: AppId_t) -> bool #foreign steam "SteamAPI_ISteamApps_BIsSubscribedApp";
BIsDlcInstalled :: (self: *ISteamApps, appID: AppId_t) -> bool #foreign steam "SteamAPI_ISteamApps_BIsDlcInstalled";
GetEarliestPurchaseUnixTime :: (self: *ISteamApps, nAppID: AppId_t) -> uint32 #foreign steam "SteamAPI_ISteamApps_GetEarliestPurchaseUnixTime";
BIsSubscribedFromFreeWeekend :: (self: *ISteamApps) -> bool #foreign steam "SteamAPI_ISteamApps_BIsSubscribedFromFreeWeekend";
GetDLCCount :: (self: *ISteamApps) -> s32 #foreign steam "SteamAPI_ISteamApps_GetDLCCount";
BGetDLCDataByIndex :: (self: *ISteamApps, iDLC: s32, pAppID: *AppId_t, pbAvailable: *bool, pchName: *char, cchNameBufferSize: s32) -> bool #foreign steam "SteamAPI_ISteamApps_BGetDLCDataByIndex";
InstallDLC :: (self: *ISteamApps, nAppID: AppId_t) #foreign steam "SteamAPI_ISteamApps_InstallDLC";
UninstallDLC :: (self: *ISteamApps, nAppID: AppId_t) #foreign steam "SteamAPI_ISteamApps_UninstallDLC";
RequestAppProofOfPurchaseKey :: (self: *ISteamApps, nAppID: AppId_t) #foreign steam "SteamAPI_ISteamApps_RequestAppProofOfPurchaseKey";
GetCurrentBetaName :: (self: *ISteamApps, pchName: *char, cchNameBufferSize: s32) -> bool #foreign steam "SteamAPI_ISteamApps_GetCurrentBetaName";
MarkContentCorrupt :: (self: *ISteamApps, bMissingFilesOnly: bool) -> bool #foreign steam "SteamAPI_ISteamApps_MarkContentCorrupt";
GetInstalledDepots :: (self: *ISteamApps, appID: AppId_t, pvecDepots: *DepotId_t, cMaxDepots: uint32) -> uint32 #foreign steam "SteamAPI_ISteamApps_GetInstalledDepots";
GetAppInstallDir :: (self: *ISteamApps, appID: AppId_t, pchFolder: *char, cchFolderBufferSize: uint32) -> uint32 #foreign steam "SteamAPI_ISteamApps_GetAppInstallDir";
BIsAppInstalled :: (self: *ISteamApps, appID: AppId_t) -> bool #foreign steam "SteamAPI_ISteamApps_BIsAppInstalled";
GetAppOwner :: (self: *ISteamApps) -> uint64_steamid #foreign steam "SteamAPI_ISteamApps_GetAppOwner";
GetLaunchQueryParam :: (self: *ISteamApps, pchKey: *char) -> *char #foreign steam "SteamAPI_ISteamApps_GetLaunchQueryParam";
GetDlcDownloadProgress :: (self: *ISteamApps, nAppID: AppId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool #foreign steam "SteamAPI_ISteamApps_GetDlcDownloadProgress";
GetAppBuildId :: (self: *ISteamApps) -> s32 #foreign steam "SteamAPI_ISteamApps_GetAppBuildId";
RequestAllProofOfPurchaseKeys :: (self: *ISteamApps) #foreign steam "SteamAPI_ISteamApps_RequestAllProofOfPurchaseKeys";
GetFileDetails :: (self: *ISteamApps, pszFileName: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamApps_GetFileDetails";
GetLaunchCommandLine :: (self: *ISteamApps, pszCommandLine: *char, cubCommandLine: s32) -> s32 #foreign steam "SteamAPI_ISteamApps_GetLaunchCommandLine";
BIsSubscribedFromFamilySharing :: (self: *ISteamApps) -> bool #foreign steam "SteamAPI_ISteamApps_BIsSubscribedFromFamilySharing";
BIsTimedTrial :: (self: *ISteamApps, punSecondsAllowed: *uint32, punSecondsPlayed: *uint32) -> bool #foreign steam "SteamAPI_ISteamApps_BIsTimedTrial";

// ISteamNetworking
SteamNetworking :: () -> *ISteamNetworking #foreign steam "SteamAPI_SteamNetworking_v006";
SteamGameServerNetworking :: () -> *ISteamNetworking #foreign steam "SteamAPI_SteamGameServerNetworking_v006";
SendP2PPacket :: (self: *ISteamNetworking, steamIDRemote: uint64_steamid, pubData: *void, cubData: uint32, eP2PSendType: EP2PSend, nChannel: s32) -> bool #foreign steam "SteamAPI_ISteamNetworking_SendP2PPacket";
IsP2PPacketAvailable :: (self: *ISteamNetworking, pcubMsgSize: *uint32, nChannel: s32) -> bool #foreign steam "SteamAPI_ISteamNetworking_IsP2PPacketAvailable";
ReadP2PPacket :: (self: *ISteamNetworking, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, psteamIDRemote: *CSteamID, nChannel: s32) -> bool #foreign steam "SteamAPI_ISteamNetworking_ReadP2PPacket";
AcceptP2PSessionWithUser :: (self: *ISteamNetworking, steamIDRemote: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamNetworking_AcceptP2PSessionWithUser";
CloseP2PSessionWithUser :: (self: *ISteamNetworking, steamIDRemote: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamNetworking_CloseP2PSessionWithUser";
CloseP2PChannelWithUser :: (self: *ISteamNetworking, steamIDRemote: uint64_steamid, nChannel: s32) -> bool #foreign steam "SteamAPI_ISteamNetworking_CloseP2PChannelWithUser";
GetP2PSessionState :: (self: *ISteamNetworking, steamIDRemote: uint64_steamid, pConnectionState: *P2PSessionState_t) -> bool #foreign steam "SteamAPI_ISteamNetworking_GetP2PSessionState";
AllowP2PPacketRelay :: (self: *ISteamNetworking, bAllow: bool) -> bool #foreign steam "SteamAPI_ISteamNetworking_AllowP2PPacketRelay";
CreateListenSocket :: (self: *ISteamNetworking, nVirtualP2PPort: s32, nIP: SteamIPAddress_t, nPort: uint16, bAllowUseOfPacketRelay: bool) -> SNetListenSocket_t #foreign steam "SteamAPI_ISteamNetworking_CreateListenSocket";
CreateP2PConnectionSocket :: (self: *ISteamNetworking, steamIDTarget: uint64_steamid, nVirtualPort: s32, nTimeoutSec: s32, bAllowUseOfPacketRelay: bool) -> SNetSocket_t #foreign steam "SteamAPI_ISteamNetworking_CreateP2PConnectionSocket";
CreateConnectionSocket :: (self: *ISteamNetworking, nIP: SteamIPAddress_t, nPort: uint16, nTimeoutSec: s32) -> SNetSocket_t #foreign steam "SteamAPI_ISteamNetworking_CreateConnectionSocket";
DestroySocket :: (self: *ISteamNetworking, hSocket: SNetSocket_t, bNotifyRemoteEnd: bool) -> bool #foreign steam "SteamAPI_ISteamNetworking_DestroySocket";
DestroyListenSocket :: (self: *ISteamNetworking, hSocket: SNetListenSocket_t, bNotifyRemoteEnd: bool) -> bool #foreign steam "SteamAPI_ISteamNetworking_DestroyListenSocket";
SendDataOnSocket :: (self: *ISteamNetworking, hSocket: SNetSocket_t, pubData: *void, cubData: uint32, bReliable: bool) -> bool #foreign steam "SteamAPI_ISteamNetworking_SendDataOnSocket";
IsDataAvailableOnSocket :: (self: *ISteamNetworking, hSocket: SNetSocket_t, pcubMsgSize: *uint32) -> bool #foreign steam "SteamAPI_ISteamNetworking_IsDataAvailableOnSocket";
RetrieveDataFromSocket :: (self: *ISteamNetworking, hSocket: SNetSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32) -> bool #foreign steam "SteamAPI_ISteamNetworking_RetrieveDataFromSocket";
IsDataAvailable :: (self: *ISteamNetworking, hListenSocket: SNetListenSocket_t, pcubMsgSize: *uint32, phSocket: *SNetSocket_t) -> bool #foreign steam "SteamAPI_ISteamNetworking_IsDataAvailable";
RetrieveData :: (self: *ISteamNetworking, hListenSocket: SNetListenSocket_t, pubDest: *void, cubDest: uint32, pcubMsgSize: *uint32, phSocket: *SNetSocket_t) -> bool #foreign steam "SteamAPI_ISteamNetworking_RetrieveData";
GetSocketInfo :: (self: *ISteamNetworking, hSocket: SNetSocket_t, pSteamIDRemote: *CSteamID, peSocketStatus: *s32, punIPRemote: *SteamIPAddress_t, punPortRemote: *uint16) -> bool #foreign steam "SteamAPI_ISteamNetworking_GetSocketInfo";
GetListenSocketInfo :: (self: *ISteamNetworking, hListenSocket: SNetListenSocket_t, pnIP: *SteamIPAddress_t, pnPort: *uint16) -> bool #foreign steam "SteamAPI_ISteamNetworking_GetListenSocketInfo";
GetSocketConnectionType :: (self: *ISteamNetworking, hSocket: SNetSocket_t) -> ESNetSocketConnectionType #foreign steam "SteamAPI_ISteamNetworking_GetSocketConnectionType";
GetMaxPacketSize :: (self: *ISteamNetworking, hSocket: SNetSocket_t) -> s32 #foreign steam "SteamAPI_ISteamNetworking_GetMaxPacketSize";

// ISteamScreenshots
SteamScreenshots :: () -> *ISteamScreenshots #foreign steam "SteamAPI_SteamScreenshots_v003";
WriteScreenshot :: (self: *ISteamScreenshots, pubRGB: *void, cubRGB: uint32, nWidth: s32, nHeight: s32) -> ScreenshotHandle #foreign steam "SteamAPI_ISteamScreenshots_WriteScreenshot";
AddScreenshotToLibrary :: (self: *ISteamScreenshots, pchFilename: *char, pchThumbnailFilename: *char, nWidth: s32, nHeight: s32) -> ScreenshotHandle #foreign steam "SteamAPI_ISteamScreenshots_AddScreenshotToLibrary";
TriggerScreenshot :: (self: *ISteamScreenshots) #foreign steam "SteamAPI_ISteamScreenshots_TriggerScreenshot";
HookScreenshots :: (self: *ISteamScreenshots, bHook: bool) #foreign steam "SteamAPI_ISteamScreenshots_HookScreenshots";
SetLocation :: (self: *ISteamScreenshots, hScreenshot: ScreenshotHandle, pchLocation: *char) -> bool #foreign steam "SteamAPI_ISteamScreenshots_SetLocation";
TagUser :: (self: *ISteamScreenshots, hScreenshot: ScreenshotHandle, steamID: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamScreenshots_TagUser";
TagPublishedFile :: (self: *ISteamScreenshots, hScreenshot: ScreenshotHandle, unPublishedFileID: PublishedFileId_t) -> bool #foreign steam "SteamAPI_ISteamScreenshots_TagPublishedFile";
IsScreenshotsHooked :: (self: *ISteamScreenshots) -> bool #foreign steam "SteamAPI_ISteamScreenshots_IsScreenshotsHooked";
AddVRScreenshotToLibrary :: (self: *ISteamScreenshots, eType: EVRScreenshotType, pchFilename: *char, pchVRFilename: *char) -> ScreenshotHandle #foreign steam "SteamAPI_ISteamScreenshots_AddVRScreenshotToLibrary";

// ISteamMusic
SteamMusic :: () -> *ISteamMusic #foreign steam "SteamAPI_SteamMusic_v001";
BIsEnabled :: (self: *ISteamMusic) -> bool #foreign steam "SteamAPI_ISteamMusic_BIsEnabled";
BIsPlaying :: (self: *ISteamMusic) -> bool #foreign steam "SteamAPI_ISteamMusic_BIsPlaying";
GetPlaybackStatus :: (self: *ISteamMusic) -> AudioPlayback_Status #foreign steam "SteamAPI_ISteamMusic_GetPlaybackStatus";
Play :: (self: *ISteamMusic) #foreign steam "SteamAPI_ISteamMusic_Play";
Pause :: (self: *ISteamMusic) #foreign steam "SteamAPI_ISteamMusic_Pause";
PlayPrevious :: (self: *ISteamMusic) #foreign steam "SteamAPI_ISteamMusic_PlayPrevious";
PlayNext :: (self: *ISteamMusic) #foreign steam "SteamAPI_ISteamMusic_PlayNext";
SetVolume :: (self: *ISteamMusic, flVolume: float) #foreign steam "SteamAPI_ISteamMusic_SetVolume";
GetVolume :: (self: *ISteamMusic) -> float #foreign steam "SteamAPI_ISteamMusic_GetVolume";

// ISteamMusicRemote
SteamMusicRemote :: () -> *ISteamMusicRemote #foreign steam "SteamAPI_SteamMusicRemote_v001";
RegisterSteamMusicRemote :: (self: *ISteamMusicRemote, pchName: *char) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_RegisterSteamMusicRemote";
DeregisterSteamMusicRemote :: (self: *ISteamMusicRemote) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_DeregisterSteamMusicRemote";
BIsCurrentMusicRemote :: (self: *ISteamMusicRemote) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_BIsCurrentMusicRemote";
BActivationSuccess :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_BActivationSuccess";
SetDisplayName :: (self: *ISteamMusicRemote, pchDisplayName: *char) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_SetDisplayName";
SetPNGIcon_64x64 :: (self: *ISteamMusicRemote, pvBuffer: *void, cbBufferLength: uint32) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_SetPNGIcon_64x64";
EnablePlayPrevious :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_EnablePlayPrevious";
EnablePlayNext :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_EnablePlayNext";
EnableShuffled :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_EnableShuffled";
EnableLooped :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_EnableLooped";
EnableQueue :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_EnableQueue";
EnablePlaylists :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_EnablePlaylists";
UpdatePlaybackStatus :: (self: *ISteamMusicRemote, nStatus: AudioPlayback_Status) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_UpdatePlaybackStatus";
UpdateShuffled :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_UpdateShuffled";
UpdateLooped :: (self: *ISteamMusicRemote, bValue: bool) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_UpdateLooped";
UpdateVolume :: (self: *ISteamMusicRemote, flValue: float) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_UpdateVolume";
CurrentEntryWillChange :: (self: *ISteamMusicRemote) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_CurrentEntryWillChange";
CurrentEntryIsAvailable :: (self: *ISteamMusicRemote, bAvailable: bool) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_CurrentEntryIsAvailable";
UpdateCurrentEntryText :: (self: *ISteamMusicRemote, pchText: *char) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_UpdateCurrentEntryText";
UpdateCurrentEntryElapsedSeconds :: (self: *ISteamMusicRemote, nValue: s32) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_UpdateCurrentEntryElapsedSeconds";
UpdateCurrentEntryCoverArt :: (self: *ISteamMusicRemote, pvBuffer: *void, cbBufferLength: uint32) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_UpdateCurrentEntryCoverArt";
CurrentEntryDidChange :: (self: *ISteamMusicRemote) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_CurrentEntryDidChange";
QueueWillChange :: (self: *ISteamMusicRemote) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_QueueWillChange";
ResetQueueEntries :: (self: *ISteamMusicRemote) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_ResetQueueEntries";
SetQueueEntry :: (self: *ISteamMusicRemote, nID: s32, nPosition: s32, pchEntryText: *char) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_SetQueueEntry";
SetCurrentQueueEntry :: (self: *ISteamMusicRemote, nID: s32) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_SetCurrentQueueEntry";
QueueDidChange :: (self: *ISteamMusicRemote) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_QueueDidChange";
PlaylistWillChange :: (self: *ISteamMusicRemote) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_PlaylistWillChange";
ResetPlaylistEntries :: (self: *ISteamMusicRemote) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_ResetPlaylistEntries";
SetPlaylistEntry :: (self: *ISteamMusicRemote, nID: s32, nPosition: s32, pchEntryText: *char) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_SetPlaylistEntry";
SetCurrentPlaylistEntry :: (self: *ISteamMusicRemote, nID: s32) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_SetCurrentPlaylistEntry";
PlaylistDidChange :: (self: *ISteamMusicRemote) -> bool #foreign steam "SteamAPI_ISteamMusicRemote_PlaylistDidChange";

// ISteamHTTP
SteamHTTP :: () -> *ISteamHTTP #foreign steam "SteamAPI_SteamHTTP_v003";
SteamGameServerHTTP :: () -> *ISteamHTTP #foreign steam "SteamAPI_SteamGameServerHTTP_v003";
CreateHTTPRequest :: (self: *ISteamHTTP, eHTTPRequestMethod: EHTTPMethod, pchAbsoluteURL: *char) -> HTTPRequestHandle #foreign steam "SteamAPI_ISteamHTTP_CreateHTTPRequest";
SetHTTPRequestContextValue :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, ulContextValue: uint64) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequestContextValue";
SetHTTPRequestNetworkActivityTimeout :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, unTimeoutSeconds: uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequestNetworkActivityTimeout";
SetHTTPRequestHeaderValue :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: *char, pchHeaderValue: *char) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequestHeaderValue";
SetHTTPRequestGetOrPostParameter :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pchParamName: *char, pchParamValue: *char) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequestGetOrPostParameter";
SendHTTPRequest :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool #foreign steam "SteamAPI_ISteamHTTP_SendHTTPRequest";
SendHTTPRequestAndStreamResponse :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pCallHandle: *SteamAPICall_t) -> bool #foreign steam "SteamAPI_ISteamHTTP_SendHTTPRequestAndStreamResponse";
DeferHTTPRequest :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle) -> bool #foreign steam "SteamAPI_ISteamHTTP_DeferHTTPRequest";
PrioritizeHTTPRequest :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle) -> bool #foreign steam "SteamAPI_ISteamHTTP_PrioritizeHTTPRequest";
GetHTTPResponseHeaderSize :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: *char, unResponseHeaderSize: *uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_GetHTTPResponseHeaderSize";
GetHTTPResponseHeaderValue :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pchHeaderName: *char, pHeaderValueBuffer: *uint8, unBufferSize: uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_GetHTTPResponseHeaderValue";
GetHTTPResponseBodySize :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, unBodySize: *uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_GetHTTPResponseBodySize";
GetHTTPResponseBodyData :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_GetHTTPResponseBodyData";
GetHTTPStreamingResponseBodyData :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, cOffset: uint32, pBodyDataBuffer: *uint8, unBufferSize: uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_GetHTTPStreamingResponseBodyData";
ReleaseHTTPRequest :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle) -> bool #foreign steam "SteamAPI_ISteamHTTP_ReleaseHTTPRequest";
GetHTTPDownloadProgressPct :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pflPercentOut: *float) -> bool #foreign steam "SteamAPI_ISteamHTTP_GetHTTPDownloadProgressPct";
SetHTTPRequestRawPostBody :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pchContentType: *char, pubBody: *uint8, unBodyLen: uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequestRawPostBody";
CreateCookieContainer :: (self: *ISteamHTTP, bAllowResponsesToModify: bool) -> HTTPCookieContainerHandle #foreign steam "SteamAPI_ISteamHTTP_CreateCookieContainer";
ReleaseCookieContainer :: (self: *ISteamHTTP, hCookieContainer: HTTPCookieContainerHandle) -> bool #foreign steam "SteamAPI_ISteamHTTP_ReleaseCookieContainer";
SetCookie :: (self: *ISteamHTTP, hCookieContainer: HTTPCookieContainerHandle, pchHost: *char, pchUrl: *char, pchCookie: *char) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetCookie";
SetHTTPRequestCookieContainer :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, hCookieContainer: HTTPCookieContainerHandle) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequestCookieContainer";
SetHTTPRequestUserAgentInfo :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pchUserAgentInfo: *char) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequestUserAgentInfo";
SetHTTPRequestRequiresVerifiedCertificate :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, bRequireVerifiedCertificate: bool) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequestRequiresVerifiedCertificate";
SetHTTPRequestAbsoluteTimeoutMS :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, unMilliseconds: uint32) -> bool #foreign steam "SteamAPI_ISteamHTTP_SetHTTPRequestAbsoluteTimeoutMS";
GetHTTPRequestWasTimedOut :: (self: *ISteamHTTP, hRequest: HTTPRequestHandle, pbWasTimedOut: *bool) -> bool #foreign steam "SteamAPI_ISteamHTTP_GetHTTPRequestWasTimedOut";

// ISteamInput
SteamInput :: () -> *ISteamInput #foreign steam "SteamAPI_SteamInput_v001";
Init :: (self: *ISteamInput) -> bool #foreign steam "SteamAPI_ISteamInput_Init";
Shutdown :: (self: *ISteamInput) -> bool #foreign steam "SteamAPI_ISteamInput_Shutdown";
RunFrame :: (self: *ISteamInput) #foreign steam "SteamAPI_ISteamInput_RunFrame";
GetConnectedControllers :: (self: *ISteamInput, handlesOut: *InputHandle_t) -> s32 #foreign steam "SteamAPI_ISteamInput_GetConnectedControllers";
GetActionSetHandle :: (self: *ISteamInput, pszActionSetName: *char) -> InputActionSetHandle_t #foreign steam "SteamAPI_ISteamInput_GetActionSetHandle";
ActivateActionSet :: (self: *ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t) #foreign steam "SteamAPI_ISteamInput_ActivateActionSet";
GetCurrentActionSet :: (self: *ISteamInput, inputHandle: InputHandle_t) -> InputActionSetHandle_t #foreign steam "SteamAPI_ISteamInput_GetCurrentActionSet";
ActivateActionSetLayer :: (self: *ISteamInput, inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) #foreign steam "SteamAPI_ISteamInput_ActivateActionSetLayer";
DeactivateActionSetLayer :: (self: *ISteamInput, inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) #foreign steam "SteamAPI_ISteamInput_DeactivateActionSetLayer";
DeactivateAllActionSetLayers :: (self: *ISteamInput, inputHandle: InputHandle_t) #foreign steam "SteamAPI_ISteamInput_DeactivateAllActionSetLayers";
GetActiveActionSetLayers :: (self: *ISteamInput, inputHandle: InputHandle_t, handlesOut: *InputActionSetHandle_t) -> s32 #foreign steam "SteamAPI_ISteamInput_GetActiveActionSetLayers";
GetDigitalActionHandle :: (self: *ISteamInput, pszActionName: *char) -> InputDigitalActionHandle_t #foreign steam "SteamAPI_ISteamInput_GetDigitalActionHandle";
GetDigitalActionData :: (self: *ISteamInput, inputHandle: InputHandle_t, digitalActionHandle: InputDigitalActionHandle_t) -> InputDigitalActionData_t #foreign steam "SteamAPI_ISteamInput_GetDigitalActionData";
GetDigitalActionOrigins :: (self: *ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, digitalActionHandle: InputDigitalActionHandle_t, originsOut: *EInputActionOrigin) -> s32 #foreign steam "SteamAPI_ISteamInput_GetDigitalActionOrigins";
GetAnalogActionHandle :: (self: *ISteamInput, pszActionName: *char) -> InputAnalogActionHandle_t #foreign steam "SteamAPI_ISteamInput_GetAnalogActionHandle";
GetAnalogActionData :: (self: *ISteamInput, inputHandle: InputHandle_t, analogActionHandle: InputAnalogActionHandle_t) -> InputAnalogActionData_t #foreign steam "SteamAPI_ISteamInput_GetAnalogActionData";
GetAnalogActionOrigins :: (self: *ISteamInput, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, analogActionHandle: InputAnalogActionHandle_t, originsOut: *EInputActionOrigin) -> s32 #foreign steam "SteamAPI_ISteamInput_GetAnalogActionOrigins";
GetGlyphForActionOrigin :: (self: *ISteamInput, eOrigin: EInputActionOrigin) -> *char #foreign steam "SteamAPI_ISteamInput_GetGlyphForActionOrigin";
GetStringForActionOrigin :: (self: *ISteamInput, eOrigin: EInputActionOrigin) -> *char #foreign steam "SteamAPI_ISteamInput_GetStringForActionOrigin";
StopAnalogActionMomentum :: (self: *ISteamInput, inputHandle: InputHandle_t, eAction: InputAnalogActionHandle_t) #foreign steam "SteamAPI_ISteamInput_StopAnalogActionMomentum";
GetMotionData :: (self: *ISteamInput, inputHandle: InputHandle_t) -> InputMotionData_t #foreign steam "SteamAPI_ISteamInput_GetMotionData";
TriggerVibration :: (self: *ISteamInput, inputHandle: InputHandle_t, usLeftSpeed: u16, usRightSpeed: u16) #foreign steam "SteamAPI_ISteamInput_TriggerVibration";
SetLEDColor :: (self: *ISteamInput, inputHandle: InputHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32) #foreign steam "SteamAPI_ISteamInput_SetLEDColor";
TriggerHapticPulse :: (self: *ISteamInput, inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) #foreign steam "SteamAPI_ISteamInput_TriggerHapticPulse";
TriggerRepeatedHapticPulse :: (self: *ISteamInput, inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) #foreign steam "SteamAPI_ISteamInput_TriggerRepeatedHapticPulse";
ShowBindingPanel :: (self: *ISteamInput, inputHandle: InputHandle_t) -> bool #foreign steam "SteamAPI_ISteamInput_ShowBindingPanel";
GetInputTypeForHandle :: (self: *ISteamInput, inputHandle: InputHandle_t) -> ESteamInputType #foreign steam "SteamAPI_ISteamInput_GetInputTypeForHandle";
GetControllerForGamepadIndex :: (self: *ISteamInput, nIndex: s32) -> InputHandle_t #foreign steam "SteamAPI_ISteamInput_GetControllerForGamepadIndex";
GetGamepadIndexForController :: (self: *ISteamInput, ulinputHandle: InputHandle_t) -> s32 #foreign steam "SteamAPI_ISteamInput_GetGamepadIndexForController";
GetStringForXboxOrigin :: (self: *ISteamInput, eOrigin: EXboxOrigin) -> *char #foreign steam "SteamAPI_ISteamInput_GetStringForXboxOrigin";
GetGlyphForXboxOrigin :: (self: *ISteamInput, eOrigin: EXboxOrigin) -> *char #foreign steam "SteamAPI_ISteamInput_GetGlyphForXboxOrigin";
GetActionOriginFromXboxOrigin :: (self: *ISteamInput, inputHandle: InputHandle_t, eOrigin: EXboxOrigin) -> EInputActionOrigin #foreign steam "SteamAPI_ISteamInput_GetActionOriginFromXboxOrigin";
TranslateActionOrigin :: (self: *ISteamInput, eDestinationInputType: ESteamInputType, eSourceOrigin: EInputActionOrigin) -> EInputActionOrigin #foreign steam "SteamAPI_ISteamInput_TranslateActionOrigin";
GetDeviceBindingRevision :: (self: *ISteamInput, inputHandle: InputHandle_t, pMajor: *s32, pMinor: *s32) -> bool #foreign steam "SteamAPI_ISteamInput_GetDeviceBindingRevision";
GetRemotePlaySessionID :: (self: *ISteamInput, inputHandle: InputHandle_t) -> uint32 #foreign steam "SteamAPI_ISteamInput_GetRemotePlaySessionID";

// ISteamController
SteamController :: () -> *ISteamController #foreign steam "SteamAPI_SteamController_v007";
Init :: (self: *ISteamController) -> bool #foreign steam "SteamAPI_ISteamController_Init";
Shutdown :: (self: *ISteamController) -> bool #foreign steam "SteamAPI_ISteamController_Shutdown";
RunFrame :: (self: *ISteamController) #foreign steam "SteamAPI_ISteamController_RunFrame";
GetConnectedControllers :: (self: *ISteamController, handlesOut: *ControllerHandle_t) -> s32 #foreign steam "SteamAPI_ISteamController_GetConnectedControllers";
GetActionSetHandle :: (self: *ISteamController, pszActionSetName: *char) -> ControllerActionSetHandle_t #foreign steam "SteamAPI_ISteamController_GetActionSetHandle";
ActivateActionSet :: (self: *ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t) #foreign steam "SteamAPI_ISteamController_ActivateActionSet";
GetCurrentActionSet :: (self: *ISteamController, controllerHandle: ControllerHandle_t) -> ControllerActionSetHandle_t #foreign steam "SteamAPI_ISteamController_GetCurrentActionSet";
ActivateActionSetLayer :: (self: *ISteamController, controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) #foreign steam "SteamAPI_ISteamController_ActivateActionSetLayer";
DeactivateActionSetLayer :: (self: *ISteamController, controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) #foreign steam "SteamAPI_ISteamController_DeactivateActionSetLayer";
DeactivateAllActionSetLayers :: (self: *ISteamController, controllerHandle: ControllerHandle_t) #foreign steam "SteamAPI_ISteamController_DeactivateAllActionSetLayers";
GetActiveActionSetLayers :: (self: *ISteamController, controllerHandle: ControllerHandle_t, handlesOut: *ControllerActionSetHandle_t) -> s32 #foreign steam "SteamAPI_ISteamController_GetActiveActionSetLayers";
GetDigitalActionHandle :: (self: *ISteamController, pszActionName: *char) -> ControllerDigitalActionHandle_t #foreign steam "SteamAPI_ISteamController_GetDigitalActionHandle";
GetDigitalActionData :: (self: *ISteamController, controllerHandle: ControllerHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t) -> InputDigitalActionData_t #foreign steam "SteamAPI_ISteamController_GetDigitalActionData";
GetDigitalActionOrigins :: (self: *ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t, originsOut: *EControllerActionOrigin) -> s32 #foreign steam "SteamAPI_ISteamController_GetDigitalActionOrigins";
GetAnalogActionHandle :: (self: *ISteamController, pszActionName: *char) -> ControllerAnalogActionHandle_t #foreign steam "SteamAPI_ISteamController_GetAnalogActionHandle";
GetAnalogActionData :: (self: *ISteamController, controllerHandle: ControllerHandle_t, analogActionHandle: ControllerAnalogActionHandle_t) -> InputAnalogActionData_t #foreign steam "SteamAPI_ISteamController_GetAnalogActionData";
GetAnalogActionOrigins :: (self: *ISteamController, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, analogActionHandle: ControllerAnalogActionHandle_t, originsOut: *EControllerActionOrigin) -> s32 #foreign steam "SteamAPI_ISteamController_GetAnalogActionOrigins";
GetGlyphForActionOrigin :: (self: *ISteamController, eOrigin: EControllerActionOrigin) -> *char #foreign steam "SteamAPI_ISteamController_GetGlyphForActionOrigin";
GetStringForActionOrigin :: (self: *ISteamController, eOrigin: EControllerActionOrigin) -> *char #foreign steam "SteamAPI_ISteamController_GetStringForActionOrigin";
StopAnalogActionMomentum :: (self: *ISteamController, controllerHandle: ControllerHandle_t, eAction: ControllerAnalogActionHandle_t) #foreign steam "SteamAPI_ISteamController_StopAnalogActionMomentum";
GetMotionData :: (self: *ISteamController, controllerHandle: ControllerHandle_t) -> InputMotionData_t #foreign steam "SteamAPI_ISteamController_GetMotionData";
TriggerHapticPulse :: (self: *ISteamController, controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) #foreign steam "SteamAPI_ISteamController_TriggerHapticPulse";
TriggerRepeatedHapticPulse :: (self: *ISteamController, controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) #foreign steam "SteamAPI_ISteamController_TriggerRepeatedHapticPulse";
TriggerVibration :: (self: *ISteamController, controllerHandle: ControllerHandle_t, usLeftSpeed: u16, usRightSpeed: u16) #foreign steam "SteamAPI_ISteamController_TriggerVibration";
SetLEDColor :: (self: *ISteamController, controllerHandle: ControllerHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32) #foreign steam "SteamAPI_ISteamController_SetLEDColor";
ShowBindingPanel :: (self: *ISteamController, controllerHandle: ControllerHandle_t) -> bool #foreign steam "SteamAPI_ISteamController_ShowBindingPanel";
GetInputTypeForHandle :: (self: *ISteamController, controllerHandle: ControllerHandle_t) -> ESteamInputType #foreign steam "SteamAPI_ISteamController_GetInputTypeForHandle";GetControllerForGamepadIndex :: (self: *ISteamController, nIndex: s32) -> ControllerHandle_t #foreign steam "SteamAPI_ISteamController_GetControllerForGamepadIndex";
GetGamepadIndexForController :: (self: *ISteamController, ulControllerHandle: ControllerHandle_t) -> s32 #foreign steam "SteamAPI_ISteamController_GetGamepadIndexForController";
GetStringForXboxOrigin :: (self: *ISteamController, eOrigin: EXboxOrigin) -> *char #foreign steam "SteamAPI_ISteamController_GetStringForXboxOrigin";
GetGlyphForXboxOrigin :: (self: *ISteamController, eOrigin: EXboxOrigin) -> *char #foreign steam "SteamAPI_ISteamController_GetGlyphForXboxOrigin";
GetActionOriginFromXboxOrigin :: (self: *ISteamController, controllerHandle: ControllerHandle_t, eOrigin: EXboxOrigin) -> EControllerActionOrigin #foreign steam "SteamAPI_ISteamController_GetActionOriginFromXboxOrigin";
TranslateActionOrigin :: (self: *ISteamController, eDestinationInputType: ESteamInputType, eSourceOrigin: EControllerActionOrigin) -> EControllerActionOrigin #foreign steam "SteamAPI_ISteamController_TranslateActionOrigin";
GetControllerBindingRevision :: (self: *ISteamController, controllerHandle: ControllerHandle_t, pMajor: *s32, pMinor: *s32) -> bool #foreign steam "SteamAPI_ISteamController_GetControllerBindingRevision";

// ISteamUGC
SteamUGC :: () -> *ISteamUGC #foreign steam "SteamAPI_SteamUGC_v014";
SteamGameServerUGC :: () -> *ISteamUGC #foreign steam "SteamAPI_SteamGameServerUGC_v014";
CreateQueryUserUGCRequest :: (self: *ISteamUGC, unAccountID: AccountID_t, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t #foreign steam "SteamAPI_ISteamUGC_CreateQueryUserUGCRequest";
CreateQueryAllUGCRequestPage :: (self: *ISteamUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t #foreign steam "SteamAPI_ISteamUGC_CreateQueryAllUGCRequestPage";
CreateQueryAllUGCRequestCursor :: (self: *ISteamUGC, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, pchCursor: *char) -> UGCQueryHandle_t #foreign steam "SteamAPI_ISteamUGC_CreateQueryAllUGCRequestCursor";
CreateQueryUGCDetailsRequest :: (self: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> UGCQueryHandle_t #foreign steam "SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest";
SendQueryUGCRequest :: (self: *ISteamUGC, handle: UGCQueryHandle_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_SendQueryUGCRequest";
GetQueryUGCResult :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pDetails: *SteamUGCDetails_t) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQueryUGCResult";
GetQueryUGCPreviewURL :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchURL: *char, cchURLSize: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQueryUGCPreviewURL";
GetQueryUGCMetadata :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchMetadata: *char, cchMetadatasize: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQueryUGCMetadata";
GetQueryUGCChildren :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQueryUGCChildren";
GetQueryUGCStatistic :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, eStatType: EItemStatistic, pStatValue: *uint64) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQueryUGCStatistic";
GetQueryUGCNumAdditionalPreviews :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 #foreign steam "SteamAPI_ISteamUGC_GetQueryUGCNumAdditionalPreviews";
GetQueryUGCAdditionalPreview :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, previewIndex: uint32, pchURLOrVideoID: *char, cchURLSize: uint32, pchOriginalFileName: *char, cchOriginalFileNameSize: uint32, pPreviewType: *EItemPreviewType) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview";
GetQueryUGCNumKeyValueTags :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32) -> uint32 #foreign steam "SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags";
GetQueryUGCKeyValueTag :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, keyValueTagIndex: uint32, pchKey: *char, cchKeySize: uint32, pchValue: *char, cchValueSize: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag";
GetQueryFirstUGCKeyValueTag :: (self: *ISteamUGC, handle: UGCQueryHandle_t, index: uint32, pchKey: *char, pchValue: *char, cchValueSize: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQueryFirstUGCKeyValueTag";
ReleaseQueryUGCRequest :: (self: *ISteamUGC, handle: UGCQueryHandle_t) -> bool #foreign steam "SteamAPI_ISteamUGC_ReleaseQueryUGCRequest";
AddRequiredTag :: (self: *ISteamUGC, handle: UGCQueryHandle_t, pTagName: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_AddRequiredTag";
AddRequiredTagGroup :: (self: *ISteamUGC, handle: UGCQueryHandle_t, pTagGroups: *SteamParamStringArray_t) -> bool #foreign steam "SteamAPI_ISteamUGC_AddRequiredTagGroup";
AddExcludedTag :: (self: *ISteamUGC, handle: UGCQueryHandle_t, pTagName: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_AddExcludedTag";
SetReturnOnlyIDs :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bReturnOnlyIDs: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_SetReturnOnlyIDs";
SetReturnKeyValueTags :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bReturnKeyValueTags: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_SetReturnKeyValueTags";
SetReturnLongDescription :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bReturnLongDescription: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_SetReturnLongDescription";
SetReturnMetadata :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bReturnMetadata: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_SetReturnMetadata";
SetReturnChildren :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bReturnChildren: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_SetReturnChildren";
SetReturnAdditionalPreviews :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bReturnAdditionalPreviews: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_SetReturnAdditionalPreviews";
SetReturnTotalOnly :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bReturnTotalOnly: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_SetReturnTotalOnly";
SetReturnPlaytimeStats :: (self: *ISteamUGC, handle: UGCQueryHandle_t, unDays: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_SetReturnPlaytimeStats";
SetLanguage :: (self: *ISteamUGC, handle: UGCQueryHandle_t, pchLanguage: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_SetLanguage";
SetAllowCachedResponse :: (self: *ISteamUGC, handle: UGCQueryHandle_t, unMaxAgeSeconds: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_SetAllowCachedResponse";
SetCloudFileNameFilter :: (self: *ISteamUGC, handle: UGCQueryHandle_t, pMatchCloudFileName: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_SetCloudFileNameFilter";
SetMatchAnyTag :: (self: *ISteamUGC, handle: UGCQueryHandle_t, bMatchAnyTag: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_SetMatchAnyTag";
SetSearchText :: (self: *ISteamUGC, handle: UGCQueryHandle_t, pSearchText: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_SetSearchText";
SetRankedByTrendDays :: (self: *ISteamUGC, handle: UGCQueryHandle_t, unDays: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_SetRankedByTrendDays";
AddRequiredKeyValueTag :: (self: *ISteamUGC, handle: UGCQueryHandle_t, pKey: *char, pValue: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_AddRequiredKeyValueTag";
RequestUGCDetails :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_RequestUGCDetails";
CreateItem :: (self: *ISteamUGC, nConsumerAppId: AppId_t, eFileType: EWorkshopFileType) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_CreateItem";
StartItemUpdate :: (self: *ISteamUGC, nConsumerAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> UGCUpdateHandle_t #foreign steam "SteamAPI_ISteamUGC_StartItemUpdate";
SetItemTitle :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pchTitle: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_SetItemTitle";
SetItemDescription :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pchDescription: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_SetItemDescription";
SetItemUpdateLanguage :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pchLanguage: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_SetItemUpdateLanguage";
SetItemMetadata :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pchMetaData: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_SetItemMetadata";
SetItemVisibility :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool #foreign steam "SteamAPI_ISteamUGC_SetItemVisibility";
SetItemTags :: (self: *ISteamUGC, updateHandle: UGCUpdateHandle_t, pTags: *SteamParamStringArray_t) -> bool #foreign steam "SteamAPI_ISteamUGC_SetItemTags";
SetItemContent :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pszContentFolder: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_SetItemContent";
SetItemPreview :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pszPreviewFile: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_SetItemPreview";
SetAllowLegacyUpload :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, bAllowLegacyUpload: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_SetAllowLegacyUpload";
RemoveAllItemKeyValueTags :: (self: *ISteamUGC, handle: UGCUpdateHandle_t) -> bool #foreign steam "SteamAPI_ISteamUGC_RemoveAllItemKeyValueTags";
RemoveItemKeyValueTags :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pchKey: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_RemoveItemKeyValueTags";
AddItemKeyValueTag :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pchKey: *char, pchValue: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_AddItemKeyValueTag";
AddItemPreviewFile :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pszPreviewFile: *char, type: EItemPreviewType) -> bool #foreign steam "SteamAPI_ISteamUGC_AddItemPreviewFile";
AddItemPreviewVideo :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pszVideoID: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_AddItemPreviewVideo";
UpdateItemPreviewFile :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, index: uint32, pszPreviewFile: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_UpdateItemPreviewFile";
UpdateItemPreviewVideo :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, index: uint32, pszVideoID: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_UpdateItemPreviewVideo";
RemoveItemPreview :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, index: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_RemoveItemPreview";
SubmitItemUpdate :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, pchChangeNote: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_SubmitItemUpdate";
GetItemUpdateProgress :: (self: *ISteamUGC, handle: UGCUpdateHandle_t, punBytesProcessed: *uint64, punBytesTotal: *uint64) -> EItemUpdateStatus #foreign steam "SteamAPI_ISteamUGC_GetItemUpdateProgress";
SetUserItemVote :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_SetUserItemVote";
GetUserItemVote :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_GetUserItemVote";
AddItemToFavorites :: (self: *ISteamUGC, nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_AddItemToFavorites";
RemoveItemFromFavorites :: (self: *ISteamUGC, nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_RemoveItemFromFavorites";
SubscribeItem :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_SubscribeItem";
UnsubscribeItem :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_UnsubscribeItem";
GetNumSubscribedItems :: (self: *ISteamUGC) -> uint32 #foreign steam "SteamAPI_ISteamUGC_GetNumSubscribedItems";
GetSubscribedItems :: (self: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> uint32 #foreign steam "SteamAPI_ISteamUGC_GetSubscribedItems";
GetItemState :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> uint32 #foreign steam "SteamAPI_ISteamUGC_GetItemState";
GetItemInstallInfo :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t, punSizeOnDisk: *uint64, pchFolder: *char, cchFolderSize: uint32, punTimeStamp: *uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_GetItemInstallInfo";
GetItemDownloadInfo :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool #foreign steam "SteamAPI_ISteamUGC_GetItemDownloadInfo";
DownloadItem :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t, bHighPriority: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_DownloadItem";
BInitWorkshopForGameServer :: (self: *ISteamUGC, unWorkshopDepotID: DepotId_t, pszFolder: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_BInitWorkshopForGameServer";
SuspendDownloads :: (self: *ISteamUGC, bSuspend: bool) #foreign steam "SteamAPI_ISteamUGC_SuspendDownloads";
StartPlaytimeTracking :: (self: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_StartPlaytimeTracking";
StopPlaytimeTracking :: (self: *ISteamUGC, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_StopPlaytimeTracking";
StopPlaytimeTrackingForAllItems :: (self: *ISteamUGC) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_StopPlaytimeTrackingForAllItems";
AddDependency :: (self: *ISteamUGC, nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_AddDependency";
RemoveDependency :: (self: *ISteamUGC, nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_RemoveDependency";
AddAppDependency :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_AddAppDependency";
RemoveAppDependency :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_RemoveAppDependency";
GetAppDependencies :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_GetAppDependencies";
DeleteItem :: (self: *ISteamUGC, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_DeleteItem";

// ISteamAppList
SteamAppList :: () -> *ISteamAppList #foreign steam "SteamAPI_SteamAppList_v001";
GetNumInstalledApps :: (self: *ISteamAppList) -> uint32 #foreign steam "SteamAPI_ISteamAppList_GetNumInstalledApps";
GetInstalledApps :: (self: *ISteamAppList, pvecAppID: *AppId_t, unMaxAppIDs: uint32) -> uint32 #foreign steam "SteamAPI_ISteamAppList_GetInstalledApps";
GetAppName :: (self: *ISteamAppList, nAppID: AppId_t, pchName: *char, cchNameMax: s32) -> s32 #foreign steam "SteamAPI_ISteamAppList_GetAppName";
GetAppInstallDir :: (self: *ISteamAppList, nAppID: AppId_t, pchDirectory: *char, cchNameMax: s32) -> s32 #foreign steam "SteamAPI_ISteamAppList_GetAppInstallDir";
GetAppBuildId :: (self: *ISteamAppList, nAppID: AppId_t) -> s32 #foreign steam "SteamAPI_ISteamAppList_GetAppBuildId";

// ISteamHTMLSurface
SteamHTMLSurface :: () -> *ISteamHTMLSurface #foreign steam "SteamAPI_SteamHTMLSurface_v005";
Init :: (self: *ISteamHTMLSurface) -> bool #foreign steam "SteamAPI_ISteamHTMLSurface_Init";
Shutdown :: (self: *ISteamHTMLSurface) -> bool #foreign steam "SteamAPI_ISteamHTMLSurface_Shutdown";
CreateBrowser :: (self: *ISteamHTMLSurface, pchUserAgent: *char, pchUserCSS: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamHTMLSurface_CreateBrowser";
RemoveBrowser :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) #foreign steam "SteamAPI_ISteamHTMLSurface_RemoveBrowser";
LoadURL :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchURL: *char, pchPostData: *char) #foreign steam "SteamAPI_ISteamHTMLSurface_LoadURL";
SetSize :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, unWidth: uint32, unHeight: uint32) #foreign steam "SteamAPI_ISteamHTMLSurface_SetSize";
StopLoad :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) #foreign steam "SteamAPI_ISteamHTMLSurface_StopLoad";
Reload :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) #foreign steam "SteamAPI_ISteamHTMLSurface_Reload";
GoBack :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) #foreign steam "SteamAPI_ISteamHTMLSurface_GoBack";
GoForward :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) #foreign steam "SteamAPI_ISteamHTMLSurface_GoForward";
AddHeader :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchKey: *char, pchValue: *char) #foreign steam "SteamAPI_ISteamHTMLSurface_AddHeader";
ExecuteJavascript :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchScript: *char) #foreign steam "SteamAPI_ISteamHTMLSurface_ExecuteJavascript";
MouseUp :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton) #foreign steam "SteamAPI_ISteamHTMLSurface_MouseUp";
MouseDown :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton) #foreign steam "SteamAPI_ISteamHTMLSurface_MouseDown";
MouseDoubleClick :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, eMouseButton: EHTMLMouseButton) #foreign steam "SteamAPI_ISteamHTMLSurface_MouseDoubleClick";
MouseMove :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, x: s32, y: s32) #foreign steam "SteamAPI_ISteamHTMLSurface_MouseMove";
MouseWheel :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nDelta: int32) #foreign steam "SteamAPI_ISteamHTMLSurface_MouseWheel";
KeyDown :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers, bIsSystemKey: bool) #foreign steam "SteamAPI_ISteamHTMLSurface_KeyDown";
KeyUp :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nNativeKeyCode: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers) #foreign steam "SteamAPI_ISteamHTMLSurface_KeyUp";
KeyChar :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, cUnicodeChar: uint32, eHTMLKeyModifiers: EHTMLKeyModifiers) #foreign steam "SteamAPI_ISteamHTMLSurface_KeyChar";
SetHorizontalScroll :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) #foreign steam "SteamAPI_ISteamHTMLSurface_SetHorizontalScroll";
SetVerticalScroll :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, nAbsolutePixelScroll: uint32) #foreign steam "SteamAPI_ISteamHTMLSurface_SetVerticalScroll";
SetKeyFocus :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bHasKeyFocus: bool) #foreign steam "SteamAPI_ISteamHTMLSurface_SetKeyFocus";
ViewSource :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) #foreign steam "SteamAPI_ISteamHTMLSurface_ViewSource";
CopyToClipboard :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) #foreign steam "SteamAPI_ISteamHTMLSurface_CopyToClipboard";
PasteFromClipboard :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) #foreign steam "SteamAPI_ISteamHTMLSurface_PasteFromClipboard";
Find :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchSearchStr: *char, bCurrentlyInFind: bool, bReverse: bool) #foreign steam "SteamAPI_ISteamHTMLSurface_Find";
StopFind :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) #foreign steam "SteamAPI_ISteamHTMLSurface_StopFind";
GetLinkAtPosition :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, x: s32, y: s32) #foreign steam "SteamAPI_ISteamHTMLSurface_GetLinkAtPosition";
SetCookie :: (self: *ISteamHTMLSurface, pchHostname: *char, pchKey: *char, pchValue: *char, pchPath: *char, nExpires: RTime32, bSecure: bool, bHTTPOnly: bool) #foreign steam "SteamAPI_ISteamHTMLSurface_SetCookie";
SetPageScaleFactor :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, flZoom: float, nPointX: s32, nPointY: s32) #foreign steam "SteamAPI_ISteamHTMLSurface_SetPageScaleFactor";
SetBackgroundMode :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bBackgroundMode: bool) #foreign steam "SteamAPI_ISteamHTMLSurface_SetBackgroundMode";
SetDPIScalingFactor :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, flDPIScaling: float) #foreign steam "SteamAPI_ISteamHTMLSurface_SetDPIScalingFactor";
OpenDeveloperTools :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser) #foreign steam "SteamAPI_ISteamHTMLSurface_OpenDeveloperTools";
AllowStartRequest :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bAllowed: bool) #foreign steam "SteamAPI_ISteamHTMLSurface_AllowStartRequest";
JSDialogResponse :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, bResult: bool) #foreign steam "SteamAPI_ISteamHTMLSurface_JSDialogResponse";
FileLoadDialogResponse :: (self: *ISteamHTMLSurface, unBrowserHandle: HHTMLBrowser, pchSelectedFiles: **char) #foreign steam "SteamAPI_ISteamHTMLSurface_FileLoadDialogResponse";

// ISteamInventory
SteamInventory :: () -> *ISteamInventory #foreign steam "SteamAPI_SteamInventory_v003";
SteamGameServerInventory :: () -> *ISteamInventory #foreign steam "SteamAPI_SteamGameServerInventory_v003";
GetResultStatus :: (self: *ISteamInventory, resultHandle: SteamInventoryResult_t) -> EResult #foreign steam "SteamAPI_ISteamInventory_GetResultStatus";
GetResultItems :: (self: *ISteamInventory, resultHandle: SteamInventoryResult_t, pOutItemsArray: *SteamItemDetails_t, punOutItemsArraySize: *uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_GetResultItems";
GetResultItemProperty :: (self: *ISteamInventory, resultHandle: SteamInventoryResult_t, unItemIndex: uint32, pchPropertyName: *char, pchValueBuffer: *char, punValueBufferSizeOut: *uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_GetResultItemProperty";
GetResultTimestamp :: (self: *ISteamInventory, resultHandle: SteamInventoryResult_t) -> uint32 #foreign steam "SteamAPI_ISteamInventory_GetResultTimestamp";
CheckResultSteamID :: (self: *ISteamInventory, resultHandle: SteamInventoryResult_t, steamIDExpected: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamInventory_CheckResultSteamID";
DestroyResult :: (self: *ISteamInventory, resultHandle: SteamInventoryResult_t) #foreign steam "SteamAPI_ISteamInventory_DestroyResult";
GetAllItems :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t) -> bool #foreign steam "SteamAPI_ISteamInventory_GetAllItems";
GetItemsByID :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pInstanceIDs: *SteamItemInstanceID_t, unCountInstanceIDs: uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_GetItemsByID";
SerializeResult :: (self: *ISteamInventory, resultHandle: SteamInventoryResult_t, pOutBuffer: *void, punOutBufferSize: *uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_SerializeResult";
DeserializeResult :: (self: *ISteamInventory, pOutResultHandle: *SteamInventoryResult_t, pBuffer: *void, unBufferSize: uint32, bRESERVED_MUST_BE_FALSE: bool) -> bool #foreign steam "SteamAPI_ISteamInventory_DeserializeResult";
GenerateItems :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_GenerateItems";
GrantPromoItems :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t) -> bool #foreign steam "SteamAPI_ISteamInventory_GrantPromoItems";
AddPromoItem :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, itemDef: SteamItemDef_t) -> bool #foreign steam "SteamAPI_ISteamInventory_AddPromoItem";
AddPromoItems :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, unArrayLength: uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_AddPromoItems";
ConsumeItem :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, itemConsume: SteamItemInstanceID_t, unQuantity: uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_ConsumeItem";
ExchangeItems :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pArrayGenerate: *SteamItemDef_t, punArrayGenerateQuantity: *uint32, unArrayGenerateLength: uint32, pArrayDestroy: *SteamItemInstanceID_t, punArrayDestroyQuantity: *uint32, unArrayDestroyLength: uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_ExchangeItems";
TransferItemQuantity :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, itemIdSource: SteamItemInstanceID_t, unQuantity: uint32, itemIdDest: SteamItemInstanceID_t) -> bool #foreign steam "SteamAPI_ISteamInventory_TransferItemQuantity";
SendItemDropHeartbeat :: (self: *ISteamInventory) #foreign steam "SteamAPI_ISteamInventory_SendItemDropHeartbeat";
TriggerItemDrop :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, dropListDefinition: SteamItemDef_t) -> bool #foreign steam "SteamAPI_ISteamInventory_TriggerItemDrop";
TradeItems :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, steamIDTradePartner: uint64_steamid, pArrayGive: *SteamItemInstanceID_t, pArrayGiveQuantity: *uint32, nArrayGiveLength: uint32, pArrayGet: *SteamItemInstanceID_t, pArrayGetQuantity: *uint32, nArrayGetLength: uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_TradeItems";
LoadItemDefinitions :: (self: *ISteamInventory) -> bool #foreign steam "SteamAPI_ISteamInventory_LoadItemDefinitions";
GetItemDefinitionIDs :: (self: *ISteamInventory, pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_GetItemDefinitionIDs";
GetItemDefinitionProperty :: (self: *ISteamInventory, iDefinition: SteamItemDef_t, pchPropertyName: *char, pchValueBuffer: *char, punValueBufferSizeOut: *uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_GetItemDefinitionProperty";
RequestEligiblePromoItemDefinitionsIDs :: (self: *ISteamInventory, steamID: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamInventory_RequestEligiblePromoItemDefinitionsIDs";
GetEligiblePromoItemDefinitionIDs :: (self: *ISteamInventory, steamID: uint64_steamid, pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_GetEligiblePromoItemDefinitionIDs";
StartPurchase :: (self: *ISteamInventory, pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamInventory_StartPurchase";
RequestPrices :: (self: *ISteamInventory) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamInventory_RequestPrices";
GetNumItemsWithPrices :: (self: *ISteamInventory) -> uint32 #foreign steam "SteamAPI_ISteamInventory_GetNumItemsWithPrices";
GetItemsWithPrices :: (self: *ISteamInventory, pArrayItemDefs: *SteamItemDef_t, pCurrentPrices: *uint64, pBasePrices: *uint64, unArrayLength: uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_GetItemsWithPrices";
GetItemPrice :: (self: *ISteamInventory, iDefinition: SteamItemDef_t, pCurrentPrice: *uint64, pBasePrice: *uint64) -> bool #foreign steam "SteamAPI_ISteamInventory_GetItemPrice";
StartUpdateProperties :: (self: *ISteamInventory) -> SteamInventoryUpdateHandle_t #foreign steam "SteamAPI_ISteamInventory_StartUpdateProperties";
RemoveProperty :: (self: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char) -> bool #foreign steam "SteamAPI_ISteamInventory_RemoveProperty";
SetPropertyString :: (self: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, pchPropertyValue: *char) -> bool #foreign steam "SteamAPI_ISteamInventory_SetPropertyString";
SetPropertyBool :: (self: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, bValue: bool) -> bool #foreign steam "SteamAPI_ISteamInventory_SetPropertyBool";
SetPropertyInt64 :: (self: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, nValue: int64) -> bool #foreign steam "SteamAPI_ISteamInventory_SetPropertyInt64";
SetPropertyFloat :: (self: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, flValue: float) -> bool #foreign steam "SteamAPI_ISteamInventory_SetPropertyFloat";
SubmitUpdateProperties :: (self: *ISteamInventory, handle: SteamInventoryUpdateHandle_t, pResultHandle: *SteamInventoryResult_t) -> bool #foreign steam "SteamAPI_ISteamInventory_SubmitUpdateProperties";
InspectItem :: (self: *ISteamInventory, pResultHandle: *SteamInventoryResult_t, pchItemToken: *char) -> bool #foreign steam "SteamAPI_ISteamInventory_InspectItem";

// ISteamVideo
SteamVideo :: () -> *ISteamVideo #foreign steam "SteamAPI_SteamVideo_v002";
GetVideoURL :: (self: *ISteamVideo, unVideoAppID: AppId_t) #foreign steam "SteamAPI_ISteamVideo_GetVideoURL";
IsBroadcasting :: (self: *ISteamVideo, pnNumViewers: *s32) -> bool #foreign steam "SteamAPI_ISteamVideo_IsBroadcasting";
GetOPFSettings :: (self: *ISteamVideo, unVideoAppID: AppId_t) #foreign steam "SteamAPI_ISteamVideo_GetOPFSettings";
GetOPFStringForApp :: (self: *ISteamVideo, unVideoAppID: AppId_t, pchBuffer: *char, pnBufferSize: *int32) -> bool #foreign steam "SteamAPI_ISteamVideo_GetOPFStringForApp";

// ISteamParentalSettings
SteamParentalSettings :: () -> *ISteamParentalSettings #foreign steam "SteamAPI_SteamParentalSettings_v001";
BIsParentalLockEnabled :: (self: *ISteamParentalSettings) -> bool #foreign steam "SteamAPI_ISteamParentalSettings_BIsParentalLockEnabled";
BIsParentalLockLocked :: (self: *ISteamParentalSettings) -> bool #foreign steam "SteamAPI_ISteamParentalSettings_BIsParentalLockLocked";
BIsAppBlocked :: (self: *ISteamParentalSettings, nAppID: AppId_t) -> bool #foreign steam "SteamAPI_ISteamParentalSettings_BIsAppBlocked";
BIsAppInBlockList :: (self: *ISteamParentalSettings, nAppID: AppId_t) -> bool #foreign steam "SteamAPI_ISteamParentalSettings_BIsAppInBlockList";
BIsFeatureBlocked :: (self: *ISteamParentalSettings, eFeature: EParentalFeature) -> bool #foreign steam "SteamAPI_ISteamParentalSettings_BIsFeatureBlocked";
BIsFeatureInBlockList :: (self: *ISteamParentalSettings, eFeature: EParentalFeature) -> bool #foreign steam "SteamAPI_ISteamParentalSettings_BIsFeatureInBlockList";

// ISteamRemotePlay
SteamRemotePlay :: () -> *ISteamRemotePlay #foreign steam "SteamAPI_SteamRemotePlay_v001";
GetSessionCount :: (self: *ISteamRemotePlay) -> uint32 #foreign steam "SteamAPI_ISteamRemotePlay_GetSessionCount";
GetSessionID :: (self: *ISteamRemotePlay, iSessionIndex: s32) -> RemotePlaySessionID_t #foreign steam "SteamAPI_ISteamRemotePlay_GetSessionID";
GetSessionSteamID :: (self: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> uint64_steamid #foreign steam "SteamAPI_ISteamRemotePlay_GetSessionSteamID";
GetSessionClientName :: (self: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> *char #foreign steam "SteamAPI_ISteamRemotePlay_GetSessionClientName";
GetSessionClientFormFactor :: (self: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t) -> ESteamDeviceFormFactor #foreign steam "SteamAPI_ISteamRemotePlay_GetSessionClientFormFactor";
BGetSessionClientResolution :: (self: *ISteamRemotePlay, unSessionID: RemotePlaySessionID_t, pnResolutionX: *s32, pnResolutionY: *s32) -> bool #foreign steam "SteamAPI_ISteamRemotePlay_BGetSessionClientResolution";
BSendRemotePlayTogetherInvite :: (self: *ISteamRemotePlay, steamIDFriend: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamRemotePlay_BSendRemotePlayTogetherInvite";

// ISteamNetworkingMessages
SteamNetworkingMessages :: () -> *ISteamNetworkingMessages #foreign steam "SteamAPI_SteamNetworkingMessages_v002";
SteamGameServerNetworkingMessages :: () -> *ISteamNetworkingMessages #foreign steam "SteamAPI_SteamGameServerNetworkingMessages_v002";
SendMessageToUser :: (self: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity, pubData: *void, cubData: uint32, nSendFlags: s32, nRemoteChannel: s32) -> EResult #foreign steam "SteamAPI_ISteamNetworkingMessages_SendMessageToUser";
ReceiveMessagesOnChannel :: (self: *ISteamNetworkingMessages, nLocalChannel: s32, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 #foreign steam "SteamAPI_ISteamNetworkingMessages_ReceiveMessagesOnChannel";
AcceptSessionWithUser :: (self: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity) -> bool #foreign steam "SteamAPI_ISteamNetworkingMessages_AcceptSessionWithUser";
CloseSessionWithUser :: (self: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity) -> bool #foreign steam "SteamAPI_ISteamNetworkingMessages_CloseSessionWithUser";
CloseChannelWithUser :: (self: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity, nLocalChannel: s32) -> bool #foreign steam "SteamAPI_ISteamNetworkingMessages_CloseChannelWithUser";
GetSessionConnectionInfo :: (self: *ISteamNetworkingMessages, identityRemote: *SteamNetworkingIdentity, pConnectionInfo: *SteamNetConnectionInfo_t, pQuickStatus: *SteamNetworkingQuickConnectionStatus) -> ESteamNetworkingConnectionState #foreign steam "SteamAPI_ISteamNetworkingMessages_GetSessionConnectionInfo";

// ISteamNetworkingSockets
SteamNetworkingSockets :: () -> *ISteamNetworkingSockets #foreign steam "SteamAPI_SteamNetworkingSockets_v009";
SteamGameServerNetworkingSockets :: () -> *ISteamNetworkingSockets #foreign steam "SteamAPI_SteamGameServerNetworkingSockets_v009";
CreateListenSocketIP :: (self: *ISteamNetworkingSockets, localAddress: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #foreign steam "SteamAPI_ISteamNetworkingSockets_CreateListenSocketIP";
ConnectByIPAddress :: (self: *ISteamNetworkingSockets, address: *SteamNetworkingIPAddr, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #foreign steam "SteamAPI_ISteamNetworkingSockets_ConnectByIPAddress";
CreateListenSocketP2P :: (self: *ISteamNetworkingSockets, nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #foreign steam "SteamAPI_ISteamNetworkingSockets_CreateListenSocketP2P";
ConnectP2P :: (self: *ISteamNetworkingSockets, identityRemote: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #foreign steam "SteamAPI_ISteamNetworkingSockets_ConnectP2P";
AcceptConnection :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection) -> EResult #foreign steam "SteamAPI_ISteamNetworkingSockets_AcceptConnection";
CloseConnection :: (self: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, nReason: s32, pszDebug: *char, bEnableLinger: bool) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_CloseConnection";
CloseListenSocket :: (self: *ISteamNetworkingSockets, hSocket: HSteamListenSocket) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_CloseListenSocket";
SetConnectionUserData :: (self: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, nUserData: int64) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_SetConnectionUserData";
GetConnectionUserData :: (self: *ISteamNetworkingSockets, hPeer: HSteamNetConnection) -> int64 #foreign steam "SteamAPI_ISteamNetworkingSockets_GetConnectionUserData";
SetConnectionName :: (self: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, pszName: *char) #foreign steam "SteamAPI_ISteamNetworkingSockets_SetConnectionName";
GetConnectionName :: (self: *ISteamNetworkingSockets, hPeer: HSteamNetConnection, pszName: *char, nMaxLen: s32) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_GetConnectionName";
SendMessageToConnection :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pData: *void, cbData: uint32, nSendFlags: s32, pOutMessageNumber: *int64) -> EResult #foreign steam "SteamAPI_ISteamNetworkingSockets_SendMessageToConnection";
SendMessages :: (self: *ISteamNetworkingSockets, nMessages: s32, pMessages: **SteamNetworkingMessage_t, pOutMessageNumberOrResult: *int64) #foreign steam "SteamAPI_ISteamNetworkingSockets_SendMessages";
FlushMessagesOnConnection :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection) -> EResult #foreign steam "SteamAPI_ISteamNetworkingSockets_FlushMessagesOnConnection";
ReceiveMessagesOnConnection :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 #foreign steam "SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnConnection";
GetConnectionInfo :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pInfo: *SteamNetConnectionInfo_t) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_GetConnectionInfo";
GetQuickConnectionStatus :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pStats: *SteamNetworkingQuickConnectionStatus) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_GetQuickConnectionStatus";
GetDetailedConnectionStatus :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection, pszBuf: *char, cbBuf: s32) -> s32 #foreign steam "SteamAPI_ISteamNetworkingSockets_GetDetailedConnectionStatus";
GetListenSocketAddress :: (self: *ISteamNetworkingSockets, hSocket: HSteamListenSocket, address: *SteamNetworkingIPAddr) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_GetListenSocketAddress";
CreateSocketPair :: (self: *ISteamNetworkingSockets, pOutConnection1: *HSteamNetConnection, pOutConnection2: *HSteamNetConnection, bUseNetworkLoopback: bool, pIdentity1: *SteamNetworkingIdentity, pIdentity2: *SteamNetworkingIdentity) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_CreateSocketPair";
GetIdentity :: (self: *ISteamNetworkingSockets, pIdentity: *SteamNetworkingIdentity) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_GetIdentity";
InitAuthentication :: (self: *ISteamNetworkingSockets) -> ESteamNetworkingAvailability #foreign steam "SteamAPI_ISteamNetworkingSockets_InitAuthentication";
GetAuthenticationStatus :: (self: *ISteamNetworkingSockets, pDetails: *SteamNetAuthenticationStatus_t) -> ESteamNetworkingAvailability #foreign steam "SteamAPI_ISteamNetworkingSockets_GetAuthenticationStatus";
CreatePollGroup :: (self: *ISteamNetworkingSockets) -> HSteamNetPollGroup #foreign steam "SteamAPI_ISteamNetworkingSockets_CreatePollGroup";
DestroyPollGroup :: (self: *ISteamNetworkingSockets, hPollGroup: HSteamNetPollGroup) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_DestroyPollGroup";
SetConnectionPollGroup :: (self: *ISteamNetworkingSockets, hConn: HSteamNetConnection, hPollGroup: HSteamNetPollGroup) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_SetConnectionPollGroup";
ReceiveMessagesOnPollGroup :: (self: *ISteamNetworkingSockets, hPollGroup: HSteamNetPollGroup, ppOutMessages: **SteamNetworkingMessage_t, nMaxMessages: s32) -> s32 #foreign steam "SteamAPI_ISteamNetworkingSockets_ReceiveMessagesOnPollGroup";
ReceivedRelayAuthTicket :: (self: *ISteamNetworkingSockets, pvTicket: *void, cbTicket: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_ReceivedRelayAuthTicket";
FindRelayAuthTicketForServer :: (self: *ISteamNetworkingSockets, identityGameServer: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, pOutParsedTicket: *SteamDatagramRelayAuthTicket) -> s32 #foreign steam "SteamAPI_ISteamNetworkingSockets_FindRelayAuthTicketForServer";
ConnectToHostedDedicatedServer :: (self: *ISteamNetworkingSockets, identityTarget: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #foreign steam "SteamAPI_ISteamNetworkingSockets_ConnectToHostedDedicatedServer";
GetHostedDedicatedServerPort :: (self: *ISteamNetworkingSockets) -> uint16 #foreign steam "SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPort";
GetHostedDedicatedServerPOPID :: (self: *ISteamNetworkingSockets) -> SteamNetworkingPOPID #foreign steam "SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerPOPID";
GetHostedDedicatedServerAddress :: (self: *ISteamNetworkingSockets, pRouting: *SteamDatagramHostedAddress) -> EResult #foreign steam "SteamAPI_ISteamNetworkingSockets_GetHostedDedicatedServerAddress";
CreateHostedDedicatedServerListenSocket :: (self: *ISteamNetworkingSockets, nLocalVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamListenSocket #foreign steam "SteamAPI_ISteamNetworkingSockets_CreateHostedDedicatedServerListenSocket";
GetGameCoordinatorServerLogin :: (self: *ISteamNetworkingSockets, pLoginInfo: *SteamDatagramGameCoordinatorServerLogin, pcbSignedBlob: *s32, pBlob: *void) -> EResult #foreign steam "SteamAPI_ISteamNetworkingSockets_GetGameCoordinatorServerLogin";
ConnectP2PCustomSignaling :: (self: *ISteamNetworkingSockets, pSignaling: *ISteamNetworkingConnectionCustomSignaling, pPeerIdentity: *SteamNetworkingIdentity, nRemoteVirtualPort: s32, nOptions: s32, pOptions: *SteamNetworkingConfigValue_t) -> HSteamNetConnection #foreign steam "SteamAPI_ISteamNetworkingSockets_ConnectP2PCustomSignaling";
ReceivedP2PCustomSignal :: (self: *ISteamNetworkingSockets, pMsg: *void, cbMsg: s32, pContext: *ISteamNetworkingCustomSignalingRecvContext) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_ReceivedP2PCustomSignal";
GetCertificateRequest :: (self: *ISteamNetworkingSockets, pcbBlob: *s32, pBlob: *void, errMsg: *SteamNetworkingErrMsg) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_GetCertificateRequest";
SetCertificate :: (self: *ISteamNetworkingSockets, pCertificate: *void, cbCertificate: s32, errMsg: *SteamNetworkingErrMsg) -> bool #foreign steam "SteamAPI_ISteamNetworkingSockets_SetCertificate";
RunCallbacks :: (self: *ISteamNetworkingSockets) #foreign steam "SteamAPI_ISteamNetworkingSockets_RunCallbacks";

// ISteamNetworkingUtils
SteamNetworkingUtils :: () -> *ISteamNetworkingUtils #foreign steam "SteamAPI_SteamNetworkingUtils_v003";
AllocateMessage :: (self: *ISteamNetworkingUtils, cbAllocateBuffer: s32) -> *SteamNetworkingMessage_t #foreign steam "SteamAPI_ISteamNetworkingUtils_AllocateMessage";
InitRelayNetworkAccess :: (self: *ISteamNetworkingUtils) #foreign steam "SteamAPI_ISteamNetworkingUtils_InitRelayNetworkAccess";
GetRelayNetworkStatus :: (self: *ISteamNetworkingUtils, pDetails: *SteamRelayNetworkStatus_t) -> ESteamNetworkingAvailability #foreign steam "SteamAPI_ISteamNetworkingUtils_GetRelayNetworkStatus";
GetLocalPingLocation :: (self: *ISteamNetworkingUtils, result: *SteamNetworkPingLocation_t) -> float #foreign steam "SteamAPI_ISteamNetworkingUtils_GetLocalPingLocation";
EstimatePingTimeBetweenTwoLocations :: (self: *ISteamNetworkingUtils, location1: *SteamNetworkPingLocation_t, location2: *SteamNetworkPingLocation_t) -> s32 #foreign steam "SteamAPI_ISteamNetworkingUtils_EstimatePingTimeBetweenTwoLocations";
EstimatePingTimeFromLocalHost :: (self: *ISteamNetworkingUtils, remoteLocation: *SteamNetworkPingLocation_t) -> s32 #foreign steam "SteamAPI_ISteamNetworkingUtils_EstimatePingTimeFromLocalHost";
ConvertPingLocationToString :: (self: *ISteamNetworkingUtils, location: *SteamNetworkPingLocation_t, pszBuf: *char, cchBufSize: s32) #foreign steam "SteamAPI_ISteamNetworkingUtils_ConvertPingLocationToString";
ParsePingLocationString :: (self: *ISteamNetworkingUtils, pszString: *char, result: *SteamNetworkPingLocation_t) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_ParsePingLocationString";
CheckPingDataUpToDate :: (self: *ISteamNetworkingUtils, flMaxAgeSeconds: float) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_CheckPingDataUpToDate";
GetPingToDataCenter :: (self: *ISteamNetworkingUtils, popID: SteamNetworkingPOPID, pViaRelayPoP: *SteamNetworkingPOPID) -> s32 #foreign steam "SteamAPI_ISteamNetworkingUtils_GetPingToDataCenter";
GetDirectPingToPOP :: (self: *ISteamNetworkingUtils, popID: SteamNetworkingPOPID) -> s32 #foreign steam "SteamAPI_ISteamNetworkingUtils_GetDirectPingToPOP";
GetPOPCount :: (self: *ISteamNetworkingUtils) -> s32 #foreign steam "SteamAPI_ISteamNetworkingUtils_GetPOPCount";
GetPOPList :: (self: *ISteamNetworkingUtils, list: *SteamNetworkingPOPID, nListSz: s32) -> s32 #foreign steam "SteamAPI_ISteamNetworkingUtils_GetPOPList";
GetLocalTimestamp :: (self: *ISteamNetworkingUtils) -> SteamNetworkingMicroseconds #foreign steam "SteamAPI_ISteamNetworkingUtils_GetLocalTimestamp";
SetDebugOutputFunction :: (self: *ISteamNetworkingUtils, eDetailLevel: ESteamNetworkingSocketsDebugOutputType, pfnFunc: FSteamNetworkingSocketsDebugOutput) #foreign steam "SteamAPI_ISteamNetworkingUtils_SetDebugOutputFunction";
SetGlobalConfigValueInt32 :: (self: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, val: int32) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueInt32";
SetGlobalConfigValueFloat :: (self: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, val: float) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueFloat";
SetGlobalConfigValueString :: (self: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, val: *char) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValueString";
SetGlobalConfigValuePtr :: (self: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, val: *void) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SetGlobalConfigValuePtr";
SetConnectionConfigValueInt32 :: (self: *ISteamNetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: int32) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueInt32";
SetConnectionConfigValueFloat :: (self: *ISteamNetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: float) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueFloat";
SetConnectionConfigValueString :: (self: *ISteamNetworkingUtils, hConn: HSteamNetConnection, eValue: ESteamNetworkingConfigValue, val: *char) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SetConnectionConfigValueString";
SteamNetConnectionStatusChanged :: (self: *ISteamNetworkingUtils, fnCallback: FnSteamNetConnectionStatusChanged) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamNetConnectionStatusChanged";
SteamNetAuthenticationStatusChanged :: (self: *ISteamNetworkingUtils, fnCallback: FnSteamNetAuthenticationStatusChanged) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamNetAuthenticationStatusChanged";
SteamRelayNetworkStatusChanged :: (self: *ISteamNetworkingUtils, fnCallback: FnSteamRelayNetworkStatusChanged) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_SteamRelayNetworkStatusChanged";
MessagesSessionRequest :: (self: *ISteamNetworkingUtils, fnCallback: FnSteamNetworkingMessagesSessionRequest) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_MessagesSessionRequest";
MessagesSessionFailed :: (self: *ISteamNetworkingUtils, fnCallback: FnSteamNetworkingMessagesSessionFailed) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SetGlobalCallback_MessagesSessionFailed";
SetConfigValue :: (self: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr_t, eDataType: ESteamNetworkingConfigDataType, pArg: *void) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SetConfigValue";
SetConfigValueStruct :: (self: *ISteamNetworkingUtils, opt: *SteamNetworkingConfigValue_t, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr_t) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SetConfigValueStruct";
GetConfigValue :: (self: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, eScopeType: ESteamNetworkingConfigScope, scopeObj: intptr_t, pOutDataType: *ESteamNetworkingConfigDataType, pResult: *void, cbResult: *size_t) -> ESteamNetworkingGetConfigValueResult #foreign steam "SteamAPI_ISteamNetworkingUtils_GetConfigValue";
GetConfigValueInfo :: (self: *ISteamNetworkingUtils, eValue: ESteamNetworkingConfigValue, pOutName: **char, pOutDataType: *ESteamNetworkingConfigDataType, pOutScope: *ESteamNetworkingConfigScope, pOutNextValue: *ESteamNetworkingConfigValue) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_GetConfigValueInfo";
GetFirstConfigValue :: (self: *ISteamNetworkingUtils) -> ESteamNetworkingConfigValue #foreign steam "SteamAPI_ISteamNetworkingUtils_GetFirstConfigValue";
ToString :: (self: *ISteamNetworkingUtils, addr: *SteamNetworkingIPAddr, buf: *char, cbBuf: uint32, bWithPort: bool) #foreign steam "SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ToString";
ParseString :: (self: *ISteamNetworkingUtils, pAddr: *SteamNetworkingIPAddr, pszStr: *char) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SteamNetworkingIPAddr_ParseString";
ToString :: (self: *ISteamNetworkingUtils, identity: *SteamNetworkingIdentity, buf: *char, cbBuf: uint32) #foreign steam "SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ToString";
ParseString :: (self: *ISteamNetworkingUtils, pIdentity: *SteamNetworkingIdentity, pszStr: *char) -> bool #foreign steam "SteamAPI_ISteamNetworkingUtils_SteamNetworkingIdentity_ParseString";

// ISteamGameServer
SteamGameServer :: () -> *ISteamGameServer #foreign steam "SteamAPI_SteamGameServer_v013";
SetProduct :: (self: *ISteamGameServer, pszProduct: *char) #foreign steam "SteamAPI_ISteamGameServer_SetProduct";
SetGameDescription :: (self: *ISteamGameServer, pszGameDescription: *char) #foreign steam "SteamAPI_ISteamGameServer_SetGameDescription";
SetModDir :: (self: *ISteamGameServer, pszModDir: *char) #foreign steam "SteamAPI_ISteamGameServer_SetModDir";
SetDedicatedServer :: (self: *ISteamGameServer, bDedicated: bool) #foreign steam "SteamAPI_ISteamGameServer_SetDedicatedServer";
LogOn :: (self: *ISteamGameServer, pszToken: *char) #foreign steam "SteamAPI_ISteamGameServer_LogOn";
LogOnAnonymous :: (self: *ISteamGameServer) #foreign steam "SteamAPI_ISteamGameServer_LogOnAnonymous";
LogOff :: (self: *ISteamGameServer) #foreign steam "SteamAPI_ISteamGameServer_LogOff";
BLoggedOn :: (self: *ISteamGameServer) -> bool #foreign steam "SteamAPI_ISteamGameServer_BLoggedOn";
BSecure :: (self: *ISteamGameServer) -> bool #foreign steam "SteamAPI_ISteamGameServer_BSecure";
GetSteamID :: (self: *ISteamGameServer) -> uint64_steamid #foreign steam "SteamAPI_ISteamGameServer_GetSteamID";
WasRestartRequested :: (self: *ISteamGameServer) -> bool #foreign steam "SteamAPI_ISteamGameServer_WasRestartRequested";
SetMaxPlayerCount :: (self: *ISteamGameServer, cPlayersMax: s32) #foreign steam "SteamAPI_ISteamGameServer_SetMaxPlayerCount";
SetBotPlayerCount :: (self: *ISteamGameServer, cBotplayers: s32) #foreign steam "SteamAPI_ISteamGameServer_SetBotPlayerCount";
SetServerName :: (self: *ISteamGameServer, pszServerName: *char) #foreign steam "SteamAPI_ISteamGameServer_SetServerName";
SetMapName :: (self: *ISteamGameServer, pszMapName: *char) #foreign steam "SteamAPI_ISteamGameServer_SetMapName";
SetPasswordProtected :: (self: *ISteamGameServer, bPasswordProtected: bool) #foreign steam "SteamAPI_ISteamGameServer_SetPasswordProtected";
SetSpectatorPort :: (self: *ISteamGameServer, unSpectatorPort: uint16) #foreign steam "SteamAPI_ISteamGameServer_SetSpectatorPort";
SetSpectatorServerName :: (self: *ISteamGameServer, pszSpectatorServerName: *char) #foreign steam "SteamAPI_ISteamGameServer_SetSpectatorServerName";
ClearAllKeyValues :: (self: *ISteamGameServer) #foreign steam "SteamAPI_ISteamGameServer_ClearAllKeyValues";
SetKeyValue :: (self: *ISteamGameServer, pKey: *char, pValue: *char) #foreign steam "SteamAPI_ISteamGameServer_SetKeyValue";
SetGameTags :: (self: *ISteamGameServer, pchGameTags: *char) #foreign steam "SteamAPI_ISteamGameServer_SetGameTags";
SetGameData :: (self: *ISteamGameServer, pchGameData: *char) #foreign steam "SteamAPI_ISteamGameServer_SetGameData";
SetRegion :: (self: *ISteamGameServer, pszRegion: *char) #foreign steam "SteamAPI_ISteamGameServer_SetRegion";
SendUserConnectAndAuthenticate :: (self: *ISteamGameServer, unIPClient: uint32, pvAuthBlob: *void, cubAuthBlobSize: uint32, pSteamIDUser: *CSteamID) -> bool #foreign steam "SteamAPI_ISteamGameServer_SendUserConnectAndAuthenticate";
CreateUnauthenticatedUserConnection :: (self: *ISteamGameServer) -> uint64_steamid #foreign steam "SteamAPI_ISteamGameServer_CreateUnauthenticatedUserConnection";
SendUserDisconnect :: (self: *ISteamGameServer, steamIDUser: uint64_steamid) #foreign steam "SteamAPI_ISteamGameServer_SendUserDisconnect";
BUpdateUserData :: (self: *ISteamGameServer, steamIDUser: uint64_steamid, pchPlayerName: *char, uScore: uint32) -> bool #foreign steam "SteamAPI_ISteamGameServer_BUpdateUserData";
GetAuthSessionTicket :: (self: *ISteamGameServer, pTicket: *void, cbMaxTicket: s32, pcbTicket: *uint32) -> HAuthTicket #foreign steam "SteamAPI_ISteamGameServer_GetAuthSessionTicket";
BeginAuthSession :: (self: *ISteamGameServer, pAuthTicket: *void, cbAuthTicket: s32, steamID: uint64_steamid) -> EBeginAuthSessionResult #foreign steam "SteamAPI_ISteamGameServer_BeginAuthSession";
EndAuthSession :: (self: *ISteamGameServer, steamID: uint64_steamid) #foreign steam "SteamAPI_ISteamGameServer_EndAuthSession";
CancelAuthTicket :: (self: *ISteamGameServer, hAuthTicket: HAuthTicket) #foreign steam "SteamAPI_ISteamGameServer_CancelAuthTicket";
UserHasLicenseForApp :: (self: *ISteamGameServer, steamID: uint64_steamid, appID: AppId_t) -> EUserHasLicenseForAppResult #foreign steam "SteamAPI_ISteamGameServer_UserHasLicenseForApp";
RequestUserGroupStatus :: (self: *ISteamGameServer, steamIDUser: uint64_steamid, steamIDGroup: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamGameServer_RequestUserGroupStatus";
GetGameplayStats :: (self: *ISteamGameServer) #foreign steam "SteamAPI_ISteamGameServer_GetGameplayStats";
GetServerReputation :: (self: *ISteamGameServer) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamGameServer_GetServerReputation";
GetPublicIP :: (self: *ISteamGameServer) -> SteamIPAddress_t #foreign steam "SteamAPI_ISteamGameServer_GetPublicIP";
HandleIncomingPacket :: (self: *ISteamGameServer, pData: *void, cbData: s32, srcIP: uint32, srcPort: uint16) -> bool #foreign steam "SteamAPI_ISteamGameServer_HandleIncomingPacket";
GetNextOutgoingPacket :: (self: *ISteamGameServer, pOut: *void, cbMaxOut: s32, pNetAdr: *uint32, pPort: *uint16) -> s32 #foreign steam "SteamAPI_ISteamGameServer_GetNextOutgoingPacket";
EnableHeartbeats :: (self: *ISteamGameServer, bActive: bool) #foreign steam "SteamAPI_ISteamGameServer_EnableHeartbeats";
SetHeartbeatInterval :: (self: *ISteamGameServer, iHeartbeatInterval: s32) #foreign steam "SteamAPI_ISteamGameServer_SetHeartbeatInterval";
ForceHeartbeat :: (self: *ISteamGameServer) #foreign steam "SteamAPI_ISteamGameServer_ForceHeartbeat";
AssociateWithClan :: (self: *ISteamGameServer, steamIDClan: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamGameServer_AssociateWithClan";
ComputeNewPlayerCompatibility :: (self: *ISteamGameServer, steamIDNewPlayer: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamGameServer_ComputeNewPlayerCompatibility";

// ISteamGameServerStats
SteamGameServerStats :: () -> *ISteamGameServerStats #foreign steam "SteamAPI_SteamGameServerStats_v001";
RequestUserStats :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamGameServerStats_RequestUserStats";
GetUserStatInt32 :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *char, pData: *int32) -> bool #foreign steam "SteamAPI_ISteamGameServerStats_GetUserStatInt32";
GetUserStatFloat :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *char, pData: *float) -> bool #foreign steam "SteamAPI_ISteamGameServerStats_GetUserStatFloat";
GetUserAchievement :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *char, pbAchieved: *bool) -> bool #foreign steam "SteamAPI_ISteamGameServerStats_GetUserAchievement";
SetUserStatInt32 :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *char, nData: int32) -> bool #foreign steam "SteamAPI_ISteamGameServerStats_SetUserStatInt32";
SetUserStatFloat :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *char, fData: float) -> bool #foreign steam "SteamAPI_ISteamGameServerStats_SetUserStatFloat";
UpdateUserAvgRateStat :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *char, flCountThisSession: float, dSessionLength: double) -> bool #foreign steam "SteamAPI_ISteamGameServerStats_UpdateUserAvgRateStat";
SetUserAchievement :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *char) -> bool #foreign steam "SteamAPI_ISteamGameServerStats_SetUserAchievement";
ClearUserAchievement :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid, pchName: *char) -> bool #foreign steam "SteamAPI_ISteamGameServerStats_ClearUserAchievement";
StoreUserStats :: (self: *ISteamGameServerStats, steamIDUser: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamGameServerStats_StoreUserStats";

// SteamIPAddress_t
IsSet :: (self: *SteamIPAddress_t) -> bool #foreign steam "SteamAPI_SteamIPAddress_t_IsSet";

// MatchMakingKeyValuePair_t
Construct :: (self: *MatchMakingKeyValuePair_t) #foreign steam "SteamAPI_MatchMakingKeyValuePair_t_Construct";

// servernetadr_t
Construct :: (self: *servernetadr_t) #foreign steam "SteamAPI_servernetadr_t_Construct";
Init :: (self: *servernetadr_t, ip: u32, usQueryPort: uint16, usConnectionPort: uint16) #foreign steam "SteamAPI_servernetadr_t_Init";
GetQueryPort :: (self: *servernetadr_t) -> uint16 #foreign steam "SteamAPI_servernetadr_t_GetQueryPort";
SetQueryPort :: (self: *servernetadr_t, usPort: uint16) #foreign steam "SteamAPI_servernetadr_t_SetQueryPort";
GetConnectionPort :: (self: *servernetadr_t) -> uint16 #foreign steam "SteamAPI_servernetadr_t_GetConnectionPort";
SetConnectionPort :: (self: *servernetadr_t, usPort: uint16) #foreign steam "SteamAPI_servernetadr_t_SetConnectionPort";
GetIP :: (self: *servernetadr_t) -> uint32 #foreign steam "SteamAPI_servernetadr_t_GetIP";
SetIP :: (self: *servernetadr_t, unIP: uint32) #foreign steam "SteamAPI_servernetadr_t_SetIP";
GetConnectionAddressString :: (self: *servernetadr_t) -> *char #foreign steam "SteamAPI_servernetadr_t_GetConnectionAddressString";
GetQueryAddressString :: (self: *servernetadr_t) -> *char #foreign steam "SteamAPI_servernetadr_t_GetQueryAddressString";
IsLessThan :: (self: *servernetadr_t, netadr: *servernetadr_t) -> bool #foreign steam "SteamAPI_servernetadr_t_IsLessThan";
Assign :: (self: *servernetadr_t, that: *servernetadr_t) #foreign steam "SteamAPI_servernetadr_t_Assign";

// gameserveritem_t
Construct :: (self: *gameserveritem_t) #foreign steam "SteamAPI_gameserveritem_t_Construct";
GetName :: (self: *gameserveritem_t) -> *char #foreign steam "SteamAPI_gameserveritem_t_GetName";
SetName :: (self: *gameserveritem_t, pName: *char) #foreign steam "SteamAPI_gameserveritem_t_SetName";

// SteamNetworkingIPAddr
Clear :: (self: *SteamNetworkingIPAddr) #foreign steam "SteamAPI_SteamNetworkingIPAddr_Clear";
IsIPv6AllZeros :: (self: *SteamNetworkingIPAddr) -> bool #foreign steam "SteamAPI_SteamNetworkingIPAddr_IsIPv6AllZeros";
SetIPv6 :: (self: *SteamNetworkingIPAddr, ipv6: *uint8, nPort: uint16) #foreign steam "SteamAPI_SteamNetworkingIPAddr_SetIPv6";
SetIPv4 :: (self: *SteamNetworkingIPAddr, nIP: uint32, nPort: uint16) #foreign steam "SteamAPI_SteamNetworkingIPAddr_SetIPv4";
IsIPv4 :: (self: *SteamNetworkingIPAddr) -> bool #foreign steam "SteamAPI_SteamNetworkingIPAddr_IsIPv4";
GetIPv4 :: (self: *SteamNetworkingIPAddr) -> uint32 #foreign steam "SteamAPI_SteamNetworkingIPAddr_GetIPv4";
SetIPv6LocalHost :: (self: *SteamNetworkingIPAddr, nPort: uint16) #foreign steam "SteamAPI_SteamNetworkingIPAddr_SetIPv6LocalHost";
IsLocalHost :: (self: *SteamNetworkingIPAddr) -> bool #foreign steam "SteamAPI_SteamNetworkingIPAddr_IsLocalHost";
ToString :: (self: *SteamNetworkingIPAddr, buf: *char, cbBuf: uint32, bWithPort: bool) #foreign steam "SteamAPI_SteamNetworkingIPAddr_ToString";
ParseString :: (self: *SteamNetworkingIPAddr, pszStr: *char) -> bool #foreign steam "SteamAPI_SteamNetworkingIPAddr_ParseString";
IsEqualTo :: (self: *SteamNetworkingIPAddr, x: *SteamNetworkingIPAddr) -> bool #foreign steam "SteamAPI_SteamNetworkingIPAddr_IsEqualTo";

// SteamNetworkingIdentity
Clear :: (self: *SteamNetworkingIdentity) #foreign steam "SteamAPI_SteamNetworkingIdentity_Clear";
IsInvalid :: (self: *SteamNetworkingIdentity) -> bool #foreign steam "SteamAPI_SteamNetworkingIdentity_IsInvalid";
SetSteamID :: (self: *SteamNetworkingIdentity, steamID: uint64_steamid) #foreign steam "SteamAPI_SteamNetworkingIdentity_SetSteamID";
GetSteamID :: (self: *SteamNetworkingIdentity) -> uint64_steamid #foreign steam "SteamAPI_SteamNetworkingIdentity_GetSteamID";
SetSteamID64 :: (self: *SteamNetworkingIdentity, steamID: uint64) #foreign steam "SteamAPI_SteamNetworkingIdentity_SetSteamID64";
GetSteamID64 :: (self: *SteamNetworkingIdentity) -> uint64 #foreign steam "SteamAPI_SteamNetworkingIdentity_GetSteamID64";
SetXboxPairwiseID :: (self: *SteamNetworkingIdentity, pszString: *char) -> bool #foreign steam "SteamAPI_SteamNetworkingIdentity_SetXboxPairwiseID";
GetXboxPairwiseID :: (self: *SteamNetworkingIdentity) -> *char #foreign steam "SteamAPI_SteamNetworkingIdentity_GetXboxPairwiseID";
SetIPAddr :: (self: *SteamNetworkingIdentity, addr: *SteamNetworkingIPAddr) #foreign steam "SteamAPI_SteamNetworkingIdentity_SetIPAddr";
GetIPAddr :: (self: *SteamNetworkingIdentity) -> *SteamNetworkingIPAddr #foreign steam "SteamAPI_SteamNetworkingIdentity_GetIPAddr";
SetLocalHost :: (self: *SteamNetworkingIdentity) #foreign steam "SteamAPI_SteamNetworkingIdentity_SetLocalHost";
IsLocalHost :: (self: *SteamNetworkingIdentity) -> bool #foreign steam "SteamAPI_SteamNetworkingIdentity_IsLocalHost";
SetGenericString :: (self: *SteamNetworkingIdentity, pszString: *char) -> bool #foreign steam "SteamAPI_SteamNetworkingIdentity_SetGenericString";
GetGenericString :: (self: *SteamNetworkingIdentity) -> *char #foreign steam "SteamAPI_SteamNetworkingIdentity_GetGenericString";
SetGenericBytes :: (self: *SteamNetworkingIdentity, data: *void, cbLen: uint32) -> bool #foreign steam "SteamAPI_SteamNetworkingIdentity_SetGenericBytes";
GetGenericBytes :: (self: *SteamNetworkingIdentity, cbLen: *s32) -> *uint8 #foreign steam "SteamAPI_SteamNetworkingIdentity_GetGenericBytes";
IsEqualTo :: (self: *SteamNetworkingIdentity, x: *SteamNetworkingIdentity) -> bool #foreign steam "SteamAPI_SteamNetworkingIdentity_IsEqualTo";
ToString :: (self: *SteamNetworkingIdentity, buf: *char, cbBuf: uint32) #foreign steam "SteamAPI_SteamNetworkingIdentity_ToString";
ParseString :: (self: *SteamNetworkingIdentity, pszStr: *char) -> bool #foreign steam "SteamAPI_SteamNetworkingIdentity_ParseString";

// SteamNetworkingMessage_t
Release :: (self: *SteamNetworkingMessage_t) #foreign steam "SteamAPI_SteamNetworkingMessage_t_Release";

// SteamNetworkingConfigValue_t
SetInt32 :: (self: *SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: int32_t) #foreign steam "SteamAPI_SteamNetworkingConfigValue_t_SetInt32";
SetInt64 :: (self: *SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: int64_t) #foreign steam "SteamAPI_SteamNetworkingConfigValue_t_SetInt64";
SetFloat :: (self: *SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: float) #foreign steam "SteamAPI_SteamNetworkingConfigValue_t_SetFloat";
SetPtr :: (self: *SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: *void) #foreign steam "SteamAPI_SteamNetworkingConfigValue_t_SetPtr";
SetString :: (self: *SteamNetworkingConfigValue_t, eVal: ESteamNetworkingConfigValue, data: *char) #foreign steam "SteamAPI_SteamNetworkingConfigValue_t_SetString";

// SteamNetworkingPOPIDRender
c_str :: (self: *SteamNetworkingPOPIDRender) -> *char #foreign steam "SteamAPI_SteamNetworkingPOPIDRender_c_str";

// SteamNetworkingIdentityRender
c_str :: (self: *SteamNetworkingIdentityRender) -> *char #foreign steam "SteamAPI_SteamNetworkingIdentityRender_c_str";

// SteamNetworkingIPAddrRender
c_str :: (self: *SteamNetworkingIPAddrRender) -> *char #foreign steam "SteamAPI_SteamNetworkingIPAddrRender_c_str";

// SteamDatagramHostedAddress
Clear :: (self: *SteamDatagramHostedAddress) #foreign steam "SteamAPI_SteamDatagramHostedAddress_Clear";
GetPopID :: (self: *SteamDatagramHostedAddress) -> SteamNetworkingPOPID #foreign steam "SteamAPI_SteamDatagramHostedAddress_GetPopID";
SetDevAddress :: (self: *SteamDatagramHostedAddress, nIP: uint32, nPort: uint16, popid: SteamNetworkingPOPID) #foreign steam "SteamAPI_SteamDatagramHostedAddress_SetDevAddress";



uint64_steamid :: uint64; // Used when passing or returning CSteamID
uint64_gameid :: uint64;  // Used when passing or return CGameID

EFailureType :: enum s32 {
    k_EFailureFlushedCallbackQueue :: 0;
    k_EFailurePipeFail :: 1;
}

PlayerAcceptState_t :: enum s32 {
    k_EStateUnknown :: 0;
    k_EStatePlayerAccepted :: 1;
    k_EStatePlayerDeclined :: 2;
}

SteamServersConnected_t :: struct {
    k_iCallback : s32 : 101;
}

SteamServerConnectFailure_t :: struct {
    k_iCallback : s32 : 102;
    m_eResult : EResult;
    m_bStillRetrying : bool;
}

SteamServersDisconnected_t :: struct {
    k_iCallback : s32 : 103;
    m_eResult : EResult;
}

ClientGameServerDeny_t :: struct {
    k_iCallback : s32 : 113;
    m_uAppID : uint32;
    m_unGameServerIP : uint32;
    m_usGameServerPort : uint16;
    m_bSecure : uint16;
    m_uReason : uint32;
}

IPCFailure_t :: struct {
    k_iCallback : s32 : 117;
    m_eFailureType : uint8;
}

LicensesUpdated_t :: struct {
    k_iCallback : s32 : 125;
}

ValidateAuthTicketResponse_t :: struct {
    k_iCallback : s32 : 143;
    m_SteamID : CSteamID;
    m_eAuthSessionResponse : EAuthSessionResponse;
    m_OwnerSteamID : CSteamID;
}

MicroTxnAuthorizationResponse_t :: struct {
    k_iCallback : s32 : 152;
    m_unAppID : uint32;
    m_ulOrderID : uint64;
    m_bAuthorized : uint8;
}

EncryptedAppTicketResponse_t :: struct {
    k_iCallback : s32 : 154;
    m_eResult : EResult;
}

GetAuthSessionTicketResponse_t :: struct {
    k_iCallback : s32 : 163;
    m_hAuthTicket : HAuthTicket;
    m_eResult : EResult;
}

GameWebCallback_t :: struct {
    k_iCallback : s32 : 164;
    m_szURL : [256] char ;
}

StoreAuthURLResponse_t :: struct {
    k_iCallback : s32 : 165;
    m_szURL : [512] char ;
}

MarketEligibilityResponse_t :: struct {
    k_iCallback : s32 : 166;
    m_bAllowed : bool;
    m_eNotAllowedReason : EMarketNotAllowedReasonFlags;
    m_rtAllowedAtTime : RTime32;
    m_cdaySteamGuardRequiredDays : s32;
    m_cdayNewDeviceCooldown : s32;
}

DurationControl_t :: struct {
    k_iCallback : s32 : 167;
    m_eResult : EResult;
    m_appid : AppId_t;
    m_bApplicable : bool;
    m_csecsLast5h : int32;
    m_progress : EDurationControlProgress;
    m_notification : EDurationControlNotification;
    m_csecsToday : int32;
    m_csecsRemaining : int32;
}

PersonaStateChange_t :: struct {
    k_iCallback : s32 : 304;
    m_ulSteamID : uint64;
    m_nChangeFlags : s32;
}

GameOverlayActivated_t :: struct {
    k_iCallback : s32 : 331;
    m_bActive : uint8;
}

GameServerChangeRequested_t :: struct {
    k_iCallback : s32 : 332;
    m_rgchServer : [64] char ;
    m_rgchPassword : [64] char ;
}

GameLobbyJoinRequested_t :: struct {
    k_iCallback : s32 : 333;
    m_steamIDLobby : CSteamID;
    m_steamIDFriend : CSteamID;
}

AvatarImageLoaded_t :: struct {
    k_iCallback : s32 : 334;
    m_steamID : CSteamID;
    m_iImage : s32;
    m_iWide : s32;
    m_iTall : s32;
}

ClanOfficerListResponse_t :: struct {
    k_iCallback : s32 : 335;
    m_steamIDClan : CSteamID;
    m_cOfficers : s32;
    m_bSuccess : uint8;
}

FriendRichPresenceUpdate_t :: struct {
    k_iCallback : s32 : 336;
    m_steamIDFriend : CSteamID;
    m_nAppID : AppId_t;
}

GameRichPresenceJoinRequested_t :: struct {
    k_iCallback : s32 : 337;
    m_steamIDFriend : CSteamID;
    m_rgchConnect : [256] char ;
}

GameConnectedClanChatMsg_t :: struct {
    k_iCallback : s32 : 338;
    m_steamIDClanChat : CSteamID;
    m_steamIDUser : CSteamID;
    m_iMessageID : s32;
}

GameConnectedChatJoin_t :: struct {
    k_iCallback : s32 : 339;
    m_steamIDClanChat : CSteamID;
    m_steamIDUser : CSteamID;
}

GameConnectedChatLeave_t :: struct {
    k_iCallback : s32 : 340;
    m_steamIDClanChat : CSteamID;
    m_steamIDUser : CSteamID;
    m_bKicked : bool;
    m_bDropped : bool;
}

DownloadClanActivityCountsResult_t :: struct {
    k_iCallback : s32 : 341;
    m_bSuccess : bool;
}

JoinClanChatRoomCompletionResult_t :: struct {
    k_iCallback : s32 : 342;
    m_steamIDClanChat : CSteamID;
    m_eChatRoomEnterResponse : EChatRoomEnterResponse;
}

GameConnectedFriendChatMsg_t :: struct {
    k_iCallback : s32 : 343;
    m_steamIDUser : CSteamID;
    m_iMessageID : s32;
}

FriendsGetFollowerCount_t :: struct {
    k_iCallback : s32 : 344;
    m_eResult : EResult;
    m_steamID : CSteamID;
    m_nCount : s32;
}

FriendsIsFollowing_t :: struct {
    k_iCallback : s32 : 345;
    m_eResult : EResult;
    m_steamID : CSteamID;
    m_bIsFollowing : bool;
}

FriendsEnumerateFollowingList_t :: struct {
    k_iCallback : s32 : 346;
    m_eResult : EResult;
    m_rgSteamID : [50] CSteamID ;
    m_nResultsReturned : int32;
    m_nTotalResultCount : int32;
}

SetPersonaNameResponse_t :: struct {
    k_iCallback : s32 : 347;
    m_bSuccess : bool;
    m_bLocalSuccess : bool;
    m_result : EResult;
}

UnreadChatMessagesChanged_t :: struct {
    k_iCallback : s32 : 348;
}

OverlayBrowserProtocolNavigation_t :: struct {
    k_iCallback : s32 : 349;
    rgchURI : [1024] char ;
}

IPCountry_t :: struct {
    k_iCallback : s32 : 701;
}

LowBatteryPower_t :: struct {
    k_iCallback : s32 : 702;
    m_nMinutesBatteryLeft : uint8;
}

SteamAPICallCompleted_t :: struct {
    k_iCallback : s32 : 703;
    m_hAsyncCall : SteamAPICall_t;
    m_iCallback : s32;
    m_cubParam : uint32;
}

SteamShutdown_t :: struct {
    k_iCallback : s32 : 704;
}

CheckFileSignature_t :: struct {
    k_iCallback : s32 : 705;
    m_eCheckFileSignature : ECheckFileSignature;
}

GamepadTextInputDismissed_t :: struct {
    k_iCallback : s32 : 714;
    m_bSubmitted : bool;
    m_unSubmittedText : uint32;
}

FavoritesListChanged_t :: struct {
    k_iCallback : s32 : 502;
    m_nIP : uint32;
    m_nQueryPort : uint32;
    m_nConnPort : uint32;
    m_nAppID : uint32;
    m_nFlags : uint32;
    m_bAdd : bool;
    m_unAccountId : AccountID_t;
}

LobbyInvite_t :: struct {
    k_iCallback : s32 : 503;
    m_ulSteamIDUser : uint64;
    m_ulSteamIDLobby : uint64;
    m_ulGameID : uint64;
}

LobbyEnter_t :: struct {
    k_iCallback : s32 : 504;
    m_ulSteamIDLobby : uint64;
    m_rgfChatPermissions : uint32;
    m_bLocked : bool;
    m_EChatRoomEnterResponse : uint32;
}

LobbyDataUpdate_t :: struct {
    k_iCallback : s32 : 505;
    m_ulSteamIDLobby : uint64;
    m_ulSteamIDMember : uint64;
    m_bSuccess : uint8;
}

LobbyChatUpdate_t :: struct {
    k_iCallback : s32 : 506;
    m_ulSteamIDLobby : uint64;
    m_ulSteamIDUserChanged : uint64;
    m_ulSteamIDMakingChange : uint64;
    m_rgfChatMemberStateChange : uint32;
}

LobbyChatMsg_t :: struct {
    k_iCallback : s32 : 507;
    m_ulSteamIDLobby : uint64;
    m_ulSteamIDUser : uint64;
    m_eChatEntryType : uint8;
    m_iChatID : uint32;
}

LobbyGameCreated_t :: struct {
    k_iCallback : s32 : 509;
    m_ulSteamIDLobby : uint64;
    m_ulSteamIDGameServer : uint64;
    m_unIP : uint32;
    m_usPort : uint16;
}

LobbyMatchList_t :: struct {
    k_iCallback : s32 : 510;
    m_nLobbiesMatching : uint32;
}

LobbyKicked_t :: struct {
    k_iCallback : s32 : 512;
    m_ulSteamIDLobby : uint64;
    m_ulSteamIDAdmin : uint64;
    m_bKickedDueToDisconnect : uint8;
}

LobbyCreated_t :: struct {
    k_iCallback : s32 : 513;
    m_eResult : EResult;
    m_ulSteamIDLobby : uint64;
}

PSNGameBootInviteResult_t :: struct {
    k_iCallback : s32 : 515;
    m_bGameBootInviteExists : bool;
    m_steamIDLobby : CSteamID;
}

FavoritesListAccountsUpdated_t :: struct {
    k_iCallback : s32 : 516;
    m_eResult : EResult;
}

SearchForGameProgressCallback_t :: struct {
    k_iCallback : s32 : 5201;
    m_ullSearchID : uint64;
    m_eResult : EResult;
    m_lobbyID : CSteamID;
    m_steamIDEndedSearch : CSteamID;
    m_nSecondsRemainingEstimate : int32;
    m_cPlayersSearching : int32;
}

SearchForGameResultCallback_t :: struct {
    k_iCallback : s32 : 5202;
    m_ullSearchID : uint64;
    m_eResult : EResult;
    m_nCountPlayersInGame : int32;
    m_nCountAcceptedGame : int32;
    m_steamIDHost : CSteamID;
    m_bFinalCallback : bool;
}

RequestPlayersForGameProgressCallback_t :: struct {
    k_iCallback : s32 : 5211;
    m_eResult : EResult;
    m_ullSearchID : uint64;
}

RequestPlayersForGameResultCallback_t :: struct {
    k_iCallback : s32 : 5212;
    m_eResult : EResult;
    m_ullSearchID : uint64;
    m_SteamIDPlayerFound : CSteamID;
    m_SteamIDLobby : CSteamID;
    m_ePlayerAcceptState : PlayerAcceptState_t;
    m_nPlayerIndex : int32;
    m_nTotalPlayersFound : int32;
    m_nTotalPlayersAcceptedGame : int32;
    m_nSuggestedTeamIndex : int32;
    m_ullUniqueGameID : uint64;
}

RequestPlayersForGameFinalResultCallback_t :: struct {
    k_iCallback : s32 : 5213;
    m_eResult : EResult;
    m_ullSearchID : uint64;
    m_ullUniqueGameID : uint64;
}

SubmitPlayerResultResultCallback_t :: struct {
    k_iCallback : s32 : 5214;
    m_eResult : EResult;
    ullUniqueGameID : uint64;
    steamIDPlayer : CSteamID;
}

EndGameResultCallback_t :: struct {
    k_iCallback : s32 : 5215;
    m_eResult : EResult;
    ullUniqueGameID : uint64;
}

JoinPartyCallback_t :: struct {
    k_iCallback : s32 : 5301;
    m_eResult : EResult;
    m_ulBeaconID : PartyBeaconID_t;
    m_SteamIDBeaconOwner : CSteamID;
    m_rgchConnectString : [256] char ;
}

CreateBeaconCallback_t :: struct {
    k_iCallback : s32 : 5302;
    m_eResult : EResult;
    m_ulBeaconID : PartyBeaconID_t;
}

ReservationNotificationCallback_t :: struct {
    k_iCallback : s32 : 5303;
    m_ulBeaconID : PartyBeaconID_t;
    m_steamIDJoiner : CSteamID;
}

ChangeNumOpenSlotsCallback_t :: struct {
    k_iCallback : s32 : 5304;
    m_eResult : EResult;
}

AvailableBeaconLocationsUpdated_t :: struct {
    k_iCallback : s32 : 5305;
}

ActiveBeaconsUpdated_t :: struct {
    k_iCallback : s32 : 5306;
}

RemoteStorageAppSyncedClient_t :: struct {
    k_iCallback : s32 : 1301;
    m_nAppID : AppId_t;
    m_eResult : EResult;
    m_unNumDownloads : s32;
}

RemoteStorageAppSyncedServer_t :: struct {
    k_iCallback : s32 : 1302;
    m_nAppID : AppId_t;
    m_eResult : EResult;
    m_unNumUploads : s32;
}

RemoteStorageAppSyncProgress_t :: struct {
    k_iCallback : s32 : 1303;
    m_rgchCurrentFile : [260] char ;
    m_nAppID : AppId_t;
    m_uBytesTransferredThisChunk : uint32;
    m_dAppPercentComplete : double;
    m_bUploading : bool;
}

RemoteStorageAppSyncStatusCheck_t :: struct {
    k_iCallback : s32 : 1305;
    m_nAppID : AppId_t;
    m_eResult : EResult;
}

RemoteStorageFileShareResult_t :: struct {
    k_iCallback : s32 : 1307;
    m_eResult : EResult;
    m_hFile : UGCHandle_t;
    m_rgchFilename : [260] char ;
}

RemoteStoragePublishFileResult_t :: struct {
    k_iCallback : s32 : 1309;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
    m_bUserNeedsToAcceptWorkshopLegalAgreement : bool;
}

RemoteStorageDeletePublishedFileResult_t :: struct {
    k_iCallback : s32 : 1311;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
}

RemoteStorageEnumerateUserPublishedFilesResult_t :: struct {
    k_iCallback : s32 : 1312;
    m_eResult : EResult;
    m_nResultsReturned : int32;
    m_nTotalResultCount : int32;
    m_rgPublishedFileId : [50] PublishedFileId_t ;
}

RemoteStorageSubscribePublishedFileResult_t :: struct {
    k_iCallback : s32 : 1313;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
}

RemoteStorageEnumerateUserSubscribedFilesResult_t :: struct {
    k_iCallback : s32 : 1314;
    m_eResult : EResult;
    m_nResultsReturned : int32;
    m_nTotalResultCount : int32;
    m_rgPublishedFileId : [50] PublishedFileId_t ;
    m_rgRTimeSubscribed : [50] uint32 ;
}

RemoteStorageUnsubscribePublishedFileResult_t :: struct {
    k_iCallback : s32 : 1315;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
}

RemoteStorageUpdatePublishedFileResult_t :: struct {
    k_iCallback : s32 : 1316;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
    m_bUserNeedsToAcceptWorkshopLegalAgreement : bool;
}

RemoteStorageDownloadUGCResult_t :: struct {
    k_iCallback : s32 : 1317;
    m_eResult : EResult;
    m_hFile : UGCHandle_t;
    m_nAppID : AppId_t;
    m_nSizeInBytes : int32;
    m_pchFileName : [260] char ;
    m_ulSteamIDOwner : uint64;
}

RemoteStorageGetPublishedFileDetailsResult_t :: struct {
    k_iCallback : s32 : 1318;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
    m_nCreatorAppID : AppId_t;
    m_nConsumerAppID : AppId_t;
    m_rgchTitle : [129] char ;
    m_rgchDescription : [8000] char ;
    m_hFile : UGCHandle_t;
    m_hPreviewFile : UGCHandle_t;
    m_ulSteamIDOwner : uint64;
    m_rtimeCreated : uint32;
    m_rtimeUpdated : uint32;
    m_eVisibility : ERemoteStoragePublishedFileVisibility;
    m_bBanned : bool;
    m_rgchTags : [1025] char ;
    m_bTagsTruncated : bool;
    m_pchFileName : [260] char ;
    m_nFileSize : int32;
    m_nPreviewFileSize : int32;
    m_rgchURL : [256] char ;
    m_eFileType : EWorkshopFileType;
    m_bAcceptedForUse : bool;
}

RemoteStorageEnumerateWorkshopFilesResult_t :: struct {
    k_iCallback : s32 : 1319;
    m_eResult : EResult;
    m_nResultsReturned : int32;
    m_nTotalResultCount : int32;
    m_rgPublishedFileId : [50] PublishedFileId_t ;
    m_rgScore : [50] float ;
    m_nAppId : AppId_t;
    m_unStartIndex : uint32;
}

RemoteStorageGetPublishedItemVoteDetailsResult_t :: struct {
    k_iCallback : s32 : 1320;
    m_eResult : EResult;
    m_unPublishedFileId : PublishedFileId_t;
    m_nVotesFor : int32;
    m_nVotesAgainst : int32;
    m_nReports : int32;
    m_fScore : float;
}

RemoteStoragePublishedFileSubscribed_t :: struct {
    k_iCallback : s32 : 1321;
    m_nPublishedFileId : PublishedFileId_t;
    m_nAppID : AppId_t;
}

RemoteStoragePublishedFileUnsubscribed_t :: struct {
    k_iCallback : s32 : 1322;
    m_nPublishedFileId : PublishedFileId_t;
    m_nAppID : AppId_t;
}

RemoteStoragePublishedFileDeleted_t :: struct {
    k_iCallback : s32 : 1323;
    m_nPublishedFileId : PublishedFileId_t;
    m_nAppID : AppId_t;
}

RemoteStorageUpdateUserPublishedItemVoteResult_t :: struct {
    k_iCallback : s32 : 1324;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
}

RemoteStorageUserVoteDetails_t :: struct {
    k_iCallback : s32 : 1325;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
    m_eVote : EWorkshopVote;
}

RemoteStorageEnumerateUserSharedWorkshopFilesResult_t :: struct {
    k_iCallback : s32 : 1326;
    m_eResult : EResult;
    m_nResultsReturned : int32;
    m_nTotalResultCount : int32;
    m_rgPublishedFileId : [50] PublishedFileId_t ;
}

RemoteStorageSetUserPublishedFileActionResult_t :: struct {
    k_iCallback : s32 : 1327;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
    m_eAction : EWorkshopFileAction;
}

RemoteStorageEnumeratePublishedFilesByUserActionResult_t :: struct {
    k_iCallback : s32 : 1328;
    m_eResult : EResult;
    m_eAction : EWorkshopFileAction;
    m_nResultsReturned : int32;
    m_nTotalResultCount : int32;
    m_rgPublishedFileId : [50] PublishedFileId_t ;
    m_rgRTimeUpdated : [50] uint32 ;
}

RemoteStoragePublishFileProgress_t :: struct {
    k_iCallback : s32 : 1329;
    m_dPercentFile : double;
    m_bPreview : bool;
}

RemoteStoragePublishedFileUpdated_t :: struct {
    k_iCallback : s32 : 1330;
    m_nPublishedFileId : PublishedFileId_t;
    m_nAppID : AppId_t;
    m_ulUnused : uint64;
}

RemoteStorageFileWriteAsyncComplete_t :: struct {
    k_iCallback : s32 : 1331;
    m_eResult : EResult;
}

RemoteStorageFileReadAsyncComplete_t :: struct {
    k_iCallback : s32 : 1332;
    m_hFileReadAsync : SteamAPICall_t;
    m_eResult : EResult;
    m_nOffset : uint32;
    m_cubRead : uint32;
}

UserStatsReceived_t :: struct {
    k_iCallback : s32 : 1101;
    m_nGameID : uint64;
    m_eResult : EResult;
    m_steamIDUser : CSteamID;
}

UserStatsStored_t :: struct {
    k_iCallback : s32 : 1102;
    m_nGameID : uint64;
    m_eResult : EResult;
}

UserAchievementStored_t :: struct {
    k_iCallback : s32 : 1103;
    m_nGameID : uint64;
    m_bGroupAchievement : bool;
    m_rgchAchievementName : [128] char ;
    m_nCurProgress : uint32;
    m_nMaxProgress : uint32;
}

LeaderboardFindResult_t :: struct {
    k_iCallback : s32 : 1104;
    m_hSteamLeaderboard : SteamLeaderboard_t;
    m_bLeaderboardFound : uint8;
}

LeaderboardScoresDownloaded_t :: struct {
    k_iCallback : s32 : 1105;
    m_hSteamLeaderboard : SteamLeaderboard_t;
    m_hSteamLeaderboardEntries : SteamLeaderboardEntries_t;
    m_cEntryCount : s32;
}

LeaderboardScoreUploaded_t :: struct {
    k_iCallback : s32 : 1106;
    m_bSuccess : uint8;
    m_hSteamLeaderboard : SteamLeaderboard_t;
    m_nScore : int32;
    m_bScoreChanged : uint8;
    m_nGlobalRankNew : s32;
    m_nGlobalRankPrevious : s32;
}

NumberOfCurrentPlayers_t :: struct {
    k_iCallback : s32 : 1107;
    m_bSuccess : uint8;
    m_cPlayers : int32;
}

UserStatsUnloaded_t :: struct {
    k_iCallback : s32 : 1108;
    m_steamIDUser : CSteamID;
}

UserAchievementIconFetched_t :: struct {
    k_iCallback : s32 : 1109;
    m_nGameID : CGameID;
    m_rgchAchievementName : [128] char ;
    m_bAchieved : bool;
    m_nIconHandle : s32;
}

GlobalAchievementPercentagesReady_t :: struct {
    k_iCallback : s32 : 1110;
    m_nGameID : uint64;
    m_eResult : EResult;
}

LeaderboardUGCSet_t :: struct {
    k_iCallback : s32 : 1111;
    m_eResult : EResult;
    m_hSteamLeaderboard : SteamLeaderboard_t;
}

PS3TrophiesInstalled_t :: struct {
    k_iCallback : s32 : 1112;
    m_nGameID : uint64;
    m_eResult : EResult;
    m_ulRequiredDiskSpace : uint64;
}

GlobalStatsReceived_t :: struct {
    k_iCallback : s32 : 1112;
    m_nGameID : uint64;
    m_eResult : EResult;
}

DlcInstalled_t :: struct {
    k_iCallback : s32 : 1005;
    m_nAppID : AppId_t;
}

RegisterActivationCodeResponse_t :: struct {
    k_iCallback : s32 : 1008;
    m_eResult : ERegisterActivationCodeResult;
    m_unPackageRegistered : uint32;
}

NewUrlLaunchParameters_t :: struct {
    k_iCallback : s32 : 1014;
}

AppProofOfPurchaseKeyResponse_t :: struct {
    k_iCallback : s32 : 1021;
    m_eResult : EResult;
    m_nAppID : uint32;
    m_cchKeyLength : uint32;
    m_rgchKey : [240] char ;
}

FileDetailsResult_t :: struct {
    k_iCallback : s32 : 1023;
    m_eResult : EResult;
    m_ulFileSize : uint64;
    m_FileSHA : [20] uint8 ;
    m_unFlags : uint32;
}

TimedTrialStatus_t :: struct {
    k_iCallback : s32 : 1030;
    m_unAppID : AppId_t;
    m_bIsOffline : bool;
    m_unSecondsAllowed : uint32;
    m_unSecondsPlayed : uint32;
}

P2PSessionRequest_t :: struct {
    k_iCallback : s32 : 1202;
    m_steamIDRemote : CSteamID;
}

P2PSessionConnectFail_t :: struct {
    k_iCallback : s32 : 1203;
    m_steamIDRemote : CSteamID;
    m_eP2PSessionError : uint8;
}

SocketStatusCallback_t :: struct {
    k_iCallback : s32 : 1201;
    m_hSocket : SNetSocket_t;
    m_hListenSocket : SNetListenSocket_t;
    m_steamIDRemote : CSteamID;
    m_eSNetSocketState : s32;
}

ScreenshotReady_t :: struct {
    k_iCallback : s32 : 2301;
    m_hLocal : ScreenshotHandle;
    m_eResult : EResult;
}

ScreenshotRequested_t :: struct {
    k_iCallback : s32 : 2302;
}

PlaybackStatusHasChanged_t :: struct {
    k_iCallback : s32 : 4001;
}

VolumeHasChanged_t :: struct {
    k_iCallback : s32 : 4002;
    m_flNewVolume : float;
}

MusicPlayerRemoteWillActivate_t :: struct {
    k_iCallback : s32 : 4101;
}

MusicPlayerRemoteWillDeactivate_t :: struct {
    k_iCallback : s32 : 4102;
}

MusicPlayerRemoteToFront_t :: struct {
    k_iCallback : s32 : 4103;
}

MusicPlayerWillQuit_t :: struct {
    k_iCallback : s32 : 4104;
}

MusicPlayerWantsPlay_t :: struct {
    k_iCallback : s32 : 4105;
}

MusicPlayerWantsPause_t :: struct {
    k_iCallback : s32 : 4106;
}

MusicPlayerWantsPlayPrevious_t :: struct {
    k_iCallback : s32 : 4107;
}

MusicPlayerWantsPlayNext_t :: struct {
    k_iCallback : s32 : 4108;
}

MusicPlayerWantsShuffled_t :: struct {
    k_iCallback : s32 : 4109;
    m_bShuffled : bool;
}

MusicPlayerWantsLooped_t :: struct {
    k_iCallback : s32 : 4110;
    m_bLooped : bool;
}

MusicPlayerWantsVolume_t :: struct {
    k_iCallback : s32 : 4011;
    m_flNewVolume : float;
}

MusicPlayerSelectsQueueEntry_t :: struct {
    k_iCallback : s32 : 4012;
    nID : s32;
}

MusicPlayerSelectsPlaylistEntry_t :: struct {
    k_iCallback : s32 : 4013;
    nID : s32;
}

MusicPlayerWantsPlayingRepeatStatus_t :: struct {
    k_iCallback : s32 : 4114;
    m_nPlayingRepeatStatus : s32;
}

HTTPRequestCompleted_t :: struct {
    k_iCallback : s32 : 2101;
    m_hRequest : HTTPRequestHandle;
    m_ulContextValue : uint64;
    m_bRequestSuccessful : bool;
    m_eStatusCode : EHTTPStatusCode;
    m_unBodySize : uint32;
}

HTTPRequestHeadersReceived_t :: struct {
    k_iCallback : s32 : 2102;
    m_hRequest : HTTPRequestHandle;
    m_ulContextValue : uint64;
}

HTTPRequestDataReceived_t :: struct {
    k_iCallback : s32 : 2103;
    m_hRequest : HTTPRequestHandle;
    m_ulContextValue : uint64;
    m_cOffset : uint32;
    m_cBytesReceived : uint32;
}

SteamUGCQueryCompleted_t :: struct {
    k_iCallback : s32 : 3401;
    m_handle : UGCQueryHandle_t;
    m_eResult : EResult;
    m_unNumResultsReturned : uint32;
    m_unTotalMatchingResults : uint32;
    m_bCachedData : bool;
    m_rgchNextCursor : [256] char ;
}

SteamUGCRequestUGCDetailsResult_t :: struct {
    k_iCallback : s32 : 3402;
    m_details : SteamUGCDetails_t;
    m_bCachedData : bool;
}

CreateItemResult_t :: struct {
    k_iCallback : s32 : 3403;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
    m_bUserNeedsToAcceptWorkshopLegalAgreement : bool;
}

SubmitItemUpdateResult_t :: struct {
    k_iCallback : s32 : 3404;
    m_eResult : EResult;
    m_bUserNeedsToAcceptWorkshopLegalAgreement : bool;
    m_nPublishedFileId : PublishedFileId_t;
}

ItemInstalled_t :: struct {
    k_iCallback : s32 : 3405;
    m_unAppID : AppId_t;
    m_nPublishedFileId : PublishedFileId_t;
}

DownloadItemResult_t :: struct {
    k_iCallback : s32 : 3406;
    m_unAppID : AppId_t;
    m_nPublishedFileId : PublishedFileId_t;
    m_eResult : EResult;
}

UserFavoriteItemsListChanged_t :: struct {
    k_iCallback : s32 : 3407;
    m_nPublishedFileId : PublishedFileId_t;
    m_eResult : EResult;
    m_bWasAddRequest : bool;
}

SetUserItemVoteResult_t :: struct {
    k_iCallback : s32 : 3408;
    m_nPublishedFileId : PublishedFileId_t;
    m_eResult : EResult;
    m_bVoteUp : bool;
}

GetUserItemVoteResult_t :: struct {
    k_iCallback : s32 : 3409;
    m_nPublishedFileId : PublishedFileId_t;
    m_eResult : EResult;
    m_bVotedUp : bool;
    m_bVotedDown : bool;
    m_bVoteSkipped : bool;
}

StartPlaytimeTrackingResult_t :: struct {
    k_iCallback : s32 : 3410;
    m_eResult : EResult;
}

StopPlaytimeTrackingResult_t :: struct {
    k_iCallback : s32 : 3411;
    m_eResult : EResult;
}

AddUGCDependencyResult_t :: struct {
    k_iCallback : s32 : 3412;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
    m_nChildPublishedFileId : PublishedFileId_t;
}

RemoveUGCDependencyResult_t :: struct {
    k_iCallback : s32 : 3413;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
    m_nChildPublishedFileId : PublishedFileId_t;
}

AddAppDependencyResult_t :: struct {
    k_iCallback : s32 : 3414;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
    m_nAppID : AppId_t;
}

RemoveAppDependencyResult_t :: struct {
    k_iCallback : s32 : 3415;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
    m_nAppID : AppId_t;
}

GetAppDependenciesResult_t :: struct {
    k_iCallback : s32 : 3416;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
    m_rgAppIDs : [32] AppId_t ;
    m_nNumAppDependencies : uint32;
    m_nTotalNumAppDependencies : uint32;
}

DeleteItemResult_t :: struct {
    k_iCallback : s32 : 3417;
    m_eResult : EResult;
    m_nPublishedFileId : PublishedFileId_t;
}

SteamAppInstalled_t :: struct {
    k_iCallback : s32 : 3901;
    m_nAppID : AppId_t;
}

SteamAppUninstalled_t :: struct {
    k_iCallback : s32 : 3902;
    m_nAppID : AppId_t;
}

HTML_BrowserReady_t :: struct {
    k_iCallback : s32 : 4501;
    unBrowserHandle : HHTMLBrowser;
}

HTML_NeedsPaint_t :: struct {
    k_iCallback : s32 : 4502;
    unBrowserHandle : HHTMLBrowser;
    pBGRA : *char ;
    unWide : uint32;
    unTall : uint32;
    unUpdateX : uint32;
    unUpdateY : uint32;
    unUpdateWide : uint32;
    unUpdateTall : uint32;
    unScrollX : uint32;
    unScrollY : uint32;
    flPageScale : float;
    unPageSerial : uint32;
}

HTML_StartRequest_t :: struct {
    k_iCallback : s32 : 4503;
    unBrowserHandle : HHTMLBrowser;
    pchURL : *char ;
    pchTarget : *char ;
    pchPostData : *char ;
    bIsRedirect : bool;
}

HTML_CloseBrowser_t :: struct {
    k_iCallback : s32 : 4504;
    unBrowserHandle : HHTMLBrowser;
}

HTML_URLChanged_t :: struct {
    k_iCallback : s32 : 4505;
    unBrowserHandle : HHTMLBrowser;
    pchURL : *char ;
    pchPostData : *char ;
    bIsRedirect : bool;
    pchPageTitle : *char ;
    bNewNavigation : bool;
}

HTML_FinishedRequest_t :: struct {
    k_iCallback : s32 : 4506;
    unBrowserHandle : HHTMLBrowser;
    pchURL : *char ;
    pchPageTitle : *char ;
}

HTML_OpenLinkInNewTab_t :: struct {
    k_iCallback : s32 : 4507;
    unBrowserHandle : HHTMLBrowser;
    pchURL : *char ;
}

HTML_ChangedTitle_t :: struct {
    k_iCallback : s32 : 4508;
    unBrowserHandle : HHTMLBrowser;
    pchTitle : *char ;
}

HTML_SearchResults_t :: struct {
    k_iCallback : s32 : 4509;
    unBrowserHandle : HHTMLBrowser;
    unResults : uint32;
    unCurrentMatch : uint32;
}

HTML_CanGoBackAndForward_t :: struct {
    k_iCallback : s32 : 4510;
    unBrowserHandle : HHTMLBrowser;
    bCanGoBack : bool;
    bCanGoForward : bool;
}

HTML_HorizontalScroll_t :: struct {
    k_iCallback : s32 : 4511;
    unBrowserHandle : HHTMLBrowser;
    unScrollMax : uint32;
    unScrollCurrent : uint32;
    flPageScale : float;
    bVisible : bool;
    unPageSize : uint32;
}

HTML_VerticalScroll_t :: struct {
    k_iCallback : s32 : 4512;
    unBrowserHandle : HHTMLBrowser;
    unScrollMax : uint32;
    unScrollCurrent : uint32;
    flPageScale : float;
    bVisible : bool;
    unPageSize : uint32;
}

HTML_LinkAtPosition_t :: struct {
    k_iCallback : s32 : 4513;
    unBrowserHandle : HHTMLBrowser;
    x : uint32;
    y : uint32;
    pchURL : *char ;
    bInput : bool;
    bLiveLink : bool;
}

HTML_JSAlert_t :: struct {
    k_iCallback : s32 : 4514;
    unBrowserHandle : HHTMLBrowser;
    pchMessage : *char ;
}

HTML_JSConfirm_t :: struct {
    k_iCallback : s32 : 4515;
    unBrowserHandle : HHTMLBrowser;
    pchMessage : *char ;
}

HTML_FileOpenDialog_t :: struct {
    k_iCallback : s32 : 4516;
    unBrowserHandle : HHTMLBrowser;
    pchTitle : *char ;
    pchInitialFile : *char ;
}

HTML_NewWindow_t :: struct {
    k_iCallback : s32 : 4521;
    unBrowserHandle : HHTMLBrowser;
    pchURL : *char ;
    unX : uint32;
    unY : uint32;
    unWide : uint32;
    unTall : uint32;
    unNewWindow_BrowserHandle_IGNORE : HHTMLBrowser;
}

HTML_SetCursor_t :: struct {
    k_iCallback : s32 : 4522;
    unBrowserHandle : HHTMLBrowser;
    eMouseCursor : uint32;
}

HTML_StatusText_t :: struct {
    k_iCallback : s32 : 4523;
    unBrowserHandle : HHTMLBrowser;
    pchMsg : *char ;
}

HTML_ShowToolTip_t :: struct {
    k_iCallback : s32 : 4524;
    unBrowserHandle : HHTMLBrowser;
    pchMsg : *char ;
}

HTML_UpdateToolTip_t :: struct {
    k_iCallback : s32 : 4525;
    unBrowserHandle : HHTMLBrowser;
    pchMsg : *char ;
}

HTML_HideToolTip_t :: struct {
    k_iCallback : s32 : 4526;
    unBrowserHandle : HHTMLBrowser;
}

HTML_BrowserRestarted_t :: struct {
    k_iCallback : s32 : 4527;
    unBrowserHandle : HHTMLBrowser;
    unOldBrowserHandle : HHTMLBrowser;
}

SteamInventoryResultReady_t :: struct {
    k_iCallback : s32 : 4700;
    m_handle : SteamInventoryResult_t;
    m_result : EResult;
}

SteamInventoryFullUpdate_t :: struct {
    k_iCallback : s32 : 4701;
    m_handle : SteamInventoryResult_t;
}

SteamInventoryDefinitionUpdate_t :: struct {
    k_iCallback : s32 : 4702;
}

SteamInventoryEligiblePromoItemDefIDs_t :: struct {
    k_iCallback : s32 : 4703;
    m_result : EResult;
    m_steamID : CSteamID;
    m_numEligiblePromoItemDefs : s32;
    m_bCachedData : bool;
}

SteamInventoryStartPurchaseResult_t :: struct {
    k_iCallback : s32 : 4704;
    m_result : EResult;
    m_ulOrderID : uint64;
    m_ulTransID : uint64;
}

SteamInventoryRequestPricesResult_t :: struct {
    k_iCallback : s32 : 4705;
    m_result : EResult;
    m_rgchCurrency : [4] char ;
}

GetVideoURLResult_t :: struct {
    k_iCallback : s32 : 4611;
    m_eResult : EResult;
    m_unVideoAppID : AppId_t;
    m_rgchURL : [256] char ;
}

GetOPFSettingsResult_t :: struct {
    k_iCallback : s32 : 4624;
    m_eResult : EResult;
    m_unVideoAppID : AppId_t;
}

SteamParentalSettingsChanged_t :: struct {
    k_iCallback : s32 : 5001;
}

SteamRemotePlaySessionConnected_t :: struct {
    k_iCallback : s32 : 5701;
    m_unSessionID : RemotePlaySessionID_t;
}

SteamRemotePlaySessionDisconnected_t :: struct {
    k_iCallback : s32 : 5702;
    m_unSessionID : RemotePlaySessionID_t;
}

SteamNetworkingMessagesSessionRequest_t :: struct {
    k_iCallback : s32 : 1251;
    m_identityRemote : SteamNetworkingIdentity;
}

SteamNetworkingMessagesSessionFailed_t :: struct {
    k_iCallback : s32 : 1252;
    m_info : SteamNetConnectionInfo_t;
}

SteamNetConnectionStatusChangedCallback_t :: struct {
    k_iCallback : s32 : 1221;
    m_hConn : HSteamNetConnection;
    m_info : SteamNetConnectionInfo_t;
    m_eOldState : ESteamNetworkingConnectionState;
}

SteamNetAuthenticationStatus_t :: struct {
    k_iCallback : s32 : 1222;
    m_eAvail : ESteamNetworkingAvailability;
    m_debugMsg : [256] char ;
}

SteamRelayNetworkStatus_t :: struct {
    k_iCallback : s32 : 1281;
    m_eAvail : ESteamNetworkingAvailability;
    m_bPingMeasurementInProgress : s32;
    m_eAvailNetworkConfig : ESteamNetworkingAvailability;
    m_eAvailAnyRelay : ESteamNetworkingAvailability;
    m_debugMsg : [256] char ;
}

GSClientApprove_t :: struct {
    k_iCallback : s32 : 201;
    m_SteamID : CSteamID;
    m_OwnerSteamID : CSteamID;
}

GSClientDeny_t :: struct {
    k_iCallback : s32 : 202;
    m_SteamID : CSteamID;
    m_eDenyReason : EDenyReason;
    m_rgchOptionalText : [128] char ;
}

GSClientKick_t :: struct {
    k_iCallback : s32 : 203;
    m_SteamID : CSteamID;
    m_eDenyReason : EDenyReason;
}

GSClientAchievementStatus_t :: struct {
    k_iCallback : s32 : 206;
    m_SteamID : uint64;
    m_pchAchievement : [128] char ;
    m_bUnlocked : bool;
}

GSPolicyResponse_t :: struct {
    k_iCallback : s32 : 115;
    m_bSecure : uint8;
}

GSGameplayStats_t :: struct {
    k_iCallback : s32 : 207;
    m_eResult : EResult;
    m_nRank : int32;
    m_unTotalConnects : uint32;
    m_unTotalMinutesPlayed : uint32;
}

GSClientGroupStatus_t :: struct {
    k_iCallback : s32 : 208;
    m_SteamIDUser : CSteamID;
    m_SteamIDGroup : CSteamID;
    m_bMember : bool;
    m_bOfficer : bool;
}

GSReputation_t :: struct {
    k_iCallback : s32 : 209;
    m_eResult : EResult;
    m_unReputationScore : uint32;
    m_bBanned : bool;
    m_unBannedIP : uint32;
    m_usBannedPort : uint16;
    m_ulBannedGameID : uint64;
    m_unBanExpires : uint32;
}

AssociateWithClanResult_t :: struct {
    k_iCallback : s32 : 210;
    m_eResult : EResult;
}

ComputeNewPlayerCompatibilityResult_t :: struct {
    k_iCallback : s32 : 211;
    m_eResult : EResult;
    m_cPlayersThatDontLikeCandidate : s32;
    m_cPlayersThatCandidateDoesntLike : s32;
    m_cClanPlayersThatDontLikeCandidate : s32;
    m_SteamIDCandidate : CSteamID;
}

GSStatsReceived_t :: struct {
    k_iCallback : s32 : 1800;
    m_eResult : EResult;
    m_steamIDUser : CSteamID;
}

GSStatsStored_t :: struct {
    k_iCallback : s32 : 1801;
    m_eResult : EResult;
    m_steamIDUser : CSteamID;
}

GSStatsUnloaded_t :: struct {
    k_iCallback : s32 : 1108;
    m_steamIDUser : CSteamID;
}

ESteamIPType :: enum s32 {
    k_ESteamIPTypeIPv4 :: 0;
    k_ESteamIPTypeIPv6 :: 1;
}

EUniverse :: enum s32 {
    k_EUniverseInvalid :: 0;
    k_EUniversePublic :: 1;
    k_EUniverseBeta :: 2;
    k_EUniverseInternal :: 3;
    k_EUniverseDev :: 4;
    k_EUniverseMax :: 5;
}

EResult :: enum s32 {
    k_EResultNone :: 0;
    k_EResultOK :: 1;
    k_EResultFail :: 2;
    k_EResultNoConnection :: 3;
    k_EResultInvalidPassword :: 5;
    k_EResultLoggedInElsewhere :: 6;
    k_EResultInvalidProtocolVer :: 7;
    k_EResultInvalidParam :: 8;
    k_EResultFileNotFound :: 9;
    k_EResultBusy :: 10;
    k_EResultInvalidState :: 11;
    k_EResultInvalidName :: 12;
    k_EResultInvalidEmail :: 13;
    k_EResultDuplicateName :: 14;
    k_EResultAccessDenied :: 15;
    k_EResultTimeout :: 16;
    k_EResultBanned :: 17;
    k_EResultAccountNotFound :: 18;
    k_EResultInvalidSteamID :: 19;
    k_EResultServiceUnavailable :: 20;
    k_EResultNotLoggedOn :: 21;
    k_EResultPending :: 22;
    k_EResultEncryptionFailure :: 23;
    k_EResultInsufficientPrivilege :: 24;
    k_EResultLimitExceeded :: 25;
    k_EResultRevoked :: 26;
    k_EResultExpired :: 27;
    k_EResultAlreadyRedeemed :: 28;
    k_EResultDuplicateRequest :: 29;
    k_EResultAlreadyOwned :: 30;
    k_EResultIPNotFound :: 31;
    k_EResultPersistFailed :: 32;
    k_EResultLockingFailed :: 33;
    k_EResultLogonSessionReplaced :: 34;
    k_EResultConnectFailed :: 35;
    k_EResultHandshakeFailed :: 36;
    k_EResultIOFailure :: 37;
    k_EResultRemoteDisconnect :: 38;
    k_EResultShoppingCartNotFound :: 39;
    k_EResultBlocked :: 40;
    k_EResultIgnored :: 41;
    k_EResultNoMatch :: 42;
    k_EResultAccountDisabled :: 43;
    k_EResultServiceReadOnly :: 44;
    k_EResultAccountNotFeatured :: 45;
    k_EResultAdministratorOK :: 46;
    k_EResultContentVersion :: 47;
    k_EResultTryAnotherCM :: 48;
    k_EResultPasswordRequiredToKickSession :: 49;
    k_EResultAlreadyLoggedInElsewhere :: 50;
    k_EResultSuspended :: 51;
    k_EResultCancelled :: 52;
    k_EResultDataCorruption :: 53;
    k_EResultDiskFull :: 54;
    k_EResultRemoteCallFailed :: 55;
    k_EResultPasswordUnset :: 56;
    k_EResultExternalAccountUnlinked :: 57;
    k_EResultPSNTicketInvalid :: 58;
    k_EResultExternalAccountAlreadyLinked :: 59;
    k_EResultRemoteFileConflict :: 60;
    k_EResultIllegalPassword :: 61;
    k_EResultSameAsPreviousValue :: 62;
    k_EResultAccountLogonDenied :: 63;
    k_EResultCannotUseOldPassword :: 64;
    k_EResultInvalidLoginAuthCode :: 65;
    k_EResultAccountLogonDeniedNoMail :: 66;
    k_EResultHardwareNotCapableOfIPT :: 67;
    k_EResultIPTInitError :: 68;
    k_EResultParentalControlRestricted :: 69;
    k_EResultFacebookQueryError :: 70;
    k_EResultExpiredLoginAuthCode :: 71;
    k_EResultIPLoginRestrictionFailed :: 72;
    k_EResultAccountLockedDown :: 73;
    k_EResultAccountLogonDeniedVerifiedEmailRequired :: 74;
    k_EResultNoMatchingURL :: 75;
    k_EResultBadResponse :: 76;
    k_EResultRequirePasswordReEntry :: 77;
    k_EResultValueOutOfRange :: 78;
    k_EResultUnexpectedError :: 79;
    k_EResultDisabled :: 80;
    k_EResultInvalidCEGSubmission :: 81;
    k_EResultRestrictedDevice :: 82;
    k_EResultRegionLocked :: 83;
    k_EResultRateLimitExceeded :: 84;
    k_EResultAccountLoginDeniedNeedTwoFactor :: 85;
    k_EResultItemDeleted :: 86;
    k_EResultAccountLoginDeniedThrottle :: 87;
    k_EResultTwoFactorCodeMismatch :: 88;
    k_EResultTwoFactorActivationCodeMismatch :: 89;
    k_EResultAccountAssociatedToMultiplePartners :: 90;
    k_EResultNotModified :: 91;
    k_EResultNoMobileDevice :: 92;
    k_EResultTimeNotSynced :: 93;
    k_EResultSmsCodeFailed :: 94;
    k_EResultAccountLimitExceeded :: 95;
    k_EResultAccountActivityLimitExceeded :: 96;
    k_EResultPhoneActivityLimitExceeded :: 97;
    k_EResultRefundToWallet :: 98;
    k_EResultEmailSendFailure :: 99;
    k_EResultNotSettled :: 100;
    k_EResultNeedCaptcha :: 101;
    k_EResultGSLTDenied :: 102;
    k_EResultGSOwnerDenied :: 103;
    k_EResultInvalidItemType :: 104;
    k_EResultIPBanned :: 105;
    k_EResultGSLTExpired :: 106;
    k_EResultInsufficientFunds :: 107;
    k_EResultTooManyPending :: 108;
    k_EResultNoSiteLicensesFound :: 109;
    k_EResultWGNetworkSendExceeded :: 110;
    k_EResultAccountNotFriends :: 111;
    k_EResultLimitedUserAccount :: 112;
    k_EResultCantRemoveItem :: 113;
    k_EResultAccountDeleted :: 114;
    k_EResultExistingUserCancelledLicense :: 115;
    k_EResultCommunityCooldown :: 116;
}

EVoiceResult :: enum s32 {
    k_EVoiceResultOK :: 0;
    k_EVoiceResultNotInitialized :: 1;
    k_EVoiceResultNotRecording :: 2;
    k_EVoiceResultNoData :: 3;
    k_EVoiceResultBufferTooSmall :: 4;
    k_EVoiceResultDataCorrupted :: 5;
    k_EVoiceResultRestricted :: 6;
    k_EVoiceResultUnsupportedCodec :: 7;
    k_EVoiceResultReceiverOutOfDate :: 8;
    k_EVoiceResultReceiverDidNotAnswer :: 9;
}

EDenyReason :: enum s32 {
    k_EDenyInvalid :: 0;
    k_EDenyInvalidVersion :: 1;
    k_EDenyGeneric :: 2;
    k_EDenyNotLoggedOn :: 3;
    k_EDenyNoLicense :: 4;
    k_EDenyCheater :: 5;
    k_EDenyLoggedInElseWhere :: 6;
    k_EDenyUnknownText :: 7;
    k_EDenyIncompatibleAnticheat :: 8;
    k_EDenyMemoryCorruption :: 9;
    k_EDenyIncompatibleSoftware :: 10;
    k_EDenySteamConnectionLost :: 11;
    k_EDenySteamConnectionError :: 12;
    k_EDenySteamResponseTimedOut :: 13;
    k_EDenySteamValidationStalled :: 14;
    k_EDenySteamOwnerLeftGuestUser :: 15;
}

EBeginAuthSessionResult :: enum s32 {
    k_EBeginAuthSessionResultOK :: 0;
    k_EBeginAuthSessionResultInvalidTicket :: 1;
    k_EBeginAuthSessionResultDuplicateRequest :: 2;
    k_EBeginAuthSessionResultInvalidVersion :: 3;
    k_EBeginAuthSessionResultGameMismatch :: 4;
    k_EBeginAuthSessionResultExpiredTicket :: 5;
}

EAuthSessionResponse :: enum s32 {
    k_EAuthSessionResponseOK :: 0;
    k_EAuthSessionResponseUserNotConnectedToSteam :: 1;
    k_EAuthSessionResponseNoLicenseOrExpired :: 2;
    k_EAuthSessionResponseVACBanned :: 3;
    k_EAuthSessionResponseLoggedInElseWhere :: 4;
    k_EAuthSessionResponseVACCheckTimedOut :: 5;
    k_EAuthSessionResponseAuthTicketCanceled :: 6;
    k_EAuthSessionResponseAuthTicketInvalidAlreadyUsed :: 7;
    k_EAuthSessionResponseAuthTicketInvalid :: 8;
    k_EAuthSessionResponsePublisherIssuedBan :: 9;
}

EUserHasLicenseForAppResult :: enum s32 {
    k_EUserHasLicenseResultHasLicense :: 0;
    k_EUserHasLicenseResultDoesNotHaveLicense :: 1;
    k_EUserHasLicenseResultNoAuth :: 2;
}

EAccountType :: enum s32 {
    k_EAccountTypeInvalid :: 0;
    k_EAccountTypeIndividual :: 1;
    k_EAccountTypeMultiseat :: 2;
    k_EAccountTypeGameServer :: 3;
    k_EAccountTypeAnonGameServer :: 4;
    k_EAccountTypePending :: 5;
    k_EAccountTypeContentServer :: 6;
    k_EAccountTypeClan :: 7;
    k_EAccountTypeChat :: 8;
    k_EAccountTypeConsoleUser :: 9;
    k_EAccountTypeAnonUser :: 10;
    k_EAccountTypeMax :: 11;
}

EAppReleaseState :: enum s32 {
    k_EAppReleaseState_Unknown :: 0;
    k_EAppReleaseState_Unavailable :: 1;
    k_EAppReleaseState_Prerelease :: 2;
    k_EAppReleaseState_PreloadOnly :: 3;
    k_EAppReleaseState_Released :: 4;
}

EAppOwnershipFlags :: enum s32 {
    k_EAppOwnershipFlags_None :: 0;
    k_EAppOwnershipFlags_OwnsLicense :: 1;
    k_EAppOwnershipFlags_FreeLicense :: 2;
    k_EAppOwnershipFlags_RegionRestricted :: 4;
    k_EAppOwnershipFlags_LowViolence :: 8;
    k_EAppOwnershipFlags_InvalidPlatform :: 16;
    k_EAppOwnershipFlags_SharedLicense :: 32;
    k_EAppOwnershipFlags_FreeWeekend :: 64;
    k_EAppOwnershipFlags_RetailLicense :: 128;
    k_EAppOwnershipFlags_LicenseLocked :: 256;
    k_EAppOwnershipFlags_LicensePending :: 512;
    k_EAppOwnershipFlags_LicenseExpired :: 1024;
    k_EAppOwnershipFlags_LicensePermanent :: 2048;
    k_EAppOwnershipFlags_LicenseRecurring :: 4096;
    k_EAppOwnershipFlags_LicenseCanceled :: 8192;
    k_EAppOwnershipFlags_AutoGrant :: 16384;
    k_EAppOwnershipFlags_PendingGift :: 32768;
    k_EAppOwnershipFlags_RentalNotActivated :: 65536;
    k_EAppOwnershipFlags_Rental :: 131072;
    k_EAppOwnershipFlags_SiteLicense :: 262144;
    k_EAppOwnershipFlags_LegacyFreeSub :: 524288;
    k_EAppOwnershipFlags_InvalidOSType :: 1048576;
    k_EAppOwnershipFlags_TimedTrial :: 2097152;
}

EAppType :: enum s32 {
    k_EAppType_Invalid :: 0;
    k_EAppType_Game :: 1;
    k_EAppType_Application :: 2;
    k_EAppType_Tool :: 4;
    k_EAppType_Demo :: 8;
    k_EAppType_Media_DEPRECATED :: 16;
    k_EAppType_DLC :: 32;
    k_EAppType_Guide :: 64;
    k_EAppType_Driver :: 128;
    k_EAppType_Config :: 256;
    k_EAppType_Hardware :: 512;
    k_EAppType_Franchise :: 1024;
    k_EAppType_Video :: 2048;
    k_EAppType_Plugin :: 4096;
    k_EAppType_MusicAlbum :: 8192;
    k_EAppType_Series :: 16384;
    k_EAppType_Comic_UNUSED :: 32768;
    k_EAppType_Beta :: 65536;
    k_EAppType_Shortcut :: 1073741824;
    k_EAppType_DepotOnly :: -2147483648;
}

ESteamUserStatType :: enum s32 {
    k_ESteamUserStatTypeINVALID :: 0;
    k_ESteamUserStatTypeINT :: 1;
    k_ESteamUserStatTypeFLOAT :: 2;
    k_ESteamUserStatTypeAVGRATE :: 3;
    k_ESteamUserStatTypeACHIEVEMENTS :: 4;
    k_ESteamUserStatTypeGROUPACHIEVEMENTS :: 5;
    k_ESteamUserStatTypeMAX :: 6;
}

EChatEntryType :: enum s32 {
    k_EChatEntryTypeInvalid :: 0;
    k_EChatEntryTypeChatMsg :: 1;
    k_EChatEntryTypeTyping :: 2;
    k_EChatEntryTypeInviteGame :: 3;
    k_EChatEntryTypeEmote :: 4;
    k_EChatEntryTypeLeftConversation :: 6;
    k_EChatEntryTypeEntered :: 7;
    k_EChatEntryTypeWasKicked :: 8;
    k_EChatEntryTypeWasBanned :: 9;
    k_EChatEntryTypeDisconnected :: 10;
    k_EChatEntryTypeHistoricalChat :: 11;
    k_EChatEntryTypeLinkBlocked :: 14;
}

EChatRoomEnterResponse :: enum s32 {
    k_EChatRoomEnterResponseSuccess :: 1;
    k_EChatRoomEnterResponseDoesntExist :: 2;
    k_EChatRoomEnterResponseNotAllowed :: 3;
    k_EChatRoomEnterResponseFull :: 4;
    k_EChatRoomEnterResponseError :: 5;
    k_EChatRoomEnterResponseBanned :: 6;
    k_EChatRoomEnterResponseLimited :: 7;
    k_EChatRoomEnterResponseClanDisabled :: 8;
    k_EChatRoomEnterResponseCommunityBan :: 9;
    k_EChatRoomEnterResponseMemberBlockedYou :: 10;
    k_EChatRoomEnterResponseYouBlockedMember :: 11;
    k_EChatRoomEnterResponseRatelimitExceeded :: 15;
}

EChatSteamIDInstanceFlags :: enum s32 {
    k_EChatAccountInstanceMask :: 4095;
    k_EChatInstanceFlagClan :: 524288;
    k_EChatInstanceFlagLobby :: 262144;
    k_EChatInstanceFlagMMSLobby :: 131072;
}

EMarketingMessageFlags :: enum s32 {
    k_EMarketingMessageFlagsNone :: 0;
    k_EMarketingMessageFlagsHighPriority :: 1;
    k_EMarketingMessageFlagsPlatformWindows :: 2;
    k_EMarketingMessageFlagsPlatformMac :: 4;
    k_EMarketingMessageFlagsPlatformLinux :: 8;
    k_EMarketingMessageFlagsPlatformRestrictions :: 14;
}

ENotificationPosition :: enum s32 {
    k_EPositionTopLeft :: 0;
    k_EPositionTopRight :: 1;
    k_EPositionBottomLeft :: 2;
    k_EPositionBottomRight :: 3;
}

EBroadcastUploadResult :: enum s32 {
    k_EBroadcastUploadResultNone :: 0;
    k_EBroadcastUploadResultOK :: 1;
    k_EBroadcastUploadResultInitFailed :: 2;
    k_EBroadcastUploadResultFrameFailed :: 3;
    k_EBroadcastUploadResultTimeout :: 4;
    k_EBroadcastUploadResultBandwidthExceeded :: 5;
    k_EBroadcastUploadResultLowFPS :: 6;
    k_EBroadcastUploadResultMissingKeyFrames :: 7;
    k_EBroadcastUploadResultNoConnection :: 8;
    k_EBroadcastUploadResultRelayFailed :: 9;
    k_EBroadcastUploadResultSettingsChanged :: 10;
    k_EBroadcastUploadResultMissingAudio :: 11;
    k_EBroadcastUploadResultTooFarBehind :: 12;
    k_EBroadcastUploadResultTranscodeBehind :: 13;
    k_EBroadcastUploadResultNotAllowedToPlay :: 14;
    k_EBroadcastUploadResultBusy :: 15;
    k_EBroadcastUploadResultBanned :: 16;
    k_EBroadcastUploadResultAlreadyActive :: 17;
    k_EBroadcastUploadResultForcedOff :: 18;
    k_EBroadcastUploadResultAudioBehind :: 19;
    k_EBroadcastUploadResultShutdown :: 20;
    k_EBroadcastUploadResultDisconnect :: 21;
    k_EBroadcastUploadResultVideoInitFailed :: 22;
    k_EBroadcastUploadResultAudioInitFailed :: 23;
}

ELaunchOptionType :: enum s32 {
    k_ELaunchOptionType_None :: 0;
    k_ELaunchOptionType_Default :: 1;
    k_ELaunchOptionType_SafeMode :: 2;
    k_ELaunchOptionType_Multiplayer :: 3;
    k_ELaunchOptionType_Config :: 4;
    k_ELaunchOptionType_OpenVR :: 5;
    k_ELaunchOptionType_Server :: 6;
    k_ELaunchOptionType_Editor :: 7;
    k_ELaunchOptionType_Manual :: 8;
    k_ELaunchOptionType_Benchmark :: 9;
    k_ELaunchOptionType_Option1 :: 10;
    k_ELaunchOptionType_Option2 :: 11;
    k_ELaunchOptionType_Option3 :: 12;
    k_ELaunchOptionType_OculusVR :: 13;
    k_ELaunchOptionType_OpenVROverlay :: 14;
    k_ELaunchOptionType_OSVR :: 15;
    k_ELaunchOptionType_Dialog :: 1000;
}

EVRHMDType :: enum s32 {
    k_eEVRHMDType_None :: -1;
    k_eEVRHMDType_Unknown :: 0;
    k_eEVRHMDType_HTC_Dev :: 1;
    k_eEVRHMDType_HTC_VivePre :: 2;
    k_eEVRHMDType_HTC_Vive :: 3;
    k_eEVRHMDType_HTC_VivePro :: 4;
    k_eEVRHMDType_HTC_ViveCosmos :: 5;
    k_eEVRHMDType_HTC_Unknown :: 20;
    k_eEVRHMDType_Oculus_DK1 :: 21;
    k_eEVRHMDType_Oculus_DK2 :: 22;
    k_eEVRHMDType_Oculus_Rift :: 23;
    k_eEVRHMDType_Oculus_RiftS :: 24;
    k_eEVRHMDType_Oculus_Quest :: 25;
    k_eEVRHMDType_Oculus_Unknown :: 40;
    k_eEVRHMDType_Acer_Unknown :: 50;
    k_eEVRHMDType_Acer_WindowsMR :: 51;
    k_eEVRHMDType_Dell_Unknown :: 60;
    k_eEVRHMDType_Dell_Visor :: 61;
    k_eEVRHMDType_Lenovo_Unknown :: 70;
    k_eEVRHMDType_Lenovo_Explorer :: 71;
    k_eEVRHMDType_HP_Unknown :: 80;
    k_eEVRHMDType_HP_WindowsMR :: 81;
    k_eEVRHMDType_HP_Reverb :: 82;
    k_eEVRHMDType_Samsung_Unknown :: 90;
    k_eEVRHMDType_Samsung_Odyssey :: 91;
    k_eEVRHMDType_Unannounced_Unknown :: 100;
    k_eEVRHMDType_Unannounced_WindowsMR :: 101;
    k_eEVRHMDType_vridge :: 110;
    k_eEVRHMDType_Huawei_Unknown :: 120;
    k_eEVRHMDType_Huawei_VR2 :: 121;
    k_eEVRHMDType_Huawei_EndOfRange :: 129;
    k_eEVRHmdType_Valve_Unknown :: 130;
    k_eEVRHmdType_Valve_Index :: 131;
}

EMarketNotAllowedReasonFlags :: enum s32 {
    k_EMarketNotAllowedReason_None :: 0;
    k_EMarketNotAllowedReason_TemporaryFailure :: 1;
    k_EMarketNotAllowedReason_AccountDisabled :: 2;
    k_EMarketNotAllowedReason_AccountLockedDown :: 4;
    k_EMarketNotAllowedReason_AccountLimited :: 8;
    k_EMarketNotAllowedReason_TradeBanned :: 16;
    k_EMarketNotAllowedReason_AccountNotTrusted :: 32;
    k_EMarketNotAllowedReason_SteamGuardNotEnabled :: 64;
    k_EMarketNotAllowedReason_SteamGuardOnlyRecentlyEnabled :: 128;
    k_EMarketNotAllowedReason_RecentPasswordReset :: 256;
    k_EMarketNotAllowedReason_NewPaymentMethod :: 512;
    k_EMarketNotAllowedReason_InvalidCookie :: 1024;
    k_EMarketNotAllowedReason_UsingNewDevice :: 2048;
    k_EMarketNotAllowedReason_RecentSelfRefund :: 4096;
    k_EMarketNotAllowedReason_NewPaymentMethodCannotBeVerified :: 8192;
    k_EMarketNotAllowedReason_NoRecentPurchases :: 16384;
    k_EMarketNotAllowedReason_AcceptedWalletGift :: 32768;
}

EDurationControlProgress :: enum s32 {
    k_EDurationControlProgress_Full :: 0;
    k_EDurationControlProgress_Half :: 1;
    k_EDurationControlProgress_None :: 2;
    k_EDurationControl_ExitSoon_3h :: 3;
    k_EDurationControl_ExitSoon_5h :: 4;
    k_EDurationControl_ExitSoon_Night :: 5;
}

EDurationControlNotification :: enum s32 {
    k_EDurationControlNotification_None :: 0;
    k_EDurationControlNotification_1Hour :: 1;
    k_EDurationControlNotification_3Hours :: 2;
    k_EDurationControlNotification_HalfProgress :: 3;
    k_EDurationControlNotification_NoProgress :: 4;
    k_EDurationControlNotification_ExitSoon_3h :: 5;
    k_EDurationControlNotification_ExitSoon_5h :: 6;
    k_EDurationControlNotification_ExitSoon_Night :: 7;
}

EDurationControlOnlineState :: enum s32 {
    k_EDurationControlOnlineState_Invalid :: 0;
    k_EDurationControlOnlineState_Offline :: 1;
    k_EDurationControlOnlineState_Online :: 2;
    k_EDurationControlOnlineState_OnlineHighPri :: 3;
}

EGameSearchErrorCode_t :: enum s32 {
    k_EGameSearchErrorCode_OK :: 1;
    k_EGameSearchErrorCode_Failed_Search_Already_In_Progress :: 2;
    k_EGameSearchErrorCode_Failed_No_Search_In_Progress :: 3;
    k_EGameSearchErrorCode_Failed_Not_Lobby_Leader :: 4;
    k_EGameSearchErrorCode_Failed_No_Host_Available :: 5;
    k_EGameSearchErrorCode_Failed_Search_Params_Invalid :: 6;
    k_EGameSearchErrorCode_Failed_Offline :: 7;
    k_EGameSearchErrorCode_Failed_NotAuthorized :: 8;
    k_EGameSearchErrorCode_Failed_Unknown_Error :: 9;
}

EPlayerResult_t :: enum s32 {
    k_EPlayerResultFailedToConnect :: 1;
    k_EPlayerResultAbandoned :: 2;
    k_EPlayerResultKicked :: 3;
    k_EPlayerResultIncomplete :: 4;
    k_EPlayerResultCompleted :: 5;
}

ESteamIPv6ConnectivityProtocol :: enum s32 {
    k_ESteamIPv6ConnectivityProtocol_Invalid :: 0;
    k_ESteamIPv6ConnectivityProtocol_HTTP :: 1;
    k_ESteamIPv6ConnectivityProtocol_UDP :: 2;
}

ESteamIPv6ConnectivityState :: enum s32 {
    k_ESteamIPv6ConnectivityState_Unknown :: 0;
    k_ESteamIPv6ConnectivityState_Good :: 1;
    k_ESteamIPv6ConnectivityState_Bad :: 2;
}

EFriendRelationship :: enum s32 {
    k_EFriendRelationshipNone :: 0;
    k_EFriendRelationshipBlocked :: 1;
    k_EFriendRelationshipRequestRecipient :: 2;
    k_EFriendRelationshipFriend :: 3;
    k_EFriendRelationshipRequestInitiator :: 4;
    k_EFriendRelationshipIgnored :: 5;
    k_EFriendRelationshipIgnoredFriend :: 6;
    k_EFriendRelationshipSuggested_DEPRECATED :: 7;
    k_EFriendRelationshipMax :: 8;
}

EPersonaState :: enum s32 {
    k_EPersonaStateOffline :: 0;
    k_EPersonaStateOnline :: 1;
    k_EPersonaStateBusy :: 2;
    k_EPersonaStateAway :: 3;
    k_EPersonaStateSnooze :: 4;
    k_EPersonaStateLookingToTrade :: 5;
    k_EPersonaStateLookingToPlay :: 6;
    k_EPersonaStateInvisible :: 7;
    k_EPersonaStateMax :: 8;
}

EFriendFlags :: enum s32 {
    k_EFriendFlagNone :: 0;
    k_EFriendFlagBlocked :: 1;
    k_EFriendFlagFriendshipRequested :: 2;
    k_EFriendFlagImmediate :: 4;
    k_EFriendFlagClanMember :: 8;
    k_EFriendFlagOnGameServer :: 16;
    k_EFriendFlagRequestingFriendship :: 128;
    k_EFriendFlagRequestingInfo :: 256;
    k_EFriendFlagIgnored :: 512;
    k_EFriendFlagIgnoredFriend :: 1024;
    k_EFriendFlagChatMember :: 4096;
    k_EFriendFlagAll :: 65535;
}

EUserRestriction :: enum s32 {
    k_nUserRestrictionNone :: 0;
    k_nUserRestrictionUnknown :: 1;
    k_nUserRestrictionAnyChat :: 2;
    k_nUserRestrictionVoiceChat :: 4;
    k_nUserRestrictionGroupChat :: 8;
    k_nUserRestrictionRating :: 16;
    k_nUserRestrictionGameInvites :: 32;
    k_nUserRestrictionTrading :: 64;
}

EOverlayToStoreFlag :: enum s32 {
    k_EOverlayToStoreFlag_None :: 0;
    k_EOverlayToStoreFlag_AddToCart :: 1;
    k_EOverlayToStoreFlag_AddToCartAndShow :: 2;
}

EActivateGameOverlayToWebPageMode :: enum s32 {
    k_EActivateGameOverlayToWebPageMode_Default :: 0;
    k_EActivateGameOverlayToWebPageMode_Modal :: 1;
}

EPersonaChange :: enum s32 {
    k_EPersonaChangeName :: 1;
    k_EPersonaChangeStatus :: 2;
    k_EPersonaChangeComeOnline :: 4;
    k_EPersonaChangeGoneOffline :: 8;
    k_EPersonaChangeGamePlayed :: 16;
    k_EPersonaChangeGameServer :: 32;
    k_EPersonaChangeAvatar :: 64;
    k_EPersonaChangeJoinedSource :: 128;
    k_EPersonaChangeLeftSource :: 256;
    k_EPersonaChangeRelationshipChanged :: 512;
    k_EPersonaChangeNameFirstSet :: 1024;
    k_EPersonaChangeBroadcast :: 2048;
    k_EPersonaChangeNickname :: 4096;
    k_EPersonaChangeSteamLevel :: 8192;
    k_EPersonaChangeRichPresence :: 16384;
}

ESteamAPICallFailure :: enum s32 {
    k_ESteamAPICallFailureNone :: -1;
    k_ESteamAPICallFailureSteamGone :: 0;
    k_ESteamAPICallFailureNetworkFailure :: 1;
    k_ESteamAPICallFailureInvalidHandle :: 2;
    k_ESteamAPICallFailureMismatchedCallback :: 3;
}

EGamepadTextInputMode :: enum s32 {
    k_EGamepadTextInputModeNormal :: 0;
    k_EGamepadTextInputModePassword :: 1;
}

EGamepadTextInputLineMode :: enum s32 {
    k_EGamepadTextInputLineModeSingleLine :: 0;
    k_EGamepadTextInputLineModeMultipleLines :: 1;
}

ETextFilteringContext :: enum s32 {
    k_ETextFilteringContextUnknown :: 0;
    k_ETextFilteringContextGameContent :: 1;
    k_ETextFilteringContextChat :: 2;
    k_ETextFilteringContextName :: 3;
}

ECheckFileSignature :: enum s32 {
    k_ECheckFileSignatureInvalidSignature :: 0;
    k_ECheckFileSignatureValidSignature :: 1;
    k_ECheckFileSignatureFileNotFound :: 2;
    k_ECheckFileSignatureNoSignaturesFoundForThisApp :: 3;
    k_ECheckFileSignatureNoSignaturesFoundForThisFile :: 4;
}

EMatchMakingServerResponse :: enum s32 {
    eServerResponded :: 0;
    eServerFailedToRespond :: 1;
    eNoServersListedOnMasterServer :: 2;
}

ELobbyType :: enum s32 {
    k_ELobbyTypePrivate :: 0;
    k_ELobbyTypeFriendsOnly :: 1;
    k_ELobbyTypePublic :: 2;
    k_ELobbyTypeInvisible :: 3;
    k_ELobbyTypePrivateUnique :: 4;
}

ELobbyComparison :: enum s32 {
    k_ELobbyComparisonEqualToOrLessThan :: -2;
    k_ELobbyComparisonLessThan :: -1;
    k_ELobbyComparisonEqual :: 0;
    k_ELobbyComparisonGreaterThan :: 1;
    k_ELobbyComparisonEqualToOrGreaterThan :: 2;
    k_ELobbyComparisonNotEqual :: 3;
}

ELobbyDistanceFilter :: enum s32 {
    k_ELobbyDistanceFilterClose :: 0;
    k_ELobbyDistanceFilterDefault :: 1;
    k_ELobbyDistanceFilterFar :: 2;
    k_ELobbyDistanceFilterWorldwide :: 3;
}

EChatMemberStateChange :: enum s32 {
    k_EChatMemberStateChangeEntered :: 1;
    k_EChatMemberStateChangeLeft :: 2;
    k_EChatMemberStateChangeDisconnected :: 4;
    k_EChatMemberStateChangeKicked :: 8;
    k_EChatMemberStateChangeBanned :: 16;
}

ESteamPartyBeaconLocationType :: enum s32 {
    k_ESteamPartyBeaconLocationType_Invalid :: 0;
    k_ESteamPartyBeaconLocationType_ChatGroup :: 1;
    k_ESteamPartyBeaconLocationType_Max :: 2;
}

ESteamPartyBeaconLocationData :: enum s32 {
    k_ESteamPartyBeaconLocationDataInvalid :: 0;
    k_ESteamPartyBeaconLocationDataName :: 1;
    k_ESteamPartyBeaconLocationDataIconURLSmall :: 2;
    k_ESteamPartyBeaconLocationDataIconURLMedium :: 3;
    k_ESteamPartyBeaconLocationDataIconURLLarge :: 4;
}

ERemoteStoragePlatform :: enum s32 {
    k_ERemoteStoragePlatformNone :: 0;
    k_ERemoteStoragePlatformWindows :: 1;
    k_ERemoteStoragePlatformOSX :: 2;
    k_ERemoteStoragePlatformPS3 :: 4;
    k_ERemoteStoragePlatformLinux :: 8;
    k_ERemoteStoragePlatformSwitch :: 16;
    k_ERemoteStoragePlatformAndroid :: 32;
    k_ERemoteStoragePlatformIOS :: 64;
    k_ERemoteStoragePlatformAll :: -1;
}

ERemoteStoragePublishedFileVisibility :: enum s32 {
    k_ERemoteStoragePublishedFileVisibilityPublic :: 0;
    k_ERemoteStoragePublishedFileVisibilityFriendsOnly :: 1;
    k_ERemoteStoragePublishedFileVisibilityPrivate :: 2;
    k_ERemoteStoragePublishedFileVisibilityUnlisted :: 3;
}

EWorkshopFileType :: enum s32 {
    k_EWorkshopFileTypeFirst :: 0;
    k_EWorkshopFileTypeCommunity :: 0;
    k_EWorkshopFileTypeMicrotransaction :: 1;
    k_EWorkshopFileTypeCollection :: 2;
    k_EWorkshopFileTypeArt :: 3;
    k_EWorkshopFileTypeVideo :: 4;
    k_EWorkshopFileTypeScreenshot :: 5;
    k_EWorkshopFileTypeGame :: 6;
    k_EWorkshopFileTypeSoftware :: 7;
    k_EWorkshopFileTypeConcept :: 8;
    k_EWorkshopFileTypeWebGuide :: 9;
    k_EWorkshopFileTypeIntegratedGuide :: 10;
    k_EWorkshopFileTypeMerch :: 11;
    k_EWorkshopFileTypeControllerBinding :: 12;
    k_EWorkshopFileTypeSteamworksAccessInvite :: 13;
    k_EWorkshopFileTypeSteamVideo :: 14;
    k_EWorkshopFileTypeGameManagedItem :: 15;
    k_EWorkshopFileTypeMax :: 16;
}

EWorkshopVote :: enum s32 {
    k_EWorkshopVoteUnvoted :: 0;
    k_EWorkshopVoteFor :: 1;
    k_EWorkshopVoteAgainst :: 2;
    k_EWorkshopVoteLater :: 3;
}

EWorkshopFileAction :: enum s32 {
    k_EWorkshopFileActionPlayed :: 0;
    k_EWorkshopFileActionCompleted :: 1;
}

EWorkshopEnumerationType :: enum s32 {
    k_EWorkshopEnumerationTypeRankedByVote :: 0;
    k_EWorkshopEnumerationTypeRecent :: 1;
    k_EWorkshopEnumerationTypeTrending :: 2;
    k_EWorkshopEnumerationTypeFavoritesOfFriends :: 3;
    k_EWorkshopEnumerationTypeVotedByFriends :: 4;
    k_EWorkshopEnumerationTypeContentByFriends :: 5;
    k_EWorkshopEnumerationTypeRecentFromFollowedUsers :: 6;
}

EWorkshopVideoProvider :: enum s32 {
    k_EWorkshopVideoProviderNone :: 0;
    k_EWorkshopVideoProviderYoutube :: 1;
}

EUGCReadAction :: enum s32 {
    k_EUGCRead_ContinueReadingUntilFinished :: 0;
    k_EUGCRead_ContinueReading :: 1;
    k_EUGCRead_Close :: 2;
}

ELeaderboardDataRequest :: enum s32 {
    k_ELeaderboardDataRequestGlobal :: 0;
    k_ELeaderboardDataRequestGlobalAroundUser :: 1;
    k_ELeaderboardDataRequestFriends :: 2;
    k_ELeaderboardDataRequestUsers :: 3;
}

ELeaderboardSortMethod :: enum s32 {
    k_ELeaderboardSortMethodNone :: 0;
    k_ELeaderboardSortMethodAscending :: 1;
    k_ELeaderboardSortMethodDescending :: 2;
}

ELeaderboardDisplayType :: enum s32 {
    k_ELeaderboardDisplayTypeNone :: 0;
    k_ELeaderboardDisplayTypeNumeric :: 1;
    k_ELeaderboardDisplayTypeTimeSeconds :: 2;
    k_ELeaderboardDisplayTypeTimeMilliSeconds :: 3;
}

ELeaderboardUploadScoreMethod :: enum s32 {
    k_ELeaderboardUploadScoreMethodNone :: 0;
    k_ELeaderboardUploadScoreMethodKeepBest :: 1;
    k_ELeaderboardUploadScoreMethodForceUpdate :: 2;
}

ERegisterActivationCodeResult :: enum s32 {
    k_ERegisterActivationCodeResultOK :: 0;
    k_ERegisterActivationCodeResultFail :: 1;
    k_ERegisterActivationCodeResultAlreadyRegistered :: 2;
    k_ERegisterActivationCodeResultTimeout :: 3;
    k_ERegisterActivationCodeAlreadyOwned :: 4;
}

EP2PSessionError :: enum s32 {
    k_EP2PSessionErrorNone :: 0;
    k_EP2PSessionErrorNotRunningApp :: 1;
    k_EP2PSessionErrorNoRightsToApp :: 2;
    k_EP2PSessionErrorDestinationNotLoggedIn :: 3;
    k_EP2PSessionErrorTimeout :: 4;
    k_EP2PSessionErrorMax :: 5;
}

EP2PSend :: enum s32 {
    k_EP2PSendUnreliable :: 0;
    k_EP2PSendUnreliableNoDelay :: 1;
    k_EP2PSendReliable :: 2;
    k_EP2PSendReliableWithBuffering :: 3;
}

ESNetSocketState :: enum s32 {
    k_ESNetSocketStateInvalid :: 0;
    k_ESNetSocketStateConnected :: 1;
    k_ESNetSocketStateInitiated :: 10;
    k_ESNetSocketStateLocalCandidatesFound :: 11;
    k_ESNetSocketStateReceivedRemoteCandidates :: 12;
    k_ESNetSocketStateChallengeHandshake :: 15;
    k_ESNetSocketStateDisconnecting :: 21;
    k_ESNetSocketStateLocalDisconnect :: 22;
    k_ESNetSocketStateTimeoutDuringConnect :: 23;
    k_ESNetSocketStateRemoteEndDisconnected :: 24;
    k_ESNetSocketStateConnectionBroken :: 25;
}

ESNetSocketConnectionType :: enum s32 {
    k_ESNetSocketConnectionTypeNotConnected :: 0;
    k_ESNetSocketConnectionTypeUDP :: 1;
    k_ESNetSocketConnectionTypeUDPRelay :: 2;
}

EVRScreenshotType :: enum s32 {
    k_EVRScreenshotType_None :: 0;
    k_EVRScreenshotType_Mono :: 1;
    k_EVRScreenshotType_Stereo :: 2;
    k_EVRScreenshotType_MonoCubemap :: 3;
    k_EVRScreenshotType_MonoPanorama :: 4;
    k_EVRScreenshotType_StereoPanorama :: 5;
}

AudioPlayback_Status :: enum s32 {
    AudioPlayback_Undefined :: 0;
    AudioPlayback_Playing :: 1;
    AudioPlayback_Paused :: 2;
    AudioPlayback_Idle :: 3;
}

EHTTPMethod :: enum s32 {
    k_EHTTPMethodInvalid :: 0;
    k_EHTTPMethodGET :: 1;
    k_EHTTPMethodHEAD :: 2;
    k_EHTTPMethodPOST :: 3;
    k_EHTTPMethodPUT :: 4;
    k_EHTTPMethodDELETE :: 5;
    k_EHTTPMethodOPTIONS :: 6;
    k_EHTTPMethodPATCH :: 7;
}

EHTTPStatusCode :: enum s32 {
    k_EHTTPStatusCodeInvalid :: 0;
    k_EHTTPStatusCode100Continue :: 100;
    k_EHTTPStatusCode101SwitchingProtocols :: 101;
    k_EHTTPStatusCode200OK :: 200;
    k_EHTTPStatusCode201Created :: 201;
    k_EHTTPStatusCode202Accepted :: 202;
    k_EHTTPStatusCode203NonAuthoritative :: 203;
    k_EHTTPStatusCode204NoContent :: 204;
    k_EHTTPStatusCode205ResetContent :: 205;
    k_EHTTPStatusCode206PartialContent :: 206;
    k_EHTTPStatusCode300MultipleChoices :: 300;
    k_EHTTPStatusCode301MovedPermanently :: 301;
    k_EHTTPStatusCode302Found :: 302;
    k_EHTTPStatusCode303SeeOther :: 303;
    k_EHTTPStatusCode304NotModified :: 304;
    k_EHTTPStatusCode305UseProxy :: 305;
    k_EHTTPStatusCode307TemporaryRedirect :: 307;
    k_EHTTPStatusCode400BadRequest :: 400;
    k_EHTTPStatusCode401Unauthorized :: 401;
    k_EHTTPStatusCode402PaymentRequired :: 402;
    k_EHTTPStatusCode403Forbidden :: 403;
    k_EHTTPStatusCode404NotFound :: 404;
    k_EHTTPStatusCode405MethodNotAllowed :: 405;
    k_EHTTPStatusCode406NotAcceptable :: 406;
    k_EHTTPStatusCode407ProxyAuthRequired :: 407;
    k_EHTTPStatusCode408RequestTimeout :: 408;
    k_EHTTPStatusCode409Conflict :: 409;
    k_EHTTPStatusCode410Gone :: 410;
    k_EHTTPStatusCode411LengthRequired :: 411;
    k_EHTTPStatusCode412PreconditionFailed :: 412;
    k_EHTTPStatusCode413RequestEntityTooLarge :: 413;
    k_EHTTPStatusCode414RequestURITooLong :: 414;
    k_EHTTPStatusCode415UnsupportedMediaType :: 415;
    k_EHTTPStatusCode416RequestedRangeNotSatisfiable :: 416;
    k_EHTTPStatusCode417ExpectationFailed :: 417;
    k_EHTTPStatusCode4xxUnknown :: 418;
    k_EHTTPStatusCode429TooManyRequests :: 429;
    k_EHTTPStatusCode444ConnectionClosed :: 444;
    k_EHTTPStatusCode500InternalServerError :: 500;
    k_EHTTPStatusCode501NotImplemented :: 501;
    k_EHTTPStatusCode502BadGateway :: 502;
    k_EHTTPStatusCode503ServiceUnavailable :: 503;
    k_EHTTPStatusCode504GatewayTimeout :: 504;
    k_EHTTPStatusCode505HTTPVersionNotSupported :: 505;
    k_EHTTPStatusCode5xxUnknown :: 599;
}

EInputSourceMode :: enum s32 {
    k_EInputSourceMode_None :: 0;
    k_EInputSourceMode_Dpad :: 1;
    k_EInputSourceMode_Buttons :: 2;
    k_EInputSourceMode_FourButtons :: 3;
    k_EInputSourceMode_AbsoluteMouse :: 4;
    k_EInputSourceMode_RelativeMouse :: 5;
    k_EInputSourceMode_JoystickMove :: 6;
    k_EInputSourceMode_JoystickMouse :: 7;
    k_EInputSourceMode_JoystickCamera :: 8;
    k_EInputSourceMode_ScrollWheel :: 9;
    k_EInputSourceMode_Trigger :: 10;
    k_EInputSourceMode_TouchMenu :: 11;
    k_EInputSourceMode_MouseJoystick :: 12;
    k_EInputSourceMode_MouseRegion :: 13;
    k_EInputSourceMode_RadialMenu :: 14;
    k_EInputSourceMode_SingleButton :: 15;
    k_EInputSourceMode_Switches :: 16;
}

EInputActionOrigin :: enum s32 {
    k_EInputActionOrigin_None :: 0;
    k_EInputActionOrigin_SteamController_A :: 1;
    k_EInputActionOrigin_SteamController_B :: 2;
    k_EInputActionOrigin_SteamController_X :: 3;
    k_EInputActionOrigin_SteamController_Y :: 4;
    k_EInputActionOrigin_SteamController_LeftBumper :: 5;
    k_EInputActionOrigin_SteamController_RightBumper :: 6;
    k_EInputActionOrigin_SteamController_LeftGrip :: 7;
    k_EInputActionOrigin_SteamController_RightGrip :: 8;
    k_EInputActionOrigin_SteamController_Start :: 9;
    k_EInputActionOrigin_SteamController_Back :: 10;
    k_EInputActionOrigin_SteamController_LeftPad_Touch :: 11;
    k_EInputActionOrigin_SteamController_LeftPad_Swipe :: 12;
    k_EInputActionOrigin_SteamController_LeftPad_Click :: 13;
    k_EInputActionOrigin_SteamController_LeftPad_DPadNorth :: 14;
    k_EInputActionOrigin_SteamController_LeftPad_DPadSouth :: 15;
    k_EInputActionOrigin_SteamController_LeftPad_DPadWest :: 16;
    k_EInputActionOrigin_SteamController_LeftPad_DPadEast :: 17;
    k_EInputActionOrigin_SteamController_RightPad_Touch :: 18;
    k_EInputActionOrigin_SteamController_RightPad_Swipe :: 19;
    k_EInputActionOrigin_SteamController_RightPad_Click :: 20;
    k_EInputActionOrigin_SteamController_RightPad_DPadNorth :: 21;
    k_EInputActionOrigin_SteamController_RightPad_DPadSouth :: 22;
    k_EInputActionOrigin_SteamController_RightPad_DPadWest :: 23;
    k_EInputActionOrigin_SteamController_RightPad_DPadEast :: 24;
    k_EInputActionOrigin_SteamController_LeftTrigger_Pull :: 25;
    k_EInputActionOrigin_SteamController_LeftTrigger_Click :: 26;
    k_EInputActionOrigin_SteamController_RightTrigger_Pull :: 27;
    k_EInputActionOrigin_SteamController_RightTrigger_Click :: 28;
    k_EInputActionOrigin_SteamController_LeftStick_Move :: 29;
    k_EInputActionOrigin_SteamController_LeftStick_Click :: 30;
    k_EInputActionOrigin_SteamController_LeftStick_DPadNorth :: 31;
    k_EInputActionOrigin_SteamController_LeftStick_DPadSouth :: 32;
    k_EInputActionOrigin_SteamController_LeftStick_DPadWest :: 33;
    k_EInputActionOrigin_SteamController_LeftStick_DPadEast :: 34;
    k_EInputActionOrigin_SteamController_Gyro_Move :: 35;
    k_EInputActionOrigin_SteamController_Gyro_Pitch :: 36;
    k_EInputActionOrigin_SteamController_Gyro_Yaw :: 37;
    k_EInputActionOrigin_SteamController_Gyro_Roll :: 38;
    k_EInputActionOrigin_SteamController_Reserved0 :: 39;
    k_EInputActionOrigin_SteamController_Reserved1 :: 40;
    k_EInputActionOrigin_SteamController_Reserved2 :: 41;
    k_EInputActionOrigin_SteamController_Reserved3 :: 42;
    k_EInputActionOrigin_SteamController_Reserved4 :: 43;
    k_EInputActionOrigin_SteamController_Reserved5 :: 44;
    k_EInputActionOrigin_SteamController_Reserved6 :: 45;
    k_EInputActionOrigin_SteamController_Reserved7 :: 46;
    k_EInputActionOrigin_SteamController_Reserved8 :: 47;
    k_EInputActionOrigin_SteamController_Reserved9 :: 48;
    k_EInputActionOrigin_SteamController_Reserved10 :: 49;
    k_EInputActionOrigin_PS4_X :: 50;
    k_EInputActionOrigin_PS4_Circle :: 51;
    k_EInputActionOrigin_PS4_Triangle :: 52;
    k_EInputActionOrigin_PS4_Square :: 53;
    k_EInputActionOrigin_PS4_LeftBumper :: 54;
    k_EInputActionOrigin_PS4_RightBumper :: 55;
    k_EInputActionOrigin_PS4_Options :: 56;
    k_EInputActionOrigin_PS4_Share :: 57;
    k_EInputActionOrigin_PS4_LeftPad_Touch :: 58;
    k_EInputActionOrigin_PS4_LeftPad_Swipe :: 59;
    k_EInputActionOrigin_PS4_LeftPad_Click :: 60;
    k_EInputActionOrigin_PS4_LeftPad_DPadNorth :: 61;
    k_EInputActionOrigin_PS4_LeftPad_DPadSouth :: 62;
    k_EInputActionOrigin_PS4_LeftPad_DPadWest :: 63;
    k_EInputActionOrigin_PS4_LeftPad_DPadEast :: 64;
    k_EInputActionOrigin_PS4_RightPad_Touch :: 65;
    k_EInputActionOrigin_PS4_RightPad_Swipe :: 66;
    k_EInputActionOrigin_PS4_RightPad_Click :: 67;
    k_EInputActionOrigin_PS4_RightPad_DPadNorth :: 68;
    k_EInputActionOrigin_PS4_RightPad_DPadSouth :: 69;
    k_EInputActionOrigin_PS4_RightPad_DPadWest :: 70;
    k_EInputActionOrigin_PS4_RightPad_DPadEast :: 71;
    k_EInputActionOrigin_PS4_CenterPad_Touch :: 72;
    k_EInputActionOrigin_PS4_CenterPad_Swipe :: 73;
    k_EInputActionOrigin_PS4_CenterPad_Click :: 74;
    k_EInputActionOrigin_PS4_CenterPad_DPadNorth :: 75;
    k_EInputActionOrigin_PS4_CenterPad_DPadSouth :: 76;
    k_EInputActionOrigin_PS4_CenterPad_DPadWest :: 77;
    k_EInputActionOrigin_PS4_CenterPad_DPadEast :: 78;
    k_EInputActionOrigin_PS4_LeftTrigger_Pull :: 79;
    k_EInputActionOrigin_PS4_LeftTrigger_Click :: 80;
    k_EInputActionOrigin_PS4_RightTrigger_Pull :: 81;
    k_EInputActionOrigin_PS4_RightTrigger_Click :: 82;
    k_EInputActionOrigin_PS4_LeftStick_Move :: 83;
    k_EInputActionOrigin_PS4_LeftStick_Click :: 84;
    k_EInputActionOrigin_PS4_LeftStick_DPadNorth :: 85;
    k_EInputActionOrigin_PS4_LeftStick_DPadSouth :: 86;
    k_EInputActionOrigin_PS4_LeftStick_DPadWest :: 87;
    k_EInputActionOrigin_PS4_LeftStick_DPadEast :: 88;
    k_EInputActionOrigin_PS4_RightStick_Move :: 89;
    k_EInputActionOrigin_PS4_RightStick_Click :: 90;
    k_EInputActionOrigin_PS4_RightStick_DPadNorth :: 91;
    k_EInputActionOrigin_PS4_RightStick_DPadSouth :: 92;
    k_EInputActionOrigin_PS4_RightStick_DPadWest :: 93;
    k_EInputActionOrigin_PS4_RightStick_DPadEast :: 94;
    k_EInputActionOrigin_PS4_DPad_North :: 95;
    k_EInputActionOrigin_PS4_DPad_South :: 96;
    k_EInputActionOrigin_PS4_DPad_West :: 97;
    k_EInputActionOrigin_PS4_DPad_East :: 98;
    k_EInputActionOrigin_PS4_Gyro_Move :: 99;
    k_EInputActionOrigin_PS4_Gyro_Pitch :: 100;
    k_EInputActionOrigin_PS4_Gyro_Yaw :: 101;
    k_EInputActionOrigin_PS4_Gyro_Roll :: 102;
    k_EInputActionOrigin_PS4_DPad_Move :: 103;
    k_EInputActionOrigin_PS4_Reserved1 :: 104;
    k_EInputActionOrigin_PS4_Reserved2 :: 105;
    k_EInputActionOrigin_PS4_Reserved3 :: 106;
    k_EInputActionOrigin_PS4_Reserved4 :: 107;
    k_EInputActionOrigin_PS4_Reserved5 :: 108;
    k_EInputActionOrigin_PS4_Reserved6 :: 109;
    k_EInputActionOrigin_PS4_Reserved7 :: 110;
    k_EInputActionOrigin_PS4_Reserved8 :: 111;
    k_EInputActionOrigin_PS4_Reserved9 :: 112;
    k_EInputActionOrigin_PS4_Reserved10 :: 113;
    k_EInputActionOrigin_XBoxOne_A :: 114;
    k_EInputActionOrigin_XBoxOne_B :: 115;
    k_EInputActionOrigin_XBoxOne_X :: 116;
    k_EInputActionOrigin_XBoxOne_Y :: 117;
    k_EInputActionOrigin_XBoxOne_LeftBumper :: 118;
    k_EInputActionOrigin_XBoxOne_RightBumper :: 119;
    k_EInputActionOrigin_XBoxOne_Menu :: 120;
    k_EInputActionOrigin_XBoxOne_View :: 121;
    k_EInputActionOrigin_XBoxOne_LeftTrigger_Pull :: 122;
    k_EInputActionOrigin_XBoxOne_LeftTrigger_Click :: 123;
    k_EInputActionOrigin_XBoxOne_RightTrigger_Pull :: 124;
    k_EInputActionOrigin_XBoxOne_RightTrigger_Click :: 125;
    k_EInputActionOrigin_XBoxOne_LeftStick_Move :: 126;
    k_EInputActionOrigin_XBoxOne_LeftStick_Click :: 127;
    k_EInputActionOrigin_XBoxOne_LeftStick_DPadNorth :: 128;
    k_EInputActionOrigin_XBoxOne_LeftStick_DPadSouth :: 129;
    k_EInputActionOrigin_XBoxOne_LeftStick_DPadWest :: 130;
    k_EInputActionOrigin_XBoxOne_LeftStick_DPadEast :: 131;
    k_EInputActionOrigin_XBoxOne_RightStick_Move :: 132;
    k_EInputActionOrigin_XBoxOne_RightStick_Click :: 133;
    k_EInputActionOrigin_XBoxOne_RightStick_DPadNorth :: 134;
    k_EInputActionOrigin_XBoxOne_RightStick_DPadSouth :: 135;
    k_EInputActionOrigin_XBoxOne_RightStick_DPadWest :: 136;
    k_EInputActionOrigin_XBoxOne_RightStick_DPadEast :: 137;
    k_EInputActionOrigin_XBoxOne_DPad_North :: 138;
    k_EInputActionOrigin_XBoxOne_DPad_South :: 139;
    k_EInputActionOrigin_XBoxOne_DPad_West :: 140;
    k_EInputActionOrigin_XBoxOne_DPad_East :: 141;
    k_EInputActionOrigin_XBoxOne_DPad_Move :: 142;
    k_EInputActionOrigin_XBoxOne_Reserved1 :: 143;
    k_EInputActionOrigin_XBoxOne_Reserved2 :: 144;
    k_EInputActionOrigin_XBoxOne_Reserved3 :: 145;
    k_EInputActionOrigin_XBoxOne_Reserved4 :: 146;
    k_EInputActionOrigin_XBoxOne_Reserved5 :: 147;
    k_EInputActionOrigin_XBoxOne_Reserved6 :: 148;
    k_EInputActionOrigin_XBoxOne_Reserved7 :: 149;
    k_EInputActionOrigin_XBoxOne_Reserved8 :: 150;
    k_EInputActionOrigin_XBoxOne_Reserved9 :: 151;
    k_EInputActionOrigin_XBoxOne_Reserved10 :: 152;
    k_EInputActionOrigin_XBox360_A :: 153;
    k_EInputActionOrigin_XBox360_B :: 154;
    k_EInputActionOrigin_XBox360_X :: 155;
    k_EInputActionOrigin_XBox360_Y :: 156;
    k_EInputActionOrigin_XBox360_LeftBumper :: 157;
    k_EInputActionOrigin_XBox360_RightBumper :: 158;
    k_EInputActionOrigin_XBox360_Start :: 159;
    k_EInputActionOrigin_XBox360_Back :: 160;
    k_EInputActionOrigin_XBox360_LeftTrigger_Pull :: 161;
    k_EInputActionOrigin_XBox360_LeftTrigger_Click :: 162;
    k_EInputActionOrigin_XBox360_RightTrigger_Pull :: 163;
    k_EInputActionOrigin_XBox360_RightTrigger_Click :: 164;
    k_EInputActionOrigin_XBox360_LeftStick_Move :: 165;
    k_EInputActionOrigin_XBox360_LeftStick_Click :: 166;
    k_EInputActionOrigin_XBox360_LeftStick_DPadNorth :: 167;
    k_EInputActionOrigin_XBox360_LeftStick_DPadSouth :: 168;
    k_EInputActionOrigin_XBox360_LeftStick_DPadWest :: 169;
    k_EInputActionOrigin_XBox360_LeftStick_DPadEast :: 170;
    k_EInputActionOrigin_XBox360_RightStick_Move :: 171;
    k_EInputActionOrigin_XBox360_RightStick_Click :: 172;
    k_EInputActionOrigin_XBox360_RightStick_DPadNorth :: 173;
    k_EInputActionOrigin_XBox360_RightStick_DPadSouth :: 174;
    k_EInputActionOrigin_XBox360_RightStick_DPadWest :: 175;
    k_EInputActionOrigin_XBox360_RightStick_DPadEast :: 176;
    k_EInputActionOrigin_XBox360_DPad_North :: 177;
    k_EInputActionOrigin_XBox360_DPad_South :: 178;
    k_EInputActionOrigin_XBox360_DPad_West :: 179;
    k_EInputActionOrigin_XBox360_DPad_East :: 180;
    k_EInputActionOrigin_XBox360_DPad_Move :: 181;
    k_EInputActionOrigin_XBox360_Reserved1 :: 182;
    k_EInputActionOrigin_XBox360_Reserved2 :: 183;
    k_EInputActionOrigin_XBox360_Reserved3 :: 184;
    k_EInputActionOrigin_XBox360_Reserved4 :: 185;
    k_EInputActionOrigin_XBox360_Reserved5 :: 186;
    k_EInputActionOrigin_XBox360_Reserved6 :: 187;
    k_EInputActionOrigin_XBox360_Reserved7 :: 188;
    k_EInputActionOrigin_XBox360_Reserved8 :: 189;
    k_EInputActionOrigin_XBox360_Reserved9 :: 190;
    k_EInputActionOrigin_XBox360_Reserved10 :: 191;
    k_EInputActionOrigin_Switch_A :: 192;
    k_EInputActionOrigin_Switch_B :: 193;
    k_EInputActionOrigin_Switch_X :: 194;
    k_EInputActionOrigin_Switch_Y :: 195;
    k_EInputActionOrigin_Switch_LeftBumper :: 196;
    k_EInputActionOrigin_Switch_RightBumper :: 197;
    k_EInputActionOrigin_Switch_Plus :: 198;
    k_EInputActionOrigin_Switch_Minus :: 199;
    k_EInputActionOrigin_Switch_Capture :: 200;
    k_EInputActionOrigin_Switch_LeftTrigger_Pull :: 201;
    k_EInputActionOrigin_Switch_LeftTrigger_Click :: 202;
    k_EInputActionOrigin_Switch_RightTrigger_Pull :: 203;
    k_EInputActionOrigin_Switch_RightTrigger_Click :: 204;
    k_EInputActionOrigin_Switch_LeftStick_Move :: 205;
    k_EInputActionOrigin_Switch_LeftStick_Click :: 206;
    k_EInputActionOrigin_Switch_LeftStick_DPadNorth :: 207;
    k_EInputActionOrigin_Switch_LeftStick_DPadSouth :: 208;
    k_EInputActionOrigin_Switch_LeftStick_DPadWest :: 209;
    k_EInputActionOrigin_Switch_LeftStick_DPadEast :: 210;
    k_EInputActionOrigin_Switch_RightStick_Move :: 211;
    k_EInputActionOrigin_Switch_RightStick_Click :: 212;
    k_EInputActionOrigin_Switch_RightStick_DPadNorth :: 213;
    k_EInputActionOrigin_Switch_RightStick_DPadSouth :: 214;
    k_EInputActionOrigin_Switch_RightStick_DPadWest :: 215;
    k_EInputActionOrigin_Switch_RightStick_DPadEast :: 216;
    k_EInputActionOrigin_Switch_DPad_North :: 217;
    k_EInputActionOrigin_Switch_DPad_South :: 218;
    k_EInputActionOrigin_Switch_DPad_West :: 219;
    k_EInputActionOrigin_Switch_DPad_East :: 220;
    k_EInputActionOrigin_Switch_ProGyro_Move :: 221;
    k_EInputActionOrigin_Switch_ProGyro_Pitch :: 222;
    k_EInputActionOrigin_Switch_ProGyro_Yaw :: 223;
    k_EInputActionOrigin_Switch_ProGyro_Roll :: 224;
    k_EInputActionOrigin_Switch_DPad_Move :: 225;
    k_EInputActionOrigin_Switch_Reserved1 :: 226;
    k_EInputActionOrigin_Switch_Reserved2 :: 227;
    k_EInputActionOrigin_Switch_Reserved3 :: 228;
    k_EInputActionOrigin_Switch_Reserved4 :: 229;
    k_EInputActionOrigin_Switch_Reserved5 :: 230;
    k_EInputActionOrigin_Switch_Reserved6 :: 231;
    k_EInputActionOrigin_Switch_Reserved7 :: 232;
    k_EInputActionOrigin_Switch_Reserved8 :: 233;
    k_EInputActionOrigin_Switch_Reserved9 :: 234;
    k_EInputActionOrigin_Switch_Reserved10 :: 235;
    k_EInputActionOrigin_Switch_RightGyro_Move :: 236;
    k_EInputActionOrigin_Switch_RightGyro_Pitch :: 237;
    k_EInputActionOrigin_Switch_RightGyro_Yaw :: 238;
    k_EInputActionOrigin_Switch_RightGyro_Roll :: 239;
    k_EInputActionOrigin_Switch_LeftGyro_Move :: 240;
    k_EInputActionOrigin_Switch_LeftGyro_Pitch :: 241;
    k_EInputActionOrigin_Switch_LeftGyro_Yaw :: 242;
    k_EInputActionOrigin_Switch_LeftGyro_Roll :: 243;
    k_EInputActionOrigin_Switch_LeftGrip_Lower :: 244;
    k_EInputActionOrigin_Switch_LeftGrip_Upper :: 245;
    k_EInputActionOrigin_Switch_RightGrip_Lower :: 246;
    k_EInputActionOrigin_Switch_RightGrip_Upper :: 247;
    k_EInputActionOrigin_Switch_Reserved11 :: 248;
    k_EInputActionOrigin_Switch_Reserved12 :: 249;
    k_EInputActionOrigin_Switch_Reserved13 :: 250;
    k_EInputActionOrigin_Switch_Reserved14 :: 251;
    k_EInputActionOrigin_Switch_Reserved15 :: 252;
    k_EInputActionOrigin_Switch_Reserved16 :: 253;
    k_EInputActionOrigin_Switch_Reserved17 :: 254;
    k_EInputActionOrigin_Switch_Reserved18 :: 255;
    k_EInputActionOrigin_Switch_Reserved19 :: 256;
    k_EInputActionOrigin_Switch_Reserved20 :: 257;
    k_EInputActionOrigin_Count :: 258;
    k_EInputActionOrigin_MaximumPossibleValue :: 32767;
}

EXboxOrigin :: enum s32 {
    k_EXboxOrigin_A :: 0;
    k_EXboxOrigin_B :: 1;
    k_EXboxOrigin_X :: 2;
    k_EXboxOrigin_Y :: 3;
    k_EXboxOrigin_LeftBumper :: 4;
    k_EXboxOrigin_RightBumper :: 5;
    k_EXboxOrigin_Menu :: 6;
    k_EXboxOrigin_View :: 7;
    k_EXboxOrigin_LeftTrigger_Pull :: 8;
    k_EXboxOrigin_LeftTrigger_Click :: 9;
    k_EXboxOrigin_RightTrigger_Pull :: 10;
    k_EXboxOrigin_RightTrigger_Click :: 11;
    k_EXboxOrigin_LeftStick_Move :: 12;
    k_EXboxOrigin_LeftStick_Click :: 13;
    k_EXboxOrigin_LeftStick_DPadNorth :: 14;
    k_EXboxOrigin_LeftStick_DPadSouth :: 15;
    k_EXboxOrigin_LeftStick_DPadWest :: 16;
    k_EXboxOrigin_LeftStick_DPadEast :: 17;
    k_EXboxOrigin_RightStick_Move :: 18;
    k_EXboxOrigin_RightStick_Click :: 19;
    k_EXboxOrigin_RightStick_DPadNorth :: 20;
    k_EXboxOrigin_RightStick_DPadSouth :: 21;
    k_EXboxOrigin_RightStick_DPadWest :: 22;
    k_EXboxOrigin_RightStick_DPadEast :: 23;
    k_EXboxOrigin_DPad_North :: 24;
    k_EXboxOrigin_DPad_South :: 25;
    k_EXboxOrigin_DPad_West :: 26;
    k_EXboxOrigin_DPad_East :: 27;
    k_EXboxOrigin_Count :: 28;
}

ESteamControllerPad :: enum s32 {
    k_ESteamControllerPad_Left :: 0;
    k_ESteamControllerPad_Right :: 1;
}

ESteamInputType :: enum s32 {
    k_ESteamInputType_Unknown :: 0;
    k_ESteamInputType_SteamController :: 1;
    k_ESteamInputType_XBox360Controller :: 2;
    k_ESteamInputType_XBoxOneController :: 3;
    k_ESteamInputType_GenericGamepad :: 4;
    k_ESteamInputType_PS4Controller :: 5;
    k_ESteamInputType_AppleMFiController :: 6;
    k_ESteamInputType_AndroidController :: 7;
    k_ESteamInputType_SwitchJoyConPair :: 8;
    k_ESteamInputType_SwitchJoyConSingle :: 9;
    k_ESteamInputType_SwitchProController :: 10;
    k_ESteamInputType_MobileTouch :: 11;
    k_ESteamInputType_PS3Controller :: 12;
    k_ESteamInputType_Count :: 13;
    k_ESteamInputType_MaximumPossibleValue :: 255;
}

ESteamInputLEDFlag :: enum s32 {
    k_ESteamInputLEDFlag_SetColor :: 0;
    k_ESteamInputLEDFlag_RestoreUserDefault :: 1;
}

EControllerActionOrigin :: enum s32 {
    k_EControllerActionOrigin_None :: 0;
    k_EControllerActionOrigin_A :: 1;
    k_EControllerActionOrigin_B :: 2;
    k_EControllerActionOrigin_X :: 3;
    k_EControllerActionOrigin_Y :: 4;
    k_EControllerActionOrigin_LeftBumper :: 5;
    k_EControllerActionOrigin_RightBumper :: 6;
    k_EControllerActionOrigin_LeftGrip :: 7;
    k_EControllerActionOrigin_RightGrip :: 8;
    k_EControllerActionOrigin_Start :: 9;
    k_EControllerActionOrigin_Back :: 10;
    k_EControllerActionOrigin_LeftPad_Touch :: 11;
    k_EControllerActionOrigin_LeftPad_Swipe :: 12;
    k_EControllerActionOrigin_LeftPad_Click :: 13;
    k_EControllerActionOrigin_LeftPad_DPadNorth :: 14;
    k_EControllerActionOrigin_LeftPad_DPadSouth :: 15;
    k_EControllerActionOrigin_LeftPad_DPadWest :: 16;
    k_EControllerActionOrigin_LeftPad_DPadEast :: 17;
    k_EControllerActionOrigin_RightPad_Touch :: 18;
    k_EControllerActionOrigin_RightPad_Swipe :: 19;
    k_EControllerActionOrigin_RightPad_Click :: 20;
    k_EControllerActionOrigin_RightPad_DPadNorth :: 21;
    k_EControllerActionOrigin_RightPad_DPadSouth :: 22;
    k_EControllerActionOrigin_RightPad_DPadWest :: 23;
    k_EControllerActionOrigin_RightPad_DPadEast :: 24;
    k_EControllerActionOrigin_LeftTrigger_Pull :: 25;
    k_EControllerActionOrigin_LeftTrigger_Click :: 26;
    k_EControllerActionOrigin_RightTrigger_Pull :: 27;
    k_EControllerActionOrigin_RightTrigger_Click :: 28;
    k_EControllerActionOrigin_LeftStick_Move :: 29;
    k_EControllerActionOrigin_LeftStick_Click :: 30;
    k_EControllerActionOrigin_LeftStick_DPadNorth :: 31;
    k_EControllerActionOrigin_LeftStick_DPadSouth :: 32;
    k_EControllerActionOrigin_LeftStick_DPadWest :: 33;
    k_EControllerActionOrigin_LeftStick_DPadEast :: 34;
    k_EControllerActionOrigin_Gyro_Move :: 35;
    k_EControllerActionOrigin_Gyro_Pitch :: 36;
    k_EControllerActionOrigin_Gyro_Yaw :: 37;
    k_EControllerActionOrigin_Gyro_Roll :: 38;
    k_EControllerActionOrigin_PS4_X :: 39;
    k_EControllerActionOrigin_PS4_Circle :: 40;
    k_EControllerActionOrigin_PS4_Triangle :: 41;
    k_EControllerActionOrigin_PS4_Square :: 42;
    k_EControllerActionOrigin_PS4_LeftBumper :: 43;
    k_EControllerActionOrigin_PS4_RightBumper :: 44;
    k_EControllerActionOrigin_PS4_Options :: 45;
    k_EControllerActionOrigin_PS4_Share :: 46;
    k_EControllerActionOrigin_PS4_LeftPad_Touch :: 47;
    k_EControllerActionOrigin_PS4_LeftPad_Swipe :: 48;
    k_EControllerActionOrigin_PS4_LeftPad_Click :: 49;
    k_EControllerActionOrigin_PS4_LeftPad_DPadNorth :: 50;
    k_EControllerActionOrigin_PS4_LeftPad_DPadSouth :: 51;
    k_EControllerActionOrigin_PS4_LeftPad_DPadWest :: 52;
    k_EControllerActionOrigin_PS4_LeftPad_DPadEast :: 53;
    k_EControllerActionOrigin_PS4_RightPad_Touch :: 54;
    k_EControllerActionOrigin_PS4_RightPad_Swipe :: 55;
    k_EControllerActionOrigin_PS4_RightPad_Click :: 56;
    k_EControllerActionOrigin_PS4_RightPad_DPadNorth :: 57;
    k_EControllerActionOrigin_PS4_RightPad_DPadSouth :: 58;
    k_EControllerActionOrigin_PS4_RightPad_DPadWest :: 59;
    k_EControllerActionOrigin_PS4_RightPad_DPadEast :: 60;
    k_EControllerActionOrigin_PS4_CenterPad_Touch :: 61;
    k_EControllerActionOrigin_PS4_CenterPad_Swipe :: 62;
    k_EControllerActionOrigin_PS4_CenterPad_Click :: 63;
    k_EControllerActionOrigin_PS4_CenterPad_DPadNorth :: 64;
    k_EControllerActionOrigin_PS4_CenterPad_DPadSouth :: 65;
    k_EControllerActionOrigin_PS4_CenterPad_DPadWest :: 66;
    k_EControllerActionOrigin_PS4_CenterPad_DPadEast :: 67;
    k_EControllerActionOrigin_PS4_LeftTrigger_Pull :: 68;
    k_EControllerActionOrigin_PS4_LeftTrigger_Click :: 69;
    k_EControllerActionOrigin_PS4_RightTrigger_Pull :: 70;
    k_EControllerActionOrigin_PS4_RightTrigger_Click :: 71;
    k_EControllerActionOrigin_PS4_LeftStick_Move :: 72;
    k_EControllerActionOrigin_PS4_LeftStick_Click :: 73;
    k_EControllerActionOrigin_PS4_LeftStick_DPadNorth :: 74;
    k_EControllerActionOrigin_PS4_LeftStick_DPadSouth :: 75;
    k_EControllerActionOrigin_PS4_LeftStick_DPadWest :: 76;
    k_EControllerActionOrigin_PS4_LeftStick_DPadEast :: 77;
    k_EControllerActionOrigin_PS4_RightStick_Move :: 78;
    k_EControllerActionOrigin_PS4_RightStick_Click :: 79;
    k_EControllerActionOrigin_PS4_RightStick_DPadNorth :: 80;
    k_EControllerActionOrigin_PS4_RightStick_DPadSouth :: 81;
    k_EControllerActionOrigin_PS4_RightStick_DPadWest :: 82;
    k_EControllerActionOrigin_PS4_RightStick_DPadEast :: 83;
    k_EControllerActionOrigin_PS4_DPad_North :: 84;
    k_EControllerActionOrigin_PS4_DPad_South :: 85;
    k_EControllerActionOrigin_PS4_DPad_West :: 86;
    k_EControllerActionOrigin_PS4_DPad_East :: 87;
    k_EControllerActionOrigin_PS4_Gyro_Move :: 88;
    k_EControllerActionOrigin_PS4_Gyro_Pitch :: 89;
    k_EControllerActionOrigin_PS4_Gyro_Yaw :: 90;
    k_EControllerActionOrigin_PS4_Gyro_Roll :: 91;
    k_EControllerActionOrigin_XBoxOne_A :: 92;
    k_EControllerActionOrigin_XBoxOne_B :: 93;
    k_EControllerActionOrigin_XBoxOne_X :: 94;
    k_EControllerActionOrigin_XBoxOne_Y :: 95;
    k_EControllerActionOrigin_XBoxOne_LeftBumper :: 96;
    k_EControllerActionOrigin_XBoxOne_RightBumper :: 97;
    k_EControllerActionOrigin_XBoxOne_Menu :: 98;
    k_EControllerActionOrigin_XBoxOne_View :: 99;
    k_EControllerActionOrigin_XBoxOne_LeftTrigger_Pull :: 100;
    k_EControllerActionOrigin_XBoxOne_LeftTrigger_Click :: 101;
    k_EControllerActionOrigin_XBoxOne_RightTrigger_Pull :: 102;
    k_EControllerActionOrigin_XBoxOne_RightTrigger_Click :: 103;
    k_EControllerActionOrigin_XBoxOne_LeftStick_Move :: 104;
    k_EControllerActionOrigin_XBoxOne_LeftStick_Click :: 105;
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadNorth :: 106;
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadSouth :: 107;
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadWest :: 108;
    k_EControllerActionOrigin_XBoxOne_LeftStick_DPadEast :: 109;
    k_EControllerActionOrigin_XBoxOne_RightStick_Move :: 110;
    k_EControllerActionOrigin_XBoxOne_RightStick_Click :: 111;
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadNorth :: 112;
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadSouth :: 113;
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadWest :: 114;
    k_EControllerActionOrigin_XBoxOne_RightStick_DPadEast :: 115;
    k_EControllerActionOrigin_XBoxOne_DPad_North :: 116;
    k_EControllerActionOrigin_XBoxOne_DPad_South :: 117;
    k_EControllerActionOrigin_XBoxOne_DPad_West :: 118;
    k_EControllerActionOrigin_XBoxOne_DPad_East :: 119;
    k_EControllerActionOrigin_XBox360_A :: 120;
    k_EControllerActionOrigin_XBox360_B :: 121;
    k_EControllerActionOrigin_XBox360_X :: 122;
    k_EControllerActionOrigin_XBox360_Y :: 123;
    k_EControllerActionOrigin_XBox360_LeftBumper :: 124;
    k_EControllerActionOrigin_XBox360_RightBumper :: 125;
    k_EControllerActionOrigin_XBox360_Start :: 126;
    k_EControllerActionOrigin_XBox360_Back :: 127;
    k_EControllerActionOrigin_XBox360_LeftTrigger_Pull :: 128;
    k_EControllerActionOrigin_XBox360_LeftTrigger_Click :: 129;
    k_EControllerActionOrigin_XBox360_RightTrigger_Pull :: 130;
    k_EControllerActionOrigin_XBox360_RightTrigger_Click :: 131;
    k_EControllerActionOrigin_XBox360_LeftStick_Move :: 132;
    k_EControllerActionOrigin_XBox360_LeftStick_Click :: 133;
    k_EControllerActionOrigin_XBox360_LeftStick_DPadNorth :: 134;
    k_EControllerActionOrigin_XBox360_LeftStick_DPadSouth :: 135;
    k_EControllerActionOrigin_XBox360_LeftStick_DPadWest :: 136;
    k_EControllerActionOrigin_XBox360_LeftStick_DPadEast :: 137;
    k_EControllerActionOrigin_XBox360_RightStick_Move :: 138;
    k_EControllerActionOrigin_XBox360_RightStick_Click :: 139;
    k_EControllerActionOrigin_XBox360_RightStick_DPadNorth :: 140;
    k_EControllerActionOrigin_XBox360_RightStick_DPadSouth :: 141;
    k_EControllerActionOrigin_XBox360_RightStick_DPadWest :: 142;
    k_EControllerActionOrigin_XBox360_RightStick_DPadEast :: 143;
    k_EControllerActionOrigin_XBox360_DPad_North :: 144;
    k_EControllerActionOrigin_XBox360_DPad_South :: 145;
    k_EControllerActionOrigin_XBox360_DPad_West :: 146;
    k_EControllerActionOrigin_XBox360_DPad_East :: 147;
    k_EControllerActionOrigin_SteamV2_A :: 148;
    k_EControllerActionOrigin_SteamV2_B :: 149;
    k_EControllerActionOrigin_SteamV2_X :: 150;
    k_EControllerActionOrigin_SteamV2_Y :: 151;
    k_EControllerActionOrigin_SteamV2_LeftBumper :: 152;
    k_EControllerActionOrigin_SteamV2_RightBumper :: 153;
    k_EControllerActionOrigin_SteamV2_LeftGrip_Lower :: 154;
    k_EControllerActionOrigin_SteamV2_LeftGrip_Upper :: 155;
    k_EControllerActionOrigin_SteamV2_RightGrip_Lower :: 156;
    k_EControllerActionOrigin_SteamV2_RightGrip_Upper :: 157;
    k_EControllerActionOrigin_SteamV2_LeftBumper_Pressure :: 158;
    k_EControllerActionOrigin_SteamV2_RightBumper_Pressure :: 159;
    k_EControllerActionOrigin_SteamV2_LeftGrip_Pressure :: 160;
    k_EControllerActionOrigin_SteamV2_RightGrip_Pressure :: 161;
    k_EControllerActionOrigin_SteamV2_LeftGrip_Upper_Pressure :: 162;
    k_EControllerActionOrigin_SteamV2_RightGrip_Upper_Pressure :: 163;
    k_EControllerActionOrigin_SteamV2_Start :: 164;
    k_EControllerActionOrigin_SteamV2_Back :: 165;
    k_EControllerActionOrigin_SteamV2_LeftPad_Touch :: 166;
    k_EControllerActionOrigin_SteamV2_LeftPad_Swipe :: 167;
    k_EControllerActionOrigin_SteamV2_LeftPad_Click :: 168;
    k_EControllerActionOrigin_SteamV2_LeftPad_Pressure :: 169;
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadNorth :: 170;
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadSouth :: 171;
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadWest :: 172;
    k_EControllerActionOrigin_SteamV2_LeftPad_DPadEast :: 173;
    k_EControllerActionOrigin_SteamV2_RightPad_Touch :: 174;
    k_EControllerActionOrigin_SteamV2_RightPad_Swipe :: 175;
    k_EControllerActionOrigin_SteamV2_RightPad_Click :: 176;
    k_EControllerActionOrigin_SteamV2_RightPad_Pressure :: 177;
    k_EControllerActionOrigin_SteamV2_RightPad_DPadNorth :: 178;
    k_EControllerActionOrigin_SteamV2_RightPad_DPadSouth :: 179;
    k_EControllerActionOrigin_SteamV2_RightPad_DPadWest :: 180;
    k_EControllerActionOrigin_SteamV2_RightPad_DPadEast :: 181;
    k_EControllerActionOrigin_SteamV2_LeftTrigger_Pull :: 182;
    k_EControllerActionOrigin_SteamV2_LeftTrigger_Click :: 183;
    k_EControllerActionOrigin_SteamV2_RightTrigger_Pull :: 184;
    k_EControllerActionOrigin_SteamV2_RightTrigger_Click :: 185;
    k_EControllerActionOrigin_SteamV2_LeftStick_Move :: 186;
    k_EControllerActionOrigin_SteamV2_LeftStick_Click :: 187;
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadNorth :: 188;
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadSouth :: 189;
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadWest :: 190;
    k_EControllerActionOrigin_SteamV2_LeftStick_DPadEast :: 191;
    k_EControllerActionOrigin_SteamV2_Gyro_Move :: 192;
    k_EControllerActionOrigin_SteamV2_Gyro_Pitch :: 193;
    k_EControllerActionOrigin_SteamV2_Gyro_Yaw :: 194;
    k_EControllerActionOrigin_SteamV2_Gyro_Roll :: 195;
    k_EControllerActionOrigin_Switch_A :: 196;
    k_EControllerActionOrigin_Switch_B :: 197;
    k_EControllerActionOrigin_Switch_X :: 198;
    k_EControllerActionOrigin_Switch_Y :: 199;
    k_EControllerActionOrigin_Switch_LeftBumper :: 200;
    k_EControllerActionOrigin_Switch_RightBumper :: 201;
    k_EControllerActionOrigin_Switch_Plus :: 202;
    k_EControllerActionOrigin_Switch_Minus :: 203;
    k_EControllerActionOrigin_Switch_Capture :: 204;
    k_EControllerActionOrigin_Switch_LeftTrigger_Pull :: 205;
    k_EControllerActionOrigin_Switch_LeftTrigger_Click :: 206;
    k_EControllerActionOrigin_Switch_RightTrigger_Pull :: 207;
    k_EControllerActionOrigin_Switch_RightTrigger_Click :: 208;
    k_EControllerActionOrigin_Switch_LeftStick_Move :: 209;
    k_EControllerActionOrigin_Switch_LeftStick_Click :: 210;
    k_EControllerActionOrigin_Switch_LeftStick_DPadNorth :: 211;
    k_EControllerActionOrigin_Switch_LeftStick_DPadSouth :: 212;
    k_EControllerActionOrigin_Switch_LeftStick_DPadWest :: 213;
    k_EControllerActionOrigin_Switch_LeftStick_DPadEast :: 214;
    k_EControllerActionOrigin_Switch_RightStick_Move :: 215;
    k_EControllerActionOrigin_Switch_RightStick_Click :: 216;
    k_EControllerActionOrigin_Switch_RightStick_DPadNorth :: 217;
    k_EControllerActionOrigin_Switch_RightStick_DPadSouth :: 218;
    k_EControllerActionOrigin_Switch_RightStick_DPadWest :: 219;
    k_EControllerActionOrigin_Switch_RightStick_DPadEast :: 220;
    k_EControllerActionOrigin_Switch_DPad_North :: 221;
    k_EControllerActionOrigin_Switch_DPad_South :: 222;
    k_EControllerActionOrigin_Switch_DPad_West :: 223;
    k_EControllerActionOrigin_Switch_DPad_East :: 224;
    k_EControllerActionOrigin_Switch_ProGyro_Move :: 225;
    k_EControllerActionOrigin_Switch_ProGyro_Pitch :: 226;
    k_EControllerActionOrigin_Switch_ProGyro_Yaw :: 227;
    k_EControllerActionOrigin_Switch_ProGyro_Roll :: 228;
    k_EControllerActionOrigin_Switch_RightGyro_Move :: 229;
    k_EControllerActionOrigin_Switch_RightGyro_Pitch :: 230;
    k_EControllerActionOrigin_Switch_RightGyro_Yaw :: 231;
    k_EControllerActionOrigin_Switch_RightGyro_Roll :: 232;
    k_EControllerActionOrigin_Switch_LeftGyro_Move :: 233;
    k_EControllerActionOrigin_Switch_LeftGyro_Pitch :: 234;
    k_EControllerActionOrigin_Switch_LeftGyro_Yaw :: 235;
    k_EControllerActionOrigin_Switch_LeftGyro_Roll :: 236;
    k_EControllerActionOrigin_Switch_LeftGrip_Lower :: 237;
    k_EControllerActionOrigin_Switch_LeftGrip_Upper :: 238;
    k_EControllerActionOrigin_Switch_RightGrip_Lower :: 239;
    k_EControllerActionOrigin_Switch_RightGrip_Upper :: 240;
    k_EControllerActionOrigin_PS4_DPad_Move :: 241;
    k_EControllerActionOrigin_XBoxOne_DPad_Move :: 242;
    k_EControllerActionOrigin_XBox360_DPad_Move :: 243;
    k_EControllerActionOrigin_Switch_DPad_Move :: 244;
    k_EControllerActionOrigin_Count :: 245;
    k_EControllerActionOrigin_MaximumPossibleValue :: 32767;
}

ESteamControllerLEDFlag :: enum s32 {
    k_ESteamControllerLEDFlag_SetColor :: 0;
    k_ESteamControllerLEDFlag_RestoreUserDefault :: 1;
}

EUGCMatchingUGCType :: enum s32 {
    k_EUGCMatchingUGCType_Items :: 0;
    k_EUGCMatchingUGCType_Items_Mtx :: 1;
    k_EUGCMatchingUGCType_Items_ReadyToUse :: 2;
    k_EUGCMatchingUGCType_Collections :: 3;
    k_EUGCMatchingUGCType_Artwork :: 4;
    k_EUGCMatchingUGCType_Videos :: 5;
    k_EUGCMatchingUGCType_Screenshots :: 6;
    k_EUGCMatchingUGCType_AllGuides :: 7;
    k_EUGCMatchingUGCType_WebGuides :: 8;
    k_EUGCMatchingUGCType_IntegratedGuides :: 9;
    k_EUGCMatchingUGCType_UsableInGame :: 10;
    k_EUGCMatchingUGCType_ControllerBindings :: 11;
    k_EUGCMatchingUGCType_GameManagedItems :: 12;
    k_EUGCMatchingUGCType_All :: -1;
}

EUserUGCList :: enum s32 {
    k_EUserUGCList_Published :: 0;
    k_EUserUGCList_VotedOn :: 1;
    k_EUserUGCList_VotedUp :: 2;
    k_EUserUGCList_VotedDown :: 3;
    k_EUserUGCList_WillVoteLater :: 4;
    k_EUserUGCList_Favorited :: 5;
    k_EUserUGCList_Subscribed :: 6;
    k_EUserUGCList_UsedOrPlayed :: 7;
    k_EUserUGCList_Followed :: 8;
}

EUserUGCListSortOrder :: enum s32 {
    k_EUserUGCListSortOrder_CreationOrderDesc :: 0;
    k_EUserUGCListSortOrder_CreationOrderAsc :: 1;
    k_EUserUGCListSortOrder_TitleAsc :: 2;
    k_EUserUGCListSortOrder_LastUpdatedDesc :: 3;
    k_EUserUGCListSortOrder_SubscriptionDateDesc :: 4;
    k_EUserUGCListSortOrder_VoteScoreDesc :: 5;
    k_EUserUGCListSortOrder_ForModeration :: 6;
}

EUGCQuery :: enum s32 {
    k_EUGCQuery_RankedByVote :: 0;
    k_EUGCQuery_RankedByPublicationDate :: 1;
    k_EUGCQuery_AcceptedForGameRankedByAcceptanceDate :: 2;
    k_EUGCQuery_RankedByTrend :: 3;
    k_EUGCQuery_FavoritedByFriendsRankedByPublicationDate :: 4;
    k_EUGCQuery_CreatedByFriendsRankedByPublicationDate :: 5;
    k_EUGCQuery_RankedByNumTimesReported :: 6;
    k_EUGCQuery_CreatedByFollowedUsersRankedByPublicationDate :: 7;
    k_EUGCQuery_NotYetRated :: 8;
    k_EUGCQuery_RankedByTotalVotesAsc :: 9;
    k_EUGCQuery_RankedByVotesUp :: 10;
    k_EUGCQuery_RankedByTextSearch :: 11;
    k_EUGCQuery_RankedByTotalUniqueSubscriptions :: 12;
    k_EUGCQuery_RankedByPlaytimeTrend :: 13;
    k_EUGCQuery_RankedByTotalPlaytime :: 14;
    k_EUGCQuery_RankedByAveragePlaytimeTrend :: 15;
    k_EUGCQuery_RankedByLifetimeAveragePlaytime :: 16;
    k_EUGCQuery_RankedByPlaytimeSessionsTrend :: 17;
    k_EUGCQuery_RankedByLifetimePlaytimeSessions :: 18;
}

EItemUpdateStatus :: enum s32 {
    k_EItemUpdateStatusInvalid :: 0;
    k_EItemUpdateStatusPreparingConfig :: 1;
    k_EItemUpdateStatusPreparingContent :: 2;
    k_EItemUpdateStatusUploadingContent :: 3;
    k_EItemUpdateStatusUploadingPreviewFile :: 4;
    k_EItemUpdateStatusCommittingChanges :: 5;
}

EItemState :: enum s32 {
    k_EItemStateNone :: 0;
    k_EItemStateSubscribed :: 1;
    k_EItemStateLegacyItem :: 2;
    k_EItemStateInstalled :: 4;
    k_EItemStateNeedsUpdate :: 8;
    k_EItemStateDownloading :: 16;
    k_EItemStateDownloadPending :: 32;
}

EItemStatistic :: enum s32 {
    k_EItemStatistic_NumSubscriptions :: 0;
    k_EItemStatistic_NumFavorites :: 1;
    k_EItemStatistic_NumFollowers :: 2;
    k_EItemStatistic_NumUniqueSubscriptions :: 3;
    k_EItemStatistic_NumUniqueFavorites :: 4;
    k_EItemStatistic_NumUniqueFollowers :: 5;
    k_EItemStatistic_NumUniqueWebsiteViews :: 6;
    k_EItemStatistic_ReportScore :: 7;
    k_EItemStatistic_NumSecondsPlayed :: 8;
    k_EItemStatistic_NumPlaytimeSessions :: 9;
    k_EItemStatistic_NumComments :: 10;
    k_EItemStatistic_NumSecondsPlayedDuringTimePeriod :: 11;
    k_EItemStatistic_NumPlaytimeSessionsDuringTimePeriod :: 12;
}

EItemPreviewType :: enum s32 {
    k_EItemPreviewType_Image :: 0;
    k_EItemPreviewType_YouTubeVideo :: 1;
    k_EItemPreviewType_Sketchfab :: 2;
    k_EItemPreviewType_EnvironmentMap_HorizontalCross :: 3;
    k_EItemPreviewType_EnvironmentMap_LatLong :: 4;
    k_EItemPreviewType_ReservedMax :: 255;
}

ESteamItemFlags :: enum s32 {
    k_ESteamItemNoTrade :: 1;
    k_ESteamItemRemoved :: 256;
    k_ESteamItemConsumed :: 512;
}

EParentalFeature :: enum s32 {
    k_EFeatureInvalid :: 0;
    k_EFeatureStore :: 1;
    k_EFeatureCommunity :: 2;
    k_EFeatureProfile :: 3;
    k_EFeatureFriends :: 4;
    k_EFeatureNews :: 5;
    k_EFeatureTrading :: 6;
    k_EFeatureSettings :: 7;
    k_EFeatureConsole :: 8;
    k_EFeatureBrowser :: 9;
    k_EFeatureParentalSetup :: 10;
    k_EFeatureLibrary :: 11;
    k_EFeatureTest :: 12;
    k_EFeatureSiteLicense :: 13;
    k_EFeatureMax :: 14;
}

ESteamDeviceFormFactor :: enum s32 {
    k_ESteamDeviceFormFactorUnknown :: 0;
    k_ESteamDeviceFormFactorPhone :: 1;
    k_ESteamDeviceFormFactorTablet :: 2;
    k_ESteamDeviceFormFactorComputer :: 3;
    k_ESteamDeviceFormFactorTV :: 4;
}

ESteamNetworkingAvailability :: enum s32 {
    k_ESteamNetworkingAvailability_CannotTry :: -102;
    k_ESteamNetworkingAvailability_Failed :: -101;
    k_ESteamNetworkingAvailability_Previously :: -100;
    k_ESteamNetworkingAvailability_Retrying :: -10;
    k_ESteamNetworkingAvailability_NeverTried :: 1;
    k_ESteamNetworkingAvailability_Waiting :: 2;
    k_ESteamNetworkingAvailability_Attempting :: 3;
    k_ESteamNetworkingAvailability_Current :: 100;
    k_ESteamNetworkingAvailability_Unknown :: 0;
    k_ESteamNetworkingAvailability__Force32bit :: 2147483647;
}

ESteamNetworkingIdentityType :: enum s32 {
    k_ESteamNetworkingIdentityType_Invalid :: 0;
    k_ESteamNetworkingIdentityType_SteamID :: 16;
    k_ESteamNetworkingIdentityType_XboxPairwiseID :: 17;
    k_ESteamNetworkingIdentityType_IPAddress :: 1;
    k_ESteamNetworkingIdentityType_GenericString :: 2;
    k_ESteamNetworkingIdentityType_GenericBytes :: 3;
    k_ESteamNetworkingIdentityType_UnknownType :: 4;
    k_ESteamNetworkingIdentityType__Force32bit :: 2147483647;
}

ESteamNetworkingConnectionState :: enum s32 {
    k_ESteamNetworkingConnectionState_None :: 0;
    k_ESteamNetworkingConnectionState_Connecting :: 1;
    k_ESteamNetworkingConnectionState_FindingRoute :: 2;
    k_ESteamNetworkingConnectionState_Connected :: 3;
    k_ESteamNetworkingConnectionState_ClosedByPeer :: 4;
    k_ESteamNetworkingConnectionState_ProblemDetectedLocally :: 5;
    k_ESteamNetworkingConnectionState_FinWait :: -1;
    k_ESteamNetworkingConnectionState_Linger :: -2;
    k_ESteamNetworkingConnectionState_Dead :: -3;
    k_ESteamNetworkingConnectionState__Force32Bit :: 2147483647;
}

ESteamNetConnectionEnd :: enum s32 {
    k_ESteamNetConnectionEnd_Invalid :: 0;
    k_ESteamNetConnectionEnd_App_Min :: 1000;
    k_ESteamNetConnectionEnd_App_Generic :: 1000;
    k_ESteamNetConnectionEnd_App_Max :: 1999;
    k_ESteamNetConnectionEnd_AppException_Min :: 2000;
    k_ESteamNetConnectionEnd_AppException_Generic :: 2000;
    k_ESteamNetConnectionEnd_AppException_Max :: 2999;
    k_ESteamNetConnectionEnd_Local_Min :: 3000;
    k_ESteamNetConnectionEnd_Local_OfflineMode :: 3001;
    k_ESteamNetConnectionEnd_Local_ManyRelayConnectivity :: 3002;
    k_ESteamNetConnectionEnd_Local_HostedServerPrimaryRelay :: 3003;
    k_ESteamNetConnectionEnd_Local_NetworkConfig :: 3004;
    k_ESteamNetConnectionEnd_Local_Rights :: 3005;
    k_ESteamNetConnectionEnd_Local_P2P_ICE_NoPublicAddresses :: 3006;
    k_ESteamNetConnectionEnd_Local_Max :: 3999;
    k_ESteamNetConnectionEnd_Remote_Min :: 4000;
    k_ESteamNetConnectionEnd_Remote_Timeout :: 4001;
    k_ESteamNetConnectionEnd_Remote_BadCrypt :: 4002;
    k_ESteamNetConnectionEnd_Remote_BadCert :: 4003;
    k_ESteamNetConnectionEnd_Remote_NotLoggedIn :: 4004;
    k_ESteamNetConnectionEnd_Remote_NotRunningApp :: 4005;
    k_ESteamNetConnectionEnd_Remote_BadProtocolVersion :: 4006;
    k_ESteamNetConnectionEnd_Remote_P2P_ICE_NoPublicAddresses :: 4007;
    k_ESteamNetConnectionEnd_Remote_Max :: 4999;
    k_ESteamNetConnectionEnd_Misc_Min :: 5000;
    k_ESteamNetConnectionEnd_Misc_Generic :: 5001;
    k_ESteamNetConnectionEnd_Misc_InternalError :: 5002;
    k_ESteamNetConnectionEnd_Misc_Timeout :: 5003;
    k_ESteamNetConnectionEnd_Misc_RelayConnectivity :: 5004;
    k_ESteamNetConnectionEnd_Misc_SteamConnectivity :: 5005;
    k_ESteamNetConnectionEnd_Misc_NoRelaySessionsToClient :: 5006;
    k_ESteamNetConnectionEnd_Misc_P2P_Rendezvous :: 5008;
    k_ESteamNetConnectionEnd_Misc_P2P_NAT_Firewall :: 5009;
    k_ESteamNetConnectionEnd_Misc_PeerSentNoConnection :: 5010;
    k_ESteamNetConnectionEnd_Misc_Max :: 5999;
    k_ESteamNetConnectionEnd__Force32Bit :: 2147483647;
}

ESteamNetTransportKind :: enum s32 {
    k_ESteamNetTransport_Unknown :: 0;
    k_ESteamNetTransport_LoopbackBuffers :: 1;
    k_ESteamNetTransport_LocalHost :: 2;
    k_ESteamNetTransport_UDP :: 3;
    k_ESteamNetTransport_UDPProbablyLocal :: 4;
    k_ESteamNetTransport_TURN :: 5;
    k_ESteamNetTransport_SDRP2P :: 6;
    k_ESteamNetTransport_SDRHostedServer :: 7;
    k_ESteamNetTransport_Force32Bit :: 2147483647;
}

ESteamNetworkingConfigScope :: enum s32 {
    k_ESteamNetworkingConfig_Global :: 1;
    k_ESteamNetworkingConfig_SocketsInterface :: 2;
    k_ESteamNetworkingConfig_ListenSocket :: 3;
    k_ESteamNetworkingConfig_Connection :: 4;
    k_ESteamNetworkingConfigScope__Force32Bit :: 2147483647;
}

ESteamNetworkingConfigDataType :: enum s32 {
    k_ESteamNetworkingConfig_Int32 :: 1;
    k_ESteamNetworkingConfig_Int64 :: 2;
    k_ESteamNetworkingConfig_Float :: 3;
    k_ESteamNetworkingConfig_String :: 4;
    k_ESteamNetworkingConfig_Ptr :: 5;
    k_ESteamNetworkingConfigDataType__Force32Bit :: 2147483647;
}

ESteamNetworkingConfigValue :: enum s32 {
    k_ESteamNetworkingConfig_Invalid :: 0;
    k_ESteamNetworkingConfig_FakePacketLoss_Send :: 2;
    k_ESteamNetworkingConfig_FakePacketLoss_Recv :: 3;
    k_ESteamNetworkingConfig_FakePacketLag_Send :: 4;
    k_ESteamNetworkingConfig_FakePacketLag_Recv :: 5;
    k_ESteamNetworkingConfig_FakePacketReorder_Send :: 6;
    k_ESteamNetworkingConfig_FakePacketReorder_Recv :: 7;
    k_ESteamNetworkingConfig_FakePacketReorder_Time :: 8;
    k_ESteamNetworkingConfig_FakePacketDup_Send :: 26;
    k_ESteamNetworkingConfig_FakePacketDup_Recv :: 27;
    k_ESteamNetworkingConfig_FakePacketDup_TimeMax :: 28;
    k_ESteamNetworkingConfig_TimeoutInitial :: 24;
    k_ESteamNetworkingConfig_TimeoutConnected :: 25;
    k_ESteamNetworkingConfig_SendBufferSize :: 9;
    k_ESteamNetworkingConfig_SendRateMin :: 10;
    k_ESteamNetworkingConfig_SendRateMax :: 11;
    k_ESteamNetworkingConfig_NagleTime :: 12;
    k_ESteamNetworkingConfig_IP_AllowWithoutAuth :: 23;
    k_ESteamNetworkingConfig_MTU_PacketSize :: 32;
    k_ESteamNetworkingConfig_MTU_DataSize :: 33;
    k_ESteamNetworkingConfig_Unencrypted :: 34;
    k_ESteamNetworkingConfig_EnumerateDevVars :: 35;
    k_ESteamNetworkingConfig_SymmetricConnect :: 37;
    k_ESteamNetworkingConfig_LocalVirtualPort :: 38;
    k_ESteamNetworkingConfig_Callback_ConnectionStatusChanged :: 201;
    k_ESteamNetworkingConfig_Callback_AuthStatusChanged :: 202;
    k_ESteamNetworkingConfig_Callback_RelayNetworkStatusChanged :: 203;
    k_ESteamNetworkingConfig_Callback_MessagesSessionRequest :: 204;
    k_ESteamNetworkingConfig_Callback_MessagesSessionFailed :: 205;
    k_ESteamNetworkingConfig_P2P_STUN_ServerList :: 103;
    k_ESteamNetworkingConfig_P2P_Transport_ICE_Enable :: 104;
    k_ESteamNetworkingConfig_P2P_Transport_ICE_Penalty :: 105;
    k_ESteamNetworkingConfig_P2P_Transport_SDR_Penalty :: 106;
    k_ESteamNetworkingConfig_SDRClient_ConsecutitivePingTimeoutsFailInitial :: 19;
    k_ESteamNetworkingConfig_SDRClient_ConsecutitivePingTimeoutsFail :: 20;
    k_ESteamNetworkingConfig_SDRClient_MinPingsBeforePingAccurate :: 21;
    k_ESteamNetworkingConfig_SDRClient_SingleSocket :: 22;
    k_ESteamNetworkingConfig_SDRClient_ForceRelayCluster :: 29;
    k_ESteamNetworkingConfig_SDRClient_DebugTicketAddress :: 30;
    k_ESteamNetworkingConfig_SDRClient_ForceProxyAddr :: 31;
    k_ESteamNetworkingConfig_SDRClient_FakeClusterPing :: 36;
    k_ESteamNetworkingConfig_LogLevel_AckRTT :: 13;
    k_ESteamNetworkingConfig_LogLevel_PacketDecode :: 14;
    k_ESteamNetworkingConfig_LogLevel_Message :: 15;
    k_ESteamNetworkingConfig_LogLevel_PacketGaps :: 16;
    k_ESteamNetworkingConfig_LogLevel_P2PRendezvous :: 17;
    k_ESteamNetworkingConfig_LogLevel_SDRRelayPings :: 18;
    k_ESteamNetworkingConfigValue__Force32Bit :: 2147483647;
}

ESteamNetworkingGetConfigValueResult :: enum s32 {
    k_ESteamNetworkingGetConfigValue_BadValue :: -1;
    k_ESteamNetworkingGetConfigValue_BadScopeObj :: -2;
    k_ESteamNetworkingGetConfigValue_BufferTooSmall :: -3;
    k_ESteamNetworkingGetConfigValue_OK :: 1;
    k_ESteamNetworkingGetConfigValue_OKInherited :: 2;
    k_ESteamNetworkingGetConfigValueResult__Force32Bit :: 2147483647;
}

ESteamNetworkingSocketsDebugOutputType :: enum s32 {
    k_ESteamNetworkingSocketsDebugOutputType_None :: 0;
    k_ESteamNetworkingSocketsDebugOutputType_Bug :: 1;
    k_ESteamNetworkingSocketsDebugOutputType_Error :: 2;
    k_ESteamNetworkingSocketsDebugOutputType_Important :: 3;
    k_ESteamNetworkingSocketsDebugOutputType_Warning :: 4;
    k_ESteamNetworkingSocketsDebugOutputType_Msg :: 5;
    k_ESteamNetworkingSocketsDebugOutputType_Verbose :: 6;
    k_ESteamNetworkingSocketsDebugOutputType_Debug :: 7;
    k_ESteamNetworkingSocketsDebugOutputType_Everything :: 8;
    k_ESteamNetworkingSocketsDebugOutputType__Force32Bit :: 2147483647;
}

EServerMode :: enum s32 {
    eServerModeInvalid :: 0;
    eServerModeNoAuthentication :: 1;
    eServerModeAuthentication :: 2;
    eServerModeAuthenticationAndSecure :: 3;
}

uint8 :: u8;
int8 :: s8;
int16 :: s16;
uint16 :: u16;
int32 :: s32;
uint32 :: uint;
int64 :: s64;
uint64 :: u64;
lint64 :: s64;
ulint64 :: u64;
intp :: s64;
uintp :: u64;
Salt_t :: [8] u8;
GID_t :: u64;
JobID_t :: u64;
TxnID_t :: u64;
PackageId_t :: uint;
BundleId_t :: uint;
AppId_t :: uint;
AssetClassId_t :: u64;
PhysicalItemId_t :: uint;
DepotId_t :: uint;
RTime32 :: uint;
CellID_t :: uint;
SteamAPICall_t :: u64;
AccountID_t :: uint;
PartnerId_t :: uint;
ManifestId_t :: u64;
SiteId_t :: u64;
PartyBeaconID_t :: u64;
HAuthTicket :: uint;
PFNLegacyKeyRegistration :: *void;
PFNLegacyKeyInstalled :: *void;
PFNPreMinidumpCallback :: *void;
BREAKPAD_HANDLE :: *void;
HSteamPipe :: s32;
HSteamUser :: s32;
FriendsGroupID_t :: s16;
HServerListRequest :: *void;
HServerQuery :: s32;
UGCHandle_t :: u64;
PublishedFileUpdateHandle_t :: u64;
PublishedFileId_t :: u64;
UGCFileWriteStreamHandle_t :: u64;
SteamLeaderboard_t :: u64;
SteamLeaderboardEntries_t :: u64;
SNetSocket_t :: uint;
SNetListenSocket_t :: uint;
ScreenshotHandle :: uint;
HTTPRequestHandle :: uint;
HTTPCookieContainerHandle :: uint;
InputHandle_t :: u64;
InputActionSetHandle_t :: u64;
InputDigitalActionHandle_t :: u64;
InputAnalogActionHandle_t :: u64;
ControllerHandle_t :: u64;
ControllerActionSetHandle_t :: u64;
ControllerDigitalActionHandle_t :: u64;
ControllerAnalogActionHandle_t :: u64;
UGCQueryHandle_t :: u64;
UGCUpdateHandle_t :: u64;
HHTMLBrowser :: uint;
SteamItemInstanceID_t :: u64;
SteamItemDef_t :: s32;
SteamInventoryResult_t :: s32;
SteamInventoryUpdateHandle_t :: u64;
RemotePlaySessionID_t :: uint;
FnSteamNetConnectionStatusChanged :: *void;
FnSteamNetAuthenticationStatusChanged :: *void;
FnSteamRelayNetworkStatusChanged :: *void;
FnSteamNetworkingMessagesSessionRequest :: *void;
FnSteamNetworkingMessagesSessionFailed :: *void;
HSteamNetConnection :: uint;
HSteamListenSocket :: uint;
HSteamNetPollGroup :: uint;
SteamNetworkingErrMsg :: [1024] char;
SteamNetworkingPOPID :: uint;
SteamNetworkingMicroseconds :: s64;
FSteamNetworkingSocketsDebugOutput :: *void;

k_cubSaltSize : int : 8;
k_GIDNil : GID_t : 0xffffffffffffffff;
k_TxnIDNil : GID_t : k_GIDNil;
k_TxnIDUnknown : GID_t : 0;
k_JobIDNil : JobID_t : 0xffffffffffffffff;
k_uPackageIdInvalid : PackageId_t : 0xFFFFFFFF;
k_uBundleIdInvalid : BundleId_t : 0;
k_uAppIdInvalid : AppId_t : 0x0;
k_ulAssetClassIdInvalid : AssetClassId_t : 0x0;
k_uPhysicalItemIdInvalid : PhysicalItemId_t : 0x0;
k_uDepotIdInvalid : DepotId_t : 0x0;
k_uCellIDInvalid : CellID_t : 0xFFFFFFFF;
k_uAPICallInvalid : SteamAPICall_t : 0x0;
k_uPartnerIdInvalid : PartnerId_t : 0;
k_uManifestIdInvalid : ManifestId_t : 0;
k_ulSiteIdInvalid : SiteId_t : 0;
k_ulPartyBeaconIdInvalid : PartyBeaconID_t : 0;
k_HAuthTicketInvalid : HAuthTicket : 0;
k_unSteamAccountIDMask : uint : 0xFFFFFFFF;
k_unSteamAccountInstanceMask : uint : 0x000FFFFF;
k_unSteamUserDefaultInstance : uint : 1;
k_cchGameExtraInfoMax : int : 64;
k_cchMaxFriendsGroupName : int : 64;
k_cFriendsGroupLimit : int : 100;
k_FriendsGroupID_Invalid : FriendsGroupID_t : - 1;
k_cEnumerateFollowersMax : int : 50;
k_cubChatMetadataMax : uint32 : 8192;
k_cbMaxGameServerGameDir : int : 32;
k_cbMaxGameServerMapName : int : 32;
k_cbMaxGameServerGameDescription : int : 64;
k_cbMaxGameServerName : int : 64;
k_cbMaxGameServerTags : int : 128;
k_cbMaxGameServerGameData : int : 2048;
HSERVERQUERY_INVALID : int : 0xffffffff;
k_unFavoriteFlagNone : uint32 : 0x00;
k_unFavoriteFlagFavorite : uint32 : 0x01;
k_unFavoriteFlagHistory : uint32 : 0x02;
k_unMaxCloudFileChunkSize : uint32 : 100 * 1024 * 1024;
k_PublishedFileIdInvalid : PublishedFileId_t : 0;
k_UGCHandleInvalid : UGCHandle_t : 0xffffffffffffffff;
k_PublishedFileUpdateHandleInvalid : PublishedFileUpdateHandle_t : 0xffffffffffffffff;
k_UGCFileStreamHandleInvalid : UGCFileWriteStreamHandle_t : 0xffffffffffffffff;
k_cchPublishedDocumentTitleMax : uint32 : 128 + 1;
k_cchPublishedDocumentDescriptionMax : uint32 : 8000;
k_cchPublishedDocumentChangeDescriptionMax : uint32 : 8000;
k_unEnumeratePublishedFilesMaxResults : uint32 : 50;
k_cchTagListMax : uint32 : 1024 + 1;
k_cchFilenameMax : uint32 : 260;
k_cchPublishedFileURLMax : uint32 : 256;
k_cubAppProofOfPurchaseKeyMax : int : 240;
k_nScreenshotMaxTaggedUsers : uint32 : 32;
k_nScreenshotMaxTaggedPublishedFiles : uint32 : 32;
k_cubUFSTagTypeMax : int : 255;
k_cubUFSTagValueMax : int : 255;
k_ScreenshotThumbWidth : int : 200;
k_UGCQueryHandleInvalid : UGCQueryHandle_t : 0xffffffffffffffff;
k_UGCUpdateHandleInvalid : UGCUpdateHandle_t : 0xffffffffffffffff;
kNumUGCResultsPerPage : uint32 : 50;
k_cchDeveloperMetadataMax : uint32 : 5000;
INVALID_HTMLBROWSER : uint32 : 0;
k_SteamItemInstanceIDInvalid : SteamItemInstanceID_t : cast(SteamItemInstanceID_t) ~ 0;
k_SteamInventoryResultInvalid : SteamInventoryResult_t : - 1;
k_SteamInventoryUpdateHandleInvalid : SteamInventoryUpdateHandle_t : 0xffffffffffffffff;
k_HSteamNetConnection_Invalid : HSteamNetConnection : 0;
k_HSteamListenSocket_Invalid : HSteamListenSocket : 0;
k_HSteamNetPollGroup_Invalid : HSteamNetPollGroup : 0;
k_cchMaxSteamNetworkingErrMsg : int : 1024;
k_cchSteamNetworkingMaxConnectionCloseReason : int : 128;
k_cchSteamNetworkingMaxConnectionDescription : int : 128;
k_cbMaxSteamNetworkingSocketsMessageSizeSend : int : 512 * 1024;
k_nSteamNetworkingSend_Unreliable : int : 0;
k_nSteamNetworkingSend_NoNagle : int : 1;
k_nSteamNetworkingSend_UnreliableNoNagle : int : k_nSteamNetworkingSend_Unreliable | k_nSteamNetworkingSend_NoNagle;
k_nSteamNetworkingSend_NoDelay : int : 4;
k_nSteamNetworkingSend_UnreliableNoDelay : int : k_nSteamNetworkingSend_Unreliable | k_nSteamNetworkingSend_NoDelay | k_nSteamNetworkingSend_NoNagle;
k_nSteamNetworkingSend_Reliable : int : 8;
k_nSteamNetworkingSend_ReliableNoNagle : int : k_nSteamNetworkingSend_Reliable | k_nSteamNetworkingSend_NoNagle;
k_nSteamNetworkingSend_UseCurrentThread : int : 16;
k_nSteamNetworkingSend_AutoRestartBrokenSession : int : 32;
k_cchMaxSteamNetworkingPingLocationString : int : 1024;
k_nSteamNetworkingPing_Failed : int : - 1;
k_nSteamNetworkingPing_Unknown : int : - 2;
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Default : int : - 1;
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Disable : int : 0;
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Relay : int : 1;
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Private : int : 2;
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_Public : int : 4;
k_nSteamNetworkingConfig_P2P_Transport_ICE_Enable_All : int : 0x7fffffff;
k_SteamDatagramPOPID_dev : SteamNetworkingPOPID : ( cast(uint32) #char "d" << 16 ) | ( cast(uint32) #char "e" << 8 ) | cast(uint32) #char "v";
k_unServerFlagNone : uint32 : 0x00;
k_unServerFlagActive : uint32 : 0x01;
k_unServerFlagSecure : uint32 : 0x02;
k_unServerFlagDedicated : uint32 : 0x04;
k_unServerFlagLinux : uint32 : 0x08;
k_unServerFlagPassworded : uint32 : 0x10;
k_unServerFlagPrivate : uint32 : 0x20;
k_cbSteamDatagramMaxSerializedTicket : uint32 : 512;
k_cbMaxSteamDatagramGameCoordinatorServerLoginAppData : uint32 : 2048;
k_cbMaxSteamDatagramGameCoordinatorServerLoginSerialized : uint32 : 4096;

SteamIPAddress_t :: struct {
    m_rgubIPv6 : [16] uint8 ;
    m_eType : ESteamIPType;
}

FriendGameInfo_t :: struct {
    m_gameID : CGameID;
    m_unGameIP : uint32;
    m_usGamePort : uint16;
    m_usQueryPort : uint16;
    m_steamIDLobby : CSteamID;
}

MatchMakingKeyValuePair_t :: struct {
    m_szKey : [256] char ;
    m_szValue : [256] char ;
}

servernetadr_t :: struct {
    m_usConnectionPort : uint16;
    m_usQueryPort : uint16;
    m_unIP : uint32;
}

gameserveritem_t :: struct {
    m_NetAdr : servernetadr_t;
    m_nPing : s32;
    m_bHadSuccessfulResponse : bool;
    m_bDoNotRefresh : bool;
    m_szGameDir : [32] char ;
    m_szMap : [32] char ;
    m_szGameDescription : [64] char ;
    m_nAppID : uint32;
    m_nPlayers : s32;
    m_nMaxPlayers : s32;
    m_nBotPlayers : s32;
    m_bPassword : bool;
    m_bSecure : bool;
    m_ulTimeLastPlayed : uint32;
    m_nServerVersion : s32;
    m_szServerName : [64] char ;
    m_szGameTags : [128] char ;
    m_steamID : CSteamID;
}

SteamPartyBeaconLocation_t :: struct {
    m_eType : ESteamPartyBeaconLocationType;
    m_ulLocationID : uint64;
}

SteamParamStringArray_t :: struct {
    m_ppStrings : **char ;
    m_nNumStrings : int32;
}

LeaderboardEntry_t :: struct {
    m_steamIDUser : CSteamID;
    m_nGlobalRank : int32;
    m_nScore : int32;
    m_cDetails : int32;
    m_hUGC : UGCHandle_t;
}

P2PSessionState_t :: struct {
    m_bConnectionActive : uint8;
    m_bConnecting : uint8;
    m_eP2PSessionError : uint8;
    m_bUsingRelay : uint8;
    m_nBytesQueuedForSend : int32;
    m_nPacketsQueuedForSend : int32;
    m_nRemoteIP : uint32;
    m_nRemotePort : uint16;
}

InputAnalogActionData_t :: struct {
    eMode : EInputSourceMode;
    x : float;
    y : float;
    bActive : bool;
}

InputDigitalActionData_t :: struct {
    bState : bool;
    bActive : bool;
}

InputMotionData_t :: struct {
    rotQuatX : float;
    rotQuatY : float;
    rotQuatZ : float;
    rotQuatW : float;
    posAccelX : float;
    posAccelY : float;
    posAccelZ : float;
    rotVelX : float;
    rotVelY : float;
    rotVelZ : float;
}

SteamUGCDetails_t :: struct {
    m_nPublishedFileId : PublishedFileId_t;
    m_eResult : EResult;
    m_eFileType : EWorkshopFileType;
    m_nCreatorAppID : AppId_t;
    m_nConsumerAppID : AppId_t;
    m_rgchTitle : [129] char ;
    m_rgchDescription : [8000] char ;
    m_ulSteamIDOwner : uint64;
    m_rtimeCreated : uint32;
    m_rtimeUpdated : uint32;
    m_rtimeAddedToUserList : uint32;
    m_eVisibility : ERemoteStoragePublishedFileVisibility;
    m_bBanned : bool;
    m_bAcceptedForUse : bool;
    m_bTagsTruncated : bool;
    m_rgchTags : [1025] char ;
    m_hFile : UGCHandle_t;
    m_hPreviewFile : UGCHandle_t;
    m_pchFileName : [260] char ;
    m_nFileSize : int32;
    m_nPreviewFileSize : int32;
    m_rgchURL : [256] char ;
    m_unVotesUp : uint32;
    m_unVotesDown : uint32;
    m_flScore : float;
    m_unNumChildren : uint32;
}

SteamItemDetails_t :: struct {
    m_itemId : SteamItemInstanceID_t;
    m_iDefinition : SteamItemDef_t;
    m_unQuantity : uint16;
    m_unFlags : uint16;
}

SteamNetworkingIPAddr :: struct {
    m_ipv6 : [16] uint8 ;
    m_port : uint16;
}

SteamNetworkingIdentity :: struct {
    m_eType : ESteamNetworkingIdentityType;
    m_cbSize : s32;
    m_szUnknownRawString : [128] char ;
}

SteamNetConnectionInfo_t :: struct {
    m_identityRemote : SteamNetworkingIdentity;
    m_nUserData : int64;
    m_hListenSocket : HSteamListenSocket;
    m_addrRemote : SteamNetworkingIPAddr;
    m__pad1 : uint16;
    m_idPOPRemote : SteamNetworkingPOPID;
    m_idPOPRelay : SteamNetworkingPOPID;
    m_eState : ESteamNetworkingConnectionState;
    m_eEndReason : s32;
    m_szEndDebug : [128] char ;
    m_szConnectionDescription : [128] char ;
    m_eTransportKind : ESteamNetTransportKind;
    reserved : [63] uint32 ;
}

SteamNetworkingQuickConnectionStatus :: struct {
    m_eState : ESteamNetworkingConnectionState;
    m_nPing : s32;
    m_flConnectionQualityLocal : float;
    m_flConnectionQualityRemote : float;
    m_flOutPacketsPerSec : float;
    m_flOutBytesPerSec : float;
    m_flInPacketsPerSec : float;
    m_flInBytesPerSec : float;
    m_nSendRateBytesPerSecond : s32;
    m_cbPendingUnreliable : s32;
    m_cbPendingReliable : s32;
    m_cbSentUnackedReliable : s32;
    m_usecQueueTime : SteamNetworkingMicroseconds;
    reserved : [16] uint32 ;
}

SteamNetworkingMessage_t :: struct {
    m_pData : *void ;
    m_cbSize : s32;
    m_conn : HSteamNetConnection;
    m_identityPeer : SteamNetworkingIdentity;
    m_nConnUserData : int64;
    m_usecTimeReceived : SteamNetworkingMicroseconds;
    m_nMessageNumber : int64;
    m_pfnFreeData : *void;
    m_pfnRelease : *void;
    m_nChannel : s32;
    m_nFlags : s32;
    m_nUserData : int64;
}

SteamNetworkPingLocation_t :: struct {
    m_data : [512] uint8 ;
}

SteamNetworkingConfigValue_t :: struct {
    m_eValue : ESteamNetworkingConfigValue;
    m_eDataType : ESteamNetworkingConfigDataType;
    m_int64 : int64_t;
}

SteamNetworkingPOPIDRender :: struct {
    buf : [8] char ;
}

SteamNetworkingIdentityRender :: struct {
    buf : [128] char ;
}

SteamNetworkingIPAddrRender :: struct {
    buf : [48] char ;
}

SteamDatagramHostedAddress :: struct {
    m_cbSize : s32;
    m_data : [128] char ;
}

SteamDatagramGameCoordinatorServerLogin :: struct {
    m_identity : SteamNetworkingIdentity;
    m_routing : SteamDatagramHostedAddress;
    m_nAppID : AppId_t;
    m_rtime : RTime32;
    m_cbAppData : s32;
    m_appData : [2048] char ;
}
ISteamClient :: struct {};
ISteamUser :: struct {};
ISteamFriends :: struct {};
ISteamUtils :: struct {};
ISteamMatchmaking :: struct {};
ISteamMatchmakingServerListResponse :: struct {};
ISteamMatchmakingPingResponse :: struct {};
ISteamMatchmakingPlayersResponse :: struct {};
ISteamMatchmakingRulesResponse :: struct {};
ISteamMatchmakingServers :: struct {};
ISteamGameSearch :: struct {};
ISteamParties :: struct {};
ISteamRemoteStorage :: struct {};
ISteamUserStats :: struct {};
ISteamApps :: struct {};
ISteamNetworking :: struct {};
ISteamScreenshots :: struct {};
ISteamMusic :: struct {};
ISteamMusicRemote :: struct {};
ISteamHTTP :: struct {};
ISteamInput :: struct {};
ISteamController :: struct {};
ISteamUGC :: struct {};
ISteamAppList :: struct {};

EHTMLMouseButton :: enum s32 {
    eHTMLMouseButton_Left :: 0;
    eHTMLMouseButton_Right :: 1;
    eHTMLMouseButton_Middle :: 2;
}

EMouseCursor :: enum s32 {
    dc_user :: 0;
    dc_none :: 1;
    dc_arrow :: 2;
    dc_ibeam :: 3;
    dc_hourglass :: 4;
    dc_waitarrow :: 5;
    dc_crosshair :: 6;
    dc_up :: 7;
    dc_sizenw :: 8;
    dc_sizese :: 9;
    dc_sizene :: 10;
    dc_sizesw :: 11;
    dc_sizew :: 12;
    dc_sizee :: 13;
    dc_sizen :: 14;
    dc_sizes :: 15;
    dc_sizewe :: 16;
    dc_sizens :: 17;
    dc_sizeall :: 18;
    dc_no :: 19;
    dc_hand :: 20;
    dc_blank :: 21;
    dc_middle_pan :: 22;
    dc_north_pan :: 23;
    dc_north_east_pan :: 24;
    dc_east_pan :: 25;
    dc_south_east_pan :: 26;
    dc_south_pan :: 27;
    dc_south_west_pan :: 28;
    dc_west_pan :: 29;
    dc_north_west_pan :: 30;
    dc_alias :: 31;
    dc_cell :: 32;
    dc_colresize :: 33;
    dc_copycur :: 34;
    dc_verticaltext :: 35;
    dc_rowresize :: 36;
    dc_zoomin :: 37;
    dc_zoomout :: 38;
    dc_help :: 39;
    dc_custom :: 40;
    dc_last :: 41;
}

EHTMLKeyModifiers :: enum s32 {
    k_eHTMLKeyModifier_None :: 0;
    k_eHTMLKeyModifier_AltDown :: 1;
    k_eHTMLKeyModifier_CtrlDown :: 2;
    k_eHTMLKeyModifier_ShiftDown :: 4;
}
ISteamHTMLSurface :: void;
ISteamInventory :: void;
ISteamVideo :: void;
ISteamParentalSettings :: void;
ISteamRemotePlay :: void;
ISteamNetworkingMessages :: void;
ISteamNetworkingSockets :: void;
ISteamNetworkingUtils :: void;
ISteamGameServer :: void;
ISteamGameServerStats :: void;

CallbackID :: enum s32 {
    SteamServerConnectFailure_t :: 102;
    HTML_OpenLinkInNewTab_t :: 4507;
    GSClientApprove_t :: 201;
    RemoteStoragePublishFileResult_t :: 1309;
    AppProofOfPurchaseKeyResponse_t :: 1021;
    UserAchievementIconFetched_t :: 1109;
    MusicPlayerWillQuit_t :: 4104;
    SteamServersConnected_t :: 101;
    MicroTxnAuthorizationResponse_t :: 152;
    ValidateAuthTicketResponse_t :: 143;
    GameConnectedChatJoin_t :: 339;
    PersonaStateChange_t :: 304;
    SteamRelayNetworkStatus_t :: 1281;
    LowBatteryPower_t :: 702;
    UserStatsUnloaded_t :: 1108;
    HTML_URLChanged_t :: 4505;
    UnreadChatMessagesChanged_t :: 348;
    RemoteStoragePublishedFileDeleted_t :: 1323;
    SteamNetworkingMessagesSessionRequest_t :: 1251;
    MusicPlayerWantsPlayPrevious_t :: 4107;
    HTML_ShowToolTip_t :: 4524;
    SteamNetAuthenticationStatus_t :: 1222;
    LobbyGameCreated_t :: 509;
    RequestPlayersForGameProgressCallback_t :: 5211;
    GSClientDeny_t :: 202;
    MusicPlayerWantsPlayNext_t :: 4108;
    HTML_ChangedTitle_t :: 4508;
    LobbyKicked_t :: 512;
    RemoteStorageAppSyncProgress_t :: 1303;
    HTML_CanGoBackAndForward_t :: 4510;
    RemoteStoragePublishedFileUpdated_t :: 1330;
    AvailableBeaconLocationsUpdated_t :: 5305;
    GSGameplayStats_t :: 207;
    IPCFailure_t :: 117;
    RemoteStoragePublishedFileSubscribed_t :: 1321;
    ScreenshotReady_t :: 2301;
    HTML_CloseBrowser_t :: 4504;
    GameWebCallback_t :: 164;
    HTML_NewWindow_t :: 4521;
    GetVideoURLResult_t :: 4611;
    GameLobbyJoinRequested_t :: 333;
    HTML_JSConfirm_t :: 4515;
    PSNGameBootInviteResult_t :: 515;
    UserStatsStored_t :: 1102;
    NewUrlLaunchParameters_t :: 1014;
    GetOPFSettingsResult_t :: 4624;
    GameOverlayActivated_t :: 331;
    FriendRichPresenceUpdate_t :: 336;
    SteamInventoryFullUpdate_t :: 4701;
    MusicPlayerRemoteWillActivate_t :: 4101;
    GameConnectedChatLeave_t :: 340;
    RemoteStorageAppSyncedServer_t :: 1302;
    MusicPlayerRemoteWillDeactivate_t :: 4102;
    HTML_StatusText_t :: 4523;
    MusicPlayerWantsPlayingRepeatStatus_t :: 4114;
    SearchForGameProgressCallback_t :: 5201;
    HTTPRequestHeadersReceived_t :: 2102;
    MusicPlayerRemoteToFront_t :: 4103;
    GamepadTextInputDismissed_t :: 714;
    HTTPRequestDataReceived_t :: 2103;
    HTML_FinishedRequest_t :: 4506;
    SteamInventoryDefinitionUpdate_t :: 4702;
    SteamParentalSettingsChanged_t :: 5001;
    MusicPlayerWantsPause_t :: 4106;
    SteamInventoryResultReady_t :: 4700;
    LobbyChatMsg_t :: 507;
    SteamNetConnectionStatusChangedCallback_t :: 1221;
    P2PSessionConnectFail_t :: 1203;
    DownloadItemResult_t :: 3406;
    HTML_HorizontalScroll_t :: 4511;
    AvatarImageLoaded_t :: 334;
    ItemInstalled_t :: 3405;
    SteamAppInstalled_t :: 3901;
    MusicPlayerSelectsPlaylistEntry_t :: 4013;
    HTML_NeedsPaint_t :: 4502;
    LobbyChatUpdate_t :: 506;
    HTML_HideToolTip_t :: 4526;
    SubmitPlayerResultResultCallback_t :: 5214;
    GameConnectedClanChatMsg_t :: 338;
    LicensesUpdated_t :: 125;
    FavoritesListChanged_t :: 502;
    FavoritesListAccountsUpdated_t :: 516;
    GSClientAchievementStatus_t :: 206;
    SteamNetworkingMessagesSessionFailed_t :: 1252;
    RemoteStorageAppSyncStatusCheck_t :: 1305;
    HTML_UpdateToolTip_t :: 4525;
    MusicPlayerWantsShuffled_t :: 4109;
    HTML_VerticalScroll_t :: 4512;
    SteamRemotePlaySessionConnected_t :: 5701;
    HTML_FileOpenDialog_t :: 4516;
    GetAuthSessionTicketResponse_t :: 163;
    RegisterActivationCodeResponse_t :: 1008;
    SocketStatusCallback_t :: 1201;
    ClientGameServerDeny_t :: 113;
    SteamShutdown_t :: 704;
    P2PSessionRequest_t :: 1202;
    RemoteStorageEnumerateUserSharedWorkshopFilesResult_t :: 1326;
    MusicPlayerSelectsQueueEntry_t :: 4012;
    GameConnectedFriendChatMsg_t :: 343;
    VolumeHasChanged_t :: 4002;
    SteamAPICallCompleted_t :: 703;
    MusicPlayerWantsLooped_t :: 4110;
    HTTPRequestCompleted_t :: 2101;
    IPCountry_t :: 701;
    SteamAppUninstalled_t :: 3902;
    HTML_StartRequest_t :: 4503;
    SteamRemotePlaySessionDisconnected_t :: 5702;
    SearchForGameResultCallback_t :: 5202;
    RequestPlayersForGameResultCallback_t :: 5212;
    GameRichPresenceJoinRequested_t :: 337;
    ReservationNotificationCallback_t :: 5303;
    TimedTrialStatus_t :: 1030;
    GSClientGroupStatus_t :: 208;
    MusicPlayerWantsVolume_t :: 4011;
    RemoteStorageUserVoteDetails_t :: 1325;
    ScreenshotRequested_t :: 2302;
    DlcInstalled_t :: 1005;
    GSPolicyResponse_t :: 115;
    OverlayBrowserProtocolNavigation_t :: 349;
    EndGameResultCallback_t :: 5215;
    PlaybackStatusHasChanged_t :: 4001;
    RemoteStoragePublishedFileUnsubscribed_t :: 1322;
    HTML_SetCursor_t :: 4522;
    HTML_BrowserRestarted_t :: 4527;
    RemoteStorageAppSyncedClient_t :: 1301;
    ActiveBeaconsUpdated_t :: 5306;
    MusicPlayerWantsPlay_t :: 4105;
    LobbyInvite_t :: 503;
    HTML_SearchResults_t :: 4509;
    SteamServersDisconnected_t :: 103;
    UserAchievementStored_t :: 1103;
    HTML_JSAlert_t :: 4514;
    HTML_LinkAtPosition_t :: 4513;
    LobbyDataUpdate_t :: 505;
    GameServerChangeRequested_t :: 332;
    RequestPlayersForGameFinalResultCallback_t :: 5213;
    GSClientKick_t :: 203;
}

CallResultID :: enum s32 {
    StoreAuthURLResponse_t :: 165;
    RemoteStorageDeletePublishedFileResult_t :: 1311;
    RemoteStorageSubscribePublishedFileResult_t :: 1313;
    EncryptedAppTicketResponse_t :: 154;
    CreateItemResult_t :: 3403;
    LobbyMatchList_t :: 510;
    DownloadClanActivityCountsResult_t :: 341;
    RemoteStorageFileReadAsyncComplete_t :: 1332;
    RemoteStorageEnumeratePublishedFilesByUserActionResult_t :: 1328;
    LobbyCreated_t :: 513;
    GlobalStatsReceived_t :: 1112;
    RemoteStorageEnumerateWorkshopFilesResult_t :: 1319;
    SetPersonaNameResponse_t :: 347;
    StopPlaytimeTrackingResult_t :: 3411;
    NumberOfCurrentPlayers_t :: 1107;
    ChangeNumOpenSlotsCallback_t :: 5304;
    RemoveAppDependencyResult_t :: 3415;
    UserFavoriteItemsListChanged_t :: 3407;
    SteamInventoryRequestPricesResult_t :: 4705;
    AddAppDependencyResult_t :: 3414;
    LeaderboardFindResult_t :: 1104;
    RemoteStorageDownloadUGCResult_t :: 1317;
    CheckFileSignature_t :: 705;
    RemoteStorageGetPublishedFileDetailsResult_t :: 1318;
    FileDetailsResult_t :: 1023;
    ComputeNewPlayerCompatibilityResult_t :: 211;
    RemoteStorageSetUserPublishedFileActionResult_t :: 1327;
    RemoteStorageEnumerateUserPublishedFilesResult_t :: 1312;
    RemoteStorageUnsubscribePublishedFileResult_t :: 1315;
    RemoteStoragePublishFileProgress_t :: 1329;
    CreateBeaconCallback_t :: 5302;
    HTML_BrowserReady_t :: 4501;
    MarketEligibilityResponse_t :: 166;
    RemoteStorageUpdatePublishedFileResult_t :: 1316;
    UserStatsReceived_t :: 1101;
    JoinClanChatRoomCompletionResult_t :: 342;
    GlobalAchievementPercentagesReady_t :: 1110;
    AssociateWithClanResult_t :: 210;
    GetAppDependenciesResult_t :: 3416;
    FriendsIsFollowing_t :: 345;
    SteamUGCRequestUGCDetailsResult_t :: 3402;
    ClanOfficerListResponse_t :: 335;
    FriendsEnumerateFollowingList_t :: 346;
    RemoteStorageGetPublishedItemVoteDetailsResult_t :: 1320;
    LobbyEnter_t :: 504;
    SteamUGCQueryCompleted_t :: 3401;
    GSReputation_t :: 209;
    FriendsGetFollowerCount_t :: 344;
    SteamInventoryEligiblePromoItemDefIDs_t :: 4703;
    SteamInventoryStartPurchaseResult_t :: 4704;
    RemoteStorageFileShareResult_t :: 1307;
    RemoveUGCDependencyResult_t :: 3413;
    StartPlaytimeTrackingResult_t :: 3410;
    GSStatsReceived_t :: 1800;
    GSStatsStored_t :: 1801;
    SubmitItemUpdateResult_t :: 3404;
    GetUserItemVoteResult_t :: 3409;
    LeaderboardScoreUploaded_t :: 1106;
    RemoteStorageEnumerateUserSubscribedFilesResult_t :: 1314;
    JoinPartyCallback_t :: 5301;
    AddUGCDependencyResult_t :: 3412;
    LeaderboardScoresDownloaded_t :: 1105;
    DeleteItemResult_t :: 3417;
    RemoteStorageFileWriteAsyncComplete_t :: 1331;
    SetUserItemVoteResult_t :: 3408;
    DurationControl_t :: 167;
    RemoteStorageUpdateUserPublishedItemVoteResult_t :: 1324;
    LeaderboardUGCSet_t :: 1111;
}

// #scope_module @TODO namespace this?


// @TODO could remove this file by making these subsitution in make_steam_api_flat?


VALVE_BIG_ENDIAN :: false;
UINT64_MAX :: -1;

char :: u8;
int32_t :: s32;
int64_t :: s64;
intptr_t :: u64;
SteamAPIWarningMessageHook_t :: *void;
double :: float64;
uint :: u32;
CGameID :: u64;
size_t :: u64;


//
// clientpublic
//

CSteamID :: u64;

EGameIDType :: enum {
    k_EGameIDTypeApp        :: 0;
    k_EGameIDTypeGameMod    :: 1;
    k_EGameIDTypeShortcut   :: 2;
    k_EGameIDTypeP2P        :: 3;
}

GameID_t :: u64;

QUERY_PORT_NOT_INITIALIZED ::  0xFFFF;    // We haven't asked the GS for this query port's actual value yet.
QUERY_PORT_ERROR           ::  0xFFFE;    // We were unable to get the query port for this server.

ValvePackingSentinel_t :: struct {
    m_u32 : uint32;
    m_u64 : uint64;
    m_u16 : uint16;
    m_d : double;
}


//
// input
//

STEAM_INPUT_MAX_COUNT           :: 16;
STEAM_INPUT_MAX_ANALOG_ACTIONS  :: 16;
STEAM_INPUT_MAX_DIGITAL_ACTIONS :: 128;
STEAM_INPUT_MAX_ORIGINS         :: 8;
STEAM_INPUT_MAX_ACTIVE_LAYERS   :: 16;

// When sending an option to a specific controller handle, you can send to all devices via this command
STEAM_INPUT_HANDLE_ALL_CONTROLLERS :: UINT64_MAX;
STEAM_INPUT_MIN_ANALOG_ACTION_DATA :: -1.0;
STEAM_INPUT_MAX_ANALOG_ACTION_DATA ::  1.0;


//
// controller
//

STEAM_CONTROLLER_MAX_COUNT ::  16;
STEAM_CONTROLLER_MAX_ANALOG_ACTIONS ::  16;
STEAM_CONTROLLER_MAX_DIGITAL_ACTIONS ::  128;
STEAM_CONTROLLER_MAX_ORIGINS ::  8;
STEAM_CONTROLLER_MAX_ACTIVE_LAYERS ::  16;

STEAM_CONTROLLER_HANDLE_ALL_CONTROLLERS ::  UINT64_MAX;

STEAM_CONTROLLER_MIN_ANALOG_ACTION_DATA ::  -1.0;
STEAM_CONTROLLER_MAX_ANALOG_ACTION_DATA ::   1.0;


//
// networkingsockets
//

ISteamNetworkingCustomSignalingRecvContext :: *void;
ISteamNetworkingConnectionCustomSignaling :: *void;

EType :: enum {
    k_EType_String;
    k_EType_Int; // For most small integral values.  Uses google protobuf sint64, so it's small on the wire.  WARNING: In some places this value may be transmitted in JSON, in which case precision may be lost in backend analytics.  Don't use this for an "identifier", use it for a scalar quantity.
    k_EType_Fixed64; // 64 arbitrary bits.  This value is treated as an "identifier".  In places where JSON format is used, it will be serialized as a string.  No aggregation / analytics can be performed on this value.
}

ExtraField :: struct {
    m_eType : s32; /* EType */ ;
    m_szName : [28] char;

    union {
        m_szStringValue : [128] char ;
        m_nIntValue : int64;
        m_nFixed64Value : uint64;
    }
}

SteamDatagramRelayAuthTicket :: struct {
	/// Identity of the gameserver we want to talk to.  This is required.
	m_identityGameserver : SteamNetworkingIdentity;

	/// Identity of the person who was authorized.  This is required.
	m_identityAuthorizedClient : SteamNetworkingIdentity;

	/// SteamID is authorized to send from a particular public IP.  If this
	/// is 0, then the sender is not restricted to a particular IP.
	///
	/// Recommend to leave this set to zero.
	m_unPublicIP : uint32;

	/// Time when the ticket expires.  Recommended: take the current
	/// time and add 6 hours, or maybe a bit longer if your gameplay
	/// sessions are longer.
	///
	/// NOTE: relays may reject tickets with expiry times excessively
	/// far in the future, so contact us if you wish to use an expiry
	/// longer than, say, 24 hours.
	m_rtimeTicketExpiry : RTime32;

	/// Routing information where the gameserver is listening for
	/// relayed traffic.  You should fill this in when generating
	/// a ticket.
	///
	/// When generating tickets on your backend:
	/// - In production: The gameserver knows the proper routing
	///   information, so you need to call
	///   ISteamNetworkingSockets::GetHostedDedicatedServerAddress
	///   and send the info to your backend.
	/// - In development, you will need to provide public IP
	///   of the server using SteamDatagramServiceNetID::SetDevAddress.
	///   Relays need to be able to send UDP
	///   packets to this server.  Since it's very likely that
	///   your server is behind a firewall/NAT, make sure that
	///   the address is the one that the outside world can use.
	///   The traffic from the relays will be "unsolicited", so
	///   stateful firewalls won't work -- you will probably have
	///   to set up an explicit port forward.
	/// On the client:
	/// - this field will always be blank.
	m_routing : SteamDatagramHostedAddress;

	/// App ID this is for.  This is required, and should be the
	/// App ID the client is running.  (Even if your gameserver
	/// uses a different App ID.)
	m_nAppID : uint32;

	/// Restrict this ticket to be used for a particular virtual port?
	/// Set to -1 to allow any virtual port.
	///
	/// This is useful as a security measure, and also so the client will
	/// use the right ticket (which might have extra fields that are useful
	/// for proper analytics), if the client happens to have more than one
	/// appropriate ticket.
	///
	/// Note: if a client has more that one acceptable ticket, they will
	/// always use the one expiring the latest.
	m_nRestrictToVirtualPort : s32;

	//
	// Extra fields.
	//
	// These are collected for backend analytics.  For example, you might
	// send a MatchID so that all of the records for a particular match can
	// be located.  Or send a game mode field so that you can compare
	// the network characteristics of different game modes.
	//
	// (At the time of this writing we don't have a way to expose the data
	// we collect to partners, but we hope to in the future so that you can
	// get visibility into network conditions.)
	//


	m_nExtraFields : s32;
	m_vecExtraFields : [16] ExtraField;
}


// steam_api_internal

CallbackMsg_t :: struct {
	m_hSteamUser : HSteamUser;  // Specific user to whom this callback applies.
	m_iCallback  : s32;         // Callback identifier.  (Corresponds to the k_iCallback enum in the callback structure.)
	m_pubParam   : *uint8;      // Points to the callback structure
	m_cubParam   : s32;         // Size of the data pointed to by m_pubParam
};
