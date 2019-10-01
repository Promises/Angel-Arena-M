--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
local CreepAbility = ____CreepAbility.CreepAbility
____exports.DivineShield = {}
local DivineShield = ____exports.DivineShield
DivineShield.name = "DivineShield"
DivineShield.__index = DivineShield
DivineShield.prototype = {}
DivineShield.prototype.__index = __TS__Index(DivineShield.prototype)
DivineShield.prototype.__newindex = __TS__NewIndex(DivineShield.prototype)
DivineShield.prototype.constructor = DivineShield
DivineShield.____super = CreepAbility
setmetatable(DivineShield, DivineShield.____super)
setmetatable(DivineShield.prototype, DivineShield.____super.prototype)
function DivineShield.new(...)
    local self = setmetatable({}, DivineShield.prototype)
    self:____constructor(...)
    return self
end
function DivineShield.prototype.____constructor(self, abilityUnit)
    CreepAbility.prototype.____constructor(self, "A01E", abilityUnit)
end
function DivineShield.prototype.ModifyFinalDamage(self)
    if not self.game then
        return
    end
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if target then
        if GetUnitAbilityLevel(
            target,
            self:GetID()
        ) > 0 then
            local lvl = GetUnitAbilityLevel(
                target,
                self:GetID()
            )
            self.game.gameDamageEngineGlobals.udg_DamageEventAmount = 0
            if lvl <= 1 then
                UnitRemoveAbility(
                    target,
                    self:GetID()
                )
            else
                SetUnitAbilityLevel(
                    target,
                    self:GetID(),
                    lvl - 1
                )
            end
        end
    end
end
return ____exports
