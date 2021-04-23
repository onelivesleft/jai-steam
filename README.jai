/**
# Jai-Steam v1.51.0

## Jai Wrapper for Steamworks SDK v1.51

* Standard Use
* Build Script
* Flat API
* Module Parameters

## Standard Use

By default Jai-Steam will make accessing the Steamworks API as simple as possible; it will handle the internal classes and give you easy access to callbacks and Call Results.

To use it you should call these things:

* `InitSteam()` when your program starts.
* `RunCallbacks()` periodically, ideally more often than 10Hz.  Usually you call this once per game loop.
* `ShutdownSteam(timeout = 0.0) -> bool` as your program exits.  If you provide an optional `timeout` in seconds then should there be are any outstanding `CallResults` awaiting resolution, the shutdown will be delayed for up to that duration to give them a chance to finish.  This will return true if the shutdown occurred cleanly - either because there were no `CallResults` outstanding when it was called, or because any such `CallResults` managed to resolve within the `timeout` period.

Example:
```jai
#import "Steam";

main :: () {
    init_steam := InitSteam();
    if !init_steam  log_error("Failed to initialize Steam");

    should_quit := false;
    while !should_quit {
        RunCallbacks();

        // ...game loop...
    }

    shutdown_cleanly := ShutdownSteam(3.0);
    if !shutdown_cleanly  log_error("Failed to finish up cleanly!");
}
```

### Callbacks

Callbacks in Steam provide simple asynchronous actions.  You register a callback by writing the proc for it and tagging it with the `@SteamCallback` annotation (though see note below).

Example:
```jai
overlay_activated :: (info: GameOverlayActivated_t) {
    active := cast(bool) info.m_bActive;
    if active {
        paused_before_overlay = paused;
        set_pause(true);
    }
    else if !paused_before_overlay
        set_pause(false);
} @SteamCallback
```

All actionable callbacks will run whenever you call `RunCallbacks()`.

* To enable tagging callbacks with `@SteamCallback` you must utilize this module in your build script (see `Build Script` below) and also add `#insert SteamCallbacks` after your call to `InitSteam()`


Alternatively, you may manually bind Callbacks by using the `RegisterCallback` procedure.

Example:
```jai
main :: () {
    // ...

    RegisterCallback(overlay_activated);

    // *or*

    RegisterCallback((info: GameOverlayActivated_t) -> () {
        active := cast(bool) info.m_bActive;
        if active {
            paused_before_overlay = paused;
            set_pause(true);
        }
        else if !paused_before_overlay
            set_pause(false);
    });

    // ...
}
```

### Call Results

`Call Results` are how the Steamworks API gives you access to data asynchronously.  Unlike callbacks, which are bound for the duration of your program, a Call Result will fire once with the data you have requested.

The simplest way to use a call result is to append a lambda to the API function.

@TODO Macro version, check return value

Example:
```jai
main :: () {
    // ...

    GetNumberOfCurrentPlayers((result: NumberOfCurrentPlayers_t, io_failure: bool) {
        if !io_failure {
            if (result.m_bSuccess)
                print("Num Players: %\n", result.m_cPlayers);
            else
                print("Failed to get Num Players\n");
        }
        else {
            print("IO Failure while trying to get Num Players\n");
        }
    });

    // ...
}
```

Alternatively, you can call the function as the API docs describe, then register the returned handle manually.

Example:
```jai
main :: () {
    // ...

    handle := GetNumberOfCurrentPlayers();
    RegisterCallResult(handle, process_num_players); // you could put a lambda in here instead if you wanted

    // ...
}

process_num_players ::  (result: NumberOfCurrentPlayers_t, io_failure: bool) {
    if !io_failure {
        if (result.m_bSuccess)
            print("Num Players: %\n", result.m_cPlayers);
        else
            print("Failed to get Num Players\n");
    }
    else {
        print("IO Failure while trying to get Num Players\n");
    }
});

```


## Build Script

In order to utilize some of the features provided by this module you must use a build script to control the compilation of your program, and include a couple of steps specific to this module.  These steps are:

* You must import this module with the `building` module parameter enabled.
* You must send each compiler message to the `steam_build_step` procedure.

Here is a simple example build script which includes the necessary lines for this module (marked with `// <-`):

* Set `your_jai` to your main program file, and `your_exe` to the output exe name.
* Compile with `jai build.jai`

`build.jai`:
```
#import "Steam"(building = true);  // <-
#import "Compiler";

your_jai :: "game.jai";
your_exe :: "game.exe";
path_to_exe :: ".";

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
        if !message continue;
        if message.workspace != workspace continue;
        if message.kind == .COMPLETE break;

        steam_build_step(message); // <-
    }

    compiler_end_intercept(workspace);
}
```

Doing this will enable:

* Tagging callback procs with @SteamCallback to automatically register them.

*/
