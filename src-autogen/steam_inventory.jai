steam_inventory : *ISteamInventory;
SteamInventory : SteamInventory_Namespace;


#scope_file


SteamInventory_Namespace :: struct {
    // procs
    GetResultStatus                                    :: SteamInventory_GetResultStatus;
    GetResultItems                                     :: SteamInventory_GetResultItems;
    GetResultItemProperty                              :: SteamInventory_GetResultItemProperty;
    GetResultTimestamp                                 :: SteamInventory_GetResultTimestamp;
    CheckResultSteamID                                 :: SteamInventory_CheckResultSteamID;
    DestroyResult                                      :: SteamInventory_DestroyResult;
    GetAllItems                                        :: SteamInventory_GetAllItems;
    GetItemsByID                                       :: SteamInventory_GetItemsByID;
    SerializeResult                                    :: SteamInventory_SerializeResult;
    DeserializeResult                                  :: SteamInventory_DeserializeResult;
    GenerateItems                                      :: SteamInventory_GenerateItems;
    GrantPromoItems                                    :: SteamInventory_GrantPromoItems;
    AddPromoItem                                       :: SteamInventory_AddPromoItem;
    AddPromoItems                                      :: SteamInventory_AddPromoItems;
    ConsumeItem                                        :: SteamInventory_ConsumeItem;
    ExchangeItems                                      :: SteamInventory_ExchangeItems;
    TransferItemQuantity                               :: SteamInventory_TransferItemQuantity;
    SendItemDropHeartbeat                              :: SteamInventory_SendItemDropHeartbeat;
    TriggerItemDrop                                    :: SteamInventory_TriggerItemDrop;
    TradeItems                                         :: SteamInventory_TradeItems;
    LoadItemDefinitions                                :: SteamInventory_LoadItemDefinitions;
    GetItemDefinitionIDs                               :: SteamInventory_GetItemDefinitionIDs;
    GetItemDefinitionProperty                          :: SteamInventory_GetItemDefinitionProperty;
    RequestEligiblePromoItemDefinitionsIDs             :: SteamInventory_RequestEligiblePromoItemDefinitionsIDs;
    GetEligiblePromoItemDefinitionIDs                  :: SteamInventory_GetEligiblePromoItemDefinitionIDs;
    StartPurchase                                      :: SteamInventory_StartPurchase;
    RequestPrices                                      :: SteamInventory_RequestPrices;
    GetNumItemsWithPrices                              :: SteamInventory_GetNumItemsWithPrices;
    GetItemsWithPrices                                 :: SteamInventory_GetItemsWithPrices;
    GetItemPrice                                       :: SteamInventory_GetItemPrice;
    StartUpdateProperties                              :: SteamInventory_StartUpdateProperties;
    RemoveProperty                                     :: SteamInventory_RemoveProperty;
    SetPropertyString                                  :: SteamInventory_SetPropertyString;
    SetPropertyBool                                    :: SteamInventory_SetPropertyBool;
    SetPropertyInt64                                   :: SteamInventory_SetPropertyInt64;
    SetPropertyFloat                                   :: SteamInventory_SetPropertyFloat;
    SubmitUpdateProperties                             :: SteamInventory_SubmitUpdateProperties;
    InspectItem                                        :: SteamInventory_InspectItem;
}


SteamInventory_GetResultStatus :: inline (resultHandle: SteamInventoryResult_t) -> EResult #foreign steam "SteamAPI_ISteamInventory_G {
    return SteamInventory_GetResultStatus(steam_inventory, resultHandle);
}


SteamInventory_GetResultItems :: inline (resultHandle: SteamInventoryResult_t, pOutItemsArray: *SteamItemDetails_t, punOutItemsArraySize: *uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_ {
    return SteamInventory_GetResultItems(steam_inventory, resultHandle, pOutItemsArray, punOutItemsArraySize);
}


SteamInventory_GetResultItemProperty :: inline (resultHandle: SteamInventoryResult_t, unItemIndex: uint32, pchPropertyName: *char, pchValueBuffer: *char, punValueBufferSizeOut: *uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_GetResu {
    return SteamInventory_GetResultItemProperty(steam_inventory, resultHandle, unItemIndex, pchPropertyName, pchValueBuffer, punValueBufferSizeOut);
}


SteamInventory_GetResultTimestamp :: inline (resultHandle: SteamInventoryResult_t) -> uint32 #foreign steam "SteamAPI_ISteamInventory_GetR {
    return SteamInventory_GetResultTimestamp(steam_inventory, resultHandle);
}


SteamInventory_CheckResultSteamID :: inline (resultHandle: SteamInventoryResult_t, steamIDExpected: uint64_steamid) -> bool #foreign steam "SteamAPI_ISteamInventory_Chec {
    return SteamInventory_CheckResultSteamID(steam_inventory, resultHandle, steamIDExpected);
}


SteamInventory_DestroyResult :: inline (resultHandle: SteamInventoryResult_t) {
    SteamInventory_DestroyResult(steam_inventory, resultHandle);
}


SteamInventory_GetAllItems :: inline (pResultHandle: *SteamInventoryResult_t) -> bool #foreign steam "SteamAPI_ISteamInvento {
    return SteamInventory_GetAllItems(steam_inventory, pResultHandle);
}


SteamInventory_GetItemsByID :: inline (pResultHandle: *SteamInventoryResult_t, pInstanceIDs: *SteamItemInstanceID_t, unCountInstanceIDs: uint32) -> bool #foreign steam "SteamAPI_ISteamInventor {
    return SteamInventory_GetItemsByID(steam_inventory, pResultHandle, pInstanceIDs, unCountInstanceIDs);
}


SteamInventory_SerializeResult :: inline (resultHandle: SteamInventoryResult_t, pOutBuffer: *void, punOutBufferSize: *uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_S {
    return SteamInventory_SerializeResult(steam_inventory, resultHandle, pOutBuffer, punOutBufferSize);
}


SteamInventory_DeserializeResult :: inline (pOutResultHandle: *SteamInventoryResult_t, pBuffer: *void, unBufferSize: uint32, bRESERVED_MUST_BE_FALSE: bool) -> bool #foreign steam "SteamAPI_ISteamInventory_Des {
    return SteamInventory_DeserializeResult(steam_inventory, pOutResultHandle, pBuffer, unBufferSize, bRESERVED_MUST_BE_FALSE);
}


SteamInventory_GenerateItems :: inline (pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> bool #foreign steam "SteamAPI_ISteamInventory {
    return SteamInventory_GenerateItems(steam_inventory, pResultHandle, pArrayItemDefs, punArrayQuantity, unArrayLength);
}


SteamInventory_GrantPromoItems :: inline (pResultHandle: *SteamInventoryResult_t) -> bool #foreign steam "SteamAPI_ISteamInventory_G {
    return SteamInventory_GrantPromoItems(steam_inventory, pResultHandle);
}


SteamInventory_AddPromoItem :: inline (pResultHandle: *SteamInventoryResult_t, itemDef: SteamItemDef_t) -> bool #foreign steam "SteamAPI_ISteamInventor {
    return SteamInventory_AddPromoItem(steam_inventory, pResultHandle, itemDef);
}


SteamInventory_AddPromoItems :: inline (pResultHandle: *SteamInventoryResult_t, pArrayItemDefs: *SteamItemDef_t, unArrayLength: uint32) -> bool #foreign steam "SteamAPI_ISteamInventory {
    return SteamInventory_AddPromoItems(steam_inventory, pResultHandle, pArrayItemDefs, unArrayLength);
}


SteamInventory_ConsumeItem :: inline (pResultHandle: *SteamInventoryResult_t, itemConsume: SteamItemInstanceID_t, unQuantity: uint32) -> bool #foreign steam "SteamAPI_ISteamInvento {
    return SteamInventory_ConsumeItem(steam_inventory, pResultHandle, itemConsume, unQuantity);
}


SteamInventory_ExchangeItems :: inline (pResultHandle: *SteamInventoryResult_t, pArrayGenerate: *SteamItemDef_t, punArrayGenerateQuantity: *uint32, unArrayGenerateLength: uint32, pArrayDestroy: *SteamItemInstanceID_t, punArrayDestroyQuantity: *uint32, unArrayDestroyLength: uint32) -> bool #foreign steam "SteamAPI_ISteamInventory {
    return SteamInventory_ExchangeItems(steam_inventory, pResultHandle, pArrayGenerate, punArrayGenerateQuantity, unArrayGenerateLength, pArrayDestroy, punArrayDestroyQuantity, unArrayDestroyLength);
}


SteamInventory_TransferItemQuantity :: inline (pResultHandle: *SteamInventoryResult_t, itemIdSource: SteamItemInstanceID_t, unQuantity: uint32, itemIdDest: SteamItemInstanceID_t) -> bool #foreign steam "SteamAPI_ISteamInventory_Transf {
    return SteamInventory_TransferItemQuantity(steam_inventory, pResultHandle, itemIdSource, unQuantity, itemIdDest);
}


SteamInventory_SendItemDropHeartbeat :: inline () {
    SteamInventory_SendItemDropHeartbeat(steam_inventory);
}


SteamInventory_TriggerItemDrop :: inline (pResultHandle: *SteamInventoryResult_t, dropListDefinition: SteamItemDef_t) -> bool #foreign steam "SteamAPI_ISteamInventory_T {
    return SteamInventory_TriggerItemDrop(steam_inventory, pResultHandle, dropListDefinition);
}


SteamInventory_TradeItems :: inline (pResultHandle: *SteamInventoryResult_t, steamIDTradePartner: uint64_steamid, pArrayGive: *SteamItemInstanceID_t, pArrayGiveQuantity: *uint32, nArrayGiveLength: uint32, pArrayGet: *SteamItemInstanceID_t, pArrayGetQuantity: *uint32, nArrayGetLength: uint32) -> bool #foreign steam "SteamAPI_ISteamInvent {
    return SteamInventory_TradeItems(steam_inventory, pResultHandle, steamIDTradePartner, pArrayGive, pArrayGiveQuantity, nArrayGiveLength, pArrayGet, pArrayGetQuantity, nArrayGetLength);
}


SteamInventory_LoadItemDefinitions :: inline () -> bool #foreign steam "SteamAPI_ISteamInventory_LoadI {
    return SteamInventory_LoadItemDefinitions(steam_inventory);
}


SteamInventory_GetItemDefinitionIDs :: inline (pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_GetIte {
    return SteamInventory_GetItemDefinitionIDs(steam_inventory, pItemDefIDs, punItemDefIDsArraySize);
}


SteamInventory_GetItemDefinitionProperty :: inline (iDefinition: SteamItemDef_t, pchPropertyName: *char, pchValueBuffer: *char, punValueBufferSizeOut: *uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_GetItemDefi {
    return SteamInventory_GetItemDefinitionProperty(steam_inventory, iDefinition, pchPropertyName, pchValueBuffer, punValueBufferSizeOut);
}


SteamInventory_RequestEligiblePromoItemDefinitionsIDs :: inline (steamID: uint64_steamid) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamInventory_RequestEligiblePromoItem {
    return SteamInventory_RequestEligiblePromoItemDefinitionsIDs(steam_inventory, steamID);
}


SteamInventory_GetEligiblePromoItemDefinitionIDs :: inline (steamID: uint64_steamid, pItemDefIDs: *SteamItemDef_t, punItemDefIDsArraySize: *uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_GetEligiblePromoIte {
    return SteamInventory_GetEligiblePromoItemDefinitionIDs(steam_inventory, steamID, pItemDefIDs, punItemDefIDsArraySize);
}


SteamInventory_StartPurchase :: inline (pArrayItemDefs: *SteamItemDef_t, punArrayQuantity: *uint32, unArrayLength: uint32) -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamInventory {
    return SteamInventory_StartPurchase(steam_inventory, pArrayItemDefs, punArrayQuantity, unArrayLength);
}


SteamInventory_RequestPrices :: inline () -> SteamAPICall_t #must #foreign steam "SteamAPI_ISteamInventory {
    return SteamInventory_RequestPrices(steam_inventory);
}


SteamInventory_GetNumItemsWithPrices :: inline () -> uint32 #foreign steam "SteamAPI_ISteamInventory_GetNumI {
    return SteamInventory_GetNumItemsWithPrices(steam_inventory);
}


SteamInventory_GetItemsWithPrices :: inline (pArrayItemDefs: *SteamItemDef_t, pCurrentPrices: *uint64, pBasePrices: *uint64, unArrayLength: uint32) -> bool #foreign steam "SteamAPI_ISteamInventory_GetI {
    return SteamInventory_GetItemsWithPrices(steam_inventory, pArrayItemDefs, pCurrentPrices, pBasePrices, unArrayLength);
}


SteamInventory_GetItemPrice :: inline (iDefinition: SteamItemDef_t, pCurrentPrice: *uint64, pBasePrice: *uint64) -> bool #foreign steam "SteamAPI_ISteamInventor {
    return SteamInventory_GetItemPrice(steam_inventory, iDefinition, pCurrentPrice, pBasePrice);
}


SteamInventory_StartUpdateProperties :: inline () -> SteamInventoryUpdateHandle_t #foreign steam "SteamAPI_ISteamInventory_StartUp {
    return SteamInventory_StartUpdateProperties(steam_inventory);
}


SteamInventory_RemoveProperty :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char) -> bool #foreign steam "SteamAPI_ISteamInventory_ {
    return SteamInventory_RemoveProperty(steam_inventory, handle, nItemID, pchPropertyName);
}


SteamInventory_SetPropertyString :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, pchPropertyValue: *char) -> bool #foreign steam "SteamAPI_ISteamInventory_Set {
    return SteamInventory_SetPropertyString(steam_inventory, handle, nItemID, pchPropertyName, pchPropertyValue);
}


SteamInventory_SetPropertyBool :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, bValue: bool) -> bool #foreign steam "SteamAPI_ISteamInventory_S {
    return SteamInventory_SetPropertyBool(steam_inventory, handle, nItemID, pchPropertyName, bValue);
}


SteamInventory_SetPropertyInt64 :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, nValue: int64) -> bool #foreign steam "SteamAPI_ISteamInventory_Se {
    return SteamInventory_SetPropertyInt64(steam_inventory, handle, nItemID, pchPropertyName, nValue);
}


SteamInventory_SetPropertyFloat :: inline (handle: SteamInventoryUpdateHandle_t, nItemID: SteamItemInstanceID_t, pchPropertyName: *char, flValue: float) -> bool #foreign steam "SteamAPI_ISteamInventory_Se {
    return SteamInventory_SetPropertyFloat(steam_inventory, handle, nItemID, pchPropertyName, flValue);
}


SteamInventory_SubmitUpdateProperties :: inline (handle: SteamInventoryUpdateHandle_t, pResultHandle: *SteamInventoryResult_t) -> bool #foreign steam "SteamAPI_ISteamInventory_SubmitUp {
    return SteamInventory_SubmitUpdateProperties(steam_inventory, handle, pResultHandle);
}


SteamInventory_InspectItem :: inline (pResultHandle: *SteamInventoryResult_t, pchItemToken: *char) -> bool #foreign steam "SteamAPI_ISteamInvento {
    return SteamInventory_InspectItem(steam_inventory, pResultHandle, pchItemToken);
}
