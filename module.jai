// Jai wrapper for `Steamworks SDK v1.50`


#module_parameters(
    use_flat_api := false,         // Gives direct access to the equivalent of steam_api_flat.h, if you want direct control over everything.
    use_temporary_storage := true  // Set to false if you don't plan on calling `reset_temporary_storage`
);


#if use_flat_api
    #load "steam_flat.jai";
else
    #load "steam.jai";


// TODO
// [ ] Change internal flat names: SteamAPI_ISteamClient_GetISteamGenericInterface -> SteamClient_GetISteamGenericInterface
// [ ] Change flat names: SteamAPI_ISteamClient_GetISteamGenericInterface -> GetISteamGenericInterface
// [ ] Singleton names to short name
// [ ] Fix up scopes - rework away from structs.  Maybe keep structs for Init/Shutdown stuff
// [ ] @SteamCallback for callbacks in nice api
// [ ] CallResult macro in nice api
// [ ] CallResult proc with function in nice api
// [.] Hide types inside module scope and/or Steam namespace
// [.] Callbacks
// [x] for_expansion for callback event loop in flat api
// [x] Non-constructed "classes"
// [x] Additional instances of singletons
