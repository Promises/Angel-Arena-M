--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Warden = {}
local Warden = ____exports.Warden
Warden.name = "Warden"
Warden.__index = Warden
Warden.prototype = {}
Warden.prototype.__index = __TS__Index(Warden.prototype)
Warden.prototype.__newindex = __TS__NewIndex(Warden.prototype)
Warden.prototype.constructor = Warden
Warden.____super = Tower
setmetatable(Warden, Warden.____super)
setmetatable(Warden.prototype, Warden.____super.prototype)
function Warden.new(...)
    local self = setmetatable({}, Warden.prototype)
    self:____constructor(...)
    return self
end
function Warden.prototype.AttackAction(self)
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
            3,
            FourCC("BTLF"),
            tempUnit
        )
        UnitAddAbilityBJ(
            FourCC("A0BM"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "shadowstrike", target)
    end
end
return ____exports
