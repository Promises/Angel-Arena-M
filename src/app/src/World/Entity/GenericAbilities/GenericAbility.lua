--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.GenericAbility = {}
local GenericAbility = ____exports.GenericAbility
GenericAbility.name = "GenericAbility"
GenericAbility.__index = GenericAbility
GenericAbility.prototype = {}
GenericAbility.prototype.____getters = {}
GenericAbility.prototype.__index = __TS__Index(GenericAbility.prototype)
GenericAbility.prototype.____setters = {}
GenericAbility.prototype.__newindex = __TS__NewIndex(GenericAbility.prototype)
GenericAbility.prototype.constructor = GenericAbility
function GenericAbility.new(...)
    local self = setmetatable({}, GenericAbility.prototype)
    self:____constructor(...)
    return self
end
function GenericAbility.prototype.____constructor(self, abiID, game)
    self.abilityId = FourCC(abiID)
    self._game = game
end
function GenericAbility.prototype.____getters.game(self)
    return self._game
end
function GenericAbility.prototype.____setters.game(self, value)
    self._game = value
end
function GenericAbility.prototype.Condition(self)
    return GetSpellAbilityId() == self.abilityId
end
function GenericAbility.prototype.IsAttackActionAbility(self)
    return self.AttackAction ~= nil
end
function GenericAbility.prototype.IsAbilityOnEffectTargetsUnit(self)
    return self.TargetOnEffectAction ~= nil
end
function GenericAbility.prototype.IsAbilityOnCastTargetsUnit(self)
    return self.TargetOnCastAction ~= nil
end
return ____exports
