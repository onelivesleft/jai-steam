steam_controller : *ISteamController;
SteamController : SteamController_Namespace;


#scope_file


SteamController_Namespace :: struct {
    // procs
    Init                                               :: SteamController_Init;
    Shutdown                                           :: SteamController_Shutdown;
    RunFrame                                           :: SteamController_RunFrame;
    GetConnectedControllers                            :: SteamController_GetConnectedControllers;
    GetActionSetHandle                                 :: SteamController_GetActionSetHandle;
    ActivateActionSet                                  :: SteamController_ActivateActionSet;
    GetCurrentActionSet                                :: SteamController_GetCurrentActionSet;
    ActivateActionSetLayer                             :: SteamController_ActivateActionSetLayer;
    DeactivateActionSetLayer                           :: SteamController_DeactivateActionSetLayer;
    DeactivateAllActionSetLayers                       :: SteamController_DeactivateAllActionSetLayers;
    GetActiveActionSetLayers                           :: SteamController_GetActiveActionSetLayers;
    GetDigitalActionHandle                             :: SteamController_GetDigitalActionHandle;
    GetDigitalActionData                               :: SteamController_GetDigitalActionData;
    GetDigitalActionOrigins                            :: SteamController_GetDigitalActionOrigins;
    GetAnalogActionHandle                              :: SteamController_GetAnalogActionHandle;
    GetAnalogActionData                                :: SteamController_GetAnalogActionData;
    GetAnalogActionOrigins                             :: SteamController_GetAnalogActionOrigins;
    GetGlyphForActionOrigin                            :: SteamController_GetGlyphForActionOrigin;
    GetStringForActionOrigin                           :: SteamController_GetStringForActionOrigin;
    StopAnalogActionMomentum                           :: SteamController_StopAnalogActionMomentum;
    GetMotionData                                      :: SteamController_GetMotionData;
    TriggerHapticPulse                                 :: SteamController_TriggerHapticPulse;
    TriggerRepeatedHapticPulse                         :: SteamController_TriggerRepeatedHapticPulse;
    TriggerVibration                                   :: SteamController_TriggerVibration;
    SetLEDColor                                        :: SteamController_SetLEDColor;
    ShowBindingPanel                                   :: SteamController_ShowBindingPanel;
    GetInputTypeForHandle                              :: SteamController_GetInputTypeForHandle;
    GetControllerForGamepadIndex                       :: SteamController_GetControllerForGamepadIndex;
    GetGamepadIndexForController                       :: SteamController_GetGamepadIndexForController;
    GetStringForXboxOrigin                             :: SteamController_GetStringForXboxOrigin;
    GetGlyphForXboxOrigin                              :: SteamController_GetGlyphForXboxOrigin;
    GetActionOriginFromXboxOrigin                      :: SteamController_GetActionOriginFromXboxOrigin;
    TranslateActionOrigin                              :: SteamController_TranslateActionOrigin;
    GetControllerBindingRevision                       :: SteamController_GetControllerBindingRevision;
}


SteamController_Init :: inline () -> bool {
    return SteamAPI_ISteamController_Init(steam_controller);
}


SteamController_Shutdown :: inline () -> bool {
    return SteamAPI_ISteamController_Shutdown(steam_controller);
}


SteamController_RunFrame :: inline () {
    SteamAPI_ISteamController_RunFrame(steam_controller);
}


SteamController_GetConnectedControllers :: inline (handlesOut: *ControllerHandle_t) -> s32 {
    return SteamAPI_ISteamController_GetConnectedControllers(steam_controller, handlesOut);
}


SteamController_GetActionSetHandle :: inline (pszActionSetName: *char) -> ControllerActionSetHandle_t {
    return SteamAPI_ISteamController_GetActionSetHandle(steam_controller, pszActionSetName);
}


SteamController_ActivateActionSet :: inline (controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t) {
    SteamAPI_ISteamController_ActivateActionSet(steam_controller, controllerHandle, actionSetHandle);
}


SteamController_GetCurrentActionSet :: inline (controllerHandle: ControllerHandle_t) -> ControllerActionSetHandle_t {
    return SteamAPI_ISteamController_GetCurrentActionSet(steam_controller, controllerHandle);
}


SteamController_ActivateActionSetLayer :: inline (controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) {
    SteamAPI_ISteamController_ActivateActionSetLayer(steam_controller, controllerHandle, actionSetLayerHandle);
}


SteamController_DeactivateActionSetLayer :: inline (controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) {
    SteamAPI_ISteamController_DeactivateActionSetLayer(steam_controller, controllerHandle, actionSetLayerHandle);
}


SteamController_DeactivateAllActionSetLayers :: inline (controllerHandle: ControllerHandle_t) {
    SteamAPI_ISteamController_DeactivateAllActionSetLayers(steam_controller, controllerHandle);
}


SteamController_GetActiveActionSetLayers :: inline (controllerHandle: ControllerHandle_t, handlesOut: *ControllerActionSetHandle_t) -> s32 {
    return SteamAPI_ISteamController_GetActiveActionSetLayers(steam_controller, controllerHandle, handlesOut);
}


SteamController_GetDigitalActionHandle :: inline (pszActionName: *char) -> ControllerDigitalActionHandle_t {
    return SteamAPI_ISteamController_GetDigitalActionHandle(steam_controller, pszActionName);
}


SteamController_GetDigitalActionData :: inline (controllerHandle: ControllerHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t) -> InputDigitalActionData_t {
    return SteamAPI_ISteamController_GetDigitalActionData(steam_controller, controllerHandle, digitalActionHandle);
}


SteamController_GetDigitalActionOrigins :: inline (controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t, originsOut: *EControllerActionOrigin) -> s32 {
    return SteamAPI_ISteamController_GetDigitalActionOrigins(steam_controller, controllerHandle, actionSetHandle, digitalActionHandle, originsOut);
}


SteamController_GetAnalogActionHandle :: inline (pszActionName: *char) -> ControllerAnalogActionHandle_t {
    return SteamAPI_ISteamController_GetAnalogActionHandle(steam_controller, pszActionName);
}


SteamController_GetAnalogActionData :: inline (controllerHandle: ControllerHandle_t, analogActionHandle: ControllerAnalogActionHandle_t) -> InputAnalogActionData_t {
    return SteamAPI_ISteamController_GetAnalogActionData(steam_controller, controllerHandle, analogActionHandle);
}


SteamController_GetAnalogActionOrigins :: inline (controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, analogActionHandle: ControllerAnalogActionHandle_t, originsOut: *EControllerActionOrigin) -> s32 {
    return SteamAPI_ISteamController_GetAnalogActionOrigins(steam_controller, controllerHandle, actionSetHandle, analogActionHandle, originsOut);
}


SteamController_GetGlyphForActionOrigin :: inline (eOrigin: EControllerActionOrigin) -> string {
    return to_string(SteamAPI_ISteamController_GetGlyphForActionOrigin(steam_controller, eOrigin));
}


SteamController_GetStringForActionOrigin :: inline (eOrigin: EControllerActionOrigin) -> string {
    return to_string(SteamAPI_ISteamController_GetStringForActionOrigin(steam_controller, eOrigin));
}


SteamController_StopAnalogActionMomentum :: inline (controllerHandle: ControllerHandle_t, eAction: ControllerAnalogActionHandle_t) {
    SteamAPI_ISteamController_StopAnalogActionMomentum(steam_controller, controllerHandle, eAction);
}


SteamController_GetMotionData :: inline (controllerHandle: ControllerHandle_t) -> InputMotionData_t {
    return SteamAPI_ISteamController_GetMotionData(steam_controller, controllerHandle);
}


SteamController_TriggerHapticPulse :: inline (controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) {
    SteamAPI_ISteamController_TriggerHapticPulse(steam_controller, controllerHandle, eTargetPad, usDurationMicroSec);
}


SteamController_TriggerRepeatedHapticPulse :: inline (controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) {
    SteamAPI_ISteamController_TriggerRepeatedHapticPulse(steam_controller, controllerHandle, eTargetPad, usDurationMicroSec, usOffMicroSec, unRepeat, nFlags);
}


SteamController_TriggerVibration :: inline (controllerHandle: ControllerHandle_t, usLeftSpeed: u16, usRightSpeed: u16) {
    SteamAPI_ISteamController_TriggerVibration(steam_controller, controllerHandle, usLeftSpeed, usRightSpeed);
}


SteamController_SetLEDColor :: inline (controllerHandle: ControllerHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32) {
    SteamAPI_ISteamController_SetLEDColor(steam_controller, controllerHandle, nColorR, nColorG, nColorB, nFlags);
}


SteamController_ShowBindingPanel :: inline (controllerHandle: ControllerHandle_t) -> bool {
    return SteamAPI_ISteamController_ShowBindingPanel(steam_controller, controllerHandle);
}


SteamController_GetInputTypeForHandle :: inline (controllerHandle: ControllerHandle_t) -> ESteamInputType {
    return SteamAPI_ISteamController_GetInputTypeForHandle(steam_controller, controllerHandle);
}


SteamController_GetControllerForGamepadIndex :: inline (nIndex: s32) -> ControllerHandle_t {
    return SteamAPI_ISteamController_GetControllerForGamepadIndex(steam_controller, nIndex);
}


SteamController_GetGamepadIndexForController :: inline (ulControllerHandle: ControllerHandle_t) -> s32 {
    return SteamAPI_ISteamController_GetGamepadIndexForController(steam_controller, ulControllerHandle);
}


SteamController_GetStringForXboxOrigin :: inline (eOrigin: EXboxOrigin) -> string {
    return to_string(SteamAPI_ISteamController_GetStringForXboxOrigin(steam_controller, eOrigin));
}


SteamController_GetGlyphForXboxOrigin :: inline (eOrigin: EXboxOrigin) -> string {
    return to_string(SteamAPI_ISteamController_GetGlyphForXboxOrigin(steam_controller, eOrigin));
}


SteamController_GetActionOriginFromXboxOrigin :: inline (controllerHandle: ControllerHandle_t, eOrigin: EXboxOrigin) -> EControllerActionOrigin {
    return SteamAPI_ISteamController_GetActionOriginFromXboxOrigin(steam_controller, controllerHandle, eOrigin);
}


SteamController_TranslateActionOrigin :: inline (eDestinationInputType: ESteamInputType, eSourceOrigin: EControllerActionOrigin) -> EControllerActionOrigin {
    return SteamAPI_ISteamController_TranslateActionOrigin(steam_controller, eDestinationInputType, eSourceOrigin);
}


SteamController_GetControllerBindingRevision :: inline (controllerHandle: ControllerHandle_t, pMajor: *s32, pMinor: *s32) -> bool {
    return SteamAPI_ISteamController_GetControllerBindingRevision(steam_controller, controllerHandle, pMajor, pMinor);
}
