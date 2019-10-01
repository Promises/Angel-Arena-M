--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local AOB_ITEM_LOOT_LEVEL_THREE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_THREE
local AOB_ITEM_LOOT_LEVEL_TWO = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_TWO
____exports.Infuse = {}
local Infuse = ____exports.Infuse
Infuse.name = "Infuse"
Infuse.__index = Infuse
Infuse.prototype = {}
Infuse.prototype.__index = __TS__Index(Infuse.prototype)
Infuse.prototype.__newindex = __TS__NewIndex(Infuse.prototype)
Infuse.prototype.constructor = Infuse
Infuse.____super = GenericAbility
setmetatable(Infuse, Infuse.____super)
setmetatable(Infuse.prototype, Infuse.____super.prototype)
function Infuse.new(...)
    local self = setmetatable({}, Infuse.prototype)
    self:____constructor(...)
    return self
end
function Infuse.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0A7", game)
end
function Infuse.prototype.TargetOnEffectAction(self)
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
            ) == 2 then
                local i = UnitItemInSlotBJ(tower.tower, 1)
                local indx = __TS__ArrayIndexOf(
                    AOB_ITEM_LOOT_LEVEL_TWO,
                    GetItemTypeId(i)
                )
                RemoveItem(
                    UnitItemInSlotBJ(tower.tower, 1)
                )
                local mana = GetUnitStateSwap(UNIT_STATE_MANA, tower.tower)
                SetUnitManaBJ(tower.tower, 0)
                if 10 * mana > Util:RandomInt(0, 99) then
                    UnitAddItemByIdSwapped(AOB_ITEM_LOOT_LEVEL_THREE[indx + 1], tower.tower)
                end
            end
        end
    end
end
return ____exports
