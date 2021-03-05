steam_parental_settings : *ISteamParentalSettings;


BIsParentalLockEnabled :: inline () -> bool {
    return SteamAPI_ISteamParentalSettings_BIsParentalLockEnabled(steam_parental_settings);
}


BIsParentalLockLocked :: inline () -> bool {
    return SteamAPI_ISteamParentalSettings_BIsParentalLockLocked(steam_parental_settings);
}


BIsAppBlocked :: inline (nAppID: AppId_t) -> bool {
    return SteamAPI_ISteamParentalSettings_BIsAppBlocked(steam_parental_settings, nAppID);
}


BIsAppInBlockList :: inline (nAppID: AppId_t) -> bool {
    return SteamAPI_ISteamParentalSettings_BIsAppInBlockList(steam_parental_settings, nAppID);
}


BIsFeatureBlocked :: inline (eFeature: EParentalFeature) -> bool {
    return SteamAPI_ISteamParentalSettings_BIsFeatureBlocked(steam_parental_settings, eFeature);
}


BIsFeatureInBlockList :: inline (eFeature: EParentalFeature) -> bool {
    return SteamAPI_ISteamParentalSettings_BIsFeatureInBlockList(steam_parental_settings, eFeature);
}
