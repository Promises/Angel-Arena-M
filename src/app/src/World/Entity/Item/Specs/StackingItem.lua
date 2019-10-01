--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Item = require("app.src.World.Entity.Item.Specs.Item")
local Item = ____Item.Item
____exports.StackingItem = {}
local StackingItem = ____exports.StackingItem
StackingItem.name = "StackingItem"
StackingItem.__index = StackingItem
StackingItem.prototype = {}
StackingItem.prototype.__index = __TS__Index(StackingItem.prototype)
StackingItem.prototype.__newindex = __TS__NewIndex(StackingItem.prototype)
StackingItem.prototype.constructor = StackingItem
StackingItem.____super = Item
setmetatable(StackingItem, StackingItem.____super)
setmetatable(StackingItem.prototype, StackingItem.____super.prototype)
function StackingItem.new(...)
    local self = setmetatable({}, StackingItem.prototype)
    self:____constructor(...)
    return self
end
function StackingItem.prototype.StackingCondition(self)
    if self.itemID ~= GetItemTypeId(
        GetManipulatedItem()
    ) then
        return false
    end
    if not UnitHasItemOfTypeBJ(
        GetManipulatingUnit(),
        GetItemTypeId(
            GetManipulatedItem()
        )
    ) then
        return false
    end
    if not (GetManipulatedItem() ~= GetItemOfTypeFromUnitBJ(
        GetManipulatingUnit(),
        GetItemTypeId(
            GetManipulatedItem()
        )
    )) then
        return false
    end
    return true
end
function StackingItem.prototype.MakeStack(self)
    SetItemCharges(
        GetItemOfTypeFromUnitBJ(
            GetManipulatingUnit(),
            GetItemTypeId(
                GetManipulatedItem()
            )
        ),
        (GetItemCharges(
            GetItemOfTypeFromUnitBJ(
                GetManipulatingUnit(),
                GetItemTypeId(
                    GetManipulatedItem()
                )
            )
        ) + GetItemCharges(
            GetManipulatedItem()
        ))
    )
    UnitRemoveItemSwapped(
        GetManipulatedItem(),
        GetManipulatingUnit()
    )
    RemoveItem(
        GetManipulatedItem()
    )
end
return ____exports
