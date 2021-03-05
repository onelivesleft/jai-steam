steam_input : *ISteamInput;


InitInput :: inline () -> bool {
    return SteamAPI_ISteamInput_Init(steam_input);
}


ShutdownInput :: inline () -> bool {
    return SteamAPI_ISteamInput_Shutdown(steam_input);
}


RunFrame :: inline () {
    SteamAPI_ISteamInput_RunFrame(steam_input);
}


GetConnectedControllers :: inline (handlesOut: *InputHandle_t) -> s32 {
    return SteamAPI_ISteamInput_GetConnectedControllers(steam_input, handlesOut);
}


GetActionSetHandle :: inline (pszActionSetName: *char) -> InputActionSetHandle_t {
    return SteamAPI_ISteamInput_GetActionSetHandle(steam_input, pszActionSetName);
}


ActivateActionSet :: inline (inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t) {
    SteamAPI_ISteamInput_ActivateActionSet(steam_input, inputHandle, actionSetHandle);
}


GetCurrentActionSet :: inline (inputHandle: InputHandle_t) -> InputActionSetHandle_t {
    return SteamAPI_ISteamInput_GetCurrentActionSet(steam_input, inputHandle);
}


ActivateActionSetLayer :: inline (inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) {
    SteamAPI_ISteamInput_ActivateActionSetLayer(steam_input, inputHandle, actionSetLayerHandle);
}


DeactivateActionSetLayer :: inline (inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) {
    SteamAPI_ISteamInput_DeactivateActionSetLayer(steam_input, inputHandle, actionSetLayerHandle);
}


DeactivateAllActionSetLayers :: inline (inputHandle: InputHandle_t) {
    SteamAPI_ISteamInput_DeactivateAllActionSetLayers(steam_input, inputHandle);
}


GetActiveActionSetLayers :: inline (inputHandle: InputHandle_t, handlesOut: *InputActionSetHandle_t) -> s32 {
    return SteamAPI_ISteamInput_GetActiveActionSetLayers(steam_input, inputHandle, handlesOut);
}


GetDigitalActionHandle :: inline (pszActionName: *char) -> InputDigitalActionHandle_t {
    return SteamAPI_ISteamInput_GetDigitalActionHandle(steam_input, pszActionName);
}


GetDigitalActionData :: inline (inputHandle: InputHandle_t, digitalActionHandle: InputDigitalActionHandle_t) -> InputDigitalActionData_t {
    return SteamAPI_ISteamInput_GetDigitalActionData(steam_input, inputHandle, digitalActionHandle);
}


GetDigitalActionOrigins :: inline (inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, digitalActionHandle: InputDigitalActionHandle_t, originsOut: *EInputActionOrigin) -> s32 {
    return SteamAPI_ISteamInput_GetDigitalActionOrigins(steam_input, inputHandle, actionSetHandle, digitalActionHandle, originsOut);
}


GetAnalogActionHandle :: inline (pszActionName: *char) -> InputAnalogActionHandle_t {
    return SteamAPI_ISteamInput_GetAnalogActionHandle(steam_input, pszActionName);
}


GetAnalogActionData :: inline (inputHandle: InputHandle_t, analogActionHandle: InputAnalogActionHandle_t) -> InputAnalogActionData_t {
    return SteamAPI_ISteamInput_GetAnalogActionData(steam_input, inputHandle, analogActionHandle);
}


GetAnalogActionOrigins :: inline (inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, analogActionHandle: InputAnalogActionHandle_t, originsOut: *EInputActionOrigin) -> s32 {
    return SteamAPI_ISteamInput_GetAnalogActionOrigins(steam_input, inputHandle, actionSetHandle, analogActionHandle, originsOut);
}


GetGlyphForActionOrigin :: inline (eOrigin: EInputActionOrigin) -> string {
    return to_string(SteamAPI_ISteamInput_GetGlyphForActionOrigin(steam_input, eOrigin));
}


GetStringForActionOrigin :: inline (eOrigin: EInputActionOrigin) -> string {
    return to_string(SteamAPI_ISteamInput_GetStringForActionOrigin(steam_input, eOrigin));
}


StopAnalogActionMomentum :: inline (inputHandle: InputHandle_t, eAction: InputAnalogActionHandle_t) {
    SteamAPI_ISteamInput_StopAnalogActionMomentum(steam_input, inputHandle, eAction);
}


GetMotionData :: inline (inputHandle: InputHandle_t) -> InputMotionData_t {
    return SteamAPI_ISteamInput_GetMotionData(steam_input, inputHandle);
}


TriggerVibration :: inline (inputHandle: InputHandle_t, usLeftSpeed: u16, usRightSpeed: u16) {
    SteamAPI_ISteamInput_TriggerVibration(steam_input, inputHandle, usLeftSpeed, usRightSpeed);
}


SetLEDColor :: inline (inputHandle: InputHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32) {
    SteamAPI_ISteamInput_SetLEDColor(steam_input, inputHandle, nColorR, nColorG, nColorB, nFlags);
}


TriggerHapticPulse :: inline (inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) {
    SteamAPI_ISteamInput_TriggerHapticPulse(steam_input, inputHandle, eTargetPad, usDurationMicroSec);
}


TriggerRepeatedHapticPulse :: inline (inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) {
    SteamAPI_ISteamInput_TriggerRepeatedHapticPulse(steam_input, inputHandle, eTargetPad, usDurationMicroSec, usOffMicroSec, unRepeat, nFlags);
}


ShowBindingPanel :: inline (inputHandle: InputHandle_t) -> bool {
    return SteamAPI_ISteamInput_ShowBindingPanel(steam_input, inputHandle);
}


GetInputTypeForHandle :: inline (inputHandle: InputHandle_t) -> ESteamInputType {
    return SteamAPI_ISteamInput_GetInputTypeForHandle(steam_input, inputHandle);
}


GetControllerForGamepadIndex :: inline (nIndex: s32) -> InputHandle_t {
    return SteamAPI_ISteamInput_GetControllerForGamepadIndex(steam_input, nIndex);
}


GetGamepadIndexForController :: inline (ulinputHandle: InputHandle_t) -> s32 {
    return SteamAPI_ISteamInput_GetGamepadIndexForController(steam_input, ulinputHandle);
}


GetStringForXboxOrigin :: inline (eOrigin: EXboxOrigin) -> string {
    return to_string(SteamAPI_ISteamInput_GetStringForXboxOrigin(steam_input, eOrigin));
}


GetGlyphForXboxOrigin :: inline (eOrigin: EXboxOrigin) -> string {
    return to_string(SteamAPI_ISteamInput_GetGlyphForXboxOrigin(steam_input, eOrigin));
}


GetActionOriginFromXboxOrigin :: inline (inputHandle: InputHandle_t, eOrigin: EXboxOrigin) -> EInputActionOrigin {
    return SteamAPI_ISteamInput_GetActionOriginFromXboxOrigin(steam_input, inputHandle, eOrigin);
}


TranslateActionOrigin :: inline (eDestinationInputType: ESteamInputType, eSourceOrigin: EInputActionOrigin) -> EInputActionOrigin {
    return SteamAPI_ISteamInput_TranslateActionOrigin(steam_input, eDestinationInputType, eSourceOrigin);
}


GetDeviceBindingRevision :: inline (inputHandle: InputHandle_t, pMajor: *s32, pMinor: *s32) -> bool {
    return SteamAPI_ISteamInput_GetDeviceBindingRevision(steam_input, inputHandle, pMajor, pMinor);
}


GetRemotePlaySessionID :: inline (inputHandle: InputHandle_t) -> uint32 {
    return SteamAPI_ISteamInput_GetRemotePlaySessionID(steam_input, inputHandle);
}
