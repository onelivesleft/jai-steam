steam_inventory : *ISteamInventory;

SteamInventory : SteamInventory_Namespace;


#scope_file


SteamInventory_Namespace :: struct {
    // procs
                    :: SteamInventory_GetResultStatus
                     :: SteamInventory_GetResultItems
              :: SteamInventory_GetResultItemProperty
                 :: SteamInventory_GetResultTimestamp
                 :: SteamInventory_CheckResultSteamID
                      :: SteamInventory_DestroyResult
                        :: SteamInventory_GetAllItems
                       :: SteamInventory_GetItemsByID
                    :: SteamInventory_SerializeResult
                  :: SteamInventory_DeserializeResult
                      :: SteamInventory_GenerateItems
                    :: SteamInventory_GrantPromoItems
                       :: SteamInventory_AddPromoItem
                      :: SteamInventory_AddPromoItems
                        :: SteamInventory_ConsumeItem
                      :: SteamInventory_ExchangeItems
               :: SteamInventory_TransferItemQuantity
              :: SteamInventory_SendItemDropHeartbeat
                    :: SteamInventory_TriggerItemDrop
                         :: SteamInventory_TradeItems
                :: SteamInventory_LoadItemDefinitions
               :: SteamInventory_GetItemDefinitionIDs
          :: SteamInventory_GetItemDefinitionProperty
    :: SteamInventory_RequestEligiblePromoItemDefinitionsIDs
    :: SteamInventory_GetEligiblePromoItemDefinitionIDs
                      :: SteamInventory_StartPurchase
                      :: SteamInventory_RequestPrices
              :: SteamInventory_GetNumItemsWithPrices
                 :: SteamInventory_GetItemsWithPrices
                       :: SteamInventory_GetItemPrice
              :: SteamInventory_StartUpdateProperties
                     :: SteamInventory_RemoveProperty
                  :: SteamInventory_SetPropertyString
                    :: SteamInventory_SetPropertyBool
                   :: SteamInventory_SetPropertyInt64
                   :: SteamInventory_SetPropertyFloat
             :: SteamInventory_SubmitUpdateProperties
                        :: SteamInventory_InspectItem
}


SteamInventory_GetResultStatus :: inline (resultHandle: SteamInventoryResult_t) -> EResult {
    return SteamAPI_ISteamInventory_GetResultStatus(steam_inventory, resultHandle: SteamInventoryResult_t);
}


SteamInventory_GetResultItems :: inline (resultHandle: SteamInventoryResult_t, pOutItemsArray: *SteamItemDetails_t, punOutItemsArraySize: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetResultItems(steam_inventory, resultHandle: SteamInventoryResult_t, pOutItemsArray: *SteamItemDetails_t, punOutItemsArraySize: *uint32);
}


SteamInventory_GetResultItemProperty :: inline (resultHandle: SteamInventoryResult_t, unItemIndex: uint32, pchPropertyName: *char, pchValueBuffer: *char, punValueBufferSizeOut: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetResultItemProperty(steam_inventory, resultHandle: SteamInventoryResult_t, unItemIndex: uint32, pchPropertyName: *char, pchValueBuffer: *char, punValueBufferSizeOut: *uint32);
}


SteamInventory_GetResultTimestamp :: inline (resultHandle: SteamInventoryResult_t) -> uint32 {
    return SteamAPI_ISteamInventory_GetResultTimestamp(steam_inventory, resultHandle: SteamInventoryResult_t);
}


SteamInventory_CheckResultSteamID :: inline (resultHandle: SteamInventoryResult_t, steamIDExpected: uint64_steamid) -> bool {
    return SteamAPI_ISteamInventory_CheckResultSteamID(steam_inventory, resultHandle: SteamInventoryResult_t, steamIDExpected: uint64_steamid);
}


SteamInventory_DestroyResult :: inline (resultHandle: SteamInventoryResult_t) {
    SteamAPI_ISteamInventory_DestroyResult(steam_inventory, resultHandle: SteamInventoryResult_t);
}


SteamInventory_GetAllItems :: inline (pResultHandle: *SteamInventoryResult_t) -> bool {
    return SteamAPI_ISteamInventory_GetAllItems(steam_inventory, pResultHandle: *SteamInventoryResult_t);
}


SteamInventory_GetItemsByID :: inline (pResultHandle: *SteamInventoryResult_t, pInstanceIDs: *SteamItemInstanceID_t, unCountInstanceIDs: uint32) -> bool {
    return SteamAPI_ISteamInventory_GetItemsByID(steam_inventory, pResultHandle: *SteamInventoryResult_t, pInstanceIDs: *SteamItemInstanceID_t, unCountInstanceIDs: uint32);
}


SteamInventory_SerializeResult :: inline (resultHandle: SteamInventoryResult_t, pOutBuffer: *void, punOutBufferSize: *uint32) -> bool {
    return SteamAPI_ISteamInventory_SerializeResult(steam_inventory, resultHandle: SteamInventoryResult_t, pOutBuffer: *void, punOutBufferSize: *uint32);
}


SteamInventory_DeserializeResult :: inline (pOutResultHandle: *SteamInventoryResult_t, pBuffer: *void, unBufferSize: uint32, bRESERVED_MUST_BE_FALSE: bool) -> bool {
    return SteamAPI_ISteamInventory_DeserializeResult(steam_inventory, pOutResultHandle: *SteamInventoryResult_t, pBuffer: *void, unBufferSize: uint32, bRESERVED_MUST_BE_FALSE: bool);
}


SteamInventory_GenerateItems :: inline (pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_GenerateItems(steam_inventory, pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32);
}


SteamInventory_GrantPromoItems :: inline (pResultHandle: *SteamInventoryResult_t) -> bool {
    return SteamAPI_ISteamInventory_GrantPromoItems(steam_inventory, pResultHandle: *SteamInventoryResult_t);
}


SteamInventory_AddPromoItem :: inline (pResultHandle: *SteamInventoryResult_t, itemDef: SteamItemDef_t) -> bool {
    return SteamAPI_ISteamInventory_AddPromoItem(steam_inventory, pResultHandle: *SteamInventoryResult_t, itemDef: SteamItemDef_t);
}


SteamInventory_AddPromoItems :: inline (pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, unArrayLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_AddPromoItems(steam_inventory, pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, unArrayLength: uint32);
}


SteamInventory_ConsumeItem :: inline (pResultHandle: *SteamInventoryResult_t, itemConsume: SteamItemInstanceID_t, unQuantity: uint32) -> bool {
    return SteamAPI_ISteamInventory_ConsumeItem(steam_inventory, pResultHandle: *SteamInventoryResult_t, itemConsume: SteamItemInstanceID_t, unQuantity: uint32);
}


SteamInventory_ExchangeItems :: inline (pResultHandle: *SteamInventoryResult_t, pArrayGenerate: *SteamItemDef_t, punArrayGenerateQuantity: *uint32, unArrayGenerateLength: uint32, pArrayDestroy: *SteamItemInstanceID_t, punArrayDestroyQuantity: *uint32, unArrayDestroyLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_ExchangeItems(steam_inventory, pResultHandle: *SteamInventoryResult_t, pArrayGenerate: *SteamItemDef_t, punArrayGenerateQuantity: *uint32, unArrayGenerateLength: uint32, pArrayDestroy: *SteamItemInstanceID_t, punArrayDestroyQuantity: *uint32, unArrayDestroyLength: uint32);
}


SteamInventory_TransferItemQuantity :: inline (pResultHandle: *SteamInventoryResult_t, itemIdSource: SteamItemInstanceID_t, unQuantity: uint32, itemIdDest: SteamItemInstanceID_t) -> bool {
    return SteamAPI_ISteamInventory_TransferItemQuantity(steam_inventory, pResultHandle: *SteamInventoryResult_t, itemIdSource: SteamItemInstanceID_t, unQuantity: uint32, itemIdDest: SteamItemInstanceID_t);
}


SteamInventory_SendItemDropHeartbeat :: inline () {
    SteamAPI_ISteamInventory_SendItemDropHeartbeat(steam_inventory);
}


SteamInventory_TriggerItemDrop :: inline (pResultHandle: *SteamInventoryResult_t, dropListDefinition: SteamItemDef_t) -> bool {
    return SteamAPI_ISteamInventory_TriggerItemDrop(steam_inventory, pResultHandle: *SteamInventoryResult_t, dropListDefinition: SteamItemDef_t);
}


SteamInventory_TradeItems :: inline (pResultHandle: *SteamInventoryResult_t, steamIDTradePartner: uint64_steamid, pArrayGive: *SteamItemInstanceID_t, pArrayGiveQuantity: *uint32, nArrayGiveLength: uint32, pArrayGet: *SteamItemInstanceID_t, pArrayGetQuantity: *uint32, nArrayGetLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_TradeItems(steam_inventory, pResultHandle: *SteamInventoryResult_t, steamIDTradePartner: uint64_steamid, pArrayGive: *SteamItemInstanceID_t, pArrayGiveQuantity: *uint32, nArrayGiveLength: uint32, pArrayGet: *SteamItemInstanceID_t, pArrayGetQuantity: *uint32, nArrayGetLength: uint32);
}


SteamInventory_LoadItemDefinitions :: inline () -> bool {
    return SteamAPI_ISteamInventory_LoadItemDefinitions(steam_inventory);
}


SteamInventory_GetItemDefinitionIDs :: inline (pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetItemDefinitionIDs(steam_inventory, pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32);
}


SteamInventory_GetItemDefinitionProperty :: inline (iDefinition: SteamItemDef_t, pchPropertyName: *char, pchValueBuffer: *char, punValueBufferSizeOut: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetItemDefinitionProperty(steam_inventory, iDefinition: SteamItemDef_t, pchPropertyName: *char, pchValueBuffer: *char, punValueBufferSizeOut: *uint32);
}


SteamInventory_RequestEligiblePromoItemDefinitionsIDs :: inline (steamID: uint64_steamid) -> SteamAPICall_t {
    return SteamAPI_ISteamInventory_RequestEligiblePromoItemDefinitionsIDs(steam_inventory, steamID: uint64_steamid);
}


SteamInventory_GetEligiblePromoItemDefinitionIDs :: inline (steamID: uint64_steamid, pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetEligiblePromoItemDefinitionIDs(steam_inventory, steamID: uint64_steamid, pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32);
}


SteamInventory_StartPurchase :: inline (pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> SteamAPICall_t {
    return SteamAPI_ISteamInventory_StartPurchase(steam_inventory, pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32);
}


SteamInventory_RequestPrices :: inline () -> SteamAPICall_t {
    return SteamAPI_ISteamInventory_RequestPrices(steam_inventory);
}


SteamInventory_GetNumItemsWithPrices :: inline () -> uint32 {
    return SteamAPI_ISteamInventory_GetNumItemsWithPrices(steam_inventory);
}


SteamInventory_GetItemsWithPrices :: inline (pArrayItemDefs: *SteamItemDef_t, pCurrentPrices: *uint64, pBasePrices: *uint64, unArrayLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_GetItemsWithPrices(steam_inventory, pArrayItemDefs: *SteamItemDef_t, pCurrentPrices: *uint64, pBasePrices: *uint64, unArrayLength: uint32);
}


SteamInventory_GetItemPrice :: inline (iDefinition: SteamItemDef_t, pCurrentPrice: *uint64, pBasePrice: *uint64) -> bool {
    return SteamAPI_ISteamInventory_GetItemPrice(steam_inventory, iDefinition: SteamItemDef_t, pCurrentPrice: *uint64, pBasePrice: *uint64);
}


SteamInventory_StartUpdateProperties :: inline () -> SteamInventoryUpdateHandle_t {
    return SteamAPI_ISteamInventory_StartUpdateProperties(steam_inventory);
}


SteamInventory_RemoveProperty :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char) -> bool {
    return SteamAPI_ISteamInventory_RemoveProperty(steam_inventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char);
}


SteamInventory_SetPropertyString :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, pchPropertyValue: *char) -> bool {
    return SteamAPI_ISteamInventory_SetPropertyString(steam_inventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, pchPropertyValue: *char);
}


SteamInventory_SetPropertyBool :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, bValue: bool) -> bool {
    return SteamAPI_ISteamInventory_SetPropertyBool(steam_inventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, bValue: bool);
}


SteamInventory_SetPropertyInt64 :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, nValue: int64) -> bool {
    return SteamAPI_ISteamInventory_SetPropertyInt64(steam_inventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, nValue: int64);
}


SteamInventory_SetPropertyFloat :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, flValue: float) -> bool {
    return SteamAPI_ISteamInventory_SetPropertyFloat(steam_inventory, handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, flValue: float);
}


SteamInventory_SubmitUpdateProperties :: inline (handle: SteamInventoryUpdateHandle_t, pResultHandle: *SteamInventoryResult_t) -> bool {
    return SteamAPI_ISteamInventory_SubmitUpdateProperties(steam_inventory, handle: SteamInventoryUpdateHandle_t, pResultHandle: *SteamInventoryResult_t);
}


SteamInventory_InspectItem :: inline (pResultHandle: *SteamInventoryResult_t, pchItemToken: *char) -> bool {
    return SteamAPI_ISteamInventory_InspectItem(steam_inventory, pResultHandle: *SteamInventoryResult_t, pchItemToken: *char);
}
