steam_parental_settings : *ISteamParentalSettings;

SteamParentalSettings : SteamParentalSettings_Namespace;


#scope_file


SteamParentalSettings_Namespace :: struct {
    // procs
             :: SteamParentalSettings_BIsParentalLockEnabled
              :: SteamParentalSettings_BIsParentalLockLocked
                      :: SteamParentalSettings_BIsAppBlocked
                  :: SteamParentalSettings_BIsAppInBlockList
                  :: SteamParentalSettings_BIsFeatureBlocked
              :: SteamParentalSettings_BIsFeatureInBlockList
}


SteamParentalSettings_BIsParentalLockEnabled :: inline () -> bool {
    return SteamAPI_ISteamParentalSettings_BIsParentalLockEnabled(steam_parental_settings);
}


SteamParentalSettings_BIsParentalLockLocked :: inline () -> bool {
    return SteamAPI_ISteamParentalSettings_BIsParentalLockLocked(steam_parental_settings);
}


SteamParentalSettings_BIsAppBlocked :: inline (nAppID: AppId_t) -> bool {
    return SteamAPI_ISteamParentalSettings_BIsAppBlocked(steam_parental_settings, nAppID: AppId_t);
}


SteamParentalSettings_BIsAppInBlockList :: inline (nAppID: AppId_t) -> bool {
    return SteamAPI_ISteamParentalSettings_BIsAppInBlockList(steam_parental_settings, nAppID: AppId_t);
}


SteamParentalSettings_BIsFeatureBlocked :: inline (eFeature: EParentalFeature) -> bool {
    return SteamAPI_ISteamParentalSettings_BIsFeatureBlocked(steam_parental_settings, eFeature: EParentalFeature);
}


SteamParentalSettings_BIsFeatureInBlockList :: inline (eFeature: EParentalFeature) -> bool {
    return SteamAPI_ISteamParentalSettings_BIsFeatureInBlockList(steam_parental_settings, eFeature: EParentalFeature);
}
