steam_ugc : *ISteamUGC;


CreateQueryUserUGCRequest :: inline (unAccountID: AccountID_t, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryUserUGCRequest(steam_ugc, unAccountID, eListType, eMatchingUGCType, eSortOrder, nCreatorAppID, nConsumerAppID, unPage);
}


CreateQueryAllUGCRequestPage :: inline (eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryAllUGCRequestPage(steam_ugc, eQueryType, eMatchingeMatchingUGCTypeFileType, nCreatorAppID, nConsumerAppID, unPage);
}


CreateQueryAllUGCRequestCursor :: inline (eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, pchCursor: *char) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryAllUGCRequestCursor(steam_ugc, eQueryType, eMatchingeMatchingUGCTypeFileType, nCreatorAppID, nConsumerAppID, pchCursor);
}


CreateQueryUGCDetailsRequest :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest(steam_ugc, pvecPublishedFileID, unNumPublishedFileIDs);
}


SendQueryUGCRequest :: inline (handle: UGCQueryHandle_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_SendQueryUGCRequest(steam_ugc, handle);
}

SendQueryUGCRequest :: inline (handle: UGCQueryHandle_t, callback: (SteamUGCQueryCompleted_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := SendQueryUGCRequest(handle);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

SendQueryUGCRequest :: (handle: UGCQueryHandle_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := SendQueryUGCRequest(handle);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: SteamUGCQueryCompleted_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


GetQueryUGCResult :: inline (handle: UGCQueryHandle_t, index: uint32, pDetails: *SteamUGCDetails_t) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCResult(steam_ugc, handle, index, pDetails);
}


GetQueryUGCNumTags :: inline (handle: UGCQueryHandle_t, index: uint32) -> uint32 {
    return SteamAPI_ISteamUGC_GetQueryUGCNumTags(steam_ugc, handle, index);
}


GetQueryUGCTag :: inline (handle: UGCQueryHandle_t, index: uint32, indexTag: uint32, pchValue: *char, cchValueSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCTag(steam_ugc, handle, index, indexTag, pchValue, cchValueSize);
}


GetQueryUGCTagDisplayName :: inline (handle: UGCQueryHandle_t, index: uint32, indexTag: uint32, pchValue: *char, cchValueSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCTagDisplayName(steam_ugc, handle, index, indexTag, pchValue, cchValueSize);
}


GetQueryUGCPreviewURL :: inline (handle: UGCQueryHandle_t, index: uint32, pchURL: *char, cchURLSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCPreviewURL(steam_ugc, handle, index, pchURL, cchURLSize);
}


GetQueryUGCMetadata :: inline (handle: UGCQueryHandle_t, index: uint32, pchMetadata: *char, cchMetadatasize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCMetadata(steam_ugc, handle, index, pchMetadata, cchMetadatasize);
}


GetQueryUGCChildren :: inline (handle: UGCQueryHandle_t, index: uint32, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCChildren(steam_ugc, handle, index, pvecPublishedFileID, cMaxEntries);
}


GetQueryUGCStatistic :: inline (handle: UGCQueryHandle_t, index: uint32, eStatType: EItemStatistic, pStatValue: *uint64) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCStatistic(steam_ugc, handle, index, eStatType, pStatValue);
}


GetQueryUGCNumAdditionalPreviews :: inline (handle: UGCQueryHandle_t, index: uint32) -> uint32 {
    return SteamAPI_ISteamUGC_GetQueryUGCNumAdditionalPreviews(steam_ugc, handle, index);
}


GetQueryUGCAdditionalPreview :: inline (handle: UGCQueryHandle_t, index: uint32, previewIndex: uint32, pchURLOrVideoID: *char, cchURLSize: uint32, pchOriginalFileName: *char, cchOriginalFileNameSize: uint32, pPreviewType: *EItemPreviewType) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview(steam_ugc, handle, index, previewIndex, pchURLOrVideoID, cchURLSize, pchOriginalFileName, cchOriginalFileNameSize, pPreviewType);
}


GetQueryUGCNumKeyValueTags :: inline (handle: UGCQueryHandle_t, index: uint32) -> uint32 {
    return SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags(steam_ugc, handle, index);
}


GetQueryUGCKeyValueTag :: inline (handle: UGCQueryHandle_t, index: uint32, keyValueTagIndex: uint32, pchKey: *char, cchKeySize: uint32, pchValue: *char, cchValueSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag(steam_ugc, handle, index, keyValueTagIndex, pchKey, cchKeySize, pchValue, cchValueSize);
}


GetQueryFirstUGCKeyValueTag :: inline (handle: UGCQueryHandle_t, index: uint32, pchKey: *char, pchValue: *char, cchValueSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryFirstUGCKeyValueTag(steam_ugc, handle, index, pchKey, pchValue, cchValueSize);
}


ReleaseQueryUGCRequest :: inline (handle: UGCQueryHandle_t) -> bool {
    return SteamAPI_ISteamUGC_ReleaseQueryUGCRequest(steam_ugc, handle);
}


AddRequiredTag :: inline (handle: UGCQueryHandle_t, pTagName: *char) -> bool {
    return SteamAPI_ISteamUGC_AddRequiredTag(steam_ugc, handle, pTagName);
}


AddRequiredTagGroup :: inline (handle: UGCQueryHandle_t, pTagGroups: *SteamParamStringArray_t) -> bool {
    return SteamAPI_ISteamUGC_AddRequiredTagGroup(steam_ugc, handle, pTagGroups);
}


AddExcludedTag :: inline (handle: UGCQueryHandle_t, pTagName: *char) -> bool {
    return SteamAPI_ISteamUGC_AddExcludedTag(steam_ugc, handle, pTagName);
}


SetReturnOnlyIDs :: inline (handle: UGCQueryHandle_t, bReturnOnlyIDs: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnOnlyIDs(steam_ugc, handle, bReturnOnlyIDs);
}


SetReturnKeyValueTags :: inline (handle: UGCQueryHandle_t, bReturnKeyValueTags: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnKeyValueTags(steam_ugc, handle, bReturnKeyValueTags);
}


SetReturnLongDescription :: inline (handle: UGCQueryHandle_t, bReturnLongDescription: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnLongDescription(steam_ugc, handle, bReturnLongDescription);
}


SetReturnMetadata :: inline (handle: UGCQueryHandle_t, bReturnMetadata: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnMetadata(steam_ugc, handle, bReturnMetadata);
}


SetReturnChildren :: inline (handle: UGCQueryHandle_t, bReturnChildren: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnChildren(steam_ugc, handle, bReturnChildren);
}


SetReturnAdditionalPreviews :: inline (handle: UGCQueryHandle_t, bReturnAdditionalPreviews: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnAdditionalPreviews(steam_ugc, handle, bReturnAdditionalPreviews);
}


SetReturnTotalOnly :: inline (handle: UGCQueryHandle_t, bReturnTotalOnly: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnTotalOnly(steam_ugc, handle, bReturnTotalOnly);
}


SetReturnPlaytimeStats :: inline (handle: UGCQueryHandle_t, unDays: uint32) -> bool {
    return SteamAPI_ISteamUGC_SetReturnPlaytimeStats(steam_ugc, handle, unDays);
}


SetLanguage :: inline (handle: UGCQueryHandle_t, pchLanguage: *char) -> bool {
    return SteamAPI_ISteamUGC_SetLanguage(steam_ugc, handle, pchLanguage);
}


SetAllowCachedResponse :: inline (handle: UGCQueryHandle_t, unMaxAgeSeconds: uint32) -> bool {
    return SteamAPI_ISteamUGC_SetAllowCachedResponse(steam_ugc, handle, unMaxAgeSeconds);
}


SetCloudFileNameFilter :: inline (handle: UGCQueryHandle_t, pMatchCloudFileName: *char) -> bool {
    return SteamAPI_ISteamUGC_SetCloudFileNameFilter(steam_ugc, handle, pMatchCloudFileName);
}


SetMatchAnyTag :: inline (handle: UGCQueryHandle_t, bMatchAnyTag: bool) -> bool {
    return SteamAPI_ISteamUGC_SetMatchAnyTag(steam_ugc, handle, bMatchAnyTag);
}


SetSearchText :: inline (handle: UGCQueryHandle_t, pSearchText: *char) -> bool {
    return SteamAPI_ISteamUGC_SetSearchText(steam_ugc, handle, pSearchText);
}


SetRankedByTrendDays :: inline (handle: UGCQueryHandle_t, unDays: uint32) -> bool {
    return SteamAPI_ISteamUGC_SetRankedByTrendDays(steam_ugc, handle, unDays);
}


AddRequiredKeyValueTag :: inline (handle: UGCQueryHandle_t, pKey: *char, pValue: *char) -> bool {
    return SteamAPI_ISteamUGC_AddRequiredKeyValueTag(steam_ugc, handle, pKey, pValue);
}


RequestUGCDetails :: inline (nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_RequestUGCDetails(steam_ugc, nPublishedFileID, unMaxAgeSeconds);
}

RequestUGCDetails :: inline (nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32, callback: (SteamUGCRequestUGCDetailsResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := RequestUGCDetails(nPublishedFileID, unMaxAgeSeconds);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

RequestUGCDetails :: (nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32, code: Code) -> SteamAPICall_t #expand {
    call_result_id := RequestUGCDetails(nPublishedFileID, unMaxAgeSeconds);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: SteamUGCRequestUGCDetailsResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


CreateItem :: inline (nConsumerAppId: AppId_t, eFileType: EWorkshopFileType) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_CreateItem(steam_ugc, nConsumerAppId, eFileType);
}

CreateItem :: inline (nConsumerAppId: AppId_t, eFileType: EWorkshopFileType, callback: (CreateItemResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := CreateItem(nConsumerAppId, eFileType);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

CreateItem :: (nConsumerAppId: AppId_t, eFileType: EWorkshopFileType, code: Code) -> SteamAPICall_t #expand {
    call_result_id := CreateItem(nConsumerAppId, eFileType);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: CreateItemResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


StartItemUpdate :: inline (nConsumerAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> UGCUpdateHandle_t {
    return SteamAPI_ISteamUGC_StartItemUpdate(steam_ugc, nConsumerAppId, nPublishedFileID);
}


SetItemTitle :: inline (handle: UGCUpdateHandle_t, pchTitle: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemTitle(steam_ugc, handle, pchTitle);
}


SetItemDescription :: inline (handle: UGCUpdateHandle_t, pchDescription: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemDescription(steam_ugc, handle, pchDescription);
}


SetItemUpdateLanguage :: inline (handle: UGCUpdateHandle_t, pchLanguage: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemUpdateLanguage(steam_ugc, handle, pchLanguage);
}


SetItemMetadata :: inline (handle: UGCUpdateHandle_t, pchMetaData: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemMetadata(steam_ugc, handle, pchMetaData);
}


SetItemVisibility :: inline (handle: UGCUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool {
    return SteamAPI_ISteamUGC_SetItemVisibility(steam_ugc, handle, eVisibility);
}


SetItemTags :: inline (updateHandle: UGCUpdateHandle_t, pTags: *SteamParamStringArray_t) -> bool {
    return SteamAPI_ISteamUGC_SetItemTags(steam_ugc, updateHandle, pTags);
}


SetItemContent :: inline (handle: UGCUpdateHandle_t, pszContentFolder: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemContent(steam_ugc, handle, pszContentFolder);
}


SetItemPreview :: inline (handle: UGCUpdateHandle_t, pszPreviewFile: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemPreview(steam_ugc, handle, pszPreviewFile);
}


SetAllowLegacyUpload :: inline (handle: UGCUpdateHandle_t, bAllowLegacyUpload: bool) -> bool {
    return SteamAPI_ISteamUGC_SetAllowLegacyUpload(steam_ugc, handle, bAllowLegacyUpload);
}


RemoveAllItemKeyValueTags :: inline (handle: UGCUpdateHandle_t) -> bool {
    return SteamAPI_ISteamUGC_RemoveAllItemKeyValueTags(steam_ugc, handle);
}


RemoveItemKeyValueTags :: inline (handle: UGCUpdateHandle_t, pchKey: *char) -> bool {
    return SteamAPI_ISteamUGC_RemoveItemKeyValueTags(steam_ugc, handle, pchKey);
}


AddItemKeyValueTag :: inline (handle: UGCUpdateHandle_t, pchKey: *char, pchValue: *char) -> bool {
    return SteamAPI_ISteamUGC_AddItemKeyValueTag(steam_ugc, handle, pchKey, pchValue);
}


AddItemPreviewFile :: inline (handle: UGCUpdateHandle_t, pszPreviewFile: *char, type: EItemPreviewType) -> bool {
    return SteamAPI_ISteamUGC_AddItemPreviewFile(steam_ugc, handle, pszPreviewFile, type);
}


AddItemPreviewVideo :: inline (handle: UGCUpdateHandle_t, pszVideoID: *char) -> bool {
    return SteamAPI_ISteamUGC_AddItemPreviewVideo(steam_ugc, handle, pszVideoID);
}


UpdateItemPreviewFile :: inline (handle: UGCUpdateHandle_t, index: uint32, pszPreviewFile: *char) -> bool {
    return SteamAPI_ISteamUGC_UpdateItemPreviewFile(steam_ugc, handle, index, pszPreviewFile);
}


UpdateItemPreviewVideo :: inline (handle: UGCUpdateHandle_t, index: uint32, pszVideoID: *char) -> bool {
    return SteamAPI_ISteamUGC_UpdateItemPreviewVideo(steam_ugc, handle, index, pszVideoID);
}


RemoveItemPreview :: inline (handle: UGCUpdateHandle_t, index: uint32) -> bool {
    return SteamAPI_ISteamUGC_RemoveItemPreview(steam_ugc, handle, index);
}


SubmitItemUpdate :: inline (handle: UGCUpdateHandle_t, pchChangeNote: *char) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_SubmitItemUpdate(steam_ugc, handle, pchChangeNote);
}

SubmitItemUpdate :: inline (handle: UGCUpdateHandle_t, pchChangeNote: *char, callback: (SubmitItemUpdateResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := SubmitItemUpdate(handle, pchChangeNote);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

SubmitItemUpdate :: (handle: UGCUpdateHandle_t, pchChangeNote: *char, code: Code) -> SteamAPICall_t #expand {
    call_result_id := SubmitItemUpdate(handle, pchChangeNote);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: SubmitItemUpdateResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


GetItemUpdateProgress :: inline (handle: UGCUpdateHandle_t, punBytesProcessed: *uint64, punBytesTotal: *uint64) -> EItemUpdateStatus {
    return SteamAPI_ISteamUGC_GetItemUpdateProgress(steam_ugc, handle, punBytesProcessed, punBytesTotal);
}


SetUserItemVote :: inline (nPublishedFileID: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_SetUserItemVote(steam_ugc, nPublishedFileID, bVoteUp);
}

SetUserItemVote :: inline (nPublishedFileID: PublishedFileId_t, bVoteUp: bool, callback: (SetUserItemVoteResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := SetUserItemVote(nPublishedFileID, bVoteUp);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

SetUserItemVote :: (nPublishedFileID: PublishedFileId_t, bVoteUp: bool, code: Code) -> SteamAPICall_t #expand {
    call_result_id := SetUserItemVote(nPublishedFileID, bVoteUp);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: SetUserItemVoteResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


GetUserItemVote :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_GetUserItemVote(steam_ugc, nPublishedFileID);
}

GetUserItemVote :: inline (nPublishedFileID: PublishedFileId_t, callback: (GetUserItemVoteResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := GetUserItemVote(nPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

GetUserItemVote :: (nPublishedFileID: PublishedFileId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := GetUserItemVote(nPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: GetUserItemVoteResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


AddItemToFavorites :: inline (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_AddItemToFavorites(steam_ugc, nAppId, nPublishedFileID);
}

AddItemToFavorites :: inline (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t, callback: (UserFavoriteItemsListChanged_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := AddItemToFavorites(nAppId, nPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

AddItemToFavorites :: (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := AddItemToFavorites(nAppId, nPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: UserFavoriteItemsListChanged_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


RemoveItemFromFavorites :: inline (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_RemoveItemFromFavorites(steam_ugc, nAppId, nPublishedFileID);
}

RemoveItemFromFavorites :: inline (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t, callback: (UserFavoriteItemsListChanged_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := RemoveItemFromFavorites(nAppId, nPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

RemoveItemFromFavorites :: (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := RemoveItemFromFavorites(nAppId, nPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: UserFavoriteItemsListChanged_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


SubscribeItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_SubscribeItem(steam_ugc, nPublishedFileID);
}

SubscribeItem :: inline (nPublishedFileID: PublishedFileId_t, callback: (RemoteStorageSubscribePublishedFileResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := SubscribeItem(nPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

SubscribeItem :: (nPublishedFileID: PublishedFileId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := SubscribeItem(nPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageSubscribePublishedFileResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


UnsubscribeItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_UnsubscribeItem(steam_ugc, nPublishedFileID);
}

UnsubscribeItem :: inline (nPublishedFileID: PublishedFileId_t, callback: (RemoteStorageUnsubscribePublishedFileResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := UnsubscribeItem(nPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

UnsubscribeItem :: (nPublishedFileID: PublishedFileId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := UnsubscribeItem(nPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageUnsubscribePublishedFileResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


GetNumSubscribedItems :: inline () -> uint32 {
    return SteamAPI_ISteamUGC_GetNumSubscribedItems(steam_ugc);
}


GetSubscribedItems :: inline (pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> uint32 {
    return SteamAPI_ISteamUGC_GetSubscribedItems(steam_ugc, pvecPublishedFileID, cMaxEntries);
}


GetItemState :: inline (nPublishedFileID: PublishedFileId_t) -> uint32 {
    return SteamAPI_ISteamUGC_GetItemState(steam_ugc, nPublishedFileID);
}


GetItemInstallInfo :: inline (nPublishedFileID: PublishedFileId_t, punSizeOnDisk: *uint64, pchFolder: *char, cchFolderSize: uint32, punTimeStamp: *uint32) -> bool {
    return SteamAPI_ISteamUGC_GetItemInstallInfo(steam_ugc, nPublishedFileID, punSizeOnDisk, pchFolder, cchFolderSize, punTimeStamp);
}


GetItemDownloadInfo :: inline (nPublishedFileID: PublishedFileId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool {
    return SteamAPI_ISteamUGC_GetItemDownloadInfo(steam_ugc, nPublishedFileID, punBytesDownloaded, punBytesTotal);
}


DownloadItem :: inline (nPublishedFileID: PublishedFileId_t, bHighPriority: bool) -> bool {
    return SteamAPI_ISteamUGC_DownloadItem(steam_ugc, nPublishedFileID, bHighPriority);
}


BInitWorkshopForGameServer :: inline (unWorkshopDepotID: DepotId_t, pszFolder: *char) -> bool {
    return SteamAPI_ISteamUGC_BInitWorkshopForGameServer(steam_ugc, unWorkshopDepotID, pszFolder);
}


SuspendDownloads :: inline (bSuspend: bool) {
    SteamAPI_ISteamUGC_SuspendDownloads(steam_ugc, bSuspend);
}


StartPlaytimeTracking :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_StartPlaytimeTracking(steam_ugc, pvecPublishedFileID, unNumPublishedFileIDs);
}

StartPlaytimeTracking :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32, callback: (StartPlaytimeTrackingResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := StartPlaytimeTracking(pvecPublishedFileID, unNumPublishedFileIDs);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

StartPlaytimeTracking :: (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32, code: Code) -> SteamAPICall_t #expand {
    call_result_id := StartPlaytimeTracking(pvecPublishedFileID, unNumPublishedFileIDs);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: StartPlaytimeTrackingResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


StopPlaytimeTracking :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_StopPlaytimeTracking(steam_ugc, pvecPublishedFileID, unNumPublishedFileIDs);
}

StopPlaytimeTracking :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32, callback: (StopPlaytimeTrackingResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := StopPlaytimeTracking(pvecPublishedFileID, unNumPublishedFileIDs);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

StopPlaytimeTracking :: (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32, code: Code) -> SteamAPICall_t #expand {
    call_result_id := StopPlaytimeTracking(pvecPublishedFileID, unNumPublishedFileIDs);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: StopPlaytimeTrackingResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


StopPlaytimeTrackingForAllItems :: inline () -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_StopPlaytimeTrackingForAllItems(steam_ugc);
}

StopPlaytimeTrackingForAllItems :: inline (callback: (StopPlaytimeTrackingResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := StopPlaytimeTrackingForAllItems();
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

StopPlaytimeTrackingForAllItems :: (code: Code) -> SteamAPICall_t #expand {
    call_result_id := StopPlaytimeTrackingForAllItems();
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: StopPlaytimeTrackingResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


AddDependency :: inline (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_AddDependency(steam_ugc, nParentPublishedFileID, nChildPublishedFileID);
}

AddDependency :: inline (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t, callback: (AddUGCDependencyResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := AddDependency(nParentPublishedFileID, nChildPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

AddDependency :: (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := AddDependency(nParentPublishedFileID, nChildPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: AddUGCDependencyResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


RemoveDependency :: inline (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_RemoveDependency(steam_ugc, nParentPublishedFileID, nChildPublishedFileID);
}

RemoveDependency :: inline (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t, callback: (RemoveUGCDependencyResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := RemoveDependency(nParentPublishedFileID, nChildPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

RemoveDependency :: (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := RemoveDependency(nParentPublishedFileID, nChildPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoveUGCDependencyResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


AddAppDependency :: inline (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_AddAppDependency(steam_ugc, nPublishedFileID, nAppID);
}

AddAppDependency :: inline (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t, callback: (AddAppDependencyResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := AddAppDependency(nPublishedFileID, nAppID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

AddAppDependency :: (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := AddAppDependency(nPublishedFileID, nAppID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: AddAppDependencyResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


RemoveAppDependency :: inline (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_RemoveAppDependency(steam_ugc, nPublishedFileID, nAppID);
}

RemoveAppDependency :: inline (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t, callback: (RemoveAppDependencyResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := RemoveAppDependency(nPublishedFileID, nAppID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

RemoveAppDependency :: (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := RemoveAppDependency(nPublishedFileID, nAppID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoveAppDependencyResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


GetAppDependencies :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_GetAppDependencies(steam_ugc, nPublishedFileID);
}

GetAppDependencies :: inline (nPublishedFileID: PublishedFileId_t, callback: (GetAppDependenciesResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := GetAppDependencies(nPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

GetAppDependencies :: (nPublishedFileID: PublishedFileId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := GetAppDependencies(nPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: GetAppDependenciesResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


DeleteItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamUGC_DeleteItem(steam_ugc, nPublishedFileID);
}

DeleteItem :: inline (nPublishedFileID: PublishedFileId_t, callback: (DeleteItemResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := DeleteItem(nPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

DeleteItem :: (nPublishedFileID: PublishedFileId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := DeleteItem(nPublishedFileID);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: DeleteItemResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}
