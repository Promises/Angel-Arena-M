--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Buff = require("app.src.World.Entity.Buff.Specs.Buff")
local Buff = ____Buff.Buff
____exports.IceTrollJoker = {}
local IceTrollJoker = ____exports.IceTrollJoker
IceTrollJoker.name = "IceTrollJoker"
IceTrollJoker.__index = IceTrollJoker
IceTrollJoker.prototype = {}
IceTrollJoker.prototype.__index = __TS__Index(IceTrollJoker.prototype)
IceTrollJoker.prototype.constructor = IceTrollJoker
IceTrollJoker.____super = Buff
setmetatable(IceTrollJoker, IceTrollJoker.____super)
setmetatable(IceTrollJoker.prototype, IceTrollJoker.____super.prototype)
function IceTrollJoker.new(...)
    local self = setmetatable({}, IceTrollJoker.prototype)
    self:____constructor(...)
    return self
end
function IceTrollJoker.prototype.____constructor(self, game)
    Buff.prototype.____constructor(self, "B02M", game)
end
function IceTrollJoker.prototype.ModifyDamage(self)
    local target = self.damageEngineGlobals.udg_DamageEventTarget
    if not target then
        return
    end
    if not self:Condition(target) then
        return
    end
    if not (GetUnitMoveSpeed(target) < GetUnitDefaultMoveSpeed(target)) then
        return
    end
    do
        local ____obj, ____index = self.damageEngineGlobals, "udg_DamageEventAmount"
        ____obj[____index] = ____obj[____index] * 3
    end
end
return ____exports
