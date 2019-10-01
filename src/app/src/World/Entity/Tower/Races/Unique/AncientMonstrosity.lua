--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.AncientMonstrosity = {}
local AncientMonstrosity = ____exports.AncientMonstrosity
AncientMonstrosity.name = "AncientMonstrosity"
AncientMonstrosity.__index = AncientMonstrosity
AncientMonstrosity.prototype = {}
AncientMonstrosity.prototype.__index = __TS__Index(AncientMonstrosity.prototype)
AncientMonstrosity.prototype.__newindex = __TS__NewIndex(AncientMonstrosity.prototype)
AncientMonstrosity.prototype.constructor = AncientMonstrosity
AncientMonstrosity.____super = Tower
setmetatable(AncientMonstrosity, AncientMonstrosity.____super)
setmetatable(AncientMonstrosity.prototype, AncientMonstrosity.____super.prototype)
function AncientMonstrosity.new(...)
    local self = setmetatable({}, AncientMonstrosity.prototype)
    self:____constructor(...)
    return self
end
function AncientMonstrosity.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if Util:RandomInt(1, 2) == 1 then
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
            20,
            FourCC("BTLF"),
            tempUnit
        )
        UnitAddAbilityBJ(
            FourCC("A0EE"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "acidbomb", target)
    end
end
return ____exports
