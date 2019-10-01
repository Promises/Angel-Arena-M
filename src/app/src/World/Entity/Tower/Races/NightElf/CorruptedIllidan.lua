--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.CorruptedIllidan = {}
local CorruptedIllidan = ____exports.CorruptedIllidan
CorruptedIllidan.name = "CorruptedIllidan"
CorruptedIllidan.__index = CorruptedIllidan
CorruptedIllidan.prototype = {}
CorruptedIllidan.prototype.__index = __TS__Index(CorruptedIllidan.prototype)
CorruptedIllidan.prototype.__newindex = __TS__NewIndex(CorruptedIllidan.prototype)
CorruptedIllidan.prototype.constructor = CorruptedIllidan
CorruptedIllidan.____super = Tower
setmetatable(CorruptedIllidan, CorruptedIllidan.____super)
setmetatable(CorruptedIllidan.prototype, CorruptedIllidan.____super.prototype)
function CorruptedIllidan.new(...)
    local self = setmetatable({}, CorruptedIllidan.prototype)
    self:____constructor(...)
    return self
end
function CorruptedIllidan.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if not self.game.gameDamageEngineGlobals.udg_IsDamageSpell then
        return
    end
    if u == self.tower and target then
        local tempUnit = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            GetUnitX(self.tower),
            GetUnitY(self.tower),
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            3,
            FourCC("BTLF"),
            tempUnit
        )
        UnitAddAbilityBJ(
            FourCC("A0BZ"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "soulburn", target)
    end
end
return ____exports
