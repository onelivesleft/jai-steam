steam_controller : *ISteamController;

SteamController : SteamController_Namespace;


#scope_file


SteamController_Namespace :: struct {
    // procs
                               :: SteamController_Init
                           :: SteamController_Shutdown
                           :: SteamController_RunFrame
            :: SteamController_GetConnectedControllers
                 :: SteamController_GetActionSetHandle
                  :: SteamController_ActivateActionSet
                :: SteamController_GetCurrentActionSet
             :: SteamController_ActivateActionSetLayer
           :: SteamController_DeactivateActionSetLayer
       :: SteamController_DeactivateAllActionSetLayers
           :: SteamController_GetActiveActionSetLayers
             :: SteamController_GetDigitalActionHandle
               :: SteamController_GetDigitalActionData
            :: SteamController_GetDigitalActionOrigins
              :: SteamController_GetAnalogActionHandle
                :: SteamController_GetAnalogActionData
             :: SteamController_GetAnalogActionOrigins
            :: SteamController_GetGlyphForActionOrigin
           :: SteamController_GetStringForActionOrigin
           :: SteamController_StopAnalogActionMomentum
                      :: SteamController_GetMotionData
                 :: SteamController_TriggerHapticPulse
         :: SteamController_TriggerRepeatedHapticPulse
                   :: SteamController_TriggerVibration
                        :: SteamController_SetLEDColor
                   :: SteamController_ShowBindingPanel
              :: SteamController_GetInputTypeForHandle
       :: SteamController_GetControllerForGamepadIndex
       :: SteamController_GetGamepadIndexForController
             :: SteamController_GetStringForXboxOrigin
              :: SteamController_GetGlyphForXboxOrigin
      :: SteamController_GetActionOriginFromXboxOrigin
              :: SteamController_TranslateActionOrigin
       :: SteamController_GetControllerBindingRevision
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
    return SteamAPI_ISteamController_GetConnectedControllers(steam_controller, handlesOut: *ControllerHandle_t);
}


SteamController_GetActionSetHandle :: inline (pszActionSetName: *char) -> ControllerActionSetHandle_t {
    return SteamAPI_ISteamController_GetActionSetHandle(steam_controller, pszActionSetName: *char);
}


SteamController_ActivateActionSet :: inline (controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t) {
    SteamAPI_ISteamController_ActivateActionSet(steam_controller, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t);
}


SteamController_GetCurrentActionSet :: inline (controllerHandle: ControllerHandle_t) -> ControllerActionSetHandle_t {
    return SteamAPI_ISteamController_GetCurrentActionSet(steam_controller, controllerHandle: ControllerHandle_t);
}


SteamController_ActivateActionSetLayer :: inline (controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) {
    SteamAPI_ISteamController_ActivateActionSetLayer(steam_controller, controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t);
}


SteamController_DeactivateActionSetLayer :: inline (controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t) {
    SteamAPI_ISteamController_DeactivateActionSetLayer(steam_controller, controllerHandle: ControllerHandle_t, actionSetLayerHandle: ControllerActionSetHandle_t);
}


SteamController_DeactivateAllActionSetLayers :: inline (controllerHandle: ControllerHandle_t) {
    SteamAPI_ISteamController_DeactivateAllActionSetLayers(steam_controller, controllerHandle: ControllerHandle_t);
}


SteamController_GetActiveActionSetLayers :: inline (controllerHandle: ControllerHandle_t, handlesOut: *ControllerActionSetHandle_t) -> s32 {
    return SteamAPI_ISteamController_GetActiveActionSetLayers(steam_controller, controllerHandle: ControllerHandle_t, handlesOut: *ControllerActionSetHandle_t);
}


SteamController_GetDigitalActionHandle :: inline (pszActionName: *char) -> ControllerDigitalActionHandle_t {
    return SteamAPI_ISteamController_GetDigitalActionHandle(steam_controller, pszActionName: *char);
}


SteamController_GetDigitalActionData :: inline (controllerHandle: ControllerHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t) -> InputDigitalActionData_t {
    return SteamAPI_ISteamController_GetDigitalActionData(steam_controller, controllerHandle: ControllerHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t);
}


SteamController_GetDigitalActionOrigins :: inline (controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t, originsOut: *EControllerActionOrigin) -> s32 {
    return SteamAPI_ISteamController_GetDigitalActionOrigins(steam_controller, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, digitalActionHandle: ControllerDigitalActionHandle_t, originsOut: *EControllerActionOrigin);
}


SteamController_GetAnalogActionHandle :: inline (pszActionName: *char) -> ControllerAnalogActionHandle_t {
    return SteamAPI_ISteamController_GetAnalogActionHandle(steam_controller, pszActionName: *char);
}


SteamController_GetAnalogActionData :: inline (controllerHandle: ControllerHandle_t, analogActionHandle: ControllerAnalogActionHandle_t) -> InputAnalogActionData_t {
    return SteamAPI_ISteamController_GetAnalogActionData(steam_controller, controllerHandle: ControllerHandle_t, analogActionHandle: ControllerAnalogActionHandle_t);
}


SteamController_GetAnalogActionOrigins :: inline (controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, analogActionHandle: ControllerAnalogActionHandle_t, originsOut: *EControllerActionOrigin) -> s32 {
    return SteamAPI_ISteamController_GetAnalogActionOrigins(steam_controller, controllerHandle: ControllerHandle_t, actionSetHandle: ControllerActionSetHandle_t, analogActionHandle: ControllerAnalogActionHandle_t, originsOut: *EControllerActionOrigin);
}


SteamController_GetGlyphForActionOrigin :: inline (eOrigin: EControllerActionOrigin) -> *char {
    return SteamAPI_ISteamController_GetGlyphForActionOrigin(steam_controller, eOrigin: EControllerActionOrigin);
}


SteamController_GetStringForActionOrigin :: inline (eOrigin: EControllerActionOrigin) -> *char {
    return SteamAPI_ISteamController_GetStringForActionOrigin(steam_controller, eOrigin: EControllerActionOrigin);
}


SteamController_StopAnalogActionMomentum :: inline (controllerHandle: ControllerHandle_t, eAction: ControllerAnalogActionHandle_t) {
    SteamAPI_ISteamController_StopAnalogActionMomentum(steam_controller, controllerHandle: ControllerHandle_t, eAction: ControllerAnalogActionHandle_t);
}


SteamController_GetMotionData :: inline (controllerHandle: ControllerHandle_t) -> InputMotionData_t {
    return SteamAPI_ISteamController_GetMotionData(steam_controller, controllerHandle: ControllerHandle_t);
}


SteamController_TriggerHapticPulse :: inline (controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) {
    SteamAPI_ISteamController_TriggerHapticPulse(steam_controller, controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16);
}


SteamController_TriggerRepeatedHapticPulse :: inline (controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) {
    SteamAPI_ISteamController_TriggerRepeatedHapticPulse(steam_controller, controllerHandle: ControllerHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32);
}


SteamController_TriggerVibration :: inline (controllerHandle: ControllerHandle_t, usLeftSpeed: u16, usRightSpeed: u16) {
    SteamAPI_ISteamController_TriggerVibration(steam_controller, controllerHandle: ControllerHandle_t, usLeftSpeed: u16, usRightSpeed: u16);
}


SteamController_SetLEDColor :: inline (controllerHandle: ControllerHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32) {
    SteamAPI_ISteamController_SetLEDColor(steam_controller, controllerHandle: ControllerHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32);
}


SteamController_ShowBindingPanel :: inline (controllerHandle: ControllerHandle_t) -> bool {
    return SteamAPI_ISteamController_ShowBindingPanel(steam_controller, controllerHandle: ControllerHandle_t);
}


SteamController_GetInputTypeForHandle :: inline (controllerHandle: ControllerHandle_t) -> ESteamInputType {
    return SteamAPI_ISteamController_GetInputTypeForHandle(steam_controller, controllerHandle: ControllerHandle_t);
}


SteamController_GetControllerForGamepadIndex :: inline (nIndex: s32) -> ControllerHandle_t {
    return SteamAPI_ISteamController_GetControllerForGamepadIndex(steam_controller, nIndex: s32);
}


SteamController_GetGamepadIndexForController :: inline (ulControllerHandle: ControllerHandle_t) -> s32 {
    return SteamAPI_ISteamController_GetGamepadIndexForController(steam_controller, ulControllerHandle: ControllerHandle_t);
}


SteamController_GetStringForXboxOrigin :: inline (eOrigin: EXboxOrigin) -> *char {
    return SteamAPI_ISteamController_GetStringForXboxOrigin(steam_controller, eOrigin: EXboxOrigin);
}


SteamController_GetGlyphForXboxOrigin :: inline (eOrigin: EXboxOrigin) -> *char {
    return SteamAPI_ISteamController_GetGlyphForXboxOrigin(steam_controller, eOrigin: EXboxOrigin);
}


SteamController_GetActionOriginFromXboxOrigin :: inline (controllerHandle: ControllerHandle_t, eOrigin: EXboxOrigin) -> EControllerActionOrigin {
    return SteamAPI_ISteamController_GetActionOriginFromXboxOrigin(steam_controller, controllerHandle: ControllerHandle_t, eOrigin: EXboxOrigin);
}


SteamController_TranslateActionOrigin :: inline (eDestinationInputType: ESteamInputType, eSourceOrigin: EControllerActionOrigin) -> EControllerActionOrigin {
    return SteamAPI_ISteamController_TranslateActionOrigin(steam_controller, eDestinationInputType: ESteamInputType, eSourceOrigin: EControllerActionOrigin);
}


SteamController_GetControllerBindingRevision :: inline (controllerHandle: ControllerHandle_t, pMajor: *s32, pMinor: *s32) -> bool {
    return SteamAPI_ISteamController_GetControllerBindingRevision(steam_controller, controllerHandle: ControllerHandle_t, pMajor: *s32, pMinor: *s32);
}
