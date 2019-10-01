--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local ____LootBagItem = require("app.src.World.Entity.Item.LootBoxer.LootBagItem")
local LootBagItem = ____LootBagItem.LootBagItem
local ____StackingItem = require("app.src.World.Entity.Item.Specs.StackingItem")
local StackingItem = ____StackingItem.StackingItem
local ____Rocks = require("app.src.World.Entity.Item.LootBoxer.Rocks")
local Rocks = ____Rocks.Rocks
local ____GoldCoin = require("app.src.World.Entity.Item.LootBoxer.GoldCoin")
local GoldCoin = ____GoldCoin.GoldCoin
local ____PlatinumToken = require("app.src.World.Entity.Item.LootBoxer.PlatinumToken")
local PlatinumToken = ____PlatinumToken.PlatinumToken
local ____WoodenSticks = require("app.src.World.Entity.Item.LootBoxer.WoodenSticks")
local WoodenSticks = ____WoodenSticks.WoodenSticks
local ____PremiumLootTower = require("app.src.World.Entity.Item.LootBoxer.PremiumLootTower")
local PremiumLootTower = ____PremiumLootTower.PremiumLootTower
____exports.ItemHandler = {}
local ItemHandler = ____exports.ItemHandler
ItemHandler.name = "ItemHandler"
ItemHandler.__index = ItemHandler
ItemHandler.prototype = {}
ItemHandler.prototype.__index = ItemHandler.prototype
ItemHandler.prototype.constructor = ItemHandler
function ItemHandler.new(...)
    local self = setmetatable({}, ItemHandler.prototype)
    self:____constructor(...)
    return self
end
function ItemHandler.prototype.____constructor(self, game)
    self.items = {}
    self.activeItems = {}
    self.stackingItems = {}
    self.game = game
    self:AddItemsToList()
    self:SetupItems()
    self.useItemTrigger = Trigger.new()
    self.useItemTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_USE_ITEM)
    self.useItemTrigger:AddAction(
        function() return self:UseItem() end
    )
    self.pickupItemTrigger = Trigger.new()
    self.pickupItemTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_PICKUP_ITEM)
    self.pickupItemTrigger:AddAction(
        function() return self:PickupItem() end
    )
end
function ItemHandler.prototype.AddItemsToList(self)
    __TS__ArrayPush(self.items, LootBagItem)
    __TS__ArrayPush(self.items, Rocks)
    __TS__ArrayPush(self.items, PremiumLootTower)
    __TS__ArrayPush(self.items, GoldCoin)
    __TS__ArrayPush(self.items, PlatinumToken)
    __TS__ArrayPush(self.items, WoodenSticks)
end
function ItemHandler.prototype.SetupItems(self)
    for ____, item in ipairs(self.items) do
        local ObjectExtendsItem = item.new(self.game)
        if __TS__InstanceOf(ObjectExtendsItem, StackingItem) then
            __TS__ArrayPush(self.stackingItems, ObjectExtendsItem)
        end
        __TS__ArrayPush(self.activeItems, ObjectExtendsItem)
    end
end
function ItemHandler.prototype.UseItem(self)
    for ____, item in ipairs(self.activeItems) do
        if item:ManipulateCondition() then
            item:ManipulateAction()
        end
    end
end
function ItemHandler.prototype.PickupItem(self)
    for ____, item in ipairs(self.stackingItems) do
        if item:StackingCondition() then
            item:MakeStack()
        end
    end
end
return ____exports
