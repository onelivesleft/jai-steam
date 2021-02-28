steam_game_server_ugc : *ISteamUGC;
SteamGameServerUGC : SteamGameServerUGC_Namespace;


#scope_file


SteamGameServerUGC_Namespace :: struct {
    // procs
    CreateQueryUserUGCRequest                          :: SteamUGC_CreateQueryUserUGCRequest;
    CreateQueryAllUGCRequestPage                       :: SteamUGC_CreateQueryAllUGCRequestPage;
    CreateQueryAllUGCRequestCursor                     :: SteamUGC_CreateQueryAllUGCRequestCursor;
    CreateQueryUGCDetailsRequest                       :: SteamUGC_CreateQueryUGCDetailsRequest;
    SendQueryUGCRequest                                :: SteamUGC_SendQueryUGCRequest;
    GetQueryUGCResult                                  :: SteamUGC_GetQueryUGCResult;
    GetQueryUGCPreviewURL                              :: SteamUGC_GetQueryUGCPreviewURL;
    GetQueryUGCMetadata                                :: SteamUGC_GetQueryUGCMetadata;
    GetQueryUGCChildren                                :: SteamUGC_GetQueryUGCChildren;
    GetQueryUGCStatistic                               :: SteamUGC_GetQueryUGCStatistic;
    GetQueryUGCNumAdditionalPreviews                   :: SteamUGC_GetQueryUGCNumAdditionalPreviews;
    GetQueryUGCAdditionalPreview                       :: SteamUGC_GetQueryUGCAdditionalPreview;
    GetQueryUGCNumKeyValueTags                         :: SteamUGC_GetQueryUGCNumKeyValueTags;
    GetQueryUGCKeyValueTag                             :: SteamUGC_GetQueryUGCKeyValueTag;
    GetQueryFirstUGCKeyValueTag                        :: SteamUGC_GetQueryFirstUGCKeyValueTag;
    ReleaseQueryUGCRequest                             :: SteamUGC_ReleaseQueryUGCRequest;
    AddRequiredTag                                     :: SteamUGC_AddRequiredTag;
    AddRequiredTagGroup                                :: SteamUGC_AddRequiredTagGroup;
    AddExcludedTag                                     :: SteamUGC_AddExcludedTag;
    SetReturnOnlyIDs                                   :: SteamUGC_SetReturnOnlyIDs;
    SetReturnKeyValueTags                              :: SteamUGC_SetReturnKeyValueTags;
    SetReturnLongDescription                           :: SteamUGC_SetReturnLongDescription;
    SetReturnMetadata                                  :: SteamUGC_SetReturnMetadata;
    SetReturnChildren                                  :: SteamUGC_SetReturnChildren;
    SetReturnAdditionalPreviews                        :: SteamUGC_SetReturnAdditionalPreviews;
    SetReturnTotalOnly                                 :: SteamUGC_SetReturnTotalOnly;
    SetReturnPlaytimeStats                             :: SteamUGC_SetReturnPlaytimeStats;
    SetLanguage                                        :: SteamUGC_SetLanguage;
    SetAllowCachedResponse                             :: SteamUGC_SetAllowCachedResponse;
    SetCloudFileNameFilter                             :: SteamUGC_SetCloudFileNameFilter;
    SetMatchAnyTag                                     :: SteamUGC_SetMatchAnyTag;
    SetSearchText                                      :: SteamUGC_SetSearchText;
    SetRankedByTrendDays                               :: SteamUGC_SetRankedByTrendDays;
    AddRequiredKeyValueTag                             :: SteamUGC_AddRequiredKeyValueTag;
    RequestUGCDetails                                  :: SteamUGC_RequestUGCDetails;
    CreateItem                                         :: SteamUGC_CreateItem;
    StartItemUpdate                                    :: SteamUGC_StartItemUpdate;
    SetItemTitle                                       :: SteamUGC_SetItemTitle;
    SetItemDescription                                 :: SteamUGC_SetItemDescription;
    SetItemUpdateLanguage                              :: SteamUGC_SetItemUpdateLanguage;
    SetItemMetadata                                    :: SteamUGC_SetItemMetadata;
    SetItemVisibility                                  :: SteamUGC_SetItemVisibility;
    SetItemTags                                        :: SteamUGC_SetItemTags;
    SetItemContent                                     :: SteamUGC_SetItemContent;
    SetItemPreview                                     :: SteamUGC_SetItemPreview;
    SetAllowLegacyUpload                               :: SteamUGC_SetAllowLegacyUpload;
    RemoveAllItemKeyValueTags                          :: SteamUGC_RemoveAllItemKeyValueTags;
    RemoveItemKeyValueTags                             :: SteamUGC_RemoveItemKeyValueTags;
    AddItemKeyValueTag                                 :: SteamUGC_AddItemKeyValueTag;
    AddItemPreviewFile                                 :: SteamUGC_AddItemPreviewFile;
    AddItemPreviewVideo                                :: SteamUGC_AddItemPreviewVideo;
    UpdateItemPreviewFile                              :: SteamUGC_UpdateItemPreviewFile;
    UpdateItemPreviewVideo                             :: SteamUGC_UpdateItemPreviewVideo;
    RemoveItemPreview                                  :: SteamUGC_RemoveItemPreview;
    SubmitItemUpdate                                   :: SteamUGC_SubmitItemUpdate;
    GetItemUpdateProgress                              :: SteamUGC_GetItemUpdateProgress;
    SetUserItemVote                                    :: SteamUGC_SetUserItemVote;
    GetUserItemVote                                    :: SteamUGC_GetUserItemVote;
    AddItemToFavorites                                 :: SteamUGC_AddItemToFavorites;
    RemoveItemFromFavorites                            :: SteamUGC_RemoveItemFromFavorites;
    SubscribeItem                                      :: SteamUGC_SubscribeItem;
    UnsubscribeItem                                    :: SteamUGC_UnsubscribeItem;
    GetNumSubscribedItems                              :: SteamUGC_GetNumSubscribedItems;
    GetSubscribedItems                                 :: SteamUGC_GetSubscribedItems;
    GetItemState                                       :: SteamUGC_GetItemState;
    GetItemInstallInfo                                 :: SteamUGC_GetItemInstallInfo;
    GetItemDownloadInfo                                :: SteamUGC_GetItemDownloadInfo;
    DownloadItem                                       :: SteamUGC_DownloadItem;
    BInitWorkshopForGameServer                         :: SteamUGC_BInitWorkshopForGameServer;
    SuspendDownloads                                   :: SteamUGC_SuspendDownloads;
    StartPlaytimeTracking                              :: SteamUGC_StartPlaytimeTracking;
    StopPlaytimeTracking                               :: SteamUGC_StopPlaytimeTracking;
    StopPlaytimeTrackingForAllItems                    :: SteamUGC_StopPlaytimeTrackingForAllItems;
    AddDependency                                      :: SteamUGC_AddDependency;
    RemoveDependency                                   :: SteamUGC_RemoveDependency;
    AddAppDependency                                   :: SteamUGC_AddAppDependency;
    RemoveAppDependency                                :: SteamUGC_RemoveAppDependency;
    GetAppDependencies                                 :: SteamUGC_GetAppDependencies;
    DeleteItem                                         :: SteamUGC_DeleteItem;
}


SteamUGC_CreateQueryUserUGCRequest :: inline (unAccountID: AccountID_t, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryUserUGCRequest(steam_game_server_ugc, unAccountID, eListType, eMatchingUGCType, eSortOrder, nCreatorAppID, nConsumerAppID, unPage);
}


SteamUGC_CreateQueryAllUGCRequestPage :: inline (eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryAllUGCRequestPage(steam_game_server_ugc, eQueryType, eMatchingeMatchingUGCTypeFileType, nCreatorAppID, nConsumerAppID, unPage);
}


SteamUGC_CreateQueryAllUGCRequestCursor :: inline (eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, pchCursor: *char) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryAllUGCRequestCursor(steam_game_server_ugc, eQueryType, eMatchingeMatchingUGCTypeFileType, nCreatorAppID, nConsumerAppID, pchCursor);
}


SteamUGC_CreateQueryUGCDetailsRequest :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest(steam_game_server_ugc, pvecPublishedFileID, unNumPublishedFileIDs);
}


SteamUGC_SendQueryUGCRequest :: inline (handle: UGCQueryHandle_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_SendQueryUGCRequest(steam_game_server_ugc, handle);
}


SteamUGC_GetQueryUGCResult :: inline (handle: UGCQueryHandle_t, index: uint32, pDetails: *SteamUGCDetails_t) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCResult(steam_game_server_ugc, handle, index, pDetails);
}


SteamUGC_GetQueryUGCPreviewURL :: inline (handle: UGCQueryHandle_t, index: uint32, pchURL: *char, cchURLSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCPreviewURL(steam_game_server_ugc, handle, index, pchURL, cchURLSize);
}


SteamUGC_GetQueryUGCMetadata :: inline (handle: UGCQueryHandle_t, index: uint32, pchMetadata: *char, cchMetadatasize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCMetadata(steam_game_server_ugc, handle, index, pchMetadata, cchMetadatasize);
}


SteamUGC_GetQueryUGCChildren :: inline (handle: UGCQueryHandle_t, index: uint32, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCChildren(steam_game_server_ugc, handle, index, pvecPublishedFileID, cMaxEntries);
}


SteamUGC_GetQueryUGCStatistic :: inline (handle: UGCQueryHandle_t, index: uint32, eStatType: EItemStatistic, pStatValue: *uint64) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCStatistic(steam_game_server_ugc, handle, index, eStatType, pStatValue);
}


SteamUGC_GetQueryUGCNumAdditionalPreviews :: inline (handle: UGCQueryHandle_t, index: uint32) -> uint32 {
    return SteamAPI_ISteamUGC_GetQueryUGCNumAdditionalPreviews(steam_game_server_ugc, handle, index);
}


SteamUGC_GetQueryUGCAdditionalPreview :: inline (handle: UGCQueryHandle_t, index: uint32, previewIndex: uint32, pchURLOrVideoID: *char, cchURLSize: uint32, pchOriginalFileName: *char, cchOriginalFileNameSize: uint32, pPreviewType: *EItemPreviewType) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview(steam_game_server_ugc, handle, index, previewIndex, pchURLOrVideoID, cchURLSize, pchOriginalFileName, cchOriginalFileNameSize, pPreviewType);
}


SteamUGC_GetQueryUGCNumKeyValueTags :: inline (handle: UGCQueryHandle_t, index: uint32) -> uint32 {
    return SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags(steam_game_server_ugc, handle, index);
}


SteamUGC_GetQueryUGCKeyValueTag :: inline (handle: UGCQueryHandle_t, index: uint32, keyValueTagIndex: uint32, pchKey: *char, cchKeySize: uint32, pchValue: *char, cchValueSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag(steam_game_server_ugc, handle, index, keyValueTagIndex, pchKey, cchKeySize, pchValue, cchValueSize);
}


SteamUGC_GetQueryFirstUGCKeyValueTag :: inline (handle: UGCQueryHandle_t, index: uint32, pchKey: *char, pchValue: *char, cchValueSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryFirstUGCKeyValueTag(steam_game_server_ugc, handle, index, pchKey, pchValue, cchValueSize);
}


SteamUGC_ReleaseQueryUGCRequest :: inline (handle: UGCQueryHandle_t) -> bool {
    return SteamAPI_ISteamUGC_ReleaseQueryUGCRequest(steam_game_server_ugc, handle);
}


SteamUGC_AddRequiredTag :: inline (handle: UGCQueryHandle_t, pTagName: *char) -> bool {
    return SteamAPI_ISteamUGC_AddRequiredTag(steam_game_server_ugc, handle, pTagName);
}


SteamUGC_AddRequiredTagGroup :: inline (handle: UGCQueryHandle_t, pTagGroups: *SteamParamStringArray_t) -> bool {
    return SteamAPI_ISteamUGC_AddRequiredTagGroup(steam_game_server_ugc, handle, pTagGroups);
}


SteamUGC_AddExcludedTag :: inline (handle: UGCQueryHandle_t, pTagName: *char) -> bool {
    return SteamAPI_ISteamUGC_AddExcludedTag(steam_game_server_ugc, handle, pTagName);
}


SteamUGC_SetReturnOnlyIDs :: inline (handle: UGCQueryHandle_t, bReturnOnlyIDs: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnOnlyIDs(steam_game_server_ugc, handle, bReturnOnlyIDs);
}


SteamUGC_SetReturnKeyValueTags :: inline (handle: UGCQueryHandle_t, bReturnKeyValueTags: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnKeyValueTags(steam_game_server_ugc, handle, bReturnKeyValueTags);
}


SteamUGC_SetReturnLongDescription :: inline (handle: UGCQueryHandle_t, bReturnLongDescription: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnLongDescription(steam_game_server_ugc, handle, bReturnLongDescription);
}


SteamUGC_SetReturnMetadata :: inline (handle: UGCQueryHandle_t, bReturnMetadata: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnMetadata(steam_game_server_ugc, handle, bReturnMetadata);
}


SteamUGC_SetReturnChildren :: inline (handle: UGCQueryHandle_t, bReturnChildren: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnChildren(steam_game_server_ugc, handle, bReturnChildren);
}


SteamUGC_SetReturnAdditionalPreviews :: inline (handle: UGCQueryHandle_t, bReturnAdditionalPreviews: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnAdditionalPreviews(steam_game_server_ugc, handle, bReturnAdditionalPreviews);
}


SteamUGC_SetReturnTotalOnly :: inline (handle: UGCQueryHandle_t, bReturnTotalOnly: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnTotalOnly(steam_game_server_ugc, handle, bReturnTotalOnly);
}


SteamUGC_SetReturnPlaytimeStats :: inline (handle: UGCQueryHandle_t, unDays: uint32) -> bool {
    return SteamAPI_ISteamUGC_SetReturnPlaytimeStats(steam_game_server_ugc, handle, unDays);
}


SteamUGC_SetLanguage :: inline (handle: UGCQueryHandle_t, pchLanguage: *char) -> bool {
    return SteamAPI_ISteamUGC_SetLanguage(steam_game_server_ugc, handle, pchLanguage);
}


SteamUGC_SetAllowCachedResponse :: inline (handle: UGCQueryHandle_t, unMaxAgeSeconds: uint32) -> bool {
    return SteamAPI_ISteamUGC_SetAllowCachedResponse(steam_game_server_ugc, handle, unMaxAgeSeconds);
}


SteamUGC_SetCloudFileNameFilter :: inline (handle: UGCQueryHandle_t, pMatchCloudFileName: *char) -> bool {
    return SteamAPI_ISteamUGC_SetCloudFileNameFilter(steam_game_server_ugc, handle, pMatchCloudFileName);
}


SteamUGC_SetMatchAnyTag :: inline (handle: UGCQueryHandle_t, bMatchAnyTag: bool) -> bool {
    return SteamAPI_ISteamUGC_SetMatchAnyTag(steam_game_server_ugc, handle, bMatchAnyTag);
}


SteamUGC_SetSearchText :: inline (handle: UGCQueryHandle_t, pSearchText: *char) -> bool {
    return SteamAPI_ISteamUGC_SetSearchText(steam_game_server_ugc, handle, pSearchText);
}


SteamUGC_SetRankedByTrendDays :: inline (handle: UGCQueryHandle_t, unDays: uint32) -> bool {
    return SteamAPI_ISteamUGC_SetRankedByTrendDays(steam_game_server_ugc, handle, unDays);
}


SteamUGC_AddRequiredKeyValueTag :: inline (handle: UGCQueryHandle_t, pKey: *char, pValue: *char) -> bool {
    return SteamAPI_ISteamUGC_AddRequiredKeyValueTag(steam_game_server_ugc, handle, pKey, pValue);
}


SteamUGC_RequestUGCDetails :: inline (nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_RequestUGCDetails(steam_game_server_ugc, nPublishedFileID, unMaxAgeSeconds);
}


SteamUGC_CreateItem :: inline (nConsumerAppId: AppId_t, eFileType: EWorkshopFileType) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_CreateItem(steam_game_server_ugc, nConsumerAppId, eFileType);
}


SteamUGC_StartItemUpdate :: inline (nConsumerAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> UGCUpdateHandle_t {
    return SteamAPI_ISteamUGC_StartItemUpdate(steam_game_server_ugc, nConsumerAppId, nPublishedFileID);
}


SteamUGC_SetItemTitle :: inline (handle: UGCUpdateHandle_t, pchTitle: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemTitle(steam_game_server_ugc, handle, pchTitle);
}


SteamUGC_SetItemDescription :: inline (handle: UGCUpdateHandle_t, pchDescription: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemDescription(steam_game_server_ugc, handle, pchDescription);
}


SteamUGC_SetItemUpdateLanguage :: inline (handle: UGCUpdateHandle_t, pchLanguage: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemUpdateLanguage(steam_game_server_ugc, handle, pchLanguage);
}


SteamUGC_SetItemMetadata :: inline (handle: UGCUpdateHandle_t, pchMetaData: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemMetadata(steam_game_server_ugc, handle, pchMetaData);
}


SteamUGC_SetItemVisibility :: inline (handle: UGCUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool {
    return SteamAPI_ISteamUGC_SetItemVisibility(steam_game_server_ugc, handle, eVisibility);
}


SteamUGC_SetItemTags :: inline (updateHandle: UGCUpdateHandle_t, pTags: *SteamParamStringArray_t) -> bool {
    return SteamAPI_ISteamUGC_SetItemTags(steam_game_server_ugc, updateHandle, pTags);
}


SteamUGC_SetItemContent :: inline (handle: UGCUpdateHandle_t, pszContentFolder: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemContent(steam_game_server_ugc, handle, pszContentFolder);
}


SteamUGC_SetItemPreview :: inline (handle: UGCUpdateHandle_t, pszPreviewFile: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemPreview(steam_game_server_ugc, handle, pszPreviewFile);
}


SteamUGC_SetAllowLegacyUpload :: inline (handle: UGCUpdateHandle_t, bAllowLegacyUpload: bool) -> bool {
    return SteamAPI_ISteamUGC_SetAllowLegacyUpload(steam_game_server_ugc, handle, bAllowLegacyUpload);
}


SteamUGC_RemoveAllItemKeyValueTags :: inline (handle: UGCUpdateHandle_t) -> bool {
    return SteamAPI_ISteamUGC_RemoveAllItemKeyValueTags(steam_game_server_ugc, handle);
}


SteamUGC_RemoveItemKeyValueTags :: inline (handle: UGCUpdateHandle_t, pchKey: *char) -> bool {
    return SteamAPI_ISteamUGC_RemoveItemKeyValueTags(steam_game_server_ugc, handle, pchKey);
}


SteamUGC_AddItemKeyValueTag :: inline (handle: UGCUpdateHandle_t, pchKey: *char, pchValue: *char) -> bool {
    return SteamAPI_ISteamUGC_AddItemKeyValueTag(steam_game_server_ugc, handle, pchKey, pchValue);
}


SteamUGC_AddItemPreviewFile :: inline (handle: UGCUpdateHandle_t, pszPreviewFile: *char, type: EItemPreviewType) -> bool {
    return SteamAPI_ISteamUGC_AddItemPreviewFile(steam_game_server_ugc, handle, pszPreviewFile, type);
}


SteamUGC_AddItemPreviewVideo :: inline (handle: UGCUpdateHandle_t, pszVideoID: *char) -> bool {
    return SteamAPI_ISteamUGC_AddItemPreviewVideo(steam_game_server_ugc, handle, pszVideoID);
}


SteamUGC_UpdateItemPreviewFile :: inline (handle: UGCUpdateHandle_t, index: uint32, pszPreviewFile: *char) -> bool {
    return SteamAPI_ISteamUGC_UpdateItemPreviewFile(steam_game_server_ugc, handle, index, pszPreviewFile);
}


SteamUGC_UpdateItemPreviewVideo :: inline (handle: UGCUpdateHandle_t, index: uint32, pszVideoID: *char) -> bool {
    return SteamAPI_ISteamUGC_UpdateItemPreviewVideo(steam_game_server_ugc, handle, index, pszVideoID);
}


SteamUGC_RemoveItemPreview :: inline (handle: UGCUpdateHandle_t, index: uint32) -> bool {
    return SteamAPI_ISteamUGC_RemoveItemPreview(steam_game_server_ugc, handle, index);
}


SteamUGC_SubmitItemUpdate :: inline (handle: UGCUpdateHandle_t, pchChangeNote: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_SubmitItemUpdate(steam_game_server_ugc, handle, pchChangeNote);
}


SteamUGC_GetItemUpdateProgress :: inline (handle: UGCUpdateHandle_t, punBytesProcessed: *uint64, punBytesTotal: *uint64) -> EItemUpdateStatus {
    return SteamAPI_ISteamUGC_GetItemUpdateProgress(steam_game_server_ugc, handle, punBytesProcessed, punBytesTotal);
}


SteamUGC_SetUserItemVote :: inline (nPublishedFileID: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_SetUserItemVote(steam_game_server_ugc, nPublishedFileID, bVoteUp);
}


SteamUGC_GetUserItemVote :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_GetUserItemVote(steam_game_server_ugc, nPublishedFileID);
}


SteamUGC_AddItemToFavorites :: inline (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_AddItemToFavorites(steam_game_server_ugc, nAppId, nPublishedFileID);
}


SteamUGC_RemoveItemFromFavorites :: inline (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_RemoveItemFromFavorites(steam_game_server_ugc, nAppId, nPublishedFileID);
}


SteamUGC_SubscribeItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_SubscribeItem(steam_game_server_ugc, nPublishedFileID);
}


SteamUGC_UnsubscribeItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_UnsubscribeItem(steam_game_server_ugc, nPublishedFileID);
}


SteamUGC_GetNumSubscribedItems :: inline () -> uint32 {
    return SteamAPI_ISteamUGC_GetNumSubscribedItems(steam_game_server_ugc);
}


SteamUGC_GetSubscribedItems :: inline (pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> uint32 {
    return SteamAPI_ISteamUGC_GetSubscribedItems(steam_game_server_ugc, pvecPublishedFileID, cMaxEntries);
}


SteamUGC_GetItemState :: inline (nPublishedFileID: PublishedFileId_t) -> uint32 {
    return SteamAPI_ISteamUGC_GetItemState(steam_game_server_ugc, nPublishedFileID);
}


SteamUGC_GetItemInstallInfo :: inline (nPublishedFileID: PublishedFileId_t, punSizeOnDisk: *uint64, pchFolder: *char, cchFolderSize: uint32, punTimeStamp: *uint32) -> bool {
    return SteamAPI_ISteamUGC_GetItemInstallInfo(steam_game_server_ugc, nPublishedFileID, punSizeOnDisk, pchFolder, cchFolderSize, punTimeStamp);
}


SteamUGC_GetItemDownloadInfo :: inline (nPublishedFileID: PublishedFileId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool {
    return SteamAPI_ISteamUGC_GetItemDownloadInfo(steam_game_server_ugc, nPublishedFileID, punBytesDownloaded, punBytesTotal);
}


SteamUGC_DownloadItem :: inline (nPublishedFileID: PublishedFileId_t, bHighPriority: bool) -> bool {
    return SteamAPI_ISteamUGC_DownloadItem(steam_game_server_ugc, nPublishedFileID, bHighPriority);
}


SteamUGC_BInitWorkshopForGameServer :: inline (unWorkshopDepotID: DepotId_t, pszFolder: *char) -> bool {
    return SteamAPI_ISteamUGC_BInitWorkshopForGameServer(steam_game_server_ugc, unWorkshopDepotID, pszFolder);
}


SteamUGC_SuspendDownloads :: inline (bSuspend: bool) {
    SteamAPI_ISteamUGC_SuspendDownloads(steam_game_server_ugc, bSuspend);
}


SteamUGC_StartPlaytimeTracking :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_StartPlaytimeTracking(steam_game_server_ugc, pvecPublishedFileID, unNumPublishedFileIDs);
}


SteamUGC_StopPlaytimeTracking :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_StopPlaytimeTracking(steam_game_server_ugc, pvecPublishedFileID, unNumPublishedFileIDs);
}


SteamUGC_StopPlaytimeTrackingForAllItems :: inline () -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_StopPlaytimeTrackingForAllItems(steam_game_server_ugc);
}


SteamUGC_AddDependency :: inline (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_AddDependency(steam_game_server_ugc, nParentPublishedFileID, nChildPublishedFileID);
}


SteamUGC_RemoveDependency :: inline (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_RemoveDependency(steam_game_server_ugc, nParentPublishedFileID, nChildPublishedFileID);
}


SteamUGC_AddAppDependency :: inline (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_AddAppDependency(steam_game_server_ugc, nPublishedFileID, nAppID);
}


SteamUGC_RemoveAppDependency :: inline (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_RemoveAppDependency(steam_game_server_ugc, nPublishedFileID, nAppID);
}


SteamUGC_GetAppDependencies :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_GetAppDependencies(steam_game_server_ugc, nPublishedFileID);
}


SteamUGC_DeleteItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_DeleteItem(steam_game_server_ugc, nPublishedFileID);
}
