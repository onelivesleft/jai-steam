# Jai-Steam v1.51.0

## Jai Wrapper for Steamworks SDK v1.51

* Standard Use
* Build Script
* Flat API
* Module Parameters

## Standard Use

By default Jai-Steam will make accessing the Steamworks API as simple as possible; it will handle the internal classes and give you easy access to callbacks and Call Results.

You are expected to compile it with a build script (which will automate the registration of callbacks); see the section below on how to do this.  If you do not want to use a build script, you muse tell the module so when you import it, by setting the `has_build_script` module parameter to false.

Using this module requires a few steps, but is fairly simple.  You need to call these procedures:

* `InitSteam()` when your program starts.
* `RunCallbacks()` periodically, ideally more often than 10Hz.  Usually you call this once per game loop.
* `ShutdownSteam(timeout = 0.0) -> bool` as your program exits.  If you provide an optional `timeout` in seconds then should there be are any outstanding `CallResults` awaiting resolution, the shutdown will be delayed for up to that duration to give them a chance to finish.  This will return true if the shutdown occurred cleanly - either because there were no `CallResults` outstanding when it was called, or because any such `CallResults` managed to resolve within the `timeout` period.  There are ways you can find out what is outstanding and clear them manually which will be detailed later.

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

* To enable tagging callbacks with `@SteamCallback` you must utilize this module in your build script (see `Build Script` below).


Alternatively, you may manually bind Callbacks by using the `RegisterCallback` procedure.

Example:
```jai
main :: () {
    // ...

    RegisterCallback(overlay_activated);  // overlay_activated defined elsewhere

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

The easy ways of using a call result are by either appending a lambda or a code block to the relevant procedure.  Which you use is a matter of taste.

Example:
```jai
player_count := 0;

main :: () {
    // ...

    // Call using a lambda
    GetNumberOfCurrentPlayers((result: NumberOfCurrentPlayers_t, io_failure: bool) {
        if !io_failure {
            if (result.m_bSuccess)
                player_count = result.m_cPlayers;
            else
                log_error("Failed to get Num Players\n");
        }
        else {
            log_error("IO Failure while trying to get Num Players\n");
        }
    });

    // Call using a code block
    GetNumberOfCurrentPlayers(#code {
        if !io_failure {
            if (result.m_bSuccess)
                `player_count = result.m_cPlayers; // notice the backtick
            else
                log_error("Failed to get Num Players\n");
        }
        else {
            log_error("IO Failure while trying to get Num Players\n");
        }
    });

    // ...
}
```

All call result callbacks have the same pattern of parameters: a result of the type of the call result, and an io_failure bool.  When you use the code block version these are standardized in name as `result` and `io_failure`.

Notice that to access the global variable `player_count` in the code block it must be backticked: this is true for any name in your game you wish to access outwith the Steam library codebase.  Thus the trade-off between using the lambda form and the code block form is the former requires you to specify the parameter list (including the call result type), while the latter requires you to backtick any game variables you use.

Alternatively, you can call the function without any additional parameters, in which case it will not be registered with the callback system automatically; you will have to do it yourself:

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
            player_count = result.m_cPlayers;
        else
            log_error("Failed to get Num Players\n");
    }
    else {
        log_error("IO Failure while trying to get Num Players\n");
    }
});

```

Whichever form you use, the procedure will always return the call result handle when successful (and some Steam calls use this as an error code, where 0 means the call was unsuccessful).

*Note: Do not use the lambda/code block form and then register the call result handle manually - it will fire twice!*


## Build Script

### Not using a build script

If you do not wish to use a build script or perform the steps described below then you must notify the Steam module that that is the case, so it knows not to try to insert the code which would have been generated.  You do this by setting the `has_build_script` module parameter to `false`.

i.e. in your game:

```
#import "Steam"(has_build_script = false);
// ...
```

### Using a build script

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



