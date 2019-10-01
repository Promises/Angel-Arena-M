--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.StormPandaren = {}
local StormPandaren = ____exports.StormPandaren
StormPandaren.name = "StormPandaren"
StormPandaren.__index = StormPandaren
StormPandaren.prototype = {}
StormPandaren.prototype.__index = __TS__Index(StormPandaren.prototype)
StormPandaren.prototype.__newindex = __TS__NewIndex(StormPandaren.prototype)
StormPandaren.prototype.constructor = StormPandaren
StormPandaren.____super = Tower
setmetatable(StormPandaren, StormPandaren.____super)
setmetatable(StormPandaren.prototype, StormPandaren.____super.prototype)
function StormPandaren.new(...)
    local self = setmetatable({}, StormPandaren.prototype)
    self:____constructor(...)
    return self
end
function StormPandaren.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if u == self.tower then
        local randomInt = Util:RandomInt(1, 6)
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if not target then
            return
        end
        local spellPoint = GetUnitLoc(self.tower)
        local loc = GetUnitLoc(target)
        local tempUnit = CreateUnitAtLocSaveLast(
            self.owner.wcPlayer,
            FourCC("u008"),
            spellPoint,
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            3,
            FourCC("BTLF"),
            tempUnit
        )
        local ____switch4 = randomInt
        if ____switch4 == 1 then
            goto ____switch4_case_0
        end
        if ____switch4 == 2 then
            goto ____switch4_case_1
        end
        if ____switch4 == 3 then
            goto ____switch4_case_2
        end
        if ____switch4 == 4 then
            goto ____switch4_case_3
        end
        if ____switch4 == 5 then
            goto ____switch4_case_4
        end
        goto ____switch4_case_default
        ::____switch4_case_0::
        do
            UnitAddAbilityBJ(
                FourCC("A078"),
                tempUnit
            )
            IssuePointOrderLocBJ(tempUnit, "clusterrockets", loc)
            goto ____switch4_end
        end
        ::____switch4_case_1::
        do
            UnitAddAbilityBJ(
                FourCC("A00F"),
                tempUnit
            )
            IssuePointOrderLocBJ(tempUnit, "flamestrike", loc)
            goto ____switch4_end
        end
        ::____switch4_case_2::
        do
            UnitAddAbilityBJ(
                FourCC("A02N"),
                tempUnit
            )
            IssuePointOrderLocBJ(tempUnit, "impale", loc)
            goto ____switch4_end
        end
        ::____switch4_case_3::
        do
            UnitAddAbilityBJ(
                FourCC("A02M"),
                tempUnit
            )
            IssuePointOrderLocBJ(tempUnit, "carrionswarm", loc)
            goto ____switch4_end
        end
        ::____switch4_case_4::
        do
            UnitAddAbilityBJ(
                FourCC("A08P"),
                tempUnit
            )
            IssuePointOrderLocBJ(tempUnit, "rainoffire", loc)
            goto ____switch4_end
        end
        ::____switch4_case_default::
        do
            UnitAddAbilityBJ(
                FourCC("A00J"),
                tempUnit
            )
            IssuePointOrderLocBJ(tempUnit, "fanofknives", loc)
            goto ____switch4_end
        end
        ::____switch4_end::
        RemoveLocation(spellPoint)
        RemoveLocation(loc)
    end
end
return ____exports
