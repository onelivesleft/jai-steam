#scope_module


SteamInternal_CreateInterface :: (version: *u8) -> *ISteamClient #foreign steam;

SteamAPI_SteamClient :: () -> *ISteamClient {
    return SteamInternal_CreateInterface(STEAMCLIENT_INTERFACE_VERSION);
}
