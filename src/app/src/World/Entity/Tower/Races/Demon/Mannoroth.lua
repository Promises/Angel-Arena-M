--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Mannoroth = {}
local Mannoroth = ____exports.Mannoroth
Mannoroth.name = "Mannoroth"
Mannoroth.__index = Mannoroth
Mannoroth.prototype = {}
Mannoroth.prototype.__index = __TS__Index(Mannoroth.prototype)
Mannoroth.prototype.__newindex = __TS__NewIndex(Mannoroth.prototype)
Mannoroth.prototype.constructor = Mannoroth
Mannoroth.____super = Tower
setmetatable(Mannoroth, Mannoroth.____super)
setmetatable(Mannoroth.prototype, Mannoroth.____super.prototype)
function Mannoroth.new(...)
    local self = setmetatable({}, Mannoroth.prototype)
    self:____constructor(...)
    return self
end
function Mannoroth.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if Util:RandomInt(1, 3) ~= 1 then
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
            FourCC("A06V"),
            tempUnit
        )
        IssueImmediateOrderBJ(tempUnit, "howlofterror")
    end
end
return ____exports
