--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local AOB_ITEM_LOOT_LEVEL_ONE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_ONE
local AOB_ITEM_LOOT_LEVEL_THREE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_THREE
____exports.AlchemicalTransmutation = {}
local AlchemicalTransmutation = ____exports.AlchemicalTransmutation
AlchemicalTransmutation.name = "AlchemicalTransmutation"
AlchemicalTransmutation.__index = AlchemicalTransmutation
AlchemicalTransmutation.prototype = {}
AlchemicalTransmutation.prototype.__index = __TS__Index(AlchemicalTransmutation.prototype)
AlchemicalTransmutation.prototype.__newindex = __TS__NewIndex(AlchemicalTransmutation.prototype)
AlchemicalTransmutation.prototype.constructor = AlchemicalTransmutation
AlchemicalTransmutation.____super = GenericAbility
setmetatable(AlchemicalTransmutation, AlchemicalTransmutation.____super)
setmetatable(AlchemicalTransmutation.prototype, AlchemicalTransmutation.____super.prototype)
function AlchemicalTransmutation.new(...)
    local self = setmetatable({}, AlchemicalTransmutation.prototype)
    self:____constructor(...)
    return self
end
function AlchemicalTransmutation.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0B0", game)
end
function AlchemicalTransmutation.prototype.TargetOnEffectAction(self)
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
                RemoveItem(
                    UnitItemInSlotBJ(tower.tower, 1)
                )
                UnitAddItemByIdSwapped(AOB_ITEM_LOOT_LEVEL_THREE[indx + 1], tower.tower)
            else
                owner:giveGold(75)
            end
        end
    end
end
return ____exports
