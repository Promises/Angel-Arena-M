--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Buff = require("app.src.World.Entity.Buff.Specs.Buff")
local Buff = ____Buff.Buff
____exports.CrushedDamageBuff = {}
local CrushedDamageBuff = ____exports.CrushedDamageBuff
CrushedDamageBuff.name = "CrushedDamageBuff"
CrushedDamageBuff.__index = CrushedDamageBuff
CrushedDamageBuff.prototype = {}
CrushedDamageBuff.prototype.__index = __TS__Index(CrushedDamageBuff.prototype)
CrushedDamageBuff.prototype.constructor = CrushedDamageBuff
CrushedDamageBuff.____super = Buff
setmetatable(CrushedDamageBuff, CrushedDamageBuff.____super)
setmetatable(CrushedDamageBuff.prototype, CrushedDamageBuff.____super.prototype)
function CrushedDamageBuff.new(...)
    local self = setmetatable({}, CrushedDamageBuff.prototype)
    self:____constructor(...)
    return self
end
function CrushedDamageBuff.prototype.____constructor(self, game)
    Buff.prototype.____constructor(self, "B006", game)
end
function CrushedDamageBuff.prototype.ModifyDamage(self)
    local target = self.damageEngineGlobals.udg_DamageEventTarget
    if not target then
        return
    end
    if not self:Condition(target) then
        return
    end
    do
        local ____obj, ____index = self.damageEngineGlobals, "udg_DamageEventAmount"
        ____obj[____index] = ____obj[____index] * 1.25
    end
end
return ____exports
