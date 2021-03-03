// Nice, remapped wrapper of Steam SDK.

// @TODO string overloads for *char procs


#scope_module


verbose := false;


Steam_Init :: (debug := false) -> success: bool {
    verbose = debug;
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

	SteamAPI_RegisterCallback(overlay_activated);

    return true;
}


Steam_Shutdown :: () {
    SteamAPI_Shutdown();
}


#if OS == .WINDOWS {
    steam :: #foreign_library "lib/win/steam_api64";
} else #if OS == .MACOS {
    steam :: #foreign_library "lib/mac/libsteam_api";
} else #if OS == .LINUX {
    steam :: #foreign_library "lib/linux/libsteam_api";
}

#load "src/steam_types.jai";
#load "src/steam_client_header.jai";
#load "src/steam_api_internal.jai";
#load "src-autogen/api_flat_procs.jai";
#load "src-autogen/api_flat_types.jai";
#load "src-autogen/partial_steam_assignments.jai";
#load "src-autogen/partial_steam_loads.jai";
#load "src-autogen/steam_client.jai";
#load "src-autogen/steam_api.jai";

#import "Basic";
#import "Hash_Table";


// copypasta below, just leave it alone for now (it provides the remaining top-level procs)


// SteamAPI_Init must be called before using any other API functions. If it fails, an
// error message will be output to the debugger (or stderr) with further information.
SteamAPI_Init :: () -> bool #foreign steam;

// SteamAPI_Shutdown should be called during process shutdown if possible.
SteamAPI_Shutdown :: () #foreign steam;

// SteamAPI_RestartAppIfNecessary ensures that your executable was launched through Steam.
//
// Returns true if the current process should terminate. Steam is now re-launching your application.
//
// Returns false if no action needs to be taken. This means that your executable was started through
// the Steam client, or a steam_appid.txt file is present in your game's directory (for development).
// Your current process should continue if false is returned.
//
// NOTE: If you use the Steam DRM wrapper on your primary executable file, this check is unnecessary
// since the DRM wrapper will ensure that your application was launched properly through Steam.
SteamAPI_RestartAppIfNecessary :: (unOwnAppID: uint32) -> bool #foreign steam; // @TODO

// Many Steam API functions allocate a small amount of thread-local memory for parameter storage.
// SteamAPI_ReleaseCurrentThreadMemory() will free API memory associated with the calling thread.
// This function is also called automatically by SteamAPI_RunCallbacks(), so a single-threaded
// program never needs to explicitly call this function.
SteamAPI_ReleaseCurrentThreadMemory :: () #foreign steam;  // @TODO



// crash dump recording functions
SteamAPI_WriteMiniDump :: (uStructuredExceptionCode: uint32, pvExceptionInfo: *void, uBuildID: uint32) #foreign steam;  // @TODO
SteamAPI_SetMiniDumpComment :: (pchMsg: *char) #foreign steam;  // @TODO

//----------------------------------------------------------------------------------------------------------------------------------------------------------//
//	steamclient.dll private wrapper functions
//
//	The following functions are part of abstracting API access to the steamclient.dll, but should only be used in very specific cases
//----------------------------------------------------------------------------------------------------------------------------------------------------------//

// SteamAPI_IsSteamRunning() returns true if Steam is currently running
SteamAPI_IsSteamRunning :: () -> bool #foreign steam;

// returns the filename path of the current running Steam process, used if you need to load an explicit steam dll by name.
// DEPRECATED - implementation is Windows only, and the path returned is a UTF-8 string which must be converted to UTF-16 for use with Win32 APIs
SteamAPI_GetSteamInstallPath :: () -> *char #foreign steam;

// sets whether or not Steam_RunCallbacks() should do a try {} catch (...) {} around calls to issuing callbacks
// This is ignored if you are using the manual callback dispatch method
SteamAPI_SetTryCatchCallbacks :: (bTryCatchCallbacks:  bool) #deprecated #foreign steam;

// this should be called before the game initialized the steam APIs
// pchDate should be of the format "Mmm dd yyyy" (such as from the __ DATE __ macro )
// pchTime should be of the format "hh:mm:ss" (such as from the __ TIME __ macro )
// bFullMemoryDumps (Win32 only) -- writes out a uuid-full.dmp in the client/dumps folder
// pvContext-- can be NULL, will be the void * context passed into m_pfnPreMinidumpCallback
// PFNPreMinidumpCallback m_pfnPreMinidumpCallback   -- optional callback which occurs just before a .dmp file is written during a crash.  Applications can hook this to allow adding additional information into the .dmp comment stream.
SteamAPI_UseBreakpadCrashHandler :: (pchVersion: *char, pchDate: *char, pchTime: *char,  bFullMemoryDumps: bool, pvContext: *void, m_pfnPreMinidumpCallback: PFNPreMinidumpCallback) #foreign steam;
SteamAPI_SetBreakpadAppID :: (unAppID: uint32) #foreign steam;



//----------------------------------------------------------------------------------------------------------------------------------------------------------//
//
// Manual callback loop
//
// An alternative method for dispatching callbacks.  Similar to a windows message loop.
//
// If you use the manual callback dispatch, you must NOT use:
//
// - SteamAPI_RunCallbacks or SteamGameServer_RunCallbacks
// - STEAM_CALLBACK, CCallResult, CCallback, or CCallbackManual
//
// Here is the basic template for replacing SteamAPI_RunCallbacks() with manual dispatch
/*
```c++
HSteamPipe hSteamPipe = SteamAPI_GetHSteamPipe(); // See also SteamGameServer_GetHSteamPipe()
SteamAPI_ManualDispatch_RunFrame( hSteamPipe )
CallbackMsg_t callback;
while ( SteamAPI_ManualDispatch_GetNextCallback( hSteamPipe, &callback ) )
{
	// Check for dispatching API call results
	if ( callback.m_iCallback == SteamAPICallCompleted_t::k_iCallback )
	{
		SteamAPICallCompleted_t *pCallCompleted = (SteamAPICallCompleted_t *)callback.
		void *pTmpCallResult = malloc( pCallback->m_cubParam );
		bool bFailed;
		if ( SteamAPI_ManualDispatch_GetAPICallResult(
			hSteamPipe, pCallCompleted->m_hAsyncCall, pTmpCallResult, pCallback->m_cubParam, pCallback->m_iCallback, &bFailed ) )
		{
			// Dispatch the call result to the registered handler(s) for the
			// call identified by pCallCompleted->m_hAsyncCall
		}
		free( pTmpCallResult );
	}
	else
	{
		// Look at callback.m_iCallback to see what kind of callback it is,
		// and dispatch to appropriate handler(s)
	}
	SteamAPI_ManualDispatch_FreeLastCallback( hSteamPipe );
}

typedef unsigned long long SteamAPICall_t;

struct SteamAPICallCompleted_t
{
	enum { k_iCallback = k_iSteamUtilsCallbacks + 3 };
	SteamAPICall_t m_hAsyncCall;
	int m_iCallback;
	uint32 m_cubParam;
};

struct CallbackMsg_t
{
	HSteamUser m_hSteamUser; // Specific user to whom this callback applies.
	int m_iCallback; // Callback identifier.  (Corresponds to the k_iCallback enum in the callback structure.)
	uint8 *m_pubParam; // Points to the callback structure
	int m_cubParam; // Size of the data pointed to by m_pubParam
};
```
*/
/**
```
SteamAPICall_t : u64;

SteamAPICallCompleted_t :: struct {
    k_iCallback : s32 : 703;       	//@TODO change to CallbackID (s32 enum)
    m_hAsyncCall : SteamAPICall_t;
    m_iCallback : s32;				//@TODO change to CallbackID (s32 enum)
    m_cubParam : uint32;
}

CallbackMsg_t :: struct {
	m_hSteamUser : HSteamUser;
	m_iCallback  : s32;         	//@TODO change to CallbackID (s32 enum)
	m_pubParam   : *uint8;
	m_cubParam   : s32;
};
```
*/
//----------------------------------------------------------------------------------------------------------------------------------------------------------//


run_callbacks :: (steam_pipe: HSteamPipe) {
	SteamAPI_ManualDispatch_RunFrame(steam_pipe);

	callback: CallbackMsg_t;
	while SteamAPI_ManualDispatch_GetNextCallback(steam_pipe, *callback) {
		defer SteamAPI_ManualDispatch_FreeLastCallback(steam_pipe);

		if callback.m_iCallback == SteamAPICallCompleted_t.k_iCallback { // is a call result
			completed_call_result := cast(*SteamAPICallCompleted_t) callback.m_pubParam;
			call_result : *void;
			#if use_temporary_storage
				call_result = temporary_alloc(completed_call_result.m_cubParam);
			else
				call_result = alloc(completed_call_result.m_cubParam);

			failed := false;
			if SteamAPI_ManualDispatch_GetAPICallResult(
				steam_pipe, completed_call_result.m_hAsyncCall, call_result, completed_call_result.m_cubParam, completed_call_result.m_iCallback, *failed)
			{
				// @TODO
				// Dispatch the call result to the registered handler(s) for the
				// call identified by completed_call_result->m_hAsyncCall
				//if completed_call_result.m_iCallback == NumberOfCurrentPlayers_t.k_iCallback
				//	print("% %\n", formatStruct(<<cast(*NumberOfCurrentPlayers_t) call_result, use_long_form_if_more_than_this_many_members=-1, use_newlines_if_long_form=true), failed);
				//else if completed_call_result.m_iCallback == GlobalStatsReceived_t.k_iCallback
				//	print("% %\n", formatStruct(<<cast(*GlobalStatsReceived_t) call_result, use_long_form_if_more_than_this_many_members=-1, use_newlines_if_long_form=true), failed);
			}

			#if !use_temporary_storage  free(call_result);
		}
		else {
			// @TODO
			// Look at callback.m_iCallback to see what kind of callback it is,
			// and dispatch to appropriate handler(s)
			//print("%\n", callback);
			if cast(CallbackID) callback.m_iCallback == {
				case .GameOverlayActivated_t;    for Callbacks.GameOverlayActivated_t   it(<<cast(*GameOverlayActivated_t) callback.m_pubParam);
				case .LobbyKicked_t;    for Callbacks.LobbyKicked_t   it(<<cast(*LobbyKicked_t) callback.m_pubParam);
				case .LobbyCreated_t;	for Callbacks.LobbyCreated_t  it(<<cast(*LobbyCreated_t) callback.m_pubParam);
			}
		}
	}
}

CallbackID :: enum s32 {
	GameOverlayActivated_t :: 331;
    LobbyKicked_t  :: 512;
    LobbyCreated_t :: 513;
}

Callbacks : struct {
	GameOverlayActivated_t : [..] GameOverlayActivated_t_Callback;
    LobbyKicked_t  : [..] LobbyKicked_t_Callback;
    LobbyCreated_t : [..] LobbyCreated_t_Callback;
}

GameOverlayActivated_t_Callback :: #type(GameOverlayActivated_t);
LobbyKicked_t_Callback :: #type(LobbyKicked_t);
LobbyCreated_t_Callback :: #type(LobbyCreated_t);


overlay_activated :: (info: GameOverlayActivated_t) {
	print("%\n", info);
} @SteamCallback


SteamAPI_RegisterCallback :: (callback: (GameOverlayActivated_t) -> ()) {
	array_add(*Callbacks.GameOverlayActivated_t, callback);
}

SteamAPI_RegisterCallback :: (callback: (LobbyKicked_t) -> ()) {
	array_add(*Callbacks.LobbyKicked_t, callback);
}

SteamAPI_RegisterCallback :: (callback: (LobbyCreated_t) -> ()) {
	array_add(*Callbacks.LobbyCreated_t, callback);
}

/**
```
SteamAPI_RegisterCallback(overlay_activated);

```
*/

SteamAPI_RunCallbacks :: () {
	steam_pipe := SteamAPI_GetHSteamPipe();
	run_callbacks(steam_pipe);
}


SteamGameServer_RunCallbacks :: () {
	steam_pipe := SteamGameServer_GetHSteamPipe();
	run_callbacks(steam_pipe);
}


SteamAPI_ManualDispatch_Init :: () #foreign steam;

/// Perform certain periodic actions that need to be performed.
SteamAPI_ManualDispatch_RunFrame :: (hSteamPipe: HSteamPipe) #foreign steam;

/// Fetch the next pending callback on the given pipe, if any.  If a callback is available, true is returned
/// and the structure is populated.  In this case, you MUST call SteamAPI_ManualDispatch_FreeLastCallback
/// (after dispatching the callback) before calling SteamAPI_ManualDispatch_GetNextCallback again.
SteamAPI_ManualDispatch_GetNextCallback :: (hSteamPipe: HSteamPipe, pCallbackMsg: *CallbackMsg_t) -> bool #foreign steam;  // @TODO

/// You must call this after dispatching the callback, if SteamAPI_ManualDispatch_GetNextCallback returns true.
SteamAPI_ManualDispatch_FreeLastCallback :: (hSteamPipe: HSteamPipe) #foreign steam;  // @TODO

/// Return the call result for the specified call on the specified pipe.  You really should
/// only call this in a handler for SteamAPICallCompleted_t callback.
SteamAPI_ManualDispatch_GetAPICallResult :: (hSteamPipe: HSteamPipe, hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: int, iCallbackExpected: int, pbFailed: *bool) -> bool #foreign steam;  // @TODO
