--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.KelThuzad = {}
local KelThuzad = ____exports.KelThuzad
KelThuzad.name = "KelThuzad"
KelThuzad.__index = KelThuzad
KelThuzad.prototype = {}
KelThuzad.prototype.__index = __TS__Index(KelThuzad.prototype)
KelThuzad.prototype.__newindex = __TS__NewIndex(KelThuzad.prototype)
KelThuzad.prototype.constructor = KelThuzad
KelThuzad.____super = Tower
setmetatable(KelThuzad, KelThuzad.____super)
setmetatable(KelThuzad.prototype, KelThuzad.____super.prototype)
function KelThuzad.new(...)
    local self = setmetatable({}, KelThuzad.prototype)
    self:____constructor(...)
    return self
end
function KelThuzad.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if u == self.tower and target then
        BlzSetUnitArmor(
            target,
            BlzGetUnitArmor(target) - 0.1 * (1 - (GetUnitMoveSpeed(target) / GetUnitDefaultMoveSpeed(target)))
        )
    end
end
return ____exports
