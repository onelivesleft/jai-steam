steam_remote_storage : *ISteamRemoteStorage;
SteamRemoteStorage : SteamRemoteStorage_Namespace;


#scope_file


SteamRemoteStorage_Namespace :: struct {
    // procs
    FileWrite                                          :: SteamRemoteStorage_FileWrite;
    FileRead                                           :: SteamRemoteStorage_FileRead;
    FileWriteAsync                                     :: SteamRemoteStorage_FileWriteAsync;
    FileReadAsync                                      :: SteamRemoteStorage_FileReadAsync;
    FileReadAsyncComplete                              :: SteamRemoteStorage_FileReadAsyncComplete;
    FileForget                                         :: SteamRemoteStorage_FileForget;
    FileDelete                                         :: SteamRemoteStorage_FileDelete;
    FileShare                                          :: SteamRemoteStorage_FileShare;
    SetSyncPlatforms                                   :: SteamRemoteStorage_SetSyncPlatforms;
    FileWriteStreamOpen                                :: SteamRemoteStorage_FileWriteStreamOpen;
    FileWriteStreamWriteChunk                          :: SteamRemoteStorage_FileWriteStreamWriteChunk;
    FileWriteStreamClose                               :: SteamRemoteStorage_FileWriteStreamClose;
    FileWriteStreamCancel                              :: SteamRemoteStorage_FileWriteStreamCancel;
    FileExists                                         :: SteamRemoteStorage_FileExists;
    FilePersisted                                      :: SteamRemoteStorage_FilePersisted;
    GetFileSize                                        :: SteamRemoteStorage_GetFileSize;
    GetFileTimestamp                                   :: SteamRemoteStorage_GetFileTimestamp;
    GetSyncPlatforms                                   :: SteamRemoteStorage_GetSyncPlatforms;
    GetFileCount                                       :: SteamRemoteStorage_GetFileCount;
    GetFileNameAndSize                                 :: SteamRemoteStorage_GetFileNameAndSize;
    GetQuota                                           :: SteamRemoteStorage_GetQuota;
    IsCloudEnabledForAccount                           :: SteamRemoteStorage_IsCloudEnabledForAccount;
    IsCloudEnabledForApp                               :: SteamRemoteStorage_IsCloudEnabledForApp;
    SetCloudEnabledForApp                              :: SteamRemoteStorage_SetCloudEnabledForApp;
    UGCDownload                                        :: SteamRemoteStorage_UGCDownload;
    GetUGCDownloadProgress                             :: SteamRemoteStorage_GetUGCDownloadProgress;
    GetUGCDetails                                      :: SteamRemoteStorage_GetUGCDetails;
    UGCRead                                            :: SteamRemoteStorage_UGCRead;
    GetCachedUGCCount                                  :: SteamRemoteStorage_GetCachedUGCCount;
    GetCachedUGCHandle                                 :: SteamRemoteStorage_GetCachedUGCHandle;
    PublishWorkshopFile                                :: SteamRemoteStorage_PublishWorkshopFile;
    CreatePublishedFileUpdateRequest                   :: SteamRemoteStorage_CreatePublishedFileUpdateRequest;
    UpdatePublishedFileFile                            :: SteamRemoteStorage_UpdatePublishedFileFile;
    UpdatePublishedFilePreviewFile                     :: SteamRemoteStorage_UpdatePublishedFilePreviewFile;
    UpdatePublishedFileTitle                           :: SteamRemoteStorage_UpdatePublishedFileTitle;
    UpdatePublishedFileDescription                     :: SteamRemoteStorage_UpdatePublishedFileDescription;
    UpdatePublishedFileVisibility                      :: SteamRemoteStorage_UpdatePublishedFileVisibility;
    UpdatePublishedFileTags                            :: SteamRemoteStorage_UpdatePublishedFileTags;
    CommitPublishedFileUpdate                          :: SteamRemoteStorage_CommitPublishedFileUpdate;
    GetPublishedFileDetails                            :: SteamRemoteStorage_GetPublishedFileDetails;
    DeletePublishedFile                                :: SteamRemoteStorage_DeletePublishedFile;
    EnumerateUserPublishedFiles                        :: SteamRemoteStorage_EnumerateUserPublishedFiles;
    SubscribePublishedFile                             :: SteamRemoteStorage_SubscribePublishedFile;
    EnumerateUserSubscribedFiles                       :: SteamRemoteStorage_EnumerateUserSubscribedFiles;
    UnsubscribePublishedFile                           :: SteamRemoteStorage_UnsubscribePublishedFile;
    UpdatePublishedFileSetChangeDescription            :: SteamRemoteStorage_UpdatePublishedFileSetChangeDescription;
    GetPublishedItemVoteDetails                        :: SteamRemoteStorage_GetPublishedItemVoteDetails;
    UpdateUserPublishedItemVote                        :: SteamRemoteStorage_UpdateUserPublishedItemVote;
    GetUserPublishedItemVoteDetails                    :: SteamRemoteStorage_GetUserPublishedItemVoteDetails;
    EnumerateUserSharedWorkshopFiles                   :: SteamRemoteStorage_EnumerateUserSharedWorkshopFiles;
    PublishVideo                                       :: SteamRemoteStorage_PublishVideo;
    SetUserPublishedFileAction                         :: SteamRemoteStorage_SetUserPublishedFileAction;
    EnumeratePublishedFilesByUserAction                :: SteamRemoteStorage_EnumeratePublishedFilesByUserAction;
    EnumeratePublishedWorkshopFiles                    :: SteamRemoteStorage_EnumeratePublishedWorkshopFiles;
    UGCDownloadToLocation                              :: SteamRemoteStorage_UGCDownloadToLocation;
}


SteamRemoteStorage_FileWrite :: inline (pchFile: *char, pvData: *void, cubData: int32) -> bool #foreign steam "SteamAPI_ISteamRemoteSto {
    return SteamRemoteStorage_FileWrite(steam_remote_storage, pchFile, pvData, cubData);
}


SteamRemoteStorage_FileRead :: inline (pchFile: *char, pvData: *void, cubDataToRead: int32) -> int32 #foreign steam "SteamAPI_ISteamRemoteSt {
    return SteamRemoteStorage_FileRead(steam_remote_storage, pchFile, pvData, cubDataToRead);
}


SteamRemoteStorage_FileWriteAsync :: inline (pchFile: *char, pvData: *void, cubData: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_ {
    return SteamRemoteStorage_FileWriteAsync(steam_remote_storage, pchFile, pvData, cubData);
}


SteamRemoteStorage_FileReadAsync :: inline (pchFile: *char, nOffset: uint32, cubToRead: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage {
    return SteamRemoteStorage_FileReadAsync(steam_remote_storage, pchFile, nOffset, cubToRead);
}


SteamRemoteStorage_FileReadAsyncComplete :: inline (hReadCall: SteamAPICall_t, pvBuffer: *void, cubToRead: uint32) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_FileRea {
    return SteamRemoteStorage_FileReadAsyncComplete(steam_remote_storage, hReadCall, pvBuffer, cubToRead);
}


SteamRemoteStorage_FileForget :: inline (pchFile: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStor {
    return SteamRemoteStorage_FileForget(steam_remote_storage, pchFile);
}


SteamRemoteStorage_FileDelete :: inline (pchFile: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStor {
    return SteamRemoteStorage_FileDelete(steam_remote_storage, pchFile);
}


SteamRemoteStorage_FileShare :: inline (pchFile: *char) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteSto {
    return SteamRemoteStorage_FileShare(steam_remote_storage, pchFile);
}


SteamRemoteStorage_SetSyncPlatforms :: inline (pchFile: *char, eRemoteStoragePlatform: ERemoteStoragePlatform) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_Se {
    return SteamRemoteStorage_SetSyncPlatforms(steam_remote_storage, pchFile, eRemoteStoragePlatform);
}


SteamRemoteStorage_FileWriteStreamOpen :: inline (pchFile: *char) -> UGCFileWriteStreamHandle_t #foreign steam "SteamAPI_ISteamRemoteStorage_FileW {
    return SteamRemoteStorage_FileWriteStreamOpen(steam_remote_storage, pchFile);
}


SteamRemoteStorage_FileWriteStreamWriteChunk :: inline (writeHandle: UGCFileWriteStreamHandle_t, pvData: *void, cubData: int32) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_FileWriteSt {
    return SteamRemoteStorage_FileWriteStreamWriteChunk(steam_remote_storage, writeHandle, pvData, cubData);
}


SteamRemoteStorage_FileWriteStreamClose :: inline (writeHandle: UGCFileWriteStreamHandle_t) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_FileWr {
    return SteamRemoteStorage_FileWriteStreamClose(steam_remote_storage, writeHandle);
}


SteamRemoteStorage_FileWriteStreamCancel :: inline (writeHandle: UGCFileWriteStreamHandle_t) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_FileWri {
    return SteamRemoteStorage_FileWriteStreamCancel(steam_remote_storage, writeHandle);
}


SteamRemoteStorage_FileExists :: inline (pchFile: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStor {
    return SteamRemoteStorage_FileExists(steam_remote_storage, pchFile);
}


SteamRemoteStorage_FilePersisted :: inline (pchFile: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage {
    return SteamRemoteStorage_FilePersisted(steam_remote_storage, pchFile);
}


SteamRemoteStorage_GetFileSize :: inline (pchFile: *char) -> int32 #foreign steam "SteamAPI_ISteamRemoteStora {
    return SteamRemoteStorage_GetFileSize(steam_remote_storage, pchFile);
}


SteamRemoteStorage_GetFileTimestamp :: inline (pchFile: *char) -> int64 #foreign steam "SteamAPI_ISteamRemoteStorage_Ge {
    return SteamRemoteStorage_GetFileTimestamp(steam_remote_storage, pchFile);
}


SteamRemoteStorage_GetSyncPlatforms :: inline (pchFile: *char) -> ERemoteStoragePlatform #foreign steam "SteamAPI_ISteamRemoteStorage_Ge {
    return SteamRemoteStorage_GetSyncPlatforms(steam_remote_storage, pchFile);
}


SteamRemoteStorage_GetFileCount :: inline () -> int32 #foreign steam "SteamAPI_ISteamRemoteStorag {
    return SteamRemoteStorage_GetFileCount(steam_remote_storage);
}


SteamRemoteStorage_GetFileNameAndSize :: inline (iFile: s32, pnFileSizeInBytes: *int32) -> *char #foreign steam "SteamAPI_ISteamRemoteStorage_GetF {
    return SteamRemoteStorage_GetFileNameAndSize(steam_remote_storage, iFile, pnFileSizeInBytes);
}


SteamRemoteStorage_GetQuota :: inline (pnTotalBytes: *uint64, puAvailableBytes: *uint64) -> bool #foreign steam "SteamAPI_ISteamRemoteSt {
    return SteamRemoteStorage_GetQuota(steam_remote_storage, pnTotalBytes, puAvailableBytes);
}


SteamRemoteStorage_IsCloudEnabledForAccount :: inline () -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_IsCloudEna {
    return SteamRemoteStorage_IsCloudEnabledForAccount(steam_remote_storage);
}


SteamRemoteStorage_IsCloudEnabledForApp :: inline () -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_IsClou {
    return SteamRemoteStorage_IsCloudEnabledForApp(steam_remote_storage);
}


SteamRemoteStorage_SetCloudEnabledForApp :: inline (bEnabled: bool) {
    SteamRemoteStorage_SetCloudEnabledForApp(steam_remote_storage, bEnabled);
}


SteamRemoteStorage_UGCDownload :: inline (hContent: UGCHandle_t, unPriority: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStora {
    return SteamRemoteStorage_UGCDownload(steam_remote_storage, hContent, unPriority);
}


SteamRemoteStorage_GetUGCDownloadProgress :: inline (hContent: UGCHandle_t, pnBytesDownloaded: *int32, pnBytesExpected: *int32) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_GetUGCDo {
    return SteamRemoteStorage_GetUGCDownloadProgress(steam_remote_storage, hContent, pnBytesDownloaded, pnBytesExpected);
}


SteamRemoteStorage_GetUGCDetails :: inline (hContent: UGCHandle_t, pnAppID: *AppId_t, ppchName: **char, pnFileSizeInBytes: *int32, pSteamIDOwner: *CSteamID) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage {
    return SteamRemoteStorage_GetUGCDetails(steam_remote_storage, hContent, pnAppID, ppchName, pnFileSizeInBytes, pSteamIDOwner);
}


SteamRemoteStorage_UGCRead :: inline (hContent: UGCHandle_t, pvData: *void, cubDataToRead: int32, cOffset: uint32, eAction: EUGCReadAction) -> int32 #foreign steam "SteamAPI_ISteamRemoteS {
    return SteamRemoteStorage_UGCRead(steam_remote_storage, hContent, pvData, cubDataToRead, cOffset, eAction);
}


SteamRemoteStorage_GetCachedUGCCount :: inline () -> int32 #foreign steam "SteamAPI_ISteamRemoteStorage_Get {
    return SteamRemoteStorage_GetCachedUGCCount(steam_remote_storage);
}


SteamRemoteStorage_GetCachedUGCHandle :: inline (iCachedContent: int32) -> UGCHandle_t #foreign steam "SteamAPI_ISteamRemoteStorage_GetC {
    return SteamRemoteStorage_GetCachedUGCHandle(steam_remote_storage, iCachedContent);
}


SteamRemoteStorage_PublishWorkshopFile :: inline (pchFile: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t, eWorkshopFileType: EWorkshopFileType) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_Publi {
    return SteamRemoteStorage_PublishWorkshopFile(steam_remote_storage, pchFile, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags, eWorkshopFileType);
}


SteamRemoteStorage_CreatePublishedFileUpdateRequest :: inline (unPublishedFileId: PublishedFileId_t) -> PublishedFileUpdateHandle_t #foreign steam "SteamAPI_ISteamRemoteStorage_CreatePublishedFil {
    return SteamRemoteStorage_CreatePublishedFileUpdateRequest(steam_remote_storage, unPublishedFileId);
}


SteamRemoteStorage_UpdatePublishedFileFile :: inline (updateHandle: PublishedFileUpdateHandle_t, pchFile: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_UpdatePub {
    return SteamRemoteStorage_UpdatePublishedFileFile(steam_remote_storage, updateHandle, pchFile);
}


SteamRemoteStorage_UpdatePublishedFilePreviewFile :: inline (updateHandle: PublishedFileUpdateHandle_t, pchPreviewFile: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_UpdatePublishedF {
    return SteamRemoteStorage_UpdatePublishedFilePreviewFile(steam_remote_storage, updateHandle, pchPreviewFile);
}


SteamRemoteStorage_UpdatePublishedFileTitle :: inline (updateHandle: PublishedFileUpdateHandle_t, pchTitle: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_UpdatePubl {
    return SteamRemoteStorage_UpdatePublishedFileTitle(steam_remote_storage, updateHandle, pchTitle);
}


SteamRemoteStorage_UpdatePublishedFileDescription :: inline (updateHandle: PublishedFileUpdateHandle_t, pchDescription: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_UpdatePublishedF {
    return SteamRemoteStorage_UpdatePublishedFileDescription(steam_remote_storage, updateHandle, pchDescription);
}


SteamRemoteStorage_UpdatePublishedFileVisibility :: inline (updateHandle: PublishedFileUpdateHandle_t, eVisibility: ERemoteStoragePublishedFileVisibility) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_UpdatePublished {
    return SteamRemoteStorage_UpdatePublishedFileVisibility(steam_remote_storage, updateHandle, eVisibility);
}


SteamRemoteStorage_UpdatePublishedFileTags :: inline (updateHandle: PublishedFileUpdateHandle_t, pTags: *SteamParamStringArray_t) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_UpdatePub {
    return SteamRemoteStorage_UpdatePublishedFileTags(steam_remote_storage, updateHandle, pTags);
}


SteamRemoteStorage_CommitPublishedFileUpdate :: inline (updateHandle: PublishedFileUpdateHandle_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_CommitPubli {
    return SteamRemoteStorage_CommitPublishedFileUpdate(steam_remote_storage, updateHandle);
}


SteamRemoteStorage_GetPublishedFileDetails :: inline (unPublishedFileId: PublishedFileId_t, unMaxSecondsOld: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_GetPublis {
    return SteamRemoteStorage_GetPublishedFileDetails(steam_remote_storage, unPublishedFileId, unMaxSecondsOld);
}


SteamRemoteStorage_DeletePublishedFile :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_Delet {
    return SteamRemoteStorage_DeletePublishedFile(steam_remote_storage, unPublishedFileId);
}


SteamRemoteStorage_EnumerateUserPublishedFiles :: inline (unStartIndex: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_EnumerateUser {
    return SteamRemoteStorage_EnumerateUserPublishedFiles(steam_remote_storage, unStartIndex);
}


SteamRemoteStorage_SubscribePublishedFile :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_Subscrib {
    return SteamRemoteStorage_SubscribePublishedFile(steam_remote_storage, unPublishedFileId);
}


SteamRemoteStorage_EnumerateUserSubscribedFiles :: inline (unStartIndex: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_EnumerateUserS {
    return SteamRemoteStorage_EnumerateUserSubscribedFiles(steam_remote_storage, unStartIndex);
}


SteamRemoteStorage_UnsubscribePublishedFile :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_Unsubscrib {
    return SteamRemoteStorage_UnsubscribePublishedFile(steam_remote_storage, unPublishedFileId);
}


SteamRemoteStorage_UpdatePublishedFileSetChangeDescription :: inline (updateHandle: PublishedFileUpdateHandle_t, pchChangeDescription: *char) -> bool #foreign steam "SteamAPI_ISteamRemoteStorage_UpdatePublishedFileSetCha {
    return SteamRemoteStorage_UpdatePublishedFileSetChangeDescription(steam_remote_storage, updateHandle, pchChangeDescription);
}


SteamRemoteStorage_GetPublishedItemVoteDetails :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_GetPublishedI {
    return SteamRemoteStorage_GetPublishedItemVoteDetails(steam_remote_storage, unPublishedFileId);
}


SteamRemoteStorage_UpdateUserPublishedItemVote :: inline (unPublishedFileId: PublishedFileId_t, bVoteUp: bool) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_UpdateUserPub {
    return SteamRemoteStorage_UpdateUserPublishedItemVote(steam_remote_storage, unPublishedFileId, bVoteUp);
}


SteamRemoteStorage_GetUserPublishedItemVoteDetails :: inline (unPublishedFileId: PublishedFileId_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_GetUserPublishedI {
    return SteamRemoteStorage_GetUserPublishedItemVoteDetails(steam_remote_storage, unPublishedFileId);
}


SteamRemoteStorage_EnumerateUserSharedWorkshopFiles :: inline (steamId: uint64_steamid, unStartIndex: uint32, pRequiredTags: *SteamParamStringArray_t, pExcludedTags: *SteamParamStringArray_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_EnumerateUserShare {
    return SteamRemoteStorage_EnumerateUserSharedWorkshopFiles(steam_remote_storage, steamId, unStartIndex, pRequiredTags, pExcludedTags);
}


SteamRemoteStorage_PublishVideo :: inline (eVideoProvider: EWorkshopVideoProvider, pchVideoAccount: *char, pchVideoIdentifier: *char, pchPreviewFile: *char, nConsumerAppId: AppId_t, pchTitle: *char, pchDescription: *char, eVisibility: ERemoteStoragePublishedFileVisibility, pTags: *SteamParamStringArray_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorag {
    return SteamRemoteStorage_PublishVideo(steam_remote_storage, eVideoProvider, pchVideoAccount, pchVideoIdentifier, pchPreviewFile, nConsumerAppId, pchTitle, pchDescription, eVisibility, pTags);
}


SteamRemoteStorage_SetUserPublishedFileAction :: inline (unPublishedFileId: PublishedFileId_t, eAction: EWorkshopFileAction) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_SetUserPubli {
    return SteamRemoteStorage_SetUserPublishedFileAction(steam_remote_storage, unPublishedFileId, eAction);
}


SteamRemoteStorage_EnumeratePublishedFilesByUserAction :: inline (eAction: EWorkshopFileAction, unStartIndex: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_EnumeratePublishedFil {
    return SteamRemoteStorage_EnumeratePublishedFilesByUserAction(steam_remote_storage, eAction, unStartIndex);
}


SteamRemoteStorage_EnumeratePublishedWorkshopFiles :: inline (eEnumerationType: EWorkshopEnumerationType, unStartIndex: uint32, unCount: uint32, unDays: uint32, pTags: *SteamParamStringArray_t, pUserTags: *SteamParamStringArray_t) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_EnumeratePublishe {
    return SteamRemoteStorage_EnumeratePublishedWorkshopFiles(steam_remote_storage, eEnumerationType, unStartIndex, unCount, unDays, pTags, pUserTags);
}


SteamRemoteStorage_UGCDownloadToLocation :: inline (hContent: UGCHandle_t, pchLocation: *char, unPriority: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamRemoteStorage_UGCDown {
    return SteamRemoteStorage_UGCDownloadToLocation(steam_remote_storage, hContent, pchLocation, unPriority);
}
