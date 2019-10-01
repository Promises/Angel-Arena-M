--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Buff = require("app.src.World.Entity.Buff.Specs.Buff")
local Buff = ____Buff.Buff
____exports.BattleRoar = {}
local BattleRoar = ____exports.BattleRoar
BattleRoar.name = "BattleRoar"
BattleRoar.__index = BattleRoar
BattleRoar.prototype = {}
BattleRoar.prototype.__index = __TS__Index(BattleRoar.prototype)
BattleRoar.prototype.constructor = BattleRoar
BattleRoar.____super = Buff
setmetatable(BattleRoar, BattleRoar.____super)
setmetatable(BattleRoar.prototype, BattleRoar.____super.prototype)
function BattleRoar.new(...)
    local self = setmetatable({}, BattleRoar.prototype)
    self:____constructor(...)
    return self
end
function BattleRoar.prototype.____constructor(self, game)
    Buff.prototype.____constructor(self, "B015", game)
end
function BattleRoar.prototype.ModifyDamage(self)
    local target = self.damageEngineGlobals.udg_DamageEventTarget
    if not target then
        return
    end
    if not self:Condition(target) then
        return
    end
    do
        local ____obj, ____index = self.damageEngineGlobals, "udg_DamageEventAmount"
        ____obj[____index] = ____obj[____index] * 1.5
    end
end
return ____exports
