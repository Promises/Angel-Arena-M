--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Buff = require("app.src.World.Entity.Buff.Specs.Buff")
local Buff = ____Buff.Buff
____exports.Moonstorm = {}
local Moonstorm = ____exports.Moonstorm
Moonstorm.name = "Moonstorm"
Moonstorm.__index = Moonstorm
Moonstorm.prototype = {}
Moonstorm.prototype.__index = __TS__Index(Moonstorm.prototype)
Moonstorm.prototype.constructor = Moonstorm
Moonstorm.____super = Buff
setmetatable(Moonstorm, Moonstorm.____super)
setmetatable(Moonstorm.prototype, Moonstorm.____super.prototype)
function Moonstorm.new(...)
    local self = setmetatable({}, Moonstorm.prototype)
    self:____constructor(...)
    return self
end
function Moonstorm.prototype.____constructor(self, game)
    Buff.prototype.____constructor(self, "B01E", game)
end
function Moonstorm.prototype.ModifyDamage(self)
    local target = self.damageEngineGlobals.udg_DamageEventTarget
    if not target then
        return
    end
    if not self:Condition(target) then
        return
    end
    if Util:RandomInt(1, 100) > 10 then
        return
    end
    DestroyEffect(
        AddSpecialEffect(
            "Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl",
            GetUnitX(target),
            GetUnitY(target)
        )
    )
    do
        local ____obj, ____index = self.damageEngineGlobals, "udg_DamageEventAmount"
        ____obj[____index] = ____obj[____index] + 800
    end
end
return ____exports
