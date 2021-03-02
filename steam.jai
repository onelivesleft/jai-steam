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
#load "src-autogen/api_flat_procs.jai";
#load "src-autogen/api_flat_types.jai";
#load "src-autogen/partial_steam_assignments.jai";
#load "src-autogen/partial_steam_loads.jai";
#load "src-autogen/steam_client.jai";
#load "src-autogen/steam_api.jai";

#import "Basic";


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
SteamAPI_IsSteamRunning :: () -> bool #foreign steam;  // @TODO

// returns the filename path of the current running Steam process, used if you need to load an explicit steam dll by name.
// DEPRECATED - implementation is Windows only, and the path returned is a UTF-8 string which must be converted to UTF-16 for use with Win32 APIs
SteamAPI_GetSteamInstallPath :: () -> *char #foreign steam;  // @TODO

// sets whether or not Steam_RunCallbacks() should do a try {} catch (...) {} around calls to issuing callbacks
// This is ignored if you are using the manual callback dispatch method
SteamAPI_SetTryCatchCallbacks :: (bTryCatchCallbacks:  bool) #foreign steam;  // @TODO

// this should be called before the game initialized the steam APIs
// pchDate should be of the format "Mmm dd yyyy" (such as from the __ DATE __ macro )
// pchTime should be of the format "hh:mm:ss" (such as from the __ TIME __ macro )
// bFullMemoryDumps (Win32 only) -- writes out a uuid-full.dmp in the client/dumps folder
// pvContext-- can be NULL, will be the void * context passed into m_pfnPreMinidumpCallback
// PFNPreMinidumpCallback m_pfnPreMinidumpCallback   -- optional callback which occurs just before a .dmp file is written during a crash.  Applications can hook this to allow adding additional information into the .dmp comment stream.
SteamAPI_UseBreakpadCrashHandler :: (pchVersion: *char, pchDate: *char, pchTime: *char,  bFullMemoryDumps: bool, pvContext: *void, m_pfnPreMinidumpCallback: PFNPreMinidumpCallback) #foreign steam;  // @TODO
SteamAPI_SetBreakpadAppID :: (unAppID: uint32) #foreign steam;  // @TODO



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
			if ( SteamAPI_ManualDispatch_GetAPICallResult( hSteamPipe, pCallCompleted->m_hAsyncCall, pTmpCallResult, pCallback->m_cubParam, pCallback->m_iCallback, &bFailed ) )
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

*/
//----------------------------------------------------------------------------------------------------------------------------------------------------------//


SteamAPI_ManualDispatch_Init :: () #foreign steam;  // @TODO

/// Perform certain periodic actions that need to be performed.
SteamAPI_ManualDispatch_RunFrame :: (hSteamPipe: HSteamPipe) #foreign steam;  // @TODO

/// Fetch the next pending callback on the given pipe, if any.  If a callback is available, true is returned
/// and the structure is populated.  In this case, you MUST call SteamAPI_ManualDispatch_FreeLastCallback
/// (after dispatching the callback) before calling SteamAPI_ManualDispatch_GetNextCallback again.
SteamAPI_ManualDispatch_GetNextCallback :: (hSteamPipe: HSteamPipe, pCallbackMsg: *CallbackMsg_t) -> bool #foreign steam;  // @TODO

/// You must call this after dispatching the callback, if SteamAPI_ManualDispatch_GetNextCallback returns true.
SteamAPI_ManualDispatch_FreeLastCallback :: (hSteamPipe: HSteamPipe) #foreign steam;  // @TODO

/// Return the call result for the specified call on the specified pipe.  You really should
/// only call this in a handler for SteamAPICallCompleted_t callback.
SteamAPI_ManualDispatch_GetAPICallResult :: (hSteamPipe: HSteamPipe, hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: int, iCallbackExpected: int, pbFailed: *bool) -> bool #foreign steam;  // @TODO
