--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____DivineShield = require("app.src.World.Entity.CreepAbilities.DivineShield")
local DivineShield = ____DivineShield.DivineShield
local ____CrippleAura = require("app.src.World.Entity.CreepAbilities.CrippleAura")
local CrippleAura = ____CrippleAura.CrippleAura
local ____VampiricAura = require("app.src.World.Entity.CreepAbilities.VampiricAura")
local VampiricAura = ____VampiricAura.VampiricAura
local ____WalkItOff = require("app.src.World.Entity.CreepAbilities.WalkItOff")
local WalkItOff = ____WalkItOff.WalkItOff
local ____HardnedSkin = require("app.src.World.Entity.CreepAbilities.HardnedSkin")
local HardnedSkin = ____HardnedSkin.HardnedSkin
local ____Evasion = require("app.src.World.Entity.CreepAbilities.Evasion")
local Evasion = ____Evasion.Evasion
local ____ArmorBonus = require("app.src.World.Entity.CreepAbilities.ArmorBonus")
local ArmorBonus = ____ArmorBonus.ArmorBonus
local ____SpellShield = require("app.src.World.Entity.CreepAbilities.SpellShield")
local SpellShield = ____SpellShield.SpellShield
local ____TornadoAura = require("app.src.World.Entity.CreepAbilities.TornadoAura")
local TornadoAura = ____TornadoAura.TornadoAura
local ____MorningPerson = require("app.src.World.Entity.CreepAbilities.MorningPerson")
local MorningPerson = ____MorningPerson.MorningPerson
____exports.CreepAbilityHandler = {}
local CreepAbilityHandler = ____exports.CreepAbilityHandler
CreepAbilityHandler.name = "CreepAbilityHandler"
CreepAbilityHandler.__index = CreepAbilityHandler
CreepAbilityHandler.prototype = {}
CreepAbilityHandler.prototype.__index = CreepAbilityHandler.prototype
CreepAbilityHandler.prototype.constructor = CreepAbilityHandler
function CreepAbilityHandler.new(...)
    local self = setmetatable({}, CreepAbilityHandler.prototype)
    self:____constructor(...)
    return self
end
function CreepAbilityHandler.prototype.____constructor(self, abilityUnit)
    self.abilities = {}
    self.activeAbilities = {}
    self:AddAbilitiesToList()
    self:PreSetupAbilities(abilityUnit)
end
function CreepAbilityHandler.prototype.AddAbilitiesToList(self)
    __TS__ArrayPush(self.abilities, HardnedSkin)
    __TS__ArrayPush(self.abilities, Evasion)
    __TS__ArrayPush(self.abilities, ArmorBonus)
    __TS__ArrayPush(self.abilities, CrippleAura)
    __TS__ArrayPush(self.abilities, SpellShield)
    __TS__ArrayPush(self.abilities, TornadoAura)
    __TS__ArrayPush(self.abilities, VampiricAura)
    __TS__ArrayPush(self.abilities, DivineShield)
    __TS__ArrayPush(self.abilities, WalkItOff)
    __TS__ArrayPush(self.abilities, MorningPerson)
end
function CreepAbilityHandler.prototype.PreSetupAbilities(self, abilityUnit)
    for ____, ability in ipairs(self.abilities) do
        local ObjectExtendsAbility = ability.new(abilityUnit)
        __TS__ArrayPush(self.activeAbilities, ObjectExtendsAbility)
    end
end
function CreepAbilityHandler.prototype.SetupGame(self, game)
    self.game = game
    self:SetupAbilities()
end
function CreepAbilityHandler.prototype.SetupAbilities(self)
    if not self.game then
        return
    end
    for ____, ability in ipairs(self.activeAbilities) do
        ability:SetupGame(self.game)
        if ability:IsFinalDamageModificationCreepAbility() then
            self.game.gameDamageEngine:AddFinalDamageModificationCreepAbility(ability)
        end
        if ability:IsAttackActionCreepAbility() then
            self.game.gameDamageEngine:AddInitialDamageEventCreepAbility(ability)
        end
    end
end
function CreepAbilityHandler.prototype.GetAbilitiesForWave(self, wave)
    if not self.game then
        return self.activeAbilities
    end
    local currentDiff = self.game.diffVote.difficulty
    if currentDiff == 100 then
        return {}
    end
    currentDiff = currentDiff - 100
    local allAbilities = __TS__ArraySlice(self.activeAbilities, 0, #self.activeAbilities - 1)
    if wave:getCreepType() == CREEP_TYPE.BOSS then
        return allAbilities
    end
    self:ShuffleArray(allAbilities)
    local picks = math.floor(currentDiff / 100)
    local rest = currentDiff % 100
    if Util:RandomInt(1, 100) <= rest then
        picks = picks + 1
    end
    if picks == 0 then
        return {}
    end
    return __TS__ArraySlice(
        allAbilities,
        0,
        IMinBJ(picks - 1, #allAbilities - 1)
    )
end
function CreepAbilityHandler.prototype.ShuffleArray(self, arr)
    do
        local i = #arr - 1
        while i > 0 do
            local j = math.floor(
                math.random() * (i + 1)
            )
            local temp = arr[i + 1]
            arr[i + 1] = arr[j + 1]
            arr[j + 1] = temp
            i = i - 1
        end
    end
end
return ____exports
