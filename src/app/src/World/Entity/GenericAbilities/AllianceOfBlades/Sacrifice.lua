--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local AOB_ITEM_LOOT_LEVEL_FOUR = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_FOUR
local AOB_ITEM_LOOT_LEVEL_THREE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_THREE
____exports.Sacrifice = {}
local Sacrifice = ____exports.Sacrifice
Sacrifice.name = "Sacrifice"
Sacrifice.__index = Sacrifice
Sacrifice.prototype = {}
Sacrifice.prototype.__index = __TS__Index(Sacrifice.prototype)
Sacrifice.prototype.__newindex = __TS__NewIndex(Sacrifice.prototype)
Sacrifice.prototype.constructor = Sacrifice
Sacrifice.____super = GenericAbility
setmetatable(Sacrifice, Sacrifice.____super)
setmetatable(Sacrifice.prototype, Sacrifice.____super.prototype)
function Sacrifice.new(...)
    local self = setmetatable({}, Sacrifice.prototype)
    self:____constructor(...)
    return self
end
function Sacrifice.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0AJ", game)
end
function Sacrifice.prototype.TargetOnEffectAction(self)
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
            ) == 3 then
                local i = UnitItemInSlotBJ(tower.tower, 1)
                local indx = __TS__ArrayIndexOf(
                    AOB_ITEM_LOOT_LEVEL_THREE,
                    GetItemTypeId(i)
                )
                local mana = GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) + 1
                SetUnitManaBJ(tower.tower, mana)
                RemoveItem(
                    UnitItemInSlotBJ(tower.tower, 1)
                )
                if mana > 1 then
                    SetUnitManaBJ(tower.tower, 0)
                    UnitAddItemByIdSwapped(AOB_ITEM_LOOT_LEVEL_FOUR[indx + 1], tower.tower)
                end
            end
        end
    end
end
return ____exports
