--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.GoblinTinkerer = {}
local GoblinTinkerer = ____exports.GoblinTinkerer
GoblinTinkerer.name = "GoblinTinkerer"
GoblinTinkerer.__index = GoblinTinkerer
GoblinTinkerer.prototype = {}
GoblinTinkerer.prototype.__index = __TS__Index(GoblinTinkerer.prototype)
GoblinTinkerer.prototype.__newindex = __TS__NewIndex(GoblinTinkerer.prototype)
GoblinTinkerer.prototype.constructor = GoblinTinkerer
GoblinTinkerer.____super = Tower
setmetatable(GoblinTinkerer, GoblinTinkerer.____super)
setmetatable(GoblinTinkerer.prototype, GoblinTinkerer.____super.prototype)
function GoblinTinkerer.new(...)
    local self = setmetatable({}, GoblinTinkerer.prototype)
    self:____constructor(...)
    return self
end
function GoblinTinkerer.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if Util:RandomInt(1, 100) > 5 then
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
            FourCC("A0B9"),
            tempUnit
        )
        IssuePointOrder(
            tempUnit,
            "clusterrockets",
            GetUnitX(target),
            GetUnitY(target)
        )
    end
end
return ____exports
