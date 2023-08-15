#scope_module


run_callbacks :: (steam_pipe: HSteamPipe, is_server: bool) {
	SteamAPI_ManualDispatch_RunFrame(steam_pipe);

	callback: CallbackMsg_t;
	while SteamAPI_ManualDispatch_GetNextCallback(steam_pipe, *callback) {
		defer SteamAPI_ManualDispatch_FreeLastCallback(steam_pipe);

		if callback.m_iCallback == SteamAPICallCompleted_t.k_iCallback { // is a call result
			completed_call_result := cast(*SteamAPICallCompleted_t) callback.m_pubParam;
			call_result : *void;
            call_result_size := completed_call_result.m_cubParam;
			#if use_temporary_storage
				call_result = talloc(call_result_size);
			else
				call_result = alloc(call_result_size);

            #if verbose
                log("Received CallResult: [%] %...", completed_call_result.m_iCallback, completed_call_result.m_hAsyncCall);

			io_failure := false;
			if SteamAPI_ManualDispatch_GetAPICallResult(
				steam_pipe, completed_call_result.m_hAsyncCall, call_result, call_result_size, completed_call_result.m_iCallback, *io_failure)
			{
                #if verbose  log("Successfully got CallResult data");
                call_result_id := cast(CallResultID) completed_call_result.m_iCallback;
                if #complete call_result_id == {
                    case .StoreAuthURLResponse_t;  run_call_results(CallResults.StoreAuthURLResponse_t, completed_call_result.m_hAsyncCall, cast(*StoreAuthURLResponse_t) call_result, io_failure);
                    case .RemoteStorageDeletePublishedFileResult_t;  run_call_results(CallResults.RemoteStorageDeletePublishedFileResult_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageDeletePublishedFileResult_t) call_result, io_failure);
                    case .RemoteStorageSubscribePublishedFileResult_t;  run_call_results(CallResults.RemoteStorageSubscribePublishedFileResult_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageSubscribePublishedFileResult_t) call_result, io_failure);
                    case .EncryptedAppTicketResponse_t;  run_call_results(CallResults.EncryptedAppTicketResponse_t, completed_call_result.m_hAsyncCall, cast(*EncryptedAppTicketResponse_t) call_result, io_failure);
                    case .CreateItemResult_t;  run_call_results(CallResults.CreateItemResult_t, completed_call_result.m_hAsyncCall, cast(*CreateItemResult_t) call_result, io_failure);
                    case .LobbyMatchList_t;  run_call_results(CallResults.LobbyMatchList_t, completed_call_result.m_hAsyncCall, cast(*LobbyMatchList_t) call_result, io_failure);
                    case .DownloadClanActivityCountsResult_t;  run_call_results(CallResults.DownloadClanActivityCountsResult_t, completed_call_result.m_hAsyncCall, cast(*DownloadClanActivityCountsResult_t) call_result, io_failure);
                    case .RemoteStorageFileReadAsyncComplete_t;  run_call_results(CallResults.RemoteStorageFileReadAsyncComplete_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageFileReadAsyncComplete_t) call_result, io_failure);
                    case .RemoteStorageEnumeratePublishedFilesByUserActionResult_t;  run_call_results(CallResults.RemoteStorageEnumeratePublishedFilesByUserActionResult_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageEnumeratePublishedFilesByUserActionResult_t) call_result, io_failure);
                    case .LobbyCreated_t;  run_call_results(CallResults.LobbyCreated_t, completed_call_result.m_hAsyncCall, cast(*LobbyCreated_t) call_result, io_failure);
                    case .GlobalStatsReceived_t;  run_call_results(CallResults.GlobalStatsReceived_t, completed_call_result.m_hAsyncCall, cast(*GlobalStatsReceived_t) call_result, io_failure);
                    case .RemoteStorageEnumerateWorkshopFilesResult_t;  run_call_results(CallResults.RemoteStorageEnumerateWorkshopFilesResult_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageEnumerateWorkshopFilesResult_t) call_result, io_failure);
                    case .SetPersonaNameResponse_t;  run_call_results(CallResults.SetPersonaNameResponse_t, completed_call_result.m_hAsyncCall, cast(*SetPersonaNameResponse_t) call_result, io_failure);
                    case .StopPlaytimeTrackingResult_t;  run_call_results(CallResults.StopPlaytimeTrackingResult_t, completed_call_result.m_hAsyncCall, cast(*StopPlaytimeTrackingResult_t) call_result, io_failure);
                    case .NumberOfCurrentPlayers_t;  run_call_results(CallResults.NumberOfCurrentPlayers_t, completed_call_result.m_hAsyncCall, cast(*NumberOfCurrentPlayers_t) call_result, io_failure);
                    case .ChangeNumOpenSlotsCallback_t;  run_call_results(CallResults.ChangeNumOpenSlotsCallback_t, completed_call_result.m_hAsyncCall, cast(*ChangeNumOpenSlotsCallback_t) call_result, io_failure);
                    case .RemoveAppDependencyResult_t;  run_call_results(CallResults.RemoveAppDependencyResult_t, completed_call_result.m_hAsyncCall, cast(*RemoveAppDependencyResult_t) call_result, io_failure);
                    case .UserFavoriteItemsListChanged_t;  run_call_results(CallResults.UserFavoriteItemsListChanged_t, completed_call_result.m_hAsyncCall, cast(*UserFavoriteItemsListChanged_t) call_result, io_failure);
                    case .SteamInventoryRequestPricesResult_t;  run_call_results(CallResults.SteamInventoryRequestPricesResult_t, completed_call_result.m_hAsyncCall, cast(*SteamInventoryRequestPricesResult_t) call_result, io_failure);
                    case .AddAppDependencyResult_t;  run_call_results(CallResults.AddAppDependencyResult_t, completed_call_result.m_hAsyncCall, cast(*AddAppDependencyResult_t) call_result, io_failure);
                    case .LeaderboardFindResult_t;  run_call_results(CallResults.LeaderboardFindResult_t, completed_call_result.m_hAsyncCall, cast(*LeaderboardFindResult_t) call_result, io_failure);
                    case .RemoteStorageDownloadUGCResult_t;  run_call_results(CallResults.RemoteStorageDownloadUGCResult_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageDownloadUGCResult_t) call_result, io_failure);
                    case .CheckFileSignature_t;  run_call_results(CallResults.CheckFileSignature_t, completed_call_result.m_hAsyncCall, cast(*CheckFileSignature_t) call_result, io_failure);
                    case .RemoteStorageGetPublishedFileDetailsResult_t;  run_call_results(CallResults.RemoteStorageGetPublishedFileDetailsResult_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageGetPublishedFileDetailsResult_t) call_result, io_failure);
                    case .FileDetailsResult_t;  run_call_results(CallResults.FileDetailsResult_t, completed_call_result.m_hAsyncCall, cast(*FileDetailsResult_t) call_result, io_failure);
                    case .ComputeNewPlayerCompatibilityResult_t;  run_call_results(CallResults.ComputeNewPlayerCompatibilityResult_t, completed_call_result.m_hAsyncCall, cast(*ComputeNewPlayerCompatibilityResult_t) call_result, io_failure);
                    case .RemoteStorageSetUserPublishedFileActionResult_t;  run_call_results(CallResults.RemoteStorageSetUserPublishedFileActionResult_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageSetUserPublishedFileActionResult_t) call_result, io_failure);
                    case .RemoteStorageEnumerateUserPublishedFilesResult_t;  run_call_results(CallResults.RemoteStorageEnumerateUserPublishedFilesResult_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageEnumerateUserPublishedFilesResult_t) call_result, io_failure);
                    case .RemoteStorageUnsubscribePublishedFileResult_t;  run_call_results(CallResults.RemoteStorageUnsubscribePublishedFileResult_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageUnsubscribePublishedFileResult_t) call_result, io_failure);
                    case .RemoteStoragePublishFileProgress_t;  run_call_results(CallResults.RemoteStoragePublishFileProgress_t, completed_call_result.m_hAsyncCall, cast(*RemoteStoragePublishFileProgress_t) call_result, io_failure);
                    case .CreateBeaconCallback_t;  run_call_results(CallResults.CreateBeaconCallback_t, completed_call_result.m_hAsyncCall, cast(*CreateBeaconCallback_t) call_result, io_failure);
                    case .HTML_BrowserReady_t;  run_call_results(CallResults.HTML_BrowserReady_t, completed_call_result.m_hAsyncCall, cast(*HTML_BrowserReady_t) call_result, io_failure);
                    case .MarketEligibilityResponse_t;  run_call_results(CallResults.MarketEligibilityResponse_t, completed_call_result.m_hAsyncCall, cast(*MarketEligibilityResponse_t) call_result, io_failure);
                    case .RemoteStorageUpdatePublishedFileResult_t;  run_call_results(CallResults.RemoteStorageUpdatePublishedFileResult_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageUpdatePublishedFileResult_t) call_result, io_failure);
                    case .UserStatsReceived_t;  run_call_results(CallResults.UserStatsReceived_t, completed_call_result.m_hAsyncCall, cast(*UserStatsReceived_t) call_result, io_failure);
                    case .JoinClanChatRoomCompletionResult_t;  run_call_results(CallResults.JoinClanChatRoomCompletionResult_t, completed_call_result.m_hAsyncCall, cast(*JoinClanChatRoomCompletionResult_t) call_result, io_failure);
                    case .GlobalAchievementPercentagesReady_t;  run_call_results(CallResults.GlobalAchievementPercentagesReady_t, completed_call_result.m_hAsyncCall, cast(*GlobalAchievementPercentagesReady_t) call_result, io_failure);
                    case .AssociateWithClanResult_t;  run_call_results(CallResults.AssociateWithClanResult_t, completed_call_result.m_hAsyncCall, cast(*AssociateWithClanResult_t) call_result, io_failure);
                    case .GetAppDependenciesResult_t;  run_call_results(CallResults.GetAppDependenciesResult_t, completed_call_result.m_hAsyncCall, cast(*GetAppDependenciesResult_t) call_result, io_failure);
                    case .FriendsIsFollowing_t;  run_call_results(CallResults.FriendsIsFollowing_t, completed_call_result.m_hAsyncCall, cast(*FriendsIsFollowing_t) call_result, io_failure);
                    case .SteamUGCRequestUGCDetailsResult_t;  run_call_results(CallResults.SteamUGCRequestUGCDetailsResult_t, completed_call_result.m_hAsyncCall, cast(*SteamUGCRequestUGCDetailsResult_t) call_result, io_failure);
                    case .ClanOfficerListResponse_t;  run_call_results(CallResults.ClanOfficerListResponse_t, completed_call_result.m_hAsyncCall, cast(*ClanOfficerListResponse_t) call_result, io_failure);
                    case .FriendsEnumerateFollowingList_t;  run_call_results(CallResults.FriendsEnumerateFollowingList_t, completed_call_result.m_hAsyncCall, cast(*FriendsEnumerateFollowingList_t) call_result, io_failure);
                    case .RemoteStorageGetPublishedItemVoteDetailsResult_t;  run_call_results(CallResults.RemoteStorageGetPublishedItemVoteDetailsResult_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageGetPublishedItemVoteDetailsResult_t) call_result, io_failure);
                    case .LobbyEnter_t;  run_call_results(CallResults.LobbyEnter_t, completed_call_result.m_hAsyncCall, cast(*LobbyEnter_t) call_result, io_failure);
                    case .SteamUGCQueryCompleted_t;  run_call_results(CallResults.SteamUGCQueryCompleted_t, completed_call_result.m_hAsyncCall, cast(*SteamUGCQueryCompleted_t) call_result, io_failure);
                    case .GSReputation_t;  run_call_results(CallResults.GSReputation_t, completed_call_result.m_hAsyncCall, cast(*GSReputation_t) call_result, io_failure);
                    case .FriendsGetFollowerCount_t;  run_call_results(CallResults.FriendsGetFollowerCount_t, completed_call_result.m_hAsyncCall, cast(*FriendsGetFollowerCount_t) call_result, io_failure);
                    case .SteamInventoryEligiblePromoItemDefIDs_t;  run_call_results(CallResults.SteamInventoryEligiblePromoItemDefIDs_t, completed_call_result.m_hAsyncCall, cast(*SteamInventoryEligiblePromoItemDefIDs_t) call_result, io_failure);
                    case .SteamInventoryStartPurchaseResult_t;  run_call_results(CallResults.SteamInventoryStartPurchaseResult_t, completed_call_result.m_hAsyncCall, cast(*SteamInventoryStartPurchaseResult_t) call_result, io_failure);
                    case .RemoteStorageFileShareResult_t;  run_call_results(CallResults.RemoteStorageFileShareResult_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageFileShareResult_t) call_result, io_failure);
                    case .RemoveUGCDependencyResult_t;  run_call_results(CallResults.RemoveUGCDependencyResult_t, completed_call_result.m_hAsyncCall, cast(*RemoveUGCDependencyResult_t) call_result, io_failure);
                    case .StartPlaytimeTrackingResult_t;  run_call_results(CallResults.StartPlaytimeTrackingResult_t, completed_call_result.m_hAsyncCall, cast(*StartPlaytimeTrackingResult_t) call_result, io_failure);
                    case .GSStatsReceived_t;  run_call_results(CallResults.GSStatsReceived_t, completed_call_result.m_hAsyncCall, cast(*GSStatsReceived_t) call_result, io_failure);
                    case .GSStatsStored_t;  run_call_results(CallResults.GSStatsStored_t, completed_call_result.m_hAsyncCall, cast(*GSStatsStored_t) call_result, io_failure);
                    case .SubmitItemUpdateResult_t;  run_call_results(CallResults.SubmitItemUpdateResult_t, completed_call_result.m_hAsyncCall, cast(*SubmitItemUpdateResult_t) call_result, io_failure);
                    case .GetUserItemVoteResult_t;  run_call_results(CallResults.GetUserItemVoteResult_t, completed_call_result.m_hAsyncCall, cast(*GetUserItemVoteResult_t) call_result, io_failure);
                    case .LeaderboardScoreUploaded_t;  run_call_results(CallResults.LeaderboardScoreUploaded_t, completed_call_result.m_hAsyncCall, cast(*LeaderboardScoreUploaded_t) call_result, io_failure);
                    case .RemoteStorageEnumerateUserSubscribedFilesResult_t;  run_call_results(CallResults.RemoteStorageEnumerateUserSubscribedFilesResult_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageEnumerateUserSubscribedFilesResult_t) call_result, io_failure);
                    case .JoinPartyCallback_t;  run_call_results(CallResults.JoinPartyCallback_t, completed_call_result.m_hAsyncCall, cast(*JoinPartyCallback_t) call_result, io_failure);
                    case .AddUGCDependencyResult_t;  run_call_results(CallResults.AddUGCDependencyResult_t, completed_call_result.m_hAsyncCall, cast(*AddUGCDependencyResult_t) call_result, io_failure);
                    case .LeaderboardScoresDownloaded_t;  run_call_results(CallResults.LeaderboardScoresDownloaded_t, completed_call_result.m_hAsyncCall, cast(*LeaderboardScoresDownloaded_t) call_result, io_failure);
                    case .DeleteItemResult_t;  run_call_results(CallResults.DeleteItemResult_t, completed_call_result.m_hAsyncCall, cast(*DeleteItemResult_t) call_result, io_failure);
                    case .RemoteStorageFileWriteAsyncComplete_t;  run_call_results(CallResults.RemoteStorageFileWriteAsyncComplete_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageFileWriteAsyncComplete_t) call_result, io_failure);
                    case .SetUserItemVoteResult_t;  run_call_results(CallResults.SetUserItemVoteResult_t, completed_call_result.m_hAsyncCall, cast(*SetUserItemVoteResult_t) call_result, io_failure);
                    case .DurationControl_t;  run_call_results(CallResults.DurationControl_t, completed_call_result.m_hAsyncCall, cast(*DurationControl_t) call_result, io_failure);
                    case .RemoteStorageUpdateUserPublishedItemVoteResult_t;  run_call_results(CallResults.RemoteStorageUpdateUserPublishedItemVoteResult_t, completed_call_result.m_hAsyncCall, cast(*RemoteStorageUpdateUserPublishedItemVoteResult_t) call_result, io_failure);
                    case .LeaderboardUGCSet_t;  run_call_results(CallResults.LeaderboardUGCSet_t, completed_call_result.m_hAsyncCall, cast(*LeaderboardUGCSet_t) call_result, io_failure);
                }
			}
            else {
                #if verbose  log("Failed to get CallResult data");
            }

			#if !use_temporary_storage  free(call_result);
		}
		else {
            callback_id := cast(CallbackID) callback.m_iCallback;
			if #complete callback_id == {
                case .UserStatsUnloaded_t;
                if is_server  for Callbacks.GSStatsUnloaded_t    it(<<cast(*GSStatsUnloaded_t) callback.m_pubParam);
                else          for Callbacks.UserStatsUnloaded_t  it(<<cast(*UserStatsUnloaded_t) callback.m_pubParam);

                case .StoreAuthURLResponse_t;  for Callbacks.StoreAuthURLResponse_t  it(<<cast(*StoreAuthURLResponse_t) callback.m_pubParam);
                case .RemoteStorageSubscribePublishedFileResult_t;  for Callbacks.RemoteStorageSubscribePublishedFileResult_t  it(<<cast(*RemoteStorageSubscribePublishedFileResult_t) callback.m_pubParam);
                case .SteamServerConnectFailure_t;  for Callbacks.SteamServerConnectFailure_t  it(<<cast(*SteamServerConnectFailure_t) callback.m_pubParam);
                case .EncryptedAppTicketResponse_t;  for Callbacks.EncryptedAppTicketResponse_t  it(<<cast(*EncryptedAppTicketResponse_t) callback.m_pubParam);
                case .HTML_OpenLinkInNewTab_t;  for Callbacks.HTML_OpenLinkInNewTab_t  it(<<cast(*HTML_OpenLinkInNewTab_t) callback.m_pubParam);
                case .GSClientApprove_t;  for Callbacks.GSClientApprove_t  it(<<cast(*GSClientApprove_t) callback.m_pubParam);
                case .LobbyMatchList_t;  for Callbacks.LobbyMatchList_t  it(<<cast(*LobbyMatchList_t) callback.m_pubParam);
                case .RemoteStorageFileReadAsyncComplete_t;  for Callbacks.RemoteStorageFileReadAsyncComplete_t  it(<<cast(*RemoteStorageFileReadAsyncComplete_t) callback.m_pubParam);
                case .RemoteStoragePublishFileResult_t;  for Callbacks.RemoteStoragePublishFileResult_t  it(<<cast(*RemoteStoragePublishFileResult_t) callback.m_pubParam);
                case .SetPersonaNameResponse_t;  for Callbacks.SetPersonaNameResponse_t  it(<<cast(*SetPersonaNameResponse_t) callback.m_pubParam);
                case .AppProofOfPurchaseKeyResponse_t;  for Callbacks.AppProofOfPurchaseKeyResponse_t  it(<<cast(*AppProofOfPurchaseKeyResponse_t) callback.m_pubParam);
                case .UserAchievementIconFetched_t;  for Callbacks.UserAchievementIconFetched_t  it(<<cast(*UserAchievementIconFetched_t) callback.m_pubParam);
                case .MusicPlayerWillQuit_t;  for Callbacks.MusicPlayerWillQuit_t  it(<<cast(*MusicPlayerWillQuit_t) callback.m_pubParam);
                case .RemoveAppDependencyResult_t;  for Callbacks.RemoveAppDependencyResult_t  it(<<cast(*RemoveAppDependencyResult_t) callback.m_pubParam);
                case .SteamServersConnected_t;  for Callbacks.SteamServersConnected_t  it(<<cast(*SteamServersConnected_t) callback.m_pubParam);
                case .SteamInventoryRequestPricesResult_t;  for Callbacks.SteamInventoryRequestPricesResult_t  it(<<cast(*SteamInventoryRequestPricesResult_t) callback.m_pubParam);
                case .MicroTxnAuthorizationResponse_t;  for Callbacks.MicroTxnAuthorizationResponse_t  it(<<cast(*MicroTxnAuthorizationResponse_t) callback.m_pubParam);
                case .ValidateAuthTicketResponse_t;  for Callbacks.ValidateAuthTicketResponse_t  it(<<cast(*ValidateAuthTicketResponse_t) callback.m_pubParam);
                case .GameConnectedChatJoin_t;  for Callbacks.GameConnectedChatJoin_t  it(<<cast(*GameConnectedChatJoin_t) callback.m_pubParam);
                case .PersonaStateChange_t;  for Callbacks.PersonaStateChange_t  it(<<cast(*PersonaStateChange_t) callback.m_pubParam);
                case .SteamRelayNetworkStatus_t;  for Callbacks.SteamRelayNetworkStatus_t  it(<<cast(*SteamRelayNetworkStatus_t) callback.m_pubParam);
                case .FileDetailsResult_t;  for Callbacks.FileDetailsResult_t  it(<<cast(*FileDetailsResult_t) callback.m_pubParam);
                case .RemoteStorageEnumerateUserPublishedFilesResult_t;  for Callbacks.RemoteStorageEnumerateUserPublishedFilesResult_t  it(<<cast(*RemoteStorageEnumerateUserPublishedFilesResult_t) callback.m_pubParam);
                case .LowBatteryPower_t;  for Callbacks.LowBatteryPower_t  it(<<cast(*LowBatteryPower_t) callback.m_pubParam);
                case .CreateBeaconCallback_t;  for Callbacks.CreateBeaconCallback_t  it(<<cast(*CreateBeaconCallback_t) callback.m_pubParam);
                case .RemoteStorageUpdatePublishedFileResult_t;  for Callbacks.RemoteStorageUpdatePublishedFileResult_t  it(<<cast(*RemoteStorageUpdatePublishedFileResult_t) callback.m_pubParam);
                case .JoinClanChatRoomCompletionResult_t;  for Callbacks.JoinClanChatRoomCompletionResult_t  it(<<cast(*JoinClanChatRoomCompletionResult_t) callback.m_pubParam);
                case .AssociateWithClanResult_t;  for Callbacks.AssociateWithClanResult_t  it(<<cast(*AssociateWithClanResult_t) callback.m_pubParam);
                case .HTML_URLChanged_t;  for Callbacks.HTML_URLChanged_t  it(<<cast(*HTML_URLChanged_t) callback.m_pubParam);
                case .ClanOfficerListResponse_t;  for Callbacks.ClanOfficerListResponse_t  it(<<cast(*ClanOfficerListResponse_t) callback.m_pubParam);
                case .FriendsEnumerateFollowingList_t;  for Callbacks.FriendsEnumerateFollowingList_t  it(<<cast(*FriendsEnumerateFollowingList_t) callback.m_pubParam);
                case .UnreadChatMessagesChanged_t;  for Callbacks.UnreadChatMessagesChanged_t  it(<<cast(*UnreadChatMessagesChanged_t) callback.m_pubParam);
                case .RemoteStoragePublishedFileDeleted_t;  for Callbacks.RemoteStoragePublishedFileDeleted_t  it(<<cast(*RemoteStoragePublishedFileDeleted_t) callback.m_pubParam);
                case .SteamNetworkingMessagesSessionRequest_t;  for Callbacks.SteamNetworkingMessagesSessionRequest_t  it(<<cast(*SteamNetworkingMessagesSessionRequest_t) callback.m_pubParam);
                case .LobbyEnter_t;  for Callbacks.LobbyEnter_t  it(<<cast(*LobbyEnter_t) callback.m_pubParam);
                case .MusicPlayerWantsPlayPrevious_t;  for Callbacks.MusicPlayerWantsPlayPrevious_t  it(<<cast(*MusicPlayerWantsPlayPrevious_t) callback.m_pubParam);
                case .SubmitItemUpdateResult_t;  for Callbacks.SubmitItemUpdateResult_t  it(<<cast(*SubmitItemUpdateResult_t) callback.m_pubParam);
                case .GetUserItemVoteResult_t;  for Callbacks.GetUserItemVoteResult_t  it(<<cast(*GetUserItemVoteResult_t) callback.m_pubParam);
                case .HTML_ShowToolTip_t;  for Callbacks.HTML_ShowToolTip_t  it(<<cast(*HTML_ShowToolTip_t) callback.m_pubParam);
                case .SteamNetAuthenticationStatus_t;  for Callbacks.SteamNetAuthenticationStatus_t  it(<<cast(*SteamNetAuthenticationStatus_t) callback.m_pubParam);
                case .SetUserItemVoteResult_t;  for Callbacks.SetUserItemVoteResult_t  it(<<cast(*SetUserItemVoteResult_t) callback.m_pubParam);
                case .LobbyGameCreated_t;  for Callbacks.LobbyGameCreated_t  it(<<cast(*LobbyGameCreated_t) callback.m_pubParam);
                case .RequestPlayersForGameProgressCallback_t;  for Callbacks.RequestPlayersForGameProgressCallback_t  it(<<cast(*RequestPlayersForGameProgressCallback_t) callback.m_pubParam);
                case .GSClientDeny_t;  for Callbacks.GSClientDeny_t  it(<<cast(*GSClientDeny_t) callback.m_pubParam);
                case .MusicPlayerWantsPlayNext_t;  for Callbacks.MusicPlayerWantsPlayNext_t  it(<<cast(*MusicPlayerWantsPlayNext_t) callback.m_pubParam);
                case .CreateItemResult_t;  for Callbacks.CreateItemResult_t  it(<<cast(*CreateItemResult_t) callback.m_pubParam);
                case .HTML_ChangedTitle_t;  for Callbacks.HTML_ChangedTitle_t  it(<<cast(*HTML_ChangedTitle_t) callback.m_pubParam);
                case .LobbyKicked_t;  for Callbacks.LobbyKicked_t  it(<<cast(*LobbyKicked_t) callback.m_pubParam);
                case .RemoteStorageAppSyncProgress_t;  for Callbacks.RemoteStorageAppSyncProgress_t  it(<<cast(*RemoteStorageAppSyncProgress_t) callback.m_pubParam);
                case .NumberOfCurrentPlayers_t;  for Callbacks.NumberOfCurrentPlayers_t  it(<<cast(*NumberOfCurrentPlayers_t) callback.m_pubParam);
                case .HTML_CanGoBackAndForward_t;  for Callbacks.HTML_CanGoBackAndForward_t  it(<<cast(*HTML_CanGoBackAndForward_t) callback.m_pubParam);
                case .RemoteStoragePublishedFileUpdated_t;  for Callbacks.RemoteStoragePublishedFileUpdated_t  it(<<cast(*RemoteStoragePublishedFileUpdated_t) callback.m_pubParam);
                case .AvailableBeaconLocationsUpdated_t;  for Callbacks.AvailableBeaconLocationsUpdated_t  it(<<cast(*AvailableBeaconLocationsUpdated_t) callback.m_pubParam);
                case .GSGameplayStats_t;  for Callbacks.GSGameplayStats_t  it(<<cast(*GSGameplayStats_t) callback.m_pubParam);
                case .LeaderboardFindResult_t;  for Callbacks.LeaderboardFindResult_t  it(<<cast(*LeaderboardFindResult_t) callback.m_pubParam);
                case .IPCFailure_t;  for Callbacks.IPCFailure_t  it(<<cast(*IPCFailure_t) callback.m_pubParam);
                case .RemoteStoragePublishedFileSubscribed_t;  for Callbacks.RemoteStoragePublishedFileSubscribed_t  it(<<cast(*RemoteStoragePublishedFileSubscribed_t) callback.m_pubParam);
                case .RemoteStorageDownloadUGCResult_t;  for Callbacks.RemoteStorageDownloadUGCResult_t  it(<<cast(*RemoteStorageDownloadUGCResult_t) callback.m_pubParam);
                case .ScreenshotReady_t;  for Callbacks.ScreenshotReady_t  it(<<cast(*ScreenshotReady_t) callback.m_pubParam);
                case .HTML_CloseBrowser_t;  for Callbacks.HTML_CloseBrowser_t  it(<<cast(*HTML_CloseBrowser_t) callback.m_pubParam);
                case .GameWebCallback_t;  for Callbacks.GameWebCallback_t  it(<<cast(*GameWebCallback_t) callback.m_pubParam);
                case .HTML_NewWindow_t;  for Callbacks.HTML_NewWindow_t  it(<<cast(*HTML_NewWindow_t) callback.m_pubParam);
                case .GetVideoURLResult_t;  for Callbacks.GetVideoURLResult_t  it(<<cast(*GetVideoURLResult_t) callback.m_pubParam);
                case .GameLobbyJoinRequested_t;  for Callbacks.GameLobbyJoinRequested_t  it(<<cast(*GameLobbyJoinRequested_t) callback.m_pubParam);
                case .RemoteStoragePublishFileProgress_t;  for Callbacks.RemoteStoragePublishFileProgress_t  it(<<cast(*RemoteStoragePublishFileProgress_t) callback.m_pubParam);
                case .HTML_JSConfirm_t;  for Callbacks.HTML_JSConfirm_t  it(<<cast(*HTML_JSConfirm_t) callback.m_pubParam);
                case .PSNGameBootInviteResult_t;  for Callbacks.PSNGameBootInviteResult_t  it(<<cast(*PSNGameBootInviteResult_t) callback.m_pubParam);
                case .UserStatsReceived_t;  for Callbacks.UserStatsReceived_t  it(<<cast(*UserStatsReceived_t) callback.m_pubParam);
                case .UserStatsStored_t;  for Callbacks.UserStatsStored_t  it(<<cast(*UserStatsStored_t) callback.m_pubParam);
                case .GlobalAchievementPercentagesReady_t;  for Callbacks.GlobalAchievementPercentagesReady_t  it(<<cast(*GlobalAchievementPercentagesReady_t) callback.m_pubParam);
                case .NewUrlLaunchParameters_t;  for Callbacks.NewUrlLaunchParameters_t  it(<<cast(*NewUrlLaunchParameters_t) callback.m_pubParam);
                case .GetOPFSettingsResult_t;  for Callbacks.GetOPFSettingsResult_t  it(<<cast(*GetOPFSettingsResult_t) callback.m_pubParam);
                case .FriendsIsFollowing_t;  for Callbacks.FriendsIsFollowing_t  it(<<cast(*FriendsIsFollowing_t) callback.m_pubParam);
                case .GameOverlayActivated_t;  for Callbacks.GameOverlayActivated_t  it(<<cast(*GameOverlayActivated_t) callback.m_pubParam);
                case .RemoteStorageGetPublishedItemVoteDetailsResult_t;  for Callbacks.RemoteStorageGetPublishedItemVoteDetailsResult_t  it(<<cast(*RemoteStorageGetPublishedItemVoteDetailsResult_t) callback.m_pubParam);
                case .FriendRichPresenceUpdate_t;  for Callbacks.FriendRichPresenceUpdate_t  it(<<cast(*FriendRichPresenceUpdate_t) callback.m_pubParam);
                case .SteamInventoryFullUpdate_t;  for Callbacks.SteamInventoryFullUpdate_t  it(<<cast(*SteamInventoryFullUpdate_t) callback.m_pubParam);
                case .FriendsGetFollowerCount_t;  for Callbacks.FriendsGetFollowerCount_t  it(<<cast(*FriendsGetFollowerCount_t) callback.m_pubParam);
                case .MusicPlayerRemoteWillActivate_t;  for Callbacks.MusicPlayerRemoteWillActivate_t  it(<<cast(*MusicPlayerRemoteWillActivate_t) callback.m_pubParam);
                case .GameConnectedChatLeave_t;  for Callbacks.GameConnectedChatLeave_t  it(<<cast(*GameConnectedChatLeave_t) callback.m_pubParam);
                case .RemoteStorageAppSyncedServer_t;  for Callbacks.RemoteStorageAppSyncedServer_t  it(<<cast(*RemoteStorageAppSyncedServer_t) callback.m_pubParam);
                case .MusicPlayerRemoteWillDeactivate_t;  for Callbacks.MusicPlayerRemoteWillDeactivate_t  it(<<cast(*MusicPlayerRemoteWillDeactivate_t) callback.m_pubParam);
                case .HTML_StatusText_t;  for Callbacks.HTML_StatusText_t  it(<<cast(*HTML_StatusText_t) callback.m_pubParam);
                case .SteamInventoryEligiblePromoItemDefIDs_t;  for Callbacks.SteamInventoryEligiblePromoItemDefIDs_t  it(<<cast(*SteamInventoryEligiblePromoItemDefIDs_t) callback.m_pubParam);
                case .StartPlaytimeTrackingResult_t;  for Callbacks.StartPlaytimeTrackingResult_t  it(<<cast(*StartPlaytimeTrackingResult_t) callback.m_pubParam);
                case .MusicPlayerWantsPlayingRepeatStatus_t;  for Callbacks.MusicPlayerWantsPlayingRepeatStatus_t  it(<<cast(*MusicPlayerWantsPlayingRepeatStatus_t) callback.m_pubParam);
                case .LeaderboardScoreUploaded_t;  for Callbacks.LeaderboardScoreUploaded_t  it(<<cast(*LeaderboardScoreUploaded_t) callback.m_pubParam);
                case .AddUGCDependencyResult_t;  for Callbacks.AddUGCDependencyResult_t  it(<<cast(*AddUGCDependencyResult_t) callback.m_pubParam);
                case .DeleteItemResult_t;  for Callbacks.DeleteItemResult_t  it(<<cast(*DeleteItemResult_t) callback.m_pubParam);
                case .SearchForGameProgressCallback_t;  for Callbacks.SearchForGameProgressCallback_t  it(<<cast(*SearchForGameProgressCallback_t) callback.m_pubParam);
                case .HTTPRequestHeadersReceived_t;  for Callbacks.HTTPRequestHeadersReceived_t  it(<<cast(*HTTPRequestHeadersReceived_t) callback.m_pubParam);
                case .MusicPlayerRemoteToFront_t;  for Callbacks.MusicPlayerRemoteToFront_t  it(<<cast(*MusicPlayerRemoteToFront_t) callback.m_pubParam);
                case .GamepadTextInputDismissed_t;  for Callbacks.GamepadTextInputDismissed_t  it(<<cast(*GamepadTextInputDismissed_t) callback.m_pubParam);
                case .RemoteStorageDeletePublishedFileResult_t;  for Callbacks.RemoteStorageDeletePublishedFileResult_t  it(<<cast(*RemoteStorageDeletePublishedFileResult_t) callback.m_pubParam);
                case .HTTPRequestDataReceived_t;  for Callbacks.HTTPRequestDataReceived_t  it(<<cast(*HTTPRequestDataReceived_t) callback.m_pubParam);
                case .HTML_FinishedRequest_t;  for Callbacks.HTML_FinishedRequest_t  it(<<cast(*HTML_FinishedRequest_t) callback.m_pubParam);
                case .SteamInventoryDefinitionUpdate_t;  for Callbacks.SteamInventoryDefinitionUpdate_t  it(<<cast(*SteamInventoryDefinitionUpdate_t) callback.m_pubParam);
                case .SteamParentalSettingsChanged_t;  for Callbacks.SteamParentalSettingsChanged_t  it(<<cast(*SteamParentalSettingsChanged_t) callback.m_pubParam);
                case .RemoteStorageEnumeratePublishedFilesByUserActionResult_t;  for Callbacks.RemoteStorageEnumeratePublishedFilesByUserActionResult_t  it(<<cast(*RemoteStorageEnumeratePublishedFilesByUserActionResult_t) callback.m_pubParam);
                case .MusicPlayerWantsPause_t;  for Callbacks.MusicPlayerWantsPause_t  it(<<cast(*MusicPlayerWantsPause_t) callback.m_pubParam);
                case .SteamInventoryResultReady_t;  for Callbacks.SteamInventoryResultReady_t  it(<<cast(*SteamInventoryResultReady_t) callback.m_pubParam);
                case .LobbyCreated_t;  for Callbacks.LobbyCreated_t  it(<<cast(*LobbyCreated_t) callback.m_pubParam);
                case .LobbyChatMsg_t;  for Callbacks.LobbyChatMsg_t  it(<<cast(*LobbyChatMsg_t) callback.m_pubParam);
                case .SteamNetConnectionStatusChangedCallback_t;  for Callbacks.SteamNetConnectionStatusChangedCallback_t  it(<<cast(*SteamNetConnectionStatusChangedCallback_t) callback.m_pubParam);
                case .P2PSessionConnectFail_t;  for Callbacks.P2PSessionConnectFail_t  it(<<cast(*P2PSessionConnectFail_t) callback.m_pubParam);
                case .DownloadItemResult_t;  for Callbacks.DownloadItemResult_t  it(<<cast(*DownloadItemResult_t) callback.m_pubParam);
                case .HTML_HorizontalScroll_t;  for Callbacks.HTML_HorizontalScroll_t  it(<<cast(*HTML_HorizontalScroll_t) callback.m_pubParam);
                case .AvatarImageLoaded_t;  for Callbacks.AvatarImageLoaded_t  it(<<cast(*AvatarImageLoaded_t) callback.m_pubParam);
                case .ItemInstalled_t;  for Callbacks.ItemInstalled_t  it(<<cast(*ItemInstalled_t) callback.m_pubParam);
                case .UserFavoriteItemsListChanged_t;  for Callbacks.UserFavoriteItemsListChanged_t  it(<<cast(*UserFavoriteItemsListChanged_t) callback.m_pubParam);
                case .SteamAppInstalled_t;  for Callbacks.SteamAppInstalled_t  it(<<cast(*SteamAppInstalled_t) callback.m_pubParam);
                case .MusicPlayerSelectsPlaylistEntry_t;  for Callbacks.MusicPlayerSelectsPlaylistEntry_t  it(<<cast(*MusicPlayerSelectsPlaylistEntry_t) callback.m_pubParam);
                case .AddAppDependencyResult_t;  for Callbacks.AddAppDependencyResult_t  it(<<cast(*AddAppDependencyResult_t) callback.m_pubParam);
                case .HTML_NeedsPaint_t;  for Callbacks.HTML_NeedsPaint_t  it(<<cast(*HTML_NeedsPaint_t) callback.m_pubParam);
                case .LobbyChatUpdate_t;  for Callbacks.LobbyChatUpdate_t  it(<<cast(*LobbyChatUpdate_t) callback.m_pubParam);
                case .HTML_HideToolTip_t;  for Callbacks.HTML_HideToolTip_t  it(<<cast(*HTML_HideToolTip_t) callback.m_pubParam);
                case .CheckFileSignature_t;  for Callbacks.CheckFileSignature_t  it(<<cast(*CheckFileSignature_t) callback.m_pubParam);
                case .RemoteStorageGetPublishedFileDetailsResult_t;  for Callbacks.RemoteStorageGetPublishedFileDetailsResult_t  it(<<cast(*RemoteStorageGetPublishedFileDetailsResult_t) callback.m_pubParam);
                case .SubmitPlayerResultResultCallback_t;  for Callbacks.SubmitPlayerResultResultCallback_t  it(<<cast(*SubmitPlayerResultResultCallback_t) callback.m_pubParam);
                case .RemoteStorageSetUserPublishedFileActionResult_t;  for Callbacks.RemoteStorageSetUserPublishedFileActionResult_t  it(<<cast(*RemoteStorageSetUserPublishedFileActionResult_t) callback.m_pubParam);
                case .GameConnectedClanChatMsg_t;  for Callbacks.GameConnectedClanChatMsg_t  it(<<cast(*GameConnectedClanChatMsg_t) callback.m_pubParam);
                case .LicensesUpdated_t;  for Callbacks.LicensesUpdated_t  it(<<cast(*LicensesUpdated_t) callback.m_pubParam);
                case .FavoritesListChanged_t;  for Callbacks.FavoritesListChanged_t  it(<<cast(*FavoritesListChanged_t) callback.m_pubParam);
                case .FavoritesListAccountsUpdated_t;  for Callbacks.FavoritesListAccountsUpdated_t  it(<<cast(*FavoritesListAccountsUpdated_t) callback.m_pubParam);
                case .GSClientAchievementStatus_t;  for Callbacks.GSClientAchievementStatus_t  it(<<cast(*GSClientAchievementStatus_t) callback.m_pubParam);
                case .SteamNetworkingMessagesSessionFailed_t;  for Callbacks.SteamNetworkingMessagesSessionFailed_t  it(<<cast(*SteamNetworkingMessagesSessionFailed_t) callback.m_pubParam);
                case .RemoteStorageAppSyncStatusCheck_t;  for Callbacks.RemoteStorageAppSyncStatusCheck_t  it(<<cast(*RemoteStorageAppSyncStatusCheck_t) callback.m_pubParam);
                case .HTML_UpdateToolTip_t;  for Callbacks.HTML_UpdateToolTip_t  it(<<cast(*HTML_UpdateToolTip_t) callback.m_pubParam);
                case .MarketEligibilityResponse_t;  for Callbacks.MarketEligibilityResponse_t  it(<<cast(*MarketEligibilityResponse_t) callback.m_pubParam);
                case .MusicPlayerWantsShuffled_t;  for Callbacks.MusicPlayerWantsShuffled_t  it(<<cast(*MusicPlayerWantsShuffled_t) callback.m_pubParam);
                case .HTML_VerticalScroll_t;  for Callbacks.HTML_VerticalScroll_t  it(<<cast(*HTML_VerticalScroll_t) callback.m_pubParam);
                case .SteamRemotePlaySessionConnected_t;  for Callbacks.SteamRemotePlaySessionConnected_t  it(<<cast(*SteamRemotePlaySessionConnected_t) callback.m_pubParam);
                case .HTML_FileOpenDialog_t;  for Callbacks.HTML_FileOpenDialog_t  it(<<cast(*HTML_FileOpenDialog_t) callback.m_pubParam);
                case .GetAuthSessionTicketResponse_t;  for Callbacks.GetAuthSessionTicketResponse_t  it(<<cast(*GetAuthSessionTicketResponse_t) callback.m_pubParam);
                case .RegisterActivationCodeResponse_t;  for Callbacks.RegisterActivationCodeResponse_t  it(<<cast(*RegisterActivationCodeResponse_t) callback.m_pubParam);
                case .SocketStatusCallback_t;  for Callbacks.SocketStatusCallback_t  it(<<cast(*SocketStatusCallback_t) callback.m_pubParam);
                case .RemoteStorageFileShareResult_t;  for Callbacks.RemoteStorageFileShareResult_t  it(<<cast(*RemoteStorageFileShareResult_t) callback.m_pubParam);
                case .ClientGameServerDeny_t;  for Callbacks.ClientGameServerDeny_t  it(<<cast(*ClientGameServerDeny_t) callback.m_pubParam);
                case .GSStatsStored_t;  for Callbacks.GSStatsStored_t  it(<<cast(*GSStatsStored_t) callback.m_pubParam);
                case .RemoteStorageEnumerateUserSubscribedFilesResult_t;  for Callbacks.RemoteStorageEnumerateUserSubscribedFilesResult_t  it(<<cast(*RemoteStorageEnumerateUserSubscribedFilesResult_t) callback.m_pubParam);
                case .LeaderboardScoresDownloaded_t;  for Callbacks.LeaderboardScoresDownloaded_t  it(<<cast(*LeaderboardScoresDownloaded_t) callback.m_pubParam);
                case .SteamShutdown_t;  for Callbacks.SteamShutdown_t  it(<<cast(*SteamShutdown_t) callback.m_pubParam);
                case .P2PSessionRequest_t;  for Callbacks.P2PSessionRequest_t  it(<<cast(*P2PSessionRequest_t) callback.m_pubParam);
                case .RemoteStorageUpdateUserPublishedItemVoteResult_t;  for Callbacks.RemoteStorageUpdateUserPublishedItemVoteResult_t  it(<<cast(*RemoteStorageUpdateUserPublishedItemVoteResult_t) callback.m_pubParam);
                case .DurationControl_t;  for Callbacks.DurationControl_t  it(<<cast(*DurationControl_t) callback.m_pubParam);
                case .RemoteStorageEnumerateUserSharedWorkshopFilesResult_t;  for Callbacks.RemoteStorageEnumerateUserSharedWorkshopFilesResult_t  it(<<cast(*RemoteStorageEnumerateUserSharedWorkshopFilesResult_t) callback.m_pubParam);
                case .DownloadClanActivityCountsResult_t;  for Callbacks.DownloadClanActivityCountsResult_t  it(<<cast(*DownloadClanActivityCountsResult_t) callback.m_pubParam);
                case .MusicPlayerSelectsQueueEntry_t;  for Callbacks.MusicPlayerSelectsQueueEntry_t  it(<<cast(*MusicPlayerSelectsQueueEntry_t) callback.m_pubParam);
                case .GlobalStatsReceived_t;  for Callbacks.GlobalStatsReceived_t  it(<<cast(*GlobalStatsReceived_t) callback.m_pubParam);
                case .GameConnectedFriendChatMsg_t;  for Callbacks.GameConnectedFriendChatMsg_t  it(<<cast(*GameConnectedFriendChatMsg_t) callback.m_pubParam);
                case .RemoteStorageEnumerateWorkshopFilesResult_t;  for Callbacks.RemoteStorageEnumerateWorkshopFilesResult_t  it(<<cast(*RemoteStorageEnumerateWorkshopFilesResult_t) callback.m_pubParam);
                case .VolumeHasChanged_t;  for Callbacks.VolumeHasChanged_t  it(<<cast(*VolumeHasChanged_t) callback.m_pubParam);
                case .StopPlaytimeTrackingResult_t;  for Callbacks.StopPlaytimeTrackingResult_t  it(<<cast(*StopPlaytimeTrackingResult_t) callback.m_pubParam);
                case .SteamAPICallCompleted_t;  for Callbacks.SteamAPICallCompleted_t  it(<<cast(*SteamAPICallCompleted_t) callback.m_pubParam);
                case .ChangeNumOpenSlotsCallback_t;  for Callbacks.ChangeNumOpenSlotsCallback_t  it(<<cast(*ChangeNumOpenSlotsCallback_t) callback.m_pubParam);
                case .MusicPlayerWantsLooped_t;  for Callbacks.MusicPlayerWantsLooped_t  it(<<cast(*MusicPlayerWantsLooped_t) callback.m_pubParam);
                case .HTTPRequestCompleted_t;  for Callbacks.HTTPRequestCompleted_t  it(<<cast(*HTTPRequestCompleted_t) callback.m_pubParam);
                case .IPCountry_t;  for Callbacks.IPCountry_t  it(<<cast(*IPCountry_t) callback.m_pubParam);
                case .SteamAppUninstalled_t;  for Callbacks.SteamAppUninstalled_t  it(<<cast(*SteamAppUninstalled_t) callback.m_pubParam);
                case .HTML_StartRequest_t;  for Callbacks.HTML_StartRequest_t  it(<<cast(*HTML_StartRequest_t) callback.m_pubParam);
                case .ComputeNewPlayerCompatibilityResult_t;  for Callbacks.ComputeNewPlayerCompatibilityResult_t  it(<<cast(*ComputeNewPlayerCompatibilityResult_t) callback.m_pubParam);
                case .RemoteStorageUnsubscribePublishedFileResult_t;  for Callbacks.RemoteStorageUnsubscribePublishedFileResult_t  it(<<cast(*RemoteStorageUnsubscribePublishedFileResult_t) callback.m_pubParam);
                case .HTML_BrowserReady_t;  for Callbacks.HTML_BrowserReady_t  it(<<cast(*HTML_BrowserReady_t) callback.m_pubParam);
                case .SteamRemotePlaySessionDisconnected_t;  for Callbacks.SteamRemotePlaySessionDisconnected_t  it(<<cast(*SteamRemotePlaySessionDisconnected_t) callback.m_pubParam);
                case .SearchForGameResultCallback_t;  for Callbacks.SearchForGameResultCallback_t  it(<<cast(*SearchForGameResultCallback_t) callback.m_pubParam);
                case .RequestPlayersForGameResultCallback_t;  for Callbacks.RequestPlayersForGameResultCallback_t  it(<<cast(*RequestPlayersForGameResultCallback_t) callback.m_pubParam);
                case .GameRichPresenceJoinRequested_t;  for Callbacks.GameRichPresenceJoinRequested_t  it(<<cast(*GameRichPresenceJoinRequested_t) callback.m_pubParam);
                case .ReservationNotificationCallback_t;  for Callbacks.ReservationNotificationCallback_t  it(<<cast(*ReservationNotificationCallback_t) callback.m_pubParam);
                case .TimedTrialStatus_t;  for Callbacks.TimedTrialStatus_t  it(<<cast(*TimedTrialStatus_t) callback.m_pubParam);
                case .SteamUGCRequestUGCDetailsResult_t;  for Callbacks.SteamUGCRequestUGCDetailsResult_t  it(<<cast(*SteamUGCRequestUGCDetailsResult_t) callback.m_pubParam);
                case .GetAppDependenciesResult_t;  for Callbacks.GetAppDependenciesResult_t  it(<<cast(*GetAppDependenciesResult_t) callback.m_pubParam);
                case .GSClientGroupStatus_t;  for Callbacks.GSClientGroupStatus_t  it(<<cast(*GSClientGroupStatus_t) callback.m_pubParam);
                case .MusicPlayerWantsVolume_t;  for Callbacks.MusicPlayerWantsVolume_t  it(<<cast(*MusicPlayerWantsVolume_t) callback.m_pubParam);
                case .RemoteStorageUserVoteDetails_t;  for Callbacks.RemoteStorageUserVoteDetails_t  it(<<cast(*RemoteStorageUserVoteDetails_t) callback.m_pubParam);
                case .ScreenshotRequested_t;  for Callbacks.ScreenshotRequested_t  it(<<cast(*ScreenshotRequested_t) callback.m_pubParam);
                case .DlcInstalled_t;  for Callbacks.DlcInstalled_t  it(<<cast(*DlcInstalled_t) callback.m_pubParam);
                case .GSPolicyResponse_t;  for Callbacks.GSPolicyResponse_t  it(<<cast(*GSPolicyResponse_t) callback.m_pubParam);
                case .OverlayBrowserProtocolNavigation_t;  for Callbacks.OverlayBrowserProtocolNavigation_t  it(<<cast(*OverlayBrowserProtocolNavigation_t) callback.m_pubParam);
                case .EndGameResultCallback_t;  for Callbacks.EndGameResultCallback_t  it(<<cast(*EndGameResultCallback_t) callback.m_pubParam);
                case .SteamUGCQueryCompleted_t;  for Callbacks.SteamUGCQueryCompleted_t  it(<<cast(*SteamUGCQueryCompleted_t) callback.m_pubParam);
                case .PlaybackStatusHasChanged_t;  for Callbacks.PlaybackStatusHasChanged_t  it(<<cast(*PlaybackStatusHasChanged_t) callback.m_pubParam);
                case .RemoteStoragePublishedFileUnsubscribed_t;  for Callbacks.RemoteStoragePublishedFileUnsubscribed_t  it(<<cast(*RemoteStoragePublishedFileUnsubscribed_t) callback.m_pubParam);
                case .HTML_SetCursor_t;  for Callbacks.HTML_SetCursor_t  it(<<cast(*HTML_SetCursor_t) callback.m_pubParam);
                case .SteamInventoryStartPurchaseResult_t;  for Callbacks.SteamInventoryStartPurchaseResult_t  it(<<cast(*SteamInventoryStartPurchaseResult_t) callback.m_pubParam);
                case .RemoveUGCDependencyResult_t;  for Callbacks.RemoveUGCDependencyResult_t  it(<<cast(*RemoveUGCDependencyResult_t) callback.m_pubParam);
                case .GSReputation_t;  for Callbacks.GSReputation_t  it(<<cast(*GSReputation_t) callback.m_pubParam);
                case .GSStatsReceived_t;  for Callbacks.GSStatsReceived_t  it(<<cast(*GSStatsReceived_t) callback.m_pubParam);
                case .HTML_BrowserRestarted_t;  for Callbacks.HTML_BrowserRestarted_t  it(<<cast(*HTML_BrowserRestarted_t) callback.m_pubParam);
                case .RemoteStorageAppSyncedClient_t;  for Callbacks.RemoteStorageAppSyncedClient_t  it(<<cast(*RemoteStorageAppSyncedClient_t) callback.m_pubParam);
                case .ActiveBeaconsUpdated_t;  for Callbacks.ActiveBeaconsUpdated_t  it(<<cast(*ActiveBeaconsUpdated_t) callback.m_pubParam);
                case .MusicPlayerWantsPlay_t;  for Callbacks.MusicPlayerWantsPlay_t  it(<<cast(*MusicPlayerWantsPlay_t) callback.m_pubParam);
                case .LobbyInvite_t;  for Callbacks.LobbyInvite_t  it(<<cast(*LobbyInvite_t) callback.m_pubParam);
                case .JoinPartyCallback_t;  for Callbacks.JoinPartyCallback_t  it(<<cast(*JoinPartyCallback_t) callback.m_pubParam);
                case .HTML_SearchResults_t;  for Callbacks.HTML_SearchResults_t  it(<<cast(*HTML_SearchResults_t) callback.m_pubParam);
                case .SteamServersDisconnected_t;  for Callbacks.SteamServersDisconnected_t  it(<<cast(*SteamServersDisconnected_t) callback.m_pubParam);
                case .RemoteStorageFileWriteAsyncComplete_t;  for Callbacks.RemoteStorageFileWriteAsyncComplete_t  it(<<cast(*RemoteStorageFileWriteAsyncComplete_t) callback.m_pubParam);
                case .UserAchievementStored_t;  for Callbacks.UserAchievementStored_t  it(<<cast(*UserAchievementStored_t) callback.m_pubParam);
                case .HTML_JSAlert_t;  for Callbacks.HTML_JSAlert_t  it(<<cast(*HTML_JSAlert_t) callback.m_pubParam);
                case .HTML_LinkAtPosition_t;  for Callbacks.HTML_LinkAtPosition_t  it(<<cast(*HTML_LinkAtPosition_t) callback.m_pubParam);
                case .LobbyDataUpdate_t;  for Callbacks.LobbyDataUpdate_t  it(<<cast(*LobbyDataUpdate_t) callback.m_pubParam);
                case .GameServerChangeRequested_t;  for Callbacks.GameServerChangeRequested_t  it(<<cast(*GameServerChangeRequested_t) callback.m_pubParam);
                case .RequestPlayersForGameFinalResultCallback_t;  for Callbacks.RequestPlayersForGameFinalResultCallback_t  it(<<cast(*RequestPlayersForGameFinalResultCallback_t) callback.m_pubParam);
                case .LeaderboardUGCSet_t;  for Callbacks.LeaderboardUGCSet_t  it(<<cast(*LeaderboardUGCSet_t) callback.m_pubParam);
                case .GSClientKick_t;  for Callbacks.GSClientKick_t  it(<<cast(*GSClientKick_t) callback.m_pubParam);
			 }
		}
	}
}


awaiting_call_results :: (steam_pipe: HSteamPipe) -> int {
    result := 0;
    for CallResults.StoreAuthURLResponse_t  result += 1;
    for CallResults.RemoteStorageDeletePublishedFileResult_t  result += 1;
    for CallResults.RemoteStorageSubscribePublishedFileResult_t  result += 1;
    for CallResults.EncryptedAppTicketResponse_t  result += 1;
    for CallResults.CreateItemResult_t  result += 1;
    for CallResults.LobbyMatchList_t  result += 1;
    for CallResults.DownloadClanActivityCountsResult_t  result += 1;
    for CallResults.RemoteStorageFileReadAsyncComplete_t  result += 1;
    for CallResults.RemoteStorageEnumeratePublishedFilesByUserActionResult_t  result += 1;
    for CallResults.LobbyCreated_t  result += 1;
    for CallResults.GlobalStatsReceived_t  result += 1;
    for CallResults.RemoteStorageEnumerateWorkshopFilesResult_t  result += 1;
    for CallResults.SetPersonaNameResponse_t  result += 1;
    for CallResults.StopPlaytimeTrackingResult_t  result += 1;
    for CallResults.NumberOfCurrentPlayers_t  result += 1;
    for CallResults.ChangeNumOpenSlotsCallback_t  result += 1;
    for CallResults.RemoveAppDependencyResult_t  result += 1;
    for CallResults.UserFavoriteItemsListChanged_t  result += 1;
    for CallResults.SteamInventoryRequestPricesResult_t  result += 1;
    for CallResults.AddAppDependencyResult_t  result += 1;
    for CallResults.LeaderboardFindResult_t  result += 1;
    for CallResults.RemoteStorageDownloadUGCResult_t  result += 1;
    for CallResults.CheckFileSignature_t  result += 1;
    for CallResults.RemoteStorageGetPublishedFileDetailsResult_t  result += 1;
    for CallResults.FileDetailsResult_t  result += 1;
    for CallResults.ComputeNewPlayerCompatibilityResult_t  result += 1;
    for CallResults.RemoteStorageSetUserPublishedFileActionResult_t  result += 1;
    for CallResults.RemoteStorageEnumerateUserPublishedFilesResult_t  result += 1;
    for CallResults.RemoteStorageUnsubscribePublishedFileResult_t  result += 1;
    for CallResults.RemoteStoragePublishFileProgress_t  result += 1;
    for CallResults.CreateBeaconCallback_t  result += 1;
    for CallResults.HTML_BrowserReady_t  result += 1;
    for CallResults.MarketEligibilityResponse_t  result += 1;
    for CallResults.RemoteStorageUpdatePublishedFileResult_t  result += 1;
    for CallResults.UserStatsReceived_t  result += 1;
    for CallResults.JoinClanChatRoomCompletionResult_t  result += 1;
    for CallResults.GlobalAchievementPercentagesReady_t  result += 1;
    for CallResults.AssociateWithClanResult_t  result += 1;
    for CallResults.GetAppDependenciesResult_t  result += 1;
    for CallResults.FriendsIsFollowing_t  result += 1;
    for CallResults.SteamUGCRequestUGCDetailsResult_t  result += 1;
    for CallResults.ClanOfficerListResponse_t  result += 1;
    for CallResults.FriendsEnumerateFollowingList_t  result += 1;
    for CallResults.RemoteStorageGetPublishedItemVoteDetailsResult_t  result += 1;
    for CallResults.LobbyEnter_t  result += 1;
    for CallResults.SteamUGCQueryCompleted_t  result += 1;
    for CallResults.GSReputation_t  result += 1;
    for CallResults.FriendsGetFollowerCount_t  result += 1;
    for CallResults.SteamInventoryEligiblePromoItemDefIDs_t  result += 1;
    for CallResults.SteamInventoryStartPurchaseResult_t  result += 1;
    for CallResults.RemoteStorageFileShareResult_t  result += 1;
    for CallResults.RemoveUGCDependencyResult_t  result += 1;
    for CallResults.StartPlaytimeTrackingResult_t  result += 1;
    for CallResults.GSStatsReceived_t  result += 1;
    for CallResults.GSStatsStored_t  result += 1;
    for CallResults.SubmitItemUpdateResult_t  result += 1;
    for CallResults.GetUserItemVoteResult_t  result += 1;
    for CallResults.LeaderboardScoreUploaded_t  result += 1;
    for CallResults.RemoteStorageEnumerateUserSubscribedFilesResult_t  result += 1;
    for CallResults.JoinPartyCallback_t  result += 1;
    for CallResults.AddUGCDependencyResult_t  result += 1;
    for CallResults.LeaderboardScoresDownloaded_t  result += 1;
    for CallResults.DeleteItemResult_t  result += 1;
    for CallResults.RemoteStorageFileWriteAsyncComplete_t  result += 1;
    for CallResults.SetUserItemVoteResult_t  result += 1;
    for CallResults.DurationControl_t  result += 1;
    for CallResults.RemoteStorageUpdateUserPublishedItemVoteResult_t  result += 1;
    for CallResults.LeaderboardUGCSet_t  result += 1;

    return result;
}


awaiting_call_results :: (steam_pipe: HSteamPipe, index: int) -> handle: SteamAPICall_t, callresult_type: s32 {
    count := -1;
    for CallResults.StoreAuthURLResponse_t {
        count += 1;
        if count >= index  return it_index, StoreAuthURLResponse_t.k_iCallback;
    }
    for CallResults.RemoteStorageDeletePublishedFileResult_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageDeletePublishedFileResult_t.k_iCallback;
    }
    for CallResults.RemoteStorageSubscribePublishedFileResult_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageSubscribePublishedFileResult_t.k_iCallback;
    }
    for CallResults.EncryptedAppTicketResponse_t {
        count += 1;
        if count >= index  return it_index, EncryptedAppTicketResponse_t.k_iCallback;
    }
    for CallResults.CreateItemResult_t {
        count += 1;
        if count >= index  return it_index, CreateItemResult_t.k_iCallback;
    }
    for CallResults.LobbyMatchList_t {
        count += 1;
        if count >= index  return it_index, LobbyMatchList_t.k_iCallback;
    }
    for CallResults.DownloadClanActivityCountsResult_t {
        count += 1;
        if count >= index  return it_index, DownloadClanActivityCountsResult_t.k_iCallback;
    }
    for CallResults.RemoteStorageFileReadAsyncComplete_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageFileReadAsyncComplete_t.k_iCallback;
    }
    for CallResults.RemoteStorageEnumeratePublishedFilesByUserActionResult_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageEnumeratePublishedFilesByUserActionResult_t.k_iCallback;
    }
    for CallResults.LobbyCreated_t {
        count += 1;
        if count >= index  return it_index, LobbyCreated_t.k_iCallback;
    }
    for CallResults.GlobalStatsReceived_t {
        count += 1;
        if count >= index  return it_index, GlobalStatsReceived_t.k_iCallback;
    }
    for CallResults.RemoteStorageEnumerateWorkshopFilesResult_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageEnumerateWorkshopFilesResult_t.k_iCallback;
    }
    for CallResults.SetPersonaNameResponse_t {
        count += 1;
        if count >= index  return it_index, SetPersonaNameResponse_t.k_iCallback;
    }
    for CallResults.StopPlaytimeTrackingResult_t {
        count += 1;
        if count >= index  return it_index, StopPlaytimeTrackingResult_t.k_iCallback;
    }
    for CallResults.NumberOfCurrentPlayers_t {
        count += 1;
        if count >= index  return it_index, NumberOfCurrentPlayers_t.k_iCallback;
    }
    for CallResults.ChangeNumOpenSlotsCallback_t {
        count += 1;
        if count >= index  return it_index, ChangeNumOpenSlotsCallback_t.k_iCallback;
    }
    for CallResults.RemoveAppDependencyResult_t {
        count += 1;
        if count >= index  return it_index, RemoveAppDependencyResult_t.k_iCallback;
    }
    for CallResults.UserFavoriteItemsListChanged_t {
        count += 1;
        if count >= index  return it_index, UserFavoriteItemsListChanged_t.k_iCallback;
    }
    for CallResults.SteamInventoryRequestPricesResult_t {
        count += 1;
        if count >= index  return it_index, SteamInventoryRequestPricesResult_t.k_iCallback;
    }
    for CallResults.AddAppDependencyResult_t {
        count += 1;
        if count >= index  return it_index, AddAppDependencyResult_t.k_iCallback;
    }
    for CallResults.LeaderboardFindResult_t {
        count += 1;
        if count >= index  return it_index, LeaderboardFindResult_t.k_iCallback;
    }
    for CallResults.RemoteStorageDownloadUGCResult_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageDownloadUGCResult_t.k_iCallback;
    }
    for CallResults.CheckFileSignature_t {
        count += 1;
        if count >= index  return it_index, CheckFileSignature_t.k_iCallback;
    }
    for CallResults.RemoteStorageGetPublishedFileDetailsResult_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageGetPublishedFileDetailsResult_t.k_iCallback;
    }
    for CallResults.FileDetailsResult_t {
        count += 1;
        if count >= index  return it_index, FileDetailsResult_t.k_iCallback;
    }
    for CallResults.ComputeNewPlayerCompatibilityResult_t {
        count += 1;
        if count >= index  return it_index, ComputeNewPlayerCompatibilityResult_t.k_iCallback;
    }
    for CallResults.RemoteStorageSetUserPublishedFileActionResult_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageSetUserPublishedFileActionResult_t.k_iCallback;
    }
    for CallResults.RemoteStorageEnumerateUserPublishedFilesResult_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageEnumerateUserPublishedFilesResult_t.k_iCallback;
    }
    for CallResults.RemoteStorageUnsubscribePublishedFileResult_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageUnsubscribePublishedFileResult_t.k_iCallback;
    }
    for CallResults.RemoteStoragePublishFileProgress_t {
        count += 1;
        if count >= index  return it_index, RemoteStoragePublishFileProgress_t.k_iCallback;
    }
    for CallResults.CreateBeaconCallback_t {
        count += 1;
        if count >= index  return it_index, CreateBeaconCallback_t.k_iCallback;
    }
    for CallResults.HTML_BrowserReady_t {
        count += 1;
        if count >= index  return it_index, HTML_BrowserReady_t.k_iCallback;
    }
    for CallResults.MarketEligibilityResponse_t {
        count += 1;
        if count >= index  return it_index, MarketEligibilityResponse_t.k_iCallback;
    }
    for CallResults.RemoteStorageUpdatePublishedFileResult_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageUpdatePublishedFileResult_t.k_iCallback;
    }
    for CallResults.UserStatsReceived_t {
        count += 1;
        if count >= index  return it_index, UserStatsReceived_t.k_iCallback;
    }
    for CallResults.JoinClanChatRoomCompletionResult_t {
        count += 1;
        if count >= index  return it_index, JoinClanChatRoomCompletionResult_t.k_iCallback;
    }
    for CallResults.GlobalAchievementPercentagesReady_t {
        count += 1;
        if count >= index  return it_index, GlobalAchievementPercentagesReady_t.k_iCallback;
    }
    for CallResults.AssociateWithClanResult_t {
        count += 1;
        if count >= index  return it_index, AssociateWithClanResult_t.k_iCallback;
    }
    for CallResults.GetAppDependenciesResult_t {
        count += 1;
        if count >= index  return it_index, GetAppDependenciesResult_t.k_iCallback;
    }
    for CallResults.FriendsIsFollowing_t {
        count += 1;
        if count >= index  return it_index, FriendsIsFollowing_t.k_iCallback;
    }
    for CallResults.SteamUGCRequestUGCDetailsResult_t {
        count += 1;
        if count >= index  return it_index, SteamUGCRequestUGCDetailsResult_t.k_iCallback;
    }
    for CallResults.ClanOfficerListResponse_t {
        count += 1;
        if count >= index  return it_index, ClanOfficerListResponse_t.k_iCallback;
    }
    for CallResults.FriendsEnumerateFollowingList_t {
        count += 1;
        if count >= index  return it_index, FriendsEnumerateFollowingList_t.k_iCallback;
    }
    for CallResults.RemoteStorageGetPublishedItemVoteDetailsResult_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageGetPublishedItemVoteDetailsResult_t.k_iCallback;
    }
    for CallResults.LobbyEnter_t {
        count += 1;
        if count >= index  return it_index, LobbyEnter_t.k_iCallback;
    }
    for CallResults.SteamUGCQueryCompleted_t {
        count += 1;
        if count >= index  return it_index, SteamUGCQueryCompleted_t.k_iCallback;
    }
    for CallResults.GSReputation_t {
        count += 1;
        if count >= index  return it_index, GSReputation_t.k_iCallback;
    }
    for CallResults.FriendsGetFollowerCount_t {
        count += 1;
        if count >= index  return it_index, FriendsGetFollowerCount_t.k_iCallback;
    }
    for CallResults.SteamInventoryEligiblePromoItemDefIDs_t {
        count += 1;
        if count >= index  return it_index, SteamInventoryEligiblePromoItemDefIDs_t.k_iCallback;
    }
    for CallResults.SteamInventoryStartPurchaseResult_t {
        count += 1;
        if count >= index  return it_index, SteamInventoryStartPurchaseResult_t.k_iCallback;
    }
    for CallResults.RemoteStorageFileShareResult_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageFileShareResult_t.k_iCallback;
    }
    for CallResults.RemoveUGCDependencyResult_t {
        count += 1;
        if count >= index  return it_index, RemoveUGCDependencyResult_t.k_iCallback;
    }
    for CallResults.StartPlaytimeTrackingResult_t {
        count += 1;
        if count >= index  return it_index, StartPlaytimeTrackingResult_t.k_iCallback;
    }
    for CallResults.GSStatsReceived_t {
        count += 1;
        if count >= index  return it_index, GSStatsReceived_t.k_iCallback;
    }
    for CallResults.GSStatsStored_t {
        count += 1;
        if count >= index  return it_index, GSStatsStored_t.k_iCallback;
    }
    for CallResults.SubmitItemUpdateResult_t {
        count += 1;
        if count >= index  return it_index, SubmitItemUpdateResult_t.k_iCallback;
    }
    for CallResults.GetUserItemVoteResult_t {
        count += 1;
        if count >= index  return it_index, GetUserItemVoteResult_t.k_iCallback;
    }
    for CallResults.LeaderboardScoreUploaded_t {
        count += 1;
        if count >= index  return it_index, LeaderboardScoreUploaded_t.k_iCallback;
    }
    for CallResults.RemoteStorageEnumerateUserSubscribedFilesResult_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageEnumerateUserSubscribedFilesResult_t.k_iCallback;
    }
    for CallResults.JoinPartyCallback_t {
        count += 1;
        if count >= index  return it_index, JoinPartyCallback_t.k_iCallback;
    }
    for CallResults.AddUGCDependencyResult_t {
        count += 1;
        if count >= index  return it_index, AddUGCDependencyResult_t.k_iCallback;
    }
    for CallResults.LeaderboardScoresDownloaded_t {
        count += 1;
        if count >= index  return it_index, LeaderboardScoresDownloaded_t.k_iCallback;
    }
    for CallResults.DeleteItemResult_t {
        count += 1;
        if count >= index  return it_index, DeleteItemResult_t.k_iCallback;
    }
    for CallResults.RemoteStorageFileWriteAsyncComplete_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageFileWriteAsyncComplete_t.k_iCallback;
    }
    for CallResults.SetUserItemVoteResult_t {
        count += 1;
        if count >= index  return it_index, SetUserItemVoteResult_t.k_iCallback;
    }
    for CallResults.DurationControl_t {
        count += 1;
        if count >= index  return it_index, DurationControl_t.k_iCallback;
    }
    for CallResults.RemoteStorageUpdateUserPublishedItemVoteResult_t {
        count += 1;
        if count >= index  return it_index, RemoteStorageUpdateUserPublishedItemVoteResult_t.k_iCallback;
    }
    for CallResults.LeaderboardUGCSet_t {
        count += 1;
        if count >= index  return it_index, LeaderboardUGCSet_t.k_iCallback;
    }

    return 0, 0;
}



CallbackID :: enum s32 {
    StoreAuthURLResponse_t :: 165;
    RemoteStorageSubscribePublishedFileResult_t :: 1313;
    SteamServerConnectFailure_t :: 102;
    EncryptedAppTicketResponse_t :: 154;
    HTML_OpenLinkInNewTab_t :: 4507;
    GSClientApprove_t :: 201;
    LobbyMatchList_t :: 510;
    RemoteStorageFileReadAsyncComplete_t :: 1332;
    RemoteStoragePublishFileResult_t :: 1309;
    SetPersonaNameResponse_t :: 347;
    AppProofOfPurchaseKeyResponse_t :: 1021;
    UserAchievementIconFetched_t :: 1109;
    MusicPlayerWillQuit_t :: 4104;
    RemoveAppDependencyResult_t :: 3415;
    SteamServersConnected_t :: 101;
    SteamInventoryRequestPricesResult_t :: 4705;
    MicroTxnAuthorizationResponse_t :: 152;
    ValidateAuthTicketResponse_t :: 143;
    GameConnectedChatJoin_t :: 339;
    PersonaStateChange_t :: 304;
    SteamRelayNetworkStatus_t :: 1281;
    FileDetailsResult_t :: 1023;
    RemoteStorageEnumerateUserPublishedFilesResult_t :: 1312;
    LowBatteryPower_t :: 702;
    CreateBeaconCallback_t :: 5302;
    UserStatsUnloaded_t :: 1108;
    RemoteStorageUpdatePublishedFileResult_t :: 1316;
    JoinClanChatRoomCompletionResult_t :: 342;
    AssociateWithClanResult_t :: 210;
    HTML_URLChanged_t :: 4505;
    ClanOfficerListResponse_t :: 335;
    FriendsEnumerateFollowingList_t :: 346;
    UnreadChatMessagesChanged_t :: 348;
    RemoteStoragePublishedFileDeleted_t :: 1323;
    SteamNetworkingMessagesSessionRequest_t :: 1251;
    LobbyEnter_t :: 504;
    MusicPlayerWantsPlayPrevious_t :: 4107;
    SubmitItemUpdateResult_t :: 3404;
    GetUserItemVoteResult_t :: 3409;
    HTML_ShowToolTip_t :: 4524;
    SteamNetAuthenticationStatus_t :: 1222;
    SetUserItemVoteResult_t :: 3408;
    LobbyGameCreated_t :: 509;
    RequestPlayersForGameProgressCallback_t :: 5211;
    GSClientDeny_t :: 202;
    MusicPlayerWantsPlayNext_t :: 4108;
    CreateItemResult_t :: 3403;
    HTML_ChangedTitle_t :: 4508;
    LobbyKicked_t :: 512;
    RemoteStorageAppSyncProgress_t :: 1303;
    NumberOfCurrentPlayers_t :: 1107;
    HTML_CanGoBackAndForward_t :: 4510;
    RemoteStoragePublishedFileUpdated_t :: 1330;
    AvailableBeaconLocationsUpdated_t :: 5305;
    GSGameplayStats_t :: 207;
    LeaderboardFindResult_t :: 1104;
    IPCFailure_t :: 117;
    RemoteStoragePublishedFileSubscribed_t :: 1321;
    RemoteStorageDownloadUGCResult_t :: 1317;
    ScreenshotReady_t :: 2301;
    HTML_CloseBrowser_t :: 4504;
    GameWebCallback_t :: 164;
    HTML_NewWindow_t :: 4521;
    GetVideoURLResult_t :: 4611;
    GameLobbyJoinRequested_t :: 333;
    RemoteStoragePublishFileProgress_t :: 1329;
    HTML_JSConfirm_t :: 4515;
    PSNGameBootInviteResult_t :: 515;
    UserStatsReceived_t :: 1101;
    UserStatsStored_t :: 1102;
    GlobalAchievementPercentagesReady_t :: 1110;
    NewUrlLaunchParameters_t :: 1014;
    GetOPFSettingsResult_t :: 4624;
    FriendsIsFollowing_t :: 345;
    GameOverlayActivated_t :: 331;
    RemoteStorageGetPublishedItemVoteDetailsResult_t :: 1320;
    FriendRichPresenceUpdate_t :: 336;
    SteamInventoryFullUpdate_t :: 4701;
    FriendsGetFollowerCount_t :: 344;
    MusicPlayerRemoteWillActivate_t :: 4101;
    GameConnectedChatLeave_t :: 340;
    RemoteStorageAppSyncedServer_t :: 1302;
    MusicPlayerRemoteWillDeactivate_t :: 4102;
    HTML_StatusText_t :: 4523;
    SteamInventoryEligiblePromoItemDefIDs_t :: 4703;
    StartPlaytimeTrackingResult_t :: 3410;
    MusicPlayerWantsPlayingRepeatStatus_t :: 4114;
    LeaderboardScoreUploaded_t :: 1106;
    AddUGCDependencyResult_t :: 3412;
    DeleteItemResult_t :: 3417;
    SearchForGameProgressCallback_t :: 5201;
    HTTPRequestHeadersReceived_t :: 2102;
    MusicPlayerRemoteToFront_t :: 4103;
    GamepadTextInputDismissed_t :: 714;
    RemoteStorageDeletePublishedFileResult_t :: 1311;
    HTTPRequestDataReceived_t :: 2103;
    HTML_FinishedRequest_t :: 4506;
    SteamInventoryDefinitionUpdate_t :: 4702;
    SteamParentalSettingsChanged_t :: 5001;
    RemoteStorageEnumeratePublishedFilesByUserActionResult_t :: 1328;
    MusicPlayerWantsPause_t :: 4106;
    SteamInventoryResultReady_t :: 4700;
    LobbyCreated_t :: 513;
    LobbyChatMsg_t :: 507;
    SteamNetConnectionStatusChangedCallback_t :: 1221;
    P2PSessionConnectFail_t :: 1203;
    DownloadItemResult_t :: 3406;
    HTML_HorizontalScroll_t :: 4511;
    AvatarImageLoaded_t :: 334;
    ItemInstalled_t :: 3405;
    UserFavoriteItemsListChanged_t :: 3407;
    SteamAppInstalled_t :: 3901;
    MusicPlayerSelectsPlaylistEntry_t :: 4013;
    AddAppDependencyResult_t :: 3414;
    HTML_NeedsPaint_t :: 4502;
    LobbyChatUpdate_t :: 506;
    HTML_HideToolTip_t :: 4526;
    CheckFileSignature_t :: 705;
    RemoteStorageGetPublishedFileDetailsResult_t :: 1318;
    SubmitPlayerResultResultCallback_t :: 5214;
    RemoteStorageSetUserPublishedFileActionResult_t :: 1327;
    GameConnectedClanChatMsg_t :: 338;
    LicensesUpdated_t :: 125;
    FavoritesListChanged_t :: 502;
    FavoritesListAccountsUpdated_t :: 516;
    GSClientAchievementStatus_t :: 206;
    SteamNetworkingMessagesSessionFailed_t :: 1252;
    RemoteStorageAppSyncStatusCheck_t :: 1305;
    HTML_UpdateToolTip_t :: 4525;
    MarketEligibilityResponse_t :: 166;
    MusicPlayerWantsShuffled_t :: 4109;
    HTML_VerticalScroll_t :: 4512;
    SteamRemotePlaySessionConnected_t :: 5701;
    HTML_FileOpenDialog_t :: 4516;
    GetAuthSessionTicketResponse_t :: 163;
    RegisterActivationCodeResponse_t :: 1008;
    SocketStatusCallback_t :: 1201;
    RemoteStorageFileShareResult_t :: 1307;
    ClientGameServerDeny_t :: 113;
    GSStatsStored_t :: 1801;
    RemoteStorageEnumerateUserSubscribedFilesResult_t :: 1314;
    LeaderboardScoresDownloaded_t :: 1105;
    SteamShutdown_t :: 704;
    P2PSessionRequest_t :: 1202;
    RemoteStorageUpdateUserPublishedItemVoteResult_t :: 1324;
    DurationControl_t :: 167;
    RemoteStorageEnumerateUserSharedWorkshopFilesResult_t :: 1326;
    DownloadClanActivityCountsResult_t :: 341;
    MusicPlayerSelectsQueueEntry_t :: 4012;
    GlobalStatsReceived_t :: 1112;
    GameConnectedFriendChatMsg_t :: 343;
    RemoteStorageEnumerateWorkshopFilesResult_t :: 1319;
    VolumeHasChanged_t :: 4002;
    StopPlaytimeTrackingResult_t :: 3411;
    SteamAPICallCompleted_t :: 703;
    ChangeNumOpenSlotsCallback_t :: 5304;
    MusicPlayerWantsLooped_t :: 4110;
    HTTPRequestCompleted_t :: 2101;
    IPCountry_t :: 701;
    SteamAppUninstalled_t :: 3902;
    HTML_StartRequest_t :: 4503;
    ComputeNewPlayerCompatibilityResult_t :: 211;
    RemoteStorageUnsubscribePublishedFileResult_t :: 1315;
    HTML_BrowserReady_t :: 4501;
    SteamRemotePlaySessionDisconnected_t :: 5702;
    SearchForGameResultCallback_t :: 5202;
    RequestPlayersForGameResultCallback_t :: 5212;
    GameRichPresenceJoinRequested_t :: 337;
    ReservationNotificationCallback_t :: 5303;
    TimedTrialStatus_t :: 1030;
    SteamUGCRequestUGCDetailsResult_t :: 3402;
    GetAppDependenciesResult_t :: 3416;
    GSClientGroupStatus_t :: 208;
    MusicPlayerWantsVolume_t :: 4011;
    RemoteStorageUserVoteDetails_t :: 1325;
    ScreenshotRequested_t :: 2302;
    DlcInstalled_t :: 1005;
    GSPolicyResponse_t :: 115;
    OverlayBrowserProtocolNavigation_t :: 349;
    EndGameResultCallback_t :: 5215;
    SteamUGCQueryCompleted_t :: 3401;
    PlaybackStatusHasChanged_t :: 4001;
    RemoteStoragePublishedFileUnsubscribed_t :: 1322;
    HTML_SetCursor_t :: 4522;
    SteamInventoryStartPurchaseResult_t :: 4704;
    RemoveUGCDependencyResult_t :: 3413;
    GSReputation_t :: 209;
    GSStatsReceived_t :: 1800;
    HTML_BrowserRestarted_t :: 4527;
    RemoteStorageAppSyncedClient_t :: 1301;
    ActiveBeaconsUpdated_t :: 5306;
    MusicPlayerWantsPlay_t :: 4105;
    LobbyInvite_t :: 503;
    JoinPartyCallback_t :: 5301;
    HTML_SearchResults_t :: 4509;
    SteamServersDisconnected_t :: 103;
    RemoteStorageFileWriteAsyncComplete_t :: 1331;
    UserAchievementStored_t :: 1103;
    HTML_JSAlert_t :: 4514;
    HTML_LinkAtPosition_t :: 4513;
    LobbyDataUpdate_t :: 505;
    GameServerChangeRequested_t :: 332;
    RequestPlayersForGameFinalResultCallback_t :: 5213;
    LeaderboardUGCSet_t :: 1111;
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

Callbacks : struct {
    StoreAuthURLResponse_t : [..] StoreAuthURLResponse_t_Callback;
    RemoteStorageSubscribePublishedFileResult_t : [..] RemoteStorageSubscribePublishedFileResult_t_Callback;
    SteamServerConnectFailure_t : [..] SteamServerConnectFailure_t_Callback;
    EncryptedAppTicketResponse_t : [..] EncryptedAppTicketResponse_t_Callback;
    HTML_OpenLinkInNewTab_t : [..] HTML_OpenLinkInNewTab_t_Callback;
    GSClientApprove_t : [..] GSClientApprove_t_Callback;
    LobbyMatchList_t : [..] LobbyMatchList_t_Callback;
    RemoteStorageFileReadAsyncComplete_t : [..] RemoteStorageFileReadAsyncComplete_t_Callback;
    RemoteStoragePublishFileResult_t : [..] RemoteStoragePublishFileResult_t_Callback;
    SetPersonaNameResponse_t : [..] SetPersonaNameResponse_t_Callback;
    AppProofOfPurchaseKeyResponse_t : [..] AppProofOfPurchaseKeyResponse_t_Callback;
    UserAchievementIconFetched_t : [..] UserAchievementIconFetched_t_Callback;
    MusicPlayerWillQuit_t : [..] MusicPlayerWillQuit_t_Callback;
    RemoveAppDependencyResult_t : [..] RemoveAppDependencyResult_t_Callback;
    SteamServersConnected_t : [..] SteamServersConnected_t_Callback;
    SteamInventoryRequestPricesResult_t : [..] SteamInventoryRequestPricesResult_t_Callback;
    MicroTxnAuthorizationResponse_t : [..] MicroTxnAuthorizationResponse_t_Callback;
    ValidateAuthTicketResponse_t : [..] ValidateAuthTicketResponse_t_Callback;
    GameConnectedChatJoin_t : [..] GameConnectedChatJoin_t_Callback;
    PersonaStateChange_t : [..] PersonaStateChange_t_Callback;
    SteamRelayNetworkStatus_t : [..] SteamRelayNetworkStatus_t_Callback;
    FileDetailsResult_t : [..] FileDetailsResult_t_Callback;
    RemoteStorageEnumerateUserPublishedFilesResult_t : [..] RemoteStorageEnumerateUserPublishedFilesResult_t_Callback;
    LowBatteryPower_t : [..] LowBatteryPower_t_Callback;
    CreateBeaconCallback_t : [..] CreateBeaconCallback_t_Callback;
    UserStatsUnloaded_t : [..] UserStatsUnloaded_t_Callback;
    RemoteStorageUpdatePublishedFileResult_t : [..] RemoteStorageUpdatePublishedFileResult_t_Callback;
    JoinClanChatRoomCompletionResult_t : [..] JoinClanChatRoomCompletionResult_t_Callback;
    AssociateWithClanResult_t : [..] AssociateWithClanResult_t_Callback;
    HTML_URLChanged_t : [..] HTML_URLChanged_t_Callback;
    ClanOfficerListResponse_t : [..] ClanOfficerListResponse_t_Callback;
    FriendsEnumerateFollowingList_t : [..] FriendsEnumerateFollowingList_t_Callback;
    UnreadChatMessagesChanged_t : [..] UnreadChatMessagesChanged_t_Callback;
    RemoteStoragePublishedFileDeleted_t : [..] RemoteStoragePublishedFileDeleted_t_Callback;
    SteamNetworkingMessagesSessionRequest_t : [..] SteamNetworkingMessagesSessionRequest_t_Callback;
    LobbyEnter_t : [..] LobbyEnter_t_Callback;
    MusicPlayerWantsPlayPrevious_t : [..] MusicPlayerWantsPlayPrevious_t_Callback;
    SubmitItemUpdateResult_t : [..] SubmitItemUpdateResult_t_Callback;
    GetUserItemVoteResult_t : [..] GetUserItemVoteResult_t_Callback;
    HTML_ShowToolTip_t : [..] HTML_ShowToolTip_t_Callback;
    SteamNetAuthenticationStatus_t : [..] SteamNetAuthenticationStatus_t_Callback;
    SetUserItemVoteResult_t : [..] SetUserItemVoteResult_t_Callback;
    LobbyGameCreated_t : [..] LobbyGameCreated_t_Callback;
    RequestPlayersForGameProgressCallback_t : [..] RequestPlayersForGameProgressCallback_t_Callback;
    GSClientDeny_t : [..] GSClientDeny_t_Callback;
    MusicPlayerWantsPlayNext_t : [..] MusicPlayerWantsPlayNext_t_Callback;
    CreateItemResult_t : [..] CreateItemResult_t_Callback;
    HTML_ChangedTitle_t : [..] HTML_ChangedTitle_t_Callback;
    LobbyKicked_t : [..] LobbyKicked_t_Callback;
    RemoteStorageAppSyncProgress_t : [..] RemoteStorageAppSyncProgress_t_Callback;
    NumberOfCurrentPlayers_t : [..] NumberOfCurrentPlayers_t_Callback;
    HTML_CanGoBackAndForward_t : [..] HTML_CanGoBackAndForward_t_Callback;
    RemoteStoragePublishedFileUpdated_t : [..] RemoteStoragePublishedFileUpdated_t_Callback;
    AvailableBeaconLocationsUpdated_t : [..] AvailableBeaconLocationsUpdated_t_Callback;
    GSGameplayStats_t : [..] GSGameplayStats_t_Callback;
    LeaderboardFindResult_t : [..] LeaderboardFindResult_t_Callback;
    IPCFailure_t : [..] IPCFailure_t_Callback;
    RemoteStoragePublishedFileSubscribed_t : [..] RemoteStoragePublishedFileSubscribed_t_Callback;
    RemoteStorageDownloadUGCResult_t : [..] RemoteStorageDownloadUGCResult_t_Callback;
    ScreenshotReady_t : [..] ScreenshotReady_t_Callback;
    HTML_CloseBrowser_t : [..] HTML_CloseBrowser_t_Callback;
    PS3TrophiesInstalled_t : [..] PS3TrophiesInstalled_t_Callback;
    GameWebCallback_t : [..] GameWebCallback_t_Callback;
    HTML_NewWindow_t : [..] HTML_NewWindow_t_Callback;
    GetVideoURLResult_t : [..] GetVideoURLResult_t_Callback;
    GameLobbyJoinRequested_t : [..] GameLobbyJoinRequested_t_Callback;
    RemoteStoragePublishFileProgress_t : [..] RemoteStoragePublishFileProgress_t_Callback;
    HTML_JSConfirm_t : [..] HTML_JSConfirm_t_Callback;
    PSNGameBootInviteResult_t : [..] PSNGameBootInviteResult_t_Callback;
    UserStatsReceived_t : [..] UserStatsReceived_t_Callback;
    UserStatsStored_t : [..] UserStatsStored_t_Callback;
    GlobalAchievementPercentagesReady_t : [..] GlobalAchievementPercentagesReady_t_Callback;
    NewUrlLaunchParameters_t : [..] NewUrlLaunchParameters_t_Callback;
    GetOPFSettingsResult_t : [..] GetOPFSettingsResult_t_Callback;
    FriendsIsFollowing_t : [..] FriendsIsFollowing_t_Callback;
    GameOverlayActivated_t : [..] GameOverlayActivated_t_Callback;
    RemoteStorageGetPublishedItemVoteDetailsResult_t : [..] RemoteStorageGetPublishedItemVoteDetailsResult_t_Callback;
    FriendRichPresenceUpdate_t : [..] FriendRichPresenceUpdate_t_Callback;
    SteamInventoryFullUpdate_t : [..] SteamInventoryFullUpdate_t_Callback;
    FriendsGetFollowerCount_t : [..] FriendsGetFollowerCount_t_Callback;
    MusicPlayerRemoteWillActivate_t : [..] MusicPlayerRemoteWillActivate_t_Callback;
    GameConnectedChatLeave_t : [..] GameConnectedChatLeave_t_Callback;
    RemoteStorageAppSyncedServer_t : [..] RemoteStorageAppSyncedServer_t_Callback;
    MusicPlayerRemoteWillDeactivate_t : [..] MusicPlayerRemoteWillDeactivate_t_Callback;
    HTML_StatusText_t : [..] HTML_StatusText_t_Callback;
    SteamInventoryEligiblePromoItemDefIDs_t : [..] SteamInventoryEligiblePromoItemDefIDs_t_Callback;
    StartPlaytimeTrackingResult_t : [..] StartPlaytimeTrackingResult_t_Callback;
    MusicPlayerWantsPlayingRepeatStatus_t : [..] MusicPlayerWantsPlayingRepeatStatus_t_Callback;
    LeaderboardScoreUploaded_t : [..] LeaderboardScoreUploaded_t_Callback;
    AddUGCDependencyResult_t : [..] AddUGCDependencyResult_t_Callback;
    DeleteItemResult_t : [..] DeleteItemResult_t_Callback;
    SearchForGameProgressCallback_t : [..] SearchForGameProgressCallback_t_Callback;
    HTTPRequestHeadersReceived_t : [..] HTTPRequestHeadersReceived_t_Callback;
    MusicPlayerRemoteToFront_t : [..] MusicPlayerRemoteToFront_t_Callback;
    GamepadTextInputDismissed_t : [..] GamepadTextInputDismissed_t_Callback;
    RemoteStorageDeletePublishedFileResult_t : [..] RemoteStorageDeletePublishedFileResult_t_Callback;
    HTTPRequestDataReceived_t : [..] HTTPRequestDataReceived_t_Callback;
    HTML_FinishedRequest_t : [..] HTML_FinishedRequest_t_Callback;
    SteamInventoryDefinitionUpdate_t : [..] SteamInventoryDefinitionUpdate_t_Callback;
    SteamParentalSettingsChanged_t : [..] SteamParentalSettingsChanged_t_Callback;
    RemoteStorageEnumeratePublishedFilesByUserActionResult_t : [..] RemoteStorageEnumeratePublishedFilesByUserActionResult_t_Callback;
    MusicPlayerWantsPause_t : [..] MusicPlayerWantsPause_t_Callback;
    SteamInventoryResultReady_t : [..] SteamInventoryResultReady_t_Callback;
    LobbyCreated_t : [..] LobbyCreated_t_Callback;
    LobbyChatMsg_t : [..] LobbyChatMsg_t_Callback;
    SteamNetConnectionStatusChangedCallback_t : [..] SteamNetConnectionStatusChangedCallback_t_Callback;
    P2PSessionConnectFail_t : [..] P2PSessionConnectFail_t_Callback;
    DownloadItemResult_t : [..] DownloadItemResult_t_Callback;
    HTML_HorizontalScroll_t : [..] HTML_HorizontalScroll_t_Callback;
    AvatarImageLoaded_t : [..] AvatarImageLoaded_t_Callback;
    ItemInstalled_t : [..] ItemInstalled_t_Callback;
    UserFavoriteItemsListChanged_t : [..] UserFavoriteItemsListChanged_t_Callback;
    SteamAppInstalled_t : [..] SteamAppInstalled_t_Callback;
    MusicPlayerSelectsPlaylistEntry_t : [..] MusicPlayerSelectsPlaylistEntry_t_Callback;
    AddAppDependencyResult_t : [..] AddAppDependencyResult_t_Callback;
    HTML_NeedsPaint_t : [..] HTML_NeedsPaint_t_Callback;
    LobbyChatUpdate_t : [..] LobbyChatUpdate_t_Callback;
    HTML_HideToolTip_t : [..] HTML_HideToolTip_t_Callback;
    CheckFileSignature_t : [..] CheckFileSignature_t_Callback;
    RemoteStorageGetPublishedFileDetailsResult_t : [..] RemoteStorageGetPublishedFileDetailsResult_t_Callback;
    SubmitPlayerResultResultCallback_t : [..] SubmitPlayerResultResultCallback_t_Callback;
    RemoteStorageSetUserPublishedFileActionResult_t : [..] RemoteStorageSetUserPublishedFileActionResult_t_Callback;
    GameConnectedClanChatMsg_t : [..] GameConnectedClanChatMsg_t_Callback;
    LicensesUpdated_t : [..] LicensesUpdated_t_Callback;
    FavoritesListChanged_t : [..] FavoritesListChanged_t_Callback;
    FavoritesListAccountsUpdated_t : [..] FavoritesListAccountsUpdated_t_Callback;
    GSClientAchievementStatus_t : [..] GSClientAchievementStatus_t_Callback;
    SteamNetworkingMessagesSessionFailed_t : [..] SteamNetworkingMessagesSessionFailed_t_Callback;
    RemoteStorageAppSyncStatusCheck_t : [..] RemoteStorageAppSyncStatusCheck_t_Callback;
    HTML_UpdateToolTip_t : [..] HTML_UpdateToolTip_t_Callback;
    MarketEligibilityResponse_t : [..] MarketEligibilityResponse_t_Callback;
    MusicPlayerWantsShuffled_t : [..] MusicPlayerWantsShuffled_t_Callback;
    HTML_VerticalScroll_t : [..] HTML_VerticalScroll_t_Callback;
    SteamRemotePlaySessionConnected_t : [..] SteamRemotePlaySessionConnected_t_Callback;
    HTML_FileOpenDialog_t : [..] HTML_FileOpenDialog_t_Callback;
    GetAuthSessionTicketResponse_t : [..] GetAuthSessionTicketResponse_t_Callback;
    RegisterActivationCodeResponse_t : [..] RegisterActivationCodeResponse_t_Callback;
    GSStatsUnloaded_t : [..] GSStatsUnloaded_t_Callback;
    SocketStatusCallback_t : [..] SocketStatusCallback_t_Callback;
    RemoteStorageFileShareResult_t : [..] RemoteStorageFileShareResult_t_Callback;
    ClientGameServerDeny_t : [..] ClientGameServerDeny_t_Callback;
    GSStatsStored_t : [..] GSStatsStored_t_Callback;
    RemoteStorageEnumerateUserSubscribedFilesResult_t : [..] RemoteStorageEnumerateUserSubscribedFilesResult_t_Callback;
    LeaderboardScoresDownloaded_t : [..] LeaderboardScoresDownloaded_t_Callback;
    SteamShutdown_t : [..] SteamShutdown_t_Callback;
    P2PSessionRequest_t : [..] P2PSessionRequest_t_Callback;
    RemoteStorageUpdateUserPublishedItemVoteResult_t : [..] RemoteStorageUpdateUserPublishedItemVoteResult_t_Callback;
    DurationControl_t : [..] DurationControl_t_Callback;
    RemoteStorageEnumerateUserSharedWorkshopFilesResult_t : [..] RemoteStorageEnumerateUserSharedWorkshopFilesResult_t_Callback;
    DownloadClanActivityCountsResult_t : [..] DownloadClanActivityCountsResult_t_Callback;
    MusicPlayerSelectsQueueEntry_t : [..] MusicPlayerSelectsQueueEntry_t_Callback;
    GlobalStatsReceived_t : [..] GlobalStatsReceived_t_Callback;
    GameConnectedFriendChatMsg_t : [..] GameConnectedFriendChatMsg_t_Callback;
    RemoteStorageEnumerateWorkshopFilesResult_t : [..] RemoteStorageEnumerateWorkshopFilesResult_t_Callback;
    VolumeHasChanged_t : [..] VolumeHasChanged_t_Callback;
    StopPlaytimeTrackingResult_t : [..] StopPlaytimeTrackingResult_t_Callback;
    SteamAPICallCompleted_t : [..] SteamAPICallCompleted_t_Callback;
    ChangeNumOpenSlotsCallback_t : [..] ChangeNumOpenSlotsCallback_t_Callback;
    MusicPlayerWantsLooped_t : [..] MusicPlayerWantsLooped_t_Callback;
    HTTPRequestCompleted_t : [..] HTTPRequestCompleted_t_Callback;
    IPCountry_t : [..] IPCountry_t_Callback;
    SteamAppUninstalled_t : [..] SteamAppUninstalled_t_Callback;
    HTML_StartRequest_t : [..] HTML_StartRequest_t_Callback;
    ComputeNewPlayerCompatibilityResult_t : [..] ComputeNewPlayerCompatibilityResult_t_Callback;
    RemoteStorageUnsubscribePublishedFileResult_t : [..] RemoteStorageUnsubscribePublishedFileResult_t_Callback;
    HTML_BrowserReady_t : [..] HTML_BrowserReady_t_Callback;
    SteamRemotePlaySessionDisconnected_t : [..] SteamRemotePlaySessionDisconnected_t_Callback;
    SearchForGameResultCallback_t : [..] SearchForGameResultCallback_t_Callback;
    RequestPlayersForGameResultCallback_t : [..] RequestPlayersForGameResultCallback_t_Callback;
    GameRichPresenceJoinRequested_t : [..] GameRichPresenceJoinRequested_t_Callback;
    ReservationNotificationCallback_t : [..] ReservationNotificationCallback_t_Callback;
    TimedTrialStatus_t : [..] TimedTrialStatus_t_Callback;
    SteamUGCRequestUGCDetailsResult_t : [..] SteamUGCRequestUGCDetailsResult_t_Callback;
    GetAppDependenciesResult_t : [..] GetAppDependenciesResult_t_Callback;
    GSClientGroupStatus_t : [..] GSClientGroupStatus_t_Callback;
    MusicPlayerWantsVolume_t : [..] MusicPlayerWantsVolume_t_Callback;
    RemoteStorageUserVoteDetails_t : [..] RemoteStorageUserVoteDetails_t_Callback;
    ScreenshotRequested_t : [..] ScreenshotRequested_t_Callback;
    DlcInstalled_t : [..] DlcInstalled_t_Callback;
    GSPolicyResponse_t : [..] GSPolicyResponse_t_Callback;
    OverlayBrowserProtocolNavigation_t : [..] OverlayBrowserProtocolNavigation_t_Callback;
    EndGameResultCallback_t : [..] EndGameResultCallback_t_Callback;
    SteamUGCQueryCompleted_t : [..] SteamUGCQueryCompleted_t_Callback;
    PlaybackStatusHasChanged_t : [..] PlaybackStatusHasChanged_t_Callback;
    RemoteStoragePublishedFileUnsubscribed_t : [..] RemoteStoragePublishedFileUnsubscribed_t_Callback;
    HTML_SetCursor_t : [..] HTML_SetCursor_t_Callback;
    SteamInventoryStartPurchaseResult_t : [..] SteamInventoryStartPurchaseResult_t_Callback;
    RemoveUGCDependencyResult_t : [..] RemoveUGCDependencyResult_t_Callback;
    GSReputation_t : [..] GSReputation_t_Callback;
    GSStatsReceived_t : [..] GSStatsReceived_t_Callback;
    HTML_BrowserRestarted_t : [..] HTML_BrowserRestarted_t_Callback;
    RemoteStorageAppSyncedClient_t : [..] RemoteStorageAppSyncedClient_t_Callback;
    ActiveBeaconsUpdated_t : [..] ActiveBeaconsUpdated_t_Callback;
    MusicPlayerWantsPlay_t : [..] MusicPlayerWantsPlay_t_Callback;
    LobbyInvite_t : [..] LobbyInvite_t_Callback;
    JoinPartyCallback_t : [..] JoinPartyCallback_t_Callback;
    HTML_SearchResults_t : [..] HTML_SearchResults_t_Callback;
    SteamServersDisconnected_t : [..] SteamServersDisconnected_t_Callback;
    RemoteStorageFileWriteAsyncComplete_t : [..] RemoteStorageFileWriteAsyncComplete_t_Callback;
    UserAchievementStored_t : [..] UserAchievementStored_t_Callback;
    HTML_JSAlert_t : [..] HTML_JSAlert_t_Callback;
    HTML_LinkAtPosition_t : [..] HTML_LinkAtPosition_t_Callback;
    LobbyDataUpdate_t : [..] LobbyDataUpdate_t_Callback;
    GameServerChangeRequested_t : [..] GameServerChangeRequested_t_Callback;
    RequestPlayersForGameFinalResultCallback_t : [..] RequestPlayersForGameFinalResultCallback_t_Callback;
    LeaderboardUGCSet_t : [..] LeaderboardUGCSet_t_Callback;
    GSClientKick_t : [..] GSClientKick_t_Callback;
}

CallResults : struct {
    StoreAuthURLResponse_t : Table(SteamAPICall_t, [..] StoreAuthURLResponse_t_CallResult);
    RemoteStorageDeletePublishedFileResult_t : Table(SteamAPICall_t, [..] RemoteStorageDeletePublishedFileResult_t_CallResult);
    RemoteStorageSubscribePublishedFileResult_t : Table(SteamAPICall_t, [..] RemoteStorageSubscribePublishedFileResult_t_CallResult);
    EncryptedAppTicketResponse_t : Table(SteamAPICall_t, [..] EncryptedAppTicketResponse_t_CallResult);
    CreateItemResult_t : Table(SteamAPICall_t, [..] CreateItemResult_t_CallResult);
    LobbyMatchList_t : Table(SteamAPICall_t, [..] LobbyMatchList_t_CallResult);
    DownloadClanActivityCountsResult_t : Table(SteamAPICall_t, [..] DownloadClanActivityCountsResult_t_CallResult);
    RemoteStorageFileReadAsyncComplete_t : Table(SteamAPICall_t, [..] RemoteStorageFileReadAsyncComplete_t_CallResult);
    RemoteStorageEnumeratePublishedFilesByUserActionResult_t : Table(SteamAPICall_t, [..] RemoteStorageEnumeratePublishedFilesByUserActionResult_t_CallResult);
    LobbyCreated_t : Table(SteamAPICall_t, [..] LobbyCreated_t_CallResult);
    GlobalStatsReceived_t : Table(SteamAPICall_t, [..] GlobalStatsReceived_t_CallResult);
    RemoteStorageEnumerateWorkshopFilesResult_t : Table(SteamAPICall_t, [..] RemoteStorageEnumerateWorkshopFilesResult_t_CallResult);
    SetPersonaNameResponse_t : Table(SteamAPICall_t, [..] SetPersonaNameResponse_t_CallResult);
    StopPlaytimeTrackingResult_t : Table(SteamAPICall_t, [..] StopPlaytimeTrackingResult_t_CallResult);
    NumberOfCurrentPlayers_t : Table(SteamAPICall_t, [..] NumberOfCurrentPlayers_t_CallResult);
    ChangeNumOpenSlotsCallback_t : Table(SteamAPICall_t, [..] ChangeNumOpenSlotsCallback_t_CallResult);
    RemoveAppDependencyResult_t : Table(SteamAPICall_t, [..] RemoveAppDependencyResult_t_CallResult);
    UserFavoriteItemsListChanged_t : Table(SteamAPICall_t, [..] UserFavoriteItemsListChanged_t_CallResult);
    SteamInventoryRequestPricesResult_t : Table(SteamAPICall_t, [..] SteamInventoryRequestPricesResult_t_CallResult);
    AddAppDependencyResult_t : Table(SteamAPICall_t, [..] AddAppDependencyResult_t_CallResult);
    LeaderboardFindResult_t : Table(SteamAPICall_t, [..] LeaderboardFindResult_t_CallResult);
    RemoteStorageDownloadUGCResult_t : Table(SteamAPICall_t, [..] RemoteStorageDownloadUGCResult_t_CallResult);
    CheckFileSignature_t : Table(SteamAPICall_t, [..] CheckFileSignature_t_CallResult);
    RemoteStorageGetPublishedFileDetailsResult_t : Table(SteamAPICall_t, [..] RemoteStorageGetPublishedFileDetailsResult_t_CallResult);
    FileDetailsResult_t : Table(SteamAPICall_t, [..] FileDetailsResult_t_CallResult);
    ComputeNewPlayerCompatibilityResult_t : Table(SteamAPICall_t, [..] ComputeNewPlayerCompatibilityResult_t_CallResult);
    RemoteStorageSetUserPublishedFileActionResult_t : Table(SteamAPICall_t, [..] RemoteStorageSetUserPublishedFileActionResult_t_CallResult);
    RemoteStorageEnumerateUserPublishedFilesResult_t : Table(SteamAPICall_t, [..] RemoteStorageEnumerateUserPublishedFilesResult_t_CallResult);
    RemoteStorageUnsubscribePublishedFileResult_t : Table(SteamAPICall_t, [..] RemoteStorageUnsubscribePublishedFileResult_t_CallResult);
    RemoteStoragePublishFileProgress_t : Table(SteamAPICall_t, [..] RemoteStoragePublishFileProgress_t_CallResult);
    CreateBeaconCallback_t : Table(SteamAPICall_t, [..] CreateBeaconCallback_t_CallResult);
    HTML_BrowserReady_t : Table(SteamAPICall_t, [..] HTML_BrowserReady_t_CallResult);
    MarketEligibilityResponse_t : Table(SteamAPICall_t, [..] MarketEligibilityResponse_t_CallResult);
    RemoteStorageUpdatePublishedFileResult_t : Table(SteamAPICall_t, [..] RemoteStorageUpdatePublishedFileResult_t_CallResult);
    UserStatsReceived_t : Table(SteamAPICall_t, [..] UserStatsReceived_t_CallResult);
    JoinClanChatRoomCompletionResult_t : Table(SteamAPICall_t, [..] JoinClanChatRoomCompletionResult_t_CallResult);
    GlobalAchievementPercentagesReady_t : Table(SteamAPICall_t, [..] GlobalAchievementPercentagesReady_t_CallResult);
    AssociateWithClanResult_t : Table(SteamAPICall_t, [..] AssociateWithClanResult_t_CallResult);
    GetAppDependenciesResult_t : Table(SteamAPICall_t, [..] GetAppDependenciesResult_t_CallResult);
    FriendsIsFollowing_t : Table(SteamAPICall_t, [..] FriendsIsFollowing_t_CallResult);
    SteamUGCRequestUGCDetailsResult_t : Table(SteamAPICall_t, [..] SteamUGCRequestUGCDetailsResult_t_CallResult);
    ClanOfficerListResponse_t : Table(SteamAPICall_t, [..] ClanOfficerListResponse_t_CallResult);
    FriendsEnumerateFollowingList_t : Table(SteamAPICall_t, [..] FriendsEnumerateFollowingList_t_CallResult);
    RemoteStorageGetPublishedItemVoteDetailsResult_t : Table(SteamAPICall_t, [..] RemoteStorageGetPublishedItemVoteDetailsResult_t_CallResult);
    LobbyEnter_t : Table(SteamAPICall_t, [..] LobbyEnter_t_CallResult);
    SteamUGCQueryCompleted_t : Table(SteamAPICall_t, [..] SteamUGCQueryCompleted_t_CallResult);
    GSReputation_t : Table(SteamAPICall_t, [..] GSReputation_t_CallResult);
    FriendsGetFollowerCount_t : Table(SteamAPICall_t, [..] FriendsGetFollowerCount_t_CallResult);
    SteamInventoryEligiblePromoItemDefIDs_t : Table(SteamAPICall_t, [..] SteamInventoryEligiblePromoItemDefIDs_t_CallResult);
    SteamInventoryStartPurchaseResult_t : Table(SteamAPICall_t, [..] SteamInventoryStartPurchaseResult_t_CallResult);
    RemoteStorageFileShareResult_t : Table(SteamAPICall_t, [..] RemoteStorageFileShareResult_t_CallResult);
    RemoveUGCDependencyResult_t : Table(SteamAPICall_t, [..] RemoveUGCDependencyResult_t_CallResult);
    StartPlaytimeTrackingResult_t : Table(SteamAPICall_t, [..] StartPlaytimeTrackingResult_t_CallResult);
    GSStatsReceived_t : Table(SteamAPICall_t, [..] GSStatsReceived_t_CallResult);
    GSStatsStored_t : Table(SteamAPICall_t, [..] GSStatsStored_t_CallResult);
    SubmitItemUpdateResult_t : Table(SteamAPICall_t, [..] SubmitItemUpdateResult_t_CallResult);
    GetUserItemVoteResult_t : Table(SteamAPICall_t, [..] GetUserItemVoteResult_t_CallResult);
    LeaderboardScoreUploaded_t : Table(SteamAPICall_t, [..] LeaderboardScoreUploaded_t_CallResult);
    RemoteStorageEnumerateUserSubscribedFilesResult_t : Table(SteamAPICall_t, [..] RemoteStorageEnumerateUserSubscribedFilesResult_t_CallResult);
    JoinPartyCallback_t : Table(SteamAPICall_t, [..] JoinPartyCallback_t_CallResult);
    AddUGCDependencyResult_t : Table(SteamAPICall_t, [..] AddUGCDependencyResult_t_CallResult);
    LeaderboardScoresDownloaded_t : Table(SteamAPICall_t, [..] LeaderboardScoresDownloaded_t_CallResult);
    DeleteItemResult_t : Table(SteamAPICall_t, [..] DeleteItemResult_t_CallResult);
    RemoteStorageFileWriteAsyncComplete_t : Table(SteamAPICall_t, [..] RemoteStorageFileWriteAsyncComplete_t_CallResult);
    SetUserItemVoteResult_t : Table(SteamAPICall_t, [..] SetUserItemVoteResult_t_CallResult);
    DurationControl_t : Table(SteamAPICall_t, [..] DurationControl_t_CallResult);
    RemoteStorageUpdateUserPublishedItemVoteResult_t : Table(SteamAPICall_t, [..] RemoteStorageUpdateUserPublishedItemVoteResult_t_CallResult);
    LeaderboardUGCSet_t : Table(SteamAPICall_t, [..] LeaderboardUGCSet_t_CallResult);
}

StoreAuthURLResponse_t_Callback :: #type(StoreAuthURLResponse_t);
RemoteStorageSubscribePublishedFileResult_t_Callback :: #type(RemoteStorageSubscribePublishedFileResult_t);
SteamServerConnectFailure_t_Callback :: #type(SteamServerConnectFailure_t);
EncryptedAppTicketResponse_t_Callback :: #type(EncryptedAppTicketResponse_t);
HTML_OpenLinkInNewTab_t_Callback :: #type(HTML_OpenLinkInNewTab_t);
GSClientApprove_t_Callback :: #type(GSClientApprove_t);
LobbyMatchList_t_Callback :: #type(LobbyMatchList_t);
RemoteStorageFileReadAsyncComplete_t_Callback :: #type(RemoteStorageFileReadAsyncComplete_t);
RemoteStoragePublishFileResult_t_Callback :: #type(RemoteStoragePublishFileResult_t);
SetPersonaNameResponse_t_Callback :: #type(SetPersonaNameResponse_t);
AppProofOfPurchaseKeyResponse_t_Callback :: #type(AppProofOfPurchaseKeyResponse_t);
UserAchievementIconFetched_t_Callback :: #type(UserAchievementIconFetched_t);
MusicPlayerWillQuit_t_Callback :: #type(MusicPlayerWillQuit_t);
RemoveAppDependencyResult_t_Callback :: #type(RemoveAppDependencyResult_t);
SteamServersConnected_t_Callback :: #type(SteamServersConnected_t);
SteamInventoryRequestPricesResult_t_Callback :: #type(SteamInventoryRequestPricesResult_t);
MicroTxnAuthorizationResponse_t_Callback :: #type(MicroTxnAuthorizationResponse_t);
ValidateAuthTicketResponse_t_Callback :: #type(ValidateAuthTicketResponse_t);
GameConnectedChatJoin_t_Callback :: #type(GameConnectedChatJoin_t);
PersonaStateChange_t_Callback :: #type(PersonaStateChange_t);
SteamRelayNetworkStatus_t_Callback :: #type(SteamRelayNetworkStatus_t);
FileDetailsResult_t_Callback :: #type(FileDetailsResult_t);
RemoteStorageEnumerateUserPublishedFilesResult_t_Callback :: #type(RemoteStorageEnumerateUserPublishedFilesResult_t);
LowBatteryPower_t_Callback :: #type(LowBatteryPower_t);
CreateBeaconCallback_t_Callback :: #type(CreateBeaconCallback_t);
UserStatsUnloaded_t_Callback :: #type(UserStatsUnloaded_t);
RemoteStorageUpdatePublishedFileResult_t_Callback :: #type(RemoteStorageUpdatePublishedFileResult_t);
JoinClanChatRoomCompletionResult_t_Callback :: #type(JoinClanChatRoomCompletionResult_t);
AssociateWithClanResult_t_Callback :: #type(AssociateWithClanResult_t);
HTML_URLChanged_t_Callback :: #type(HTML_URLChanged_t);
ClanOfficerListResponse_t_Callback :: #type(ClanOfficerListResponse_t);
FriendsEnumerateFollowingList_t_Callback :: #type(FriendsEnumerateFollowingList_t);
UnreadChatMessagesChanged_t_Callback :: #type(UnreadChatMessagesChanged_t);
RemoteStoragePublishedFileDeleted_t_Callback :: #type(RemoteStoragePublishedFileDeleted_t);
SteamNetworkingMessagesSessionRequest_t_Callback :: #type(SteamNetworkingMessagesSessionRequest_t);
LobbyEnter_t_Callback :: #type(LobbyEnter_t);
MusicPlayerWantsPlayPrevious_t_Callback :: #type(MusicPlayerWantsPlayPrevious_t);
SubmitItemUpdateResult_t_Callback :: #type(SubmitItemUpdateResult_t);
GetUserItemVoteResult_t_Callback :: #type(GetUserItemVoteResult_t);
HTML_ShowToolTip_t_Callback :: #type(HTML_ShowToolTip_t);
SteamNetAuthenticationStatus_t_Callback :: #type(SteamNetAuthenticationStatus_t);
SetUserItemVoteResult_t_Callback :: #type(SetUserItemVoteResult_t);
LobbyGameCreated_t_Callback :: #type(LobbyGameCreated_t);
RequestPlayersForGameProgressCallback_t_Callback :: #type(RequestPlayersForGameProgressCallback_t);
GSClientDeny_t_Callback :: #type(GSClientDeny_t);
MusicPlayerWantsPlayNext_t_Callback :: #type(MusicPlayerWantsPlayNext_t);
CreateItemResult_t_Callback :: #type(CreateItemResult_t);
HTML_ChangedTitle_t_Callback :: #type(HTML_ChangedTitle_t);
LobbyKicked_t_Callback :: #type(LobbyKicked_t);
RemoteStorageAppSyncProgress_t_Callback :: #type(RemoteStorageAppSyncProgress_t);
NumberOfCurrentPlayers_t_Callback :: #type(NumberOfCurrentPlayers_t);
HTML_CanGoBackAndForward_t_Callback :: #type(HTML_CanGoBackAndForward_t);
RemoteStoragePublishedFileUpdated_t_Callback :: #type(RemoteStoragePublishedFileUpdated_t);
AvailableBeaconLocationsUpdated_t_Callback :: #type(AvailableBeaconLocationsUpdated_t);
GSGameplayStats_t_Callback :: #type(GSGameplayStats_t);
LeaderboardFindResult_t_Callback :: #type(LeaderboardFindResult_t);
IPCFailure_t_Callback :: #type(IPCFailure_t);
RemoteStoragePublishedFileSubscribed_t_Callback :: #type(RemoteStoragePublishedFileSubscribed_t);
RemoteStorageDownloadUGCResult_t_Callback :: #type(RemoteStorageDownloadUGCResult_t);
ScreenshotReady_t_Callback :: #type(ScreenshotReady_t);
HTML_CloseBrowser_t_Callback :: #type(HTML_CloseBrowser_t);
PS3TrophiesInstalled_t_Callback :: #type(PS3TrophiesInstalled_t);
GameWebCallback_t_Callback :: #type(GameWebCallback_t);
HTML_NewWindow_t_Callback :: #type(HTML_NewWindow_t);
GetVideoURLResult_t_Callback :: #type(GetVideoURLResult_t);
GameLobbyJoinRequested_t_Callback :: #type(GameLobbyJoinRequested_t);
RemoteStoragePublishFileProgress_t_Callback :: #type(RemoteStoragePublishFileProgress_t);
HTML_JSConfirm_t_Callback :: #type(HTML_JSConfirm_t);
PSNGameBootInviteResult_t_Callback :: #type(PSNGameBootInviteResult_t);
UserStatsReceived_t_Callback :: #type(UserStatsReceived_t);
UserStatsStored_t_Callback :: #type(UserStatsStored_t);
GlobalAchievementPercentagesReady_t_Callback :: #type(GlobalAchievementPercentagesReady_t);
NewUrlLaunchParameters_t_Callback :: #type(NewUrlLaunchParameters_t);
GetOPFSettingsResult_t_Callback :: #type(GetOPFSettingsResult_t);
FriendsIsFollowing_t_Callback :: #type(FriendsIsFollowing_t);
GameOverlayActivated_t_Callback :: #type(GameOverlayActivated_t);
RemoteStorageGetPublishedItemVoteDetailsResult_t_Callback :: #type(RemoteStorageGetPublishedItemVoteDetailsResult_t);
FriendRichPresenceUpdate_t_Callback :: #type(FriendRichPresenceUpdate_t);
SteamInventoryFullUpdate_t_Callback :: #type(SteamInventoryFullUpdate_t);
FriendsGetFollowerCount_t_Callback :: #type(FriendsGetFollowerCount_t);
MusicPlayerRemoteWillActivate_t_Callback :: #type(MusicPlayerRemoteWillActivate_t);
GameConnectedChatLeave_t_Callback :: #type(GameConnectedChatLeave_t);
RemoteStorageAppSyncedServer_t_Callback :: #type(RemoteStorageAppSyncedServer_t);
MusicPlayerRemoteWillDeactivate_t_Callback :: #type(MusicPlayerRemoteWillDeactivate_t);
HTML_StatusText_t_Callback :: #type(HTML_StatusText_t);
SteamInventoryEligiblePromoItemDefIDs_t_Callback :: #type(SteamInventoryEligiblePromoItemDefIDs_t);
StartPlaytimeTrackingResult_t_Callback :: #type(StartPlaytimeTrackingResult_t);
MusicPlayerWantsPlayingRepeatStatus_t_Callback :: #type(MusicPlayerWantsPlayingRepeatStatus_t);
LeaderboardScoreUploaded_t_Callback :: #type(LeaderboardScoreUploaded_t);
AddUGCDependencyResult_t_Callback :: #type(AddUGCDependencyResult_t);
DeleteItemResult_t_Callback :: #type(DeleteItemResult_t);
SearchForGameProgressCallback_t_Callback :: #type(SearchForGameProgressCallback_t);
HTTPRequestHeadersReceived_t_Callback :: #type(HTTPRequestHeadersReceived_t);
MusicPlayerRemoteToFront_t_Callback :: #type(MusicPlayerRemoteToFront_t);
GamepadTextInputDismissed_t_Callback :: #type(GamepadTextInputDismissed_t);
RemoteStorageDeletePublishedFileResult_t_Callback :: #type(RemoteStorageDeletePublishedFileResult_t);
HTTPRequestDataReceived_t_Callback :: #type(HTTPRequestDataReceived_t);
HTML_FinishedRequest_t_Callback :: #type(HTML_FinishedRequest_t);
SteamInventoryDefinitionUpdate_t_Callback :: #type(SteamInventoryDefinitionUpdate_t);
SteamParentalSettingsChanged_t_Callback :: #type(SteamParentalSettingsChanged_t);
RemoteStorageEnumeratePublishedFilesByUserActionResult_t_Callback :: #type(RemoteStorageEnumeratePublishedFilesByUserActionResult_t);
MusicPlayerWantsPause_t_Callback :: #type(MusicPlayerWantsPause_t);
SteamInventoryResultReady_t_Callback :: #type(SteamInventoryResultReady_t);
LobbyCreated_t_Callback :: #type(LobbyCreated_t);
LobbyChatMsg_t_Callback :: #type(LobbyChatMsg_t);
SteamNetConnectionStatusChangedCallback_t_Callback :: #type(SteamNetConnectionStatusChangedCallback_t);
P2PSessionConnectFail_t_Callback :: #type(P2PSessionConnectFail_t);
DownloadItemResult_t_Callback :: #type(DownloadItemResult_t);
HTML_HorizontalScroll_t_Callback :: #type(HTML_HorizontalScroll_t);
AvatarImageLoaded_t_Callback :: #type(AvatarImageLoaded_t);
ItemInstalled_t_Callback :: #type(ItemInstalled_t);
UserFavoriteItemsListChanged_t_Callback :: #type(UserFavoriteItemsListChanged_t);
SteamAppInstalled_t_Callback :: #type(SteamAppInstalled_t);
MusicPlayerSelectsPlaylistEntry_t_Callback :: #type(MusicPlayerSelectsPlaylistEntry_t);
AddAppDependencyResult_t_Callback :: #type(AddAppDependencyResult_t);
HTML_NeedsPaint_t_Callback :: #type(HTML_NeedsPaint_t);
LobbyChatUpdate_t_Callback :: #type(LobbyChatUpdate_t);
HTML_HideToolTip_t_Callback :: #type(HTML_HideToolTip_t);
CheckFileSignature_t_Callback :: #type(CheckFileSignature_t);
RemoteStorageGetPublishedFileDetailsResult_t_Callback :: #type(RemoteStorageGetPublishedFileDetailsResult_t);
SubmitPlayerResultResultCallback_t_Callback :: #type(SubmitPlayerResultResultCallback_t);
RemoteStorageSetUserPublishedFileActionResult_t_Callback :: #type(RemoteStorageSetUserPublishedFileActionResult_t);
GameConnectedClanChatMsg_t_Callback :: #type(GameConnectedClanChatMsg_t);
LicensesUpdated_t_Callback :: #type(LicensesUpdated_t);
FavoritesListChanged_t_Callback :: #type(FavoritesListChanged_t);
FavoritesListAccountsUpdated_t_Callback :: #type(FavoritesListAccountsUpdated_t);
GSClientAchievementStatus_t_Callback :: #type(GSClientAchievementStatus_t);
SteamNetworkingMessagesSessionFailed_t_Callback :: #type(SteamNetworkingMessagesSessionFailed_t);
RemoteStorageAppSyncStatusCheck_t_Callback :: #type(RemoteStorageAppSyncStatusCheck_t);
HTML_UpdateToolTip_t_Callback :: #type(HTML_UpdateToolTip_t);
MarketEligibilityResponse_t_Callback :: #type(MarketEligibilityResponse_t);
MusicPlayerWantsShuffled_t_Callback :: #type(MusicPlayerWantsShuffled_t);
HTML_VerticalScroll_t_Callback :: #type(HTML_VerticalScroll_t);
SteamRemotePlaySessionConnected_t_Callback :: #type(SteamRemotePlaySessionConnected_t);
HTML_FileOpenDialog_t_Callback :: #type(HTML_FileOpenDialog_t);
GetAuthSessionTicketResponse_t_Callback :: #type(GetAuthSessionTicketResponse_t);
RegisterActivationCodeResponse_t_Callback :: #type(RegisterActivationCodeResponse_t);
GSStatsUnloaded_t_Callback :: #type(GSStatsUnloaded_t);
SocketStatusCallback_t_Callback :: #type(SocketStatusCallback_t);
RemoteStorageFileShareResult_t_Callback :: #type(RemoteStorageFileShareResult_t);
ClientGameServerDeny_t_Callback :: #type(ClientGameServerDeny_t);
GSStatsStored_t_Callback :: #type(GSStatsStored_t);
RemoteStorageEnumerateUserSubscribedFilesResult_t_Callback :: #type(RemoteStorageEnumerateUserSubscribedFilesResult_t);
LeaderboardScoresDownloaded_t_Callback :: #type(LeaderboardScoresDownloaded_t);
SteamShutdown_t_Callback :: #type(SteamShutdown_t);
P2PSessionRequest_t_Callback :: #type(P2PSessionRequest_t);
RemoteStorageUpdateUserPublishedItemVoteResult_t_Callback :: #type(RemoteStorageUpdateUserPublishedItemVoteResult_t);
DurationControl_t_Callback :: #type(DurationControl_t);
RemoteStorageEnumerateUserSharedWorkshopFilesResult_t_Callback :: #type(RemoteStorageEnumerateUserSharedWorkshopFilesResult_t);
DownloadClanActivityCountsResult_t_Callback :: #type(DownloadClanActivityCountsResult_t);
MusicPlayerSelectsQueueEntry_t_Callback :: #type(MusicPlayerSelectsQueueEntry_t);
GlobalStatsReceived_t_Callback :: #type(GlobalStatsReceived_t);
GameConnectedFriendChatMsg_t_Callback :: #type(GameConnectedFriendChatMsg_t);
RemoteStorageEnumerateWorkshopFilesResult_t_Callback :: #type(RemoteStorageEnumerateWorkshopFilesResult_t);
VolumeHasChanged_t_Callback :: #type(VolumeHasChanged_t);
StopPlaytimeTrackingResult_t_Callback :: #type(StopPlaytimeTrackingResult_t);
SteamAPICallCompleted_t_Callback :: #type(SteamAPICallCompleted_t);
ChangeNumOpenSlotsCallback_t_Callback :: #type(ChangeNumOpenSlotsCallback_t);
MusicPlayerWantsLooped_t_Callback :: #type(MusicPlayerWantsLooped_t);
HTTPRequestCompleted_t_Callback :: #type(HTTPRequestCompleted_t);
IPCountry_t_Callback :: #type(IPCountry_t);
SteamAppUninstalled_t_Callback :: #type(SteamAppUninstalled_t);
HTML_StartRequest_t_Callback :: #type(HTML_StartRequest_t);
ComputeNewPlayerCompatibilityResult_t_Callback :: #type(ComputeNewPlayerCompatibilityResult_t);
RemoteStorageUnsubscribePublishedFileResult_t_Callback :: #type(RemoteStorageUnsubscribePublishedFileResult_t);
HTML_BrowserReady_t_Callback :: #type(HTML_BrowserReady_t);
SteamRemotePlaySessionDisconnected_t_Callback :: #type(SteamRemotePlaySessionDisconnected_t);
SearchForGameResultCallback_t_Callback :: #type(SearchForGameResultCallback_t);
RequestPlayersForGameResultCallback_t_Callback :: #type(RequestPlayersForGameResultCallback_t);
GameRichPresenceJoinRequested_t_Callback :: #type(GameRichPresenceJoinRequested_t);
ReservationNotificationCallback_t_Callback :: #type(ReservationNotificationCallback_t);
TimedTrialStatus_t_Callback :: #type(TimedTrialStatus_t);
SteamUGCRequestUGCDetailsResult_t_Callback :: #type(SteamUGCRequestUGCDetailsResult_t);
GetAppDependenciesResult_t_Callback :: #type(GetAppDependenciesResult_t);
GSClientGroupStatus_t_Callback :: #type(GSClientGroupStatus_t);
MusicPlayerWantsVolume_t_Callback :: #type(MusicPlayerWantsVolume_t);
RemoteStorageUserVoteDetails_t_Callback :: #type(RemoteStorageUserVoteDetails_t);
ScreenshotRequested_t_Callback :: #type(ScreenshotRequested_t);
DlcInstalled_t_Callback :: #type(DlcInstalled_t);
GSPolicyResponse_t_Callback :: #type(GSPolicyResponse_t);
OverlayBrowserProtocolNavigation_t_Callback :: #type(OverlayBrowserProtocolNavigation_t);
EndGameResultCallback_t_Callback :: #type(EndGameResultCallback_t);
SteamUGCQueryCompleted_t_Callback :: #type(SteamUGCQueryCompleted_t);
PlaybackStatusHasChanged_t_Callback :: #type(PlaybackStatusHasChanged_t);
RemoteStoragePublishedFileUnsubscribed_t_Callback :: #type(RemoteStoragePublishedFileUnsubscribed_t);
HTML_SetCursor_t_Callback :: #type(HTML_SetCursor_t);
SteamInventoryStartPurchaseResult_t_Callback :: #type(SteamInventoryStartPurchaseResult_t);
RemoveUGCDependencyResult_t_Callback :: #type(RemoveUGCDependencyResult_t);
GSReputation_t_Callback :: #type(GSReputation_t);
GSStatsReceived_t_Callback :: #type(GSStatsReceived_t);
HTML_BrowserRestarted_t_Callback :: #type(HTML_BrowserRestarted_t);
RemoteStorageAppSyncedClient_t_Callback :: #type(RemoteStorageAppSyncedClient_t);
ActiveBeaconsUpdated_t_Callback :: #type(ActiveBeaconsUpdated_t);
MusicPlayerWantsPlay_t_Callback :: #type(MusicPlayerWantsPlay_t);
LobbyInvite_t_Callback :: #type(LobbyInvite_t);
JoinPartyCallback_t_Callback :: #type(JoinPartyCallback_t);
HTML_SearchResults_t_Callback :: #type(HTML_SearchResults_t);
SteamServersDisconnected_t_Callback :: #type(SteamServersDisconnected_t);
RemoteStorageFileWriteAsyncComplete_t_Callback :: #type(RemoteStorageFileWriteAsyncComplete_t);
UserAchievementStored_t_Callback :: #type(UserAchievementStored_t);
HTML_JSAlert_t_Callback :: #type(HTML_JSAlert_t);
HTML_LinkAtPosition_t_Callback :: #type(HTML_LinkAtPosition_t);
LobbyDataUpdate_t_Callback :: #type(LobbyDataUpdate_t);
GameServerChangeRequested_t_Callback :: #type(GameServerChangeRequested_t);
RequestPlayersForGameFinalResultCallback_t_Callback :: #type(RequestPlayersForGameFinalResultCallback_t);
LeaderboardUGCSet_t_Callback :: #type(LeaderboardUGCSet_t);
GSClientKick_t_Callback :: #type(GSClientKick_t);
StoreAuthURLResponse_t_CallResult :: #type(StoreAuthURLResponse_t, bool);
RemoteStorageDeletePublishedFileResult_t_CallResult :: #type(RemoteStorageDeletePublishedFileResult_t, bool);
RemoteStorageSubscribePublishedFileResult_t_CallResult :: #type(RemoteStorageSubscribePublishedFileResult_t, bool);
EncryptedAppTicketResponse_t_CallResult :: #type(EncryptedAppTicketResponse_t, bool);
CreateItemResult_t_CallResult :: #type(CreateItemResult_t, bool);
LobbyMatchList_t_CallResult :: #type(LobbyMatchList_t, bool);
DownloadClanActivityCountsResult_t_CallResult :: #type(DownloadClanActivityCountsResult_t, bool);
RemoteStorageFileReadAsyncComplete_t_CallResult :: #type(RemoteStorageFileReadAsyncComplete_t, bool);
RemoteStorageEnumeratePublishedFilesByUserActionResult_t_CallResult :: #type(RemoteStorageEnumeratePublishedFilesByUserActionResult_t, bool);
LobbyCreated_t_CallResult :: #type(LobbyCreated_t, bool);
GlobalStatsReceived_t_CallResult :: #type(GlobalStatsReceived_t, bool);
RemoteStorageEnumerateWorkshopFilesResult_t_CallResult :: #type(RemoteStorageEnumerateWorkshopFilesResult_t, bool);
SetPersonaNameResponse_t_CallResult :: #type(SetPersonaNameResponse_t, bool);
StopPlaytimeTrackingResult_t_CallResult :: #type(StopPlaytimeTrackingResult_t, bool);
NumberOfCurrentPlayers_t_CallResult :: #type(NumberOfCurrentPlayers_t, bool);
ChangeNumOpenSlotsCallback_t_CallResult :: #type(ChangeNumOpenSlotsCallback_t, bool);
RemoveAppDependencyResult_t_CallResult :: #type(RemoveAppDependencyResult_t, bool);
UserFavoriteItemsListChanged_t_CallResult :: #type(UserFavoriteItemsListChanged_t, bool);
SteamInventoryRequestPricesResult_t_CallResult :: #type(SteamInventoryRequestPricesResult_t, bool);
AddAppDependencyResult_t_CallResult :: #type(AddAppDependencyResult_t, bool);
LeaderboardFindResult_t_CallResult :: #type(LeaderboardFindResult_t, bool);
RemoteStorageDownloadUGCResult_t_CallResult :: #type(RemoteStorageDownloadUGCResult_t, bool);
CheckFileSignature_t_CallResult :: #type(CheckFileSignature_t, bool);
RemoteStorageGetPublishedFileDetailsResult_t_CallResult :: #type(RemoteStorageGetPublishedFileDetailsResult_t, bool);
FileDetailsResult_t_CallResult :: #type(FileDetailsResult_t, bool);
ComputeNewPlayerCompatibilityResult_t_CallResult :: #type(ComputeNewPlayerCompatibilityResult_t, bool);
RemoteStorageSetUserPublishedFileActionResult_t_CallResult :: #type(RemoteStorageSetUserPublishedFileActionResult_t, bool);
RemoteStorageEnumerateUserPublishedFilesResult_t_CallResult :: #type(RemoteStorageEnumerateUserPublishedFilesResult_t, bool);
RemoteStorageUnsubscribePublishedFileResult_t_CallResult :: #type(RemoteStorageUnsubscribePublishedFileResult_t, bool);
RemoteStoragePublishFileProgress_t_CallResult :: #type(RemoteStoragePublishFileProgress_t, bool);
CreateBeaconCallback_t_CallResult :: #type(CreateBeaconCallback_t, bool);
HTML_BrowserReady_t_CallResult :: #type(HTML_BrowserReady_t, bool);
MarketEligibilityResponse_t_CallResult :: #type(MarketEligibilityResponse_t, bool);
RemoteStorageUpdatePublishedFileResult_t_CallResult :: #type(RemoteStorageUpdatePublishedFileResult_t, bool);
UserStatsReceived_t_CallResult :: #type(UserStatsReceived_t, bool);
JoinClanChatRoomCompletionResult_t_CallResult :: #type(JoinClanChatRoomCompletionResult_t, bool);
GlobalAchievementPercentagesReady_t_CallResult :: #type(GlobalAchievementPercentagesReady_t, bool);
AssociateWithClanResult_t_CallResult :: #type(AssociateWithClanResult_t, bool);
GetAppDependenciesResult_t_CallResult :: #type(GetAppDependenciesResult_t, bool);
FriendsIsFollowing_t_CallResult :: #type(FriendsIsFollowing_t, bool);
SteamUGCRequestUGCDetailsResult_t_CallResult :: #type(SteamUGCRequestUGCDetailsResult_t, bool);
ClanOfficerListResponse_t_CallResult :: #type(ClanOfficerListResponse_t, bool);
FriendsEnumerateFollowingList_t_CallResult :: #type(FriendsEnumerateFollowingList_t, bool);
RemoteStorageGetPublishedItemVoteDetailsResult_t_CallResult :: #type(RemoteStorageGetPublishedItemVoteDetailsResult_t, bool);
LobbyEnter_t_CallResult :: #type(LobbyEnter_t, bool);
SteamUGCQueryCompleted_t_CallResult :: #type(SteamUGCQueryCompleted_t, bool);
GSReputation_t_CallResult :: #type(GSReputation_t, bool);
FriendsGetFollowerCount_t_CallResult :: #type(FriendsGetFollowerCount_t, bool);
SteamInventoryEligiblePromoItemDefIDs_t_CallResult :: #type(SteamInventoryEligiblePromoItemDefIDs_t, bool);
SteamInventoryStartPurchaseResult_t_CallResult :: #type(SteamInventoryStartPurchaseResult_t, bool);
RemoteStorageFileShareResult_t_CallResult :: #type(RemoteStorageFileShareResult_t, bool);
RemoveUGCDependencyResult_t_CallResult :: #type(RemoveUGCDependencyResult_t, bool);
StartPlaytimeTrackingResult_t_CallResult :: #type(StartPlaytimeTrackingResult_t, bool);
GSStatsReceived_t_CallResult :: #type(GSStatsReceived_t, bool);
GSStatsStored_t_CallResult :: #type(GSStatsStored_t, bool);
SubmitItemUpdateResult_t_CallResult :: #type(SubmitItemUpdateResult_t, bool);
GetUserItemVoteResult_t_CallResult :: #type(GetUserItemVoteResult_t, bool);
LeaderboardScoreUploaded_t_CallResult :: #type(LeaderboardScoreUploaded_t, bool);
RemoteStorageEnumerateUserSubscribedFilesResult_t_CallResult :: #type(RemoteStorageEnumerateUserSubscribedFilesResult_t, bool);
JoinPartyCallback_t_CallResult :: #type(JoinPartyCallback_t, bool);
AddUGCDependencyResult_t_CallResult :: #type(AddUGCDependencyResult_t, bool);
LeaderboardScoresDownloaded_t_CallResult :: #type(LeaderboardScoresDownloaded_t, bool);
DeleteItemResult_t_CallResult :: #type(DeleteItemResult_t, bool);
RemoteStorageFileWriteAsyncComplete_t_CallResult :: #type(RemoteStorageFileWriteAsyncComplete_t, bool);
SetUserItemVoteResult_t_CallResult :: #type(SetUserItemVoteResult_t, bool);
DurationControl_t_CallResult :: #type(DurationControl_t, bool);
RemoteStorageUpdateUserPublishedItemVoteResult_t_CallResult :: #type(RemoteStorageUpdateUserPublishedItemVoteResult_t, bool);
LeaderboardUGCSet_t_CallResult :: #type(LeaderboardUGCSet_t, bool);


#scope_export


RegisterCallback :: (callback: (StoreAuthURLResponse_t) -> ()) {
	array_add(*Callbacks.StoreAuthURLResponse_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageSubscribePublishedFileResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageSubscribePublishedFileResult_t, callback);
}

RegisterCallback :: (callback: (SteamServerConnectFailure_t) -> ()) {
	array_add(*Callbacks.SteamServerConnectFailure_t, callback);
}

RegisterCallback :: (callback: (EncryptedAppTicketResponse_t) -> ()) {
	array_add(*Callbacks.EncryptedAppTicketResponse_t, callback);
}

RegisterCallback :: (callback: (HTML_OpenLinkInNewTab_t) -> ()) {
	array_add(*Callbacks.HTML_OpenLinkInNewTab_t, callback);
}

RegisterCallback :: (callback: (GSClientApprove_t) -> ()) {
	array_add(*Callbacks.GSClientApprove_t, callback);
}

RegisterCallback :: (callback: (LobbyMatchList_t) -> ()) {
	array_add(*Callbacks.LobbyMatchList_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageFileReadAsyncComplete_t) -> ()) {
	array_add(*Callbacks.RemoteStorageFileReadAsyncComplete_t, callback);
}

RegisterCallback :: (callback: (RemoteStoragePublishFileResult_t) -> ()) {
	array_add(*Callbacks.RemoteStoragePublishFileResult_t, callback);
}

RegisterCallback :: (callback: (SetPersonaNameResponse_t) -> ()) {
	array_add(*Callbacks.SetPersonaNameResponse_t, callback);
}

RegisterCallback :: (callback: (AppProofOfPurchaseKeyResponse_t) -> ()) {
	array_add(*Callbacks.AppProofOfPurchaseKeyResponse_t, callback);
}

RegisterCallback :: (callback: (UserAchievementIconFetched_t) -> ()) {
	array_add(*Callbacks.UserAchievementIconFetched_t, callback);
}

RegisterCallback :: (callback: (MusicPlayerWillQuit_t) -> ()) {
	array_add(*Callbacks.MusicPlayerWillQuit_t, callback);
}

RegisterCallback :: (callback: (RemoveAppDependencyResult_t) -> ()) {
	array_add(*Callbacks.RemoveAppDependencyResult_t, callback);
}

RegisterCallback :: (callback: (SteamServersConnected_t) -> ()) {
	array_add(*Callbacks.SteamServersConnected_t, callback);
}

RegisterCallback :: (callback: (SteamInventoryRequestPricesResult_t) -> ()) {
	array_add(*Callbacks.SteamInventoryRequestPricesResult_t, callback);
}

RegisterCallback :: (callback: (MicroTxnAuthorizationResponse_t) -> ()) {
	array_add(*Callbacks.MicroTxnAuthorizationResponse_t, callback);
}

RegisterCallback :: (callback: (ValidateAuthTicketResponse_t) -> ()) {
	array_add(*Callbacks.ValidateAuthTicketResponse_t, callback);
}

RegisterCallback :: (callback: (GameConnectedChatJoin_t) -> ()) {
	array_add(*Callbacks.GameConnectedChatJoin_t, callback);
}

RegisterCallback :: (callback: (PersonaStateChange_t) -> ()) {
	array_add(*Callbacks.PersonaStateChange_t, callback);
}

RegisterCallback :: (callback: (SteamRelayNetworkStatus_t) -> ()) {
	array_add(*Callbacks.SteamRelayNetworkStatus_t, callback);
}

RegisterCallback :: (callback: (FileDetailsResult_t) -> ()) {
	array_add(*Callbacks.FileDetailsResult_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageEnumerateUserPublishedFilesResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageEnumerateUserPublishedFilesResult_t, callback);
}

RegisterCallback :: (callback: (LowBatteryPower_t) -> ()) {
	array_add(*Callbacks.LowBatteryPower_t, callback);
}

RegisterCallback :: (callback: (CreateBeaconCallback_t) -> ()) {
	array_add(*Callbacks.CreateBeaconCallback_t, callback);
}

RegisterCallback :: (callback: (UserStatsUnloaded_t) -> ()) {
	array_add(*Callbacks.UserStatsUnloaded_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageUpdatePublishedFileResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageUpdatePublishedFileResult_t, callback);
}

RegisterCallback :: (callback: (JoinClanChatRoomCompletionResult_t) -> ()) {
	array_add(*Callbacks.JoinClanChatRoomCompletionResult_t, callback);
}

RegisterCallback :: (callback: (AssociateWithClanResult_t) -> ()) {
	array_add(*Callbacks.AssociateWithClanResult_t, callback);
}

RegisterCallback :: (callback: (HTML_URLChanged_t) -> ()) {
	array_add(*Callbacks.HTML_URLChanged_t, callback);
}

RegisterCallback :: (callback: (ClanOfficerListResponse_t) -> ()) {
	array_add(*Callbacks.ClanOfficerListResponse_t, callback);
}

RegisterCallback :: (callback: (FriendsEnumerateFollowingList_t) -> ()) {
	array_add(*Callbacks.FriendsEnumerateFollowingList_t, callback);
}

RegisterCallback :: (callback: (UnreadChatMessagesChanged_t) -> ()) {
	array_add(*Callbacks.UnreadChatMessagesChanged_t, callback);
}

RegisterCallback :: (callback: (RemoteStoragePublishedFileDeleted_t) -> ()) {
	array_add(*Callbacks.RemoteStoragePublishedFileDeleted_t, callback);
}

RegisterCallback :: (callback: (SteamNetworkingMessagesSessionRequest_t) -> ()) {
	array_add(*Callbacks.SteamNetworkingMessagesSessionRequest_t, callback);
}

RegisterCallback :: (callback: (LobbyEnter_t) -> ()) {
	array_add(*Callbacks.LobbyEnter_t, callback);
}

RegisterCallback :: (callback: (MusicPlayerWantsPlayPrevious_t) -> ()) {
	array_add(*Callbacks.MusicPlayerWantsPlayPrevious_t, callback);
}

RegisterCallback :: (callback: (SubmitItemUpdateResult_t) -> ()) {
	array_add(*Callbacks.SubmitItemUpdateResult_t, callback);
}

RegisterCallback :: (callback: (GetUserItemVoteResult_t) -> ()) {
	array_add(*Callbacks.GetUserItemVoteResult_t, callback);
}

RegisterCallback :: (callback: (HTML_ShowToolTip_t) -> ()) {
	array_add(*Callbacks.HTML_ShowToolTip_t, callback);
}

RegisterCallback :: (callback: (SteamNetAuthenticationStatus_t) -> ()) {
	array_add(*Callbacks.SteamNetAuthenticationStatus_t, callback);
}

RegisterCallback :: (callback: (SetUserItemVoteResult_t) -> ()) {
	array_add(*Callbacks.SetUserItemVoteResult_t, callback);
}

RegisterCallback :: (callback: (LobbyGameCreated_t) -> ()) {
	array_add(*Callbacks.LobbyGameCreated_t, callback);
}

RegisterCallback :: (callback: (RequestPlayersForGameProgressCallback_t) -> ()) {
	array_add(*Callbacks.RequestPlayersForGameProgressCallback_t, callback);
}

RegisterCallback :: (callback: (GSClientDeny_t) -> ()) {
	array_add(*Callbacks.GSClientDeny_t, callback);
}

RegisterCallback :: (callback: (MusicPlayerWantsPlayNext_t) -> ()) {
	array_add(*Callbacks.MusicPlayerWantsPlayNext_t, callback);
}

RegisterCallback :: (callback: (CreateItemResult_t) -> ()) {
	array_add(*Callbacks.CreateItemResult_t, callback);
}

RegisterCallback :: (callback: (HTML_ChangedTitle_t) -> ()) {
	array_add(*Callbacks.HTML_ChangedTitle_t, callback);
}

RegisterCallback :: (callback: (LobbyKicked_t) -> ()) {
	array_add(*Callbacks.LobbyKicked_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageAppSyncProgress_t) -> ()) {
	array_add(*Callbacks.RemoteStorageAppSyncProgress_t, callback);
}

RegisterCallback :: (callback: (NumberOfCurrentPlayers_t) -> ()) {
	array_add(*Callbacks.NumberOfCurrentPlayers_t, callback);
}

RegisterCallback :: (callback: (HTML_CanGoBackAndForward_t) -> ()) {
	array_add(*Callbacks.HTML_CanGoBackAndForward_t, callback);
}

RegisterCallback :: (callback: (RemoteStoragePublishedFileUpdated_t) -> ()) {
	array_add(*Callbacks.RemoteStoragePublishedFileUpdated_t, callback);
}

RegisterCallback :: (callback: (AvailableBeaconLocationsUpdated_t) -> ()) {
	array_add(*Callbacks.AvailableBeaconLocationsUpdated_t, callback);
}

RegisterCallback :: (callback: (GSGameplayStats_t) -> ()) {
	array_add(*Callbacks.GSGameplayStats_t, callback);
}

RegisterCallback :: (callback: (LeaderboardFindResult_t) -> ()) {
	array_add(*Callbacks.LeaderboardFindResult_t, callback);
}

RegisterCallback :: (callback: (IPCFailure_t) -> ()) {
	array_add(*Callbacks.IPCFailure_t, callback);
}

RegisterCallback :: (callback: (RemoteStoragePublishedFileSubscribed_t) -> ()) {
	array_add(*Callbacks.RemoteStoragePublishedFileSubscribed_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageDownloadUGCResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageDownloadUGCResult_t, callback);
}

RegisterCallback :: (callback: (ScreenshotReady_t) -> ()) {
	array_add(*Callbacks.ScreenshotReady_t, callback);
}

RegisterCallback :: (callback: (HTML_CloseBrowser_t) -> ()) {
	array_add(*Callbacks.HTML_CloseBrowser_t, callback);
}

RegisterCallback :: (callback: (PS3TrophiesInstalled_t) -> ()) {
	array_add(*Callbacks.PS3TrophiesInstalled_t, callback);
}

RegisterCallback :: (callback: (GameWebCallback_t) -> ()) {
	array_add(*Callbacks.GameWebCallback_t, callback);
}

RegisterCallback :: (callback: (HTML_NewWindow_t) -> ()) {
	array_add(*Callbacks.HTML_NewWindow_t, callback);
}

RegisterCallback :: (callback: (GetVideoURLResult_t) -> ()) {
	array_add(*Callbacks.GetVideoURLResult_t, callback);
}

RegisterCallback :: (callback: (GameLobbyJoinRequested_t) -> ()) {
	array_add(*Callbacks.GameLobbyJoinRequested_t, callback);
}

RegisterCallback :: (callback: (RemoteStoragePublishFileProgress_t) -> ()) {
	array_add(*Callbacks.RemoteStoragePublishFileProgress_t, callback);
}

RegisterCallback :: (callback: (HTML_JSConfirm_t) -> ()) {
	array_add(*Callbacks.HTML_JSConfirm_t, callback);
}

RegisterCallback :: (callback: (PSNGameBootInviteResult_t) -> ()) {
	array_add(*Callbacks.PSNGameBootInviteResult_t, callback);
}

RegisterCallback :: (callback: (UserStatsReceived_t) -> ()) {
	array_add(*Callbacks.UserStatsReceived_t, callback);
}

RegisterCallback :: (callback: (UserStatsStored_t) -> ()) {
	array_add(*Callbacks.UserStatsStored_t, callback);
}

RegisterCallback :: (callback: (GlobalAchievementPercentagesReady_t) -> ()) {
	array_add(*Callbacks.GlobalAchievementPercentagesReady_t, callback);
}

RegisterCallback :: (callback: (NewUrlLaunchParameters_t) -> ()) {
	array_add(*Callbacks.NewUrlLaunchParameters_t, callback);
}

RegisterCallback :: (callback: (GetOPFSettingsResult_t) -> ()) {
	array_add(*Callbacks.GetOPFSettingsResult_t, callback);
}

RegisterCallback :: (callback: (FriendsIsFollowing_t) -> ()) {
	array_add(*Callbacks.FriendsIsFollowing_t, callback);
}

RegisterCallback :: (callback: (GameOverlayActivated_t) -> ()) {
	array_add(*Callbacks.GameOverlayActivated_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageGetPublishedItemVoteDetailsResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageGetPublishedItemVoteDetailsResult_t, callback);
}

RegisterCallback :: (callback: (FriendRichPresenceUpdate_t) -> ()) {
	array_add(*Callbacks.FriendRichPresenceUpdate_t, callback);
}

RegisterCallback :: (callback: (SteamInventoryFullUpdate_t) -> ()) {
	array_add(*Callbacks.SteamInventoryFullUpdate_t, callback);
}

RegisterCallback :: (callback: (FriendsGetFollowerCount_t) -> ()) {
	array_add(*Callbacks.FriendsGetFollowerCount_t, callback);
}

RegisterCallback :: (callback: (MusicPlayerRemoteWillActivate_t) -> ()) {
	array_add(*Callbacks.MusicPlayerRemoteWillActivate_t, callback);
}

RegisterCallback :: (callback: (GameConnectedChatLeave_t) -> ()) {
	array_add(*Callbacks.GameConnectedChatLeave_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageAppSyncedServer_t) -> ()) {
	array_add(*Callbacks.RemoteStorageAppSyncedServer_t, callback);
}

RegisterCallback :: (callback: (MusicPlayerRemoteWillDeactivate_t) -> ()) {
	array_add(*Callbacks.MusicPlayerRemoteWillDeactivate_t, callback);
}

RegisterCallback :: (callback: (HTML_StatusText_t) -> ()) {
	array_add(*Callbacks.HTML_StatusText_t, callback);
}

RegisterCallback :: (callback: (SteamInventoryEligiblePromoItemDefIDs_t) -> ()) {
	array_add(*Callbacks.SteamInventoryEligiblePromoItemDefIDs_t, callback);
}

RegisterCallback :: (callback: (StartPlaytimeTrackingResult_t) -> ()) {
	array_add(*Callbacks.StartPlaytimeTrackingResult_t, callback);
}

RegisterCallback :: (callback: (MusicPlayerWantsPlayingRepeatStatus_t) -> ()) {
	array_add(*Callbacks.MusicPlayerWantsPlayingRepeatStatus_t, callback);
}

RegisterCallback :: (callback: (LeaderboardScoreUploaded_t) -> ()) {
	array_add(*Callbacks.LeaderboardScoreUploaded_t, callback);
}

RegisterCallback :: (callback: (AddUGCDependencyResult_t) -> ()) {
	array_add(*Callbacks.AddUGCDependencyResult_t, callback);
}

RegisterCallback :: (callback: (DeleteItemResult_t) -> ()) {
	array_add(*Callbacks.DeleteItemResult_t, callback);
}

RegisterCallback :: (callback: (SearchForGameProgressCallback_t) -> ()) {
	array_add(*Callbacks.SearchForGameProgressCallback_t, callback);
}

RegisterCallback :: (callback: (HTTPRequestHeadersReceived_t) -> ()) {
	array_add(*Callbacks.HTTPRequestHeadersReceived_t, callback);
}

RegisterCallback :: (callback: (MusicPlayerRemoteToFront_t) -> ()) {
	array_add(*Callbacks.MusicPlayerRemoteToFront_t, callback);
}

RegisterCallback :: (callback: (GamepadTextInputDismissed_t) -> ()) {
	array_add(*Callbacks.GamepadTextInputDismissed_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageDeletePublishedFileResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageDeletePublishedFileResult_t, callback);
}

RegisterCallback :: (callback: (HTTPRequestDataReceived_t) -> ()) {
	array_add(*Callbacks.HTTPRequestDataReceived_t, callback);
}

RegisterCallback :: (callback: (HTML_FinishedRequest_t) -> ()) {
	array_add(*Callbacks.HTML_FinishedRequest_t, callback);
}

RegisterCallback :: (callback: (SteamInventoryDefinitionUpdate_t) -> ()) {
	array_add(*Callbacks.SteamInventoryDefinitionUpdate_t, callback);
}

RegisterCallback :: (callback: (SteamParentalSettingsChanged_t) -> ()) {
	array_add(*Callbacks.SteamParentalSettingsChanged_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageEnumeratePublishedFilesByUserActionResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageEnumeratePublishedFilesByUserActionResult_t, callback);
}

RegisterCallback :: (callback: (MusicPlayerWantsPause_t) -> ()) {
	array_add(*Callbacks.MusicPlayerWantsPause_t, callback);
}

RegisterCallback :: (callback: (SteamInventoryResultReady_t) -> ()) {
	array_add(*Callbacks.SteamInventoryResultReady_t, callback);
}

RegisterCallback :: (callback: (LobbyCreated_t) -> ()) {
	array_add(*Callbacks.LobbyCreated_t, callback);
}

RegisterCallback :: (callback: (LobbyChatMsg_t) -> ()) {
	array_add(*Callbacks.LobbyChatMsg_t, callback);
}

RegisterCallback :: (callback: (SteamNetConnectionStatusChangedCallback_t) -> ()) {
	array_add(*Callbacks.SteamNetConnectionStatusChangedCallback_t, callback);
}

RegisterCallback :: (callback: (P2PSessionConnectFail_t) -> ()) {
	array_add(*Callbacks.P2PSessionConnectFail_t, callback);
}

RegisterCallback :: (callback: (DownloadItemResult_t) -> ()) {
	array_add(*Callbacks.DownloadItemResult_t, callback);
}

RegisterCallback :: (callback: (HTML_HorizontalScroll_t) -> ()) {
	array_add(*Callbacks.HTML_HorizontalScroll_t, callback);
}

RegisterCallback :: (callback: (AvatarImageLoaded_t) -> ()) {
	array_add(*Callbacks.AvatarImageLoaded_t, callback);
}

RegisterCallback :: (callback: (ItemInstalled_t) -> ()) {
	array_add(*Callbacks.ItemInstalled_t, callback);
}

RegisterCallback :: (callback: (UserFavoriteItemsListChanged_t) -> ()) {
	array_add(*Callbacks.UserFavoriteItemsListChanged_t, callback);
}

RegisterCallback :: (callback: (SteamAppInstalled_t) -> ()) {
	array_add(*Callbacks.SteamAppInstalled_t, callback);
}

RegisterCallback :: (callback: (MusicPlayerSelectsPlaylistEntry_t) -> ()) {
	array_add(*Callbacks.MusicPlayerSelectsPlaylistEntry_t, callback);
}

RegisterCallback :: (callback: (AddAppDependencyResult_t) -> ()) {
	array_add(*Callbacks.AddAppDependencyResult_t, callback);
}

RegisterCallback :: (callback: (HTML_NeedsPaint_t) -> ()) {
	array_add(*Callbacks.HTML_NeedsPaint_t, callback);
}

RegisterCallback :: (callback: (LobbyChatUpdate_t) -> ()) {
	array_add(*Callbacks.LobbyChatUpdate_t, callback);
}

RegisterCallback :: (callback: (HTML_HideToolTip_t) -> ()) {
	array_add(*Callbacks.HTML_HideToolTip_t, callback);
}

RegisterCallback :: (callback: (CheckFileSignature_t) -> ()) {
	array_add(*Callbacks.CheckFileSignature_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageGetPublishedFileDetailsResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageGetPublishedFileDetailsResult_t, callback);
}

RegisterCallback :: (callback: (SubmitPlayerResultResultCallback_t) -> ()) {
	array_add(*Callbacks.SubmitPlayerResultResultCallback_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageSetUserPublishedFileActionResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageSetUserPublishedFileActionResult_t, callback);
}

RegisterCallback :: (callback: (GameConnectedClanChatMsg_t) -> ()) {
	array_add(*Callbacks.GameConnectedClanChatMsg_t, callback);
}

RegisterCallback :: (callback: (LicensesUpdated_t) -> ()) {
	array_add(*Callbacks.LicensesUpdated_t, callback);
}

RegisterCallback :: (callback: (FavoritesListChanged_t) -> ()) {
	array_add(*Callbacks.FavoritesListChanged_t, callback);
}

RegisterCallback :: (callback: (FavoritesListAccountsUpdated_t) -> ()) {
	array_add(*Callbacks.FavoritesListAccountsUpdated_t, callback);
}

RegisterCallback :: (callback: (GSClientAchievementStatus_t) -> ()) {
	array_add(*Callbacks.GSClientAchievementStatus_t, callback);
}

RegisterCallback :: (callback: (SteamNetworkingMessagesSessionFailed_t) -> ()) {
	array_add(*Callbacks.SteamNetworkingMessagesSessionFailed_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageAppSyncStatusCheck_t) -> ()) {
	array_add(*Callbacks.RemoteStorageAppSyncStatusCheck_t, callback);
}

RegisterCallback :: (callback: (HTML_UpdateToolTip_t) -> ()) {
	array_add(*Callbacks.HTML_UpdateToolTip_t, callback);
}

RegisterCallback :: (callback: (MarketEligibilityResponse_t) -> ()) {
	array_add(*Callbacks.MarketEligibilityResponse_t, callback);
}

RegisterCallback :: (callback: (MusicPlayerWantsShuffled_t) -> ()) {
	array_add(*Callbacks.MusicPlayerWantsShuffled_t, callback);
}

RegisterCallback :: (callback: (HTML_VerticalScroll_t) -> ()) {
	array_add(*Callbacks.HTML_VerticalScroll_t, callback);
}

RegisterCallback :: (callback: (SteamRemotePlaySessionConnected_t) -> ()) {
	array_add(*Callbacks.SteamRemotePlaySessionConnected_t, callback);
}

RegisterCallback :: (callback: (HTML_FileOpenDialog_t) -> ()) {
	array_add(*Callbacks.HTML_FileOpenDialog_t, callback);
}

RegisterCallback :: (callback: (GetAuthSessionTicketResponse_t) -> ()) {
	array_add(*Callbacks.GetAuthSessionTicketResponse_t, callback);
}

RegisterCallback :: (callback: (RegisterActivationCodeResponse_t) -> ()) {
	array_add(*Callbacks.RegisterActivationCodeResponse_t, callback);
}

RegisterCallback :: (callback: (GSStatsUnloaded_t) -> ()) {
	array_add(*Callbacks.GSStatsUnloaded_t, callback);
}

RegisterCallback :: (callback: (SocketStatusCallback_t) -> ()) {
	array_add(*Callbacks.SocketStatusCallback_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageFileShareResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageFileShareResult_t, callback);
}

RegisterCallback :: (callback: (ClientGameServerDeny_t) -> ()) {
	array_add(*Callbacks.ClientGameServerDeny_t, callback);
}

RegisterCallback :: (callback: (GSStatsStored_t) -> ()) {
	array_add(*Callbacks.GSStatsStored_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageEnumerateUserSubscribedFilesResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageEnumerateUserSubscribedFilesResult_t, callback);
}

RegisterCallback :: (callback: (LeaderboardScoresDownloaded_t) -> ()) {
	array_add(*Callbacks.LeaderboardScoresDownloaded_t, callback);
}

RegisterCallback :: (callback: (SteamShutdown_t) -> ()) {
	array_add(*Callbacks.SteamShutdown_t, callback);
}

RegisterCallback :: (callback: (P2PSessionRequest_t) -> ()) {
	array_add(*Callbacks.P2PSessionRequest_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageUpdateUserPublishedItemVoteResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageUpdateUserPublishedItemVoteResult_t, callback);
}

RegisterCallback :: (callback: (DurationControl_t) -> ()) {
	array_add(*Callbacks.DurationControl_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageEnumerateUserSharedWorkshopFilesResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageEnumerateUserSharedWorkshopFilesResult_t, callback);
}

RegisterCallback :: (callback: (DownloadClanActivityCountsResult_t) -> ()) {
	array_add(*Callbacks.DownloadClanActivityCountsResult_t, callback);
}

RegisterCallback :: (callback: (MusicPlayerSelectsQueueEntry_t) -> ()) {
	array_add(*Callbacks.MusicPlayerSelectsQueueEntry_t, callback);
}

RegisterCallback :: (callback: (GlobalStatsReceived_t) -> ()) {
	array_add(*Callbacks.GlobalStatsReceived_t, callback);
}

RegisterCallback :: (callback: (GameConnectedFriendChatMsg_t) -> ()) {
	array_add(*Callbacks.GameConnectedFriendChatMsg_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageEnumerateWorkshopFilesResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageEnumerateWorkshopFilesResult_t, callback);
}

RegisterCallback :: (callback: (VolumeHasChanged_t) -> ()) {
	array_add(*Callbacks.VolumeHasChanged_t, callback);
}

RegisterCallback :: (callback: (StopPlaytimeTrackingResult_t) -> ()) {
	array_add(*Callbacks.StopPlaytimeTrackingResult_t, callback);
}

RegisterCallback :: (callback: (SteamAPICallCompleted_t) -> ()) {
	array_add(*Callbacks.SteamAPICallCompleted_t, callback);
}

RegisterCallback :: (callback: (ChangeNumOpenSlotsCallback_t) -> ()) {
	array_add(*Callbacks.ChangeNumOpenSlotsCallback_t, callback);
}

RegisterCallback :: (callback: (MusicPlayerWantsLooped_t) -> ()) {
	array_add(*Callbacks.MusicPlayerWantsLooped_t, callback);
}

RegisterCallback :: (callback: (HTTPRequestCompleted_t) -> ()) {
	array_add(*Callbacks.HTTPRequestCompleted_t, callback);
}

RegisterCallback :: (callback: (IPCountry_t) -> ()) {
	array_add(*Callbacks.IPCountry_t, callback);
}

RegisterCallback :: (callback: (SteamAppUninstalled_t) -> ()) {
	array_add(*Callbacks.SteamAppUninstalled_t, callback);
}

RegisterCallback :: (callback: (HTML_StartRequest_t) -> ()) {
	array_add(*Callbacks.HTML_StartRequest_t, callback);
}

RegisterCallback :: (callback: (ComputeNewPlayerCompatibilityResult_t) -> ()) {
	array_add(*Callbacks.ComputeNewPlayerCompatibilityResult_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageUnsubscribePublishedFileResult_t) -> ()) {
	array_add(*Callbacks.RemoteStorageUnsubscribePublishedFileResult_t, callback);
}

RegisterCallback :: (callback: (HTML_BrowserReady_t) -> ()) {
	array_add(*Callbacks.HTML_BrowserReady_t, callback);
}

RegisterCallback :: (callback: (SteamRemotePlaySessionDisconnected_t) -> ()) {
	array_add(*Callbacks.SteamRemotePlaySessionDisconnected_t, callback);
}

RegisterCallback :: (callback: (SearchForGameResultCallback_t) -> ()) {
	array_add(*Callbacks.SearchForGameResultCallback_t, callback);
}

RegisterCallback :: (callback: (RequestPlayersForGameResultCallback_t) -> ()) {
	array_add(*Callbacks.RequestPlayersForGameResultCallback_t, callback);
}

RegisterCallback :: (callback: (GameRichPresenceJoinRequested_t) -> ()) {
	array_add(*Callbacks.GameRichPresenceJoinRequested_t, callback);
}

RegisterCallback :: (callback: (ReservationNotificationCallback_t) -> ()) {
	array_add(*Callbacks.ReservationNotificationCallback_t, callback);
}

RegisterCallback :: (callback: (TimedTrialStatus_t) -> ()) {
	array_add(*Callbacks.TimedTrialStatus_t, callback);
}

RegisterCallback :: (callback: (SteamUGCRequestUGCDetailsResult_t) -> ()) {
	array_add(*Callbacks.SteamUGCRequestUGCDetailsResult_t, callback);
}

RegisterCallback :: (callback: (GetAppDependenciesResult_t) -> ()) {
	array_add(*Callbacks.GetAppDependenciesResult_t, callback);
}

RegisterCallback :: (callback: (GSClientGroupStatus_t) -> ()) {
	array_add(*Callbacks.GSClientGroupStatus_t, callback);
}

RegisterCallback :: (callback: (MusicPlayerWantsVolume_t) -> ()) {
	array_add(*Callbacks.MusicPlayerWantsVolume_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageUserVoteDetails_t) -> ()) {
	array_add(*Callbacks.RemoteStorageUserVoteDetails_t, callback);
}

RegisterCallback :: (callback: (ScreenshotRequested_t) -> ()) {
	array_add(*Callbacks.ScreenshotRequested_t, callback);
}

RegisterCallback :: (callback: (DlcInstalled_t) -> ()) {
	array_add(*Callbacks.DlcInstalled_t, callback);
}

RegisterCallback :: (callback: (GSPolicyResponse_t) -> ()) {
	array_add(*Callbacks.GSPolicyResponse_t, callback);
}

RegisterCallback :: (callback: (OverlayBrowserProtocolNavigation_t) -> ()) {
	array_add(*Callbacks.OverlayBrowserProtocolNavigation_t, callback);
}

RegisterCallback :: (callback: (EndGameResultCallback_t) -> ()) {
	array_add(*Callbacks.EndGameResultCallback_t, callback);
}

RegisterCallback :: (callback: (SteamUGCQueryCompleted_t) -> ()) {
	array_add(*Callbacks.SteamUGCQueryCompleted_t, callback);
}

RegisterCallback :: (callback: (PlaybackStatusHasChanged_t) -> ()) {
	array_add(*Callbacks.PlaybackStatusHasChanged_t, callback);
}

RegisterCallback :: (callback: (RemoteStoragePublishedFileUnsubscribed_t) -> ()) {
	array_add(*Callbacks.RemoteStoragePublishedFileUnsubscribed_t, callback);
}

RegisterCallback :: (callback: (HTML_SetCursor_t) -> ()) {
	array_add(*Callbacks.HTML_SetCursor_t, callback);
}

RegisterCallback :: (callback: (SteamInventoryStartPurchaseResult_t) -> ()) {
	array_add(*Callbacks.SteamInventoryStartPurchaseResult_t, callback);
}

RegisterCallback :: (callback: (RemoveUGCDependencyResult_t) -> ()) {
	array_add(*Callbacks.RemoveUGCDependencyResult_t, callback);
}

RegisterCallback :: (callback: (GSReputation_t) -> ()) {
	array_add(*Callbacks.GSReputation_t, callback);
}

RegisterCallback :: (callback: (GSStatsReceived_t) -> ()) {
	array_add(*Callbacks.GSStatsReceived_t, callback);
}

RegisterCallback :: (callback: (HTML_BrowserRestarted_t) -> ()) {
	array_add(*Callbacks.HTML_BrowserRestarted_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageAppSyncedClient_t) -> ()) {
	array_add(*Callbacks.RemoteStorageAppSyncedClient_t, callback);
}

RegisterCallback :: (callback: (ActiveBeaconsUpdated_t) -> ()) {
	array_add(*Callbacks.ActiveBeaconsUpdated_t, callback);
}

RegisterCallback :: (callback: (MusicPlayerWantsPlay_t) -> ()) {
	array_add(*Callbacks.MusicPlayerWantsPlay_t, callback);
}

RegisterCallback :: (callback: (LobbyInvite_t) -> ()) {
	array_add(*Callbacks.LobbyInvite_t, callback);
}

RegisterCallback :: (callback: (JoinPartyCallback_t) -> ()) {
	array_add(*Callbacks.JoinPartyCallback_t, callback);
}

RegisterCallback :: (callback: (HTML_SearchResults_t) -> ()) {
	array_add(*Callbacks.HTML_SearchResults_t, callback);
}

RegisterCallback :: (callback: (SteamServersDisconnected_t) -> ()) {
	array_add(*Callbacks.SteamServersDisconnected_t, callback);
}

RegisterCallback :: (callback: (RemoteStorageFileWriteAsyncComplete_t) -> ()) {
	array_add(*Callbacks.RemoteStorageFileWriteAsyncComplete_t, callback);
}

RegisterCallback :: (callback: (UserAchievementStored_t) -> ()) {
	array_add(*Callbacks.UserAchievementStored_t, callback);
}

RegisterCallback :: (callback: (HTML_JSAlert_t) -> ()) {
	array_add(*Callbacks.HTML_JSAlert_t, callback);
}

RegisterCallback :: (callback: (HTML_LinkAtPosition_t) -> ()) {
	array_add(*Callbacks.HTML_LinkAtPosition_t, callback);
}

RegisterCallback :: (callback: (LobbyDataUpdate_t) -> ()) {
	array_add(*Callbacks.LobbyDataUpdate_t, callback);
}

RegisterCallback :: (callback: (GameServerChangeRequested_t) -> ()) {
	array_add(*Callbacks.GameServerChangeRequested_t, callback);
}

RegisterCallback :: (callback: (RequestPlayersForGameFinalResultCallback_t) -> ()) {
	array_add(*Callbacks.RequestPlayersForGameFinalResultCallback_t, callback);
}

RegisterCallback :: (callback: (LeaderboardUGCSet_t) -> ()) {
	array_add(*Callbacks.LeaderboardUGCSet_t, callback);
}

RegisterCallback :: (callback: (GSClientKick_t) -> ()) {
	array_add(*Callbacks.GSClientKick_t, callback);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (StoreAuthURLResponse_t, bool) -> ()) {
    procs, found := table_find(*CallResults.StoreAuthURLResponse_t, call_result_id);
    if !found {
        array : [..] StoreAuthURLResponse_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.StoreAuthURLResponse_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: StoreAuthURLResponse_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageDeletePublishedFileResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageDeletePublishedFileResult_t, call_result_id);
    if !found {
        array : [..] RemoteStorageDeletePublishedFileResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageDeletePublishedFileResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageDeletePublishedFileResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageSubscribePublishedFileResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageSubscribePublishedFileResult_t, call_result_id);
    if !found {
        array : [..] RemoteStorageSubscribePublishedFileResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageSubscribePublishedFileResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageSubscribePublishedFileResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (EncryptedAppTicketResponse_t, bool) -> ()) {
    procs, found := table_find(*CallResults.EncryptedAppTicketResponse_t, call_result_id);
    if !found {
        array : [..] EncryptedAppTicketResponse_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.EncryptedAppTicketResponse_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: EncryptedAppTicketResponse_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (CreateItemResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.CreateItemResult_t, call_result_id);
    if !found {
        array : [..] CreateItemResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.CreateItemResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: CreateItemResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (LobbyMatchList_t, bool) -> ()) {
    procs, found := table_find(*CallResults.LobbyMatchList_t, call_result_id);
    if !found {
        array : [..] LobbyMatchList_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.LobbyMatchList_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: LobbyMatchList_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (DownloadClanActivityCountsResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.DownloadClanActivityCountsResult_t, call_result_id);
    if !found {
        array : [..] DownloadClanActivityCountsResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.DownloadClanActivityCountsResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: DownloadClanActivityCountsResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageFileReadAsyncComplete_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageFileReadAsyncComplete_t, call_result_id);
    if !found {
        array : [..] RemoteStorageFileReadAsyncComplete_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageFileReadAsyncComplete_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageFileReadAsyncComplete_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageEnumeratePublishedFilesByUserActionResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageEnumeratePublishedFilesByUserActionResult_t, call_result_id);
    if !found {
        array : [..] RemoteStorageEnumeratePublishedFilesByUserActionResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageEnumeratePublishedFilesByUserActionResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageEnumeratePublishedFilesByUserActionResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (LobbyCreated_t, bool) -> ()) {
    procs, found := table_find(*CallResults.LobbyCreated_t, call_result_id);
    if !found {
        array : [..] LobbyCreated_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.LobbyCreated_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: LobbyCreated_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (GlobalStatsReceived_t, bool) -> ()) {
    procs, found := table_find(*CallResults.GlobalStatsReceived_t, call_result_id);
    if !found {
        array : [..] GlobalStatsReceived_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.GlobalStatsReceived_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: GlobalStatsReceived_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageEnumerateWorkshopFilesResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageEnumerateWorkshopFilesResult_t, call_result_id);
    if !found {
        array : [..] RemoteStorageEnumerateWorkshopFilesResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageEnumerateWorkshopFilesResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageEnumerateWorkshopFilesResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (SetPersonaNameResponse_t, bool) -> ()) {
    procs, found := table_find(*CallResults.SetPersonaNameResponse_t, call_result_id);
    if !found {
        array : [..] SetPersonaNameResponse_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.SetPersonaNameResponse_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: SetPersonaNameResponse_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (StopPlaytimeTrackingResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.StopPlaytimeTrackingResult_t, call_result_id);
    if !found {
        array : [..] StopPlaytimeTrackingResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.StopPlaytimeTrackingResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: StopPlaytimeTrackingResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (NumberOfCurrentPlayers_t, bool) -> ()) {
    procs, found := table_find(*CallResults.NumberOfCurrentPlayers_t, call_result_id);
    if !found {
        array : [..] NumberOfCurrentPlayers_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.NumberOfCurrentPlayers_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: NumberOfCurrentPlayers_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (ChangeNumOpenSlotsCallback_t, bool) -> ()) {
    procs, found := table_find(*CallResults.ChangeNumOpenSlotsCallback_t, call_result_id);
    if !found {
        array : [..] ChangeNumOpenSlotsCallback_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.ChangeNumOpenSlotsCallback_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: ChangeNumOpenSlotsCallback_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoveAppDependencyResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoveAppDependencyResult_t, call_result_id);
    if !found {
        array : [..] RemoveAppDependencyResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoveAppDependencyResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoveAppDependencyResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (UserFavoriteItemsListChanged_t, bool) -> ()) {
    procs, found := table_find(*CallResults.UserFavoriteItemsListChanged_t, call_result_id);
    if !found {
        array : [..] UserFavoriteItemsListChanged_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.UserFavoriteItemsListChanged_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: UserFavoriteItemsListChanged_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (SteamInventoryRequestPricesResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.SteamInventoryRequestPricesResult_t, call_result_id);
    if !found {
        array : [..] SteamInventoryRequestPricesResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.SteamInventoryRequestPricesResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: SteamInventoryRequestPricesResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (AddAppDependencyResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.AddAppDependencyResult_t, call_result_id);
    if !found {
        array : [..] AddAppDependencyResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.AddAppDependencyResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: AddAppDependencyResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (LeaderboardFindResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.LeaderboardFindResult_t, call_result_id);
    if !found {
        array : [..] LeaderboardFindResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.LeaderboardFindResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: LeaderboardFindResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageDownloadUGCResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageDownloadUGCResult_t, call_result_id);
    if !found {
        array : [..] RemoteStorageDownloadUGCResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageDownloadUGCResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageDownloadUGCResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (CheckFileSignature_t, bool) -> ()) {
    procs, found := table_find(*CallResults.CheckFileSignature_t, call_result_id);
    if !found {
        array : [..] CheckFileSignature_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.CheckFileSignature_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: CheckFileSignature_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageGetPublishedFileDetailsResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageGetPublishedFileDetailsResult_t, call_result_id);
    if !found {
        array : [..] RemoteStorageGetPublishedFileDetailsResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageGetPublishedFileDetailsResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageGetPublishedFileDetailsResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (FileDetailsResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.FileDetailsResult_t, call_result_id);
    if !found {
        array : [..] FileDetailsResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.FileDetailsResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: FileDetailsResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (ComputeNewPlayerCompatibilityResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.ComputeNewPlayerCompatibilityResult_t, call_result_id);
    if !found {
        array : [..] ComputeNewPlayerCompatibilityResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.ComputeNewPlayerCompatibilityResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: ComputeNewPlayerCompatibilityResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageSetUserPublishedFileActionResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageSetUserPublishedFileActionResult_t, call_result_id);
    if !found {
        array : [..] RemoteStorageSetUserPublishedFileActionResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageSetUserPublishedFileActionResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageSetUserPublishedFileActionResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageEnumerateUserPublishedFilesResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageEnumerateUserPublishedFilesResult_t, call_result_id);
    if !found {
        array : [..] RemoteStorageEnumerateUserPublishedFilesResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageEnumerateUserPublishedFilesResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageEnumerateUserPublishedFilesResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageUnsubscribePublishedFileResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageUnsubscribePublishedFileResult_t, call_result_id);
    if !found {
        array : [..] RemoteStorageUnsubscribePublishedFileResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageUnsubscribePublishedFileResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageUnsubscribePublishedFileResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStoragePublishFileProgress_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStoragePublishFileProgress_t, call_result_id);
    if !found {
        array : [..] RemoteStoragePublishFileProgress_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStoragePublishFileProgress_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStoragePublishFileProgress_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (CreateBeaconCallback_t, bool) -> ()) {
    procs, found := table_find(*CallResults.CreateBeaconCallback_t, call_result_id);
    if !found {
        array : [..] CreateBeaconCallback_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.CreateBeaconCallback_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: CreateBeaconCallback_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (HTML_BrowserReady_t, bool) -> ()) {
    procs, found := table_find(*CallResults.HTML_BrowserReady_t, call_result_id);
    if !found {
        array : [..] HTML_BrowserReady_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.HTML_BrowserReady_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: HTML_BrowserReady_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (MarketEligibilityResponse_t, bool) -> ()) {
    procs, found := table_find(*CallResults.MarketEligibilityResponse_t, call_result_id);
    if !found {
        array : [..] MarketEligibilityResponse_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.MarketEligibilityResponse_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: MarketEligibilityResponse_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageUpdatePublishedFileResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageUpdatePublishedFileResult_t, call_result_id);
    if !found {
        array : [..] RemoteStorageUpdatePublishedFileResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageUpdatePublishedFileResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageUpdatePublishedFileResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (UserStatsReceived_t, bool) -> ()) {
    procs, found := table_find(*CallResults.UserStatsReceived_t, call_result_id);
    if !found {
        array : [..] UserStatsReceived_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.UserStatsReceived_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: UserStatsReceived_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (JoinClanChatRoomCompletionResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.JoinClanChatRoomCompletionResult_t, call_result_id);
    if !found {
        array : [..] JoinClanChatRoomCompletionResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.JoinClanChatRoomCompletionResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: JoinClanChatRoomCompletionResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (GlobalAchievementPercentagesReady_t, bool) -> ()) {
    procs, found := table_find(*CallResults.GlobalAchievementPercentagesReady_t, call_result_id);
    if !found {
        array : [..] GlobalAchievementPercentagesReady_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.GlobalAchievementPercentagesReady_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: GlobalAchievementPercentagesReady_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (AssociateWithClanResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.AssociateWithClanResult_t, call_result_id);
    if !found {
        array : [..] AssociateWithClanResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.AssociateWithClanResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: AssociateWithClanResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (GetAppDependenciesResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.GetAppDependenciesResult_t, call_result_id);
    if !found {
        array : [..] GetAppDependenciesResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.GetAppDependenciesResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: GetAppDependenciesResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (FriendsIsFollowing_t, bool) -> ()) {
    procs, found := table_find(*CallResults.FriendsIsFollowing_t, call_result_id);
    if !found {
        array : [..] FriendsIsFollowing_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.FriendsIsFollowing_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: FriendsIsFollowing_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (SteamUGCRequestUGCDetailsResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.SteamUGCRequestUGCDetailsResult_t, call_result_id);
    if !found {
        array : [..] SteamUGCRequestUGCDetailsResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.SteamUGCRequestUGCDetailsResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: SteamUGCRequestUGCDetailsResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (ClanOfficerListResponse_t, bool) -> ()) {
    procs, found := table_find(*CallResults.ClanOfficerListResponse_t, call_result_id);
    if !found {
        array : [..] ClanOfficerListResponse_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.ClanOfficerListResponse_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: ClanOfficerListResponse_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (FriendsEnumerateFollowingList_t, bool) -> ()) {
    procs, found := table_find(*CallResults.FriendsEnumerateFollowingList_t, call_result_id);
    if !found {
        array : [..] FriendsEnumerateFollowingList_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.FriendsEnumerateFollowingList_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: FriendsEnumerateFollowingList_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageGetPublishedItemVoteDetailsResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageGetPublishedItemVoteDetailsResult_t, call_result_id);
    if !found {
        array : [..] RemoteStorageGetPublishedItemVoteDetailsResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageGetPublishedItemVoteDetailsResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageGetPublishedItemVoteDetailsResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (LobbyEnter_t, bool) -> ()) {
    procs, found := table_find(*CallResults.LobbyEnter_t, call_result_id);
    if !found {
        array : [..] LobbyEnter_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.LobbyEnter_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: LobbyEnter_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (SteamUGCQueryCompleted_t, bool) -> ()) {
    procs, found := table_find(*CallResults.SteamUGCQueryCompleted_t, call_result_id);
    if !found {
        array : [..] SteamUGCQueryCompleted_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.SteamUGCQueryCompleted_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: SteamUGCQueryCompleted_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (GSReputation_t, bool) -> ()) {
    procs, found := table_find(*CallResults.GSReputation_t, call_result_id);
    if !found {
        array : [..] GSReputation_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.GSReputation_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: GSReputation_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (FriendsGetFollowerCount_t, bool) -> ()) {
    procs, found := table_find(*CallResults.FriendsGetFollowerCount_t, call_result_id);
    if !found {
        array : [..] FriendsGetFollowerCount_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.FriendsGetFollowerCount_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: FriendsGetFollowerCount_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (SteamInventoryEligiblePromoItemDefIDs_t, bool) -> ()) {
    procs, found := table_find(*CallResults.SteamInventoryEligiblePromoItemDefIDs_t, call_result_id);
    if !found {
        array : [..] SteamInventoryEligiblePromoItemDefIDs_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.SteamInventoryEligiblePromoItemDefIDs_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: SteamInventoryEligiblePromoItemDefIDs_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (SteamInventoryStartPurchaseResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.SteamInventoryStartPurchaseResult_t, call_result_id);
    if !found {
        array : [..] SteamInventoryStartPurchaseResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.SteamInventoryStartPurchaseResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: SteamInventoryStartPurchaseResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageFileShareResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageFileShareResult_t, call_result_id);
    if !found {
        array : [..] RemoteStorageFileShareResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageFileShareResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageFileShareResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoveUGCDependencyResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoveUGCDependencyResult_t, call_result_id);
    if !found {
        array : [..] RemoveUGCDependencyResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoveUGCDependencyResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoveUGCDependencyResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (StartPlaytimeTrackingResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.StartPlaytimeTrackingResult_t, call_result_id);
    if !found {
        array : [..] StartPlaytimeTrackingResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.StartPlaytimeTrackingResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: StartPlaytimeTrackingResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (GSStatsReceived_t, bool) -> ()) {
    procs, found := table_find(*CallResults.GSStatsReceived_t, call_result_id);
    if !found {
        array : [..] GSStatsReceived_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.GSStatsReceived_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: GSStatsReceived_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (GSStatsStored_t, bool) -> ()) {
    procs, found := table_find(*CallResults.GSStatsStored_t, call_result_id);
    if !found {
        array : [..] GSStatsStored_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.GSStatsStored_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: GSStatsStored_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (SubmitItemUpdateResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.SubmitItemUpdateResult_t, call_result_id);
    if !found {
        array : [..] SubmitItemUpdateResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.SubmitItemUpdateResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: SubmitItemUpdateResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (GetUserItemVoteResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.GetUserItemVoteResult_t, call_result_id);
    if !found {
        array : [..] GetUserItemVoteResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.GetUserItemVoteResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: GetUserItemVoteResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (LeaderboardScoreUploaded_t, bool) -> ()) {
    procs, found := table_find(*CallResults.LeaderboardScoreUploaded_t, call_result_id);
    if !found {
        array : [..] LeaderboardScoreUploaded_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.LeaderboardScoreUploaded_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: LeaderboardScoreUploaded_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageEnumerateUserSubscribedFilesResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageEnumerateUserSubscribedFilesResult_t, call_result_id);
    if !found {
        array : [..] RemoteStorageEnumerateUserSubscribedFilesResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageEnumerateUserSubscribedFilesResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageEnumerateUserSubscribedFilesResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (JoinPartyCallback_t, bool) -> ()) {
    procs, found := table_find(*CallResults.JoinPartyCallback_t, call_result_id);
    if !found {
        array : [..] JoinPartyCallback_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.JoinPartyCallback_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: JoinPartyCallback_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (AddUGCDependencyResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.AddUGCDependencyResult_t, call_result_id);
    if !found {
        array : [..] AddUGCDependencyResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.AddUGCDependencyResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: AddUGCDependencyResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (LeaderboardScoresDownloaded_t, bool) -> ()) {
    procs, found := table_find(*CallResults.LeaderboardScoresDownloaded_t, call_result_id);
    if !found {
        array : [..] LeaderboardScoresDownloaded_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.LeaderboardScoresDownloaded_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: LeaderboardScoresDownloaded_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (DeleteItemResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.DeleteItemResult_t, call_result_id);
    if !found {
        array : [..] DeleteItemResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.DeleteItemResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: DeleteItemResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageFileWriteAsyncComplete_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageFileWriteAsyncComplete_t, call_result_id);
    if !found {
        array : [..] RemoteStorageFileWriteAsyncComplete_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageFileWriteAsyncComplete_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageFileWriteAsyncComplete_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (SetUserItemVoteResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.SetUserItemVoteResult_t, call_result_id);
    if !found {
        array : [..] SetUserItemVoteResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.SetUserItemVoteResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: SetUserItemVoteResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (DurationControl_t, bool) -> ()) {
    procs, found := table_find(*CallResults.DurationControl_t, call_result_id);
    if !found {
        array : [..] DurationControl_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.DurationControl_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: DurationControl_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (RemoteStorageUpdateUserPublishedItemVoteResult_t, bool) -> ()) {
    procs, found := table_find(*CallResults.RemoteStorageUpdateUserPublishedItemVoteResult_t, call_result_id);
    if !found {
        array : [..] RemoteStorageUpdateUserPublishedItemVoteResult_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.RemoteStorageUpdateUserPublishedItemVoteResult_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: RemoteStorageUpdateUserPublishedItemVoteResult_t = %", call_result_id);
}

RegisterCallResult :: (call_result_id: SteamAPICall_t, callback: (LeaderboardUGCSet_t, bool) -> ()) {
    procs, found := table_find(*CallResults.LeaderboardUGCSet_t, call_result_id);
    if !found {
        array : [..] LeaderboardUGCSet_t_CallResult;
        procs = array;
    }
    array_add(*procs, callback);
    table_set(*CallResults.LeaderboardUGCSet_t, call_result_id, procs);
    #if verbose  log("Registered CallResult: LeaderboardUGCSet_t = %", call_result_id);
}


#scope_module


run_call_results :: (callbacks: Table(SteamAPICall_t, [..] StoreAuthURLResponse_t_CallResult), call_id: SteamAPICall_t, call_result: *StoreAuthURLResponse_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageDeletePublishedFileResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageDeletePublishedFileResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageSubscribePublishedFileResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageSubscribePublishedFileResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] EncryptedAppTicketResponse_t_CallResult), call_id: SteamAPICall_t, call_result: *EncryptedAppTicketResponse_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] CreateItemResult_t_CallResult), call_id: SteamAPICall_t, call_result: *CreateItemResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] LobbyMatchList_t_CallResult), call_id: SteamAPICall_t, call_result: *LobbyMatchList_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] DownloadClanActivityCountsResult_t_CallResult), call_id: SteamAPICall_t, call_result: *DownloadClanActivityCountsResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageFileReadAsyncComplete_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageFileReadAsyncComplete_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageEnumeratePublishedFilesByUserActionResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageEnumeratePublishedFilesByUserActionResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] LobbyCreated_t_CallResult), call_id: SteamAPICall_t, call_result: *LobbyCreated_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] GlobalStatsReceived_t_CallResult), call_id: SteamAPICall_t, call_result: *GlobalStatsReceived_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageEnumerateWorkshopFilesResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageEnumerateWorkshopFilesResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] SetPersonaNameResponse_t_CallResult), call_id: SteamAPICall_t, call_result: *SetPersonaNameResponse_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] StopPlaytimeTrackingResult_t_CallResult), call_id: SteamAPICall_t, call_result: *StopPlaytimeTrackingResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] NumberOfCurrentPlayers_t_CallResult), call_id: SteamAPICall_t, call_result: *NumberOfCurrentPlayers_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] ChangeNumOpenSlotsCallback_t_CallResult), call_id: SteamAPICall_t, call_result: *ChangeNumOpenSlotsCallback_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoveAppDependencyResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoveAppDependencyResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] UserFavoriteItemsListChanged_t_CallResult), call_id: SteamAPICall_t, call_result: *UserFavoriteItemsListChanged_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] SteamInventoryRequestPricesResult_t_CallResult), call_id: SteamAPICall_t, call_result: *SteamInventoryRequestPricesResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] AddAppDependencyResult_t_CallResult), call_id: SteamAPICall_t, call_result: *AddAppDependencyResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] LeaderboardFindResult_t_CallResult), call_id: SteamAPICall_t, call_result: *LeaderboardFindResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageDownloadUGCResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageDownloadUGCResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] CheckFileSignature_t_CallResult), call_id: SteamAPICall_t, call_result: *CheckFileSignature_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageGetPublishedFileDetailsResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageGetPublishedFileDetailsResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] FileDetailsResult_t_CallResult), call_id: SteamAPICall_t, call_result: *FileDetailsResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] ComputeNewPlayerCompatibilityResult_t_CallResult), call_id: SteamAPICall_t, call_result: *ComputeNewPlayerCompatibilityResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageSetUserPublishedFileActionResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageSetUserPublishedFileActionResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageEnumerateUserPublishedFilesResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageEnumerateUserPublishedFilesResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageUnsubscribePublishedFileResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageUnsubscribePublishedFileResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStoragePublishFileProgress_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStoragePublishFileProgress_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] CreateBeaconCallback_t_CallResult), call_id: SteamAPICall_t, call_result: *CreateBeaconCallback_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] HTML_BrowserReady_t_CallResult), call_id: SteamAPICall_t, call_result: *HTML_BrowserReady_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] MarketEligibilityResponse_t_CallResult), call_id: SteamAPICall_t, call_result: *MarketEligibilityResponse_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageUpdatePublishedFileResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageUpdatePublishedFileResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] UserStatsReceived_t_CallResult), call_id: SteamAPICall_t, call_result: *UserStatsReceived_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] JoinClanChatRoomCompletionResult_t_CallResult), call_id: SteamAPICall_t, call_result: *JoinClanChatRoomCompletionResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] GlobalAchievementPercentagesReady_t_CallResult), call_id: SteamAPICall_t, call_result: *GlobalAchievementPercentagesReady_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] AssociateWithClanResult_t_CallResult), call_id: SteamAPICall_t, call_result: *AssociateWithClanResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] GetAppDependenciesResult_t_CallResult), call_id: SteamAPICall_t, call_result: *GetAppDependenciesResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] FriendsIsFollowing_t_CallResult), call_id: SteamAPICall_t, call_result: *FriendsIsFollowing_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] SteamUGCRequestUGCDetailsResult_t_CallResult), call_id: SteamAPICall_t, call_result: *SteamUGCRequestUGCDetailsResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] ClanOfficerListResponse_t_CallResult), call_id: SteamAPICall_t, call_result: *ClanOfficerListResponse_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] FriendsEnumerateFollowingList_t_CallResult), call_id: SteamAPICall_t, call_result: *FriendsEnumerateFollowingList_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageGetPublishedItemVoteDetailsResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageGetPublishedItemVoteDetailsResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] LobbyEnter_t_CallResult), call_id: SteamAPICall_t, call_result: *LobbyEnter_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] SteamUGCQueryCompleted_t_CallResult), call_id: SteamAPICall_t, call_result: *SteamUGCQueryCompleted_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] GSReputation_t_CallResult), call_id: SteamAPICall_t, call_result: *GSReputation_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] FriendsGetFollowerCount_t_CallResult), call_id: SteamAPICall_t, call_result: *FriendsGetFollowerCount_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] SteamInventoryEligiblePromoItemDefIDs_t_CallResult), call_id: SteamAPICall_t, call_result: *SteamInventoryEligiblePromoItemDefIDs_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] SteamInventoryStartPurchaseResult_t_CallResult), call_id: SteamAPICall_t, call_result: *SteamInventoryStartPurchaseResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageFileShareResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageFileShareResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoveUGCDependencyResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoveUGCDependencyResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] StartPlaytimeTrackingResult_t_CallResult), call_id: SteamAPICall_t, call_result: *StartPlaytimeTrackingResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] GSStatsReceived_t_CallResult), call_id: SteamAPICall_t, call_result: *GSStatsReceived_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] GSStatsStored_t_CallResult), call_id: SteamAPICall_t, call_result: *GSStatsStored_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] SubmitItemUpdateResult_t_CallResult), call_id: SteamAPICall_t, call_result: *SubmitItemUpdateResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] GetUserItemVoteResult_t_CallResult), call_id: SteamAPICall_t, call_result: *GetUserItemVoteResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] LeaderboardScoreUploaded_t_CallResult), call_id: SteamAPICall_t, call_result: *LeaderboardScoreUploaded_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageEnumerateUserSubscribedFilesResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageEnumerateUserSubscribedFilesResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] JoinPartyCallback_t_CallResult), call_id: SteamAPICall_t, call_result: *JoinPartyCallback_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] AddUGCDependencyResult_t_CallResult), call_id: SteamAPICall_t, call_result: *AddUGCDependencyResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] LeaderboardScoresDownloaded_t_CallResult), call_id: SteamAPICall_t, call_result: *LeaderboardScoresDownloaded_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] DeleteItemResult_t_CallResult), call_id: SteamAPICall_t, call_result: *DeleteItemResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageFileWriteAsyncComplete_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageFileWriteAsyncComplete_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] SetUserItemVoteResult_t_CallResult), call_id: SteamAPICall_t, call_result: *SetUserItemVoteResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] DurationControl_t_CallResult), call_id: SteamAPICall_t, call_result: *DurationControl_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] RemoteStorageUpdateUserPublishedItemVoteResult_t_CallResult), call_id: SteamAPICall_t, call_result: *RemoteStorageUpdateUserPublishedItemVoteResult_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}

run_call_results :: (callbacks: Table(SteamAPICall_t, [..] LeaderboardUGCSet_t_CallResult), call_id: SteamAPICall_t, call_result: *LeaderboardUGCSet_t, io_failure: bool) {
    procs, found := table_find(*callbacks, call_id);
    if found {
        for procs  it(<<call_result, io_failure);
        array_reset(*procs);
        table_remove(*callbacks, call_id);
    }
}
