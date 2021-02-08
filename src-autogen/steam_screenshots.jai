steam_screenshots : *ISteamScreenshots;

SteamScreenshots : SteamScreenshots_Namespace;


#scope_file


SteamScreenshots_Namespace :: struct {
    // procs
                    :: SteamScreenshots_WriteScreenshot
             :: SteamScreenshots_AddScreenshotToLibrary
                  :: SteamScreenshots_TriggerScreenshot
                    :: SteamScreenshots_HookScreenshots
                        :: SteamScreenshots_SetLocation
                            :: SteamScreenshots_TagUser
                   :: SteamScreenshots_TagPublishedFile
                :: SteamScreenshots_IsScreenshotsHooked
           :: SteamScreenshots_AddVRScreenshotToLibrary
}


SteamScreenshots_WriteScreenshot :: inline (pubRGB: *void, cubRGB: uint32, nWidth: s32, nHeight: s32) -> ScreenshotHandle {
    return SteamAPI_ISteamScreenshots_WriteScreenshot(steam_screenshots, pubRGB: *void, cubRGB: uint32, nWidth: s32, nHeight: s32);
}


SteamScreenshots_AddScreenshotToLibrary :: inline (pchFilename: *char, pchThumbnailFilename: *char, nWidth: s32, nHeight: s32) -> ScreenshotHandle {
    return SteamAPI_ISteamScreenshots_AddScreenshotToLibrary(steam_screenshots, pchFilename: *char, pchThumbnailFilename: *char, nWidth: s32, nHeight: s32);
}


SteamScreenshots_TriggerScreenshot :: inline () {
    SteamAPI_ISteamScreenshots_TriggerScreenshot(steam_screenshots);
}


SteamScreenshots_HookScreenshots :: inline (bHook: bool) {
    SteamAPI_ISteamScreenshots_HookScreenshots(steam_screenshots, bHook: bool);
}


SteamScreenshots_SetLocation :: inline (hScreenshot: ScreenshotHandle, pchLocation: *char) -> bool {
    return SteamAPI_ISteamScreenshots_SetLocation(steam_screenshots, hScreenshot: ScreenshotHandle, pchLocation: *char);
}


SteamScreenshots_TagUser :: inline (hScreenshot: ScreenshotHandle, steamID: uint64_steamid) -> bool {
    return SteamAPI_ISteamScreenshots_TagUser(steam_screenshots, hScreenshot: ScreenshotHandle, steamID: uint64_steamid);
}


SteamScreenshots_TagPublishedFile :: inline (hScreenshot: ScreenshotHandle, unPublishedFileID: PublishedFileId_t) -> bool {
    return SteamAPI_ISteamScreenshots_TagPublishedFile(steam_screenshots, hScreenshot: ScreenshotHandle, unPublishedFileID: PublishedFileId_t);
}


SteamScreenshots_IsScreenshotsHooked :: inline () -> bool {
    return SteamAPI_ISteamScreenshots_IsScreenshotsHooked(steam_screenshots);
}


SteamScreenshots_AddVRScreenshotToLibrary :: inline (eType: EVRScreenshotType, pchFilename: *char, pchVRFilename: *char) -> ScreenshotHandle {
    return SteamAPI_ISteamScreenshots_AddVRScreenshotToLibrary(steam_screenshots, eType: EVRScreenshotType, pchFilename: *char, pchVRFilename: *char);
}
