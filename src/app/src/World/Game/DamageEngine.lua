--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local settings = require("app.src.World.GlobalSettings")
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
____exports.DamageEngine = {}
local DamageEngine = ____exports.DamageEngine
DamageEngine.name = "DamageEngine"
DamageEngine.__index = DamageEngine
DamageEngine.prototype = {}
DamageEngine.prototype.__index = DamageEngine.prototype
DamageEngine.prototype.constructor = DamageEngine
function DamageEngine.new(...)
    local self = setmetatable({}, DamageEngine.prototype)
    self:____constructor(...)
    return self
end
function DamageEngine.prototype.____constructor(self, damageEngineGlobals)
    self.initialDamageEvent = {}
    self.initialDamageEventTowers = Map.new()
    self.initialDamageModificationEventTowers = Map.new()
    self.initialDamageEventBuffs = {}
    self.initialDamageEventAbilities = {}
    self.initialDamageEventCreepAbilities = {}
    self.multiplicativeDamageModificationEventBuff = {}
    self.zeroDamageEvent = {}
    self.damageEventAOEActions = {}
    self.damageEventLethalActions = {}
    self.initialDamageModificationEvent = {}
    self.multiplicativeDamageModificationEvent = {}
    self.preFinalDamageModificationEvent = {}
    self.finalDamageModificationEvent = {}
    self.finalDamageModificationCreepAbilities = {}
    self.afterDamageEvent = {}
    self.started = false
    self.finished = false
    self.recursion = -1
    self.recursive = false
    self.purge = false
    self.preDamage = false
    self.holdClear = false
    self.ticker = CreateTimer()
    self.trig = Trigger.new()
    self.otrg = Trigger.new()
    self.previousAmount = 0
    self.previousValue = 0
    self.previousType = 0
    self.previousCode = false
    self.previousPierce = 0
    self.armorType = 0
    self.previousArmor = 0
    self.prevPreArmor = 0
    self.defenseType = 0
    self.previousDefense = 0
    self.prevPreDefense = 0
    self.lastSource = {}
    self.lastTarget = {}
    self.lastAmount = {}
    self.lastAttackT = {}
    self.lastDamageT = {}
    self.lastWeaponT = {}
    self.lastTrig = {}
    self.lastType = {}
    self.damageEngineGlobals = damageEngineGlobals
    self.otrg:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_DAMAGED)
    self.otrg:AddFilterFuncCondition(
        Filter(
            function() return self:OnDamage() end
        )
    )
    self.trig:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_DAMAGING)
    self.trig:AddFilterFuncCondition(
        Filter(
            function() return self:OnPreDamage() end
        )
    )
end
function DamageEngine.prototype.AddInitialDamageEvent(self, event)
    __TS__ArrayPush(self.initialDamageEvent, event)
end
function DamageEngine.prototype.AddInitialDamageEventTower(self, handleId, tower)
    self.initialDamageEventTowers:set(handleId, tower)
end
function DamageEngine.prototype.AddInitialDamageEventBuff(self, buff)
    __TS__ArrayPush(self.initialDamageEventBuffs, buff)
end
function DamageEngine.prototype.AddInitialDamageEventAbility(self, ability)
    __TS__ArrayPush(self.initialDamageEventAbilities, ability)
end
function DamageEngine.prototype.AddInitialDamageEventCreepAbility(self, ability)
    __TS__ArrayPush(self.initialDamageEventCreepAbilities, ability)
end
function DamageEngine.prototype.AddZeroDamageEvent(self, event)
    __TS__ArrayPush(self.zeroDamageEvent, event)
end
function DamageEngine.prototype.AddInitialDamageModificationEvent(self, event)
    __TS__ArrayPush(self.initialDamageModificationEvent, event)
end
function DamageEngine.prototype.AddInitialDamageModificationEventTower(self, handleId, tower)
    self.initialDamageModificationEventTowers:set(handleId, tower)
end
function DamageEngine.prototype.AddMultiplicativeDamageModificationEvent(self, event)
    __TS__ArrayPush(self.multiplicativeDamageModificationEvent, event)
end
function DamageEngine.prototype.AddMultiplicativeDamageModificationEventBuff(self, buff)
    __TS__ArrayPush(self.multiplicativeDamageModificationEventBuff, buff)
end
function DamageEngine.prototype.AddPreFinalDamageModificationEvent(self, event)
    __TS__ArrayPush(self.preFinalDamageModificationEvent, event)
end
function DamageEngine.prototype.AddLethalDamageEvent(self, event)
    __TS__ArrayPush(self.damageEventLethalActions, event)
end
function DamageEngine.prototype.AddAOEDamageEvent(self, event)
    __TS__ArrayPush(self.damageEventAOEActions, event)
end
function DamageEngine.prototype.AddFinalDamageModificationEvent(self, event)
    __TS__ArrayPush(self.finalDamageModificationEvent, event)
end
function DamageEngine.prototype.AddFinalDamageModificationCreepAbility(self, ObjectExtendsAbility)
    __TS__ArrayPush(self.finalDamageModificationCreepAbilities, ObjectExtendsAbility)
end
function DamageEngine.prototype.AddAfterDamageEvent(self, event)
    __TS__ArrayPush(self.afterDamageEvent, event)
end
function DamageEngine.prototype.InitialDamageEvent(self)
    if self.damageEngineGlobals.udg_DamageEventSource then
        local handleId = GetHandleId(self.damageEngineGlobals.udg_DamageEventSource)
        local damagingUnit = self.initialDamageEventTowers:get(handleId)
        if damagingUnit then
            damagingUnit:AttackAction()
        end
    end
    __TS__ArrayForEach(
        self.initialDamageEventBuffs,
        function(____, buff) return buff:AttackAction() end
    )
    __TS__ArrayForEach(
        self.initialDamageEventAbilities,
        function(____, ability) return ability:AttackAction() end
    )
    __TS__ArrayForEach(
        self.initialDamageEventCreepAbilities,
        function(____, ability) return ability:AttackAction() end
    )
end
function DamageEngine.prototype.ZeroDamageEvent(self)
    __TS__ArrayForEach(
        self.zeroDamageEvent,
        function(____, action) return action(nil) end
    )
end
function DamageEngine.prototype.DamageEventAOE(self)
    __TS__ArrayForEach(
        self.damageEventAOEActions,
        function(____, action) return action(nil) end
    )
end
function DamageEngine.prototype.DamageEventLethal(self)
    __TS__ArrayForEach(
        self.damageEventLethalActions,
        function(____, action) return action(nil) end
    )
end
function DamageEngine.prototype.InitialDamageModificationEvent(self)
    if self.damageEngineGlobals.udg_DamageEventSource then
        local handleId = GetHandleId(self.damageEngineGlobals.udg_DamageEventSource)
        local damagingUnit = self.initialDamageModificationEventTowers:get(handleId)
        if damagingUnit then
            damagingUnit:InitialDamageModification()
        end
    end
end
function DamageEngine.prototype.MultiplicativeDamageModificationEvent(self)
    __TS__ArrayForEach(
        self.multiplicativeDamageModificationEvent,
        function(____, action) return action(nil) end
    )
    __TS__ArrayForEach(
        self.multiplicativeDamageModificationEventBuff,
        function(____, buff) return buff:ModifyDamage() end
    )
end
function DamageEngine.prototype.PreFinalDamageModificationEvent(self)
    __TS__ArrayForEach(
        self.preFinalDamageModificationEvent,
        function(____, action) return action(nil) end
    )
end
function DamageEngine.prototype.FinalDamageModificationEvent(self)
    __TS__ArrayForEach(
        self.finalDamageModificationEvent,
        function(____, action) return action(nil) end
    )
    __TS__ArrayForEach(
        self.finalDamageModificationCreepAbilities,
        function(____, ability) return ability:ModifyFinalDamage() end
    )
end
function DamageEngine.prototype.AfterDamageEvent(self)
    __TS__ArrayForEach(
        self.afterDamageEvent,
        function(____, action) return action(nil) end
    )
end
function DamageEngine.prototype.Error(self)
    local s = "WARNING: Recursion error when dealing damage! "
    s = tostring(s) .. "Prior to dealing damage from within a DamageEvent response trigger, do this:\n"
    s = tostring(s) .. "Set DamageEventTrigger = (This Trigger)\n"
    s = tostring(s) .. "Unit - Cause <Source> to damage <Target>...\n\n"
    s = tostring(s) .. "Alternatively, just use the UNKNOWN damage type. It will skip recursive damage on its own without needing the \"Set\" line:/n"
    s = tostring(s) .. "Unit - Cause <Source> to damage <Target>, dealing <Amount> damage of attack type <Attack Type> and damage type Unknown"
    ClearTextMessages()
    Log.Fatal(s)
end
function DamageEngine.prototype.OnAOEEnd(self)
    if self.damageEngineGlobals.udg_DamageEventAOE > 1 then
        self:DamageEventAOE()
        self.damageEngineGlobals.udg_DamageEventAOE = 1
    end
    self.damageEngineGlobals.udg_DamageEventLevel = 1
    self.damageEngineGlobals.udg_EnhancedDamageTarget = nil
    self.damageEngineGlobals.udg_AOEDamageSource = nil
    GroupClear(self.damageEngineGlobals.udg_DamageEventAOEGroup)
end
function DamageEngine.prototype.Finish(self)
    local i = -1
    if self.finished then
        self.finished = false
        if self.damageEngineGlobals.udg_DamageEventPrevAmt ~= 0 and self.damageEngineGlobals.udg_DamageEventDamageT ~= settings.DAMAGE_TYPE_UNKNOWN then
            self.recursive = true
            self:AfterDamageEvent()
            self.recursive = false
        end
        if self.recursion > -1 and not self.holdClear and not self.purge then
            self.purge = true
            do
                while i >= self.recursion do
                    i = i + 1
                    self.damageEngineGlobals.udg_NextDamageType = self.lastType[i + 1]
                    if self.lastTrig[i + 1] ~= nil then
                        DisableTrigger(self.lastTrig[i + 1])
                    end
                    UnitDamageTarget(self.lastSource[i + 1], self.lastTarget[i + 1], self.lastAmount[i + 1], true, false, self.lastAttackT[i + 1], self.lastDamageT[i + 1], self.lastWeaponT[i + 1])
                    self:Finish()
                end
            end
            do
                while i <= -1 do
                    if self.lastTrig[i + 1] ~= nil then
                        EnableTrigger(self.lastTrig[i + 1])
                    end
                    i = i - 1
                end
            end
            self.recursion = -1
            self.purge = false
        end
    end
end
function DamageEngine.prototype.OnExpire(self)
    self.started = false
    self:Finish()
    self:OnAOEEnd()
end
function DamageEngine.prototype.CalibrateMR(self)
    self.damageEngineGlobals.udg_IsDamageMelee = false
    self.damageEngineGlobals.udg_IsDamageRanged = false
    self.damageEngineGlobals.udg_IsDamageSpell = self.damageEngineGlobals.udg_DamageEventAttackT == 0
    if self.damageEngineGlobals.udg_DamageEventDamageT == settings.DAMAGE_TYPE_NORMAL and not self.damageEngineGlobals.udg_IsDamageSpell then
        self.damageEngineGlobals.udg_IsDamageMelee = IsUnitType(self.damageEngineGlobals.udg_DamageEventSource, UNIT_TYPE_MELEE_ATTACKER)
        self.damageEngineGlobals.udg_IsDamageRanged = IsUnitType(self.damageEngineGlobals.udg_DamageEventSource, UNIT_TYPE_RANGED_ATTACKER)
        if self.damageEngineGlobals.udg_IsDamageMelee and self.damageEngineGlobals.udg_IsDamageRanged then
            self.damageEngineGlobals.udg_IsDamageMelee = self.damageEngineGlobals.udg_DamageEventWeaponT > 0
            self.damageEngineGlobals.udg_IsDamageRanged = not self.damageEngineGlobals.udg_IsDamageMelee
        end
    end
end
function DamageEngine.prototype.OnPreDamage(self)
    local src = GetEventDamageSource()
    local tgt = BlzGetEventDamageTarget()
    local amt = GetEventDamage()
    local at = BlzGetEventAttackType()
    local dt = BlzGetEventDamageType()
    local wt = BlzGetEventWeaponType()
    self:Finish()
    if self.damageEngineGlobals.udg_NextDamageType == 0 and (self.damageEngineGlobals.udg_DamageEventTrigger ~= nil or self.recursive) then
        self.damageEngineGlobals.udg_NextDamageType = self.damageEngineGlobals.udg_DamageTypeCode
    end
    if self.recursive then
        if amt ~= 0 then
            if self.recursion < 512 then
                self.recursion = self.recursion + 1
                self.lastAmount[self.recursion + 1] = amt
                self.lastSource[self.recursion + 1] = src
                self.lastTarget[self.recursion + 1] = tgt
                self.lastAttackT[self.recursion + 1] = at
                self.lastDamageT[self.recursion + 1] = dt
                self.lastWeaponT[self.recursion + 1] = wt
                self.lastTrig[self.recursion + 1] = self.damageEngineGlobals.udg_DamageEventTrigger
                self.lastType[self.recursion + 1] = self.damageEngineGlobals.udg_NextDamageType
            else
                self:Error()
            end
        end
        self.damageEngineGlobals.udg_NextDamageType = 0
        self.damageEngineGlobals.udg_DamageEventTrigger = nil
        BlzSetEventDamage(0)
    else
        if not self.purge then
            if self.started then
                if src ~= self.damageEngineGlobals.udg_AOEDamageSource then
                    self:OnAOEEnd()
                    self.damageEngineGlobals.udg_AOEDamageSource = src
                elseif tgt == self.damageEngineGlobals.udg_EnhancedDamageTarget then
                    self.damageEngineGlobals.udg_DamageEventLevel = self.damageEngineGlobals.udg_DamageEventLevel + 1
                elseif not IsUnitInGroup(tgt, self.damageEngineGlobals.udg_DamageEventAOEGroup) then
                    self.damageEngineGlobals.udg_DamageEventAOE = self.damageEngineGlobals.udg_DamageEventAOE + 1
                end
                if self.preDamage then
                    self.preDamage = false
                    self.previousAmount = self.damageEngineGlobals.udg_DamageEventAmount
                    self.previousValue = self.damageEngineGlobals.udg_DamageEventPrevAmt
                    self.previousType = self.damageEngineGlobals.udg_DamageEventType
                    self.previousCode = self.damageEngineGlobals.udg_IsDamageCode
                    self.previousArmor = self.armorType
                    self.previousDefense = self.damageEngineGlobals.udg_DamageEventDefenseT
                    self.prevPreDefense = self.defenseType
                    self.previousPierce = self.damageEngineGlobals.udg_DamageEventArmorPierced
                    self.holdClear = true
                end
            else
                TimerStart(
                    self.ticker,
                    0,
                    false,
                    function() return self:OnExpire() end
                )
                self.started = true
                self.damageEngineGlobals.udg_AOEDamageSource = src
                self.damageEngineGlobals.udg_EnhancedDamageTarget = tgt
            end
            GroupAddUnit(self.damageEngineGlobals.udg_DamageEventAOEGroup, tgt)
        end
        self.damageEngineGlobals.udg_DamageEventType = self.damageEngineGlobals.udg_NextDamageType
        if self.damageEngineGlobals.udg_NextDamageType ~= 0 then
            self.damageEngineGlobals.udg_DamageEventType = self.damageEngineGlobals.udg_NextDamageType
            self.damageEngineGlobals.udg_NextDamageType = 0
            self.damageEngineGlobals.udg_IsDamageCode = true
            self.damageEngineGlobals.udg_DamageEventTrigger = nil
        end
        self.damageEngineGlobals.udg_DamageEventOverride = dt == nil or amt == 0 or self.damageEngineGlobals.udg_DamageEventType * self.damageEngineGlobals.udg_DamageEventType == 4
        self.damageEngineGlobals.udg_DamageEventPrevAmt = amt
        self.damageEngineGlobals.udg_DamageEventSource = src
        self.damageEngineGlobals.udg_DamageEventTarget = tgt
        self.damageEngineGlobals.udg_DamageEventAmount = amt
        self.damageEngineGlobals.udg_DamageEventAttackT = GetHandleId(at)
        self.damageEngineGlobals.udg_DamageEventDamageT = GetHandleId(dt)
        self.damageEngineGlobals.udg_DamageEventWeaponT = GetHandleId(wt)
        self:CalibrateMR()
        self.damageEngineGlobals.udg_DamageEventArmorT = BlzGetUnitIntegerField(self.damageEngineGlobals.udg_DamageEventTarget, UNIT_IF_ARMOR_TYPE)
        self.damageEngineGlobals.udg_DamageEventDefenseT = BlzGetUnitIntegerField(self.damageEngineGlobals.udg_DamageEventTarget, UNIT_IF_DEFENSE_TYPE)
        self.armorType = self.damageEngineGlobals.udg_DamageEventArmorT
        self.defenseType = self.damageEngineGlobals.udg_DamageEventDefenseT
        self.damageEngineGlobals.udg_DamageEventArmorPierced = 0
        if not self.damageEngineGlobals.udg_DamageEventOverride then
            self.recursive = true
            self:InitialDamageModificationEvent()
            self.damageEngineGlobals.udg_DamageEventOverride = self.damageEngineGlobals.udg_DamageEventOverride or self.damageEngineGlobals.udg_DamageEventType * self.damageEngineGlobals.udg_DamageEventType == 4
            if not self.damageEngineGlobals.udg_DamageEventOverride then
                self:MultiplicativeDamageModificationEvent()
                self:PreFinalDamageModificationEvent()
            end
            self.recursive = false
            BlzSetEventAttackType(
                ConvertAttackType(self.damageEngineGlobals.udg_DamageEventAttackT)
            )
            BlzSetEventDamageType(
                ConvertDamageType(self.damageEngineGlobals.udg_DamageEventDamageT)
            )
            BlzSetEventWeaponType(
                ConvertWeaponType(self.damageEngineGlobals.udg_DamageEventWeaponT)
            )
            if self.damageEngineGlobals.udg_DamageEventArmorPierced ~= 0 then
                BlzSetUnitArmor(
                    self.damageEngineGlobals.udg_DamageEventTarget,
                    BlzGetUnitArmor(self.damageEngineGlobals.udg_DamageEventTarget) - self.damageEngineGlobals.udg_DamageEventArmorPierced
                )
            end
            if self.armorType ~= self.damageEngineGlobals.udg_DamageEventArmorT then
                BlzSetUnitIntegerField(self.damageEngineGlobals.udg_DamageEventTarget, UNIT_IF_ARMOR_TYPE, self.damageEngineGlobals.udg_DamageEventArmorT)
            end
            if self.defenseType ~= self.damageEngineGlobals.udg_DamageEventDefenseT then
                BlzSetUnitIntegerField(self.damageEngineGlobals.udg_DamageEventTarget, UNIT_IF_DEFENSE_TYPE, self.damageEngineGlobals.udg_DamageEventDefenseT)
            end
            BlzSetEventDamage(self.damageEngineGlobals.udg_DamageEventAmount)
        end
        self.preDamage = true
    end
    return false
end
function DamageEngine.prototype.OnDamage(self)
    if self.recursive then
        return false
    end
    if self.preDamage then
        self.preDamage = false
    else
        self:Finish()
        self.holdClear = false
        self.damageEngineGlobals.udg_DamageEventAmount = self.previousAmount
        self.damageEngineGlobals.udg_DamageEventPrevAmt = self.previousValue
        self.damageEngineGlobals.udg_DamageEventType = self.previousType
        self.damageEngineGlobals.udg_IsDamageCode = self.previousCode
        self.damageEngineGlobals.udg_DamageEventSource = GetEventDamageSource()
        self.damageEngineGlobals.udg_DamageEventTarget = BlzGetEventDamageTarget()
        self.damageEngineGlobals.udg_DamageEventAttackT = GetHandleId(
            BlzGetEventAttackType()
        )
        self.damageEngineGlobals.udg_DamageEventDamageT = GetHandleId(
            BlzGetEventDamageType()
        )
        self.damageEngineGlobals.udg_DamageEventWeaponT = GetHandleId(
            BlzGetEventWeaponType()
        )
        self.damageEngineGlobals.udg_DamageEventArmorT = self.previousArmor
        self.damageEngineGlobals.udg_DamageEventDefenseT = self.previousDefense
        self.damageEngineGlobals.udg_DamageEventArmorPierced = self.previousPierce
        self.armorType = self.prevPreArmor
        self.defenseType = self.prevPreDefense
        self:CalibrateMR()
    end
    if self.damageEngineGlobals.udg_DamageEventArmorPierced ~= 0 then
        BlzSetUnitArmor(
            self.damageEngineGlobals.udg_DamageEventTarget,
            BlzGetUnitArmor(self.damageEngineGlobals.udg_DamageEventTarget) + self.damageEngineGlobals.udg_DamageEventArmorPierced
        )
    end
    if self.armorType ~= self.damageEngineGlobals.udg_DamageEventArmorT then
        BlzSetUnitIntegerField(self.damageEngineGlobals.udg_DamageEventTarget, UNIT_IF_ARMOR_TYPE, self.armorType)
    end
    if self.defenseType ~= self.damageEngineGlobals.udg_DamageEventDefenseT then
        BlzSetUnitIntegerField(self.damageEngineGlobals.udg_DamageEventTarget, UNIT_IF_DEFENSE_TYPE, self.defenseType)
    end
    local r = GetEventDamage()
    self.recursive = true
    if self.damageEngineGlobals.udg_DamageEventPrevAmt == 0 then
        self:ZeroDamageEvent()
    else
        if self.damageEngineGlobals.udg_DamageEventAmount ~= 0 and r ~= 0 then
            self.damageEngineGlobals.udg_DamageScalingWC3 = r / self.damageEngineGlobals.udg_DamageEventAmount
        elseif self.damageEngineGlobals.udg_DamageEventAmount > 0 then
            self.damageEngineGlobals.udg_DamageScalingWC3 = 0
        else
            self.damageEngineGlobals.udg_DamageScalingWC3 = 1
        end
        r = self.damageEngineGlobals.udg_DamageEventAmount
        self.damageEngineGlobals.udg_DamageScalingUser = r / self.damageEngineGlobals.udg_DamageEventPrevAmt
        self.damageEngineGlobals.udg_DamageEventAmount = r * self.damageEngineGlobals.udg_DamageScalingWC3
        if self.damageEngineGlobals.udg_DamageEventAmount > 0 then
            self:FinalDamageModificationEvent()
            self.damageEngineGlobals.udg_LethalDamageHP = GetWidgetLife(self.damageEngineGlobals.udg_DamageEventTarget) - self.damageEngineGlobals.udg_DamageEventAmount
            if self.damageEngineGlobals.udg_LethalDamageHP <= 0.405 then
                self:DamageEventLethal()
                self.damageEngineGlobals.udg_DamageEventAmount = GetWidgetLife(self.damageEngineGlobals.udg_DamageEventTarget) - self.damageEngineGlobals.udg_LethalDamageHP
                if self.damageEngineGlobals.udg_DamageEventType < 0 and self.damageEngineGlobals.udg_LethalDamageHP <= 0.405 then
                    SetUnitExploded(self.damageEngineGlobals.udg_DamageEventTarget, true)
                end
            end
            self.damageEngineGlobals.udg_DamageScalingUser = self.damageEngineGlobals.udg_DamageEventAmount / (self.damageEngineGlobals.udg_DamageEventPrevAmt * self.damageEngineGlobals.udg_DamageScalingWC3)
        end
        BlzSetEventDamage(self.damageEngineGlobals.udg_DamageEventAmount)
        if self.damageEngineGlobals.udg_DamageEventDamageT ~= settings.DAMAGE_TYPE_UNKNOWN then
            self:InitialDamageEvent()
        end
    end
    self.recursive = false
    self.finished = true
    if self.damageEngineGlobals.udg_DamageEventAmount <= 0 then
        self:Finish()
    end
    return false
end
return ____exports
