--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____FrostAttack = require("app.src.World.Entity.GenericAbilities.FrostAttack")
local FrostAttack = ____FrostAttack.FrostAttack
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local ____Move = require("app.src.World.Entity.GenericAbilities.Move")
local Move = ____Move.Move
local ____FelineSwiftness = require("app.src.World.Entity.GenericAbilities.NightElfAncientProtector.FelineSwiftness")
local FelineSwiftness = ____FelineSwiftness.FelineSwiftness
local ____NaturesNourishment = require("app.src.World.Entity.GenericAbilities.NightElfAncientProtector.NaturesNourishment")
local NaturesNourishment = ____NaturesNourishment.NaturesNourishment
local ____WolvenFury = require("app.src.World.Entity.GenericAbilities.NightElfAncientProtector.WolvenFury")
local WolvenFury = ____WolvenFury.WolvenFury
local ____UnchargedRuneMorph = require("app.src.World.Entity.GenericAbilities.Elementalist.UnchargedRuneMorph")
local UnchargedRuneMorph = ____UnchargedRuneMorph.UnchargedRuneMorph
local ____ElementalistSettings = require("app.src.World.Entity.GenericAbilities.Elementalist.ElementalistSettings")
local ElementalistSettings = ____ElementalistSettings.ElementalistSettings
local ____SiphonEnergy = require("app.src.World.Entity.GenericAbilities.Elementalist.SiphonEnergy")
local SiphonEnergy = ____SiphonEnergy.SiphonEnergy
local ____Enchantment = require("app.src.World.Entity.GenericAbilities.AllianceOfBlades.Enchantment")
local Enchantment = ____Enchantment.Enchantment
local ____Transfuse = require("app.src.World.Entity.GenericAbilities.AllianceOfBlades.Transfuse")
local Transfuse = ____Transfuse.Transfuse
local ____Infuse = require("app.src.World.Entity.GenericAbilities.AllianceOfBlades.Infuse")
local Infuse = ____Infuse.Infuse
local ____Sacrifice = require("app.src.World.Entity.GenericAbilities.AllianceOfBlades.Sacrifice")
local Sacrifice = ____Sacrifice.Sacrifice
local ____AlchemicalTransmutation = require("app.src.World.Entity.GenericAbilities.AllianceOfBlades.AlchemicalTransmutation")
local AlchemicalTransmutation = ____AlchemicalTransmutation.AlchemicalTransmutation
local ____ChannelItem = require("app.src.World.Entity.GenericAbilities.AllianceOfBlades.ChannelItem")
local ChannelItem = ____ChannelItem.ChannelItem
local ____Trade = require("app.src.World.Entity.GenericAbilities.AllianceOfBlades.Trade")
local Trade = ____Trade.Trade
local ____AwakenDormantPheonixEgg = require("app.src.World.Entity.GenericAbilities.Elementalist.AwakenDormantPheonixEgg")
local AwakenDormantPheonixEgg = ____AwakenDormantPheonixEgg.AwakenDormantPheonixEgg
local ____PayTheToll = require("app.src.World.Entity.GenericAbilities.Void.PayTheToll")
local PayTheToll = ____PayTheToll.PayTheToll
local ____VoidLordAbility = require("app.src.World.Entity.GenericAbilities.Void.VoidLordAbility")
local VoidLordAbility = ____VoidLordAbility.VoidLordAbility
local ____PurchaseVoidBeast = require("app.src.World.Entity.GenericAbilities.Void.PurchaseVoidBeast")
local PurchaseVoidBeast = ____PurchaseVoidBeast.PurchaseVoidBeast
local ____PurchaseVoidBeing = require("app.src.World.Entity.GenericAbilities.Void.PurchaseVoidBeing")
local PurchaseVoidBeing = ____PurchaseVoidBeing.PurchaseVoidBeing
local ____PurchaseVoidLord = require("app.src.World.Entity.GenericAbilities.Void.PurchaseVoidLord")
local PurchaseVoidLord = ____PurchaseVoidLord.PurchaseVoidLord
local ____PurchaseVoidMonstrosity = require("app.src.World.Entity.GenericAbilities.Void.PurchaseVoidMonstrosity")
local PurchaseVoidMonstrosity = ____PurchaseVoidMonstrosity.PurchaseVoidMonstrosity
local ____DrinkWaterRune = require("app.src.World.Entity.GenericAbilities.Elementalist.DrinkWaterRune")
local DrinkWaterRune = ____DrinkWaterRune.DrinkWaterRune
local ____UndeadUpgrade = require("app.src.World.Entity.GenericAbilities.Elementalist.UndeadUpgrade")
local UndeadUpgrade = ____UndeadUpgrade.UndeadUpgrade
local ____PurchaseVoidMinion = require("app.src.World.Entity.GenericAbilities.Void.PurchaseVoidMinion")
local PurchaseVoidMinion = ____PurchaseVoidMinion.PurchaseVoidMinion
local ____StalaggFeugen = require("app.src.World.Entity.GenericAbilities.Naxxramas.StalaggFeugen")
local ConstructThaddius = ____StalaggFeugen.ConstructThaddius
____exports.GenericAbilityHandler = {}
local GenericAbilityHandler = ____exports.GenericAbilityHandler
GenericAbilityHandler.name = "GenericAbilityHandler"
GenericAbilityHandler.__index = GenericAbilityHandler
GenericAbilityHandler.prototype = {}
GenericAbilityHandler.prototype.__index = GenericAbilityHandler.prototype
GenericAbilityHandler.prototype.constructor = GenericAbilityHandler
function GenericAbilityHandler.new(...)
    local self = setmetatable({}, GenericAbilityHandler.prototype)
    self:____constructor(...)
    return self
end
function GenericAbilityHandler.prototype.____constructor(self, game)
    self.abilities = {}
    self.activeAbilities = {}
    self.elementalistSettings = ElementalistSettings.new()
    self.targetUnitOnEffectAbilities = {}
    self.targetUnitOnCastAbilities = {}
    self.game = game
    self:AddAbilitiesToList()
    self:SetupAbilities()
    self.targetUnitOnEffectAbilitiesTrigger = Trigger.new()
    self.targetUnitOnEffectAbilitiesTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_EFFECT)
    self.targetUnitOnEffectAbilitiesTrigger:AddAction(
        function() return self:DoTargetUnitOnEffectAbilities() end
    )
    self.targetUnitOnCastAbilitiesTrigger = Trigger.new()
    self.targetUnitOnCastAbilitiesTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_CAST)
    self.targetUnitOnCastAbilitiesTrigger:AddAction(
        function() return self:DoTargetUnitOnCastAbilities() end
    )
end
function GenericAbilityHandler.prototype.AddAbilitiesToList(self)
    __TS__ArrayPush(self.abilities, FrostAttack)
    __TS__ArrayPush(self.abilities, Move)
    __TS__ArrayPush(self.abilities, FelineSwiftness)
    __TS__ArrayPush(self.abilities, NaturesNourishment)
    __TS__ArrayPush(self.abilities, WolvenFury)
    __TS__ArrayPush(self.abilities, UnchargedRuneMorph)
    __TS__ArrayPush(self.abilities, SiphonEnergy)
    __TS__ArrayPush(self.abilities, DrinkWaterRune)
    __TS__ArrayPush(self.abilities, Enchantment)
    __TS__ArrayPush(self.abilities, Transfuse)
    __TS__ArrayPush(self.abilities, Infuse)
    __TS__ArrayPush(self.abilities, Sacrifice)
    __TS__ArrayPush(self.abilities, AlchemicalTransmutation)
    __TS__ArrayPush(self.abilities, ChannelItem)
    __TS__ArrayPush(self.abilities, Trade)
    __TS__ArrayPush(self.abilities, AwakenDormantPheonixEgg)
    __TS__ArrayPush(self.abilities, UndeadUpgrade)
    __TS__ArrayPush(self.abilities, PayTheToll)
    __TS__ArrayPush(self.abilities, VoidLordAbility)
    __TS__ArrayPush(self.abilities, PurchaseVoidBeing)
    __TS__ArrayPush(self.abilities, PurchaseVoidBeast)
    __TS__ArrayPush(self.abilities, PurchaseVoidMonstrosity)
    __TS__ArrayPush(self.abilities, PurchaseVoidLord)
    __TS__ArrayPush(self.abilities, PurchaseVoidMinion)
    __TS__ArrayPush(self.abilities, ConstructThaddius)
end
function GenericAbilityHandler.prototype.DoTargetUnitOnEffectAbilities(self)
    for ____, tower in ipairs(self.targetUnitOnEffectAbilities) do
        if tower:Condition() then
            tower:TargetOnEffectAction()
        end
    end
end
function GenericAbilityHandler.prototype.DoTargetUnitOnCastAbilities(self)
    for ____, tower in ipairs(self.targetUnitOnCastAbilities) do
        if tower:Condition() then
            tower:TargetOnCastAction()
        end
    end
end
function GenericAbilityHandler.prototype.SetupAbilities(self)
    for ____, ability in ipairs(self.abilities) do
        local ObjectExtendsAbility = ability.new(self.game)
        if ObjectExtendsAbility:IsAttackActionAbility() then
            self.game.gameDamageEngine:AddInitialDamageEventAbility(ObjectExtendsAbility)
        end
        if ObjectExtendsAbility:IsAbilityOnEffectTargetsUnit() then
            __TS__ArrayPush(self.targetUnitOnEffectAbilities, ObjectExtendsAbility)
        end
        if ObjectExtendsAbility:IsAbilityOnCastTargetsUnit() then
            __TS__ArrayPush(self.targetUnitOnCastAbilities, ObjectExtendsAbility)
        end
        __TS__ArrayPush(self.activeAbilities, ObjectExtendsAbility)
    end
end
return ____exports
