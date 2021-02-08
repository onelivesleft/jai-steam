steam_input : *ISteamInput;

SteamInput : SteamInput_Namespace;


#scope_file


SteamInput_Namespace :: struct {
    // procs
                               :: SteamInput_Init
                           :: SteamInput_Shutdown
                           :: SteamInput_RunFrame
            :: SteamInput_GetConnectedControllers
                 :: SteamInput_GetActionSetHandle
                  :: SteamInput_ActivateActionSet
                :: SteamInput_GetCurrentActionSet
             :: SteamInput_ActivateActionSetLayer
           :: SteamInput_DeactivateActionSetLayer
       :: SteamInput_DeactivateAllActionSetLayers
           :: SteamInput_GetActiveActionSetLayers
             :: SteamInput_GetDigitalActionHandle
               :: SteamInput_GetDigitalActionData
            :: SteamInput_GetDigitalActionOrigins
              :: SteamInput_GetAnalogActionHandle
                :: SteamInput_GetAnalogActionData
             :: SteamInput_GetAnalogActionOrigins
            :: SteamInput_GetGlyphForActionOrigin
           :: SteamInput_GetStringForActionOrigin
           :: SteamInput_StopAnalogActionMomentum
                      :: SteamInput_GetMotionData
                   :: SteamInput_TriggerVibration
                        :: SteamInput_SetLEDColor
                 :: SteamInput_TriggerHapticPulse
         :: SteamInput_TriggerRepeatedHapticPulse
                   :: SteamInput_ShowBindingPanel
              :: SteamInput_GetInputTypeForHandle
       :: SteamInput_GetControllerForGamepadIndex
       :: SteamInput_GetGamepadIndexForController
             :: SteamInput_GetStringForXboxOrigin
              :: SteamInput_GetGlyphForXboxOrigin
      :: SteamInput_GetActionOriginFromXboxOrigin
              :: SteamInput_TranslateActionOrigin
           :: SteamInput_GetDeviceBindingRevision
             :: SteamInput_GetRemotePlaySessionID
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
    return SteamAPI_ISteamInput_GetConnectedControllers(steam_input, handlesOut: *InputHandle_t);
}


SteamInput_GetActionSetHandle :: inline (pszActionSetName: *char) -> InputActionSetHandle_t {
    return SteamAPI_ISteamInput_GetActionSetHandle(steam_input, pszActionSetName: *char);
}


SteamInput_ActivateActionSet :: inline (inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t) {
    SteamAPI_ISteamInput_ActivateActionSet(steam_input, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t);
}


SteamInput_GetCurrentActionSet :: inline (inputHandle: InputHandle_t) -> InputActionSetHandle_t {
    return SteamAPI_ISteamInput_GetCurrentActionSet(steam_input, inputHandle: InputHandle_t);
}


SteamInput_ActivateActionSetLayer :: inline (inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) {
    SteamAPI_ISteamInput_ActivateActionSetLayer(steam_input, inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t);
}


SteamInput_DeactivateActionSetLayer :: inline (inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t) {
    SteamAPI_ISteamInput_DeactivateActionSetLayer(steam_input, inputHandle: InputHandle_t, actionSetLayerHandle: InputActionSetHandle_t);
}


SteamInput_DeactivateAllActionSetLayers :: inline (inputHandle: InputHandle_t) {
    SteamAPI_ISteamInput_DeactivateAllActionSetLayers(steam_input, inputHandle: InputHandle_t);
}


SteamInput_GetActiveActionSetLayers :: inline (inputHandle: InputHandle_t, handlesOut: *InputActionSetHandle_t) -> s32 {
    return SteamAPI_ISteamInput_GetActiveActionSetLayers(steam_input, inputHandle: InputHandle_t, handlesOut: *InputActionSetHandle_t);
}


SteamInput_GetDigitalActionHandle :: inline (pszActionName: *char) -> InputDigitalActionHandle_t {
    return SteamAPI_ISteamInput_GetDigitalActionHandle(steam_input, pszActionName: *char);
}


SteamInput_GetDigitalActionData :: inline (inputHandle: InputHandle_t, digitalActionHandle: InputDigitalActionHandle_t) -> InputDigitalActionData_t {
    return SteamAPI_ISteamInput_GetDigitalActionData(steam_input, inputHandle: InputHandle_t, digitalActionHandle: InputDigitalActionHandle_t);
}


SteamInput_GetDigitalActionOrigins :: inline (inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, digitalActionHandle: InputDigitalActionHandle_t, originsOut: *EInputActionOrigin) -> s32 {
    return SteamAPI_ISteamInput_GetDigitalActionOrigins(steam_input, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, digitalActionHandle: InputDigitalActionHandle_t, originsOut: *EInputActionOrigin);
}


SteamInput_GetAnalogActionHandle :: inline (pszActionName: *char) -> InputAnalogActionHandle_t {
    return SteamAPI_ISteamInput_GetAnalogActionHandle(steam_input, pszActionName: *char);
}


SteamInput_GetAnalogActionData :: inline (inputHandle: InputHandle_t, analogActionHandle: InputAnalogActionHandle_t) -> InputAnalogActionData_t {
    return SteamAPI_ISteamInput_GetAnalogActionData(steam_input, inputHandle: InputHandle_t, analogActionHandle: InputAnalogActionHandle_t);
}


SteamInput_GetAnalogActionOrigins :: inline (inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, analogActionHandle: InputAnalogActionHandle_t, originsOut: *EInputActionOrigin) -> s32 {
    return SteamAPI_ISteamInput_GetAnalogActionOrigins(steam_input, inputHandle: InputHandle_t, actionSetHandle: InputActionSetHandle_t, analogActionHandle: InputAnalogActionHandle_t, originsOut: *EInputActionOrigin);
}


SteamInput_GetGlyphForActionOrigin :: inline (eOrigin: EInputActionOrigin) -> *char {
    return SteamAPI_ISteamInput_GetGlyphForActionOrigin(steam_input, eOrigin: EInputActionOrigin);
}


SteamInput_GetStringForActionOrigin :: inline (eOrigin: EInputActionOrigin) -> *char {
    return SteamAPI_ISteamInput_GetStringForActionOrigin(steam_input, eOrigin: EInputActionOrigin);
}


SteamInput_StopAnalogActionMomentum :: inline (inputHandle: InputHandle_t, eAction: InputAnalogActionHandle_t) {
    SteamAPI_ISteamInput_StopAnalogActionMomentum(steam_input, inputHandle: InputHandle_t, eAction: InputAnalogActionHandle_t);
}


SteamInput_GetMotionData :: inline (inputHandle: InputHandle_t) -> InputMotionData_t {
    return SteamAPI_ISteamInput_GetMotionData(steam_input, inputHandle: InputHandle_t);
}


SteamInput_TriggerVibration :: inline (inputHandle: InputHandle_t, usLeftSpeed: u16, usRightSpeed: u16) {
    SteamAPI_ISteamInput_TriggerVibration(steam_input, inputHandle: InputHandle_t, usLeftSpeed: u16, usRightSpeed: u16);
}


SteamInput_SetLEDColor :: inline (inputHandle: InputHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32) {
    SteamAPI_ISteamInput_SetLEDColor(steam_input, inputHandle: InputHandle_t, nColorR: uint8, nColorG: uint8, nColorB: uint8, nFlags: u32);
}


SteamInput_TriggerHapticPulse :: inline (inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16) {
    SteamAPI_ISteamInput_TriggerHapticPulse(steam_input, inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16);
}


SteamInput_TriggerRepeatedHapticPulse :: inline (inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32) {
    SteamAPI_ISteamInput_TriggerRepeatedHapticPulse(steam_input, inputHandle: InputHandle_t, eTargetPad: ESteamControllerPad, usDurationMicroSec: u16, usOffMicroSec: u16, unRepeat: u16, nFlags: u32);
}


SteamInput_ShowBindingPanel :: inline (inputHandle: InputHandle_t) -> bool {
    return SteamAPI_ISteamInput_ShowBindingPanel(steam_input, inputHandle: InputHandle_t);
}


SteamInput_GetInputTypeForHandle :: inline (inputHandle: InputHandle_t) -> ESteamInputType {
    return SteamAPI_ISteamInput_GetInputTypeForHandle(steam_input, inputHandle: InputHandle_t);
}


SteamInput_GetControllerForGamepadIndex :: inline (nIndex: s32) -> InputHandle_t {
    return SteamAPI_ISteamInput_GetControllerForGamepadIndex(steam_input, nIndex: s32);
}


SteamInput_GetGamepadIndexForController :: inline (ulinputHandle: InputHandle_t) -> s32 {
    return SteamAPI_ISteamInput_GetGamepadIndexForController(steam_input, ulinputHandle: InputHandle_t);
}


SteamInput_GetStringForXboxOrigin :: inline (eOrigin: EXboxOrigin) -> *char {
    return SteamAPI_ISteamInput_GetStringForXboxOrigin(steam_input, eOrigin: EXboxOrigin);
}


SteamInput_GetGlyphForXboxOrigin :: inline (eOrigin: EXboxOrigin) -> *char {
    return SteamAPI_ISteamInput_GetGlyphForXboxOrigin(steam_input, eOrigin: EXboxOrigin);
}


SteamInput_GetActionOriginFromXboxOrigin :: inline (inputHandle: InputHandle_t, eOrigin: EXboxOrigin) -> EInputActionOrigin {
    return SteamAPI_ISteamInput_GetActionOriginFromXboxOrigin(steam_input, inputHandle: InputHandle_t, eOrigin: EXboxOrigin);
}


SteamInput_TranslateActionOrigin :: inline (eDestinationInputType: ESteamInputType, eSourceOrigin: EInputActionOrigin) -> EInputActionOrigin {
    return SteamAPI_ISteamInput_TranslateActionOrigin(steam_input, eDestinationInputType: ESteamInputType, eSourceOrigin: EInputActionOrigin);
}


SteamInput_GetDeviceBindingRevision :: inline (inputHandle: InputHandle_t, pMajor: *s32, pMinor: *s32) -> bool {
    return SteamAPI_ISteamInput_GetDeviceBindingRevision(steam_input, inputHandle: InputHandle_t, pMajor: *s32, pMinor: *s32);
}


SteamInput_GetRemotePlaySessionID :: inline (inputHandle: InputHandle_t) -> uint32 {
    return SteamAPI_ISteamInput_GetRemotePlaySessionID(steam_input, inputHandle: InputHandle_t);
}
