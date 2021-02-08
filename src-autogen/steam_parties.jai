steam_parties : *ISteamParties;

SteamParties : SteamParties_Namespace;


#scope_file


SteamParties_Namespace :: struct {
    // procs
                :: SteamParties_GetNumActiveBeacons
                   :: SteamParties_GetBeaconByIndex
                   :: SteamParties_GetBeaconDetails
                          :: SteamParties_JoinParty
     :: SteamParties_GetNumAvailableBeaconLocations
        :: SteamParties_GetAvailableBeaconLocations
                       :: SteamParties_CreateBeacon
             :: SteamParties_OnReservationCompleted
                  :: SteamParties_CancelReservation
                 :: SteamParties_ChangeNumOpenSlots
                      :: SteamParties_DestroyBeacon
              :: SteamParties_GetBeaconLocationData
}


SteamParties_GetNumActiveBeacons :: inline () -> uint32 {
    return SteamAPI_ISteamParties_GetNumActiveBeacons(steam_parties);
}


SteamParties_GetBeaconByIndex :: inline (unIndex: uint32) -> PartyBeaconID_t {
    return SteamAPI_ISteamParties_GetBeaconByIndex(steam_parties, unIndex: uint32);
}


SteamParties_GetBeaconDetails :: inline (ulBeaconID: PartyBeaconID_t, pSteamIDBeaconOwner: *CSteamID, pLocation: *SteamPartyBeaconLocation_t, pchMetadata: *char, cchMetadata: s32) -> bool {
    return SteamAPI_ISteamParties_GetBeaconDetails(steam_parties, ulBeaconID: PartyBeaconID_t, pSteamIDBeaconOwner: *CSteamID, pLocation: *SteamPartyBeaconLocation_t, pchMetadata: *char, cchMetadata: s32);
}


SteamParties_JoinParty :: inline (ulBeaconID: PartyBeaconID_t) -> SteamAPICall_t {
    return SteamAPI_ISteamParties_JoinParty(steam_parties, ulBeaconID: PartyBeaconID_t);
}


SteamParties_GetNumAvailableBeaconLocations :: inline (puNumLocations: *uint32) -> bool {
    return SteamAPI_ISteamParties_GetNumAvailableBeaconLocations(steam_parties, puNumLocations: *uint32);
}


SteamParties_GetAvailableBeaconLocations :: inline (pLocationList: *SteamPartyBeaconLocation_t, uMaxNumLocations: uint32) -> bool {
    return SteamAPI_ISteamParties_GetAvailableBeaconLocations(steam_parties, pLocationList: *SteamPartyBeaconLocation_t, uMaxNumLocations: uint32);
}


SteamParties_CreateBeacon :: inline (unOpenSlots: uint32, pBeaconLocation: *SteamPartyBeaconLocation_t, pchConnectString: *char, pchMetadata: *char) -> SteamAPICall_t {
    return SteamAPI_ISteamParties_CreateBeacon(steam_parties, unOpenSlots: uint32, pBeaconLocation: *SteamPartyBeaconLocation_t, pchConnectString: *char, pchMetadata: *char);
}


SteamParties_OnReservationCompleted :: inline (ulBeacon: PartyBeaconID_t, steamIDUser: uint64_steamid) {
    SteamAPI_ISteamParties_OnReservationCompleted(steam_parties, ulBeacon: PartyBeaconID_t, steamIDUser: uint64_steamid);
}


SteamParties_CancelReservation :: inline (ulBeacon: PartyBeaconID_t, steamIDUser: uint64_steamid) {
    SteamAPI_ISteamParties_CancelReservation(steam_parties, ulBeacon: PartyBeaconID_t, steamIDUser: uint64_steamid);
}


SteamParties_ChangeNumOpenSlots :: inline (ulBeacon: PartyBeaconID_t, unOpenSlots: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamParties_ChangeNumOpenSlots(steam_parties, ulBeacon: PartyBeaconID_t, unOpenSlots: uint32);
}


SteamParties_DestroyBeacon :: inline (ulBeacon: PartyBeaconID_t) -> bool {
    return SteamAPI_ISteamParties_DestroyBeacon(steam_parties, ulBeacon: PartyBeaconID_t);
}


SteamParties_GetBeaconLocationData :: inline (BeaconLocation: SteamPartyBeaconLocation_t, eData: ESteamPartyBeaconLocationData, pchDataStringOut: *char, cchDataStringOut: s32) -> bool {
    return SteamAPI_ISteamParties_GetBeaconLocationData(steam_parties, BeaconLocation: SteamPartyBeaconLocation_t, eData: ESteamPartyBeaconLocationData, pchDataStringOut: *char, cchDataStringOut: s32);
}
