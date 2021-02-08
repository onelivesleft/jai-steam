steam_screenshots : *ISteamScreenshots;
SteamScreenshots : SteamScreenshots_Namespace;


#scope_file


SteamScreenshots_Namespace :: struct {
    // procs
    WriteScreenshot                                    :: SteamScreenshots_WriteScreenshot;
    AddScreenshotToLibrary                             :: SteamScreenshots_AddScreenshotToLibrary;
    TriggerScreenshot                                  :: SteamScreenshots_TriggerScreenshot;
    HookScreenshots                                    :: SteamScreenshots_HookScreenshots;
    SetLocation                                        :: SteamScreenshots_SetLocation;
    TagUser                                            :: SteamScreenshots_TagUser;
    TagPublishedFile                                   :: SteamScreenshots_TagPublishedFile;
    IsScreenshotsHooked                                :: SteamScreenshots_IsScreenshotsHooked;
    AddVRScreenshotToLibrary                           :: SteamScreenshots_AddVRScreenshotToLibrary;
}


SteamScreenshots_WriteScreenshot :: inline (pubRGB: *void, cubRGB: uint32, nWidth: s32, nHeight: s32) -> ScreenshotHandle {
    return SteamAPI_ISteamScreenshots_WriteScreenshot(steam_screenshots, pubRGB, cubRGB, nWidth, nHeight);
}


SteamScreenshots_AddScreenshotToLibrary :: inline (pchFilename: *char, pchThumbnailFilename: *char, nWidth: s32, nHeight: s32) -> ScreenshotHandle {
    return SteamAPI_ISteamScreenshots_AddScreenshotToLibrary(steam_screenshots, pchFilename, pchThumbnailFilename, nWidth, nHeight);
}


SteamScreenshots_TriggerScreenshot :: inline () {
    SteamAPI_ISteamScreenshots_TriggerScreenshot(steam_screenshots);
}


SteamScreenshots_HookScreenshots :: inline (bHook: bool) {
    SteamAPI_ISteamScreenshots_HookScreenshots(steam_screenshots, bHook);
}


SteamScreenshots_SetLocation :: inline (hScreenshot: ScreenshotHandle, pchLocation: *char) -> bool {
    return SteamAPI_ISteamScreenshots_SetLocation(steam_screenshots, hScreenshot, pchLocation);
}


SteamScreenshots_TagUser :: inline (hScreenshot: ScreenshotHandle, steamID: uint64_steamid) -> bool {
    return SteamAPI_ISteamScreenshots_TagUser(steam_screenshots, hScreenshot, steamID);
}


SteamScreenshots_TagPublishedFile :: inline (hScreenshot: ScreenshotHandle, unPublishedFileID: PublishedFileId_t) -> bool {
    return SteamAPI_ISteamScreenshots_TagPublishedFile(steam_screenshots, hScreenshot, unPublishedFileID);
}


SteamScreenshots_IsScreenshotsHooked :: inline () -> bool {
    return SteamAPI_ISteamScreenshots_IsScreenshotsHooked(steam_screenshots);
}


SteamScreenshots_AddVRScreenshotToLibrary :: inline (eType: EVRScreenshotType, pchFilename: *char, pchVRFilename: *char) -> ScreenshotHandle {
    return SteamAPI_ISteamScreenshots_AddVRScreenshotToLibrary(steam_screenshots, eType, pchFilename, pchVRFilename);
}
