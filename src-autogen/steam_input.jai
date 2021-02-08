steam_input : *ISteamInput;
SteamInput : SteamInput_Namespace;


#scope_file


SteamInput_Namespace :: struct {
    // procs
    Init                                               :: SteamInput_Init;
    Shutdown                                           :: SteamInput_Shutdown;
    RunFrame                                           :: SteamInput_RunFrame;
    GetConnectedControllers                            :: SteamInput_GetConnectedControllers;
    GetActionSetHandle                                 :: SteamInput_GetActionSetHandle;
    ActivateActionSet                                  :: SteamInput_ActivateActionSet;
    GetCurrentActionSet                                :: SteamInput_GetCurrentActionSet;
    ActivateActionSetLayer                             :: SteamInput_ActivateActionSetLayer;
    DeactivateActionSetLayer                           :: SteamInput_DeactivateActionSetLayer;
    DeactivateAllActionSetLayers                       :: SteamInput_DeactivateAllActionSetLayers;
    GetActiveActionSetLayers                           :: SteamInput_GetActiveActionSetLayers;
    GetDigitalActionHandle                             :: SteamInput_GetDigitalActionHandle;
    GetDigitalActionData                               :: SteamInput_GetDigitalActionData;
    GetDigitalActionOrigins                            :: SteamInput_GetDigitalActionOrigins;
    GetAnalogActionHandle                              :: SteamInput_GetAnalogActionHandle;
    GetAnalogActionData                                :: SteamInput_GetAnalogActionData;
    GetAnalogActionOrigins                             :: SteamInput_GetAnalogActionOrigins;
    GetGlyphForActionOrigin                            :: SteamInput_GetGlyphForActionOrigin;
    GetStringForActionOrigin                           :: SteamInput_GetStringForActionOrigin;
    StopAnalogActionMomentum                           :: SteamInput_StopAnalogActionMomentum;
    GetMotionData                                      :: SteamInput_GetMotionData;
    TriggerVibration                                   :: SteamInput_TriggerVibration;
    SetLEDColor                                        :: SteamInput_SetLEDColor;
    TriggerHapticPulse                                 :: SteamInput_TriggerHapticPulse;
    TriggerRepeatedHapticPulse                         :: SteamInput_TriggerRepeatedHapticPulse;
    ShowBindingPanel                                   :: SteamInput_ShowBindingPanel;
    GetInputTypeForHandle                              :: SteamInput_GetInputTypeForHandle;
    GetControllerForGamepadIndex                       :: SteamInput_GetControllerForGamepadIndex;
    GetGamepadIndexForController                       :: SteamInput_GetGamepadIndexForController;
    GetStringForXboxOrigin                             :: SteamInput_GetStringForXboxOrigin;
    GetGlyphForXboxOrigin                              :: SteamInput_GetGlyphForXboxOrigin;
    GetActionOriginFromXboxOrigin                      :: SteamInput_GetActionOriginFromXboxOrigin;
    TranslateActionOrigin                              :: SteamInput_TranslateActionOrigin;
    GetDeviceBindingRevision                           :: SteamInput_GetDeviceBindingRevision;
    GetRemotePlaySessionID                             :: SteamInput_GetRemotePlaySessionID;

    //constants
    MAX_COUNT :: STEAM_INPUT_MAX_COUNT;
}


SteamInput_Init :: inline () -> bool {
    return SteamAPI_ISteamInput_Init(steam_input);
}


SteamInput_Shutdown :: inline () -> bool {
    return SteamAPI_ISteamInput_Shutdown(steam_input);
}


SteamInput_RunFrame :: inline () {
    SteamAPI_ISteamInput_RunFrame(steam_input);
}


SteamInput_GetConnectedControllers :: inline (handlesOut: *InputHandle_t) -> s32 {
    return SteamAPI_ISteamInput_GetConnectedControllers(steam_input, handlesOut);
}


SteamInput_GetActionSetHandle :: inline (pszActionSetName: *char) -> InputActionSetHandle_t {
    return SteamAPI_ISteamInput_GetActionSetHandle(steam_input, pszActionSetName);
}


SteamInput_ActivateActionSet :: inline (inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t) {
    SteamAPI_ISteamInput_ActivateActionSet(steam_input, inputHandle, actionSetHandle);
}


SteamInput_GetCurrentActionSet :: inline (inputHandle: InputHandle_t) -> InputActionSetHandle_t {
    return SteamAPI_ISteamInput_GetCurrentActionSet(steam_input, inputHandle);
}


SteamInput_ActivateActionSetLayer :: inline (inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) {
    SteamAPI_ISteamInput_ActivateActionSetLayer(steam_input, inputHandle, actionSetLayerHandle);
}


SteamInput_DeactivateActionSetLayer :: inline (inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) {
    SteamAPI_ISteamInput_DeactivateActionSetLayer(steam_input, inputHandle, actionSetLayerHandle);
}


SteamInput_DeactivateAllActionSetLayers :: inline (inputHandle: InputHandle_t) {
    SteamAPI_ISteamInput_DeactivateAllActionSetLayers(steam_input, inputHandle);
}


SteamInput_GetActiveActionSetLayers :: inline (inputHandle: InputHandle_t, handlesOut: *InputActionSetHandle_t) -> s32 {
    return SteamAPI_ISteamInput_GetActiveActionSetLayers(steam_input, inputHandle, handlesOut);
}


SteamInput_GetDigitalActionHandle :: inline (pszActionName: *char) -> InputDigitalActionHandle_t {
    return SteamAPI_ISteamInput_GetDigitalActionHandle(steam_input, pszActionName);
}


SteamInput_GetDigitalActionData :: inline (inputHandle: InputHandle_t, digitalActionHandle: InputDigitalActionHandle_t) -> InputDigitalActionData_t {
    return SteamAPI_ISteamInput_GetDigitalActionData(steam_input, inputHandle, digitalActionHandle);
}


SteamInput_GetDigitalActionOrigins :: inline (inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, digitalActionHandle: InputDigitalActionHandle_t, originsOut: *EInputActionOrigin) -> s32 {
    return SteamAPI_ISteamInput_GetDigitalActionOrigins(steam_input, inputHandle, actionSetHandle, digitalActionHandle, originsOut);
}


SteamInput_GetAnalogActionHandle :: inline (pszActionName: *char) -> InputAnalogActionHandle_t {
    return SteamAPI_ISteamInput_GetAnalogActionHandle(steam_input, pszActionName);
}


SteamInput_GetAnalogActionData :: inline (inputHandle: InputHandle_t, analogActionHandle: InputAnalogActionHandle_t) -> InputAnalogActionData_t {
    return SteamAPI_ISteamInput_GetAnalogActionData(steam_input, inputHandle, analogActionHandle);
}


SteamInput_GetAnalogActionOrigins :: inline (inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, analogActionHandle: InputAnalogActionHandle_t, originsOut: *EInputActionOrigin) -> s32 {
    return SteamAPI_ISteamInput_GetAnalogActionOrigins(steam_input, inputHandle, actionSetHandle, analogActionHandle, originsOut);
}


SteamInput_GetGlyphForActionOrigin :: inline (eOrigin: EInputActionOrigin) -> *char {
    return SteamAPI_ISteamInput_GetGlyphForActionOrigin(steam_input, eOrigin);
}


SteamInput_GetStringForActionOrigin :: inline (eOrigin: EInputActionOrigin) -> *char {
    return SteamAPI_ISteamInput_GetStringForActionOrigin(steam_input, eOrigin);
}


SteamInput_StopAnalogActionMomentum :: inline (inputHandle: InputHandle_t, eAction: InputAnalogActionHandle_t) {
    SteamAPI_ISteamInput_StopAnalogActionMomentum(steam_input, inputHandle, eAction);
}


SteamInput_GetMotionData :: inline (inputHandle: InputHandle_t) -> InputMotionData_t {
    return SteamAPI_ISteamInput_GetMotionData(steam_input, inputHandle);
}


SteamInput_TriggerVibration :: inline (inputHandle: InputHandle_t, usLeftSpeed: u16, usRightSpeed: u16) {
    SteamAPI_ISteamInput_TriggerVibration(steam_input, inputHandle, usLeftSpeed, usRightSpeed);
}


SteamInput_SetLEDColor :: inline (inputHandle: InputHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32) {
    SteamAPI_ISteamInput_SetLEDColor(steam_input, inputHandle, nColorR, nColorG, nColorB, nFlags);
}


SteamInput_TriggerHapticPulse :: inline (inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) {
    SteamAPI_ISteamInput_TriggerHapticPulse(steam_input, inputHandle, eTargetPad, usDurationMicroSec);
}


SteamInput_TriggerRepeatedHapticPulse :: inline (inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) {
    SteamAPI_ISteamInput_TriggerRepeatedHapticPulse(steam_input, inputHandle, eTargetPad, usDurationMicroSec, usOffMicroSec, unRepeat, nFlags);
}


SteamInput_ShowBindingPanel :: inline (inputHandle: InputHandle_t) -> bool {
    return SteamAPI_ISteamInput_ShowBindingPanel(steam_input, inputHandle);
}


SteamInput_GetInputTypeForHandle :: inline (inputHandle: InputHandle_t) -> ESteamInputType {
    return SteamAPI_ISteamInput_GetInputTypeForHandle(steam_input, inputHandle);
}


SteamInput_GetControllerForGamepadIndex :: inline (nIndex: s32) -> InputHandle_t {
    return SteamAPI_ISteamInput_GetControllerForGamepadIndex(steam_input, nIndex);
}


SteamInput_GetGamepadIndexForController :: inline (ulinputHandle: InputHandle_t) -> s32 {
    return SteamAPI_ISteamInput_GetGamepadIndexForController(steam_input, ulinputHandle);
}


SteamInput_GetStringForXboxOrigin :: inline (eOrigin: EXboxOrigin) -> *char {
    return SteamAPI_ISteamInput_GetStringForXboxOrigin(steam_input, eOrigin);
}


SteamInput_GetGlyphForXboxOrigin :: inline (eOrigin: EXboxOrigin) -> *char {
    return SteamAPI_ISteamInput_GetGlyphForXboxOrigin(steam_input, eOrigin);
}


SteamInput_GetActionOriginFromXboxOrigin :: inline (inputHandle: InputHandle_t, eOrigin: EXboxOrigin) -> EInputActionOrigin {
    return SteamAPI_ISteamInput_GetActionOriginFromXboxOrigin(steam_input, inputHandle, eOrigin);
}


SteamInput_TranslateActionOrigin :: inline (eDestinationInputType: ESteamInputType, eSourceOrigin: EInputActionOrigin) -> EInputActionOrigin {
    return SteamAPI_ISteamInput_TranslateActionOrigin(steam_input, eDestinationInputType, eSourceOrigin);
}


SteamInput_GetDeviceBindingRevision :: inline (inputHandle: InputHandle_t, pMajor: *s32, pMinor: *s32) -> bool {
    return SteamAPI_ISteamInput_GetDeviceBindingRevision(steam_input, inputHandle, pMajor, pMinor);
}


SteamInput_GetRemotePlaySessionID :: inline (inputHandle: InputHandle_t) -> uint32 {
    return SteamAPI_ISteamInput_GetRemotePlaySessionID(steam_input, inputHandle);
}
