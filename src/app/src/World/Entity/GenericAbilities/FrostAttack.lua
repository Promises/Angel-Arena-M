--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.FrostAttack = {}
local FrostAttack = ____exports.FrostAttack
FrostAttack.name = "FrostAttack"
FrostAttack.__index = FrostAttack
FrostAttack.prototype = {}
FrostAttack.prototype.__index = __TS__Index(FrostAttack.prototype)
FrostAttack.prototype.__newindex = __TS__NewIndex(FrostAttack.prototype)
FrostAttack.prototype.constructor = FrostAttack
FrostAttack.____super = GenericAbility
setmetatable(FrostAttack, FrostAttack.____super)
setmetatable(FrostAttack.prototype, FrostAttack.____super.prototype)
function FrostAttack.new(...)
    local self = setmetatable({}, FrostAttack.prototype)
    self:____constructor(...)
    return self
end
function FrostAttack.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A08X", game)
end
function FrostAttack.prototype.AttackAction(self)
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    local source = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if target and source then
        if not (GetUnitAbilityLevelSwapped(
            FourCC("A08X"),
            source
        ) > 0) then
            return
        end
        if UnitHasBuffBJ(
            target,
            FourCC("B017")
        ) then
            return
        end
        local dummy = CreateUnit(
            GetOwningPlayer(source),
            FourCC("u008"),
            GetUnitX(target),
            GetUnitY(target),
            bj_UNIT_FACING
        )
        UnitAddAbilityBJ(
            FourCC("A02U"),
            dummy
        )
        IssueTargetOrderBJ(dummy, "slow", target)
        UnitApplyTimedLifeBJ(
            1,
            FourCC("BTLF"),
            dummy
        )
    end
end
return ____exports
