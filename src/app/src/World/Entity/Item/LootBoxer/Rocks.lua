--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____StackingItem = require("app.src.World.Entity.Item.Specs.StackingItem")
local StackingItem = ____StackingItem.StackingItem
____exports.Rocks = {}
local Rocks = ____exports.Rocks
Rocks.name = "Rocks"
Rocks.__index = Rocks
Rocks.prototype = {}
Rocks.prototype.__index = __TS__Index(Rocks.prototype)
Rocks.prototype.__newindex = __TS__NewIndex(Rocks.prototype)
Rocks.prototype.constructor = Rocks
Rocks.____super = StackingItem
setmetatable(Rocks, Rocks.____super)
setmetatable(Rocks.prototype, Rocks.____super.prototype)
function Rocks.new(...)
    local self = setmetatable({}, Rocks.prototype)
    self:____constructor(...)
    return self
end
function Rocks.prototype.____constructor(self, game)
    StackingItem.prototype.____constructor(self, "I02F", game)
end
function Rocks.prototype.ManipulateAction(self)
    local currentCharges = GetItemCharges(
        GetManipulatedItem()
    )
    if currentCharges <= 8 then
        SetItemCharges(
            GetManipulatedItem(),
            (GetItemCharges(
                GetManipulatedItem()
            ) + 1)
        )
    else
        SetItemCharges(
            GetManipulatedItem(),
            (GetItemCharges(
                GetManipulatedItem()
            ) - 9)
        )
        UnitAddItemByIdSwapped(
            FourCC("I02B"),
            GetManipulatingUnit()
        )
    end
end
return ____exports
