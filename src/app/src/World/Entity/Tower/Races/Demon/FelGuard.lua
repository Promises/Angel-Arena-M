--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.FelGuard = {}
local FelGuard = ____exports.FelGuard
FelGuard.name = "FelGuard"
FelGuard.__index = FelGuard
FelGuard.prototype = {}
FelGuard.prototype.__index = __TS__Index(FelGuard.prototype)
FelGuard.prototype.__newindex = __TS__NewIndex(FelGuard.prototype)
FelGuard.prototype.constructor = FelGuard
FelGuard.____super = Tower
setmetatable(FelGuard, FelGuard.____super)
setmetatable(FelGuard.prototype, FelGuard.____super.prototype)
function FelGuard.new(...)
    local self = setmetatable({}, FelGuard.prototype)
    self:____constructor(...)
    return self
end
function FelGuard.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if Util:RandomInt(1, 4) ~= 1 then
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
            FourCC("A06W"),
            tempUnit
        )
        IssuePointOrder(
            tempUnit,
            "breathoffrost",
            GetUnitX(target),
            GetUnitY(target)
        )
    end
end
return ____exports
