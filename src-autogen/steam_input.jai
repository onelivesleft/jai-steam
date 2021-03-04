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
}


SteamInput_Init :: inline () -> bool #foreign steam "SteamAPI_IS {
    return SteamInput_Init(steam_input);
}


SteamInput_Shutdown :: inline () -> bool #foreign steam "SteamAPI_ISteam {
    return SteamInput_Shutdown(steam_input);
}


SteamInput_RunFrame :: inline () {
    SteamInput_RunFrame(steam_input);
}


SteamInput_GetConnectedControllers :: inline (handlesOut: *InputHandle_t) -> s32 #foreign steam "SteamAPI_ISteamInput_GetConnec {
    return SteamInput_GetConnectedControllers(steam_input, handlesOut);
}


SteamInput_GetActionSetHandle :: inline (pszActionSetName: *char) -> InputActionSetHandle_t #foreign steam "SteamAPI_ISteamInput_GetA {
    return SteamInput_GetActionSetHandle(steam_input, pszActionSetName);
}


SteamInput_ActivateActionSet :: inline (inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t) {
    SteamInput_ActivateActionSet(steam_input, inputHandle, actionSetHandle);
}


SteamInput_GetCurrentActionSet :: inline (inputHandle: InputHandle_t) -> InputActionSetHandle_t #foreign steam "SteamAPI_ISteamInput_GetCu {
    return SteamInput_GetCurrentActionSet(steam_input, inputHandle);
}


SteamInput_ActivateActionSetLayer :: inline (inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) {
    SteamInput_ActivateActionSetLayer(steam_input, inputHandle, actionSetLayerHandle);
}


SteamInput_DeactivateActionSetLayer :: inline (inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) {
    SteamInput_DeactivateActionSetLayer(steam_input, inputHandle, actionSetLayerHandle);
}


SteamInput_DeactivateAllActionSetLayers :: inline (inputHandle: InputHandle_t) {
    SteamInput_DeactivateAllActionSetLayers(steam_input, inputHandle);
}


SteamInput_GetActiveActionSetLayers :: inline (inputHandle: InputHandle_t, handlesOut: *InputActionSetHandle_t) -> s32 #foreign steam "SteamAPI_ISteamInput_GetActiveA {
    return SteamInput_GetActiveActionSetLayers(steam_input, inputHandle, handlesOut);
}


SteamInput_GetDigitalActionHandle :: inline (pszActionName: *char) -> InputDigitalActionHandle_t #foreign steam "SteamAPI_ISteamInput_GetDigit {
    return SteamInput_GetDigitalActionHandle(steam_input, pszActionName);
}


SteamInput_GetDigitalActionData :: inline (inputHandle: InputHandle_t, digitalActionHandle: InputDigitalActionHandle_t) -> InputDigitalActionData_t #foreign steam "SteamAPI_ISteamInput_GetDig {
    return SteamInput_GetDigitalActionData(steam_input, inputHandle, digitalActionHandle);
}


SteamInput_GetDigitalActionOrigins :: inline (inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, digitalActionHandle: InputDigitalActionHandle_t, originsOut: *EInputActionOrigin) -> s32 #foreign steam "SteamAPI_ISteamInput_GetDigita {
    return SteamInput_GetDigitalActionOrigins(steam_input, inputHandle, actionSetHandle, digitalActionHandle, originsOut);
}


SteamInput_GetAnalogActionHandle :: inline (pszActionName: *char) -> InputAnalogActionHandle_t #foreign steam "SteamAPI_ISteamInput_GetAnal {
    return SteamInput_GetAnalogActionHandle(steam_input, pszActionName);
}


SteamInput_GetAnalogActionData :: inline (inputHandle: InputHandle_t, analogActionHandle: InputAnalogActionHandle_t) -> InputAnalogActionData_t #foreign steam "SteamAPI_ISteamInput_GetAn {
    return SteamInput_GetAnalogActionData(steam_input, inputHandle, analogActionHandle);
}


SteamInput_GetAnalogActionOrigins :: inline (inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, analogActionHandle: InputAnalogActionHandle_t, originsOut: *EInputActionOrigin) -> s32 #foreign steam "SteamAPI_ISteamInput_GetAnalo {
    return SteamInput_GetAnalogActionOrigins(steam_input, inputHandle, actionSetHandle, analogActionHandle, originsOut);
}


SteamInput_GetGlyphForActionOrigin :: inline (eOrigin: EInputActionOrigin) -> *char #foreign steam "SteamAPI_ISteamInput_GetGlyphF {
    return SteamInput_GetGlyphForActionOrigin(steam_input, eOrigin);
}


SteamInput_GetStringForActionOrigin :: inline (eOrigin: EInputActionOrigin) -> *char #foreign steam "SteamAPI_ISteamInput_GetStringF {
    return SteamInput_GetStringForActionOrigin(steam_input, eOrigin);
}


SteamInput_StopAnalogActionMomentum :: inline (inputHandle: InputHandle_t, eAction: InputAnalogActionHandle_t) {
    SteamInput_StopAnalogActionMomentum(steam_input, inputHandle, eAction);
}


SteamInput_GetMotionData :: inline (inputHandle: InputHandle_t) -> InputMotionData_t #foreign steam "SteamAPI_ISteamInput {
    return SteamInput_GetMotionData(steam_input, inputHandle);
}


SteamInput_TriggerVibration :: inline (inputHandle: InputHandle_t, usLeftSpeed: u16, usRightSpeed: u16) {
    SteamInput_TriggerVibration(steam_input, inputHandle, usLeftSpeed, usRightSpeed);
}


SteamInput_SetLEDColor :: inline (inputHandle: InputHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32) {
    SteamInput_SetLEDColor(steam_input, inputHandle, nColorR, nColorG, nColorB, nFlags);
}


SteamInput_TriggerHapticPulse :: inline (inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) {
    SteamInput_TriggerHapticPulse(steam_input, inputHandle, eTargetPad, usDurationMicroSec);
}


SteamInput_TriggerRepeatedHapticPulse :: inline (inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) {
    SteamInput_TriggerRepeatedHapticPulse(steam_input, inputHandle, eTargetPad, usDurationMicroSec, usOffMicroSec, unRepeat, nFlags);
}


SteamInput_ShowBindingPanel :: inline (inputHandle: InputHandle_t) -> bool #foreign steam "SteamAPI_ISteamInput_Sh {
    return SteamInput_ShowBindingPanel(steam_input, inputHandle);
}


SteamInput_GetInputTypeForHandle :: inline (inputHandle: InputHandle_t) -> ESteamInputType #foreign steam "SteamAPI_ISteamInput_GetInpu {
    return SteamInput_GetInputTypeForHandle(steam_input, inputHandle);
}


SteamInput_GetControllerForGamepadIndex :: inline (nIndex: s32) -> InputHandle_t #foreign steam "SteamAPI_ISteamInput_GetControllerF {
    return SteamInput_GetControllerForGamepadIndex(steam_input, nIndex);
}


SteamInput_GetGamepadIndexForController :: inline (ulinputHandle: InputHandle_t) -> s32 #foreign steam "SteamAPI_ISteamInput_GetGamepadInde {
    return SteamInput_GetGamepadIndexForController(steam_input, ulinputHandle);
}


SteamInput_GetStringForXboxOrigin :: inline (eOrigin: EXboxOrigin) -> *char #foreign steam "SteamAPI_ISteamInput_GetStrin {
    return SteamInput_GetStringForXboxOrigin(steam_input, eOrigin);
}


SteamInput_GetGlyphForXboxOrigin :: inline (eOrigin: EXboxOrigin) -> *char #foreign steam "SteamAPI_ISteamInput_GetGlyp {
    return SteamInput_GetGlyphForXboxOrigin(steam_input, eOrigin);
}


SteamInput_GetActionOriginFromXboxOrigin :: inline (inputHandle: InputHandle_t, eOrigin: EXboxOrigin) -> EInputActionOrigin #foreign steam "SteamAPI_ISteamInput_GetActionOrigin {
    return SteamInput_GetActionOriginFromXboxOrigin(steam_input, inputHandle, eOrigin);
}


SteamInput_TranslateActionOrigin :: inline (eDestinationInputType: ESteamInputType, eSourceOrigin: EInputActionOrigin) -> EInputActionOrigin #foreign steam "SteamAPI_ISteamInput_Transla {
    return SteamInput_TranslateActionOrigin(steam_input, eDestinationInputType, eSourceOrigin);
}


SteamInput_GetDeviceBindingRevision :: inline (inputHandle: InputHandle_t, pMajor: *s32, pMinor: *s32) -> bool #foreign steam "SteamAPI_ISteamInput_GetDeviceB {
    return SteamInput_GetDeviceBindingRevision(steam_input, inputHandle, pMajor, pMinor);
}


SteamInput_GetRemotePlaySessionID :: inline (inputHandle: InputHandle_t) -> uint32 #foreign steam "SteamAPI_ISteamInput_GetRemot {
    return SteamInput_GetRemotePlaySessionID(steam_input, inputHandle);
}
