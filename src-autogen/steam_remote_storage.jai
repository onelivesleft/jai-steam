steam_remote_storage : *ISteamRemoteStorage;


FileWrite :: inline (pchFile: *char, pvData: *void, cubData: int32) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileWrite(steam_remote_storage, pchFile, pvData, cubData);
}


FileRead :: inline (pchFile: *char, pvData: *void, cubDataToRead: int32) -> int32 {
    return SteamAPI_ISteamRemoteStorage_FileRead(steam_remote_storage, pchFile, pvData, cubDataToRead);
}


FileWriteAsync :: inline (pchFile: *char, pvData: *void, cubData: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_FileWriteAsync(steam_remote_storage, pchFile, pvData, cubData);
}

FileWriteAsync :: inline (pchFile: *char, pvData: *void, cubData: uint32, callback: (RemoteStorageFileWriteAsyncComplete_t, bool) -> ()) {
    RegisterCallResult(
        FileWriteAsync(pchFile, pvData, cubData),
        callback
    );
}

FileWriteAsync :: (pchFile: *char, pvData: *void, cubData: uint32, code: Code) #expand {
    RegisterCallResult(
        FileWriteAsync(pchFile, pvData, cubData),
        (result: RemoteStorageFileWriteAsyncComplete_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


FileReadAsync :: inline (pchFile: *char, nOffset: uint32, cubToRead: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_FileReadAsync(steam_remote_storage, pchFile, nOffset, cubToRead);
}

FileReadAsync :: inline (pchFile: *char, nOffset: uint32, cubToRead: uint32, callback: (RemoteStorageFileReadAsyncComplete_t, bool) -> ()) {
    RegisterCallResult(
        FileReadAsync(pchFile, nOffset, cubToRead),
        callback
    );
}

FileReadAsync :: (pchFile: *char, nOffset: uint32, cubToRead: uint32, code: Code) #expand {
    RegisterCallResult(
        FileReadAsync(pchFile, nOffset, cubToRead),
        (result: RemoteStorageFileReadAsyncComplete_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


FileReadAsyncComplete :: inline (hReadCall: SteamAPICall_t, pvBuffer: *void, cubToRead: uint32) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileReadAsyncComplete(steam_remote_storage, hReadCall, pvBuffer, cubToRead);
}


FileForget :: inline (pchFile: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileForget(steam_remote_storage, pchFile);
}


FileDelete :: inline (pchFile: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileDelete(steam_remote_storage, pchFile);
}


FileShare :: inline (pchFile: *char) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_FileShare(steam_remote_storage, pchFile);
}

FileShare :: inline (pchFile: *char, callback: (RemoteStorageFileShareResult_t, bool) -> ()) {
    RegisterCallResult(
        FileShare(pchFile),
        callback
    );
}

FileShare :: (pchFile: *char, code: Code) #expand {
    RegisterCallResult(
        FileShare(pchFile),
        (result: RemoteStorageFileShareResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


SetSyncPlatforms :: inline (pchFile: *char, eRemoteStoragePlatform: ERemoteStoragePlatform) -> bool {
    return SteamAPI_ISteamRemoteStorage_SetSyncPlatforms(steam_remote_storage, pchFile, eRemoteStoragePlatform);
}


FileWriteStreamOpen :: inline (pchFile: *char) -> UGCFileWriteStreamHandle_t {
    return SteamAPI_ISteamRemoteStorage_FileWriteStreamOpen(steam_remote_storage, pchFile);
}


FileWriteStreamWriteChunk :: inline (writeHandle: UGCFileWriteStreamHandle_t, pvData: *void, cubData: int32) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileWriteStreamWriteChunk(steam_remote_storage, writeHandle, pvData, cubData);
}


FileWriteStreamClose :: inline (writeHandle: UGCFileWriteStreamHandle_t) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileWriteStreamClose(steam_remote_storage, writeHandle);
}


FileWriteStreamCancel :: inline (writeHandle: UGCFileWriteStreamHandle_t) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileWriteStreamCancel(steam_remote_storage, writeHandle);
}


FileExists :: inline (pchFile: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileExists(steam_remote_storage, pchFile);
}


FilePersisted :: inline (pchFile: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_FilePersisted(steam_remote_storage, pchFile);
}


GetFileSize :: inline (pchFile: *char) -> int32 {
    return SteamAPI_ISteamRemoteStorage_GetFileSize(steam_remote_storage, pchFile);
}


GetFileTimestamp :: inline (pchFile: *char) -> int64 {
    return SteamAPI_ISteamRemoteStorage_GetFileTimestamp(steam_remote_storage, pchFile);
}


GetSyncPlatforms :: inline (pchFile: *char) -> ERemoteStoragePlatform {
    return SteamAPI_ISteamRemoteStorage_GetSyncPlatforms(steam_remote_storage, pchFile);
}


GetFileCount :: inline () -> int32 {
    return SteamAPI_ISteamRemoteStorage_GetFileCount(steam_remote_storage);
}


GetFileNameAndSize :: inline (iFile: s32, pnFileSizeInBytes: *int32) -> string {
    return to_string(SteamAPI_ISteamRemoteStorage_GetFileNameAndSize(steam_remote_storage, iFile, pnFileSizeInBytes));
}


GetQuota :: inline (pnTotalBytes: *uint64, puAvailableBytes: *uint64) -> bool {
    return SteamAPI_ISteamRemoteStorage_GetQuota(steam_remote_storage, pnTotalBytes, puAvailableBytes);
}


IsCloudEnabledForAccount :: inline () -> bool {
    return SteamAPI_ISteamRemoteStorage_IsCloudEnabledForAccount(steam_remote_storage);
}


IsCloudEnabledForApp :: inline () -> bool {
    return SteamAPI_ISteamRemoteStorage_IsCloudEnabledForApp(steam_remote_storage);
}


SetCloudEnabledForApp :: inline (bEnabled: bool) {
    SteamAPI_ISteamRemoteStorage_SetCloudEnabledForApp(steam_remote_storage, bEnabled);
}


UGCDownload :: inline (hContent: UGCHandle_t, unPriority: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_UGCDownload(steam_remote_storage, hContent, unPriority);
}

UGCDownload :: inline (hContent: UGCHandle_t, unPriority: uint32, callback: (RemoteStorageDownloadUGCResult_t, bool) -> ()) {
    RegisterCallResult(
        UGCDownload(hContent, unPriority),
        callback
    );
}

UGCDownload :: (hContent: UGCHandle_t, unPriority: uint32, code: Code) #expand {
    RegisterCallResult(
        UGCDownload(hContent, unPriority),
        (result: RemoteStorageDownloadUGCResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


GetUGCDownloadProgress :: inline (hContent: UGCHandle_t, pnBytesDownloaded: *int32, pnBytesExpected: *int32) -> bool {
    return SteamAPI_ISteamRemoteStorage_GetUGCDownloadProgress(steam_remote_storage, hContent, pnBytesDownloaded, pnBytesExpected);
}


GetUGCDetails :: inline (hContent: UGCHandle_t, pnAppID: *AppId_t, ppchName: **char, pnFileSizeInBytes: *int32, pSteamIDOwner: *CSteamID) -> bool {
    return SteamAPI_ISteamRemoteStorage_GetUGCDetails(steam_remote_storage, hContent, pnAppID, ppchName, pnFileSizeInBytes, pSteamIDOwner);
}


UGCRead :: inline (hContent: UGCHandle_t, pvData: *void, cubDataToRead: int32, cOffset: uint32, eAction: EUGCReadAction) -> int32 {
    return SteamAPI_ISteamRemoteStorage_UGCRead(steam_remote_storage, hContent, pvData, cubDataToRead, cOffset, eAction);
}


GetCachedUGCCount :: inline () -> int32 {
    return SteamAPI_ISteamRemoteStorage_GetCachedUGCCount(steam_remote_storage);
}


GetCachedUGCHandle :: inline (iCachedContent: int32) -> UGCHandle_t {
    return SteamAPI_ISteamRemoteStorage_GetCachedUGCHandle(steam_remote_storage, iCachedContent);
}


PublishWorkshopFile :: inline (pchFile: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_PublishWorkshopFile(steam_remote_storage, pchFile, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags, eWorkshopFileType);
}

PublishWorkshopFile :: inline (pchFile: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType, callback: (RemoteStoragePublishFileProgress_t, bool) -> ()) {
    RegisterCallResult(
        PublishWorkshopFile(pchFile, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags, eWorkshopFileType),
        callback
    );
}

PublishWorkshopFile :: (pchFile: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType, code: Code) #expand {
    RegisterCallResult(
        PublishWorkshopFile(pchFile, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags, eWorkshopFileType),
        (result: RemoteStoragePublishFileProgress_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


CreatePublishedFileUpdateRequest :: inline (unPublishedFileId: PublishedFileId_t) -> PublishedFileUpdateHandle_t {
    return SteamAPI_ISteamRemoteStorage_CreatePublishedFileUpdateRequest(steam_remote_storage, unPublishedFileId);
}


UpdatePublishedFileFile :: inline (updateHandle: PublishedFileUpdateHandle_t, pchFile: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFileFile(steam_remote_storage, updateHandle, pchFile);
}


UpdatePublishedFilePreviewFile :: inline (updateHandle: PublishedFileUpdateHandle_t, pchPreviewFile: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFilePreviewFile(steam_remote_storage, updateHandle, pchPreviewFile);
}


UpdatePublishedFileTitle :: inline (updateHandle: PublishedFileUpdateHandle_t, pchTitle: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTitle(steam_remote_storage, updateHandle, pchTitle);
}


UpdatePublishedFileDescription :: inline (updateHandle: PublishedFileUpdateHandle_t, pchDescription: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFileDescription(steam_remote_storage, updateHandle, pchDescription);
}


UpdatePublishedFileVisibility :: inline (updateHandle: PublishedFileUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFileVisibility(steam_remote_storage, updateHandle, eVisibility);
}


UpdatePublishedFileTags :: inline (updateHandle: PublishedFileUpdateHandle_t, pTags: *SteamParamStringArray_t) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFileTags(steam_remote_storage, updateHandle, pTags);
}


CommitPublishedFileUpdate :: inline (updateHandle: PublishedFileUpdateHandle_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_CommitPublishedFileUpdate(steam_remote_storage, updateHandle);
}

CommitPublishedFileUpdate :: inline (updateHandle: PublishedFileUpdateHandle_t, callback: (RemoteStorageUpdatePublishedFileResult_t, bool) -> ()) {
    RegisterCallResult(
        CommitPublishedFileUpdate(updateHandle),
        callback
    );
}

CommitPublishedFileUpdate :: (updateHandle: PublishedFileUpdateHandle_t, code: Code) #expand {
    RegisterCallResult(
        CommitPublishedFileUpdate(updateHandle),
        (result: RemoteStorageUpdatePublishedFileResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


GetPublishedFileDetails :: inline (unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_GetPublishedFileDetails(steam_remote_storage, unPublishedFileId, unMaxSecondsOld);
}

GetPublishedFileDetails :: inline (unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32, callback: (RemoteStorageGetPublishedFileDetailsResult_t, bool) -> ()) {
    RegisterCallResult(
        GetPublishedFileDetails(unPublishedFileId, unMaxSecondsOld),
        callback
    );
}

GetPublishedFileDetails :: (unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32, code: Code) #expand {
    RegisterCallResult(
        GetPublishedFileDetails(unPublishedFileId, unMaxSecondsOld),
        (result: RemoteStorageGetPublishedFileDetailsResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


DeletePublishedFile :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_DeletePublishedFile(steam_remote_storage, unPublishedFileId);
}

DeletePublishedFile :: inline (unPublishedFileId: PublishedFileId_t, callback: (RemoteStorageDeletePublishedFileResult_t, bool) -> ()) {
    RegisterCallResult(
        DeletePublishedFile(unPublishedFileId),
        callback
    );
}

DeletePublishedFile :: (unPublishedFileId: PublishedFileId_t, code: Code) #expand {
    RegisterCallResult(
        DeletePublishedFile(unPublishedFileId),
        (result: RemoteStorageDeletePublishedFileResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


EnumerateUserPublishedFiles :: inline (unStartIndex: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_EnumerateUserPublishedFiles(steam_remote_storage, unStartIndex);
}

EnumerateUserPublishedFiles :: inline (unStartIndex: uint32, callback: (RemoteStorageEnumerateUserPublishedFilesResult_t, bool) -> ()) {
    RegisterCallResult(
        EnumerateUserPublishedFiles(unStartIndex),
        callback
    );
}

EnumerateUserPublishedFiles :: (unStartIndex: uint32, code: Code) #expand {
    RegisterCallResult(
        EnumerateUserPublishedFiles(unStartIndex),
        (result: RemoteStorageEnumerateUserPublishedFilesResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


SubscribePublishedFile :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_SubscribePublishedFile(steam_remote_storage, unPublishedFileId);
}

SubscribePublishedFile :: inline (unPublishedFileId: PublishedFileId_t, callback: (RemoteStorageSubscribePublishedFileResult_t, bool) -> ()) {
    RegisterCallResult(
        SubscribePublishedFile(unPublishedFileId),
        callback
    );
}

SubscribePublishedFile :: (unPublishedFileId: PublishedFileId_t, code: Code) #expand {
    RegisterCallResult(
        SubscribePublishedFile(unPublishedFileId),
        (result: RemoteStorageSubscribePublishedFileResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


EnumerateUserSubscribedFiles :: inline (unStartIndex: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_EnumerateUserSubscribedFiles(steam_remote_storage, unStartIndex);
}

EnumerateUserSubscribedFiles :: inline (unStartIndex: uint32, callback: (RemoteStorageEnumerateUserSubscribedFilesResult_t, bool) -> ()) {
    RegisterCallResult(
        EnumerateUserSubscribedFiles(unStartIndex),
        callback
    );
}

EnumerateUserSubscribedFiles :: (unStartIndex: uint32, code: Code) #expand {
    RegisterCallResult(
        EnumerateUserSubscribedFiles(unStartIndex),
        (result: RemoteStorageEnumerateUserSubscribedFilesResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


UnsubscribePublishedFile :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_UnsubscribePublishedFile(steam_remote_storage, unPublishedFileId);
}

UnsubscribePublishedFile :: inline (unPublishedFileId: PublishedFileId_t, callback: (RemoteStorageUnsubscribePublishedFileResult_t, bool) -> ()) {
    RegisterCallResult(
        UnsubscribePublishedFile(unPublishedFileId),
        callback
    );
}

UnsubscribePublishedFile :: (unPublishedFileId: PublishedFileId_t, code: Code) #expand {
    RegisterCallResult(
        UnsubscribePublishedFile(unPublishedFileId),
        (result: RemoteStorageUnsubscribePublishedFileResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


UpdatePublishedFileSetChangeDescription :: inline (updateHandle: PublishedFileUpdateHandle_t, pchChangeDescription: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription(steam_remote_storage, updateHandle, pchChangeDescription);
}


GetPublishedItemVoteDetails :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_GetPublishedItemVoteDetails(steam_remote_storage, unPublishedFileId);
}

GetPublishedItemVoteDetails :: inline (unPublishedFileId: PublishedFileId_t, callback: (RemoteStorageGetPublishedItemVoteDetailsResult_t, bool) -> ()) {
    RegisterCallResult(
        GetPublishedItemVoteDetails(unPublishedFileId),
        callback
    );
}

GetPublishedItemVoteDetails :: (unPublishedFileId: PublishedFileId_t, code: Code) #expand {
    RegisterCallResult(
        GetPublishedItemVoteDetails(unPublishedFileId),
        (result: RemoteStorageGetPublishedItemVoteDetailsResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


UpdateUserPublishedItemVote :: inline (unPublishedFileId: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_UpdateUserPublishedItemVote(steam_remote_storage, unPublishedFileId, bVoteUp);
}

UpdateUserPublishedItemVote :: inline (unPublishedFileId: PublishedFileId_t, bVoteUp: bool, callback: (RemoteStorageUpdateUserPublishedItemVoteResult_t, bool) -> ()) {
    RegisterCallResult(
        UpdateUserPublishedItemVote(unPublishedFileId, bVoteUp),
        callback
    );
}

UpdateUserPublishedItemVote :: (unPublishedFileId: PublishedFileId_t, bVoteUp: bool, code: Code) #expand {
    RegisterCallResult(
        UpdateUserPublishedItemVote(unPublishedFileId, bVoteUp),
        (result: RemoteStorageUpdateUserPublishedItemVoteResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


GetUserPublishedItemVoteDetails :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_GetUserPublishedItemVoteDetails(steam_remote_storage, unPublishedFileId);
}

GetUserPublishedItemVoteDetails :: inline (unPublishedFileId: PublishedFileId_t, callback: (RemoteStorageGetPublishedItemVoteDetailsResult_t, bool) -> ()) {
    RegisterCallResult(
        GetUserPublishedItemVoteDetails(unPublishedFileId),
        callback
    );
}

GetUserPublishedItemVoteDetails :: (unPublishedFileId: PublishedFileId_t, code: Code) #expand {
    RegisterCallResult(
        GetUserPublishedItemVoteDetails(unPublishedFileId),
        (result: RemoteStorageGetPublishedItemVoteDetailsResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


EnumerateUserSharedWorkshopFiles :: inline (steamId: uint64_steamid, unStartIndex: uint32, pRequiredTags: *SteamParamStringArray_t, pExcludedTags: *SteamParamStringArray_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles(steam_remote_storage, steamId, unStartIndex, pRequiredTags, pExcludedTags);
}

EnumerateUserSharedWorkshopFiles :: inline (steamId: uint64_steamid, unStartIndex: uint32, pRequiredTags: *SteamParamStringArray_t, pExcludedTags: *SteamParamStringArray_t, callback: (RemoteStorageEnumerateUserPublishedFilesResult_t, bool) -> ()) {
    RegisterCallResult(
        EnumerateUserSharedWorkshopFiles(steamId, unStartIndex, pRequiredTags, pExcludedTags),
        callback
    );
}

EnumerateUserSharedWorkshopFiles :: (steamId: uint64_steamid, unStartIndex: uint32, pRequiredTags: *SteamParamStringArray_t, pExcludedTags: *SteamParamStringArray_t, code: Code) #expand {
    RegisterCallResult(
        EnumerateUserSharedWorkshopFiles(steamId, unStartIndex, pRequiredTags, pExcludedTags),
        (result: RemoteStorageEnumerateUserPublishedFilesResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


PublishVideo :: inline (eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: *char, pchVideoIdentifier: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_PublishVideo(steam_remote_storage, eVideoProvider, pchVideoAccount, pchVideoIdentifier, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags);
}

PublishVideo :: inline (eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: *char, pchVideoIdentifier: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, callback: (RemoteStoragePublishFileProgress_t, bool) -> ()) {
    RegisterCallResult(
        PublishVideo(eVideoProvider, pchVideoAccount, pchVideoIdentifier, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags),
        callback
    );
}

PublishVideo :: (eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: *char, pchVideoIdentifier: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, code: Code) #expand {
    RegisterCallResult(
        PublishVideo(eVideoProvider, pchVideoAccount, pchVideoIdentifier, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags),
        (result: RemoteStoragePublishFileProgress_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


SetUserPublishedFileAction :: inline (unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_SetUserPublishedFileAction(steam_remote_storage, unPublishedFileId, eAction);
}

SetUserPublishedFileAction :: inline (unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction, callback: (RemoteStorageSetUserPublishedFileActionResult_t, bool) -> ()) {
    RegisterCallResult(
        SetUserPublishedFileAction(unPublishedFileId, eAction),
        callback
    );
}

SetUserPublishedFileAction :: (unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction, code: Code) #expand {
    RegisterCallResult(
        SetUserPublishedFileAction(unPublishedFileId, eAction),
        (result: RemoteStorageSetUserPublishedFileActionResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


EnumeratePublishedFilesByUserAction :: inline (eAction: EWorkshopFileAction, unStartIndex: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_EnumeratePublishedFilesByUserAction(steam_remote_storage, eAction, unStartIndex);
}

EnumeratePublishedFilesByUserAction :: inline (eAction: EWorkshopFileAction, unStartIndex: uint32, callback: (RemoteStorageEnumeratePublishedFilesByUserActionResult_t, bool) -> ()) {
    RegisterCallResult(
        EnumeratePublishedFilesByUserAction(eAction, unStartIndex),
        callback
    );
}

EnumeratePublishedFilesByUserAction :: (eAction: EWorkshopFileAction, unStartIndex: uint32, code: Code) #expand {
    RegisterCallResult(
        EnumeratePublishedFilesByUserAction(eAction, unStartIndex),
        (result: RemoteStorageEnumeratePublishedFilesByUserActionResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


EnumeratePublishedWorkshopFiles :: inline (eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: *SteamParamStringArray_t, pUserTags: *SteamParamStringArray_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_EnumeratePublishedWorkshopFiles(steam_remote_storage, eEnumerationType, unStartIndex, unCount, unDays, pTags, pUserTags);
}

EnumeratePublishedWorkshopFiles :: inline (eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: *SteamParamStringArray_t, pUserTags: *SteamParamStringArray_t, callback: (RemoteStorageEnumerateWorkshopFilesResult_t, bool) -> ()) {
    RegisterCallResult(
        EnumeratePublishedWorkshopFiles(eEnumerationType, unStartIndex, unCount, unDays, pTags, pUserTags),
        callback
    );
}

EnumeratePublishedWorkshopFiles :: (eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: *SteamParamStringArray_t, pUserTags: *SteamParamStringArray_t, code: Code) #expand {
    RegisterCallResult(
        EnumeratePublishedWorkshopFiles(eEnumerationType, unStartIndex, unCount, unDays, pTags, pUserTags),
        (result: RemoteStorageEnumerateWorkshopFilesResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


UGCDownloadToLocation :: inline (hContent: UGCHandle_t, pchLocation: *char, unPriority: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamRemoteStorage_UGCDownloadToLocation(steam_remote_storage, hContent, pchLocation, unPriority);
}

UGCDownloadToLocation :: inline (hContent: UGCHandle_t, pchLocation: *char, unPriority: uint32, callback: (RemoteStorageDownloadUGCResult_t, bool) -> ()) {
    RegisterCallResult(
        UGCDownloadToLocation(hContent, pchLocation, unPriority),
        callback
    );
}

UGCDownloadToLocation :: (hContent: UGCHandle_t, pchLocation: *char, unPriority: uint32, code: Code) #expand {
    RegisterCallResult(
        UGCDownloadToLocation(hContent, pchLocation, unPriority),
        (result: RemoteStorageDownloadUGCResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}
