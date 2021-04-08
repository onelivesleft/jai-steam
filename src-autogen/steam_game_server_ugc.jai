steam_game_server_ugc : *ISteamUGC;


ServerCreateQueryUserUGCRequest :: inline (unAccountID: AccountID_t, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryUserUGCRequest(steam_game_server_ugc, unAccountID, eListType, eMatchingUGCType, eSortOrder, nCreatorAppID, nConsumerAppID, unPage);
}


ServerCreateQueryAllUGCRequestPage :: inline (eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryAllUGCRequestPage(steam_game_server_ugc, eQueryType, eMatchingeMatchingUGCTypeFileType, nCreatorAppID, nConsumerAppID, unPage);
}


ServerCreateQueryAllUGCRequestCursor :: inline (eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, pchCursor: *char) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryAllUGCRequestCursor(steam_game_server_ugc, eQueryType, eMatchingeMatchingUGCTypeFileType, nCreatorAppID, nConsumerAppID, pchCursor);
}


ServerCreateQueryUGCDetailsRequest :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest(steam_game_server_ugc, pvecPublishedFileID, unNumPublishedFileIDs);
}


ServerSendQueryUGCRequest :: inline (handle: UGCQueryHandle_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_SendQueryUGCRequest(steam_game_server_ugc, handle);
}

ServerSendQueryUGCRequest :: inline (handle: UGCQueryHandle_t, callback: (SteamUGCQueryCompleted_t, bool) -> ()) {
    RegisterCallResult(
        ServerSendQueryUGCRequest(handle),
        callback
    );
}

ServerSendQueryUGCRequest :: (handle: UGCQueryHandle_t, code: Code) #expand {
    RegisterCallResult(
        ServerSendQueryUGCRequest(handle),
        (result: SteamUGCQueryCompleted_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerGetQueryUGCResult :: inline (handle: UGCQueryHandle_t, index: uint32, pDetails: *SteamUGCDetails_t) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCResult(steam_game_server_ugc, handle, index, pDetails);
}


ServerGetQueryUGCNumTags :: inline (handle: UGCQueryHandle_t, index: uint32) -> uint32 {
    return SteamAPI_ISteamUGC_GetQueryUGCNumTags(steam_game_server_ugc, handle, index);
}


ServerGetQueryUGCTag :: inline (handle: UGCQueryHandle_t, index: uint32, indexTag: uint32, pchValue: *char, cchValueSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCTag(steam_game_server_ugc, handle, index, indexTag, pchValue, cchValueSize);
}


ServerGetQueryUGCTagDisplayName :: inline (handle: UGCQueryHandle_t, index: uint32, indexTag: uint32, pchValue: *char, cchValueSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCTagDisplayName(steam_game_server_ugc, handle, index, indexTag, pchValue, cchValueSize);
}


ServerGetQueryUGCPreviewURL :: inline (handle: UGCQueryHandle_t, index: uint32, pchURL: *char, cchURLSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCPreviewURL(steam_game_server_ugc, handle, index, pchURL, cchURLSize);
}


ServerGetQueryUGCMetadata :: inline (handle: UGCQueryHandle_t, index: uint32, pchMetadata: *char, cchMetadatasize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCMetadata(steam_game_server_ugc, handle, index, pchMetadata, cchMetadatasize);
}


ServerGetQueryUGCChildren :: inline (handle: UGCQueryHandle_t, index: uint32, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCChildren(steam_game_server_ugc, handle, index, pvecPublishedFileID, cMaxEntries);
}


ServerGetQueryUGCStatistic :: inline (handle: UGCQueryHandle_t, index: uint32, eStatType: EItemStatistic, pStatValue: *uint64) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCStatistic(steam_game_server_ugc, handle, index, eStatType, pStatValue);
}


ServerGetQueryUGCNumAdditionalPreviews :: inline (handle: UGCQueryHandle_t, index: uint32) -> uint32 {
    return SteamAPI_ISteamUGC_GetQueryUGCNumAdditionalPreviews(steam_game_server_ugc, handle, index);
}


ServerGetQueryUGCAdditionalPreview :: inline (handle: UGCQueryHandle_t, index: uint32, previewIndex: uint32, pchURLOrVideoID: *char, cchURLSize: uint32, pchOriginalFileName: *char, cchOriginalFileNameSize: uint32, pPreviewType: *EItemPreviewType) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview(steam_game_server_ugc, handle, index, previewIndex, pchURLOrVideoID, cchURLSize, pchOriginalFileName, cchOriginalFileNameSize, pPreviewType);
}


ServerGetQueryUGCNumKeyValueTags :: inline (handle: UGCQueryHandle_t, index: uint32) -> uint32 {
    return SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags(steam_game_server_ugc, handle, index);
}


ServerGetQueryUGCKeyValueTag :: inline (handle: UGCQueryHandle_t, index: uint32, keyValueTagIndex: uint32, pchKey: *char, cchKeySize: uint32, pchValue: *char, cchValueSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag(steam_game_server_ugc, handle, index, keyValueTagIndex, pchKey, cchKeySize, pchValue, cchValueSize);
}


ServerGetQueryFirstUGCKeyValueTag :: inline (handle: UGCQueryHandle_t, index: uint32, pchKey: *char, pchValue: *char, cchValueSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryFirstUGCKeyValueTag(steam_game_server_ugc, handle, index, pchKey, pchValue, cchValueSize);
}


ServerReleaseQueryUGCRequest :: inline (handle: UGCQueryHandle_t) -> bool {
    return SteamAPI_ISteamUGC_ReleaseQueryUGCRequest(steam_game_server_ugc, handle);
}


ServerAddRequiredTag :: inline (handle: UGCQueryHandle_t, pTagName: *char) -> bool {
    return SteamAPI_ISteamUGC_AddRequiredTag(steam_game_server_ugc, handle, pTagName);
}


ServerAddRequiredTagGroup :: inline (handle: UGCQueryHandle_t, pTagGroups: *SteamParamStringArray_t) -> bool {
    return SteamAPI_ISteamUGC_AddRequiredTagGroup(steam_game_server_ugc, handle, pTagGroups);
}


ServerAddExcludedTag :: inline (handle: UGCQueryHandle_t, pTagName: *char) -> bool {
    return SteamAPI_ISteamUGC_AddExcludedTag(steam_game_server_ugc, handle, pTagName);
}


ServerSetReturnOnlyIDs :: inline (handle: UGCQueryHandle_t, bReturnOnlyIDs: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnOnlyIDs(steam_game_server_ugc, handle, bReturnOnlyIDs);
}


ServerSetReturnKeyValueTags :: inline (handle: UGCQueryHandle_t, bReturnKeyValueTags: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnKeyValueTags(steam_game_server_ugc, handle, bReturnKeyValueTags);
}


ServerSetReturnLongDescription :: inline (handle: UGCQueryHandle_t, bReturnLongDescription: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnLongDescription(steam_game_server_ugc, handle, bReturnLongDescription);
}


ServerSetReturnMetadata :: inline (handle: UGCQueryHandle_t, bReturnMetadata: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnMetadata(steam_game_server_ugc, handle, bReturnMetadata);
}


ServerSetReturnChildren :: inline (handle: UGCQueryHandle_t, bReturnChildren: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnChildren(steam_game_server_ugc, handle, bReturnChildren);
}


ServerSetReturnAdditionalPreviews :: inline (handle: UGCQueryHandle_t, bReturnAdditionalPreviews: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnAdditionalPreviews(steam_game_server_ugc, handle, bReturnAdditionalPreviews);
}


ServerSetReturnTotalOnly :: inline (handle: UGCQueryHandle_t, bReturnTotalOnly: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnTotalOnly(steam_game_server_ugc, handle, bReturnTotalOnly);
}


ServerSetReturnPlaytimeStats :: inline (handle: UGCQueryHandle_t, unDays: uint32) -> bool {
    return SteamAPI_ISteamUGC_SetReturnPlaytimeStats(steam_game_server_ugc, handle, unDays);
}


ServerSetLanguage :: inline (handle: UGCQueryHandle_t, pchLanguage: *char) -> bool {
    return SteamAPI_ISteamUGC_SetLanguage(steam_game_server_ugc, handle, pchLanguage);
}


ServerSetAllowCachedResponse :: inline (handle: UGCQueryHandle_t, unMaxAgeSeconds: uint32) -> bool {
    return SteamAPI_ISteamUGC_SetAllowCachedResponse(steam_game_server_ugc, handle, unMaxAgeSeconds);
}


ServerSetCloudFileNameFilter :: inline (handle: UGCQueryHandle_t, pMatchCloudFileName: *char) -> bool {
    return SteamAPI_ISteamUGC_SetCloudFileNameFilter(steam_game_server_ugc, handle, pMatchCloudFileName);
}


ServerSetMatchAnyTag :: inline (handle: UGCQueryHandle_t, bMatchAnyTag: bool) -> bool {
    return SteamAPI_ISteamUGC_SetMatchAnyTag(steam_game_server_ugc, handle, bMatchAnyTag);
}


ServerSetSearchText :: inline (handle: UGCQueryHandle_t, pSearchText: *char) -> bool {
    return SteamAPI_ISteamUGC_SetSearchText(steam_game_server_ugc, handle, pSearchText);
}


ServerSetRankedByTrendDays :: inline (handle: UGCQueryHandle_t, unDays: uint32) -> bool {
    return SteamAPI_ISteamUGC_SetRankedByTrendDays(steam_game_server_ugc, handle, unDays);
}


ServerAddRequiredKeyValueTag :: inline (handle: UGCQueryHandle_t, pKey: *char, pValue: *char) -> bool {
    return SteamAPI_ISteamUGC_AddRequiredKeyValueTag(steam_game_server_ugc, handle, pKey, pValue);
}


ServerRequestUGCDetails :: inline (nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_RequestUGCDetails(steam_game_server_ugc, nPublishedFileID, unMaxAgeSeconds);
}

ServerRequestUGCDetails :: inline (nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32, callback: (SteamUGCRequestUGCDetailsResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerRequestUGCDetails(nPublishedFileID, unMaxAgeSeconds),
        callback
    );
}

ServerRequestUGCDetails :: (nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32, code: Code) #expand {
    RegisterCallResult(
        ServerRequestUGCDetails(nPublishedFileID, unMaxAgeSeconds),
        (result: SteamUGCRequestUGCDetailsResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerCreateItem :: inline (nConsumerAppId: AppId_t, eFileType: EWorkshopFileType) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_CreateItem(steam_game_server_ugc, nConsumerAppId, eFileType);
}

ServerCreateItem :: inline (nConsumerAppId: AppId_t, eFileType: EWorkshopFileType, callback: (CreateItemResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerCreateItem(nConsumerAppId, eFileType),
        callback
    );
}

ServerCreateItem :: (nConsumerAppId: AppId_t, eFileType: EWorkshopFileType, code: Code) #expand {
    RegisterCallResult(
        ServerCreateItem(nConsumerAppId, eFileType),
        (result: CreateItemResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerStartItemUpdate :: inline (nConsumerAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> UGCUpdateHandle_t {
    return SteamAPI_ISteamUGC_StartItemUpdate(steam_game_server_ugc, nConsumerAppId, nPublishedFileID);
}


ServerSetItemTitle :: inline (handle: UGCUpdateHandle_t, pchTitle: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemTitle(steam_game_server_ugc, handle, pchTitle);
}


ServerSetItemDescription :: inline (handle: UGCUpdateHandle_t, pchDescription: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemDescription(steam_game_server_ugc, handle, pchDescription);
}


ServerSetItemUpdateLanguage :: inline (handle: UGCUpdateHandle_t, pchLanguage: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemUpdateLanguage(steam_game_server_ugc, handle, pchLanguage);
}


ServerSetItemMetadata :: inline (handle: UGCUpdateHandle_t, pchMetaData: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemMetadata(steam_game_server_ugc, handle, pchMetaData);
}


ServerSetItemVisibility :: inline (handle: UGCUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool {
    return SteamAPI_ISteamUGC_SetItemVisibility(steam_game_server_ugc, handle, eVisibility);
}


ServerSetItemTags :: inline (updateHandle: UGCUpdateHandle_t, pTags: *SteamParamStringArray_t) -> bool {
    return SteamAPI_ISteamUGC_SetItemTags(steam_game_server_ugc, updateHandle, pTags);
}


ServerSetItemContent :: inline (handle: UGCUpdateHandle_t, pszContentFolder: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemContent(steam_game_server_ugc, handle, pszContentFolder);
}


ServerSetItemPreview :: inline (handle: UGCUpdateHandle_t, pszPreviewFile: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemPreview(steam_game_server_ugc, handle, pszPreviewFile);
}


ServerSetAllowLegacyUpload :: inline (handle: UGCUpdateHandle_t, bAllowLegacyUpload: bool) -> bool {
    return SteamAPI_ISteamUGC_SetAllowLegacyUpload(steam_game_server_ugc, handle, bAllowLegacyUpload);
}


ServerRemoveAllItemKeyValueTags :: inline (handle: UGCUpdateHandle_t) -> bool {
    return SteamAPI_ISteamUGC_RemoveAllItemKeyValueTags(steam_game_server_ugc, handle);
}


ServerRemoveItemKeyValueTags :: inline (handle: UGCUpdateHandle_t, pchKey: *char) -> bool {
    return SteamAPI_ISteamUGC_RemoveItemKeyValueTags(steam_game_server_ugc, handle, pchKey);
}


ServerAddItemKeyValueTag :: inline (handle: UGCUpdateHandle_t, pchKey: *char, pchValue: *char) -> bool {
    return SteamAPI_ISteamUGC_AddItemKeyValueTag(steam_game_server_ugc, handle, pchKey, pchValue);
}


ServerAddItemPreviewFile :: inline (handle: UGCUpdateHandle_t, pszPreviewFile: *char, type: EItemPreviewType) -> bool {
    return SteamAPI_ISteamUGC_AddItemPreviewFile(steam_game_server_ugc, handle, pszPreviewFile, type);
}


ServerAddItemPreviewVideo :: inline (handle: UGCUpdateHandle_t, pszVideoID: *char) -> bool {
    return SteamAPI_ISteamUGC_AddItemPreviewVideo(steam_game_server_ugc, handle, pszVideoID);
}


ServerUpdateItemPreviewFile :: inline (handle: UGCUpdateHandle_t, index: uint32, pszPreviewFile: *char) -> bool {
    return SteamAPI_ISteamUGC_UpdateItemPreviewFile(steam_game_server_ugc, handle, index, pszPreviewFile);
}


ServerUpdateItemPreviewVideo :: inline (handle: UGCUpdateHandle_t, index: uint32, pszVideoID: *char) -> bool {
    return SteamAPI_ISteamUGC_UpdateItemPreviewVideo(steam_game_server_ugc, handle, index, pszVideoID);
}


ServerRemoveItemPreview :: inline (handle: UGCUpdateHandle_t, index: uint32) -> bool {
    return SteamAPI_ISteamUGC_RemoveItemPreview(steam_game_server_ugc, handle, index);
}


ServerSubmitItemUpdate :: inline (handle: UGCUpdateHandle_t, pchChangeNote: *char) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_SubmitItemUpdate(steam_game_server_ugc, handle, pchChangeNote);
}

ServerSubmitItemUpdate :: inline (handle: UGCUpdateHandle_t, pchChangeNote: *char, callback: (SubmitItemUpdateResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerSubmitItemUpdate(handle, pchChangeNote),
        callback
    );
}

ServerSubmitItemUpdate :: (handle: UGCUpdateHandle_t, pchChangeNote: *char, code: Code) #expand {
    RegisterCallResult(
        ServerSubmitItemUpdate(handle, pchChangeNote),
        (result: SubmitItemUpdateResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerGetItemUpdateProgress :: inline (handle: UGCUpdateHandle_t, punBytesProcessed: *uint64, punBytesTotal: *uint64) -> EItemUpdateStatus {
    return SteamAPI_ISteamUGC_GetItemUpdateProgress(steam_game_server_ugc, handle, punBytesProcessed, punBytesTotal);
}


ServerSetUserItemVote :: inline (nPublishedFileID: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_SetUserItemVote(steam_game_server_ugc, nPublishedFileID, bVoteUp);
}

ServerSetUserItemVote :: inline (nPublishedFileID: PublishedFileId_t, bVoteUp: bool, callback: (SetUserItemVoteResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerSetUserItemVote(nPublishedFileID, bVoteUp),
        callback
    );
}

ServerSetUserItemVote :: (nPublishedFileID: PublishedFileId_t, bVoteUp: bool, code: Code) #expand {
    RegisterCallResult(
        ServerSetUserItemVote(nPublishedFileID, bVoteUp),
        (result: SetUserItemVoteResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerGetUserItemVote :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_GetUserItemVote(steam_game_server_ugc, nPublishedFileID);
}

ServerGetUserItemVote :: inline (nPublishedFileID: PublishedFileId_t, callback: (GetUserItemVoteResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerGetUserItemVote(nPublishedFileID),
        callback
    );
}

ServerGetUserItemVote :: (nPublishedFileID: PublishedFileId_t, code: Code) #expand {
    RegisterCallResult(
        ServerGetUserItemVote(nPublishedFileID),
        (result: GetUserItemVoteResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerAddItemToFavorites :: inline (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_AddItemToFavorites(steam_game_server_ugc, nAppId, nPublishedFileID);
}

ServerAddItemToFavorites :: inline (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t, callback: (UserFavoriteItemsListChanged_t, bool) -> ()) {
    RegisterCallResult(
        ServerAddItemToFavorites(nAppId, nPublishedFileID),
        callback
    );
}

ServerAddItemToFavorites :: (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t, code: Code) #expand {
    RegisterCallResult(
        ServerAddItemToFavorites(nAppId, nPublishedFileID),
        (result: UserFavoriteItemsListChanged_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerRemoveItemFromFavorites :: inline (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_RemoveItemFromFavorites(steam_game_server_ugc, nAppId, nPublishedFileID);
}

ServerRemoveItemFromFavorites :: inline (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t, callback: (UserFavoriteItemsListChanged_t, bool) -> ()) {
    RegisterCallResult(
        ServerRemoveItemFromFavorites(nAppId, nPublishedFileID),
        callback
    );
}

ServerRemoveItemFromFavorites :: (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t, code: Code) #expand {
    RegisterCallResult(
        ServerRemoveItemFromFavorites(nAppId, nPublishedFileID),
        (result: UserFavoriteItemsListChanged_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerSubscribeItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_SubscribeItem(steam_game_server_ugc, nPublishedFileID);
}

ServerSubscribeItem :: inline (nPublishedFileID: PublishedFileId_t, callback: (RemoteStorageSubscribePublishedFileResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerSubscribeItem(nPublishedFileID),
        callback
    );
}

ServerSubscribeItem :: (nPublishedFileID: PublishedFileId_t, code: Code) #expand {
    RegisterCallResult(
        ServerSubscribeItem(nPublishedFileID),
        (result: RemoteStorageSubscribePublishedFileResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerUnsubscribeItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_UnsubscribeItem(steam_game_server_ugc, nPublishedFileID);
}

ServerUnsubscribeItem :: inline (nPublishedFileID: PublishedFileId_t, callback: (RemoteStorageUnsubscribePublishedFileResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerUnsubscribeItem(nPublishedFileID),
        callback
    );
}

ServerUnsubscribeItem :: (nPublishedFileID: PublishedFileId_t, code: Code) #expand {
    RegisterCallResult(
        ServerUnsubscribeItem(nPublishedFileID),
        (result: RemoteStorageUnsubscribePublishedFileResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerGetNumSubscribedItems :: inline () -> uint32 {
    return SteamAPI_ISteamUGC_GetNumSubscribedItems(steam_game_server_ugc);
}


ServerGetSubscribedItems :: inline (pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> uint32 {
    return SteamAPI_ISteamUGC_GetSubscribedItems(steam_game_server_ugc, pvecPublishedFileID, cMaxEntries);
}


ServerGetItemState :: inline (nPublishedFileID: PublishedFileId_t) -> uint32 {
    return SteamAPI_ISteamUGC_GetItemState(steam_game_server_ugc, nPublishedFileID);
}


ServerGetItemInstallInfo :: inline (nPublishedFileID: PublishedFileId_t, punSizeOnDisk: *uint64, pchFolder: *char, cchFolderSize: uint32, punTimeStamp: *uint32) -> bool {
    return SteamAPI_ISteamUGC_GetItemInstallInfo(steam_game_server_ugc, nPublishedFileID, punSizeOnDisk, pchFolder, cchFolderSize, punTimeStamp);
}


ServerGetItemDownloadInfo :: inline (nPublishedFileID: PublishedFileId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool {
    return SteamAPI_ISteamUGC_GetItemDownloadInfo(steam_game_server_ugc, nPublishedFileID, punBytesDownloaded, punBytesTotal);
}


ServerDownloadItem :: inline (nPublishedFileID: PublishedFileId_t, bHighPriority: bool) -> bool {
    return SteamAPI_ISteamUGC_DownloadItem(steam_game_server_ugc, nPublishedFileID, bHighPriority);
}


ServerBInitWorkshopForGameServer :: inline (unWorkshopDepotID: DepotId_t, pszFolder: *char) -> bool {
    return SteamAPI_ISteamUGC_BInitWorkshopForGameServer(steam_game_server_ugc, unWorkshopDepotID, pszFolder);
}


ServerSuspendDownloads :: inline (bSuspend: bool) {
    SteamAPI_ISteamUGC_SuspendDownloads(steam_game_server_ugc, bSuspend);
}


ServerStartPlaytimeTracking :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_StartPlaytimeTracking(steam_game_server_ugc, pvecPublishedFileID, unNumPublishedFileIDs);
}

ServerStartPlaytimeTracking :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32, callback: (StartPlaytimeTrackingResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerStartPlaytimeTracking(pvecPublishedFileID, unNumPublishedFileIDs),
        callback
    );
}

ServerStartPlaytimeTracking :: (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32, code: Code) #expand {
    RegisterCallResult(
        ServerStartPlaytimeTracking(pvecPublishedFileID, unNumPublishedFileIDs),
        (result: StartPlaytimeTrackingResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerStopPlaytimeTracking :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_StopPlaytimeTracking(steam_game_server_ugc, pvecPublishedFileID, unNumPublishedFileIDs);
}

ServerStopPlaytimeTracking :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32, callback: (StopPlaytimeTrackingResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerStopPlaytimeTracking(pvecPublishedFileID, unNumPublishedFileIDs),
        callback
    );
}

ServerStopPlaytimeTracking :: (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32, code: Code) #expand {
    RegisterCallResult(
        ServerStopPlaytimeTracking(pvecPublishedFileID, unNumPublishedFileIDs),
        (result: StopPlaytimeTrackingResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerStopPlaytimeTrackingForAllItems :: inline () -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_StopPlaytimeTrackingForAllItems(steam_game_server_ugc);
}

ServerStopPlaytimeTrackingForAllItems :: inline (callback: (StopPlaytimeTrackingResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerStopPlaytimeTrackingForAllItems(),
        callback
    );
}

ServerStopPlaytimeTrackingForAllItems :: (code: Code) #expand {
    RegisterCallResult(
        ServerStopPlaytimeTrackingForAllItems(),
        (result: StopPlaytimeTrackingResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerAddDependency :: inline (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_AddDependency(steam_game_server_ugc, nParentPublishedFileID, nChildPublishedFileID);
}

ServerAddDependency :: inline (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t, callback: (AddUGCDependencyResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerAddDependency(nParentPublishedFileID, nChildPublishedFileID),
        callback
    );
}

ServerAddDependency :: (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t, code: Code) #expand {
    RegisterCallResult(
        ServerAddDependency(nParentPublishedFileID, nChildPublishedFileID),
        (result: AddUGCDependencyResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerRemoveDependency :: inline (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_RemoveDependency(steam_game_server_ugc, nParentPublishedFileID, nChildPublishedFileID);
}

ServerRemoveDependency :: inline (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t, callback: (RemoveUGCDependencyResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerRemoveDependency(nParentPublishedFileID, nChildPublishedFileID),
        callback
    );
}

ServerRemoveDependency :: (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t, code: Code) #expand {
    RegisterCallResult(
        ServerRemoveDependency(nParentPublishedFileID, nChildPublishedFileID),
        (result: RemoveUGCDependencyResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerAddAppDependency :: inline (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_AddAppDependency(steam_game_server_ugc, nPublishedFileID, nAppID);
}

ServerAddAppDependency :: inline (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t, callback: (AddAppDependencyResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerAddAppDependency(nPublishedFileID, nAppID),
        callback
    );
}

ServerAddAppDependency :: (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t, code: Code) #expand {
    RegisterCallResult(
        ServerAddAppDependency(nPublishedFileID, nAppID),
        (result: AddAppDependencyResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerRemoveAppDependency :: inline (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_RemoveAppDependency(steam_game_server_ugc, nPublishedFileID, nAppID);
}

ServerRemoveAppDependency :: inline (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t, callback: (RemoveAppDependencyResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerRemoveAppDependency(nPublishedFileID, nAppID),
        callback
    );
}

ServerRemoveAppDependency :: (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t, code: Code) #expand {
    RegisterCallResult(
        ServerRemoveAppDependency(nPublishedFileID, nAppID),
        (result: RemoveAppDependencyResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerGetAppDependencies :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_GetAppDependencies(steam_game_server_ugc, nPublishedFileID);
}

ServerGetAppDependencies :: inline (nPublishedFileID: PublishedFileId_t, callback: (GetAppDependenciesResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerGetAppDependencies(nPublishedFileID),
        callback
    );
}

ServerGetAppDependencies :: (nPublishedFileID: PublishedFileId_t, code: Code) #expand {
    RegisterCallResult(
        ServerGetAppDependencies(nPublishedFileID),
        (result: GetAppDependenciesResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerDeleteItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_DeleteItem(steam_game_server_ugc, nPublishedFileID);
}

ServerDeleteItem :: inline (nPublishedFileID: PublishedFileId_t, callback: (DeleteItemResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerDeleteItem(nPublishedFileID),
        callback
    );
}

ServerDeleteItem :: (nPublishedFileID: PublishedFileId_t, code: Code) #expand {
    RegisterCallResult(
        ServerDeleteItem(nPublishedFileID),
        (result: DeleteItemResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}
