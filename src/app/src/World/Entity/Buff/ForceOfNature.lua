--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Buff = require("app.src.World.Entity.Buff.Specs.Buff")
local Buff = ____Buff.Buff
____exports.ForceOfNature = {}
local ForceOfNature = ____exports.ForceOfNature
ForceOfNature.name = "ForceOfNature"
ForceOfNature.__index = ForceOfNature
ForceOfNature.prototype = {}
ForceOfNature.prototype.__index = __TS__Index(ForceOfNature.prototype)
ForceOfNature.prototype.constructor = ForceOfNature
ForceOfNature.____super = Buff
setmetatable(ForceOfNature, ForceOfNature.____super)
setmetatable(ForceOfNature.prototype, ForceOfNature.____super.prototype)
function ForceOfNature.new(...)
    local self = setmetatable({}, ForceOfNature.prototype)
    self:____constructor(...)
    return self
end
function ForceOfNature.prototype.____constructor(self, game)
    Buff.prototype.____constructor(self, "B005", game)
end
function ForceOfNature.prototype.AttackAction(self)
    local target = self.damageEngineGlobals.udg_DamageEventTarget
    if not target then
        return
    end
    if not self:Condition(target) then
        return
    end
    if self.damageEngineGlobals.udg_DamageEventAmount < GetUnitStateSwap(UNIT_STATE_LIFE, target) then
        return
    end
    if Util:RandomInt(1, 100) > 75 then
        return
    end
    if not self.damageEngineGlobals.udg_DamageEventSource then
        return
    end
    local dummy = CreateUnit(
        GetOwningPlayer(self.damageEngineGlobals.udg_DamageEventSource),
        FourCC("u005"),
        GetUnitX(target),
        GetUnitY(target),
        bj_UNIT_FACING
    )
    UnitApplyTimedLifeBJ(
        10,
        FourCC("BTLF"),
        dummy
    )
end
return ____exports
