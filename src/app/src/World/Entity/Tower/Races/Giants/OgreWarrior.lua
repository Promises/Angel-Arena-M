--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.OgreWarrior = {}
local OgreWarrior = ____exports.OgreWarrior
OgreWarrior.name = "OgreWarrior"
OgreWarrior.__index = OgreWarrior
OgreWarrior.prototype = {}
OgreWarrior.prototype.__index = __TS__Index(OgreWarrior.prototype)
OgreWarrior.prototype.__newindex = __TS__NewIndex(OgreWarrior.prototype)
OgreWarrior.prototype.constructor = OgreWarrior
OgreWarrior.____super = Tower
setmetatable(OgreWarrior, OgreWarrior.____super)
setmetatable(OgreWarrior.prototype, OgreWarrior.____super.prototype)
function OgreWarrior.new(...)
    local self = setmetatable({}, OgreWarrior.prototype)
    self:____constructor(...)
    return self
end
function OgreWarrior.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if u == self.tower and target then
        if UnitHasBuffBJ(
            target,
            FourCC("B01J")
        ) then
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
            FourCC("A029"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "slow", target)
    end
end
return ____exports
