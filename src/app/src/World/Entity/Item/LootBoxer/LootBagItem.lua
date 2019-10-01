--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____StackingItem = require("app.src.World.Entity.Item.Specs.StackingItem")
local StackingItem = ____StackingItem.StackingItem
____exports.LootBagItem = {}
local LootBagItem = ____exports.LootBagItem
LootBagItem.name = "LootBagItem"
LootBagItem.__index = LootBagItem
LootBagItem.prototype = {}
LootBagItem.prototype.__index = __TS__Index(LootBagItem.prototype)
LootBagItem.prototype.__newindex = __TS__NewIndex(LootBagItem.prototype)
LootBagItem.prototype.constructor = LootBagItem
LootBagItem.____super = StackingItem
setmetatable(LootBagItem, LootBagItem.____super)
setmetatable(LootBagItem.prototype, LootBagItem.____super.prototype)
function LootBagItem.new(...)
    local self = setmetatable({}, LootBagItem.prototype)
    self:____constructor(...)
    return self
end
function LootBagItem.prototype.____constructor(self, game)
    StackingItem.prototype.____constructor(self, "I02B", game)
end
function LootBagItem.prototype.ManipulateAction(self)
    local roll = Util:RandomInt(1, 100)
    if roll <= 40 then
        UnitAddItemByIdSwapped(
            FourCC("I029"),
            GetTriggerUnit()
        )
    elseif roll <= 80 then
        UnitAddItemByIdSwapped(
            FourCC("I02F"),
            GetTriggerUnit()
        )
    elseif roll <= 95 then
        UnitAddItemByIdSwapped(
            FourCC("I028"),
            GetTriggerUnit()
        )
    else
        UnitAddItemByIdSwapped(
            FourCC("I02A"),
            GetTriggerUnit()
        )
    end
end
return ____exports
