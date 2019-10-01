--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____hybridRandomGEN = require("app.src.Generated.hybridRandomGEN")
local HybridTierEight = ____hybridRandomGEN.HybridTierEight
local HybridTierFive = ____hybridRandomGEN.HybridTierFive
local HybridTierFour = ____hybridRandomGEN.HybridTierFour
local HybridTierNine = ____hybridRandomGEN.HybridTierNine
local HybridTierOne = ____hybridRandomGEN.HybridTierOne
local HybridTierSeven = ____hybridRandomGEN.HybridTierSeven
local HybridTierSix = ____hybridRandomGEN.HybridTierSix
local HybridTierThree = ____hybridRandomGEN.HybridTierThree
local HybridTierTwo = ____hybridRandomGEN.HybridTierTwo
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
____exports.LootBoxerHandler = {}
local LootBoxerHandler = ____exports.LootBoxerHandler
LootBoxerHandler.name = "LootBoxerHandler"
LootBoxerHandler.__index = LootBoxerHandler
LootBoxerHandler.prototype = {}
LootBoxerHandler.prototype.__index = LootBoxerHandler.prototype
LootBoxerHandler.prototype.constructor = LootBoxerHandler
function LootBoxerHandler.new(...)
    local self = setmetatable({}, LootBoxerHandler.prototype)
    self:____constructor(...)
    return self
end
function LootBoxerHandler.prototype.____constructor(self, constuction, game)
    self.constuction = constuction
    self.game = game
    self.abilityUpgradeTrigger = Trigger.new()
    self.abilityUpgradeTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_CAST)
    self.abilityUpgradeTrigger:AddCondition(
        function() return self:IsUpgradeAbility() end
    )
    self.abilityUpgradeTrigger:AddAction(
        function() return self:UpgradeToTower() end
    )
end
function LootBoxerHandler.prototype.GetId(self, tier)
    local newId
    local ____switch5 = tier + 1
    if ____switch5 == 1 then
        goto ____switch5_case_0
    end
    if ____switch5 == 2 then
        goto ____switch5_case_1
    end
    if ____switch5 == 3 then
        goto ____switch5_case_2
    end
    if ____switch5 == 4 then
        goto ____switch5_case_3
    end
    if ____switch5 == 5 then
        goto ____switch5_case_4
    end
    if ____switch5 == 6 then
        goto ____switch5_case_5
    end
    if ____switch5 == 7 then
        goto ____switch5_case_6
    end
    if ____switch5 == 8 then
        goto ____switch5_case_7
    end
    if ____switch5 == 9 then
        goto ____switch5_case_8
    end
    goto ____switch5_case_default
    ::____switch5_case_0::
    do
        newId = FourCC(
            HybridTierOne[Util:RandomInt(0, #HybridTierOne - 1) + 1].id
        )
        goto ____switch5_end
    end
    ::____switch5_case_1::
    do
        newId = FourCC(
            HybridTierTwo[Util:RandomInt(0, #HybridTierTwo - 1) + 1].id
        )
        goto ____switch5_end
    end
    ::____switch5_case_2::
    do
        newId = FourCC(
            HybridTierThree[Util:RandomInt(0, #HybridTierThree - 1) + 1].id
        )
        goto ____switch5_end
    end
    ::____switch5_case_3::
    do
        newId = FourCC(
            HybridTierFour[Util:RandomInt(0, #HybridTierFour - 1) + 1].id
        )
        goto ____switch5_end
    end
    ::____switch5_case_4::
    do
        newId = FourCC(
            HybridTierFive[Util:RandomInt(0, #HybridTierFive - 1) + 1].id
        )
        goto ____switch5_end
    end
    ::____switch5_case_5::
    do
        newId = FourCC(
            HybridTierSix[Util:RandomInt(0, #HybridTierSix - 1) + 1].id
        )
        goto ____switch5_end
    end
    ::____switch5_case_6::
    do
        newId = FourCC(
            HybridTierSeven[Util:RandomInt(0, #HybridTierSeven - 1) + 1].id
        )
        goto ____switch5_end
    end
    ::____switch5_case_7::
    do
        newId = FourCC(
            HybridTierEight[Util:RandomInt(0, #HybridTierEight - 1) + 1].id
        )
        goto ____switch5_end
    end
    ::____switch5_case_8::
    do
        newId = FourCC(
            HybridTierNine[Util:RandomInt(0, #HybridTierNine - 1) + 1].id
        )
        goto ____switch5_end
    end
    ::____switch5_case_default::
    do
        Log.Fatal("failed to get loot boxer tier")
        newId = FourCC(
            HybridTierOne[Util:RandomInt(0, #HybridTierOne - 1) + 1].id
        )
        goto ____switch5_end
    end
    ::____switch5_end::
    return newId
end
function LootBoxerHandler.prototype.handleLootBoxTower(self, tower, owner, tier)
    local newId
    local lootBoxer = owner:getLootBoxer()
    if not lootBoxer then
        return tower
    end
    if tier >= 3 then
        SetUnitAbilityLevelSwapped(
            FourCC("A0EX"),
            tower,
            tier + 1
        )
        return tower
    end
    newId = self:GetId(tier)
    self:AddItemToLootBoxer(tier, lootBoxer)
    tower = ReplaceUnitBJ(
        GetConstructedStructure(),
        newId,
        bj_UNIT_STATE_METHOD_DEFAULTS
    )
    return tower
end
function LootBoxerHandler.prototype.AddItemToLootBoxer(self, tier, lootBoxer)
    local randomInt = Util:RandomInt(1, 100)
    if tier < 3 then
        if randomInt <= 100 - (5 * (tier + 1)) then
            UnitAddItemByIdSwapped(
                FourCC("I02F"),
                lootBoxer
            )
        elseif randomInt <= 100 - 2 * (tier + 1) then
            UnitAddItemByIdSwapped(
                FourCC("I029"),
                lootBoxer
            )
        else
            UnitAddItemByIdSwapped(
                FourCC("I02B"),
                lootBoxer
            )
        end
    else
        local ____switch15 = tier + 1
        if ____switch15 == 4 then
            goto ____switch15_case_0
        end
        if ____switch15 == 5 then
            goto ____switch15_case_1
        end
        if ____switch15 == 6 then
            goto ____switch15_case_2
        end
        if ____switch15 == 7 then
            goto ____switch15_case_3
        end
        if ____switch15 == 8 then
            goto ____switch15_case_4
        end
        if ____switch15 == 9 then
            goto ____switch15_case_5
        end
        goto ____switch15_case_default
        ::____switch15_case_0::
        ::____switch15_case_1::
        do
            if randomInt <= 100 - 20 + 10 * (tier - 4 + 1) then
                UnitAddItemByIdSwapped(
                    FourCC("I02F"),
                    lootBoxer
                )
                SetItemCharges(
                    GetLastCreatedItem(),
                    GetRandomInt(1, tier)
                )
            elseif randomInt <= 100 - 10 + 5 * (tier - 4 + 1) then
                UnitAddItemByIdSwapped(
                    FourCC("I029"),
                    lootBoxer
                )
            elseif randomInt <= 100 - 2 * (tier - 3 + 1) then
                UnitAddItemByIdSwapped(
                    FourCC("I02B"),
                    lootBoxer
                )
            else
                UnitAddItemByIdSwapped(
                    FourCC("I028"),
                    lootBoxer
                )
            end
            goto ____switch15_end
        end
        ::____switch15_case_2::
        do
            if randomInt <= 100 - 20 + 10 * (tier - 4 + 1) then
                UnitAddItemByIdSwapped(
                    FourCC("I02F"),
                    lootBoxer
                )
                SetItemCharges(
                    GetLastCreatedItem(),
                    GetRandomInt(1, tier)
                )
            elseif randomInt <= 100 - 10 + 5 * (tier - 4 + 1) then
                UnitAddItemByIdSwapped(
                    FourCC("I02B"),
                    lootBoxer
                )
            elseif randomInt <= 100 - 2 * (tier - 3 + 1) then
                UnitAddItemByIdSwapped(
                    FourCC("I028"),
                    lootBoxer
                )
            else
                UnitAddItemByIdSwapped(
                    FourCC("I02A"),
                    lootBoxer
                )
            end
            goto ____switch15_end
        end
        ::____switch15_case_3::
        do
            self:GetRandomItem(tier, randomInt, lootBoxer, "I028", 70, "I02B", 85, "I02A", 95, "I02C")
            goto ____switch15_end
        end
        ::____switch15_case_4::
        do
            self:GetRandomItem(tier, randomInt, lootBoxer, "I028", 65, "I02A", 80, "I02B", 92, "I02C")
            goto ____switch15_end
        end
        ::____switch15_case_5::
        do
            self:GetRandomItem(tier, randomInt, lootBoxer, "I028", 60, "I02A", 80, "I02B", 90, "I02C")
            goto ____switch15_end
        end
        ::____switch15_case_default::
        do
            Log.Fatal("failed to get loot boxer item tier")
            self:AddItemToLootBoxer(1, lootBoxer)
            goto ____switch15_end
        end
        ::____switch15_end::
    end
end
function LootBoxerHandler.prototype.GetRandomItem(self, tier, randomInt, lootBoxer, itemOne, chanceOne, itemTwo, chanceTwo, itemThree, chanceThree, defaultItem)
    if randomInt <= 100 - 20 + 10 * (tier - 4 + 1) then
        UnitAddItemByIdSwapped(
            FourCC("I02F"),
            lootBoxer
        )
        SetItemCharges(
            GetLastCreatedItem(),
            GetRandomInt(1 + (tier - 5), tier)
        )
    elseif randomInt <= chanceOne then
        UnitAddItemByIdSwapped(
            FourCC(itemOne),
            lootBoxer
        )
    elseif randomInt <= chanceTwo then
        UnitAddItemByIdSwapped(
            FourCC(itemTwo),
            lootBoxer
        )
    elseif randomInt <= chanceThree then
        UnitAddItemByIdSwapped(
            FourCC(itemThree),
            lootBoxer
        )
    else
        UnitAddItemByIdSwapped(
            FourCC(defaultItem),
            lootBoxer
        )
    end
end
function LootBoxerHandler.prototype.IsUpgradeAbility(self)
    return GetSpellAbilityId() == FourCC("A0EX")
end
function LootBoxerHandler.prototype.UpgradeToTower(self)
    local tower = GetSpellAbilityUnit()
    local owner = self.game.players:get(
        GetPlayerId(
            GetOwningPlayer(tower)
        )
    )
    if not owner then
        return
    end
    local instance = owner:GetTower(
        GetHandleIdBJ(tower)
    )
    if instance then
        instance:Sell()
    end
    tower = ReplaceUnitBJ(
        tower,
        self:GetId(
            __TS__ArrayIndexOf(
                self.constuction.lootBoxerTowers,
                GetUnitTypeId(tower)
            )
        ),
        bj_UNIT_STATE_METHOD_DEFAULTS
    )
    local lootBoxer = owner:getLootBoxer()
    if lootBoxer then
        self:AddItemToLootBoxer(
            __TS__ArrayIndexOf(
                self.constuction.lootBoxerTowers,
                GetUnitTypeId(tower)
            ),
            lootBoxer
        )
    end
    self.constuction:SetupTower(tower, owner)
end
return ____exports
