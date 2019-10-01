--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.TheDarkness = {}
local TheDarkness = ____exports.TheDarkness
TheDarkness.name = "TheDarkness"
TheDarkness.__index = TheDarkness
TheDarkness.prototype = {}
TheDarkness.prototype.__index = __TS__Index(TheDarkness.prototype)
TheDarkness.prototype.__newindex = __TS__NewIndex(TheDarkness.prototype)
TheDarkness.prototype.constructor = TheDarkness
TheDarkness.____super = Tower
setmetatable(TheDarkness, TheDarkness.____super)
setmetatable(TheDarkness.prototype, TheDarkness.____super.prototype)
function TheDarkness.new(...)
    local self = setmetatable({}, TheDarkness.prototype)
    self:____constructor(...)
    return self
end
function TheDarkness.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if u == self.tower and target then
        local tempUnit = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            GetUnitX(self.tower),
            GetUnitY(self.tower),
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            2,
            FourCC("BTLF"),
            tempUnit
        )
        UnitAddAbilityBJ(
            FourCC("A0EG"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "cripple", target)
    end
end
return ____exports
