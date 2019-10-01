--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.DwarfKing = {}
local DwarfKing = ____exports.DwarfKing
DwarfKing.name = "DwarfKing"
DwarfKing.__index = DwarfKing
DwarfKing.prototype = {}
DwarfKing.prototype.__index = __TS__Index(DwarfKing.prototype)
DwarfKing.prototype.__newindex = __TS__NewIndex(DwarfKing.prototype)
DwarfKing.prototype.constructor = DwarfKing
DwarfKing.____super = Tower
setmetatable(DwarfKing, DwarfKing.____super)
setmetatable(DwarfKing.prototype, DwarfKing.____super.prototype)
function DwarfKing.new(...)
    local self = setmetatable({}, DwarfKing.prototype)
    self:____constructor(...)
    return self
end
function DwarfKing.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if Util:RandomInt(1, 100) >= 3 then
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
            FourCC("A0AT"),
            tempUnit
        )
        IssuePointOrder(
            tempUnit,
            "shockwave",
            GetUnitX(target),
            GetUnitY(target)
        )
    end
end
return ____exports
