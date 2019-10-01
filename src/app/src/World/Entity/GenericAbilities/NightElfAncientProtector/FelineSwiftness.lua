--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.FelineSwiftness = {}
local FelineSwiftness = ____exports.FelineSwiftness
FelineSwiftness.name = "FelineSwiftness"
FelineSwiftness.__index = FelineSwiftness
FelineSwiftness.prototype = {}
FelineSwiftness.prototype.__index = __TS__Index(FelineSwiftness.prototype)
FelineSwiftness.prototype.__newindex = __TS__NewIndex(FelineSwiftness.prototype)
FelineSwiftness.prototype.constructor = FelineSwiftness
FelineSwiftness.____super = GenericAbility
setmetatable(FelineSwiftness, FelineSwiftness.____super)
setmetatable(FelineSwiftness.prototype, FelineSwiftness.____super.prototype)
function FelineSwiftness.new(...)
    local self = setmetatable({}, FelineSwiftness.prototype)
    self:____constructor(...)
    return self
end
function FelineSwiftness.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0B4", game)
    self.givesAbility = FourCC("S007")
    self.maxLevel = 10
end
function FelineSwiftness.prototype.TargetOnCastAction(self)
    local target = GetSpellTargetUnit()
    if target then
        if GetUnitAbilityLevelSwapped(self.givesAbility, target) >= self.maxLevel then
            return
        end
        if GetUnitAbilityLevelSwapped(self.givesAbility, target) >= 1 then
            IncUnitAbilityLevelSwapped(self.givesAbility, target)
        else
            UnitAddAbilityBJ(self.givesAbility, target)
        end
    end
end
return ____exports
