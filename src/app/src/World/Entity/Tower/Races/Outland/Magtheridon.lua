--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Magtheridon = {}
local Magtheridon = ____exports.Magtheridon
Magtheridon.name = "Magtheridon"
Magtheridon.__index = Magtheridon
Magtheridon.prototype = {}
Magtheridon.prototype.__index = __TS__Index(Magtheridon.prototype)
Magtheridon.prototype.__newindex = __TS__NewIndex(Magtheridon.prototype)
Magtheridon.prototype.constructor = Magtheridon
Magtheridon.____super = Tower
setmetatable(Magtheridon, Magtheridon.____super)
setmetatable(Magtheridon.prototype, Magtheridon.____super.prototype)
function Magtheridon.new(...)
    local self = setmetatable({}, Magtheridon.prototype)
    self:____constructor(...)
    return self
end
function Magtheridon.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if Util:RandomInt(1, 100) > 15 then
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
            FourCC("A0DT"),
            tempUnit
        )
        IssuePointOrder(
            tempUnit,
            "rainoffire",
            GetUnitX(target),
            GetUnitY(target)
        )
    end
end
return ____exports
