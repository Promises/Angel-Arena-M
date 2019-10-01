--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.DamageEngineGlobals = {}
local DamageEngineGlobals = ____exports.DamageEngineGlobals
DamageEngineGlobals.name = "DamageEngineGlobals"
DamageEngineGlobals.__index = DamageEngineGlobals
DamageEngineGlobals.prototype = {}
DamageEngineGlobals.prototype.__index = DamageEngineGlobals.prototype
DamageEngineGlobals.prototype.constructor = DamageEngineGlobals
function DamageEngineGlobals.new(...)
    local self = setmetatable({}, DamageEngineGlobals.prototype)
    self:____constructor(...)
    return self
end
function DamageEngineGlobals.prototype.____constructor(self)
    self.udg_DamageEventTrigger = nil
    self.udg_DamageEventOverride = false
    self.udg_NextDamageType = 0
    self.udg_DamageEventType = 0
    self.udg_DamageTypeCode = 0
    self.udg_IsDamageCode = false
    self.udg_IsDamageSpell = false
    self.udg_IsDamageMelee = false
    self.udg_IsDamageRanged = false
    self.udg_DamageEventSource = nil
    self.udg_DamageEventTarget = nil
    self.udg_DamageEventAOE = 0
    self.udg_DamageEventAOEGroup = nil
    self.udg_AOEDamageSource = nil
    self.udg_DamageEventLevel = 0
    self.udg_EnhancedDamageTarget = nil
    self.udg_DamageEventAmount = 0
    self.udg_DamageEventPrevAmt = 0
    self.udg_LethalDamageHP = 0
    self.udg_DamageEventArmorPierced = 0
    self.udg_DamageScalingWC3 = 0
    self.udg_DamageScalingUser = 0
    self.udg_DamageEventAttackT = 0
    self.udg_DamageEventDamageT = 0
    self.udg_DamageEventWeaponT = 0
    self.udg_DamageEventArmorT = 0
    self.udg_DamageEventDefenseT = 0
end
return ____exports
