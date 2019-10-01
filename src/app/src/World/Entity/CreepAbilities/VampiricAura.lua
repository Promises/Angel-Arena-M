--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
local CreepAbility = ____CreepAbility.CreepAbility
____exports.VampiricAura = {}
local VampiricAura = ____exports.VampiricAura
VampiricAura.name = "VampiricAura"
VampiricAura.__index = VampiricAura
VampiricAura.prototype = {}
VampiricAura.prototype.__index = __TS__Index(VampiricAura.prototype)
VampiricAura.prototype.__newindex = __TS__NewIndex(VampiricAura.prototype)
VampiricAura.prototype.constructor = VampiricAura
VampiricAura.____super = CreepAbility
setmetatable(VampiricAura, VampiricAura.____super)
setmetatable(VampiricAura.prototype, VampiricAura.____super.prototype)
function VampiricAura.new(...)
    local self = setmetatable({}, VampiricAura.prototype)
    self:____constructor(...)
    return self
end
function VampiricAura.prototype.____constructor(self, abilityUnit)
    CreepAbility.prototype.____constructor(self, "A0B3", abilityUnit)
end
function VampiricAura.prototype.AttackAction(self)
    if not self.game or not self.game.worldMap.gameRoundHandler then
        return
    end
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if target then
        if not (GetUnitAbilityLevel(
            target,
            self:GetID()
        ) > 0) then
            return
        end
        if Util:RandomInt(1, 100) > 10 then
            return
        end
        local effectModel = "Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl"
        DestroyEffectBJ(
            AddSpecialEffect(
                effectModel,
                GetUnitX(target),
                GetUnitY(target)
            )
        )
        SetUnitLifeBJ(
            target,
            GetUnitStateSwap(UNIT_STATE_LIFE, target) + 4 * (self.game.worldMap.gameRoundHandler.currentWave + 1)
        )
    end
end
return ____exports
