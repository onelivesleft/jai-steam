steam_parties : *ISteamParties;


GetNumActiveBeacons :: inline () -> uint32 {
    return SteamAPI_ISteamParties_GetNumActiveBeacons(steam_parties);
}


GetBeaconByIndex :: inline (unIndex: uint32) -> PartyBeaconID_t {
    return SteamAPI_ISteamParties_GetBeaconByIndex(steam_parties, unIndex);
}


GetBeaconDetails :: inline (ulBeaconID: PartyBeaconID_t, pSteamIDBeaconOwner: *CSteamID, pLocation: *SteamPartyBeaconLocation_t, pchMetadata: *char, cchMetadata: s32) -> bool {
    return SteamAPI_ISteamParties_GetBeaconDetails(steam_parties, ulBeaconID, pSteamIDBeaconOwner, pLocation, pchMetadata, cchMetadata);
}


JoinParty :: inline (ulBeaconID: PartyBeaconID_t) -> SteamAPICall_t #must {
    return SteamAPI_ISteamParties_JoinParty(steam_parties, ulBeaconID);
}

JoinParty :: inline (ulBeaconID: PartyBeaconID_t, callback: (JoinPartyCallback_t, bool) -> ()) {
    RegisterCallResult(
        JoinParty(ulBeaconID),
        callback
    );
}

JoinParty :: (ulBeaconID: PartyBeaconID_t, code: Code) #expand {
    RegisterCallResult(
        JoinParty(ulBeaconID),
        (result: JoinPartyCallback_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


GetNumAvailableBeaconLocations :: inline (puNumLocations: *uint32) -> bool {
    return SteamAPI_ISteamParties_GetNumAvailableBeaconLocations(steam_parties, puNumLocations);
}


GetAvailableBeaconLocations :: inline (pLocationList: *SteamPartyBeaconLocation_t, uMaxNumLocations: uint32) -> bool {
    return SteamAPI_ISteamParties_GetAvailableBeaconLocations(steam_parties, pLocationList, uMaxNumLocations);
}


CreateBeacon :: inline (unOpenSlots: uint32, pBeaconLocation: *SteamPartyBeaconLocation_t, pchConnectString: *char, pchMetadata: *char) -> SteamAPICall_t #must {
    return SteamAPI_ISteamParties_CreateBeacon(steam_parties, unOpenSlots, pBeaconLocation, pchConnectString, pchMetadata);
}

CreateBeacon :: inline (unOpenSlots: uint32, pBeaconLocation: *SteamPartyBeaconLocation_t, pchConnectString: *char, pchMetadata: *char, callback: (CreateBeaconCallback_t, bool) -> ()) {
    RegisterCallResult(
        CreateBeacon(unOpenSlots, pBeaconLocation, pchConnectString, pchMetadata),
        callback
    );
}

CreateBeacon :: (unOpenSlots: uint32, pBeaconLocation: *SteamPartyBeaconLocation_t, pchConnectString: *char, pchMetadata: *char, code: Code) #expand {
    RegisterCallResult(
        CreateBeacon(unOpenSlots, pBeaconLocation, pchConnectString, pchMetadata),
        (result: CreateBeaconCallback_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


OnReservationCompleted :: inline (ulBeacon: PartyBeaconID_t, steamIDUser: uint64_steamid) {
    SteamAPI_ISteamParties_OnReservationCompleted(steam_parties, ulBeacon, steamIDUser);
}


CancelReservation :: inline (ulBeacon: PartyBeaconID_t, steamIDUser: uint64_steamid) {
    SteamAPI_ISteamParties_CancelReservation(steam_parties, ulBeacon, steamIDUser);
}


ChangeNumOpenSlots :: inline (ulBeacon: PartyBeaconID_t, unOpenSlots: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamParties_ChangeNumOpenSlots(steam_parties, ulBeacon, unOpenSlots);
}

ChangeNumOpenSlots :: inline (ulBeacon: PartyBeaconID_t, unOpenSlots: uint32, callback: (ChangeNumOpenSlotsCallback_t, bool) -> ()) {
    RegisterCallResult(
        ChangeNumOpenSlots(ulBeacon, unOpenSlots),
        callback
    );
}

ChangeNumOpenSlots :: (ulBeacon: PartyBeaconID_t, unOpenSlots: uint32, code: Code) #expand {
    RegisterCallResult(
        ChangeNumOpenSlots(ulBeacon, unOpenSlots),
        (result: ChangeNumOpenSlotsCallback_t, io_failure: bool) -> () {
            #insert code;
        }
    );
}


DestroyBeacon :: inline (ulBeacon: PartyBeaconID_t) -> bool {
    return SteamAPI_ISteamParties_DestroyBeacon(steam_parties, ulBeacon);
}


GetBeaconLocationData :: inline (BeaconLocation: SteamPartyBeaconLocation_t, eData: ESteamPartyBeaconLocationData, pchDataStringOut: *char, cchDataStringOut: s32) -> bool {
    return SteamAPI_ISteamParties_GetBeaconLocationData(steam_parties, BeaconLocation, eData, pchDataStringOut, cchDataStringOut);
}
