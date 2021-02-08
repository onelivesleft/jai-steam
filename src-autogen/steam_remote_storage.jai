steam_remote_storage : *ISteamRemoteStorage;

SteamRemoteStorage : SteamRemoteStorage_Namespace;


#scope_file


SteamRemoteStorage_Namespace :: struct {
    // procs
                          :: SteamRemoteStorage_FileWrite
                           :: SteamRemoteStorage_FileRead
                     :: SteamRemoteStorage_FileWriteAsync
                      :: SteamRemoteStorage_FileReadAsync
              :: SteamRemoteStorage_FileReadAsyncComplete
                         :: SteamRemoteStorage_FileForget
                         :: SteamRemoteStorage_FileDelete
                          :: SteamRemoteStorage_FileShare
                   :: SteamRemoteStorage_SetSyncPlatforms
                :: SteamRemoteStorage_FileWriteStreamOpen
          :: SteamRemoteStorage_FileWriteStreamWriteChunk
               :: SteamRemoteStorage_FileWriteStreamClose
              :: SteamRemoteStorage_FileWriteStreamCancel
                         :: SteamRemoteStorage_FileExists
                      :: SteamRemoteStorage_FilePersisted
                        :: SteamRemoteStorage_GetFileSize
                   :: SteamRemoteStorage_GetFileTimestamp
                   :: SteamRemoteStorage_GetSyncPlatforms
                       :: SteamRemoteStorage_GetFileCount
                 :: SteamRemoteStorage_GetFileNameAndSize
                           :: SteamRemoteStorage_GetQuota
           :: SteamRemoteStorage_IsCloudEnabledForAccount
               :: SteamRemoteStorage_IsCloudEnabledForApp
              :: SteamRemoteStorage_SetCloudEnabledForApp
                        :: SteamRemoteStorage_UGCDownload
             :: SteamRemoteStorage_GetUGCDownloadProgress
                      :: SteamRemoteStorage_GetUGCDetails
                            :: SteamRemoteStorage_UGCRead
                  :: SteamRemoteStorage_GetCachedUGCCount
                 :: SteamRemoteStorage_GetCachedUGCHandle
                :: SteamRemoteStorage_PublishWorkshopFile
    :: SteamRemoteStorage_CreatePublishedFileUpdateRequest
            :: SteamRemoteStorage_UpdatePublishedFileFile
     :: SteamRemoteStorage_UpdatePublishedFilePreviewFile
           :: SteamRemoteStorage_UpdatePublishedFileTitle
     :: SteamRemoteStorage_UpdatePublishedFileDescription
      :: SteamRemoteStorage_UpdatePublishedFileVisibility
            :: SteamRemoteStorage_UpdatePublishedFileTags
          :: SteamRemoteStorage_CommitPublishedFileUpdate
            :: SteamRemoteStorage_GetPublishedFileDetails
                :: SteamRemoteStorage_DeletePublishedFile
        :: SteamRemoteStorage_EnumerateUserPublishedFiles
             :: SteamRemoteStorage_SubscribePublishedFile
       :: SteamRemoteStorage_EnumerateUserSubscribedFiles
           :: SteamRemoteStorage_UnsubscribePublishedFile
    :: SteamRemoteStorage_UpdatePublishedFileSetChangeDescription
        :: SteamRemoteStorage_GetPublishedItemVoteDetails
        :: SteamRemoteStorage_UpdateUserPublishedItemVote
    :: SteamRemoteStorage_GetUserPublishedItemVoteDetails
    :: SteamRemoteStorage_EnumerateUserSharedWorkshopFiles
                       :: SteamRemoteStorage_PublishVideo
         :: SteamRemoteStorage_SetUserPublishedFileAction
    :: SteamRemoteStorage_EnumeratePublishedFilesByUserAction
    :: SteamRemoteStorage_EnumeratePublishedWorkshopFiles
              :: SteamRemoteStorage_UGCDownloadToLocation
}


SteamRemoteStorage_FileWrite :: inline (pchFile: *char, pvData: *void, cubData: int32) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileWrite(steam_remote_storage, pchFile: *char, pvData: *void, cubData: int32);
}


SteamRemoteStorage_FileRead :: inline (pchFile: *char, pvData: *void, cubDataToRead: int32) -> int32 {
    return SteamAPI_ISteamRemoteStorage_FileRead(steam_remote_storage, pchFile: *char, pvData: *void, cubDataToRead: int32);
}


SteamRemoteStorage_FileWriteAsync :: inline (pchFile: *char, pvData: *void, cubData: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_FileWriteAsync(steam_remote_storage, pchFile: *char, pvData: *void, cubData: uint32);
}


SteamRemoteStorage_FileReadAsync :: inline (pchFile: *char, nOffset: uint32, cubToRead: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_FileReadAsync(steam_remote_storage, pchFile: *char, nOffset: uint32, cubToRead: uint32);
}


SteamRemoteStorage_FileReadAsyncComplete :: inline (hReadCall: SteamAPICall_t, pvBuffer: *void, cubToRead: uint32) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileReadAsyncComplete(steam_remote_storage, hReadCall: SteamAPICall_t, pvBuffer: *void, cubToRead: uint32);
}


SteamRemoteStorage_FileForget :: inline (pchFile: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileForget(steam_remote_storage, pchFile: *char);
}


SteamRemoteStorage_FileDelete :: inline (pchFile: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileDelete(steam_remote_storage, pchFile: *char);
}


SteamRemoteStorage_FileShare :: inline (pchFile: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_FileShare(steam_remote_storage, pchFile: *char);
}


SteamRemoteStorage_SetSyncPlatforms :: inline (pchFile: *char, eRemoteStoragePlatform: ERemoteStoragePlatform) -> bool {
    return SteamAPI_ISteamRemoteStorage_SetSyncPlatforms(steam_remote_storage, pchFile: *char, eRemoteStoragePlatform: ERemoteStoragePlatform);
}


SteamRemoteStorage_FileWriteStreamOpen :: inline (pchFile: *char) -> UGCFileWriteStreamHandle_t {
    return SteamAPI_ISteamRemoteStorage_FileWriteStreamOpen(steam_remote_storage, pchFile: *char);
}


SteamRemoteStorage_FileWriteStreamWriteChunk :: inline (writeHandle: UGCFileWriteStreamHandle_t, pvData: *void, cubData: int32) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileWriteStreamWriteChunk(steam_remote_storage, writeHandle: UGCFileWriteStreamHandle_t, pvData: *void, cubData: int32);
}


SteamRemoteStorage_FileWriteStreamClose :: inline (writeHandle: UGCFileWriteStreamHandle_t) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileWriteStreamClose(steam_remote_storage, writeHandle: UGCFileWriteStreamHandle_t);
}


SteamRemoteStorage_FileWriteStreamCancel :: inline (writeHandle: UGCFileWriteStreamHandle_t) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileWriteStreamCancel(steam_remote_storage, writeHandle: UGCFileWriteStreamHandle_t);
}


SteamRemoteStorage_FileExists :: inline (pchFile: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileExists(steam_remote_storage, pchFile: *char);
}


SteamRemoteStorage_FilePersisted :: inline (pchFile: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_FilePersisted(steam_remote_storage, pchFile: *char);
}


SteamRemoteStorage_GetFileSize :: inline (pchFile: *char) -> int32 {
    return SteamAPI_ISteamRemoteStorage_GetFileSize(steam_remote_storage, pchFile: *char);
}


SteamRemoteStorage_GetFileTimestamp :: inline (pchFile: *char) -> int64 {
    return SteamAPI_ISteamRemoteStorage_GetFileTimestamp(steam_remote_storage, pchFile: *char);
}


SteamRemoteStorage_GetSyncPlatforms :: inline (pchFile: *char) -> ERemoteStoragePlatform {
    return SteamAPI_ISteamRemoteStorage_GetSyncPlatforms(steam_remote_storage, pchFile: *char);
}


SteamRemoteStorage_GetFileCount :: inline () -> int32 {
    return SteamAPI_ISteamRemoteStorage_GetFileCount(steam_remote_storage);
}


SteamRemoteStorage_GetFileNameAndSize :: inline (iFile: s32, pnFileSizeInBytes: *int32) -> *char {
    return SteamAPI_ISteamRemoteStorage_GetFileNameAndSize(steam_remote_storage, iFile: s32, pnFileSizeInBytes: *int32);
}


SteamRemoteStorage_GetQuota :: inline (pnTotalBytes: *uint64, puAvailableBytes: *uint64) -> bool {
    return SteamAPI_ISteamRemoteStorage_GetQuota(steam_remote_storage, pnTotalBytes: *uint64, puAvailableBytes: *uint64);
}


SteamRemoteStorage_IsCloudEnabledForAccount :: inline () -> bool {
    return SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount(steam_remote_storage);
}


SteamRemoteStorage_IsCloudEnabledForApp :: inline () -> bool {
    return SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp(steam_remote_storage);
}


SteamRemoteStorage_SetCloudEnabledForApp :: inline (bEnabled: bool) {
    SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp(steam_remote_storage, bEnabled: bool);
}


SteamRemoteStorage_UGCDownload :: inline (hContent: UGCHandle_t, unPriority: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_UGCDownload(steam_remote_storage, hContent: UGCHandle_t, unPriority: uint32);
}


SteamRemoteStorage_GetUGCDownloadProgress :: inline (hContent: UGCHandle_t, pnBytesDownloaded: *int32, pnBytesExpected: *int32) -> bool {
    return SteamAPI_ISteamRemoteStorage_GetUGCDownloadProgress(steam_remote_storage, hContent: UGCHandle_t, pnBytesDownloaded: *int32, pnBytesExpected: *int32);
}


SteamRemoteStorage_GetUGCDetails :: inline (hContent: UGCHandle_t, pnAppID: *AppId_t, ppchName: **char, pnFileSizeInBytes: *int32, pSteamIDOwner: *CSteamID) -> bool {
    return SteamAPI_ISteamRemoteStorage_GetUGCDetails(steam_remote_storage, hContent: UGCHandle_t, pnAppID: *AppId_t, ppchName: **char, pnFileSizeInBytes: *int32, pSteamIDOwner: *CSteamID);
}


SteamRemoteStorage_UGCRead :: inline (hContent: UGCHandle_t, pvData: *void, cubDataToRead: int32, cOffset: uint32, eAction: EUGCReadAction) -> int32 {
    return SteamAPI_ISteamRemoteStorage_UGCRead(steam_remote_storage, hContent: UGCHandle_t, pvData: *void, cubDataToRead: int32, cOffset: uint32, eAction: EUGCReadAction);
}


SteamRemoteStorage_GetCachedUGCCount :: inline () -> int32 {
    return SteamAPI_ISteamRemoteStorage_GetCachedUGCCount(steam_remote_storage);
}


SteamRemoteStorage_GetCachedUGCHandle :: inline (iCachedContent: int32) -> UGCHandle_t {
    return SteamAPI_ISteamRemoteStorage_GetCachedUGCHandle(steam_remote_storage, iCachedContent: int32);
}


SteamRemoteStorage_PublishWorkshopFile :: inline (pchFile: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_PublishWorkshopFile(steam_remote_storage, pchFile: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType);
}


SteamRemoteStorage_CreatePublishedFileUpdateRequest :: inline (unPublishedFileId: PublishedFileId_t) -> PublishedFileUpdateHandle_t {
    return SteamAPI_ISteamRemoteStorage_CreatePublishedFileUpdateRequest(steam_remote_storage, unPublishedFileId: PublishedFileId_t);
}


SteamRemoteStorage_UpdatePublishedFileFile :: inline (updateHandle: PublishedFileUpdateHandle_t, pchFile: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFileFile(steam_remote_storage, updateHandle: PublishedFileUpdateHandle_t, pchFile: *char);
}


SteamRemoteStorage_UpdatePublishedFilePreviewFile :: inline (updateHandle: PublishedFileUpdateHandle_t, pchPreviewFile: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFilePreviewFile(steam_remote_storage, updateHandle: PublishedFileUpdateHandle_t, pchPreviewFile: *char);
}


SteamRemoteStorage_UpdatePublishedFileTitle :: inline (updateHandle: PublishedFileUpdateHandle_t, pchTitle: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTitle(steam_remote_storage, updateHandle: PublishedFileUpdateHandle_t, pchTitle: *char);
}


SteamRemoteStorage_UpdatePublishedFileDescription :: inline (updateHandle: PublishedFileUpdateHandle_t, pchDescription: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFileDescription(steam_remote_storage, updateHandle: PublishedFileUpdateHandle_t, pchDescription: *char);
}


SteamRemoteStorage_UpdatePublishedFileVisibility :: inline (updateHandle: PublishedFileUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFileVisibility(steam_remote_storage, updateHandle: PublishedFileUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility);
}


SteamRemoteStorage_UpdatePublishedFileTags :: inline (updateHandle: PublishedFileUpdateHandle_t, pTags: *SteamParamStringArray_t) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTags(steam_remote_storage, updateHandle: PublishedFileUpdateHandle_t, pTags: *SteamParamStringArray_t);
}


SteamRemoteStorage_CommitPublishedFileUpdate :: inline (updateHandle: PublishedFileUpdateHandle_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_CommitPublishedFileUpdate(steam_remote_storage, updateHandle: PublishedFileUpdateHandle_t);
}


SteamRemoteStorage_GetPublishedFileDetails :: inline (unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_GetPublishedFileDetails(steam_remote_storage, unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32);
}


SteamRemoteStorage_DeletePublishedFile :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_DeletePublishedFile(steam_remote_storage, unPublishedFileId: PublishedFileId_t);
}


SteamRemoteStorage_EnumerateUserPublishedFiles :: inline (unStartIndex: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_EnumerateUserPublishedFiles(steam_remote_storage, unStartIndex: uint32);
}


SteamRemoteStorage_SubscribePublishedFile :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_SubscribePublishedFile(steam_remote_storage, unPublishedFileId: PublishedFileId_t);
}


SteamRemoteStorage_EnumerateUserSubscribedFiles :: inline (unStartIndex: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_EnumerateUserSubscribedFiles(steam_remote_storage, unStartIndex: uint32);
}


SteamRemoteStorage_UnsubscribePublishedFile :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_UnsubscribePublishedFile(steam_remote_storage, unPublishedFileId: PublishedFileId_t);
}


SteamRemoteStorage_UpdatePublishedFileSetChangeDescription :: inline (updateHandle: PublishedFileUpdateHandle_t, pchChangeDescription: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription(steam_remote_storage, updateHandle: PublishedFileUpdateHandle_t, pchChangeDescription: *char);
}


SteamRemoteStorage_GetPublishedItemVoteDetails :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_GetPublishedItemVoteDetails(steam_remote_storage, unPublishedFileId: PublishedFileId_t);
}


SteamRemoteStorage_UpdateUserPublishedItemVote :: inline (unPublishedFileId: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_UpdateUserPublishedItemVote(steam_remote_storage, unPublishedFileId: PublishedFileId_t, bVoteUp: bool);
}


SteamRemoteStorage_GetUserPublishedItemVoteDetails :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_GetUserPublishedItemVoteDetails(steam_remote_storage, unPublishedFileId: PublishedFileId_t);
}


SteamRemoteStorage_EnumerateUserSharedWorkshopFiles :: inline (steamId: uint64_steamid, unStartIndex: uint32, pRequiredTags: *SteamParamStringArray_t, pExcludedTags: *SteamParamStringArray_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles(steam_remote_storage, steamId: uint64_steamid, unStartIndex: uint32, pRequiredTags: *SteamParamStringArray_t, pExcludedTags: *SteamParamStringArray_t);
}


SteamRemoteStorage_PublishVideo :: inline (eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: *char, pchVideoIdentifier: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_PublishVideo(steam_remote_storage, eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: *char, pchVideoIdentifier: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t);
}


SteamRemoteStorage_SetUserPublishedFileAction :: inline (unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_SetUserPublishedFileAction(steam_remote_storage, unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction);
}


SteamRemoteStorage_EnumeratePublishedFilesByUserAction :: inline (eAction: EWorkshopFileAction, unStartIndex: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_EnumeratePublishedFilesByUserAction(steam_remote_storage, eAction: EWorkshopFileAction, unStartIndex: uint32);
}


SteamRemoteStorage_EnumeratePublishedWorkshopFiles :: inline (eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: *SteamParamStringArray_t, pUserTags: *SteamParamStringArray_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_EnumeratePublishedWorkshopFiles(steam_remote_storage, eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: *SteamParamStringArray_t, pUserTags: *SteamParamStringArray_t);
}


SteamRemoteStorage_UGCDownloadToLocation :: inline (hContent: UGCHandle_t, pchLocation: *char, unPriority: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_UGCDownloadToLocation(steam_remote_storage, hContent: UGCHandle_t, pchLocation: *char, unPriority: uint32);
}
