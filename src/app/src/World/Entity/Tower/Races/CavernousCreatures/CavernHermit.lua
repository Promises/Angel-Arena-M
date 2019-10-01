--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.CavernHermit = {}
local CavernHermit = ____exports.CavernHermit
CavernHermit.name = "CavernHermit"
CavernHermit.__index = CavernHermit
CavernHermit.prototype = {}
CavernHermit.prototype.__index = __TS__Index(CavernHermit.prototype)
CavernHermit.prototype.__newindex = __TS__NewIndex(CavernHermit.prototype)
CavernHermit.prototype.constructor = CavernHermit
CavernHermit.____super = Tower
setmetatable(CavernHermit, CavernHermit.____super)
setmetatable(CavernHermit.prototype, CavernHermit.____super.prototype)
function CavernHermit.new(...)
    local self = setmetatable({}, CavernHermit.prototype)
    self:____constructor(...)
    return self
end
function CavernHermit.prototype.AttackAction(self)
    if not self.game.gameDamageEngineGlobals.udg_IsDamageSpell then
        return
    end
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if u == self.tower and target then
        if Util:RandomInt(1, 3) ~= 1 then
            return
        end
        local tempUnit = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            GetUnitX(u),
            GetUnitY(u),
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            3,
            FourCC("BTLF"),
            tempUnit
        )
        UnitAddAbilityBJ(
            FourCC("A0CC"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "lightningshield", target)
    end
end
function CavernHermit.prototype.GenericAttack(self)
    self:CastSpellOnAttackedUnitLocation("carrionswarm")
end
return ____exports
