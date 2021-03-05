steam_inventory : *ISteamInventory;


GetResultStatus :: inline (resultHandle: SteamInventoryResult_t) -> EResult {
    return SteamAPI_ISteamInventory_GetResultStatus(steam_inventory, resultHandle);
}


GetResultItems :: inline (resultHandle: SteamInventoryResult_t, pOutItemsArray: *SteamItemDetails_t, punOutItemsArraySize: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetResultItems(steam_inventory, resultHandle, pOutItemsArray, punOutItemsArraySize);
}


GetResultItemProperty :: inline (resultHandle: SteamInventoryResult_t, unItemIndex: uint32, pchPropertyName: *char, pchValueBuffer: *char, punValueBufferSizeOut: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetResultItemProperty(steam_inventory, resultHandle, unItemIndex, pchPropertyName, pchValueBuffer, punValueBufferSizeOut);
}


GetResultTimestamp :: inline (resultHandle: SteamInventoryResult_t) -> uint32 {
    return SteamAPI_ISteamInventory_GetResultTimestamp(steam_inventory, resultHandle);
}


CheckResultSteamID :: inline (resultHandle: SteamInventoryResult_t, steamIDExpected: uint64_steamid) -> bool {
    return SteamAPI_ISteamInventory_CheckResultSteamID(steam_inventory, resultHandle, steamIDExpected);
}


DestroyResult :: inline (resultHandle: SteamInventoryResult_t) {
    SteamAPI_ISteamInventory_DestroyResult(steam_inventory, resultHandle);
}


GetAllItems :: inline (pResultHandle: *SteamInventoryResult_t) -> bool {
    return SteamAPI_ISteamInventory_GetAllItems(steam_inventory, pResultHandle);
}


GetItemsByID :: inline (pResultHandle: *SteamInventoryResult_t, pInstanceIDs: *SteamItemInstanceID_t, unCountInstanceIDs: uint32) -> bool {
    return SteamAPI_ISteamInventory_GetItemsByID(steam_inventory, pResultHandle, pInstanceIDs, unCountInstanceIDs);
}


SerializeResult :: inline (resultHandle: SteamInventoryResult_t, pOutBuffer: *void, punOutBufferSize: *uint32) -> bool {
    return SteamAPI_ISteamInventory_SerializeResult(steam_inventory, resultHandle, pOutBuffer, punOutBufferSize);
}


DeserializeResult :: inline (pOutResultHandle: *SteamInventoryResult_t, pBuffer: *void, unBufferSize: uint32, bRESERVED_MUST_BE_FALSE: bool) -> bool {
    return SteamAPI_ISteamInventory_DeserializeResult(steam_inventory, pOutResultHandle, pBuffer, unBufferSize, bRESERVED_MUST_BE_FALSE);
}


GenerateItems :: inline (pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_GenerateItems(steam_inventory, pResultHandle, pArrayItemDefs, punArrayQuantity, unArrayLength);
}


GrantPromoItems :: inline (pResultHandle: *SteamInventoryResult_t) -> bool {
    return SteamAPI_ISteamInventory_GrantPromoItems(steam_inventory, pResultHandle);
}


AddPromoItem :: inline (pResultHandle: *SteamInventoryResult_t, itemDef: SteamItemDef_t) -> bool {
    return SteamAPI_ISteamInventory_AddPromoItem(steam_inventory, pResultHandle, itemDef);
}


AddPromoItems :: inline (pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, unArrayLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_AddPromoItems(steam_inventory, pResultHandle, pArrayItemDefs, unArrayLength);
}


ConsumeItem :: inline (pResultHandle: *SteamInventoryResult_t, itemConsume: SteamItemInstanceID_t, unQuantity: uint32) -> bool {
    return SteamAPI_ISteamInventory_ConsumeItem(steam_inventory, pResultHandle, itemConsume, unQuantity);
}


ExchangeItems :: inline (pResultHandle: *SteamInventoryResult_t, pArrayGenerate: *SteamItemDef_t, punArrayGenerateQuantity: *uint32, unArrayGenerateLength: uint32, pArrayDestroy: *SteamItemInstanceID_t, punArrayDestroyQuantity: *uint32, unArrayDestroyLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_ExchangeItems(steam_inventory, pResultHandle, pArrayGenerate, punArrayGenerateQuantity, unArrayGenerateLength, pArrayDestroy, punArrayDestroyQuantity, unArrayDestroyLength);
}


TransferItemQuantity :: inline (pResultHandle: *SteamInventoryResult_t, itemIdSource: SteamItemInstanceID_t, unQuantity: uint32, itemIdDest: SteamItemInstanceID_t) -> bool {
    return SteamAPI_ISteamInventory_TransferItemQuantity(steam_inventory, pResultHandle, itemIdSource, unQuantity, itemIdDest);
}


SendItemDropHeartbeat :: inline () {
    SteamAPI_ISteamInventory_SendItemDropHeartbeat(steam_inventory);
}


TriggerItemDrop :: inline (pResultHandle: *SteamInventoryResult_t, dropListDefinition: SteamItemDef_t) -> bool {
    return SteamAPI_ISteamInventory_TriggerItemDrop(steam_inventory, pResultHandle, dropListDefinition);
}


TradeItems :: inline (pResultHandle: *SteamInventoryResult_t, steamIDTradePartner: uint64_steamid, pArrayGive: *SteamItemInstanceID_t, pArrayGiveQuantity: *uint32, nArrayGiveLength: uint32, pArrayGet: *SteamItemInstanceID_t, pArrayGetQuantity: *uint32, nArrayGetLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_TradeItems(steam_inventory, pResultHandle, steamIDTradePartner, pArrayGive, pArrayGiveQuantity, nArrayGiveLength, pArrayGet, pArrayGetQuantity, nArrayGetLength);
}


LoadItemDefinitions :: inline () -> bool {
    return SteamAPI_ISteamInventory_LoadItemDefinitions(steam_inventory);
}


GetItemDefinitionIDs :: inline (pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetItemDefinitionIDs(steam_inventory, pItemDefIDs, punItemDefIDsArraySize);
}


GetItemDefinitionProperty :: inline (iDefinition: SteamItemDef_t, pchPropertyName: *char, pchValueBuffer: *char, punValueBufferSizeOut: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetItemDefinitionProperty(steam_inventory, iDefinition, pchPropertyName, pchValueBuffer, punValueBufferSizeOut);
}


RequestEligiblePromoItemDefinitionsIDs :: inline (steamID: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamInventory_RequestEligiblePromoItemDefinitionsIDs(steam_inventory, steamID);
}

RequestEligiblePromoItemDefinitionsIDs :: inline (steamID: uint64_steamid, callback: (SteamInventoryEligiblePromoItemDefIDs_t, bool) -> ()) {
    RegisterCallResult(
        RequestEligiblePromoItemDefinitionsIDs(steamID),
        callback
    );
}

//RequestEligiblePromoItemDefinitionsIDs :: (steamID: uint64_steamid, code: Code) #expand {
//    RegisterCallResult(
//        RequestEligiblePromoItemDefinitionsIDs(steamID),
//        (result: SteamInventoryEligiblePromoItemDefIDs_t, io_failure: bool) -> () {
//            #insert code;
//        }
//    );
//}


GetEligiblePromoItemDefinitionIDs :: inline (steamID: uint64_steamid, pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetEligiblePromoItemDefinitionIDs(steam_inventory, steamID, pItemDefIDs, punItemDefIDsArraySize);
}


StartPurchase :: inline (pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamInventory_StartPurchase(steam_inventory, pArrayItemDefs, punArrayQuantity, unArrayLength);
}

StartPurchase :: inline (pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32, callback: (SteamInventoryStartPurchaseResult_t, bool) -> ()) {
    RegisterCallResult(
        StartPurchase(pArrayItemDefs, punArrayQuantity, unArrayLength),
        callback
    );
}

//StartPurchase :: (pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32, code: Code) #expand {
//    RegisterCallResult(
//        StartPurchase(pArrayItemDefs, punArrayQuantity, unArrayLength),
//        (result: SteamInventoryStartPurchaseResult_t, io_failure: bool) -> () {
//            #insert code;
//        }
//    );
//}


RequestPrices :: inline () -> SteamAPICall_t #must {
    return SteamAPI_ISteamInventory_RequestPrices(steam_inventory);
}

RequestPrices :: inline (callback: (SteamInventoryRequestPricesResult_t, bool) -> ()) {
    RegisterCallResult(
        RequestPrices(),
        callback
    );
}

//RequestPrices :: (code: Code) #expand {
//    RegisterCallResult(
//        RequestPrices(),
//        (result: SteamInventoryRequestPricesResult_t, io_failure: bool) -> () {
//            #insert code;
//        }
//    );
//}


GetNumItemsWithPrices :: inline () -> uint32 {
    return SteamAPI_ISteamInventory_GetNumItemsWithPrices(steam_inventory);
}


GetItemsWithPrices :: inline (pArrayItemDefs: *SteamItemDef_t, pCurrentPrices: *uint64, pBasePrices: *uint64, unArrayLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_GetItemsWithPrices(steam_inventory, pArrayItemDefs, pCurrentPrices, pBasePrices, unArrayLength);
}


GetItemPrice :: inline (iDefinition: SteamItemDef_t, pCurrentPrice: *uint64, pBasePrice: *uint64) -> bool {
    return SteamAPI_ISteamInventory_GetItemPrice(steam_inventory, iDefinition, pCurrentPrice, pBasePrice);
}


StartUpdateProperties :: inline () -> SteamInventoryUpdateHandle_t {
    return SteamAPI_ISteamInventory_StartUpdateProperties(steam_inventory);
}


RemoveProperty :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char) -> bool {
    return SteamAPI_ISteamInventory_RemoveProperty(steam_inventory, handle, nItemID, pchPropertyName);
}


SetPropertyString :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, pchPropertyValue: *char) -> bool {
    return SteamAPI_ISteamInventory_SetPropertyString(steam_inventory, handle, nItemID, pchPropertyName, pchPropertyValue);
}


SetPropertyBool :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, bValue: bool) -> bool {
    return SteamAPI_ISteamInventory_SetPropertyBool(steam_inventory, handle, nItemID, pchPropertyName, bValue);
}


SetPropertyInt64 :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, nValue: int64) -> bool {
    return SteamAPI_ISteamInventory_SetPropertyInt64(steam_inventory, handle, nItemID, pchPropertyName, nValue);
}


SetPropertyFloat :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, flValue: float) -> bool {
    return SteamAPI_ISteamInventory_SetPropertyFloat(steam_inventory, handle, nItemID, pchPropertyName, flValue);
}


SubmitUpdateProperties :: inline (handle: SteamInventoryUpdateHandle_t, pResultHandle: *SteamInventoryResult_t) -> bool {
    return SteamAPI_ISteamInventory_SubmitUpdateProperties(steam_inventory, handle, pResultHandle);
}


InspectItem :: inline (pResultHandle: *SteamInventoryResult_t, pchItemToken: *char) -> bool {
    return SteamAPI_ISteamInventory_InspectItem(steam_inventory, pResultHandle, pchItemToken);
}
