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


SteamScreenshots_WriteScreenshot :: inline (pubRGB: *void, cubRGB: uint32, nWidth: s32, nHeight: s32) -> ScreenshotHandle #foreign steam "SteamAPI_ISteamScreenshots_W {
    return SteamScreenshots_WriteScreenshot(steam_screenshots, pubRGB, cubRGB, nWidth, nHeight);
}


SteamScreenshots_AddScreenshotToLibrary :: inline (pchFilename: *char, pchThumbnailFilename: *char, nWidth: s32, nHeight: s32) -> ScreenshotHandle #foreign steam "SteamAPI_ISteamScreenshots_AddScree {
    return SteamScreenshots_AddScreenshotToLibrary(steam_screenshots, pchFilename, pchThumbnailFilename, nWidth, nHeight);
}


SteamScreenshots_TriggerScreenshot :: inline () {
    SteamScreenshots_TriggerScreenshot(steam_screenshots);
}


SteamScreenshots_HookScreenshots :: inline (bHook: bool) {
    SteamScreenshots_HookScreenshots(steam_screenshots, bHook);
}


SteamScreenshots_SetLocation :: inline (hScreenshot: ScreenshotHandle, pchLocation: *char) -> bool #foreign steam "SteamAPI_ISteamScreensho {
    return SteamScreenshots_SetLocation(steam_screenshots, hScreenshot, pchLocation);
}


SteamScreenshots_TagUser :: inline (hScreenshot: ScreenshotHandle, steamID: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamScree {
    return SteamScreenshots_TagUser(steam_screenshots, hScreenshot, steamID);
}


SteamScreenshots_TagPublishedFile :: inline (hScreenshot: ScreenshotHandle, unPublishedFileID: PublishedFileId_t) -> bool #foreign steam "SteamAPI_ISteamScreenshots_Ta {
    return SteamScreenshots_TagPublishedFile(steam_screenshots, hScreenshot, unPublishedFileID);
}


SteamScreenshots_IsScreenshotsHooked :: inline () -> bool #foreign steam "SteamAPI_ISteamScreenshots_IsScr {
    return SteamScreenshots_IsScreenshotsHooked(steam_screenshots);
}


SteamScreenshots_AddVRScreenshotToLibrary :: inline (eType: EVRScreenshotType, pchFilename: *char, pchVRFilename: *char) -> ScreenshotHandle #foreign steam "SteamAPI_ISteamScreenshots_AddVRScree {
    return SteamScreenshots_AddVRScreenshotToLibrary(steam_screenshots, eType, pchFilename, pchVRFilename);
}
