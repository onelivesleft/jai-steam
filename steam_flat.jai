// Direct, unadulterated flat wrapper of the Steamworks SDK.

// SteamAPI_Init must be called before using any other API functions. If it fails, an
// error message will be output to the debugger (or stderr) with further information.
SteamAPI_Init :: () -> bool {
	if SteamAPI_Init_Internal() {
		SteamAPI_ManualDispatch_Init(); // We have to use manual dispatch, so let's just always call this
		return true;
	}
	return false;
}

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
SteamAPI_RestartAppIfNecessary :: (unOwnAppID: uint32) -> bool #foreign steam;

// Many Steam API functions allocate a small amount of thread-local memory for parameter storage.
// SteamAPI_ReleaseCurrentThreadMemory() will free API memory associated with the calling thread.
// This function is also called automatically by SteamAPI_RunCallbacks(), so a single-threaded
// program never needs to explicitly call this function.
SteamAPI_ReleaseCurrentThreadMemory :: () #foreign steam;



// crash dump recording functions
SteamAPI_WriteMiniDump :: (uStructuredExceptionCode: uint32, pvExceptionInfo: *void, uBuildID: uint32) #foreign steam;
SteamAPI_SetMiniDumpComment :: (pchMsg: *char) #foreign steam;

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
SteamAPI_SetTryCatchCallbacks :: (bTryCatchCallbacks:  bool) #foreign steam;

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
/**
```c++
	HSteamPipe hSteamPipe = SteamAPI_GetHSteamPipe(); // See also SteamGameServer_GetHSteamPipe()
	SteamAPI_ManualDispatch_RunFrame( hSteamPipe )
	CallbackMsg_t callback;
	while ( SteamAPI_ManualDispatch_GetNextCallback( hSteamPipe, &callback ) )
	{
		// Check for dispatching API call results
		if ( callback.m_iCallback == SteamAPICallCompleted_t::k_iCallback )
		{
			SteamAPICallCompleted_t *pCallCompleted = (SteamAPICallCompleted_t *)callback->m_pubParam;
			void *pTmpCallResult = malloc( pCallCompleted->m_cubParam );
			bool bFailed;
			if ( SteamAPI_ManualDispatch_GetAPICallResult( hSteamPipe, pCallCompleted->m_hAsyncCall, pTmpCallResult, pCallCompleted->m_cubParam, pCallCompleted->m_iCallback, &bFailed ) )
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
```
*/
//----------------------------------------------------------------------------------------------------------------------------------------------------------//


SteamAPI_ManualDispatch_Init :: () #foreign steam;

/// Perform certain periodic actions that need to be performed.
SteamAPI_ManualDispatch_RunFrame :: (hSteamPipe: HSteamPipe) #foreign steam;

/// Fetch the next pending callback on the given pipe, if any.  If a callback is available, true is returned
/// and the structure is populated.  In this case, you MUST call SteamAPI_ManualDispatch_FreeLastCallback
/// (after dispatching the callback) before calling SteamAPI_ManualDispatch_GetNextCallback again.
SteamAPI_ManualDispatch_GetNextCallback :: (hSteamPipe: HSteamPipe, pCallbackMsg: *CallbackMsg_t) -> bool #foreign steam;

/// You must call this after dispatching the callback, if SteamAPI_ManualDispatch_GetNextCallback returns true.
SteamAPI_ManualDispatch_FreeLastCallback :: (hSteamPipe: HSteamPipe) #foreign steam;

/// Return the call result for the specified call on the specified pipe.  You really should
/// only call this in a handler for SteamAPICallCompleted_t callback.
SteamAPI_ManualDispatch_GetAPICallResult :: (hSteamPipe: HSteamPipe, hSteamAPICall: SteamAPICall_t, pCallback: *void, cubCallback: int, iCallbackExpected: int, pbFailed: *bool) -> bool #foreign steam;



// Jai additions not in the standard Steamworks API follow


/**
# Callback Message Loop

You can process the callback message loop using a `for`, by looping on
either `SteamAPI_Callbacks` or `SteamGameServer_Callbacks`.

For example:
```
for message, is_call_result: SteamAPI_Callbacks {
	if is_call_result {
		print("\nHandling call result %\n", formatInt(message.caller, base=16));
		if message.call_result_id == {
			case .NumberOfCurrentPlayers_t;
			if !message.io_failure {
				number_of_current_players := << cast(*NumberOfCurrentPlayers_t) messa`ge.data;
				if number_of_current_players.m_bSuccess`
					print("Num Players: %\n", number_of_current_players.m_cPlayers);
				else
					print("Failed to get Num Players\n");
			}
			else {
				print("IO Failure while trying to get Num Players\n");
			}
		}
	}
	else {
		if message.callback_id == {
			case .GameOverlayActivated_t;
			info := cast(*GameOverlayActivated_t) messa`ge.data;
			print("\n---\nOverlay active: %\n", cast(bo`ol) info.m_bActive);
			steam_userstats := SteamAPI_SteamUserStats_v012();
			handle := SteamAPI_ISteamUserStats_GetNumberOfCurrentPlayers(steam_userstats);
			print("Requesting #players, handle = %\n", formatInt(handle, base=16));
		}
	}
}
```
*/


SteamAPI_CallbackMessage :: struct {
	union {
		m_iCallback : s32;
		callback_id : CallbackID;
		call_result_id : CallResultID;
	}
	union {
		m_hAsyncCall : SteamAPICall_t;
		caller :  SteamAPICall_t;
	}
	data : *void;
	callback : *CallbackMsg_t;
	call_result : *SteamAPICallCompleted_t;
	io_failure : bool;
}

SteamAPI_GetHSteamPipe :: () -> HSteamPipe #foreign steam;
SteamGameServer_GetHSteamPipe :: ()  -> HSteamPipe #foreign steam;


SteamAPI_Callbacks : SteamAPI_Callbacks_Type;

for_expansion :: (_: *SteamAPI_Callbacks_Type, body: Code, flags: For_Flags) #expand {
	#assert(flags == 0); // no options are supported

	`it : SteamAPI_CallbackMessage;
	`it_index : bool;

	steam_pipe := SteamAPI_GetHSteamPipe();

	for_expansion_message_loop(steam_pipe, body);
}


SteamGameServer_Callbacks : SteamGameServer_Callbacks_Type;

for_expansion :: (_: *SteamGameServer_Callbacks_Type, body: Code, flags: For_Flags) #expand {
	#assert(flags == 0); // no options are supported

	`it : SteamAPI_CallbackMessage;
	`it_index : bool;

	steam_pipe := SteamGameServer_GetHSteamPipe();

	for_expansion_message_loop(steam_pipe, body);
}


#scope_module


for_expansion_message_loop :: (steam_pipe: HSteamPipe, body: Code) #expand {
	SteamAPI_ManualDispatch_RunFrame(steam_pipe);

	callback: CallbackMsg_t;

	while SteamAPI_ManualDispatch_GetNextCallback(steam_pipe, *callback) {
		defer SteamAPI_ManualDispatch_FreeLastCallback(steam_pipe);

		if callback.m_iCallback == SteamAPICallCompleted_t.k_iCallback {
			completed_call_result := cast(*SteamAPICallCompleted_t) callback.m_pubParam;

			call_result : *void;
			#if use_temporary_storage
				call_result = temporary_alloc(completed_call_result.m_cubParam);
			else
				call_result = alloc(completed_call_result.m_cubParam);

			io_failure := false;
			if SteamAPI_ManualDispatch_GetAPICallResult(
				steam_pipe, completed_call_result.m_hAsyncCall, call_result, completed_call_result.m_cubParam, completed_call_result.m_iCallback, *io_failure)
			{
				`it.m_iCallback = completed_call_result.m_iCallback;
				`it.m_hAsyncCall = completed_call_result.m_hAsyncCall;
				`it.data = call_result;
				`it.callback = *callback;
				`it.call_result = completed_call_result;
				`it.io_failure = io_failure;
				`it_index = true;

				#insert (break = #assert(false)) body;
			}

			#if !use_temporary_storage  free(call_result);
		}
		else {
			`it.m_iCallback = callback.m_iCallback;
			`it.data = callback.m_pubParam;
			`it.callback = *callback;
			`it_index = false;

			#insert (break = #assert(false)) body;
		}
	}
}


SteamAPI_Callbacks_Type :: struct {}
SteamGameServer_Callbacks_Type :: struct {}

SteamAPI_Init_Internal :: () -> bool #foreign steam "SteamAPI_Init";


#if OS == .WINDOWS {
    steam :: #foreign_library "lib/win/steam_api64";
} else #if OS == .MACOS {
    steam :: #foreign_library "lib/mac/libsteam_api";
} else #if OS == .LINUX {
    steam :: #foreign_library "lib/linux/libsteam_api";
}

#import "Basic";

#load "src-autogen/api_flat.jai";
