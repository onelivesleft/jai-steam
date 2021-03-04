// #scope_module @TODO namespace this?


STEAMCLIENT_INTERFACE_VERSION :: "SteamClient020";

SteamInternal_CreateInterface :: (version: *u8) -> *ISteamClient #foreign steam;

SteamAPI_SteamClient :: () -> *ISteamClient {
    return SteamInternal_CreateInterface(STEAMCLIENT_INTERFACE_VERSION);
}
