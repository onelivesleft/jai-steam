steam_remote_storage : *ISteamRemoteStorage;


FileWrite :: inline (pchFile: *char, pvData: *void, cubData: int32) -> bool {
    return SteamAPI_ISteamRemoteStorage_FileWrite(steam_remote_storage, pchFile, pvData, cubData);
}


FileRead :: inline (pchFile: *char, pvData: *void, cubDataToRead: int32) -> int32 {
    return SteamAPI_ISteamRemoteStorage_FileRead(steam_remote_storage, pchFile, pvData, cubDataToRead);
}


FileWriteAsync :: inline (pchFile: *char, pvData: *void, cubData: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_FileWriteAsync(steam_remote_storage, pchFile, pvData, cubData);
}

FileWriteAsync :: inline (pchFile: *char, pvData: *void, cubData: uint32, callback: (RemoteStorageFileWriteAsyncComplete_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := FileWriteAsync(pchFile, pvData, cubData);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

FileWriteAsync :: (pchFile: *char, pvData: *void, cubData: uint32, code: Code) -> SteamAPICall_t #expand {
    call_result_id := FileWriteAsync(pchFile, pvData, cubData);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageFileWriteAsyncComplete_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


FileReadAsync :: inline (pchFile: *char, nOffset: uint32, cubToRead: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_FileReadAsync(steam_remote_storage, pchFile, nOffset, cubToRead);
}

FileReadAsync :: inline (pchFile: *char, nOffset: uint32, cubToRead: uint32, callback: (RemoteStorageFileReadAsyncComplete_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := FileReadAsync(pchFile, nOffset, cubToRead);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

FileReadAsync :: (pchFile: *char, nOffset: uint32, cubToRead: uint32, code: Code) -> SteamAPICall_t #expand {
    call_result_id := FileReadAsync(pchFile, nOffset, cubToRead);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageFileReadAsyncComplete_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
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


FileShare :: inline (pchFile: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_FileShare(steam_remote_storage, pchFile);
}

FileShare :: inline (pchFile: *char, callback: (RemoteStorageFileShareResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := FileShare(pchFile);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

FileShare :: (pchFile: *char, code: Code) -> SteamAPICall_t #expand {
    call_result_id := FileShare(pchFile);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageFileShareResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
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


UGCDownload :: inline (hContent: UGCHandle_t, unPriority: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_UGCDownload(steam_remote_storage, hContent, unPriority);
}

UGCDownload :: inline (hContent: UGCHandle_t, unPriority: uint32, callback: (RemoteStorageDownloadUGCResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := UGCDownload(hContent, unPriority);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

UGCDownload :: (hContent: UGCHandle_t, unPriority: uint32, code: Code) -> SteamAPICall_t #expand {
    call_result_id := UGCDownload(hContent, unPriority);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageDownloadUGCResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
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


PublishWorkshopFile :: inline (pchFile: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_PublishWorkshopFile(steam_remote_storage, pchFile, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags, eWorkshopFileType);
}

PublishWorkshopFile :: inline (pchFile: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType, callback: (RemoteStoragePublishFileProgress_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := PublishWorkshopFile(pchFile, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags, eWorkshopFileType);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

PublishWorkshopFile :: (pchFile: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType, code: Code) -> SteamAPICall_t #expand {
    call_result_id := PublishWorkshopFile(pchFile, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags, eWorkshopFileType);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStoragePublishFileProgress_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
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


CommitPublishedFileUpdate :: inline (updateHandle: PublishedFileUpdateHandle_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_CommitPublishedFileUpdate(steam_remote_storage, updateHandle);
}

CommitPublishedFileUpdate :: inline (updateHandle: PublishedFileUpdateHandle_t, callback: (RemoteStorageUpdatePublishedFileResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := CommitPublishedFileUpdate(updateHandle);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

CommitPublishedFileUpdate :: (updateHandle: PublishedFileUpdateHandle_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := CommitPublishedFileUpdate(updateHandle);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageUpdatePublishedFileResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


GetPublishedFileDetails :: inline (unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_GetPublishedFileDetails(steam_remote_storage, unPublishedFileId, unMaxSecondsOld);
}

GetPublishedFileDetails :: inline (unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32, callback: (RemoteStorageGetPublishedFileDetailsResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := GetPublishedFileDetails(unPublishedFileId, unMaxSecondsOld);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

GetPublishedFileDetails :: (unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32, code: Code) -> SteamAPICall_t #expand {
    call_result_id := GetPublishedFileDetails(unPublishedFileId, unMaxSecondsOld);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageGetPublishedFileDetailsResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


DeletePublishedFile :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_DeletePublishedFile(steam_remote_storage, unPublishedFileId);
}

DeletePublishedFile :: inline (unPublishedFileId: PublishedFileId_t, callback: (RemoteStorageDeletePublishedFileResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := DeletePublishedFile(unPublishedFileId);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

DeletePublishedFile :: (unPublishedFileId: PublishedFileId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := DeletePublishedFile(unPublishedFileId);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageDeletePublishedFileResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


EnumerateUserPublishedFiles :: inline (unStartIndex: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_EnumerateUserPublishedFiles(steam_remote_storage, unStartIndex);
}

EnumerateUserPublishedFiles :: inline (unStartIndex: uint32, callback: (RemoteStorageEnumerateUserPublishedFilesResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := EnumerateUserPublishedFiles(unStartIndex);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

EnumerateUserPublishedFiles :: (unStartIndex: uint32, code: Code) -> SteamAPICall_t #expand {
    call_result_id := EnumerateUserPublishedFiles(unStartIndex);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageEnumerateUserPublishedFilesResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


SubscribePublishedFile :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_SubscribePublishedFile(steam_remote_storage, unPublishedFileId);
}

SubscribePublishedFile :: inline (unPublishedFileId: PublishedFileId_t, callback: (RemoteStorageSubscribePublishedFileResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := SubscribePublishedFile(unPublishedFileId);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

SubscribePublishedFile :: (unPublishedFileId: PublishedFileId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := SubscribePublishedFile(unPublishedFileId);
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


EnumerateUserSubscribedFiles :: inline (unStartIndex: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_EnumerateUserSubscribedFiles(steam_remote_storage, unStartIndex);
}

EnumerateUserSubscribedFiles :: inline (unStartIndex: uint32, callback: (RemoteStorageEnumerateUserSubscribedFilesResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := EnumerateUserSubscribedFiles(unStartIndex);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

EnumerateUserSubscribedFiles :: (unStartIndex: uint32, code: Code) -> SteamAPICall_t #expand {
    call_result_id := EnumerateUserSubscribedFiles(unStartIndex);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageEnumerateUserSubscribedFilesResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


UnsubscribePublishedFile :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_UnsubscribePublishedFile(steam_remote_storage, unPublishedFileId);
}

UnsubscribePublishedFile :: inline (unPublishedFileId: PublishedFileId_t, callback: (RemoteStorageUnsubscribePublishedFileResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := UnsubscribePublishedFile(unPublishedFileId);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

UnsubscribePublishedFile :: (unPublishedFileId: PublishedFileId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := UnsubscribePublishedFile(unPublishedFileId);
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


UpdatePublishedFileSetChangeDescription :: inline (updateHandle: PublishedFileUpdateHandle_t, pchChangeDescription: *char) -> bool {
    return SteamAPI_ISteamRemoteStorage_UpdatePublishedFileSetChangeDescription(steam_remote_storage, updateHandle, pchChangeDescription);
}


GetPublishedItemVoteDetails :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_GetPublishedItemVoteDetails(steam_remote_storage, unPublishedFileId);
}

GetPublishedItemVoteDetails :: inline (unPublishedFileId: PublishedFileId_t, callback: (RemoteStorageGetPublishedItemVoteDetailsResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := GetPublishedItemVoteDetails(unPublishedFileId);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

GetPublishedItemVoteDetails :: (unPublishedFileId: PublishedFileId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := GetPublishedItemVoteDetails(unPublishedFileId);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageGetPublishedItemVoteDetailsResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


UpdateUserPublishedItemVote :: inline (unPublishedFileId: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_UpdateUserPublishedItemVote(steam_remote_storage, unPublishedFileId, bVoteUp);
}

UpdateUserPublishedItemVote :: inline (unPublishedFileId: PublishedFileId_t, bVoteUp: bool, callback: (RemoteStorageUpdateUserPublishedItemVoteResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := UpdateUserPublishedItemVote(unPublishedFileId, bVoteUp);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

UpdateUserPublishedItemVote :: (unPublishedFileId: PublishedFileId_t, bVoteUp: bool, code: Code) -> SteamAPICall_t #expand {
    call_result_id := UpdateUserPublishedItemVote(unPublishedFileId, bVoteUp);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageUpdateUserPublishedItemVoteResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


GetUserPublishedItemVoteDetails :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_GetUserPublishedItemVoteDetails(steam_remote_storage, unPublishedFileId);
}

GetUserPublishedItemVoteDetails :: inline (unPublishedFileId: PublishedFileId_t, callback: (RemoteStorageGetPublishedItemVoteDetailsResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := GetUserPublishedItemVoteDetails(unPublishedFileId);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

GetUserPublishedItemVoteDetails :: (unPublishedFileId: PublishedFileId_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := GetUserPublishedItemVoteDetails(unPublishedFileId);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageGetPublishedItemVoteDetailsResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


EnumerateUserSharedWorkshopFiles :: inline (steamId: uint64_steamid, unStartIndex: uint32, pRequiredTags: *SteamParamStringArray_t, pExcludedTags: *SteamParamStringArray_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_EnumerateUserSharedWorkshopFiles(steam_remote_storage, steamId, unStartIndex, pRequiredTags, pExcludedTags);
}

EnumerateUserSharedWorkshopFiles :: inline (steamId: uint64_steamid, unStartIndex: uint32, pRequiredTags: *SteamParamStringArray_t, pExcludedTags: *SteamParamStringArray_t, callback: (RemoteStorageEnumerateUserPublishedFilesResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := EnumerateUserSharedWorkshopFiles(steamId, unStartIndex, pRequiredTags, pExcludedTags);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

EnumerateUserSharedWorkshopFiles :: (steamId: uint64_steamid, unStartIndex: uint32, pRequiredTags: *SteamParamStringArray_t, pExcludedTags: *SteamParamStringArray_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := EnumerateUserSharedWorkshopFiles(steamId, unStartIndex, pRequiredTags, pExcludedTags);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageEnumerateUserPublishedFilesResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


PublishVideo :: inline (eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: *char, pchVideoIdentifier: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_PublishVideo(steam_remote_storage, eVideoProvider, pchVideoAccount, pchVideoIdentifier, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags);
}

PublishVideo :: inline (eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: *char, pchVideoIdentifier: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, callback: (RemoteStoragePublishFileProgress_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := PublishVideo(eVideoProvider, pchVideoAccount, pchVideoIdentifier, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

PublishVideo :: (eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: *char, pchVideoIdentifier: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := PublishVideo(eVideoProvider, pchVideoAccount, pchVideoIdentifier, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStoragePublishFileProgress_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


SetUserPublishedFileAction :: inline (unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_SetUserPublishedFileAction(steam_remote_storage, unPublishedFileId, eAction);
}

SetUserPublishedFileAction :: inline (unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction, callback: (RemoteStorageSetUserPublishedFileActionResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := SetUserPublishedFileAction(unPublishedFileId, eAction);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

SetUserPublishedFileAction :: (unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction, code: Code) -> SteamAPICall_t #expand {
    call_result_id := SetUserPublishedFileAction(unPublishedFileId, eAction);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageSetUserPublishedFileActionResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


EnumeratePublishedFilesByUserAction :: inline (eAction: EWorkshopFileAction, unStartIndex: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_EnumeratePublishedFilesByUserAction(steam_remote_storage, eAction, unStartIndex);
}

EnumeratePublishedFilesByUserAction :: inline (eAction: EWorkshopFileAction, unStartIndex: uint32, callback: (RemoteStorageEnumeratePublishedFilesByUserActionResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := EnumeratePublishedFilesByUserAction(eAction, unStartIndex);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

EnumeratePublishedFilesByUserAction :: (eAction: EWorkshopFileAction, unStartIndex: uint32, code: Code) -> SteamAPICall_t #expand {
    call_result_id := EnumeratePublishedFilesByUserAction(eAction, unStartIndex);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageEnumeratePublishedFilesByUserActionResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


EnumeratePublishedWorkshopFiles :: inline (eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: *SteamParamStringArray_t, pUserTags: *SteamParamStringArray_t) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_EnumeratePublishedWorkshopFiles(steam_remote_storage, eEnumerationType, unStartIndex, unCount, unDays, pTags, pUserTags);
}

EnumeratePublishedWorkshopFiles :: inline (eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: *SteamParamStringArray_t, pUserTags: *SteamParamStringArray_t, callback: (RemoteStorageEnumerateWorkshopFilesResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := EnumeratePublishedWorkshopFiles(eEnumerationType, unStartIndex, unCount, unDays, pTags, pUserTags);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

EnumeratePublishedWorkshopFiles :: (eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: *SteamParamStringArray_t, pUserTags: *SteamParamStringArray_t, code: Code) -> SteamAPICall_t #expand {
    call_result_id := EnumeratePublishedWorkshopFiles(eEnumerationType, unStartIndex, unCount, unDays, pTags, pUserTags);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageEnumerateWorkshopFilesResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}


UGCDownloadToLocation :: inline (hContent: UGCHandle_t, pchLocation: *char, unPriority: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamRemoteStorage_UGCDownloadToLocation(steam_remote_storage, hContent, pchLocation, unPriority);
}

UGCDownloadToLocation :: inline (hContent: UGCHandle_t, pchLocation: *char, unPriority: uint32, callback: (RemoteStorageDownloadUGCResult_t, bool) -> ()) -> SteamAPICall_t {
    call_result_id := UGCDownloadToLocation(hContent, pchLocation, unPriority);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            callback
        );
    }
    return call_result_id;
}

UGCDownloadToLocation :: (hContent: UGCHandle_t, pchLocation: *char, unPriority: uint32, code: Code) -> SteamAPICall_t #expand {
    call_result_id := UGCDownloadToLocation(hContent, pchLocation, unPriority);
    if call_result_id {
        RegisterCallResult(
            call_result_id,
            (result: RemoteStorageDownloadUGCResult_t, io_failure: bool) -> () {
                #insert_internal code;
            }
        );
    }
    return call_result_id;
}
