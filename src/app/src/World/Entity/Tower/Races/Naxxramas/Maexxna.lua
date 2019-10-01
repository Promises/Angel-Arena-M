--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Maexxna = {}
local Maexxna = ____exports.Maexxna
Maexxna.name = "Maexxna"
Maexxna.__index = Maexxna
Maexxna.prototype = {}
Maexxna.prototype.__index = __TS__Index(Maexxna.prototype)
Maexxna.prototype.__newindex = __TS__NewIndex(Maexxna.prototype)
Maexxna.prototype.constructor = Maexxna
Maexxna.____super = Tower
setmetatable(Maexxna, Maexxna.____super)
setmetatable(Maexxna.prototype, Maexxna.____super.prototype)
function Maexxna.new(...)
    local self = setmetatable({}, Maexxna.prototype)
    self:____constructor(...)
    return self
end
function Maexxna.prototype.AttackAction(self)
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
            20,
            FourCC("BTLF"),
            tempUnit
        )
        UnitAddAbilityBJ(
            FourCC("A0FA"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "acidbomb", target)
    end
end
return ____exports
