steam_screenshots : *ISteamScreenshots;


WriteScreenshot :: inline (pubRGB: *void, cubRGB: uint32, nWidth: s32, nHeight: s32) -> ScreenshotHandle {
    return SteamAPI_ISteamScreenshots_WriteScreenshot(steam_screenshots, pubRGB, cubRGB, nWidth, nHeight);
}


AddScreenshotToLibrary :: inline (pchFilename: *char, pchThumbnailFilename: *char, nWidth: s32, nHeight: s32) -> ScreenshotHandle {
    return SteamAPI_ISteamScreenshots_AddScreenshotToLibrary(steam_screenshots, pchFilename, pchThumbnailFilename, nWidth, nHeight);
}


TriggerScreenshot :: inline () {
    SteamAPI_ISteamScreenshots_TriggerScreenshot(steam_screenshots);
}


HookScreenshots :: inline (bHook: bool) {
    SteamAPI_ISteamScreenshots_HookScreenshots(steam_screenshots, bHook);
}


SetLocation :: inline (hScreenshot: ScreenshotHandle, pchLocation: *char) -> bool {
    return SteamAPI_ISteamScreenshots_SetLocation(steam_screenshots, hScreenshot, pchLocation);
}


TagUser :: inline (hScreenshot: ScreenshotHandle, steamID: uint64_steamid) -> bool {
    return SteamAPI_ISteamScreenshots_TagUser(steam_screenshots, hScreenshot, steamID);
}


TagPublishedFile :: inline (hScreenshot: ScreenshotHandle, unPublishedFileID: PublishedFileId_t) -> bool {
    return SteamAPI_ISteamScreenshots_TagPublishedFile(steam_screenshots, hScreenshot, unPublishedFileID);
}


IsScreenshotsHooked :: inline () -> bool {
    return SteamAPI_ISteamScreenshots_IsScreenshotsHooked(steam_screenshots);
}


AddVRScreenshotToLibrary :: inline (eType: EVRScreenshotType, pchFilename: *char, pchVRFilename: *char) -> ScreenshotHandle {
    return SteamAPI_ISteamScreenshots_AddVRScreenshotToLibrary(steam_screenshots, eType, pchFilename, pchVRFilename);
}
