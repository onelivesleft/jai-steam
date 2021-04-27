// Jai wrapper for `Steamworks SDK`

JAI_STEAM_VERSION :: "1.51.0";

STEAMWORKS_SDK_VERSION        :: "1.51";
STEAMCLIENT_INTERFACE_VERSION :: "SteamClient020";


#module_parameters (
    use_flat_api := false,         // Gives direct access to the equivalent of `steam_api_flat.h`,
                                   // if you want direct control over everything.
                                   // For normal module usage leave this alone, and look at `steam.jai`.
                                   // If you set this, then look at `steam_flat.jai` instead.

    expose_raw_calls := false,     // You may not want to use the flat api, but find you want to use the raw
                                   // api calls directly.  Enabling this will expose them, to be used like this:
                                   // `SteamAPI_ISteamUser_GetHSteamUser(steam_user);`

    use_temporary_storage := true, // Set to false if you don't plan on calling `reset_temporary_storage`.

    building := false,             // Set to true when importing in your build file, then call `steam_build_step(message)`
                                   // for every compiler message.  See example build script below.

    has_build_script := true,     // If you're not using the flat api then you need to use a build script to
                                   // compile (see `building` above).  If you do not wish to do that then you need to
                                   // set this to false so that the module knows it can skip inserting the callback
                                   // code it is not able to generate.

    verbose := false               // When enabled extra debug output is displayed.
);


/**
# Example build script

* Set `your_jai` to your main program file, and `your_exe` to the output exe name.
* Compile with `jai build.jai`

`build.jai`:
```
#import "Steam"(building = true);
#import "Compiler";

your_jai :: "game.jai";
your_exe :: "game.exe";
path_to_exe :: "./";

#run {
    build_options := get_build_options();
    build_options.output_type = .NO_OUTPUT;
    set_build_options(build_options);

    build_options.output_type = .EXECUTABLE;
    build_options.output_executable_name = your_exe;
    build_options.output_path = path_to_exe;

    workspace := compiler_create_workspace();
    set_build_options(build_options, workspace);

    compiler_begin_intercept(workspace);

    add_build_file(your_jai, workspace);

    while true {
        message := compiler_wait_for_message();
        if !message || message.workspace != workspace continue;
        if message.kind == .COMPLETE break;

        steam_build_step(message);
    }

    compiler_end_intercept(workspace);
}
```
*/


#if building
    #load "src/build.jai";
else #if use_flat_api
    #load "steam_flat.jai";
else
    #load "steam.jai";


// TODO
// [ ] #must on functions?
// [ ] reverse callbackID lookup
// [.] Example game
// [.] Documentation
// [.] string overloads for *char procs : functions with *char + count could have a string overload?
// [x] CallResult macro in nice api
// [x] Callbacks
// [x] @SteamCallback for callbacks in nice api
// [x] CallResult proc with function in nice api
// [x] Change internal flat names: SteamAPI_ISteamClient_GetISteamGenericInterface -> SteamClient_GetISteamGenericInterface
// [x] Change flat names: SteamAPI_ISteamClient_GetISteamGenericInterface -> GetISteamGenericInterface
// [x] Singleton names to short name
// [x] Fix up scopes - rework away from structs.  Maybe keep structs for Init/Shutdown stuff
// [x] Hide types inside module scope and/or Steam namespace (Not doing this!)
// [x] for_expansion for callback event loop in flat api
// [x] Non-constructed "classes"
// [x] Additional instances of singletons
