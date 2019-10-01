--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.AcidSpittingSpider = {}
local AcidSpittingSpider = ____exports.AcidSpittingSpider
AcidSpittingSpider.name = "AcidSpittingSpider"
AcidSpittingSpider.__index = AcidSpittingSpider
AcidSpittingSpider.prototype = {}
AcidSpittingSpider.prototype.__index = __TS__Index(AcidSpittingSpider.prototype)
AcidSpittingSpider.prototype.__newindex = __TS__NewIndex(AcidSpittingSpider.prototype)
AcidSpittingSpider.prototype.constructor = AcidSpittingSpider
AcidSpittingSpider.____super = Tower
setmetatable(AcidSpittingSpider, AcidSpittingSpider.____super)
setmetatable(AcidSpittingSpider.prototype, AcidSpittingSpider.____super.prototype)
function AcidSpittingSpider.new(...)
    local self = setmetatable({}, AcidSpittingSpider.prototype)
    self:____constructor(...)
    return self
end
function AcidSpittingSpider.prototype.AttackAction(self)
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
            20,
            FourCC("BTLF"),
            tempUnit
        )
        UnitAddAbilityBJ(
            FourCC("A073"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "acidbomb", target)
    end
end
return ____exports
