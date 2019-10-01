--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Buff = {}
local Buff = ____exports.Buff
Buff.name = "Buff"
Buff.__index = Buff
Buff.prototype = {}
Buff.prototype.____getters = {}
Buff.prototype.__index = __TS__Index(Buff.prototype)
Buff.prototype.constructor = Buff
function Buff.new(...)
    local self = setmetatable({}, Buff.prototype)
    self:____constructor(...)
    return self
end
function Buff.prototype.____constructor(self, buffID, game)
    self.buffID = FourCC(buffID)
    self.game = game
    self._damageEngine = self.game.gameDamageEngine
    self._damageEngineGlobals = self.game.gameDamageEngineGlobals
end
function Buff.prototype.____getters.BuffID(self)
    return self.buffID
end
function Buff.prototype.____getters.damageEngine(self)
    return self._damageEngine
end
function Buff.prototype.____getters.damageEngineGlobals(self)
    return self._damageEngineGlobals
end
function Buff.prototype.Condition(self, target)
    return UnitHasBuffBJ(target, self.buffID)
end
function Buff.prototype.IsDamageModificationBuff(self)
    return self.ModifyDamage ~= nil
end
function Buff.prototype.IsAttackActionBuff(self)
    return self.AttackAction ~= nil
end
return ____exports
