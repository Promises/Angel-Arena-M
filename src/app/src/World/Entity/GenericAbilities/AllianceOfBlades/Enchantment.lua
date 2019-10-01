--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local AOB_ITEM_LOOT_LEVEL_ONE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_ONE
local AOB_ITEM_LOOT_LEVEL_TWO = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_TWO
____exports.Enchantment = {}
local Enchantment = ____exports.Enchantment
Enchantment.name = "Enchantment"
Enchantment.__index = Enchantment
Enchantment.prototype = {}
Enchantment.prototype.__index = __TS__Index(Enchantment.prototype)
Enchantment.prototype.__newindex = __TS__NewIndex(Enchantment.prototype)
Enchantment.prototype.constructor = Enchantment
Enchantment.____super = GenericAbility
setmetatable(Enchantment, Enchantment.____super)
setmetatable(Enchantment.prototype, Enchantment.____super.prototype)
function Enchantment.new(...)
    local self = setmetatable({}, Enchantment.prototype)
    self:____constructor(...)
    return self
end
function Enchantment.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A03F", game)
end
function Enchantment.prototype.TargetOnEffectAction(self)
    local u = GetTriggerUnit()
    local owner = self.game.players:get(
        GetPlayerId(
            GetOwningPlayer(u)
        )
    )
    if owner then
        local tower = owner:GetTower(
            GetHandleId(u)
        )
        if tower then
            if GetItemLevel(
                UnitItemInSlotBJ(tower.tower, 1)
            ) == 1 then
                local i = UnitItemInSlotBJ(tower.tower, 1)
                local indx = __TS__ArrayIndexOf(
                    AOB_ITEM_LOOT_LEVEL_ONE,
                    GetItemTypeId(i)
                )
                local lvlTwoItem = AOB_ITEM_LOOT_LEVEL_TWO[indx + 1]
                RemoveItem(
                    UnitItemInSlotBJ(tower.tower, 1)
                )
                UnitAddItemByIdSwapped(lvlTwoItem, tower.tower)
            end
        end
    end
end
return ____exports
