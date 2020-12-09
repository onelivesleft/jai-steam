================================================================

Copyright © 1996-2018, Valve Corporation, All rights reserved.

================================================================

SteamPipe GUI 1.4.0.2
=====================

The SteamPipe GUI tool is a simple graphical wrapper around the SteamPipe steamcmd.exe tool. 

We know new developers coming on to Steam can sometimes have a difficult time getting the SteamPipe build process working. Getting the various app and depot configuration files set-up can be initially confusing. To help with that, we have put together a GUI wrapper that will help with some, probably not all, but definitely the basic set-up for SteamPipe. 

Steps to use:

1. After running the exe, set the SDK ContentBuilder path to the ContentBuilder path in the SDK you are currently targeting. (e.g. C:\dev\steam\sdk\1.42\tools\ContentBuilder)
2. Set the username and password to an account that has access to your Steamworks publisher account.
3. Enter the App ID for your game
4. Click Add Depot for each depot you want to upload. 
5. Set the correct Depot IDs and the paths to each Depot. 
6. Click Upload.

That should get your build into SteamPipe. The output area will automatically read in the app and depot log files so you can review what happened.

For most of the fields in the UI, there are tool tips if you hover over the labels or the controls. 

More details about the tool are available here: http://steamcommunity.com/groups/steamworks/discussions/0/412449508292646864

