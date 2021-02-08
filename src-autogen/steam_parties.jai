steam_parties : *ISteamParties;
SteamParties : SteamParties_Namespace;


#scope_file


SteamParties_Namespace :: struct {
    // procs
    GetNumActiveBeacons                                :: SteamParties_GetNumActiveBeacons;
    GetBeaconByIndex                                   :: SteamParties_GetBeaconByIndex;
    GetBeaconDetails                                   :: SteamParties_GetBeaconDetails;
    JoinParty                                          :: SteamParties_JoinParty;
    GetNumAvailableBeaconLocations                     :: SteamParties_GetNumAvailableBeaconLocations;
    GetAvailableBeaconLocations                        :: SteamParties_GetAvailableBeaconLocations;
    CreateBeacon                                       :: SteamParties_CreateBeacon;
    OnReservationCompleted                             :: SteamParties_OnReservationCompleted;
    CancelReservation                                  :: SteamParties_CancelReservation;
    ChangeNumOpenSlots                                 :: SteamParties_ChangeNumOpenSlots;
    DestroyBeacon                                      :: SteamParties_DestroyBeacon;
    GetBeaconLocationData                              :: SteamParties_GetBeaconLocationData;
}


SteamParties_GetNumActiveBeacons :: inline () -> uint32 {
    return SteamAPI_ISteamParties_GetNumActiveBeacons(steam_parties);
}


SteamParties_GetBeaconByIndex :: inline (unIndex: uint32) -> PartyBeaconID_t {
    return SteamAPI_ISteamParties_GetBeaconByIndex(steam_parties, unIndex);
}


SteamParties_GetBeaconDetails :: inline (ulBeaconID: PartyBeaconID_t, pSteamIDBeaconOwner: *CSteamID, pLocation: *SteamPartyBeaconLocation_t, pchMetadata: *char, cchMetadata: s32) -> bool {
    return SteamAPI_ISteamParties_GetBeaconDetails(steam_parties, ulBeaconID, pSteamIDBeaconOwner, pLocation, pchMetadata, cchMetadata);
}


SteamParties_JoinParty :: inline (ulBeaconID: PartyBeaconID_t) -> SteamAPICall_t {
    return SteamAPI_ISteamParties_JoinParty(steam_parties, ulBeaconID);
}


SteamParties_GetNumAvailableBeaconLocations :: inline (puNumLocations: *uint32) -> bool {
    return SteamAPI_ISteamParties_GetNumAvailableBeaconLocations(steam_parties, puNumLocations);
}


SteamParties_GetAvailableBeaconLocations :: inline (pLocationList: *SteamPartyBeaconLocation_t, uMaxNumLocations: uint32) -> bool {
    return SteamAPI_ISteamParties_GetAvailableBeaconLocations(steam_parties, pLocationList, uMaxNumLocations);
}


SteamParties_CreateBeacon :: inline (unOpenSlots: uint32, pBeaconLocation: *SteamPartyBeaconLocation_t, pchConnectString: *char, pchMetadata: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamParties_CreateBeacon(steam_parties, unOpenSlots, pBeaconLocation, pchConnectString, pchMetadata);
}


SteamParties_OnReservationCompleted :: inline (ulBeacon: PartyBeaconID_t, steamIDUser: uint64_steamid) {
    SteamAPI_ISteamParties_OnReservationCompleted(steam_parties, ulBeacon, steamIDUser);
}


SteamParties_CancelReservation :: inline (ulBeacon: PartyBeaconID_t, steamIDUser: uint64_steamid) {
    SteamAPI_ISteamParties_CancelReservation(steam_parties, ulBeacon, steamIDUser);
}


SteamParties_ChangeNumOpenSlots :: inline (ulBeacon: PartyBeaconID_t, unOpenSlots: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamParties_ChangeNumOpenSlots(steam_parties, ulBeacon, unOpenSlots);
}


SteamParties_DestroyBeacon :: inline (ulBeacon: PartyBeaconID_t) -> bool {
    return SteamAPI_ISteamParties_DestroyBeacon(steam_parties, ulBeacon);
}


SteamParties_GetBeaconLocationData :: inline (BeaconLocation: SteamPartyBeaconLocation_t, eData: ESteamPartyBeaconLocationData, pchDataStringOut: *char, cchDataStringOut: s32) -> bool {
    return SteamAPI_ISteamParties_GetBeaconLocationData(steam_parties, BeaconLocation, eData, pchDataStringOut, cchDataStringOut);
}
