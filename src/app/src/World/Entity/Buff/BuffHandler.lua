--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____CrushedDamageBuff = require("app.src.World.Entity.Buff.CrushedDamageBuff")
local CrushedDamageBuff = ____CrushedDamageBuff.CrushedDamageBuff
local ____DrunkenHaze = require("app.src.World.Entity.Buff.DrunkenHaze")
local DrunkenHaze = ____DrunkenHaze.DrunkenHaze
local ____ForceOfNature = require("app.src.World.Entity.Buff.ForceOfNature")
local ForceOfNature = ____ForceOfNature.ForceOfNature
local ____IceTrollJoker = require("app.src.World.Entity.Buff.IceTrollJoker")
local IceTrollJoker = ____IceTrollJoker.IceTrollJoker
local ____Moonstorm = require("app.src.World.Entity.Buff.Moonstorm")
local Moonstorm = ____Moonstorm.Moonstorm
local ____BattleRoar = require("app.src.World.Entity.Buff.BattleRoar")
local BattleRoar = ____BattleRoar.BattleRoar
local ____CitadelOfNaxxramas = require("app.src.World.Entity.Buff.CitadelOfNaxxramas")
local SoulCollector = ____CitadelOfNaxxramas.SoulCollector
____exports.BuffHandler = {}
local BuffHandler = ____exports.BuffHandler
BuffHandler.name = "BuffHandler"
BuffHandler.__index = BuffHandler
BuffHandler.prototype = {}
BuffHandler.prototype.__index = BuffHandler.prototype
BuffHandler.prototype.constructor = BuffHandler
function BuffHandler.new(...)
    local self = setmetatable({}, BuffHandler.prototype)
    self:____constructor(...)
    return self
end
function BuffHandler.prototype.____constructor(self, game)
    self.buffs = {}
    self.activeBuffs = {}
    self.game = game
    self:AddBuffsToList()
    self:SetupBuffs()
end
function BuffHandler.prototype.AddBuffsToList(self)
    __TS__ArrayPush(self.buffs, CrushedDamageBuff)
    __TS__ArrayPush(self.buffs, DrunkenHaze)
    __TS__ArrayPush(self.buffs, ForceOfNature)
    __TS__ArrayPush(self.buffs, IceTrollJoker)
    __TS__ArrayPush(self.buffs, Moonstorm)
    __TS__ArrayPush(self.buffs, BattleRoar)
    __TS__ArrayPush(self.buffs, SoulCollector)
end
function BuffHandler.prototype.SetupBuffs(self)
    for ____, buff in ipairs(self.buffs) do
        local ObjectExtendsBuff = buff.new(self.game)
        if ObjectExtendsBuff:IsDamageModificationBuff() then
            self.game.gameDamageEngine:AddMultiplicativeDamageModificationEventBuff(ObjectExtendsBuff)
        end
        if ObjectExtendsBuff:IsAttackActionBuff() then
            self.game.gameDamageEngine:AddInitialDamageEventBuff(ObjectExtendsBuff)
        end
        __TS__ArrayPush(self.activeBuffs, ObjectExtendsBuff)
    end
end
return ____exports
