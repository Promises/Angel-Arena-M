--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.DemonicIllidan = {}
local DemonicIllidan = ____exports.DemonicIllidan
DemonicIllidan.name = "DemonicIllidan"
DemonicIllidan.__index = DemonicIllidan
DemonicIllidan.prototype = {}
DemonicIllidan.prototype.__index = __TS__Index(DemonicIllidan.prototype)
DemonicIllidan.prototype.__newindex = __TS__NewIndex(DemonicIllidan.prototype)
DemonicIllidan.prototype.constructor = DemonicIllidan
DemonicIllidan.____super = Tower
setmetatable(DemonicIllidan, DemonicIllidan.____super)
setmetatable(DemonicIllidan.prototype, DemonicIllidan.____super.prototype)
function DemonicIllidan.new(...)
    local self = setmetatable({}, DemonicIllidan.prototype)
    self:____constructor(...)
    return self
end
function DemonicIllidan.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if not self.game.gameDamageEngineGlobals.udg_IsDamageSpell then
        return
    end
    if u == self.tower and target then
        local tempUnit = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            GetUnitX(target),
            GetUnitY(target),
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            4,
            FourCC("BTLF"),
            tempUnit
        )
        UnitAddAbilityBJ(
            FourCC("A0BZ"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "soulburn", target)
    end
end
return ____exports
