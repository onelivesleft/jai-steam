Steam : Steam_Namespace;

Steam_ID :: u64;
App_ID :: AppId_t;


#scope_module


Steam_Namespace :: struct {
    Init :: Steam_Init;
    Shutdown :: Steam_Shutdown;
}


verbose := false;


Steam_Init :: (debug := false) -> success: bool {
    verbose = debug;
    success := SteamAPI_Init();
    if !success {
        if verbose {
            print(#string HELP
Failed to init steam, this could be for one of the following reasons:
* The Steam client isn't running. A running Steam client is required to provide implementations of the various Steamworks interfaces.
* The Steam client couldn't determine the App ID of game. If you're running your application from the executable or debugger directly then you must have a steam_appid.txt in your game directory next to the executable, with your app ID in it and nothing else. Steam will look for this file in the current working directory. If you are running your executable from a different directory you may need to relocate the steam_appid.txt file.
* Your application is not running under the same OS user context as the Steam client, such as a different user or administration access level.
* Ensure that you own a license for the App ID on the currently active Steam account. Your game must show up in your Steam library.
* Your App ID is not completely set up, i.e. in Release State: Unavailable, or it's missing default packages.
            HELP);
        }

        return false;
    }

    steam_applist                      = SteamAPI_SteamAppList_v001();
    steam_apps                         = SteamAPI_SteamApps_v008();
    steam_controller                   = SteamAPI_SteamController_v007();
    steam_friends                      = SteamAPI_SteamFriends_v017();
    steam_gamesearch                   = SteamAPI_SteamGameSearch_v001();
    steam_gameserver                   = SteamAPI_SteamGameServer_v013();
    steam_gameserverapps               = SteamAPI_SteamGameServerApps_v008();
    steam_gameserverhttp               = SteamAPI_SteamGameServerHTTP_v003();
    steam_gameserverinventory          = SteamAPI_SteamGameServerInventory_v003();
    steam_gameservernetworking         = SteamAPI_SteamGameServerNetworking_v006();
    steam_gameservernetworkingmessages = SteamAPI_SteamGameServerNetworkingMessages_v002();
    steam_gameservernetworkingsockets  = SteamAPI_SteamGameServerNetworkingSockets_v009();
    steam_gameserverstats              = SteamAPI_SteamGameServerStats_v001();
    steam_gameserverugc                = SteamAPI_SteamGameServerUGC_v014();
    steam_gameserverutils              = SteamAPI_SteamGameServerUtils_v010();
    steam_htmlsurface                  = SteamAPI_SteamHTMLSurface_v005();
    steam_http                         = SteamAPI_SteamHTTP_v003();
    steam_input                        = SteamAPI_SteamInput_v001();
    steam_inventory                    = SteamAPI_SteamInventory_v003();
    steam_matchmaking                  = SteamAPI_SteamMatchmaking_v009();
    steam_matchmakingservers           = SteamAPI_SteamMatchmakingServers_v002();
    steam_music                        = SteamAPI_SteamMusic_v001();
    steam_musicremote                  = SteamAPI_SteamMusicRemote_v001();
    steam_networking                   = SteamAPI_SteamNetworking_v006();
    steam_networkingmessages           = SteamAPI_SteamNetworkingMessages_v002();
    steam_networkingsockets            = SteamAPI_SteamNetworkingSockets_v009();
    steam_networkingutils              = SteamAPI_SteamNetworkingUtils_v003();
    steam_parentalsettings             = SteamAPI_SteamParentalSettings_v001();
    steam_parties                      = SteamAPI_SteamParties_v002();
    steam_remoteplay                   = SteamAPI_SteamRemotePlay_v001();
    steam_remotestorage                = SteamAPI_SteamRemoteStorage_v014();
    steam_screenshots                  = SteamAPI_SteamScreenshots_v003();
    steam_ugc                          = SteamAPI_SteamUGC_v014();
    steam_user                         = SteamAPI_SteamUser_v021();
    steam_userstats                    = SteamAPI_SteamUserStats_v012();
    steam_utils                        = SteamAPI_SteamUtils_v010();
    steam_video                        = SteamAPI_SteamVideo_v002();

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
#load "src-autogen/api_flat_procs.jai";
#load "src-autogen/api_flat_types.jai";

#load "src-autogen/steam_applist.jai";                       // @TODO
#load "src-autogen/steam_apps.jai";                          // @TODO
#load "src-autogen/steam_controller.jai";                    // @TODO
#load "src-autogen/steam_friends.jai";
#load "src-autogen/steam_gamesearch.jai";                    // @TODO
#load "src-autogen/steam_gameserver.jai";                    // @TODO
#load "src-autogen/steam_gameserverapps.jai";                // @TODO
#load "src-autogen/steam_gameserverhttp.jai";                // @TODO
#load "src-autogen/steam_gameserverinventory.jai";           // @TODO
#load "src-autogen/steam_gameservernetworking.jai";          // @TODO
#load "src-autogen/steam_gameservernetworkingmessages.jai";  // @TODO
#load "src-autogen/steam_gameservernetworkingsockets.jai";   // @TODO
#load "src-autogen/steam_gameserverstats.jai";               // @TODO
#load "src-autogen/steam_gameserverugc.jai";                 // @TODO
#load "src-autogen/steam_gameserverutils.jai";               // @TODO
#load "src-autogen/steam_htmlsurface.jai";                   // @TODO
#load "src-autogen/steam_http.jai";                          // @TODO
#load "src-autogen/steam_input.jai";
#load "src-autogen/steam_inventory.jai";                     // @TODO
#load "src-autogen/steam_matchmaking.jai";                   // @TODO
#load "src-autogen/steam_matchmakingservers.jai";            // @TODO
#load "src-autogen/steam_music.jai";                         // @TODO
#load "src-autogen/steam_musicremote.jai";                   // @TODO
#load "src-autogen/steam_networking.jai";                    // @TODO
#load "src-autogen/steam_networkingmessages.jai";            // @TODO
#load "src-autogen/steam_networkingsockets.jai";             // @TODO
#load "src-autogen/steam_networkingutils.jai";               // @TODO
#load "src-autogen/steam_parentalsettings.jai";              // @TODO
#load "src-autogen/steam_parties.jai";                       // @TODO
#load "src-autogen/steam_remoteplay.jai";                    // @TODO
#load "src-autogen/steam_remotestorage.jai";                 // @TODO
#load "src-autogen/steam_screenshots.jai";                   // @TODO
#load "src-autogen/steam_ugc.jai";                           // @TODO
#load "src-autogen/steam_user.jai";                          // @TODO
#load "src-autogen/steam_userstats.jai";                     // @TODO
#load "src-autogen/steam_utils.jai";                         // @TODO
#load "src-autogen/steam_video.jai";                         // @TODO


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
SteamAPI_RestartAppIfNecessary :: (unOwnAppID: uint32) -> bool #foreign steam;

// Many Steam API functions allocate a small amount of thread-local memory for parameter storage.
// SteamAPI_ReleaseCurrentThreadMemory() will free API memory associated with the calling thread.
// This function is also called automatically by SteamAPI_RunCallbacks(), so a single-threaded
// program never needs to explicitly call this function.
SteamAPI_ReleaseCurrentThreadMemory :: () #foreign steam;

/*

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

*/

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

/*
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
*/
