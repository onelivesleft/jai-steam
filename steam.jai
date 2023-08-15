// Standard Jai wrapper of `Steamworks SDK`
//
// Handles a lot of book-keeping for you; if you want full control then set the
// `use_flat_api` module parameter, and switch to reading `steam_flat.jai`
// (though if you just want to splash in the raw calls to handle edge cases you
//  might want `expose_raw_calls` instead.)


// `InitSteam` must be called before using any other API functions. If it fails, an
// error message will be output to the debugger (or stderr) with further information.
// If you are not using a build script (which is required to automate registering callbacks)
// then you must import this module with `has_build_script = false`, or it will be unable to find
// the generated string code block.

InitSteam :: () -> success: bool #expand {
	success := Steam_Init();
	// You need to compile via a build script to enable code generation for callbacks (see documentation). If you do not wish to do that then you need to set the `has_build_script` module parameter to false so that the module knows it can skip inserting the callback code it is not able to generate.
	#if has_build_script
		#insert `Cannot_Generate_This_Codeblock_Without_A_Build_Script;
	return success;
}


// `ShutdownSteam` should be called during process shutdown if possible.
// If you specify the optional `timeout` parameter then it will wait that long for
// any outstanding CallResults to complete.

ShutdownSteam :: (timeout : float64 = 0) -> clean: bool{
	if timeout {
		end_time := get_time() + timeout;
		while get_time() < end_time && (awaiting_call_results(steam_pipe) || awaiting_call_results(steam_server_pipe)) {
			sleep_milliseconds(10);
			RunCallbacks();
		}
	}

	clean := !(awaiting_call_results(steam_pipe) || awaiting_call_results(steam_server_pipe));

	SteamAPI_Shutdown();

	return clean;
}


// `RunCallbacks` dispatches all available callbacks.  It's best to call this at >10Hz, the more time between
// calls, the more potential latency between receiving events or results from the Steamworks API.
// Most games call this once per render-frame.

// Note that `RunCallbacks` and `ServerRuncallbacks` are part of the Jai Steam library, not foreign calls
// to the steam DLL.

// You may designate callback procs with the `@SteamCallback` annotation: to enable this feature you must
// do two things:
// 		1) In your build script, import this module with the `building` module parameter enabled, and
// 		   then call `steam_build_step(message)` for every compiler message.
//      2) Add `#insert SteamCallbacks` after your call to `InitSteam`.
// See `module.jai` for details.

// You may manually register a callback by calling `RegisterCallback(proc)`.

RunCallbacks :: () {
	run_callbacks(steam_pipe, false);
	SteamAPI_ReleaseCurrentThreadMemory();
}

ServerRunCallbacks :: () {
	run_callbacks(steam_server_pipe, true);
	SteamAPI_ReleaseCurrentThreadMemory();
}


// These will return the number of unhandled CallResults currently outstanding.
AwaitingCallResults :: () -> int {
	return awaiting_call_results(steam_pipe);
}

ServerAwaitingCallResults :: () -> int {
	return awaiting_call_results(server_steam_pipe);
}

// @TODO RemoveCallResult(handle), ServerRemoveCallResult(handle)


// You may query for specific outstanding CallResults using these:
GetCallResult :: (index: int) -> handle: SteamAPICall_t, callresult_type: s32 {
	handle, callresult_type := awaiting_call_results(steam_pipe, index);
	return handle, callresult_type;
}

ServerGetCallResult :: (index: int) -> handle: SteamAPICall_t, callresult_type: s32 {
	handle, callresult_type := awaiting_call_results(server_steam_pipe, index);
	return handle, callresult_type;
}


// `RestartAppIfNecessary` ensures that your executable was launched through Steam.
//
// Returns true if the current process should terminate. Steam is now re-launching your application.
//
// Returns false if no action needs to be taken. This means that your executable was started through
// the Steam client, or a steam_appid.txt file is present in your game's directory (for development).
// Your current process should continue if false is returned.
//
// NOTE: If you use the Steam DRM wrapper on your primary executable file, this check is unnecessary
// since the DRM wrapper will ensure that your application was launched properly through Steam.

RestartAppIfNecessary :: (unOwnAppID: uint32) -> required_restart: bool {
	return SteamAPI_RestartAppIfNecessary(unOwnAppID);
};


// Many Steam API functions allocate a small amount of thread-local memory for parameter storage.
// `ReleaseCurrentThreadMemory()` will free API memory associated with the calling thread.
// This function is also called automatically by `RunCallbacks()`, so a single-threaded
// program never needs to explicitly call this function.

ReleaseCurrentThreadMemory :: () {
	SteamAPI_ReleaseCurrentThreadMemory();
}


// Crash dump recording functions

WriteMiniDump :: (uStructuredExceptionCode: uint32, pvExceptionInfo: *void, uBuildID: uint32) {
	SteamAPI_WriteMiniDump(uStructuredExceptionCode, pvExceptionInfo, uBuildID);
}

SetMiniDumpComment :: (pchMsg: *char) {
	SteamAPI_SetMiniDumpComment(pchMsg);
}


//  ---------------------------------------------------------------------------------------------------------------------------------
//	The following functions are part of abstracting API access to the steamclient.dll, but should only be used in very specific cases
//  ---------------------------------------------------------------------------------------------------------------------------------


// `IsSteamRunning()` returns true if Steam is currently running

IsSteamRunning :: () -> is_running: bool {
	return SteamAPI_IsSteamRunning();
}


// This should be called before the game initialized the steam APIs
// `pchDate`				  should be of the format "Mmm dd yyyy" (such as from the __ DATE __ macro )
// `pchTime`				  should be of the format "hh:mm:ss" (such as from the __ TIME __ macro )
// `bFullMemoryDumps` 		  (Win32 only) writes out a uuid-full.dmp in the client/dumps folder
// `pvContext`				  can be NULL, will be the void * context passed into m_pfnPreMinidumpCallback
// `m_pfnPreMinidumpCallback` optional callback which occurs just before a .dmp file is written during a crash.
//                            Applications can hook this to allow adding additional information into the .dmp comment stream.

UseBreakpadCrashHandler :: (pchVersion: *char, pchDate: *char, pchTime: *char,  bFullMemoryDumps: bool, pvContext: *void, m_pfnPreMinidumpCallback: PFNPreMinidumpCallback) {
	SteamAPI_UseBreakpadCrashHandler(pchVersion, pchDate, pchTime,  bFullMemoryDumps, pvContext, m_pfnPreMinidumpCallback);
}

SetBreakpadAppID :: (unAppID: uint32) {
	SteamAPI_SetBreakpadAppID(unAppID);
}


#scope_module


Steam_Init :: () -> success: bool {
    success := SteamAPI_Init();
    if !success {
        if verbose {
            print(#string ___
Failed to init steam, this could be for one of the following reasons:
* The Steam client isn't running. A running Steam client is required to provide implementations of the various Steamworks interfaces.
* The Steam client couldn't determine the App ID of game. If you're running your application from the executable or debugger directly then you must have a steam_appid.txt in your game directory next to the executable, with your app ID in it and nothing else. Steam will look for this file in the current working directory. If you are running your executable from a different directory you may need to relocate the steam_appid.txt file.
* Your application is not running under the same OS user context as the Steam client, such as a different user or administration access level.
* Ensure that you own a license for the App ID on the currently active Steam account. Your game must show up in your Steam library.
* Your App ID is not completely set up, i.e. in Release State: Unavailable, or it's missing default packages.
            ___);
        }

        return false;
    }

    assign_all_singletons();

	SteamAPI_ManualDispatch_Init();

	steam_pipe = SteamAPI_GetHSteamPipe();
	steam_server_pipe = SteamGameServer_GetHSteamPipe();

    return true;
}



#if OS == .WINDOWS {
    steam :: #library "lib/win/steam_api64";
} else #if OS == .MACOS {
    steam :: #library "lib/mac/libsteam_api";
} else #if OS == .LINUX {
    steam :: #library "lib/linux/libsteam_api";
}


#import "Basic";
#import "Hash_Table";

#if expose_raw_calls
	#load "src-autogen/api_flat_procs_exposed.jai";
else
	#load "src-autogen/api_flat_procs_internal.jai";

#load "src/steam_types.jai";
#load "src/steam_client_header.jai";
#load "src-autogen/api_flat_types_internal.jai";
#load "src-autogen/partial_steam_assignments.jai";
#load "src-autogen/partial_steam_loads.jai";
#load "src-autogen/partial_steam_callbacks.jai";
#load "src-autogen/steam_client.jai";
#load "src-autogen/steam_api.jai";


// More detailed documentation about the following calls can be found in `steam_flat.jai`,
// but if you're using this version of the module you shouldn't need to worry about them.

SteamAPI_Init :: () -> bool #foreign steam;
SteamAPI_Shutdown :: () #foreign steam;
SteamAPI_RestartAppIfNecessary :: (unOwnAppID: uint32) -> bool #foreign steam;
SteamAPI_ReleaseCurrentThreadMemory :: () #foreign steam;
SteamAPI_WriteMiniDump :: (uStructuredExceptionCode: uint32, pvExceptionInfo: *void, uBuildID: uint32) #foreign steam;
SteamAPI_SetMiniDumpComment :: (pchMsg: *char) #foreign steam;
SteamAPI_IsSteamRunning :: () -> bool #foreign steam;
SteamAPI_UseBreakpadCrashHandler :: (pchVersion: *char, pchDate: *char, pchTime: *char,  bFullMemoryDumps: bool, pvContext: *void, m_pfnPreMinidumpCallback: PFNPreMinidumpCallback) #foreign steam;
SteamAPI_SetBreakpadAppID :: (unAppID: uint32) #foreign steam;
SteamAPI_ManualDispatch_Init :: () #foreign steam;
SteamAPI_ManualDispatch_RunFrame :: (hSteamPipe: HSteamPipe) #foreign steam;
SteamAPI_ManualDispatch_GetNextCallback :: (hSteamPipe: HSteamPipe, pCallbackMsg: *CallbackMsg_t) -> bool #foreign steam;
SteamAPI_ManualDispatch_FreeLastCallback :: (hSteamPipe: HSteamPipe) #foreign steam;
SteamAPI_ManualDispatch_GetAPICallResult :: (hSteamPipe: HSteamPipe, hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: int, iCallbackExpected: int, pbFailed: *bool) -> bool #foreign steam;

steam_pipe : HSteamPipe;
steam_server_pipe : HSteamPipe;

SteamAPI_GetHSteamPipe :: () -> HSteamPipe #foreign steam;
SteamGameServer_GetHSteamPipe :: ()  -> HSteamPipe #foreign steam;
