--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.DrinkWaterRune = {}
local DrinkWaterRune = ____exports.DrinkWaterRune
DrinkWaterRune.name = "DrinkWaterRune"
DrinkWaterRune.__index = DrinkWaterRune
DrinkWaterRune.prototype = {}
DrinkWaterRune.prototype.__index = __TS__Index(DrinkWaterRune.prototype)
DrinkWaterRune.prototype.__newindex = __TS__NewIndex(DrinkWaterRune.prototype)
DrinkWaterRune.prototype.constructor = DrinkWaterRune
DrinkWaterRune.____super = GenericAbility
setmetatable(DrinkWaterRune, DrinkWaterRune.____super)
setmetatable(DrinkWaterRune.prototype, DrinkWaterRune.____super.prototype)
function DrinkWaterRune.new(...)
    local self = setmetatable({}, DrinkWaterRune.prototype)
    self:____constructor(...)
    return self
end
function DrinkWaterRune.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0E3", game)
end
function DrinkWaterRune.prototype.TargetOnEffectAction(self)
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
        local target = owner:GetTower(
            GetHandleId(
                GetSpellTargetUnit()
            )
        )
        if tower and target then
            local mana = GetUnitStateSwap(UNIT_STATE_MANA, tower.tower)
            if target:GetTypeID() == FourCC("n01R") then
                target:Upgrade(
                    FourCC("n027")
                )
                if mana > 8 then
                    local newId = FourCC("u037")
                    if Util:RandomInt(1000, 2000) == 1337 then
                        newId = FourCC("h03G")
                    end
                    tower:Upgrade(newId)
                else
                    SetUnitManaBJ(tower.tower, mana + 1)
                end
            end
        end
    end
end
return ____exports
