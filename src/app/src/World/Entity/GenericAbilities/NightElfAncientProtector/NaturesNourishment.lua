--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.NaturesNourishment = {}
local NaturesNourishment = ____exports.NaturesNourishment
NaturesNourishment.name = "NaturesNourishment"
NaturesNourishment.__index = NaturesNourishment
NaturesNourishment.prototype = {}
NaturesNourishment.prototype.__index = __TS__Index(NaturesNourishment.prototype)
NaturesNourishment.prototype.__newindex = __TS__NewIndex(NaturesNourishment.prototype)
NaturesNourishment.prototype.constructor = NaturesNourishment
NaturesNourishment.____super = GenericAbility
setmetatable(NaturesNourishment, NaturesNourishment.____super)
setmetatable(NaturesNourishment.prototype, NaturesNourishment.____super.prototype)
function NaturesNourishment.new(...)
    local self = setmetatable({}, NaturesNourishment.prototype)
    self:____constructor(...)
    return self
end
function NaturesNourishment.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0BI", game)
    self.givesAbilityOne = FourCC("A0BX")
    self.givesAbilityTwo = FourCC("S009")
    self.maxLevel = 5
end
function NaturesNourishment.prototype.TargetOnCastAction(self)
    local target = GetSpellTargetUnit()
    if target then
        if not (GetUnitAbilityLevelSwapped(self.givesAbilityOne, target) >= self.maxLevel) then
            if GetUnitAbilityLevelSwapped(self.givesAbilityOne, target) >= 1 then
                IncUnitAbilityLevelSwapped(self.givesAbilityOne, target)
            else
                UnitAddAbilityBJ(self.givesAbilityOne, target)
            end
        end
        if not (GetUnitAbilityLevelSwapped(self.givesAbilityTwo, target) >= self.maxLevel) then
            if GetUnitAbilityLevelSwapped(self.givesAbilityTwo, target) >= 1 then
                IncUnitAbilityLevelSwapped(self.givesAbilityTwo, target)
            else
                UnitAddAbilityBJ(self.givesAbilityTwo, target)
            end
        end
    end
end
return ____exports
