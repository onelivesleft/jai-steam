steam_game_server_inventory : *ISteamInventory;


ServerGetResultStatus :: inline (resultHandle: SteamInventoryResult_t) -> EResult {
    return SteamAPI_ISteamInventory_GetResultStatus(steam_game_server_inventory, resultHandle);
}


ServerGetResultItems :: inline (resultHandle: SteamInventoryResult_t, pOutItemsArray: *SteamItemDetails_t, punOutItemsArraySize: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetResultItems(steam_game_server_inventory, resultHandle, pOutItemsArray, punOutItemsArraySize);
}


ServerGetResultItemProperty :: inline (resultHandle: SteamInventoryResult_t, unItemIndex: uint32, pchPropertyName: *char, pchValueBuffer: *char, punValueBufferSizeOut: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetResultItemProperty(steam_game_server_inventory, resultHandle, unItemIndex, pchPropertyName, pchValueBuffer, punValueBufferSizeOut);
}


ServerGetResultTimestamp :: inline (resultHandle: SteamInventoryResult_t) -> uint32 {
    return SteamAPI_ISteamInventory_GetResultTimestamp(steam_game_server_inventory, resultHandle);
}


ServerCheckResultSteamID :: inline (resultHandle: SteamInventoryResult_t, steamIDExpected: uint64_steamid) -> bool {
    return SteamAPI_ISteamInventory_CheckResultSteamID(steam_game_server_inventory, resultHandle, steamIDExpected);
}


ServerDestroyResult :: inline (resultHandle: SteamInventoryResult_t) {
    SteamAPI_ISteamInventory_DestroyResult(steam_game_server_inventory, resultHandle);
}


ServerGetAllItems :: inline (pResultHandle: *SteamInventoryResult_t) -> bool {
    return SteamAPI_ISteamInventory_GetAllItems(steam_game_server_inventory, pResultHandle);
}


ServerGetItemsByID :: inline (pResultHandle: *SteamInventoryResult_t, pInstanceIDs: *SteamItemInstanceID_t, unCountInstanceIDs: uint32) -> bool {
    return SteamAPI_ISteamInventory_GetItemsByID(steam_game_server_inventory, pResultHandle, pInstanceIDs, unCountInstanceIDs);
}


ServerSerializeResult :: inline (resultHandle: SteamInventoryResult_t, pOutBuffer: *void, punOutBufferSize: *uint32) -> bool {
    return SteamAPI_ISteamInventory_SerializeResult(steam_game_server_inventory, resultHandle, pOutBuffer, punOutBufferSize);
}


ServerDeserializeResult :: inline (pOutResultHandle: *SteamInventoryResult_t, pBuffer: *void, unBufferSize: uint32, bRESERVED_MUST_BE_FALSE: bool) -> bool {
    return SteamAPI_ISteamInventory_DeserializeResult(steam_game_server_inventory, pOutResultHandle, pBuffer, unBufferSize, bRESERVED_MUST_BE_FALSE);
}


ServerGenerateItems :: inline (pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_GenerateItems(steam_game_server_inventory, pResultHandle, pArrayItemDefs, punArrayQuantity, unArrayLength);
}


ServerGrantPromoItems :: inline (pResultHandle: *SteamInventoryResult_t) -> bool {
    return SteamAPI_ISteamInventory_GrantPromoItems(steam_game_server_inventory, pResultHandle);
}


ServerAddPromoItem :: inline (pResultHandle: *SteamInventoryResult_t, itemDef: SteamItemDef_t) -> bool {
    return SteamAPI_ISteamInventory_AddPromoItem(steam_game_server_inventory, pResultHandle, itemDef);
}


ServerAddPromoItems :: inline (pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, unArrayLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_AddPromoItems(steam_game_server_inventory, pResultHandle, pArrayItemDefs, unArrayLength);
}


ServerConsumeItem :: inline (pResultHandle: *SteamInventoryResult_t, itemConsume: SteamItemInstanceID_t, unQuantity: uint32) -> bool {
    return SteamAPI_ISteamInventory_ConsumeItem(steam_game_server_inventory, pResultHandle, itemConsume, unQuantity);
}


ServerExchangeItems :: inline (pResultHandle: *SteamInventoryResult_t, pArrayGenerate: *SteamItemDef_t, punArrayGenerateQuantity: *uint32, unArrayGenerateLength: uint32, pArrayDestroy: *SteamItemInstanceID_t, punArrayDestroyQuantity: *uint32, unArrayDestroyLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_ExchangeItems(steam_game_server_inventory, pResultHandle, pArrayGenerate, punArrayGenerateQuantity, unArrayGenerateLength, pArrayDestroy, punArrayDestroyQuantity, unArrayDestroyLength);
}


ServerTransferItemQuantity :: inline (pResultHandle: *SteamInventoryResult_t, itemIdSource: SteamItemInstanceID_t, unQuantity: uint32, itemIdDest: SteamItemInstanceID_t) -> bool {
    return SteamAPI_ISteamInventory_TransferItemQuantity(steam_game_server_inventory, pResultHandle, itemIdSource, unQuantity, itemIdDest);
}


ServerSendItemDropHeartbeat :: inline () {
    SteamAPI_ISteamInventory_SendItemDropHeartbeat(steam_game_server_inventory);
}


ServerTriggerItemDrop :: inline (pResultHandle: *SteamInventoryResult_t, dropListDefinition: SteamItemDef_t) -> bool {
    return SteamAPI_ISteamInventory_TriggerItemDrop(steam_game_server_inventory, pResultHandle, dropListDefinition);
}


ServerTradeItems :: inline (pResultHandle: *SteamInventoryResult_t, steamIDTradePartner: uint64_steamid, pArrayGive: *SteamItemInstanceID_t, pArrayGiveQuantity: *uint32, nArrayGiveLength: uint32, pArrayGet: *SteamItemInstanceID_t, pArrayGetQuantity: *uint32, nArrayGetLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_TradeItems(steam_game_server_inventory, pResultHandle, steamIDTradePartner, pArrayGive, pArrayGiveQuantity, nArrayGiveLength, pArrayGet, pArrayGetQuantity, nArrayGetLength);
}


ServerLoadItemDefinitions :: inline () -> bool {
    return SteamAPI_ISteamInventory_LoadItemDefinitions(steam_game_server_inventory);
}


ServerGetItemDefinitionIDs :: inline (pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetItemDefinitionIDs(steam_game_server_inventory, pItemDefIDs, punItemDefIDsArraySize);
}


ServerGetItemDefinitionProperty :: inline (iDefinition: SteamItemDef_t, pchPropertyName: *char, pchValueBuffer: *char, punValueBufferSizeOut: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetItemDefinitionProperty(steam_game_server_inventory, iDefinition, pchPropertyName, pchValueBuffer, punValueBufferSizeOut);
}


ServerRequestEligiblePromoItemDefinitionsIDs :: inline (steamID: uint64_steamid) -> SteamAPICall_t #must {
    return SteamAPI_ISteamInventory_RequestEligiblePromoItemDefinitionsIDs(steam_game_server_inventory, steamID);
}

ServerRequestEligiblePromoItemDefinitionsIDs :: inline (steamID: uint64_steamid, callback: (SteamInventoryEligiblePromoItemDefIDs_t, bool) -> ()) {
    RegisterCallResult(
        ServerRequestEligiblePromoItemDefinitionsIDs(steamID),
        callback
    );
}

ServerRequestEligiblePromoItemDefinitionsIDs :: (steamID: uint64_steamid, code: Code) #expand {
    RegisterCallResult(
        ServerRequestEligiblePromoItemDefinitionsIDs(steamID),
        (result: SteamInventoryEligiblePromoItemDefIDs_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerGetEligiblePromoItemDefinitionIDs :: inline (steamID: uint64_steamid, pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool {
    return SteamAPI_ISteamInventory_GetEligiblePromoItemDefinitionIDs(steam_game_server_inventory, steamID, pItemDefIDs, punItemDefIDsArraySize);
}


ServerStartPurchase :: inline (pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> SteamAPICall_t #must {
    return SteamAPI_ISteamInventory_StartPurchase(steam_game_server_inventory, pArrayItemDefs, punArrayQuantity, unArrayLength);
}

ServerStartPurchase :: inline (pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32, callback: (SteamInventoryStartPurchaseResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerStartPurchase(pArrayItemDefs, punArrayQuantity, unArrayLength),
        callback
    );
}

ServerStartPurchase :: (pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32, code: Code) #expand {
    RegisterCallResult(
        ServerStartPurchase(pArrayItemDefs, punArrayQuantity, unArrayLength),
        (result: SteamInventoryStartPurchaseResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerRequestPrices :: inline () -> SteamAPICall_t #must {
    return SteamAPI_ISteamInventory_RequestPrices(steam_game_server_inventory);
}

ServerRequestPrices :: inline (callback: (SteamInventoryRequestPricesResult_t, bool) -> ()) {
    RegisterCallResult(
        ServerRequestPrices(),
        callback
    );
}

ServerRequestPrices :: (code: Code) #expand {
    RegisterCallResult(
        ServerRequestPrices(),
        (result: SteamInventoryRequestPricesResult_t, io_failure: bool) -> () {
            #insert_internal code;
        }
    );
}


ServerGetNumItemsWithPrices :: inline () -> uint32 {
    return SteamAPI_ISteamInventory_GetNumItemsWithPrices(steam_game_server_inventory);
}


ServerGetItemsWithPrices :: inline (pArrayItemDefs: *SteamItemDef_t, pCurrentPrices: *uint64, pBasePrices: *uint64, unArrayLength: uint32) -> bool {
    return SteamAPI_ISteamInventory_GetItemsWithPrices(steam_game_server_inventory, pArrayItemDefs, pCurrentPrices, pBasePrices, unArrayLength);
}


ServerGetItemPrice :: inline (iDefinition: SteamItemDef_t, pCurrentPrice: *uint64, pBasePrice: *uint64) -> bool {
    return SteamAPI_ISteamInventory_GetItemPrice(steam_game_server_inventory, iDefinition, pCurrentPrice, pBasePrice);
}


ServerStartUpdateProperties :: inline () -> SteamInventoryUpdateHandle_t {
    return SteamAPI_ISteamInventory_StartUpdateProperties(steam_game_server_inventory);
}


ServerRemoveProperty :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char) -> bool {
    return SteamAPI_ISteamInventory_RemoveProperty(steam_game_server_inventory, handle, nItemID, pchPropertyName);
}


ServerSetPropertyString :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, pchPropertyValue: *char) -> bool {
    return SteamAPI_ISteamInventory_SetPropertyString(steam_game_server_inventory, handle, nItemID, pchPropertyName, pchPropertyValue);
}


ServerSetPropertyBool :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, bValue: bool) -> bool {
    return SteamAPI_ISteamInventory_SetPropertyBool(steam_game_server_inventory, handle, nItemID, pchPropertyName, bValue);
}


ServerSetPropertyInt64 :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, nValue: int64) -> bool {
    return SteamAPI_ISteamInventory_SetPropertyInt64(steam_game_server_inventory, handle, nItemID, pchPropertyName, nValue);
}


ServerSetPropertyFloat :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, flValue: float) -> bool {
    return SteamAPI_ISteamInventory_SetPropertyFloat(steam_game_server_inventory, handle, nItemID, pchPropertyName, flValue);
}


ServerSubmitUpdateProperties :: inline (handle: SteamInventoryUpdateHandle_t, pResultHandle: *SteamInventoryResult_t) -> bool {
    return SteamAPI_ISteamInventory_SubmitUpdateProperties(steam_game_server_inventory, handle, pResultHandle);
}


ServerInspectItem :: inline (pResultHandle: *SteamInventoryResult_t, pchItemToken: *char) -> bool {
    return SteamAPI_ISteamInventory_InspectItem(steam_game_server_inventory, pResultHandle, pchItemToken);
}
