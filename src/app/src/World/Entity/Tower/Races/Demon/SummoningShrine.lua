--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.SummoningShrine = {}
local SummoningShrine = ____exports.SummoningShrine
SummoningShrine.name = "SummoningShrine"
SummoningShrine.__index = SummoningShrine
SummoningShrine.prototype = {}
SummoningShrine.prototype.__index = __TS__Index(SummoningShrine.prototype)
SummoningShrine.prototype.__newindex = __TS__NewIndex(SummoningShrine.prototype)
SummoningShrine.prototype.constructor = SummoningShrine
SummoningShrine.____super = Tower
setmetatable(SummoningShrine, SummoningShrine.____super)
setmetatable(SummoningShrine.prototype, SummoningShrine.____super.prototype)
function SummoningShrine.new(...)
    local self = setmetatable({}, SummoningShrine.prototype)
    self:____constructor(...)
    return self
end
function SummoningShrine.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if u == self.tower and target then
        local tempUnit = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            GetUnitX(target),
            GetUnitY(target),
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            3,
            FourCC("BTLF"),
            tempUnit
        )
        UnitAddAbilityBJ(
            FourCC("A06P"),
            tempUnit
        )
        IssuePointOrder(
            tempUnit,
            "dreadlordinferno",
            GetUnitX(target),
            GetUnitY(target)
        )
    end
end
return ____exports
