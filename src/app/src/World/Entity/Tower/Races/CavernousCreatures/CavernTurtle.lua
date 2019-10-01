--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.CavernTurtle = {}
local CavernTurtle = ____exports.CavernTurtle
CavernTurtle.name = "CavernTurtle"
CavernTurtle.__index = CavernTurtle
CavernTurtle.prototype = {}
CavernTurtle.prototype.__index = __TS__Index(CavernTurtle.prototype)
CavernTurtle.prototype.__newindex = __TS__NewIndex(CavernTurtle.prototype)
CavernTurtle.prototype.constructor = CavernTurtle
CavernTurtle.____super = Tower
setmetatable(CavernTurtle, CavernTurtle.____super)
setmetatable(CavernTurtle.prototype, CavernTurtle.____super.prototype)
function CavernTurtle.new(...)
    local self = setmetatable({}, CavernTurtle.prototype)
    self:____constructor(...)
    return self
end
function CavernTurtle.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if u == self.tower and target then
        if not (self.game.gameDamageEngineGlobals.udg_DamageEventAOE == 1) then
            return
        end
        if not (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) >= 100) then
            return
        end
        SetUnitManaBJ(
            self.tower,
            (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) - 100)
        )
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
            FourCC("A0BY"),
            tempUnit
        )
        IssueImmediateOrderBJ(tempUnit, "fanofknives")
    end
end
return ____exports
