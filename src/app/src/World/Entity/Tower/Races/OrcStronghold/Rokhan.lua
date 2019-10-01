--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Rokhan = {}
local Rokhan = ____exports.Rokhan
Rokhan.name = "Rokhan"
Rokhan.__index = Rokhan
Rokhan.prototype = {}
Rokhan.prototype.__index = __TS__Index(Rokhan.prototype)
Rokhan.prototype.__newindex = __TS__NewIndex(Rokhan.prototype)
Rokhan.prototype.constructor = Rokhan
Rokhan.____super = Tower
setmetatable(Rokhan, Rokhan.____super)
setmetatable(Rokhan.prototype, Rokhan.____super.prototype)
function Rokhan.new(...)
    local self = setmetatable({}, Rokhan.prototype)
    self:____constructor(...)
    return self
end
function Rokhan.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if u == self.tower and target then
        local tempUnit = CreateUnit(
            self.owner.wcPlayer,
            FourCC("o00H"),
            GetUnitX(target),
            GetUnitY(target),
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            5,
            FourCC("BTLF"),
            tempUnit
        )
    end
end
return ____exports
