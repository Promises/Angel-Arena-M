--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.CavernRevenant = {}
local CavernRevenant = ____exports.CavernRevenant
CavernRevenant.name = "CavernRevenant"
CavernRevenant.__index = CavernRevenant
CavernRevenant.prototype = {}
CavernRevenant.prototype.__index = __TS__Index(CavernRevenant.prototype)
CavernRevenant.prototype.__newindex = __TS__NewIndex(CavernRevenant.prototype)
CavernRevenant.prototype.constructor = CavernRevenant
CavernRevenant.____super = Tower
setmetatable(CavernRevenant, CavernRevenant.____super)
setmetatable(CavernRevenant.prototype, CavernRevenant.____super.prototype)
function CavernRevenant.new(...)
    local self = setmetatable({}, CavernRevenant.prototype)
    self:____constructor(...)
    return self
end
function CavernRevenant.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if u == self.tower and target then
        if not (self.game.gameDamageEngineGlobals.udg_DamageEventAOE == 1) then
            return
        end
        if not (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) >= 25) then
            return
        end
        local tempUnit = CreateUnit(
            self.owner.wcPlayer,
            FourCC("n00D"),
            GetUnitX(target),
            GetUnitY(target),
            bj_UNIT_FACING
        )
        SetUnitManaBJ(
            self.tower,
            (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) - 25)
        )
        UnitApplyTimedLifeBJ(
            60,
            FourCC("BTLF"),
            tempUnit
        )
    end
end
return ____exports
