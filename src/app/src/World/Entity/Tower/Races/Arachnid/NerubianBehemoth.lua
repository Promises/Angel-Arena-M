--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.NerubianBehemoth = {}
local NerubianBehemoth = ____exports.NerubianBehemoth
NerubianBehemoth.name = "NerubianBehemoth"
NerubianBehemoth.__index = NerubianBehemoth
NerubianBehemoth.prototype = {}
NerubianBehemoth.prototype.__index = __TS__Index(NerubianBehemoth.prototype)
NerubianBehemoth.prototype.__newindex = __TS__NewIndex(NerubianBehemoth.prototype)
NerubianBehemoth.prototype.constructor = NerubianBehemoth
NerubianBehemoth.____super = Tower
setmetatable(NerubianBehemoth, NerubianBehemoth.____super)
setmetatable(NerubianBehemoth.prototype, NerubianBehemoth.____super.prototype)
function NerubianBehemoth.new(...)
    local self = setmetatable({}, NerubianBehemoth.prototype)
    self:____constructor(...)
    return self
end
function NerubianBehemoth.prototype.AttackAction(self)
    if Util:RandomInt(1, 4) ~= 1 then
        return
    end
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if u == self.tower and target then
        local tempUnit = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            GetUnitX(u),
            GetUnitY(u),
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            1,
            FourCC("BTLF"),
            tempUnit
        )
        UnitAddAbilityBJ(
            FourCC("A0AH"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "cripple", target)
    end
end
return ____exports
