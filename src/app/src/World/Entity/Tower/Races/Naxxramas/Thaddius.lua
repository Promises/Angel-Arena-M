--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Thaddius = {}
local Thaddius = ____exports.Thaddius
Thaddius.name = "Thaddius"
Thaddius.__index = Thaddius
Thaddius.prototype = {}
Thaddius.prototype.__index = __TS__Index(Thaddius.prototype)
Thaddius.prototype.__newindex = __TS__NewIndex(Thaddius.prototype)
Thaddius.prototype.constructor = Thaddius
Thaddius.____super = Tower
setmetatable(Thaddius, Thaddius.____super)
setmetatable(Thaddius.prototype, Thaddius.____super.prototype)
function Thaddius.new(...)
    local self = setmetatable({}, Thaddius.prototype)
    self:____constructor(...)
    return self
end
function Thaddius.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if u == self.tower and target then
        local tempUnit = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            GetUnitX(self.tower),
            GetUnitY(self.tower),
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            2,
            FourCC("BTLF"),
            tempUnit
        )
        UnitAddAbilityBJ(
            FourCC("A0FC"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "chainlightning", target)
    end
end
return ____exports
