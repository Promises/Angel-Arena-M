--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.CorruptedTreeofLife = {}
local CorruptedTreeofLife = ____exports.CorruptedTreeofLife
CorruptedTreeofLife.name = "CorruptedTreeofLife"
CorruptedTreeofLife.__index = CorruptedTreeofLife
CorruptedTreeofLife.prototype = {}
CorruptedTreeofLife.prototype.__index = __TS__Index(CorruptedTreeofLife.prototype)
CorruptedTreeofLife.prototype.__newindex = __TS__NewIndex(CorruptedTreeofLife.prototype)
CorruptedTreeofLife.prototype.constructor = CorruptedTreeofLife
CorruptedTreeofLife.____super = Tower
setmetatable(CorruptedTreeofLife, CorruptedTreeofLife.____super)
setmetatable(CorruptedTreeofLife.prototype, CorruptedTreeofLife.____super.prototype)
function CorruptedTreeofLife.new(...)
    local self = setmetatable({}, CorruptedTreeofLife.prototype)
    self:____constructor(...)
    return self
end
function CorruptedTreeofLife.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if u == self.tower and target then
        if not (GetUnitAbilityLevelSwapped(
            FourCC("A091"),
            self.tower
        ) > 0) then
            return
        end
        local tempUnit = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            GetUnitX(target),
            GetUnitY(target),
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            1,
            FourCC("BTLF"),
            tempUnit
        )
        UnitAddAbilityBJ(
            FourCC("A090"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "chainlightning", target)
    end
end
return ____exports
