uint64_steamid :: uint64; // Used when passing or returning CSteamID
uint64_gameid :: uint64; // Used when passing or return CGameID

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
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_bStillRetrying : bool;
        StillRetrying : bool;
    }
}

SteamServersDisconnected_t :: struct {
    k_iCallback : s32 : 103;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

ClientGameServerDeny_t :: struct {
    k_iCallback : s32 : 113;
    union {
        m_uAppID : uint32;
        AppID : uint32;
    }
    union {
        m_unGameServerIP : uint32;
        GameServerIP : uint32;
    }
    union {
        m_usGameServerPort : uint16;
        GameServerPort : uint16;
    }
    union {
        m_bSecure : uint16;
        Secure : uint16;
    }
    union {
        m_uReason : uint32;
        Reason : uint32;
    }
}

IPCFailure_t :: struct {
    k_iCallback : s32 : 117;
    union {
        m_eFailureType : uint8;
        FailureType : uint8;
    }
}

LicensesUpdated_t :: struct {
    k_iCallback : s32 : 125;
}

ValidateAuthTicketResponse_t :: struct {
    k_iCallback : s32 : 143;
    union {
        m_SteamID : CSteamID;
        SteamID : CSteamID;
    }
    union {
        m_eAuthSessionResponse : EAuthSessionResponse;
        AuthSessionResponse : EAuthSessionResponse;
    }
    union {
        m_OwnerSteamID : CSteamID;
        OwnerSteamID : CSteamID;
    }
}

MicroTxnAuthorizationResponse_t :: struct {
    k_iCallback : s32 : 152;
    union {
        m_unAppID : uint32;
        AppID : uint32;
    }
    union {
        m_ulOrderID : uint64;
        OrderID : uint64;
    }
    union {
        m_bAuthorized : uint8;
        Authorized : uint8;
    }
}

EncryptedAppTicketResponse_t :: struct {
    k_iCallback : s32 : 154;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

GetAuthSessionTicketResponse_t :: struct {
    k_iCallback : s32 : 163;
    union {
        m_hAuthTicket : HAuthTicket;
        AuthTicket : HAuthTicket;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

GameWebCallback_t :: struct {
    k_iCallback : s32 : 164;
    union {
        m_szURL : [256] char ;
        URL : [256] char ;
    }
}

StoreAuthURLResponse_t :: struct {
    k_iCallback : s32 : 165;
    union {
        m_szURL : [512] char ;
        URL : [512] char ;
    }
}

MarketEligibilityResponse_t :: struct {
    k_iCallback : s32 : 166;
    union {
        m_bAllowed : bool;
        Allowed : bool;
    }
    union {
        m_eNotAllowedReason : EMarketNotAllowedReasonFlags;
        NotAllowedReason : EMarketNotAllowedReasonFlags;
    }
    union {
        m_rtAllowedAtTime : RTime32;
        AllowedAtTime : RTime32;
    }
    union {
        m_cdaySteamGuardRequiredDays : s32;
        CdaySteamGuardRequiredDays : s32;
    }
    union {
        m_cdayNewDeviceCooldown : s32;
        CdayNewDeviceCooldown : s32;
    }
}

DurationControl_t :: struct {
    k_iCallback : s32 : 167;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    m_appid : AppId_t;
    union {
        m_bApplicable : bool;
        Applicable : bool;
    }
    union {
        m_csecsLast5h : int32;
        CsecsLast5h : int32;
    }
    m_progress : EDurationControlProgress;
    m_notification : EDurationControlNotification;
    union {
        m_csecsToday : int32;
        CsecsToday : int32;
    }
    union {
        m_csecsRemaining : int32;
        CsecsRemaining : int32;
    }
}

PersonaStateChange_t :: struct {
    k_iCallback : s32 : 304;
    union {
        m_ulSteamID : uint64;
        SteamID : uint64;
    }
    union {
        m_nChangeFlags : s32;
        ChangeFlags : s32;
    }
}

GameOverlayActivated_t :: struct {
    k_iCallback : s32 : 331;
    union {
        m_bActive : uint8;
        Active : uint8;
    }
}

GameServerChangeRequested_t :: struct {
    k_iCallback : s32 : 332;
    union {
        m_rgchServer : [64] char ;
        RgchServer : [64] char ;
    }
    union {
        m_rgchPassword : [64] char ;
        RgchPassword : [64] char ;
    }
}

GameLobbyJoinRequested_t :: struct {
    k_iCallback : s32 : 333;
    union {
        m_steamIDLobby : CSteamID;
        SteamIDLobby : CSteamID;
    }
    union {
        m_steamIDFriend : CSteamID;
        SteamIDFriend : CSteamID;
    }
}

AvatarImageLoaded_t :: struct {
    k_iCallback : s32 : 334;
    union {
        m_steamID : CSteamID;
        SteamID : CSteamID;
    }
    union {
        m_iImage : s32;
        Image : s32;
    }
    union {
        m_iWide : s32;
        Wide : s32;
    }
    union {
        m_iTall : s32;
        Tall : s32;
    }
}

ClanOfficerListResponse_t :: struct {
    k_iCallback : s32 : 335;
    union {
        m_steamIDClan : CSteamID;
        SteamIDClan : CSteamID;
    }
    union {
        m_cOfficers : s32;
        Officers : s32;
    }
    union {
        m_bSuccess : uint8;
        Success : uint8;
    }
}

FriendRichPresenceUpdate_t :: struct {
    k_iCallback : s32 : 336;
    union {
        m_steamIDFriend : CSteamID;
        SteamIDFriend : CSteamID;
    }
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
}

GameRichPresenceJoinRequested_t :: struct {
    k_iCallback : s32 : 337;
    union {
        m_steamIDFriend : CSteamID;
        SteamIDFriend : CSteamID;
    }
    union {
        m_rgchConnect : [256] char ;
        RgchConnect : [256] char ;
    }
}

GameConnectedClanChatMsg_t :: struct {
    k_iCallback : s32 : 338;
    union {
        m_steamIDClanChat : CSteamID;
        SteamIDClanChat : CSteamID;
    }
    union {
        m_steamIDUser : CSteamID;
        SteamIDUser : CSteamID;
    }
    union {
        m_iMessageID : s32;
        MessageID : s32;
    }
}

GameConnectedChatJoin_t :: struct {
    k_iCallback : s32 : 339;
    union {
        m_steamIDClanChat : CSteamID;
        SteamIDClanChat : CSteamID;
    }
    union {
        m_steamIDUser : CSteamID;
        SteamIDUser : CSteamID;
    }
}

GameConnectedChatLeave_t :: struct {
    k_iCallback : s32 : 340;
    union {
        m_steamIDClanChat : CSteamID;
        SteamIDClanChat : CSteamID;
    }
    union {
        m_steamIDUser : CSteamID;
        SteamIDUser : CSteamID;
    }
    union {
        m_bKicked : bool;
        Kicked : bool;
    }
    union {
        m_bDropped : bool;
        Dropped : bool;
    }
}

DownloadClanActivityCountsResult_t :: struct {
    k_iCallback : s32 : 341;
    union {
        m_bSuccess : bool;
        Success : bool;
    }
}

JoinClanChatRoomCompletionResult_t :: struct {
    k_iCallback : s32 : 342;
    union {
        m_steamIDClanChat : CSteamID;
        SteamIDClanChat : CSteamID;
    }
    union {
        m_eChatRoomEnterResponse : EChatRoomEnterResponse;
        ChatRoomEnterResponse : EChatRoomEnterResponse;
    }
}

GameConnectedFriendChatMsg_t :: struct {
    k_iCallback : s32 : 343;
    union {
        m_steamIDUser : CSteamID;
        SteamIDUser : CSteamID;
    }
    union {
        m_iMessageID : s32;
        MessageID : s32;
    }
}

FriendsGetFollowerCount_t :: struct {
    k_iCallback : s32 : 344;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_steamID : CSteamID;
        SteamID : CSteamID;
    }
    union {
        m_nCount : s32;
        Count : s32;
    }
}

FriendsIsFollowing_t :: struct {
    k_iCallback : s32 : 345;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_steamID : CSteamID;
        SteamID : CSteamID;
    }
    union {
        m_bIsFollowing : bool;
        IsFollowing : bool;
    }
}

FriendsEnumerateFollowingList_t :: struct {
    k_iCallback : s32 : 346;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_rgSteamID : [50] CSteamID ;
        SteamID : [50] CSteamID ;
    }
    union {
        m_nResultsReturned : int32;
        ResultsReturned : int32;
    }
    union {
        m_nTotalResultCount : int32;
        TotalResultCount : int32;
    }
}

SetPersonaNameResponse_t :: struct {
    k_iCallback : s32 : 347;
    union {
        m_bSuccess : bool;
        Success : bool;
    }
    union {
        m_bLocalSuccess : bool;
        LocalSuccess : bool;
    }
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
    union {
        m_nMinutesBatteryLeft : uint8;
        MinutesBatteryLeft : uint8;
    }
}

SteamAPICallCompleted_t :: struct {
    k_iCallback : s32 : 703;
    union {
        m_hAsyncCall : SteamAPICall_t;
        AsyncCall : SteamAPICall_t;
    }
    union {
        m_iCallback : s32;
        Callback : s32;
    }
    union {
        m_cubParam : uint32;
        Param : uint32;
    }
}

SteamShutdown_t :: struct {
    k_iCallback : s32 : 704;
}

CheckFileSignature_t :: struct {
    k_iCallback : s32 : 705;
    union {
        m_eCheckFileSignature : ECheckFileSignature;
        CheckFileSignature : ECheckFileSignature;
    }
}

GamepadTextInputDismissed_t :: struct {
    k_iCallback : s32 : 714;
    union {
        m_bSubmitted : bool;
        Submitted : bool;
    }
    union {
        m_unSubmittedText : uint32;
        SubmittedText : uint32;
    }
}

FavoritesListChanged_t :: struct {
    k_iCallback : s32 : 502;
    union {
        m_nIP : uint32;
        IP : uint32;
    }
    union {
        m_nQueryPort : uint32;
        QueryPort : uint32;
    }
    union {
        m_nConnPort : uint32;
        ConnPort : uint32;
    }
    union {
        m_nAppID : uint32;
        AppID : uint32;
    }
    union {
        m_nFlags : uint32;
        Flags : uint32;
    }
    union {
        m_bAdd : bool;
        Add : bool;
    }
    union {
        m_unAccountId : AccountID_t;
        AccountId : AccountID_t;
    }
}

LobbyInvite_t :: struct {
    k_iCallback : s32 : 503;
    union {
        m_ulSteamIDUser : uint64;
        SteamIDUser : uint64;
    }
    union {
        m_ulSteamIDLobby : uint64;
        SteamIDLobby : uint64;
    }
    union {
        m_ulGameID : uint64;
        GameID : uint64;
    }
}

LobbyEnter_t :: struct {
    k_iCallback : s32 : 504;
    union {
        m_ulSteamIDLobby : uint64;
        SteamIDLobby : uint64;
    }
    union {
        m_rgfChatPermissions : uint32;
        ChatPermissions : uint32;
    }
    union {
        m_bLocked : bool;
        Locked : bool;
    }
    union {
        m_EChatRoomEnterResponse : uint32;
        EChatRoomEnterResponse : uint32;
    }
}

LobbyDataUpdate_t :: struct {
    k_iCallback : s32 : 505;
    union {
        m_ulSteamIDLobby : uint64;
        SteamIDLobby : uint64;
    }
    union {
        m_ulSteamIDMember : uint64;
        SteamIDMember : uint64;
    }
    union {
        m_bSuccess : uint8;
        Success : uint8;
    }
}

LobbyChatUpdate_t :: struct {
    k_iCallback : s32 : 506;
    union {
        m_ulSteamIDLobby : uint64;
        SteamIDLobby : uint64;
    }
    union {
        m_ulSteamIDUserChanged : uint64;
        SteamIDUserChanged : uint64;
    }
    union {
        m_ulSteamIDMakingChange : uint64;
        SteamIDMakingChange : uint64;
    }
    union {
        m_rgfChatMemberStateChange : uint32;
        ChatMemberStateChange : uint32;
    }
}

LobbyChatMsg_t :: struct {
    k_iCallback : s32 : 507;
    union {
        m_ulSteamIDLobby : uint64;
        SteamIDLobby : uint64;
    }
    union {
        m_ulSteamIDUser : uint64;
        SteamIDUser : uint64;
    }
    union {
        m_eChatEntryType : uint8;
        ChatEntryType : uint8;
    }
    union {
        m_iChatID : uint32;
        ChatID : uint32;
    }
}

LobbyGameCreated_t :: struct {
    k_iCallback : s32 : 509;
    union {
        m_ulSteamIDLobby : uint64;
        SteamIDLobby : uint64;
    }
    union {
        m_ulSteamIDGameServer : uint64;
        SteamIDGameServer : uint64;
    }
    union {
        m_unIP : uint32;
        IP : uint32;
    }
    union {
        m_usPort : uint16;
        Port : uint16;
    }
}

LobbyMatchList_t :: struct {
    k_iCallback : s32 : 510;
    union {
        m_nLobbiesMatching : uint32;
        LobbiesMatching : uint32;
    }
}

LobbyKicked_t :: struct {
    k_iCallback : s32 : 512;
    union {
        m_ulSteamIDLobby : uint64;
        SteamIDLobby : uint64;
    }
    union {
        m_ulSteamIDAdmin : uint64;
        SteamIDAdmin : uint64;
    }
    union {
        m_bKickedDueToDisconnect : uint8;
        KickedDueToDisconnect : uint8;
    }
}

LobbyCreated_t :: struct {
    k_iCallback : s32 : 513;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_ulSteamIDLobby : uint64;
        SteamIDLobby : uint64;
    }
}

PSNGameBootInviteResult_t :: struct {
    k_iCallback : s32 : 515;
    union {
        m_bGameBootInviteExists : bool;
        GameBootInviteExists : bool;
    }
    union {
        m_steamIDLobby : CSteamID;
        SteamIDLobby : CSteamID;
    }
}

FavoritesListAccountsUpdated_t :: struct {
    k_iCallback : s32 : 516;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

SearchForGameProgressCallback_t :: struct {
    k_iCallback : s32 : 5201;
    union {
        m_ullSearchID : uint64;
        SearchID : uint64;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_lobbyID : CSteamID;
        LobbyID : CSteamID;
    }
    union {
        m_steamIDEndedSearch : CSteamID;
        SteamIDEndedSearch : CSteamID;
    }
    union {
        m_nSecondsRemainingEstimate : int32;
        SecondsRemainingEstimate : int32;
    }
    union {
        m_cPlayersSearching : int32;
        PlayersSearching : int32;
    }
}

SearchForGameResultCallback_t :: struct {
    k_iCallback : s32 : 5202;
    union {
        m_ullSearchID : uint64;
        SearchID : uint64;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nCountPlayersInGame : int32;
        CountPlayersInGame : int32;
    }
    union {
        m_nCountAcceptedGame : int32;
        CountAcceptedGame : int32;
    }
    union {
        m_steamIDHost : CSteamID;
        SteamIDHost : CSteamID;
    }
    union {
        m_bFinalCallback : bool;
        FinalCallback : bool;
    }
}

RequestPlayersForGameProgressCallback_t :: struct {
    k_iCallback : s32 : 5211;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_ullSearchID : uint64;
        SearchID : uint64;
    }
}

RequestPlayersForGameResultCallback_t :: struct {
    k_iCallback : s32 : 5212;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_ullSearchID : uint64;
        SearchID : uint64;
    }
    union {
        m_SteamIDPlayerFound : CSteamID;
        SteamIDPlayerFound : CSteamID;
    }
    union {
        m_SteamIDLobby : CSteamID;
        SteamIDLobby : CSteamID;
    }
    union {
        m_ePlayerAcceptState : PlayerAcceptState_t;
        PlayerAcceptState : PlayerAcceptState_t;
    }
    union {
        m_nPlayerIndex : int32;
        PlayerIndex : int32;
    }
    union {
        m_nTotalPlayersFound : int32;
        TotalPlayersFound : int32;
    }
    union {
        m_nTotalPlayersAcceptedGame : int32;
        TotalPlayersAcceptedGame : int32;
    }
    union {
        m_nSuggestedTeamIndex : int32;
        SuggestedTeamIndex : int32;
    }
    union {
        m_ullUniqueGameID : uint64;
        UniqueGameID : uint64;
    }
}

RequestPlayersForGameFinalResultCallback_t :: struct {
    k_iCallback : s32 : 5213;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_ullSearchID : uint64;
        SearchID : uint64;
    }
    union {
        m_ullUniqueGameID : uint64;
        UniqueGameID : uint64;
    }
}

SubmitPlayerResultResultCallback_t :: struct {
    k_iCallback : s32 : 5214;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    ullUniqueGameID : uint64;
    steamIDPlayer : CSteamID;
}

EndGameResultCallback_t :: struct {
    k_iCallback : s32 : 5215;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    ullUniqueGameID : uint64;
}

JoinPartyCallback_t :: struct {
    k_iCallback : s32 : 5301;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_ulBeaconID : PartyBeaconID_t;
        BeaconID : PartyBeaconID_t;
    }
    union {
        m_SteamIDBeaconOwner : CSteamID;
        SteamIDBeaconOwner : CSteamID;
    }
    union {
        m_rgchConnectString : [256] char ;
        RgchConnectString : [256] char ;
    }
}

CreateBeaconCallback_t :: struct {
    k_iCallback : s32 : 5302;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_ulBeaconID : PartyBeaconID_t;
        BeaconID : PartyBeaconID_t;
    }
}

ReservationNotificationCallback_t :: struct {
    k_iCallback : s32 : 5303;
    union {
        m_ulBeaconID : PartyBeaconID_t;
        BeaconID : PartyBeaconID_t;
    }
    union {
        m_steamIDJoiner : CSteamID;
        SteamIDJoiner : CSteamID;
    }
}

ChangeNumOpenSlotsCallback_t :: struct {
    k_iCallback : s32 : 5304;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

AvailableBeaconLocationsUpdated_t :: struct {
    k_iCallback : s32 : 5305;
}

ActiveBeaconsUpdated_t :: struct {
    k_iCallback : s32 : 5306;
}

RemoteStorageAppSyncedClient_t :: struct {
    k_iCallback : s32 : 1301;
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_unNumDownloads : s32;
        NumDownloads : s32;
    }
}

RemoteStorageAppSyncedServer_t :: struct {
    k_iCallback : s32 : 1302;
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_unNumUploads : s32;
        NumUploads : s32;
    }
}

RemoteStorageAppSyncProgress_t :: struct {
    k_iCallback : s32 : 1303;
    union {
        m_rgchCurrentFile : [260] char ;
        RgchCurrentFile : [260] char ;
    }
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
    union {
        m_uBytesTransferredThisChunk : uint32;
        BytesTransferredThisChunk : uint32;
    }
    union {
        m_dAppPercentComplete : double;
        AppPercentComplete : double;
    }
    union {
        m_bUploading : bool;
        Uploading : bool;
    }
}

RemoteStorageAppSyncStatusCheck_t :: struct {
    k_iCallback : s32 : 1305;
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

RemoteStorageFileShareResult_t :: struct {
    k_iCallback : s32 : 1307;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_hFile : UGCHandle_t;
        File : UGCHandle_t;
    }
    union {
        m_rgchFilename : [260] char ;
        RgchFilename : [260] char ;
    }
}

RemoteStoragePublishFileResult_t :: struct {
    k_iCallback : s32 : 1309;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_bUserNeedsToAcceptWorkshopLegalAgreement : bool;
        UserNeedsToAcceptWorkshopLegalAgreement : bool;
    }
}

RemoteStorageDeletePublishedFileResult_t :: struct {
    k_iCallback : s32 : 1311;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
}

RemoteStorageEnumerateUserPublishedFilesResult_t :: struct {
    k_iCallback : s32 : 1312;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nResultsReturned : int32;
        ResultsReturned : int32;
    }
    union {
        m_nTotalResultCount : int32;
        TotalResultCount : int32;
    }
    union {
        m_rgPublishedFileId : [50] PublishedFileId_t ;
        PublishedFileId : [50] PublishedFileId_t ;
    }
}

RemoteStorageSubscribePublishedFileResult_t :: struct {
    k_iCallback : s32 : 1313;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
}

RemoteStorageEnumerateUserSubscribedFilesResult_t :: struct {
    k_iCallback : s32 : 1314;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nResultsReturned : int32;
        ResultsReturned : int32;
    }
    union {
        m_nTotalResultCount : int32;
        TotalResultCount : int32;
    }
    union {
        m_rgPublishedFileId : [50] PublishedFileId_t ;
        PublishedFileId : [50] PublishedFileId_t ;
    }
    union {
        m_rgRTimeSubscribed : [50] uint32 ;
        RTimeSubscribed : [50] uint32 ;
    }
}

RemoteStorageUnsubscribePublishedFileResult_t :: struct {
    k_iCallback : s32 : 1315;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
}

RemoteStorageUpdatePublishedFileResult_t :: struct {
    k_iCallback : s32 : 1316;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_bUserNeedsToAcceptWorkshopLegalAgreement : bool;
        UserNeedsToAcceptWorkshopLegalAgreement : bool;
    }
}

RemoteStorageDownloadUGCResult_t :: struct {
    k_iCallback : s32 : 1317;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_hFile : UGCHandle_t;
        File : UGCHandle_t;
    }
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
    union {
        m_nSizeInBytes : int32;
        SizeInBytes : int32;
    }
    union {
        m_pchFileName : [260] char ;
        FileName : [260] char ;
    }
    union {
        m_ulSteamIDOwner : uint64;
        SteamIDOwner : uint64;
    }
}

RemoteStorageGetPublishedFileDetailsResult_t :: struct {
    k_iCallback : s32 : 1318;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_nCreatorAppID : AppId_t;
        CreatorAppID : AppId_t;
    }
    union {
        m_nConsumerAppID : AppId_t;
        ConsumerAppID : AppId_t;
    }
    union {
        m_rgchTitle : [129] char ;
        RgchTitle : [129] char ;
    }
    union {
        m_rgchDescription : [8000] char ;
        RgchDescription : [8000] char ;
    }
    union {
        m_hFile : UGCHandle_t;
        File : UGCHandle_t;
    }
    union {
        m_hPreviewFile : UGCHandle_t;
        PreviewFile : UGCHandle_t;
    }
    union {
        m_ulSteamIDOwner : uint64;
        SteamIDOwner : uint64;
    }
    union {
        m_rtimeCreated : uint32;
        RtimeCreated : uint32;
    }
    union {
        m_rtimeUpdated : uint32;
        RtimeUpdated : uint32;
    }
    union {
        m_eVisibility : ERemoteStoragePublishedFileVisibility;
        Visibility : ERemoteStoragePublishedFileVisibility;
    }
    union {
        m_bBanned : bool;
        Banned : bool;
    }
    union {
        m_rgchTags : [1025] char ;
        RgchTags : [1025] char ;
    }
    union {
        m_bTagsTruncated : bool;
        TagsTruncated : bool;
    }
    union {
        m_pchFileName : [260] char ;
        FileName : [260] char ;
    }
    union {
        m_nFileSize : int32;
        FileSize : int32;
    }
    union {
        m_nPreviewFileSize : int32;
        PreviewFileSize : int32;
    }
    union {
        m_rgchURL : [256] char ;
        RgchURL : [256] char ;
    }
    union {
        m_eFileType : EWorkshopFileType;
        FileType : EWorkshopFileType;
    }
    union {
        m_bAcceptedForUse : bool;
        AcceptedForUse : bool;
    }
}

RemoteStorageEnumerateWorkshopFilesResult_t :: struct {
    k_iCallback : s32 : 1319;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nResultsReturned : int32;
        ResultsReturned : int32;
    }
    union {
        m_nTotalResultCount : int32;
        TotalResultCount : int32;
    }
    union {
        m_rgPublishedFileId : [50] PublishedFileId_t ;
        PublishedFileId : [50] PublishedFileId_t ;
    }
    union {
        m_rgScore : [50] float ;
        Score : [50] float ;
    }
    union {
        m_nAppId : AppId_t;
        AppId : AppId_t;
    }
    union {
        m_unStartIndex : uint32;
        StartIndex : uint32;
    }
}

RemoteStorageGetPublishedItemVoteDetailsResult_t :: struct {
    k_iCallback : s32 : 1320;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_unPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_nVotesFor : int32;
        VotesFor : int32;
    }
    union {
        m_nVotesAgainst : int32;
        VotesAgainst : int32;
    }
    union {
        m_nReports : int32;
        Reports : int32;
    }
    union {
        m_fScore : float;
        Score : float;
    }
}

RemoteStoragePublishedFileSubscribed_t :: struct {
    k_iCallback : s32 : 1321;
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
}

RemoteStoragePublishedFileUnsubscribed_t :: struct {
    k_iCallback : s32 : 1322;
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
}

RemoteStoragePublishedFileDeleted_t :: struct {
    k_iCallback : s32 : 1323;
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
}

RemoteStorageUpdateUserPublishedItemVoteResult_t :: struct {
    k_iCallback : s32 : 1324;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
}

RemoteStorageUserVoteDetails_t :: struct {
    k_iCallback : s32 : 1325;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_eVote : EWorkshopVote;
        Vote : EWorkshopVote;
    }
}

RemoteStorageEnumerateUserSharedWorkshopFilesResult_t :: struct {
    k_iCallback : s32 : 1326;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nResultsReturned : int32;
        ResultsReturned : int32;
    }
    union {
        m_nTotalResultCount : int32;
        TotalResultCount : int32;
    }
    union {
        m_rgPublishedFileId : [50] PublishedFileId_t ;
        PublishedFileId : [50] PublishedFileId_t ;
    }
}

RemoteStorageSetUserPublishedFileActionResult_t :: struct {
    k_iCallback : s32 : 1327;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_eAction : EWorkshopFileAction;
        Action : EWorkshopFileAction;
    }
}

RemoteStorageEnumeratePublishedFilesByUserActionResult_t :: struct {
    k_iCallback : s32 : 1328;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_eAction : EWorkshopFileAction;
        Action : EWorkshopFileAction;
    }
    union {
        m_nResultsReturned : int32;
        ResultsReturned : int32;
    }
    union {
        m_nTotalResultCount : int32;
        TotalResultCount : int32;
    }
    union {
        m_rgPublishedFileId : [50] PublishedFileId_t ;
        PublishedFileId : [50] PublishedFileId_t ;
    }
    union {
        m_rgRTimeUpdated : [50] uint32 ;
        RTimeUpdated : [50] uint32 ;
    }
}

RemoteStoragePublishFileProgress_t :: struct {
    k_iCallback : s32 : 1329;
    union {
        m_dPercentFile : double;
        PercentFile : double;
    }
    union {
        m_bPreview : bool;
        Preview : bool;
    }
}

RemoteStoragePublishedFileUpdated_t :: struct {
    k_iCallback : s32 : 1330;
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
    union {
        m_ulUnused : uint64;
        Unused : uint64;
    }
}

RemoteStorageFileWriteAsyncComplete_t :: struct {
    k_iCallback : s32 : 1331;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

RemoteStorageFileReadAsyncComplete_t :: struct {
    k_iCallback : s32 : 1332;
    union {
        m_hFileReadAsync : SteamAPICall_t;
        FileReadAsync : SteamAPICall_t;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nOffset : uint32;
        Offset : uint32;
    }
    union {
        m_cubRead : uint32;
        Read : uint32;
    }
}

UserStatsReceived_t :: struct {
    k_iCallback : s32 : 1101;
    union {
        m_nGameID : uint64;
        GameID : uint64;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_steamIDUser : CSteamID;
        SteamIDUser : CSteamID;
    }
}

UserStatsStored_t :: struct {
    k_iCallback : s32 : 1102;
    union {
        m_nGameID : uint64;
        GameID : uint64;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

UserAchievementStored_t :: struct {
    k_iCallback : s32 : 1103;
    union {
        m_nGameID : uint64;
        GameID : uint64;
    }
    union {
        m_bGroupAchievement : bool;
        GroupAchievement : bool;
    }
    union {
        m_rgchAchievementName : [128] char ;
        RgchAchievementName : [128] char ;
    }
    union {
        m_nCurProgress : uint32;
        CurProgress : uint32;
    }
    union {
        m_nMaxProgress : uint32;
        MaxProgress : uint32;
    }
}

LeaderboardFindResult_t :: struct {
    k_iCallback : s32 : 1104;
    union {
        m_hSteamLeaderboard : SteamLeaderboard_t;
        SteamLeaderboard : SteamLeaderboard_t;
    }
    union {
        m_bLeaderboardFound : uint8;
        LeaderboardFound : uint8;
    }
}

LeaderboardScoresDownloaded_t :: struct {
    k_iCallback : s32 : 1105;
    union {
        m_hSteamLeaderboard : SteamLeaderboard_t;
        SteamLeaderboard : SteamLeaderboard_t;
    }
    union {
        m_hSteamLeaderboardEntries : SteamLeaderboardEntries_t;
        SteamLeaderboardEntries : SteamLeaderboardEntries_t;
    }
    union {
        m_cEntryCount : s32;
        EntryCount : s32;
    }
}

LeaderboardScoreUploaded_t :: struct {
    k_iCallback : s32 : 1106;
    union {
        m_bSuccess : uint8;
        Success : uint8;
    }
    union {
        m_hSteamLeaderboard : SteamLeaderboard_t;
        SteamLeaderboard : SteamLeaderboard_t;
    }
    union {
        m_nScore : int32;
        Score : int32;
    }
    union {
        m_bScoreChanged : uint8;
        ScoreChanged : uint8;
    }
    union {
        m_nGlobalRankNew : s32;
        GlobalRankNew : s32;
    }
    union {
        m_nGlobalRankPrevious : s32;
        GlobalRankPrevious : s32;
    }
}

NumberOfCurrentPlayers_t :: struct {
    k_iCallback : s32 : 1107;
    union {
        m_bSuccess : uint8;
        Success : uint8;
    }
    union {
        m_cPlayers : int32;
        Players : int32;
    }
}

UserStatsUnloaded_t :: struct {
    k_iCallback : s32 : 1108;
    union {
        m_steamIDUser : CSteamID;
        SteamIDUser : CSteamID;
    }
}

UserAchievementIconFetched_t :: struct {
    k_iCallback : s32 : 1109;
    union {
        m_nGameID : CGameID;
        GameID : CGameID;
    }
    union {
        m_rgchAchievementName : [128] char ;
        RgchAchievementName : [128] char ;
    }
    union {
        m_bAchieved : bool;
        Achieved : bool;
    }
    union {
        m_nIconHandle : s32;
        IconHandle : s32;
    }
}

GlobalAchievementPercentagesReady_t :: struct {
    k_iCallback : s32 : 1110;
    union {
        m_nGameID : uint64;
        GameID : uint64;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

LeaderboardUGCSet_t :: struct {
    k_iCallback : s32 : 1111;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_hSteamLeaderboard : SteamLeaderboard_t;
        SteamLeaderboard : SteamLeaderboard_t;
    }
}

PS3TrophiesInstalled_t :: struct {
    k_iCallback : s32 : 1112;
    union {
        m_nGameID : uint64;
        GameID : uint64;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_ulRequiredDiskSpace : uint64;
        RequiredDiskSpace : uint64;
    }
}

GlobalStatsReceived_t :: struct {
    k_iCallback : s32 : 1112;
    union {
        m_nGameID : uint64;
        GameID : uint64;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

DlcInstalled_t :: struct {
    k_iCallback : s32 : 1005;
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
}

RegisterActivationCodeResponse_t :: struct {
    k_iCallback : s32 : 1008;
    union {
        m_eResult : ERegisterActivationCodeResult;
        Result : ERegisterActivationCodeResult;
    }
    union {
        m_unPackageRegistered : uint32;
        PackageRegistered : uint32;
    }
}

NewUrlLaunchParameters_t :: struct {
    k_iCallback : s32 : 1014;
}

AppProofOfPurchaseKeyResponse_t :: struct {
    k_iCallback : s32 : 1021;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nAppID : uint32;
        AppID : uint32;
    }
    union {
        m_cchKeyLength : uint32;
        KeyLength : uint32;
    }
    union {
        m_rgchKey : [240] char ;
        RgchKey : [240] char ;
    }
}

FileDetailsResult_t :: struct {
    k_iCallback : s32 : 1023;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_ulFileSize : uint64;
        FileSize : uint64;
    }
    union {
        m_FileSHA : [20] uint8 ;
        FileSHA : [20] uint8 ;
    }
    union {
        m_unFlags : uint32;
        Flags : uint32;
    }
}

TimedTrialStatus_t :: struct {
    k_iCallback : s32 : 1030;
    union {
        m_unAppID : AppId_t;
        AppID : AppId_t;
    }
    union {
        m_bIsOffline : bool;
        IsOffline : bool;
    }
    union {
        m_unSecondsAllowed : uint32;
        SecondsAllowed : uint32;
    }
    union {
        m_unSecondsPlayed : uint32;
        SecondsPlayed : uint32;
    }
}

P2PSessionRequest_t :: struct {
    k_iCallback : s32 : 1202;
    union {
        m_steamIDRemote : CSteamID;
        SteamIDRemote : CSteamID;
    }
}

P2PSessionConnectFail_t :: struct {
    k_iCallback : s32 : 1203;
    union {
        m_steamIDRemote : CSteamID;
        SteamIDRemote : CSteamID;
    }
    union {
        m_eP2PSessionError : uint8;
        P2PSessionError : uint8;
    }
}

SocketStatusCallback_t :: struct {
    k_iCallback : s32 : 1201;
    union {
        m_hSocket : SNetSocket_t;
        Socket : SNetSocket_t;
    }
    union {
        m_hListenSocket : SNetListenSocket_t;
        ListenSocket : SNetListenSocket_t;
    }
    union {
        m_steamIDRemote : CSteamID;
        SteamIDRemote : CSteamID;
    }
    union {
        m_eSNetSocketState : s32;
        SNetSocketState : s32;
    }
}

ScreenshotReady_t :: struct {
    k_iCallback : s32 : 2301;
    union {
        m_hLocal : ScreenshotHandle;
        Local : ScreenshotHandle;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

ScreenshotRequested_t :: struct {
    k_iCallback : s32 : 2302;
}

PlaybackStatusHasChanged_t :: struct {
    k_iCallback : s32 : 4001;
}

VolumeHasChanged_t :: struct {
    k_iCallback : s32 : 4002;
    union {
        m_flNewVolume : float;
        NewVolume : float;
    }
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
    union {
        m_bShuffled : bool;
        Shuffled : bool;
    }
}

MusicPlayerWantsLooped_t :: struct {
    k_iCallback : s32 : 4110;
    union {
        m_bLooped : bool;
        Looped : bool;
    }
}

MusicPlayerWantsVolume_t :: struct {
    k_iCallback : s32 : 4011;
    union {
        m_flNewVolume : float;
        NewVolume : float;
    }
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
    union {
        m_nPlayingRepeatStatus : s32;
        PlayingRepeatStatus : s32;
    }
}

HTTPRequestCompleted_t :: struct {
    k_iCallback : s32 : 2101;
    union {
        m_hRequest : HTTPRequestHandle;
        Request : HTTPRequestHandle;
    }
    union {
        m_ulContextValue : uint64;
        ContextValue : uint64;
    }
    union {
        m_bRequestSuccessful : bool;
        RequestSuccessful : bool;
    }
    union {
        m_eStatusCode : EHTTPStatusCode;
        StatusCode : EHTTPStatusCode;
    }
    union {
        m_unBodySize : uint32;
        BodySize : uint32;
    }
}

HTTPRequestHeadersReceived_t :: struct {
    k_iCallback : s32 : 2102;
    union {
        m_hRequest : HTTPRequestHandle;
        Request : HTTPRequestHandle;
    }
    union {
        m_ulContextValue : uint64;
        ContextValue : uint64;
    }
}

HTTPRequestDataReceived_t :: struct {
    k_iCallback : s32 : 2103;
    union {
        m_hRequest : HTTPRequestHandle;
        Request : HTTPRequestHandle;
    }
    union {
        m_ulContextValue : uint64;
        ContextValue : uint64;
    }
    union {
        m_cOffset : uint32;
        Offset : uint32;
    }
    union {
        m_cBytesReceived : uint32;
        BytesReceived : uint32;
    }
}

SteamUGCQueryCompleted_t :: struct {
    k_iCallback : s32 : 3401;
    m_handle : UGCQueryHandle_t;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_unNumResultsReturned : uint32;
        NumResultsReturned : uint32;
    }
    union {
        m_unTotalMatchingResults : uint32;
        TotalMatchingResults : uint32;
    }
    union {
        m_bCachedData : bool;
        CachedData : bool;
    }
    union {
        m_rgchNextCursor : [256] char ;
        RgchNextCursor : [256] char ;
    }
}

SteamUGCRequestUGCDetailsResult_t :: struct {
    k_iCallback : s32 : 3402;
    m_details : SteamUGCDetails_t;
    union {
        m_bCachedData : bool;
        CachedData : bool;
    }
}

CreateItemResult_t :: struct {
    k_iCallback : s32 : 3403;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_bUserNeedsToAcceptWorkshopLegalAgreement : bool;
        UserNeedsToAcceptWorkshopLegalAgreement : bool;
    }
}

SubmitItemUpdateResult_t :: struct {
    k_iCallback : s32 : 3404;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_bUserNeedsToAcceptWorkshopLegalAgreement : bool;
        UserNeedsToAcceptWorkshopLegalAgreement : bool;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
}

ItemInstalled_t :: struct {
    k_iCallback : s32 : 3405;
    union {
        m_unAppID : AppId_t;
        AppID : AppId_t;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
}

DownloadItemResult_t :: struct {
    k_iCallback : s32 : 3406;
    union {
        m_unAppID : AppId_t;
        AppID : AppId_t;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

UserFavoriteItemsListChanged_t :: struct {
    k_iCallback : s32 : 3407;
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_bWasAddRequest : bool;
        WasAddRequest : bool;
    }
}

SetUserItemVoteResult_t :: struct {
    k_iCallback : s32 : 3408;
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_bVoteUp : bool;
        VoteUp : bool;
    }
}

GetUserItemVoteResult_t :: struct {
    k_iCallback : s32 : 3409;
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_bVotedUp : bool;
        VotedUp : bool;
    }
    union {
        m_bVotedDown : bool;
        VotedDown : bool;
    }
    union {
        m_bVoteSkipped : bool;
        VoteSkipped : bool;
    }
}

StartPlaytimeTrackingResult_t :: struct {
    k_iCallback : s32 : 3410;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

StopPlaytimeTrackingResult_t :: struct {
    k_iCallback : s32 : 3411;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

AddUGCDependencyResult_t :: struct {
    k_iCallback : s32 : 3412;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_nChildPublishedFileId : PublishedFileId_t;
        ChildPublishedFileId : PublishedFileId_t;
    }
}

RemoveUGCDependencyResult_t :: struct {
    k_iCallback : s32 : 3413;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_nChildPublishedFileId : PublishedFileId_t;
        ChildPublishedFileId : PublishedFileId_t;
    }
}

AddAppDependencyResult_t :: struct {
    k_iCallback : s32 : 3414;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
}

RemoveAppDependencyResult_t :: struct {
    k_iCallback : s32 : 3415;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
}

GetAppDependenciesResult_t :: struct {
    k_iCallback : s32 : 3416;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_rgAppIDs : [32] AppId_t ;
        AppIDs : [32] AppId_t ;
    }
    union {
        m_nNumAppDependencies : uint32;
        NumAppDependencies : uint32;
    }
    union {
        m_nTotalNumAppDependencies : uint32;
        TotalNumAppDependencies : uint32;
    }
}

DeleteItemResult_t :: struct {
    k_iCallback : s32 : 3417;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
}

SteamAppInstalled_t :: struct {
    k_iCallback : s32 : 3901;
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
}

SteamAppUninstalled_t :: struct {
    k_iCallback : s32 : 3902;
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
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
    union {
        m_steamID : CSteamID;
        SteamID : CSteamID;
    }
    union {
        m_numEligiblePromoItemDefs : s32;
        EligiblePromoItemDefs : s32;
    }
    union {
        m_bCachedData : bool;
        CachedData : bool;
    }
}

SteamInventoryStartPurchaseResult_t :: struct {
    k_iCallback : s32 : 4704;
    m_result : EResult;
    union {
        m_ulOrderID : uint64;
        OrderID : uint64;
    }
    union {
        m_ulTransID : uint64;
        TransID : uint64;
    }
}

SteamInventoryRequestPricesResult_t :: struct {
    k_iCallback : s32 : 4705;
    m_result : EResult;
    union {
        m_rgchCurrency : [4] char ;
        RgchCurrency : [4] char ;
    }
}

GetVideoURLResult_t :: struct {
    k_iCallback : s32 : 4611;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_unVideoAppID : AppId_t;
        VideoAppID : AppId_t;
    }
    union {
        m_rgchURL : [256] char ;
        RgchURL : [256] char ;
    }
}

GetOPFSettingsResult_t :: struct {
    k_iCallback : s32 : 4624;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_unVideoAppID : AppId_t;
        VideoAppID : AppId_t;
    }
}

SteamParentalSettingsChanged_t :: struct {
    k_iCallback : s32 : 5001;
}

SteamRemotePlaySessionConnected_t :: struct {
    k_iCallback : s32 : 5701;
    union {
        m_unSessionID : RemotePlaySessionID_t;
        SessionID : RemotePlaySessionID_t;
    }
}

SteamRemotePlaySessionDisconnected_t :: struct {
    k_iCallback : s32 : 5702;
    union {
        m_unSessionID : RemotePlaySessionID_t;
        SessionID : RemotePlaySessionID_t;
    }
}

SteamNetworkingMessagesSessionRequest_t :: struct {
    k_iCallback : s32 : 1251;
    union {
        m_identityRemote : SteamNetworkingIdentity;
        IdentityRemote : SteamNetworkingIdentity;
    }
}

SteamNetworkingMessagesSessionFailed_t :: struct {
    k_iCallback : s32 : 1252;
    m_info : SteamNetConnectionInfo_t;
}

SteamNetConnectionStatusChangedCallback_t :: struct {
    k_iCallback : s32 : 1221;
    union {
        m_hConn : HSteamNetConnection;
        Conn : HSteamNetConnection;
    }
    m_info : SteamNetConnectionInfo_t;
    union {
        m_eOldState : ESteamNetworkingConnectionState;
        OldState : ESteamNetworkingConnectionState;
    }
}

SteamNetAuthenticationStatus_t :: struct {
    k_iCallback : s32 : 1222;
    union {
        m_eAvail : ESteamNetworkingAvailability;
        Avail : ESteamNetworkingAvailability;
    }
    union {
        m_debugMsg : [256] char ;
        DebugMsg : [256] char ;
    }
}

SteamRelayNetworkStatus_t :: struct {
    k_iCallback : s32 : 1281;
    union {
        m_eAvail : ESteamNetworkingAvailability;
        Avail : ESteamNetworkingAvailability;
    }
    union {
        m_bPingMeasurementInProgress : s32;
        PingMeasurementInProgress : s32;
    }
    union {
        m_eAvailNetworkConfig : ESteamNetworkingAvailability;
        AvailNetworkConfig : ESteamNetworkingAvailability;
    }
    union {
        m_eAvailAnyRelay : ESteamNetworkingAvailability;
        AvailAnyRelay : ESteamNetworkingAvailability;
    }
    union {
        m_debugMsg : [256] char ;
        DebugMsg : [256] char ;
    }
}

GSClientApprove_t :: struct {
    k_iCallback : s32 : 201;
    union {
        m_SteamID : CSteamID;
        SteamID : CSteamID;
    }
    union {
        m_OwnerSteamID : CSteamID;
        OwnerSteamID : CSteamID;
    }
}

GSClientDeny_t :: struct {
    k_iCallback : s32 : 202;
    union {
        m_SteamID : CSteamID;
        SteamID : CSteamID;
    }
    union {
        m_eDenyReason : EDenyReason;
        DenyReason : EDenyReason;
    }
    union {
        m_rgchOptionalText : [128] char ;
        RgchOptionalText : [128] char ;
    }
}

GSClientKick_t :: struct {
    k_iCallback : s32 : 203;
    union {
        m_SteamID : CSteamID;
        SteamID : CSteamID;
    }
    union {
        m_eDenyReason : EDenyReason;
        DenyReason : EDenyReason;
    }
}

GSClientAchievementStatus_t :: struct {
    k_iCallback : s32 : 206;
    union {
        m_SteamID : uint64;
        SteamID : uint64;
    }
    union {
        m_pchAchievement : [128] char ;
        Achievement : [128] char ;
    }
    union {
        m_bUnlocked : bool;
        Unlocked : bool;
    }
}

GSPolicyResponse_t :: struct {
    k_iCallback : s32 : 115;
    union {
        m_bSecure : uint8;
        Secure : uint8;
    }
}

GSGameplayStats_t :: struct {
    k_iCallback : s32 : 207;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_nRank : int32;
        Rank : int32;
    }
    union {
        m_unTotalConnects : uint32;
        TotalConnects : uint32;
    }
    union {
        m_unTotalMinutesPlayed : uint32;
        TotalMinutesPlayed : uint32;
    }
}

GSClientGroupStatus_t :: struct {
    k_iCallback : s32 : 208;
    union {
        m_SteamIDUser : CSteamID;
        SteamIDUser : CSteamID;
    }
    union {
        m_SteamIDGroup : CSteamID;
        SteamIDGroup : CSteamID;
    }
    union {
        m_bMember : bool;
        Member : bool;
    }
    union {
        m_bOfficer : bool;
        Officer : bool;
    }
}

GSReputation_t :: struct {
    k_iCallback : s32 : 209;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_unReputationScore : uint32;
        ReputationScore : uint32;
    }
    union {
        m_bBanned : bool;
        Banned : bool;
    }
    union {
        m_unBannedIP : uint32;
        BannedIP : uint32;
    }
    union {
        m_usBannedPort : uint16;
        BannedPort : uint16;
    }
    union {
        m_ulBannedGameID : uint64;
        BannedGameID : uint64;
    }
    union {
        m_unBanExpires : uint32;
        BanExpires : uint32;
    }
}

AssociateWithClanResult_t :: struct {
    k_iCallback : s32 : 210;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
}

ComputeNewPlayerCompatibilityResult_t :: struct {
    k_iCallback : s32 : 211;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_cPlayersThatDontLikeCandidate : s32;
        PlayersThatDontLikeCandidate : s32;
    }
    union {
        m_cPlayersThatCandidateDoesntLike : s32;
        PlayersThatCandidateDoesntLike : s32;
    }
    union {
        m_cClanPlayersThatDontLikeCandidate : s32;
        ClanPlayersThatDontLikeCandidate : s32;
    }
    union {
        m_SteamIDCandidate : CSteamID;
        SteamIDCandidate : CSteamID;
    }
}

GSStatsReceived_t :: struct {
    k_iCallback : s32 : 1800;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_steamIDUser : CSteamID;
        SteamIDUser : CSteamID;
    }
}

GSStatsStored_t :: struct {
    k_iCallback : s32 : 1801;
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_steamIDUser : CSteamID;
        SteamIDUser : CSteamID;
    }
}

GSStatsUnloaded_t :: struct {
    k_iCallback : s32 : 1108;
    union {
        m_steamIDUser : CSteamID;
        SteamIDUser : CSteamID;
    }
}

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
k_cbSteamDatagramMaxSerializedTicket : uint32 : 512;
k_cbMaxSteamDatagramGameCoordinatorServerLoginAppData : uint32 : 2048;
k_cbMaxSteamDatagramGameCoordinatorServerLoginSerialized : uint32 : 4096;

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
    k_EResultNoLauncherSpecified :: 117;
    k_EResultMustAgreeToSSA :: 118;
    k_EResultLauncherMigrated :: 119;
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

EAppOwnershipFlags :: enum_flags u32 {
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

EAppType :: enum_flags u32 {
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
    k_EAppType_DepotOnly_DEPRECATED :: 2147483648;
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

EChatSteamIDInstanceFlags :: enum_flags u32 {
    k_EChatAccountInstanceMask :: 4095;
    k_EChatInstanceFlagClan :: 524288;
    k_EChatInstanceFlagLobby :: 262144;
    k_EChatInstanceFlagMMSLobby :: 131072;
}

EMarketingMessageFlags :: enum_flags u32 {
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
    k_eEVRHMDType_HP_ReverbG2 :: 1463;
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

EMarketNotAllowedReasonFlags :: enum_flags u32 {
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

EFriendFlags :: enum_flags u32 {
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

EUserRestriction :: enum_flags u32 {
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

EPersonaChange :: enum_flags u32 {
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

EChatMemberStateChange :: enum_flags u32 {
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

ERemoteStoragePlatform :: enum_flags u32 {
    k_ERemoteStoragePlatformNone :: 0;
    k_ERemoteStoragePlatformWindows :: 1;
    k_ERemoteStoragePlatformOSX :: 2;
    k_ERemoteStoragePlatformPS3 :: 4;
    k_ERemoteStoragePlatformLinux :: 8;
    k_ERemoteStoragePlatformSwitch :: 16;
    k_ERemoteStoragePlatformAndroid :: 32;
    k_ERemoteStoragePlatformIOS :: 64;
    k_ERemoteStoragePlatformAll :: 4294967295;
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
    k_EP2PSessionErrorNoRightsToApp :: 2;
    k_EP2PSessionErrorTimeout :: 4;
    k_EP2PSessionErrorNotRunningApp_DELETED :: 1;
    k_EP2PSessionErrorDestinationNotLoggedIn_DELETED :: 3;
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
    k_EInputActionOrigin_PS5_X :: 258;
    k_EInputActionOrigin_PS5_Circle :: 259;
    k_EInputActionOrigin_PS5_Triangle :: 260;
    k_EInputActionOrigin_PS5_Square :: 261;
    k_EInputActionOrigin_PS5_LeftBumper :: 262;
    k_EInputActionOrigin_PS5_RightBumper :: 263;
    k_EInputActionOrigin_PS5_Option :: 264;
    k_EInputActionOrigin_PS5_Create :: 265;
    k_EInputActionOrigin_PS5_Mute :: 266;
    k_EInputActionOrigin_PS5_LeftPad_Touch :: 267;
    k_EInputActionOrigin_PS5_LeftPad_Swipe :: 268;
    k_EInputActionOrigin_PS5_LeftPad_Click :: 269;
    k_EInputActionOrigin_PS5_LeftPad_DPadNorth :: 270;
    k_EInputActionOrigin_PS5_LeftPad_DPadSouth :: 271;
    k_EInputActionOrigin_PS5_LeftPad_DPadWest :: 272;
    k_EInputActionOrigin_PS5_LeftPad_DPadEast :: 273;
    k_EInputActionOrigin_PS5_RightPad_Touch :: 274;
    k_EInputActionOrigin_PS5_RightPad_Swipe :: 275;
    k_EInputActionOrigin_PS5_RightPad_Click :: 276;
    k_EInputActionOrigin_PS5_RightPad_DPadNorth :: 277;
    k_EInputActionOrigin_PS5_RightPad_DPadSouth :: 278;
    k_EInputActionOrigin_PS5_RightPad_DPadWest :: 279;
    k_EInputActionOrigin_PS5_RightPad_DPadEast :: 280;
    k_EInputActionOrigin_PS5_CenterPad_Touch :: 281;
    k_EInputActionOrigin_PS5_CenterPad_Swipe :: 282;
    k_EInputActionOrigin_PS5_CenterPad_Click :: 283;
    k_EInputActionOrigin_PS5_CenterPad_DPadNorth :: 284;
    k_EInputActionOrigin_PS5_CenterPad_DPadSouth :: 285;
    k_EInputActionOrigin_PS5_CenterPad_DPadWest :: 286;
    k_EInputActionOrigin_PS5_CenterPad_DPadEast :: 287;
    k_EInputActionOrigin_PS5_LeftTrigger_Pull :: 288;
    k_EInputActionOrigin_PS5_LeftTrigger_Click :: 289;
    k_EInputActionOrigin_PS5_RightTrigger_Pull :: 290;
    k_EInputActionOrigin_PS5_RightTrigger_Click :: 291;
    k_EInputActionOrigin_PS5_LeftStick_Move :: 292;
    k_EInputActionOrigin_PS5_LeftStick_Click :: 293;
    k_EInputActionOrigin_PS5_LeftStick_DPadNorth :: 294;
    k_EInputActionOrigin_PS5_LeftStick_DPadSouth :: 295;
    k_EInputActionOrigin_PS5_LeftStick_DPadWest :: 296;
    k_EInputActionOrigin_PS5_LeftStick_DPadEast :: 297;
    k_EInputActionOrigin_PS5_RightStick_Move :: 298;
    k_EInputActionOrigin_PS5_RightStick_Click :: 299;
    k_EInputActionOrigin_PS5_RightStick_DPadNorth :: 300;
    k_EInputActionOrigin_PS5_RightStick_DPadSouth :: 301;
    k_EInputActionOrigin_PS5_RightStick_DPadWest :: 302;
    k_EInputActionOrigin_PS5_RightStick_DPadEast :: 303;
    k_EInputActionOrigin_PS5_DPad_North :: 304;
    k_EInputActionOrigin_PS5_DPad_South :: 305;
    k_EInputActionOrigin_PS5_DPad_West :: 306;
    k_EInputActionOrigin_PS5_DPad_East :: 307;
    k_EInputActionOrigin_PS5_Gyro_Move :: 308;
    k_EInputActionOrigin_PS5_Gyro_Pitch :: 309;
    k_EInputActionOrigin_PS5_Gyro_Yaw :: 310;
    k_EInputActionOrigin_PS5_Gyro_Roll :: 311;
    k_EInputActionOrigin_PS5_DPad_Move :: 312;
    k_EInputActionOrigin_PS5_Reserved1 :: 313;
    k_EInputActionOrigin_PS5_Reserved2 :: 314;
    k_EInputActionOrigin_PS5_Reserved3 :: 315;
    k_EInputActionOrigin_PS5_Reserved4 :: 316;
    k_EInputActionOrigin_PS5_Reserved5 :: 317;
    k_EInputActionOrigin_PS5_Reserved6 :: 318;
    k_EInputActionOrigin_PS5_Reserved7 :: 319;
    k_EInputActionOrigin_PS5_Reserved8 :: 320;
    k_EInputActionOrigin_PS5_Reserved9 :: 321;
    k_EInputActionOrigin_PS5_Reserved10 :: 322;
    k_EInputActionOrigin_PS5_Reserved11 :: 323;
    k_EInputActionOrigin_PS5_Reserved12 :: 324;
    k_EInputActionOrigin_PS5_Reserved13 :: 325;
    k_EInputActionOrigin_PS5_Reserved14 :: 326;
    k_EInputActionOrigin_PS5_Reserved15 :: 327;
    k_EInputActionOrigin_PS5_Reserved16 :: 328;
    k_EInputActionOrigin_PS5_Reserved17 :: 329;
    k_EInputActionOrigin_PS5_Reserved18 :: 330;
    k_EInputActionOrigin_PS5_Reserved19 :: 331;
    k_EInputActionOrigin_PS5_Reserved20 :: 332;
    k_EInputActionOrigin_Count :: 333;
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
    k_ESteamInputType_PS5Controller :: 13;
    k_ESteamInputType_Count :: 14;
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
    k_EControllerActionOrigin_PS5_X :: 245;
    k_EControllerActionOrigin_PS5_Circle :: 246;
    k_EControllerActionOrigin_PS5_Triangle :: 247;
    k_EControllerActionOrigin_PS5_Square :: 248;
    k_EControllerActionOrigin_PS5_LeftBumper :: 249;
    k_EControllerActionOrigin_PS5_RightBumper :: 250;
    k_EControllerActionOrigin_PS5_Option :: 251;
    k_EControllerActionOrigin_PS5_Create :: 252;
    k_EControllerActionOrigin_PS5_Mute :: 253;
    k_EControllerActionOrigin_PS5_LeftPad_Touch :: 254;
    k_EControllerActionOrigin_PS5_LeftPad_Swipe :: 255;
    k_EControllerActionOrigin_PS5_LeftPad_Click :: 256;
    k_EControllerActionOrigin_PS5_LeftPad_DPadNorth :: 257;
    k_EControllerActionOrigin_PS5_LeftPad_DPadSouth :: 258;
    k_EControllerActionOrigin_PS5_LeftPad_DPadWest :: 259;
    k_EControllerActionOrigin_PS5_LeftPad_DPadEast :: 260;
    k_EControllerActionOrigin_PS5_RightPad_Touch :: 261;
    k_EControllerActionOrigin_PS5_RightPad_Swipe :: 262;
    k_EControllerActionOrigin_PS5_RightPad_Click :: 263;
    k_EControllerActionOrigin_PS5_RightPad_DPadNorth :: 264;
    k_EControllerActionOrigin_PS5_RightPad_DPadSouth :: 265;
    k_EControllerActionOrigin_PS5_RightPad_DPadWest :: 266;
    k_EControllerActionOrigin_PS5_RightPad_DPadEast :: 267;
    k_EControllerActionOrigin_PS5_CenterPad_Touch :: 268;
    k_EControllerActionOrigin_PS5_CenterPad_Swipe :: 269;
    k_EControllerActionOrigin_PS5_CenterPad_Click :: 270;
    k_EControllerActionOrigin_PS5_CenterPad_DPadNorth :: 271;
    k_EControllerActionOrigin_PS5_CenterPad_DPadSouth :: 272;
    k_EControllerActionOrigin_PS5_CenterPad_DPadWest :: 273;
    k_EControllerActionOrigin_PS5_CenterPad_DPadEast :: 274;
    k_EControllerActionOrigin_PS5_LeftTrigger_Pull :: 275;
    k_EControllerActionOrigin_PS5_LeftTrigger_Click :: 276;
    k_EControllerActionOrigin_PS5_RightTrigger_Pull :: 277;
    k_EControllerActionOrigin_PS5_RightTrigger_Click :: 278;
    k_EControllerActionOrigin_PS5_LeftStick_Move :: 279;
    k_EControllerActionOrigin_PS5_LeftStick_Click :: 280;
    k_EControllerActionOrigin_PS5_LeftStick_DPadNorth :: 281;
    k_EControllerActionOrigin_PS5_LeftStick_DPadSouth :: 282;
    k_EControllerActionOrigin_PS5_LeftStick_DPadWest :: 283;
    k_EControllerActionOrigin_PS5_LeftStick_DPadEast :: 284;
    k_EControllerActionOrigin_PS5_RightStick_Move :: 285;
    k_EControllerActionOrigin_PS5_RightStick_Click :: 286;
    k_EControllerActionOrigin_PS5_RightStick_DPadNorth :: 287;
    k_EControllerActionOrigin_PS5_RightStick_DPadSouth :: 288;
    k_EControllerActionOrigin_PS5_RightStick_DPadWest :: 289;
    k_EControllerActionOrigin_PS5_RightStick_DPadEast :: 290;
    k_EControllerActionOrigin_PS5_DPad_Move :: 291;
    k_EControllerActionOrigin_PS5_DPad_North :: 292;
    k_EControllerActionOrigin_PS5_DPad_South :: 293;
    k_EControllerActionOrigin_PS5_DPad_West :: 294;
    k_EControllerActionOrigin_PS5_DPad_East :: 295;
    k_EControllerActionOrigin_PS5_Gyro_Move :: 296;
    k_EControllerActionOrigin_PS5_Gyro_Pitch :: 297;
    k_EControllerActionOrigin_PS5_Gyro_Yaw :: 298;
    k_EControllerActionOrigin_PS5_Gyro_Roll :: 299;
    k_EControllerActionOrigin_Count :: 300;
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

EItemState :: enum_flags u32 {
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
    k_ESteamNetworkingIdentityType_SonyPSN :: 18;
    k_ESteamNetworkingIdentityType_GoogleStadia :: 19;
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
    k_ESteamNetworkingConfig_Callback_CreateConnectionSignaling :: 206;
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

SteamIPAddress_t :: struct {
    union {
        m_rgubIPv6 : [16] uint8 ;
        RgubIPv6 : [16] uint8 ;
    }
    union {
        m_eType : ESteamIPType;
        Type : ESteamIPType;
    }
}

FriendGameInfo_t :: struct {
    union {
        m_gameID : CGameID;
        GameID : CGameID;
    }
    union {
        m_unGameIP : uint32;
        GameIP : uint32;
    }
    union {
        m_usGamePort : uint16;
        GamePort : uint16;
    }
    union {
        m_usQueryPort : uint16;
        QueryPort : uint16;
    }
    union {
        m_steamIDLobby : CSteamID;
        SteamIDLobby : CSteamID;
    }
}

MatchMakingKeyValuePair_t :: struct {
    union {
        m_szKey : [256] char ;
        Key : [256] char ;
    }
    union {
        m_szValue : [256] char ;
        Value : [256] char ;
    }
}

servernetadr_t :: struct {
    union {
        m_usConnectionPort : uint16;
        ConnectionPort : uint16;
    }
    union {
        m_usQueryPort : uint16;
        QueryPort : uint16;
    }
    union {
        m_unIP : uint32;
        IP : uint32;
    }
}

gameserveritem_t :: struct {
    union {
        m_NetAdr : servernetadr_t;
        NetAdr : servernetadr_t;
    }
    union {
        m_nPing : s32;
        Ping : s32;
    }
    union {
        m_bHadSuccessfulResponse : bool;
        HadSuccessfulResponse : bool;
    }
    union {
        m_bDoNotRefresh : bool;
        DoNotRefresh : bool;
    }
    union {
        m_szGameDir : [32] char ;
        GameDir : [32] char ;
    }
    union {
        m_szMap : [32] char ;
        Map : [32] char ;
    }
    union {
        m_szGameDescription : [64] char ;
        GameDescription : [64] char ;
    }
    union {
        m_nAppID : uint32;
        AppID : uint32;
    }
    union {
        m_nPlayers : s32;
        Players : s32;
    }
    union {
        m_nMaxPlayers : s32;
        MaxPlayers : s32;
    }
    union {
        m_nBotPlayers : s32;
        BotPlayers : s32;
    }
    union {
        m_bPassword : bool;
        Password : bool;
    }
    union {
        m_bSecure : bool;
        Secure : bool;
    }
    union {
        m_ulTimeLastPlayed : uint32;
        TimeLastPlayed : uint32;
    }
    union {
        m_nServerVersion : s32;
        ServerVersion : s32;
    }
    union {
        m_szServerName : [64] char ;
        ServerName : [64] char ;
    }
    union {
        m_szGameTags : [128] char ;
        GameTags : [128] char ;
    }
    union {
        m_steamID : CSteamID;
        SteamID : CSteamID;
    }
}

SteamPartyBeaconLocation_t :: struct {
    union {
        m_eType : ESteamPartyBeaconLocationType;
        Type : ESteamPartyBeaconLocationType;
    }
    union {
        m_ulLocationID : uint64;
        LocationID : uint64;
    }
}

SteamParamStringArray_t :: struct {
    union {
        m_ppStrings : **char ;
        Strings : **char ;
    }
    union {
        m_nNumStrings : int32;
        NumStrings : int32;
    }
}

LeaderboardEntry_t :: struct {
    union {
        m_steamIDUser : CSteamID;
        SteamIDUser : CSteamID;
    }
    union {
        m_nGlobalRank : int32;
        GlobalRank : int32;
    }
    union {
        m_nScore : int32;
        Score : int32;
    }
    union {
        m_cDetails : int32;
        Details : int32;
    }
    union {
        m_hUGC : UGCHandle_t;
        UGC : UGCHandle_t;
    }
}

P2PSessionState_t :: struct {
    union {
        m_bConnectionActive : uint8;
        ConnectionActive : uint8;
    }
    union {
        m_bConnecting : uint8;
        Connecting : uint8;
    }
    union {
        m_eP2PSessionError : uint8;
        P2PSessionError : uint8;
    }
    union {
        m_bUsingRelay : uint8;
        UsingRelay : uint8;
    }
    union {
        m_nBytesQueuedForSend : int32;
        BytesQueuedForSend : int32;
    }
    union {
        m_nPacketsQueuedForSend : int32;
        PacketsQueuedForSend : int32;
    }
    union {
        m_nRemoteIP : uint32;
        RemoteIP : uint32;
    }
    union {
        m_nRemotePort : uint16;
        RemotePort : uint16;
    }
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
    union {
        m_nPublishedFileId : PublishedFileId_t;
        PublishedFileId : PublishedFileId_t;
    }
    union {
        m_eResult : EResult;
        Result : EResult;
    }
    union {
        m_eFileType : EWorkshopFileType;
        FileType : EWorkshopFileType;
    }
    union {
        m_nCreatorAppID : AppId_t;
        CreatorAppID : AppId_t;
    }
    union {
        m_nConsumerAppID : AppId_t;
        ConsumerAppID : AppId_t;
    }
    union {
        m_rgchTitle : [129] char ;
        RgchTitle : [129] char ;
    }
    union {
        m_rgchDescription : [8000] char ;
        RgchDescription : [8000] char ;
    }
    union {
        m_ulSteamIDOwner : uint64;
        SteamIDOwner : uint64;
    }
    union {
        m_rtimeCreated : uint32;
        RtimeCreated : uint32;
    }
    union {
        m_rtimeUpdated : uint32;
        RtimeUpdated : uint32;
    }
    union {
        m_rtimeAddedToUserList : uint32;
        RtimeAddedToUserList : uint32;
    }
    union {
        m_eVisibility : ERemoteStoragePublishedFileVisibility;
        Visibility : ERemoteStoragePublishedFileVisibility;
    }
    union {
        m_bBanned : bool;
        Banned : bool;
    }
    union {
        m_bAcceptedForUse : bool;
        AcceptedForUse : bool;
    }
    union {
        m_bTagsTruncated : bool;
        TagsTruncated : bool;
    }
    union {
        m_rgchTags : [1025] char ;
        RgchTags : [1025] char ;
    }
    union {
        m_hFile : UGCHandle_t;
        File : UGCHandle_t;
    }
    union {
        m_hPreviewFile : UGCHandle_t;
        PreviewFile : UGCHandle_t;
    }
    union {
        m_pchFileName : [260] char ;
        FileName : [260] char ;
    }
    union {
        m_nFileSize : int32;
        FileSize : int32;
    }
    union {
        m_nPreviewFileSize : int32;
        PreviewFileSize : int32;
    }
    union {
        m_rgchURL : [256] char ;
        RgchURL : [256] char ;
    }
    union {
        m_unVotesUp : uint32;
        VotesUp : uint32;
    }
    union {
        m_unVotesDown : uint32;
        VotesDown : uint32;
    }
    union {
        m_flScore : float;
        Score : float;
    }
    union {
        m_unNumChildren : uint32;
        NumChildren : uint32;
    }
}

SteamItemDetails_t :: struct {
    union {
        m_itemId : SteamItemInstanceID_t;
        ItemId : SteamItemInstanceID_t;
    }
    union {
        m_iDefinition : SteamItemDef_t;
        Definition : SteamItemDef_t;
    }
    union {
        m_unQuantity : uint16;
        Quantity : uint16;
    }
    union {
        m_unFlags : uint16;
        Flags : uint16;
    }
}

SteamNetworkingIPAddr :: struct {
    m_ipv6 : [16] uint8 ;
    m_port : uint16;
}

SteamNetworkingIdentity :: struct {
    union {
        m_eType : ESteamNetworkingIdentityType;
        Type : ESteamNetworkingIdentityType;
    }
    union {
        m_cbSize : s32;
        Size : s32;
    }
    union {
        m_szUnknownRawString : [128] char ;
        UnknownRawString : [128] char ;
    }
}

SteamNetConnectionInfo_t :: struct {
    union {
        m_identityRemote : SteamNetworkingIdentity;
        IdentityRemote : SteamNetworkingIdentity;
    }
    union {
        m_nUserData : int64;
        UserData : int64;
    }
    union {
        m_hListenSocket : HSteamListenSocket;
        ListenSocket : HSteamListenSocket;
    }
    union {
        m_addrRemote : SteamNetworkingIPAddr;
        AddrRemote : SteamNetworkingIPAddr;
    }
    m__pad1 : uint16;
    union {
        m_idPOPRemote : SteamNetworkingPOPID;
        POPRemote : SteamNetworkingPOPID;
    }
    union {
        m_idPOPRelay : SteamNetworkingPOPID;
        POPRelay : SteamNetworkingPOPID;
    }
    union {
        m_eState : ESteamNetworkingConnectionState;
        State : ESteamNetworkingConnectionState;
    }
    union {
        m_eEndReason : s32;
        EndReason : s32;
    }
    union {
        m_szEndDebug : [128] char ;
        EndDebug : [128] char ;
    }
    union {
        m_szConnectionDescription : [128] char ;
        ConnectionDescription : [128] char ;
    }
    union {
        m_eTransportKind : ESteamNetTransportKind;
        TransportKind : ESteamNetTransportKind;
    }
    reserved : [63] uint32 ;
}

SteamNetworkingQuickConnectionStatus :: struct {
    union {
        m_eState : ESteamNetworkingConnectionState;
        State : ESteamNetworkingConnectionState;
    }
    union {
        m_nPing : s32;
        Ping : s32;
    }
    union {
        m_flConnectionQualityLocal : float;
        ConnectionQualityLocal : float;
    }
    union {
        m_flConnectionQualityRemote : float;
        ConnectionQualityRemote : float;
    }
    union {
        m_flOutPacketsPerSec : float;
        OutPacketsPerSec : float;
    }
    union {
        m_flOutBytesPerSec : float;
        OutBytesPerSec : float;
    }
    union {
        m_flInPacketsPerSec : float;
        InPacketsPerSec : float;
    }
    union {
        m_flInBytesPerSec : float;
        InBytesPerSec : float;
    }
    union {
        m_nSendRateBytesPerSecond : s32;
        SendRateBytesPerSecond : s32;
    }
    union {
        m_cbPendingUnreliable : s32;
        PendingUnreliable : s32;
    }
    union {
        m_cbPendingReliable : s32;
        PendingReliable : s32;
    }
    union {
        m_cbSentUnackedReliable : s32;
        SentUnackedReliable : s32;
    }
    union {
        m_usecQueueTime : SteamNetworkingMicroseconds;
        UsecQueueTime : SteamNetworkingMicroseconds;
    }
    reserved : [16] uint32 ;
}

SteamNetworkingMessage_t :: struct {
    union {
        m_pData : *void ;
        Data : *void ;
    }
    union {
        m_cbSize : s32;
        Size : s32;
    }
    m_conn : HSteamNetConnection;
    union {
        m_identityPeer : SteamNetworkingIdentity;
        IdentityPeer : SteamNetworkingIdentity;
    }
    union {
        m_nConnUserData : int64;
        ConnUserData : int64;
    }
    union {
        m_usecTimeReceived : SteamNetworkingMicroseconds;
        UsecTimeReceived : SteamNetworkingMicroseconds;
    }
    union {
        m_nMessageNumber : int64;
        MessageNumber : int64;
    }
    union {
        m_pfnFreeData : *void;
        FreeData : *void;
    }
    union {
        m_pfnRelease : *void;
        Release : *void;
    }
    union {
        m_nChannel : s32;
        Channel : s32;
    }
    union {
        m_nFlags : s32;
        Flags : s32;
    }
    union {
        m_nUserData : int64;
        UserData : int64;
    }
}

SteamNetworkPingLocation_t :: struct {
    m_data : [512] uint8 ;
}

SteamNetworkingConfigValue_t :: struct {
    union {
        m_eValue : ESteamNetworkingConfigValue;
        Value : ESteamNetworkingConfigValue;
    }
    union {
        m_eDataType : ESteamNetworkingConfigDataType;
        DataType : ESteamNetworkingConfigDataType;
    }
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
    union {
        m_cbSize : s32;
        Size : s32;
    }
    m_data : [128] char ;
}

SteamDatagramGameCoordinatorServerLogin :: struct {
    m_identity : SteamNetworkingIdentity;
    m_routing : SteamDatagramHostedAddress;
    union {
        m_nAppID : AppId_t;
        AppID : AppId_t;
    }
    m_rtime : RTime32;
    union {
        m_cbAppData : s32;
        AppData : s32;
    }
    union {
        m_appData : [2048] char ;
        Data : [2048] char ;
    }
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

EHTMLKeyModifiers :: enum_flags u32 {
    k_eHTMLKeyModifier_None :: 0;
    k_eHTMLKeyModifier_AltDown :: 1;
    k_eHTMLKeyModifier_CtrlDown :: 2;
    k_eHTMLKeyModifier_ShiftDown :: 4;
}
ISteamHTMLSurface :: struct {};
ISteamInventory :: struct {};
ISteamVideo :: struct {};
ISteamParentalSettings :: struct {};
ISteamRemotePlay :: struct {};
ISteamNetworkingMessages :: struct {};
ISteamNetworkingSockets :: struct {};
ISteamNetworkingUtils :: struct {};
ISteamGameServer :: struct {};
ISteamGameServerStats :: struct {};
ISteamNetworkingConnectionSignaling :: struct {}
ISteamNetworkingSignalingRecvContext :: struct {}
