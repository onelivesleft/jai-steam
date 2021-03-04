steam_parental_settings : *ISteamParentalSettings;
SteamParentalSettings : SteamParentalSettings_Namespace;


#scope_file


SteamParentalSettings_Namespace :: struct {
    // procs
    BIsParentalLockEnabled                             :: SteamParentalSettings_BIsParentalLockEnabled;
    BIsParentalLockLocked                              :: SteamParentalSettings_BIsParentalLockLocked;
    BIsAppBlocked                                      :: SteamParentalSettings_BIsAppBlocked;
    BIsAppInBlockList                                  :: SteamParentalSettings_BIsAppInBlockList;
    BIsFeatureBlocked                                  :: SteamParentalSettings_BIsFeatureBlocked;
    BIsFeatureInBlockList                              :: SteamParentalSettings_BIsFeatureInBlockList;
}


SteamParentalSettings_BIsParentalLockEnabled :: inline () -> bool #foreign steam "SteamAPI_ISteamParentalSettings_BIsParen {
    return SteamParentalSettings_BIsParentalLockEnabled(steam_parental_settings);
}


SteamParentalSettings_BIsParentalLockLocked :: inline () -> bool #foreign steam "SteamAPI_ISteamParentalSettings_BIsPare {
    return SteamParentalSettings_BIsParentalLockLocked(steam_parental_settings);
}


SteamParentalSettings_BIsAppBlocked :: inline (nAppID: AppId_t) -> bool #foreign steam "SteamAPI_ISteamParentalSettings {
    return SteamParentalSettings_BIsAppBlocked(steam_parental_settings, nAppID);
}


SteamParentalSettings_BIsAppInBlockList :: inline (nAppID: AppId_t) -> bool #foreign steam "SteamAPI_ISteamParentalSettings_BIs {
    return SteamParentalSettings_BIsAppInBlockList(steam_parental_settings, nAppID);
}


SteamParentalSettings_BIsFeatureBlocked :: inline (eFeature: EParentalFeature) -> bool #foreign steam "SteamAPI_ISteamParentalSettings_BIs {
    return SteamParentalSettings_BIsFeatureBlocked(steam_parental_settings, eFeature);
}


SteamParentalSettings_BIsFeatureInBlockList :: inline (eFeature: EParentalFeature) -> bool #foreign steam "SteamAPI_ISteamParentalSettings_BIsFeat {
    return SteamParentalSettings_BIsFeatureInBlockList(steam_parental_settings, eFeature);
}
