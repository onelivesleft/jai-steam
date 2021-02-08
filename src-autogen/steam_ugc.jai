steam_ugc : *ISteamUGC;

SteamUGC : SteamUGC_Namespace;


#scope_file


SteamUGC_Namespace :: struct {
    // procs
          :: SteamUGC_CreateQueryUserUGCRequest
       :: SteamUGC_CreateQueryAllUGCRequestPage
     :: SteamUGC_CreateQueryAllUGCRequestCursor
       :: SteamUGC_CreateQueryUGCDetailsRequest
                :: SteamUGC_SendQueryUGCRequest
                  :: SteamUGC_GetQueryUGCResult
              :: SteamUGC_GetQueryUGCPreviewURL
                :: SteamUGC_GetQueryUGCMetadata
                :: SteamUGC_GetQueryUGCChildren
               :: SteamUGC_GetQueryUGCStatistic
    :: SteamUGC_GetQueryUGCNumAdditionalPreviews
       :: SteamUGC_GetQueryUGCAdditionalPreview
         :: SteamUGC_GetQueryUGCNumKeyValueTags
             :: SteamUGC_GetQueryUGCKeyValueTag
        :: SteamUGC_GetQueryFirstUGCKeyValueTag
             :: SteamUGC_ReleaseQueryUGCRequest
                     :: SteamUGC_AddRequiredTag
                :: SteamUGC_AddRequiredTagGroup
                     :: SteamUGC_AddExcludedTag
                   :: SteamUGC_SetReturnOnlyIDs
              :: SteamUGC_SetReturnKeyValueTags
           :: SteamUGC_SetReturnLongDescription
                  :: SteamUGC_SetReturnMetadata
                  :: SteamUGC_SetReturnChildren
        :: SteamUGC_SetReturnAdditionalPreviews
                 :: SteamUGC_SetReturnTotalOnly
             :: SteamUGC_SetReturnPlaytimeStats
                        :: SteamUGC_SetLanguage
             :: SteamUGC_SetAllowCachedResponse
             :: SteamUGC_SetCloudFileNameFilter
                     :: SteamUGC_SetMatchAnyTag
                      :: SteamUGC_SetSearchText
               :: SteamUGC_SetRankedByTrendDays
             :: SteamUGC_AddRequiredKeyValueTag
                  :: SteamUGC_RequestUGCDetails
                         :: SteamUGC_CreateItem
                    :: SteamUGC_StartItemUpdate
                       :: SteamUGC_SetItemTitle
                 :: SteamUGC_SetItemDescription
              :: SteamUGC_SetItemUpdateLanguage
                    :: SteamUGC_SetItemMetadata
                  :: SteamUGC_SetItemVisibility
                        :: SteamUGC_SetItemTags
                     :: SteamUGC_SetItemContent
                     :: SteamUGC_SetItemPreview
               :: SteamUGC_SetAllowLegacyUpload
          :: SteamUGC_RemoveAllItemKeyValueTags
             :: SteamUGC_RemoveItemKeyValueTags
                 :: SteamUGC_AddItemKeyValueTag
                 :: SteamUGC_AddItemPreviewFile
                :: SteamUGC_AddItemPreviewVideo
              :: SteamUGC_UpdateItemPreviewFile
             :: SteamUGC_UpdateItemPreviewVideo
                  :: SteamUGC_RemoveItemPreview
                   :: SteamUGC_SubmitItemUpdate
              :: SteamUGC_GetItemUpdateProgress
                    :: SteamUGC_SetUserItemVote
                    :: SteamUGC_GetUserItemVote
                 :: SteamUGC_AddItemToFavorites
            :: SteamUGC_RemoveItemFromFavorites
                      :: SteamUGC_SubscribeItem
                    :: SteamUGC_UnsubscribeItem
              :: SteamUGC_GetNumSubscribedItems
                 :: SteamUGC_GetSubscribedItems
                       :: SteamUGC_GetItemState
                 :: SteamUGC_GetItemInstallInfo
                :: SteamUGC_GetItemDownloadInfo
                       :: SteamUGC_DownloadItem
         :: SteamUGC_BInitWorkshopForGameServer
                   :: SteamUGC_SuspendDownloads
              :: SteamUGC_StartPlaytimeTracking
               :: SteamUGC_StopPlaytimeTracking
    :: SteamUGC_StopPlaytimeTrackingForAllItems
                      :: SteamUGC_AddDependency
                   :: SteamUGC_RemoveDependency
                   :: SteamUGC_AddAppDependency
                :: SteamUGC_RemoveAppDependency
                 :: SteamUGC_GetAppDependencies
                         :: SteamUGC_DeleteItem
}


SteamUGC_CreateQueryUserUGCRequest :: inline (unAccountID: AccountID_t, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryUserUGCRequest(steam_ugc, unAccountID: AccountID_t, eListType: EUserUGCList, eMatchingUGCType: EUGCMatchingUGCType, eSortOrder: EUserUGCListSortOrder, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32);
}


SteamUGC_CreateQueryAllUGCRequestPage :: inline (eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryAllUGCRequestPage(steam_ugc, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, unPage: uint32);
}


SteamUGC_CreateQueryAllUGCRequestCursor :: inline (eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, pchCursor: *char) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryAllUGCRequestCursor(steam_ugc, eQueryType: EUGCQuery, eMatchingeMatchingUGCTypeFileType: EUGCMatchingUGCType, nCreatorAppID: AppId_t, nConsumerAppID: AppId_t, pchCursor: *char);
}


SteamUGC_CreateQueryUGCDetailsRequest :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> UGCQueryHandle_t {
    return SteamAPI_ISteamUGC_CreateQueryUGCDetailsRequest(steam_ugc, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32);
}


SteamUGC_SendQueryUGCRequest :: inline (handle: UGCQueryHandle_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_SendQueryUGCRequest(steam_ugc, handle: UGCQueryHandle_t);
}


SteamUGC_GetQueryUGCResult :: inline (handle: UGCQueryHandle_t, index: uint32, pDetails: *SteamUGCDetails_t) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCResult(steam_ugc, handle: UGCQueryHandle_t, index: uint32, pDetails: *SteamUGCDetails_t);
}


SteamUGC_GetQueryUGCPreviewURL :: inline (handle: UGCQueryHandle_t, index: uint32, pchURL: *char, cchURLSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCPreviewURL(steam_ugc, handle: UGCQueryHandle_t, index: uint32, pchURL: *char, cchURLSize: uint32);
}


SteamUGC_GetQueryUGCMetadata :: inline (handle: UGCQueryHandle_t, index: uint32, pchMetadata: *char, cchMetadatasize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCMetadata(steam_ugc, handle: UGCQueryHandle_t, index: uint32, pchMetadata: *char, cchMetadatasize: uint32);
}


SteamUGC_GetQueryUGCChildren :: inline (handle: UGCQueryHandle_t, index: uint32, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCChildren(steam_ugc, handle: UGCQueryHandle_t, index: uint32, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32);
}


SteamUGC_GetQueryUGCStatistic :: inline (handle: UGCQueryHandle_t, index: uint32, eStatType: EItemStatistic, pStatValue: *uint64) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCStatistic(steam_ugc, handle: UGCQueryHandle_t, index: uint32, eStatType: EItemStatistic, pStatValue: *uint64);
}


SteamUGC_GetQueryUGCNumAdditionalPreviews :: inline (handle: UGCQueryHandle_t, index: uint32) -> uint32 {
    return SteamAPI_ISteamUGC_GetQueryUGCNumAdditionalPreviews(steam_ugc, handle: UGCQueryHandle_t, index: uint32);
}


SteamUGC_GetQueryUGCAdditionalPreview :: inline (handle: UGCQueryHandle_t, index: uint32, previewIndex: uint32, pchURLOrVideoID: *char, cchURLSize: uint32, pchOriginalFileName: *char, cchOriginalFileNameSize: uint32, pPreviewType: *EItemPreviewType) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCAdditionalPreview(steam_ugc, handle: UGCQueryHandle_t, index: uint32, previewIndex: uint32, pchURLOrVideoID: *char, cchURLSize: uint32, pchOriginalFileName: *char, cchOriginalFileNameSize: uint32, pPreviewType: *EItemPreviewType);
}


SteamUGC_GetQueryUGCNumKeyValueTags :: inline (handle: UGCQueryHandle_t, index: uint32) -> uint32 {
    return SteamAPI_ISteamUGC_GetQueryUGCNumKeyValueTags(steam_ugc, handle: UGCQueryHandle_t, index: uint32);
}


SteamUGC_GetQueryUGCKeyValueTag :: inline (handle: UGCQueryHandle_t, index: uint32, keyValueTagIndex: uint32, pchKey: *char, cchKeySize: uint32, pchValue: *char, cchValueSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryUGCKeyValueTag(steam_ugc, handle: UGCQueryHandle_t, index: uint32, keyValueTagIndex: uint32, pchKey: *char, cchKeySize: uint32, pchValue: *char, cchValueSize: uint32);
}


SteamUGC_GetQueryFirstUGCKeyValueTag :: inline (handle: UGCQueryHandle_t, index: uint32, pchKey: *char, pchValue: *char, cchValueSize: uint32) -> bool {
    return SteamAPI_ISteamUGC_GetQueryFirstUGCKeyValueTag(steam_ugc, handle: UGCQueryHandle_t, index: uint32, pchKey: *char, pchValue: *char, cchValueSize: uint32);
}


SteamUGC_ReleaseQueryUGCRequest :: inline (handle: UGCQueryHandle_t) -> bool {
    return SteamAPI_ISteamUGC_ReleaseQueryUGCRequest(steam_ugc, handle: UGCQueryHandle_t);
}


SteamUGC_AddRequiredTag :: inline (handle: UGCQueryHandle_t, pTagName: *char) -> bool {
    return SteamAPI_ISteamUGC_AddRequiredTag(steam_ugc, handle: UGCQueryHandle_t, pTagName: *char);
}


SteamUGC_AddRequiredTagGroup :: inline (handle: UGCQueryHandle_t, pTagGroups: *SteamParamStringArray_t) -> bool {
    return SteamAPI_ISteamUGC_AddRequiredTagGroup(steam_ugc, handle: UGCQueryHandle_t, pTagGroups: *SteamParamStringArray_t);
}


SteamUGC_AddExcludedTag :: inline (handle: UGCQueryHandle_t, pTagName: *char) -> bool {
    return SteamAPI_ISteamUGC_AddExcludedTag(steam_ugc, handle: UGCQueryHandle_t, pTagName: *char);
}


SteamUGC_SetReturnOnlyIDs :: inline (handle: UGCQueryHandle_t, bReturnOnlyIDs: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnOnlyIDs(steam_ugc, handle: UGCQueryHandle_t, bReturnOnlyIDs: bool);
}


SteamUGC_SetReturnKeyValueTags :: inline (handle: UGCQueryHandle_t, bReturnKeyValueTags: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnKeyValueTags(steam_ugc, handle: UGCQueryHandle_t, bReturnKeyValueTags: bool);
}


SteamUGC_SetReturnLongDescription :: inline (handle: UGCQueryHandle_t, bReturnLongDescription: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnLongDescription(steam_ugc, handle: UGCQueryHandle_t, bReturnLongDescription: bool);
}


SteamUGC_SetReturnMetadata :: inline (handle: UGCQueryHandle_t, bReturnMetadata: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnMetadata(steam_ugc, handle: UGCQueryHandle_t, bReturnMetadata: bool);
}


SteamUGC_SetReturnChildren :: inline (handle: UGCQueryHandle_t, bReturnChildren: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnChildren(steam_ugc, handle: UGCQueryHandle_t, bReturnChildren: bool);
}


SteamUGC_SetReturnAdditionalPreviews :: inline (handle: UGCQueryHandle_t, bReturnAdditionalPreviews: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnAdditionalPreviews(steam_ugc, handle: UGCQueryHandle_t, bReturnAdditionalPreviews: bool);
}


SteamUGC_SetReturnTotalOnly :: inline (handle: UGCQueryHandle_t, bReturnTotalOnly: bool) -> bool {
    return SteamAPI_ISteamUGC_SetReturnTotalOnly(steam_ugc, handle: UGCQueryHandle_t, bReturnTotalOnly: bool);
}


SteamUGC_SetReturnPlaytimeStats :: inline (handle: UGCQueryHandle_t, unDays: uint32) -> bool {
    return SteamAPI_ISteamUGC_SetReturnPlaytimeStats(steam_ugc, handle: UGCQueryHandle_t, unDays: uint32);
}


SteamUGC_SetLanguage :: inline (handle: UGCQueryHandle_t, pchLanguage: *char) -> bool {
    return SteamAPI_ISteamUGC_SetLanguage(steam_ugc, handle: UGCQueryHandle_t, pchLanguage: *char);
}


SteamUGC_SetAllowCachedResponse :: inline (handle: UGCQueryHandle_t, unMaxAgeSeconds: uint32) -> bool {
    return SteamAPI_ISteamUGC_SetAllowCachedResponse(steam_ugc, handle: UGCQueryHandle_t, unMaxAgeSeconds: uint32);
}


SteamUGC_SetCloudFileNameFilter :: inline (handle: UGCQueryHandle_t, pMatchCloudFileName: *char) -> bool {
    return SteamAPI_ISteamUGC_SetCloudFileNameFilter(steam_ugc, handle: UGCQueryHandle_t, pMatchCloudFileName: *char);
}


SteamUGC_SetMatchAnyTag :: inline (handle: UGCQueryHandle_t, bMatchAnyTag: bool) -> bool {
    return SteamAPI_ISteamUGC_SetMatchAnyTag(steam_ugc, handle: UGCQueryHandle_t, bMatchAnyTag: bool);
}


SteamUGC_SetSearchText :: inline (handle: UGCQueryHandle_t, pSearchText: *char) -> bool {
    return SteamAPI_ISteamUGC_SetSearchText(steam_ugc, handle: UGCQueryHandle_t, pSearchText: *char);
}


SteamUGC_SetRankedByTrendDays :: inline (handle: UGCQueryHandle_t, unDays: uint32) -> bool {
    return SteamAPI_ISteamUGC_SetRankedByTrendDays(steam_ugc, handle: UGCQueryHandle_t, unDays: uint32);
}


SteamUGC_AddRequiredKeyValueTag :: inline (handle: UGCQueryHandle_t, pKey: *char, pValue: *char) -> bool {
    return SteamAPI_ISteamUGC_AddRequiredKeyValueTag(steam_ugc, handle: UGCQueryHandle_t, pKey: *char, pValue: *char);
}


SteamUGC_RequestUGCDetails :: inline (nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_RequestUGCDetails(steam_ugc, nPublishedFileID: PublishedFileId_t, unMaxAgeSeconds: uint32);
}


SteamUGC_CreateItem :: inline (nConsumerAppId: AppId_t, eFileType: EWorkshopFileType) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_CreateItem(steam_ugc, nConsumerAppId: AppId_t, eFileType: EWorkshopFileType);
}


SteamUGC_StartItemUpdate :: inline (nConsumerAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> UGCUpdateHandle_t {
    return SteamAPI_ISteamUGC_StartItemUpdate(steam_ugc, nConsumerAppId: AppId_t, nPublishedFileID: PublishedFileId_t);
}


SteamUGC_SetItemTitle :: inline (handle: UGCUpdateHandle_t, pchTitle: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemTitle(steam_ugc, handle: UGCUpdateHandle_t, pchTitle: *char);
}


SteamUGC_SetItemDescription :: inline (handle: UGCUpdateHandle_t, pchDescription: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemDescription(steam_ugc, handle: UGCUpdateHandle_t, pchDescription: *char);
}


SteamUGC_SetItemUpdateLanguage :: inline (handle: UGCUpdateHandle_t, pchLanguage: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemUpdateLanguage(steam_ugc, handle: UGCUpdateHandle_t, pchLanguage: *char);
}


SteamUGC_SetItemMetadata :: inline (handle: UGCUpdateHandle_t, pchMetaData: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemMetadata(steam_ugc, handle: UGCUpdateHandle_t, pchMetaData: *char);
}


SteamUGC_SetItemVisibility :: inline (handle: UGCUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool {
    return SteamAPI_ISteamUGC_SetItemVisibility(steam_ugc, handle: UGCUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility);
}


SteamUGC_SetItemTags :: inline (updateHandle: UGCUpdateHandle_t, pTags: *SteamParamStringArray_t) -> bool {
    return SteamAPI_ISteamUGC_SetItemTags(steam_ugc, updateHandle: UGCUpdateHandle_t, pTags: *SteamParamStringArray_t);
}


SteamUGC_SetItemContent :: inline (handle: UGCUpdateHandle_t, pszContentFolder: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemContent(steam_ugc, handle: UGCUpdateHandle_t, pszContentFolder: *char);
}


SteamUGC_SetItemPreview :: inline (handle: UGCUpdateHandle_t, pszPreviewFile: *char) -> bool {
    return SteamAPI_ISteamUGC_SetItemPreview(steam_ugc, handle: UGCUpdateHandle_t, pszPreviewFile: *char);
}


SteamUGC_SetAllowLegacyUpload :: inline (handle: UGCUpdateHandle_t, bAllowLegacyUpload: bool) -> bool {
    return SteamAPI_ISteamUGC_SetAllowLegacyUpload(steam_ugc, handle: UGCUpdateHandle_t, bAllowLegacyUpload: bool);
}


SteamUGC_RemoveAllItemKeyValueTags :: inline (handle: UGCUpdateHandle_t) -> bool {
    return SteamAPI_ISteamUGC_RemoveAllItemKeyValueTags(steam_ugc, handle: UGCUpdateHandle_t);
}


SteamUGC_RemoveItemKeyValueTags :: inline (handle: UGCUpdateHandle_t, pchKey: *char) -> bool {
    return SteamAPI_ISteamUGC_RemoveItemKeyValueTags(steam_ugc, handle: UGCUpdateHandle_t, pchKey: *char);
}


SteamUGC_AddItemKeyValueTag :: inline (handle: UGCUpdateHandle_t, pchKey: *char, pchValue: *char) -> bool {
    return SteamAPI_ISteamUGC_AddItemKeyValueTag(steam_ugc, handle: UGCUpdateHandle_t, pchKey: *char, pchValue: *char);
}


SteamUGC_AddItemPreviewFile :: inline (handle: UGCUpdateHandle_t, pszPreviewFile: *char, type: EItemPreviewType) -> bool {
    return SteamAPI_ISteamUGC_AddItemPreviewFile(steam_ugc, handle: UGCUpdateHandle_t, pszPreviewFile: *char, type: EItemPreviewType);
}


SteamUGC_AddItemPreviewVideo :: inline (handle: UGCUpdateHandle_t, pszVideoID: *char) -> bool {
    return SteamAPI_ISteamUGC_AddItemPreviewVideo(steam_ugc, handle: UGCUpdateHandle_t, pszVideoID: *char);
}


SteamUGC_UpdateItemPreviewFile :: inline (handle: UGCUpdateHandle_t, index: uint32, pszPreviewFile: *char) -> bool {
    return SteamAPI_ISteamUGC_UpdateItemPreviewFile(steam_ugc, handle: UGCUpdateHandle_t, index: uint32, pszPreviewFile: *char);
}


SteamUGC_UpdateItemPreviewVideo :: inline (handle: UGCUpdateHandle_t, index: uint32, pszVideoID: *char) -> bool {
    return SteamAPI_ISteamUGC_UpdateItemPreviewVideo(steam_ugc, handle: UGCUpdateHandle_t, index: uint32, pszVideoID: *char);
}


SteamUGC_RemoveItemPreview :: inline (handle: UGCUpdateHandle_t, index: uint32) -> bool {
    return SteamAPI_ISteamUGC_RemoveItemPreview(steam_ugc, handle: UGCUpdateHandle_t, index: uint32);
}


SteamUGC_SubmitItemUpdate :: inline (handle: UGCUpdateHandle_t, pchChangeNote: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_SubmitItemUpdate(steam_ugc, handle: UGCUpdateHandle_t, pchChangeNote: *char);
}


SteamUGC_GetItemUpdateProgress :: inline (handle: UGCUpdateHandle_t, punBytesProcessed: *uint64, punBytesTotal: *uint64) -> EItemUpdateStatus {
    return SteamAPI_ISteamUGC_GetItemUpdateProgress(steam_ugc, handle: UGCUpdateHandle_t, punBytesProcessed: *uint64, punBytesTotal: *uint64);
}


SteamUGC_SetUserItemVote :: inline (nPublishedFileID: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_SetUserItemVote(steam_ugc, nPublishedFileID: PublishedFileId_t, bVoteUp: bool);
}


SteamUGC_GetUserItemVote :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_GetUserItemVote(steam_ugc, nPublishedFileID: PublishedFileId_t);
}


SteamUGC_AddItemToFavorites :: inline (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_AddItemToFavorites(steam_ugc, nAppId: AppId_t, nPublishedFileID: PublishedFileId_t);
}


SteamUGC_RemoveItemFromFavorites :: inline (nAppId: AppId_t, nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_RemoveItemFromFavorites(steam_ugc, nAppId: AppId_t, nPublishedFileID: PublishedFileId_t);
}


SteamUGC_SubscribeItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_SubscribeItem(steam_ugc, nPublishedFileID: PublishedFileId_t);
}


SteamUGC_UnsubscribeItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_UnsubscribeItem(steam_ugc, nPublishedFileID: PublishedFileId_t);
}


SteamUGC_GetNumSubscribedItems :: inline () -> uint32 {
    return SteamAPI_ISteamUGC_GetNumSubscribedItems(steam_ugc);
}


SteamUGC_GetSubscribedItems :: inline (pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32) -> uint32 {
    return SteamAPI_ISteamUGC_GetSubscribedItems(steam_ugc, pvecPublishedFileID: *PublishedFileId_t, cMaxEntries: uint32);
}


SteamUGC_GetItemState :: inline (nPublishedFileID: PublishedFileId_t) -> uint32 {
    return SteamAPI_ISteamUGC_GetItemState(steam_ugc, nPublishedFileID: PublishedFileId_t);
}


SteamUGC_GetItemInstallInfo :: inline (nPublishedFileID: PublishedFileId_t, punSizeOnDisk: *uint64, pchFolder: *char, cchFolderSize: uint32, punTimeStamp: *uint32) -> bool {
    return SteamAPI_ISteamUGC_GetItemInstallInfo(steam_ugc, nPublishedFileID: PublishedFileId_t, punSizeOnDisk: *uint64, pchFolder: *char, cchFolderSize: uint32, punTimeStamp: *uint32);
}


SteamUGC_GetItemDownloadInfo :: inline (nPublishedFileID: PublishedFileId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64) -> bool {
    return SteamAPI_ISteamUGC_GetItemDownloadInfo(steam_ugc, nPublishedFileID: PublishedFileId_t, punBytesDownloaded: *uint64, punBytesTotal: *uint64);
}


SteamUGC_DownloadItem :: inline (nPublishedFileID: PublishedFileId_t, bHighPriority: bool) -> bool {
    return SteamAPI_ISteamUGC_DownloadItem(steam_ugc, nPublishedFileID: PublishedFileId_t, bHighPriority: bool);
}


SteamUGC_BInitWorkshopForGameServer :: inline (unWorkshopDepotID: DepotId_t, pszFolder: *char) -> bool {
    return SteamAPI_ISteamUGC_BInitWorkshopForGameServer(steam_ugc, unWorkshopDepotID: DepotId_t, pszFolder: *char);
}


SteamUGC_SuspendDownloads :: inline (bSuspend: bool) {
    SteamAPI_ISteamUGC_SuspendDownloads(steam_ugc, bSuspend: bool);
}


SteamUGC_StartPlaytimeTracking :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_StartPlaytimeTracking(steam_ugc, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32);
}


SteamUGC_StopPlaytimeTracking :: inline (pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_StopPlaytimeTracking(steam_ugc, pvecPublishedFileID: *PublishedFileId_t, unNumPublishedFileIDs: uint32);
}


SteamUGC_StopPlaytimeTrackingForAllItems :: inline () -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_StopPlaytimeTrackingForAllItems(steam_ugc);
}


SteamUGC_AddDependency :: inline (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_AddDependency(steam_ugc, nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t);
}


SteamUGC_RemoveDependency :: inline (nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_RemoveDependency(steam_ugc, nParentPublishedFileID: PublishedFileId_t, nChildPublishedFileID: PublishedFileId_t);
}


SteamUGC_AddAppDependency :: inline (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_AddAppDependency(steam_ugc, nPublishedFileID: PublishedFileId_t, nAppID: AppId_t);
}


SteamUGC_RemoveAppDependency :: inline (nPublishedFileID: PublishedFileId_t, nAppID: AppId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_RemoveAppDependency(steam_ugc, nPublishedFileID: PublishedFileId_t, nAppID: AppId_t);
}


SteamUGC_GetAppDependencies :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_GetAppDependencies(steam_ugc, nPublishedFileID: PublishedFileId_t);
}


SteamUGC_DeleteItem :: inline (nPublishedFileID: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamUGC_DeleteItem(steam_ugc, nPublishedFileID: PublishedFileId_t);
}
