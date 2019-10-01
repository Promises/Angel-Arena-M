--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.WarchiefThrall = {}
local WarchiefThrall = ____exports.WarchiefThrall
WarchiefThrall.name = "WarchiefThrall"
WarchiefThrall.__index = WarchiefThrall
WarchiefThrall.prototype = {}
WarchiefThrall.prototype.__index = __TS__Index(WarchiefThrall.prototype)
WarchiefThrall.prototype.__newindex = __TS__NewIndex(WarchiefThrall.prototype)
WarchiefThrall.prototype.constructor = WarchiefThrall
WarchiefThrall.____super = Tower
setmetatable(WarchiefThrall, WarchiefThrall.____super)
setmetatable(WarchiefThrall.prototype, WarchiefThrall.____super.prototype)
function WarchiefThrall.new(...)
    local self = setmetatable({}, WarchiefThrall.prototype)
    self:____constructor(...)
    return self
end
function WarchiefThrall.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if Util:RandomInt(1, 100) > 5 then
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
            FourCC("A03J"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "forkedlightning", target)
    end
end
return ____exports
