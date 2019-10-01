--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.GoblinBlademaster = {}
local GoblinBlademaster = ____exports.GoblinBlademaster
GoblinBlademaster.name = "GoblinBlademaster"
GoblinBlademaster.__index = GoblinBlademaster
GoblinBlademaster.prototype = {}
GoblinBlademaster.prototype.__index = __TS__Index(GoblinBlademaster.prototype)
GoblinBlademaster.prototype.__newindex = __TS__NewIndex(GoblinBlademaster.prototype)
GoblinBlademaster.prototype.constructor = GoblinBlademaster
GoblinBlademaster.____super = Tower
setmetatable(GoblinBlademaster, GoblinBlademaster.____super)
setmetatable(GoblinBlademaster.prototype, GoblinBlademaster.____super.prototype)
function GoblinBlademaster.new(...)
    local self = setmetatable({}, GoblinBlademaster.prototype)
    self:____constructor(...)
    return self
end
function GoblinBlademaster.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if Util:RandomInt(1, 100) > 8 then
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
            10,
            FourCC("BTLF"),
            tempUnit
        )
        UnitAddAbilityBJ(
            FourCC("A0D6"),
            tempUnit
        )
        IssueImmediateOrderBJ(tempUnit, "spiritwolf")
    end
end
return ____exports
