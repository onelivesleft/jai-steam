steam_ugc : *ISteamUGC;
SteamUGC : SteamUGC_Namespace;


#scope_file


SteamUGC_Namespace :: struct {
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


SteamUGC_CreateQueryUserUGCRequest :: inline (unAccountID: AccountID_t, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t #foreign steam "SteamAPI_ISteamUGC_CreateQuery {
    return SteamUGC_CreateQueryUserUGCRequest(steam_ugc, unAccountID, eListType, eMatchingUGCType, eSortOrder, nCreatorAppID, nConsumerAppID, unPage);
}


SteamUGC_CreateQueryAllUGCRequestPage :: inline (eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t #foreign steam "SteamAPI_ISteamUGC_CreateQueryAll {
    return SteamUGC_CreateQueryAllUGCRequestPage(steam_ugc, eQueryType, eMatchingeMatchingUGCTypeFileType, nCreatorAppID, nConsumerAppID, unPage);
}


SteamUGC_CreateQueryAllUGCRequestCursor :: inline (eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, pchCursor: *char) -> UGCQueryHandle_t #foreign steam "SteamAPI_ISteamUGC_CreateQueryAllUG {
    return SteamUGC_CreateQueryAllUGCRequestCursor(steam_ugc, eQueryType, eMatchingeMatchingUGCTypeFileType, nCreatorAppID, nConsumerAppID, pchCursor);
}


SteamUGC_CreateQueryUGCDetailsRequest :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> UGCQueryHandle_t #foreign steam "SteamAPI_ISteamUGC_CreateQueryUGC {
    return SteamUGC_CreateQueryUGCDetailsRequest(steam_ugc, pvecPublishedFileID, unNumPublishedFileIDs);
}


SteamUGC_SendQueryUGCRequest :: inline (handle: UGCQueryHandle_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_SendQ {
    return SteamUGC_SendQueryUGCRequest(steam_ugc, handle);
}


SteamUGC_GetQueryUGCResult :: inline (handle: UGCQueryHandle_t, index: uint32, pDetails: *SteamUGCDetails_t) -> bool #foreign steam "SteamAPI_ISteamUGC_Get {
    return SteamUGC_GetQueryUGCResult(steam_ugc, handle, index, pDetails);
}


SteamUGC_GetQueryUGCPreviewURL :: inline (handle: UGCQueryHandle_t, index: uint32, pchURL: *char, cchURLSize: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQuer {
    return SteamUGC_GetQueryUGCPreviewURL(steam_ugc, handle, index, pchURL, cchURLSize);
}


SteamUGC_GetQueryUGCMetadata :: inline (handle: UGCQueryHandle_t, index: uint32, pchMetadata: *char, cchMetadatasize: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQu {
    return SteamUGC_GetQueryUGCMetadata(steam_ugc, handle, index, pchMetadata, cchMetadatasize);
}


SteamUGC_GetQueryUGCChildren :: inline (handle: UGCQueryHandle_t, index: uint32, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQu {
    return SteamUGC_GetQueryUGCChildren(steam_ugc, handle, index, pvecPublishedFileID, cMaxEntries);
}


SteamUGC_GetQueryUGCStatistic :: inline (handle: UGCQueryHandle_t, index: uint32, eStatType: EItemStatistic, pStatValue: *uint64) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQue {
    return SteamUGC_GetQueryUGCStatistic(steam_ugc, handle, index, eStatType, pStatValue);
}


SteamUGC_GetQueryUGCNumAdditionalPreviews :: inline (handle: UGCQueryHandle_t, index: uint32) -> uint32 #foreign steam "SteamAPI_ISteamUGC_GetQueryUGCNumAddi {
    return SteamUGC_GetQueryUGCNumAdditionalPreviews(steam_ugc, handle, index);
}


SteamUGC_GetQueryUGCAdditionalPreview :: inline (handle: UGCQueryHandle_t, index: uint32, previewIndex: uint32, pchURLOrVideoID: *char, cchURLSize: uint32, pchOriginalFileName: *char, cchOriginalFileNameSize: uint32, pPreviewType: *EItemPreviewType) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQueryUGCAdd {
    return SteamUGC_GetQueryUGCAdditionalPreview(steam_ugc, handle, index, previewIndex, pchURLOrVideoID, cchURLSize, pchOriginalFileName, cchOriginalFileNameSize, pPreviewType);
}


SteamUGC_GetQueryUGCNumKeyValueTags :: inline (handle: UGCQueryHandle_t, index: uint32) -> uint32 #foreign steam "SteamAPI_ISteamUGC_GetQueryUGCN {
    return SteamUGC_GetQueryUGCNumKeyValueTags(steam_ugc, handle, index);
}


SteamUGC_GetQueryUGCKeyValueTag :: inline (handle: UGCQueryHandle_t, index: uint32, keyValueTagIndex: uint32, pchKey: *char, cchKeySize: uint32, pchValue: *char, cchValueSize: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQuery {
    return SteamUGC_GetQueryUGCKeyValueTag(steam_ugc, handle, index, keyValueTagIndex, pchKey, cchKeySize, pchValue, cchValueSize);
}


SteamUGC_GetQueryFirstUGCKeyValueTag :: inline (handle: UGCQueryHandle_t, index: uint32, pchKey: *char, pchValue: *char, cchValueSize: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_GetQueryFirst {
    return SteamUGC_GetQueryFirstUGCKeyValueTag(steam_ugc, handle, index, pchKey, pchValue, cchValueSize);
}


SteamUGC_ReleaseQueryUGCRequest :: inline (handle: UGCQueryHandle_t) -> bool #foreign steam "SteamAPI_ISteamUGC_ReleaseQ {
    return SteamUGC_ReleaseQueryUGCRequest(steam_ugc, handle);
}


SteamUGC_AddRequiredTag :: inline (handle: UGCQueryHandle_t, pTagName: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_ {
    return SteamUGC_AddRequiredTag(steam_ugc, handle, pTagName);
}


SteamUGC_AddRequiredTagGroup :: inline (handle: UGCQueryHandle_t, pTagGroups: *SteamParamStringArray_t) -> bool #foreign steam "SteamAPI_ISteamUGC_AddRe {
    return SteamUGC_AddRequiredTagGroup(steam_ugc, handle, pTagGroups);
}


SteamUGC_AddExcludedTag :: inline (handle: UGCQueryHandle_t, pTagName: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_ {
    return SteamUGC_AddExcludedTag(steam_ugc, handle, pTagName);
}


SteamUGC_SetReturnOnlyIDs :: inline (handle: UGCQueryHandle_t, bReturnOnlyIDs: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_Se {
    return SteamUGC_SetReturnOnlyIDs(steam_ugc, handle, bReturnOnlyIDs);
}


SteamUGC_SetReturnKeyValueTags :: inline (handle: UGCQueryHandle_t, bReturnKeyValueTags: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_SetRetu {
    return SteamUGC_SetReturnKeyValueTags(steam_ugc, handle, bReturnKeyValueTags);
}


SteamUGC_SetReturnLongDescription :: inline (handle: UGCQueryHandle_t, bReturnLongDescription: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_SetReturnL {
    return SteamUGC_SetReturnLongDescription(steam_ugc, handle, bReturnLongDescription);
}


SteamUGC_SetReturnMetadata :: inline (handle: UGCQueryHandle_t, bReturnMetadata: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_Set {
    return SteamUGC_SetReturnMetadata(steam_ugc, handle, bReturnMetadata);
}


SteamUGC_SetReturnChildren :: inline (handle: UGCQueryHandle_t, bReturnChildren: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_Set {
    return SteamUGC_SetReturnChildren(steam_ugc, handle, bReturnChildren);
}


SteamUGC_SetReturnAdditionalPreviews :: inline (handle: UGCQueryHandle_t, bReturnAdditionalPreviews: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_SetReturnAddi {
    return SteamUGC_SetReturnAdditionalPreviews(steam_ugc, handle, bReturnAdditionalPreviews);
}


SteamUGC_SetReturnTotalOnly :: inline (handle: UGCQueryHandle_t, bReturnTotalOnly: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_SetR {
    return SteamUGC_SetReturnTotalOnly(steam_ugc, handle, bReturnTotalOnly);
}


SteamUGC_SetReturnPlaytimeStats :: inline (handle: UGCQueryHandle_t, unDays: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_SetRetur {
    return SteamUGC_SetReturnPlaytimeStats(steam_ugc, handle, unDays);
}


SteamUGC_SetLanguage :: inline (handle: UGCQueryHandle_t, pchLanguage: *char) -> bool #foreign steam "SteamAPI_ISteamU {
    return SteamUGC_SetLanguage(steam_ugc, handle, pchLanguage);
}


SteamUGC_SetAllowCachedResponse :: inline (handle: UGCQueryHandle_t, unMaxAgeSeconds: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_SetAllow {
    return SteamUGC_SetAllowCachedResponse(steam_ugc, handle, unMaxAgeSeconds);
}


SteamUGC_SetCloudFileNameFilter :: inline (handle: UGCQueryHandle_t, pMatchCloudFileName: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_SetCloud {
    return SteamUGC_SetCloudFileNameFilter(steam_ugc, handle, pMatchCloudFileName);
}


SteamUGC_SetMatchAnyTag :: inline (handle: UGCQueryHandle_t, bMatchAnyTag: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_ {
    return SteamUGC_SetMatchAnyTag(steam_ugc, handle, bMatchAnyTag);
}


SteamUGC_SetSearchText :: inline (handle: UGCQueryHandle_t, pSearchText: *char) -> bool #foreign steam "SteamAPI_ISteamUGC {
    return SteamUGC_SetSearchText(steam_ugc, handle, pSearchText);
}


SteamUGC_SetRankedByTrendDays :: inline (handle: UGCQueryHandle_t, unDays: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_SetRan {
    return SteamUGC_SetRankedByTrendDays(steam_ugc, handle, unDays);
}


SteamUGC_AddRequiredKeyValueTag :: inline (handle: UGCQueryHandle_t, pKey: *char, pValue: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_AddRequi {
    return SteamUGC_AddRequiredKeyValueTag(steam_ugc, handle, pKey, pValue);
}


SteamUGC_RequestUGCDetails :: inline (nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_Req {
    return SteamUGC_RequestUGCDetails(steam_ugc, nPublishedFileID, unMaxAgeSeconds);
}


SteamUGC_CreateItem :: inline (nConsumerAppId: AppId_t, eFileType: EWorkshopFileType) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteam {
    return SteamUGC_CreateItem(steam_ugc, nConsumerAppId, eFileType);
}


SteamUGC_StartItemUpdate :: inline (nConsumerAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> UGCUpdateHandle_t #foreign steam "SteamAPI_ISteamUGC_S {
    return SteamUGC_StartItemUpdate(steam_ugc, nConsumerAppId, nPublishedFileID);
}


SteamUGC_SetItemTitle :: inline (handle: UGCUpdateHandle_t, pchTitle: *char) -> bool #foreign steam "SteamAPI_ISteamUG {
    return SteamUGC_SetItemTitle(steam_ugc, handle, pchTitle);
}


SteamUGC_SetItemDescription :: inline (handle: UGCUpdateHandle_t, pchDescription: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_SetI {
    return SteamUGC_SetItemDescription(steam_ugc, handle, pchDescription);
}


SteamUGC_SetItemUpdateLanguage :: inline (handle: UGCUpdateHandle_t, pchLanguage: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_SetItem {
    return SteamUGC_SetItemUpdateLanguage(steam_ugc, handle, pchLanguage);
}


SteamUGC_SetItemMetadata :: inline (handle: UGCUpdateHandle_t, pchMetaData: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_S {
    return SteamUGC_SetItemMetadata(steam_ugc, handle, pchMetaData);
}


SteamUGC_SetItemVisibility :: inline (handle: UGCUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool #foreign steam "SteamAPI_ISteamUGC_Set {
    return SteamUGC_SetItemVisibility(steam_ugc, handle, eVisibility);
}


SteamUGC_SetItemTags :: inline (updateHandle: UGCUpdateHandle_t, pTags: *SteamParamStringArray_t) -> bool #foreign steam "SteamAPI_ISteamU {
    return SteamUGC_SetItemTags(steam_ugc, updateHandle, pTags);
}


SteamUGC_SetItemContent :: inline (handle: UGCUpdateHandle_t, pszContentFolder: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_ {
    return SteamUGC_SetItemContent(steam_ugc, handle, pszContentFolder);
}


SteamUGC_SetItemPreview :: inline (handle: UGCUpdateHandle_t, pszPreviewFile: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_ {
    return SteamUGC_SetItemPreview(steam_ugc, handle, pszPreviewFile);
}


SteamUGC_SetAllowLegacyUpload :: inline (handle: UGCUpdateHandle_t, bAllowLegacyUpload: bool) -> bool #foreign steam "SteamAPI_ISteamUGC_SetAll {
    return SteamUGC_SetAllowLegacyUpload(steam_ugc, handle, bAllowLegacyUpload);
}


SteamUGC_RemoveAllItemKeyValueTags :: inline (handle: UGCUpdateHandle_t) -> bool #foreign steam "SteamAPI_ISteamUGC_RemoveAllIt {
    return SteamUGC_RemoveAllItemKeyValueTags(steam_ugc, handle);
}


SteamUGC_RemoveItemKeyValueTags :: inline (handle: UGCUpdateHandle_t, pchKey: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_RemoveIt {
    return SteamUGC_RemoveItemKeyValueTags(steam_ugc, handle, pchKey);
}


SteamUGC_AddItemKeyValueTag :: inline (handle: UGCUpdateHandle_t, pchKey: *char, pchValue: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_AddI {
    return SteamUGC_AddItemKeyValueTag(steam_ugc, handle, pchKey, pchValue);
}


SteamUGC_AddItemPreviewFile :: inline (handle: UGCUpdateHandle_t, pszPreviewFile: *char, type: EItemPreviewType) -> bool #foreign steam "SteamAPI_ISteamUGC_AddI {
    return SteamUGC_AddItemPreviewFile(steam_ugc, handle, pszPreviewFile, type);
}


SteamUGC_AddItemPreviewVideo :: inline (handle: UGCUpdateHandle_t, pszVideoID: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_AddIt {
    return SteamUGC_AddItemPreviewVideo(steam_ugc, handle, pszVideoID);
}


SteamUGC_UpdateItemPreviewFile :: inline (handle: UGCUpdateHandle_t, index: uint32, pszPreviewFile: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_UpdateI {
    return SteamUGC_UpdateItemPreviewFile(steam_ugc, handle, index, pszPreviewFile);
}


SteamUGC_UpdateItemPreviewVideo :: inline (handle: UGCUpdateHandle_t, index: uint32, pszVideoID: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_UpdateIt {
    return SteamUGC_UpdateItemPreviewVideo(steam_ugc, handle, index, pszVideoID);
}


SteamUGC_RemoveItemPreview :: inline (handle: UGCUpdateHandle_t, index: uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_Rem {
    return SteamUGC_RemoveItemPreview(steam_ugc, handle, index);
}


SteamUGC_SubmitItemUpdate :: inline (handle: UGCUpdateHandle_t, pchChangeNote: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_Su {
    return SteamUGC_SubmitItemUpdate(steam_ugc, handle, pchChangeNote);
}


SteamUGC_GetItemUpdateProgress :: inline (handle: UGCUpdateHandle_t, punBytesProcessed: *uint64, punBytesTotal: *uint64) -> EItemUpdateStatus #foreign steam "SteamAPI_ISteamUGC_GetItem {
    return SteamUGC_GetItemUpdateProgress(steam_ugc, handle, punBytesProcessed, punBytesTotal);
}


SteamUGC_SetUserItemVote :: inline (nPublishedFileID: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_S {
    return SteamUGC_SetUserItemVote(steam_ugc, nPublishedFileID, bVoteUp);
}


SteamUGC_GetUserItemVote :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_G {
    return SteamUGC_GetUserItemVote(steam_ugc, nPublishedFileID);
}


SteamUGC_AddItemToFavorites :: inline (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_AddI {
    return SteamUGC_AddItemToFavorites(steam_ugc, nAppId, nPublishedFileID);
}


SteamUGC_RemoveItemFromFavorites :: inline (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_RemoveIte {
    return SteamUGC_RemoveItemFromFavorites(steam_ugc, nAppId, nPublishedFileID);
}


SteamUGC_SubscribeItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC {
    return SteamUGC_SubscribeItem(steam_ugc, nPublishedFileID);
}


SteamUGC_UnsubscribeItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_U {
    return SteamUGC_UnsubscribeItem(steam_ugc, nPublishedFileID);
}


SteamUGC_GetNumSubscribedItems :: inline () -> uint32 #foreign steam "SteamAPI_ISteamUGC_GetNumS {
    return SteamUGC_GetNumSubscribedItems(steam_ugc);
}


SteamUGC_GetSubscribedItems :: inline (pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> uint32 #foreign steam "SteamAPI_ISteamUGC_GetS {
    return SteamUGC_GetSubscribedItems(steam_ugc, pvecPublishedFileID, cMaxEntries);
}


SteamUGC_GetItemState :: inline (nPublishedFileID: PublishedFileId_t) -> uint32 #foreign steam "SteamAPI_ISteamUG {
    return SteamUGC_GetItemState(steam_ugc, nPublishedFileID);
}


SteamUGC_GetItemInstallInfo :: inline (nPublishedFileID: PublishedFileId_t, punSizeOnDisk: *uint64, pchFolder: *char, cchFolderSize: uint32, punTimeStamp: *uint32) -> bool #foreign steam "SteamAPI_ISteamUGC_GetI {
    return SteamUGC_GetItemInstallInfo(steam_ugc, nPublishedFileID, punSizeOnDisk, pchFolder, cchFolderSize, punTimeStamp);
}


SteamUGC_GetItemDownloadInfo :: inline (nPublishedFileID: PublishedFileId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool #foreign steam "SteamAPI_ISteamUGC_GetIt {
    return SteamUGC_GetItemDownloadInfo(steam_ugc, nPublishedFileID, punBytesDownloaded, punBytesTotal);
}


SteamUGC_DownloadItem :: inline (nPublishedFileID: PublishedFileId_t, bHighPriority: bool) -> bool #foreign steam "SteamAPI_ISteamUG {
    return SteamUGC_DownloadItem(steam_ugc, nPublishedFileID, bHighPriority);
}


SteamUGC_BInitWorkshopForGameServer :: inline (unWorkshopDepotID: DepotId_t, pszFolder: *char) -> bool #foreign steam "SteamAPI_ISteamUGC_BInitWorksho {
    return SteamUGC_BInitWorkshopForGameServer(steam_ugc, unWorkshopDepotID, pszFolder);
}


SteamUGC_SuspendDownloads :: inline (bSuspend: bool) {
    SteamUGC_SuspendDownloads(steam_ugc, bSuspend);
}


SteamUGC_StartPlaytimeTracking :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_StartPl {
    return SteamUGC_StartPlaytimeTracking(steam_ugc, pvecPublishedFileID, unNumPublishedFileIDs);
}


SteamUGC_StopPlaytimeTracking :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_StopPl {
    return SteamUGC_StopPlaytimeTracking(steam_ugc, pvecPublishedFileID, unNumPublishedFileIDs);
}


SteamUGC_StopPlaytimeTrackingForAllItems :: inline () -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_StopPlaytimeTrack {
    return SteamUGC_StopPlaytimeTrackingForAllItems(steam_ugc);
}


SteamUGC_AddDependency :: inline (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC {
    return SteamUGC_AddDependency(steam_ugc, nParentPublishedFileID, nChildPublishedFileID);
}


SteamUGC_RemoveDependency :: inline (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_Re {
    return SteamUGC_RemoveDependency(steam_ugc, nParentPublishedFileID, nChildPublishedFileID);
}


SteamUGC_AddAppDependency :: inline (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_Ad {
    return SteamUGC_AddAppDependency(steam_ugc, nPublishedFileID, nAppID);
}


SteamUGC_RemoveAppDependency :: inline (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_Remov {
    return SteamUGC_RemoveAppDependency(steam_ugc, nPublishedFileID, nAppID);
}


SteamUGC_GetAppDependencies :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamUGC_GetA {
    return SteamUGC_GetAppDependencies(steam_ugc, nPublishedFileID);
}


SteamUGC_DeleteItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteam {
    return SteamUGC_DeleteItem(steam_ugc, nPublishedFileID);
}
