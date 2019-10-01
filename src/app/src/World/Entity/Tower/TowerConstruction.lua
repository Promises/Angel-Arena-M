--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local settings = require("app.src.World.GlobalSettings")
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
local ____LootBoxerHandler = require("app.src.World.Entity.Tower.Races.LootBoxer.LootBoxerHandler")
local LootBoxerHandler = ____LootBoxerHandler.LootBoxerHandler
local ____RaceInitialiser = require("app.src.World.Entity.Tower.Races.RaceInitialiser")
local InitialiseAllRaceTowers = ____RaceInitialiser.InitialiseAllRaceTowers
____exports.TowerConstruction = {}
local TowerConstruction = ____exports.TowerConstruction
TowerConstruction.name = "TowerConstruction"
TowerConstruction.__index = TowerConstruction
TowerConstruction.prototype = {}
TowerConstruction.prototype.____getters = {}
TowerConstruction.prototype.__index = __TS__Index(TowerConstruction.prototype)
TowerConstruction.prototype.constructor = TowerConstruction
function TowerConstruction.new(...)
    local self = setmetatable({}, TowerConstruction.prototype)
    self:____constructor(...)
    return self
end
function TowerConstruction.prototype.____constructor(self, game)
    self.races = {}
    self.genericAttacks = Map.new()
    self.killingActions = Map.new()
    self.lootBoxerTowers = {
        FourCC("u044"),
        FourCC("u045"),
        FourCC("u047"),
        FourCC("u046"),
        FourCC("u048"),
        FourCC("u049"),
        FourCC("u04A"),
        FourCC("u04B"),
        FourCC("u04C")
    }
    self.game = game
    self._towerTypes = InitialiseAllRaceTowers(nil)
    self.lootBoxerHander = LootBoxerHandler.new(self, game)
    self.towerConstructTrigger = Trigger.new()
    self.towerConstructTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
    self.towerConstructTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    self.towerConstructTrigger:AddAction(
        function() return self:ConstructionFinished() end
    )
    self.towerUpgradeTrigger = Trigger.new()
    self.towerUpgradeTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    self.towerUpgradeTrigger:AddAction(
        function() return self:UpgradeTower() end
    )
    self.genericAttackTrigger = Trigger.new()
    self.genericAttackTrigger:RegisterPlayerUnitEventSimple(
        Player(COLOUR.NAVY),
        EVENT_PLAYER_UNIT_ATTACKED
    )
    self.genericAttackTrigger:RegisterPlayerUnitEventSimple(
        Player(COLOUR.TURQUOISE),
        EVENT_PLAYER_UNIT_ATTACKED
    )
    self.genericAttackTrigger:RegisterPlayerUnitEventSimple(
        Player(COLOUR.VOILET),
        EVENT_PLAYER_UNIT_ATTACKED
    )
    self.genericAttackTrigger:RegisterPlayerUnitEventSimple(
        Player(COLOUR.WHEAT),
        EVENT_PLAYER_UNIT_ATTACKED
    )
    self.genericAttackTrigger:AddAction(
        function() return self:DoGenericTowerAttacks() end
    )
    self.killingActionsTrigger = Trigger.new()
    self.killingActionsTrigger:RegisterPlayerUnitEventSimple(
        Player(COLOUR.NAVY),
        EVENT_PLAYER_UNIT_DEATH
    )
    self.killingActionsTrigger:RegisterPlayerUnitEventSimple(
        Player(COLOUR.TURQUOISE),
        EVENT_PLAYER_UNIT_DEATH
    )
    self.killingActionsTrigger:RegisterPlayerUnitEventSimple(
        Player(COLOUR.VOILET),
        EVENT_PLAYER_UNIT_DEATH
    )
    self.killingActionsTrigger:RegisterPlayerUnitEventSimple(
        Player(COLOUR.WHEAT),
        EVENT_PLAYER_UNIT_DEATH
    )
    self.killingActionsTrigger:AddAction(
        function() return self:DoKillingTowerActions() end
    )
end
function TowerConstruction.prototype.____getters.towerTypes(self)
    return self._towerTypes
end
function TowerConstruction.prototype.UpgradeTower(self)
    local tower = GetTriggerUnit()
    local owner = self.game.players:get(
        GetPlayerId(
            GetOwningPlayer(tower)
        )
    )
    if not owner then
        return
    end
    local instance = owner:GetTower(
        GetHandleIdBJ(tower)
    )
    if instance then
        instance:Sell()
        local newTower = self.game.worldMap.towerConstruction:SetupTower(tower, owner)
        newTower.towerValue = newTower.towerValue + instance.towerValue
    end
end
function TowerConstruction.prototype.ConstructionFinished(self)
    local tower = GetTriggerUnit()
    local owner = self.game.players:get(
        GetPlayerId(
            GetOwningPlayer(tower)
        )
    )
    UnitRemoveAbilityBJ(
        FourCC("ARal"),
        tower
    )
    if not owner then
        return
    end
    self:SetupTower(tower, owner)
end
function TowerConstruction.prototype.SetupTower(self, tower, owner)
    local ObjectExtendsTower
    if self:isLootBoxer(tower) then
        tower = self.lootBoxerHander:handleLootBoxTower(
            tower,
            owner,
            __TS__ArrayIndexOf(
                self.lootBoxerTowers,
                GetUnitTypeId(tower)
            )
        )
        UnitRemoveAbilityBJ(
            FourCC("ARal"),
            tower
        )
    end
    local obj = self._towerTypes:get(
        GetUnitTypeId(tower)
    )
    if obj then
        ObjectExtendsTower = obj.new(tower, owner, self.game)
    else
        ObjectExtendsTower = Tower.new(tower, owner, self.game)
    end
    if ObjectExtendsTower:IsEndOfRoundTower() and self.game.worldMap.gameRoundHandler then
        self.game.worldMap.gameTurn:AddEndOfRoundTower(ObjectExtendsTower.UniqueID, ObjectExtendsTower)
    end
    if ObjectExtendsTower:IsAttackActionTower() then
        self.game.gameDamageEngine:AddInitialDamageEventTower(ObjectExtendsTower.UniqueID, ObjectExtendsTower)
    end
    if ObjectExtendsTower:IsInitialDamageModificationTower() then
        self.game.gameDamageEngine:AddInitialDamageModificationEventTower(ObjectExtendsTower.UniqueID, ObjectExtendsTower)
    end
    if ObjectExtendsTower:IsGenericAutoAttackTower() then
        self.genericAttacks:set(ObjectExtendsTower.UniqueID, ObjectExtendsTower)
    end
    if ObjectExtendsTower:IsKillingActionTower() then
        self.killingActions:set(ObjectExtendsTower.UniqueID, ObjectExtendsTower)
    end
    if ObjectExtendsTower:IsLimitedTower() then
        if owner.hasHybridRandomed then
            if __TS__ArrayFindIndex(
                owner.hybridTowers,
                function(____, elem) return elem == DecodeFourCC(
                    nil,
                    ObjectExtendsTower:GetTypeID()
                ) end
            ) >= 0 or __TS__ArrayFindIndex(
                owner.hybridTowers,
                function() return "h03T" == DecodeFourCC(
                    nil,
                    ObjectExtendsTower:GetTypeID()
                ) end
            ) >= 0 then
                SetPlayerTechMaxAllowedSwap(
                    GetUnitTypeId(ObjectExtendsTower.tower),
                    ObjectExtendsTower:MaxCount(),
                    owner.wcPlayer
                )
            end
        else
            SetPlayerTechMaxAllowedSwap(
                GetUnitTypeId(ObjectExtendsTower.tower),
                ObjectExtendsTower:MaxCount(),
                owner.wcPlayer
            )
        end
    end
    if ObjectExtendsTower:IsConstructActionTower() then
        ObjectExtendsTower:ConstructionFinished()
    end
    if ObjectExtendsTower:IsTickingTower() then
        self.game.towerTicker:AddTickingTower(ObjectExtendsTower.UniqueID, ObjectExtendsTower)
    end
    if ObjectExtendsTower:IsTowerForceTower() then
        if owner.towerForces:has(
            ObjectExtendsTower:GetTypeID()
        ) then
            owner.towerForces:set(
                ObjectExtendsTower:GetTypeID(),
                owner.towerForces:get(
                    ObjectExtendsTower:GetTypeID()
                ) + 1
            )
            for ____, towerx in ipairs(owner.towersArray) do
                if towerx:IsTowerForceTower() and towerx.GetTypeID == ObjectExtendsTower.GetTypeID then
                    towerx:UpdateSize()
                end
            end
        else
            owner.towerForces:set(
                ObjectExtendsTower:GetTypeID(),
                1
            )
        end
    end
    if ObjectExtendsTower:IsAreaEffectTower() then
        local area
        do
            local i = 0
            while i < #settings.PLAYER_AREAS do
                if settings.PLAYER_AREAS[i + 1]:ContainsUnit(tower) then
                    area = i
                    break
                end
                i = i + 1
            end
        end
        if area then
            self.game.worldMap.playerSpawns[area + 1].areaTowers:set(ObjectExtendsTower.UniqueID, ObjectExtendsTower)
        else
            Log.Fatal(
                tostring(
                    GetUnitName(tower)
                ) .. " built outside of requires area. Please screenshot and report"
            )
        end
    end
    return ObjectExtendsTower
end
function TowerConstruction.prototype.DoGenericTowerAttacks(self)
    local generic = self.genericAttacks:get(
        GetHandleId(
            GetAttacker()
        )
    )
    if generic then
        generic:GenericAttack()
    end
end
function TowerConstruction.prototype.DoKillingTowerActions(self)
    local killing = self.killingActions:get(
        GetHandleId(
            GetKillingUnit()
        )
    )
    if killing then
        killing:KillingAction()
    end
end
function TowerConstruction.prototype.isLootBoxer(self, tower)
    return __TS__ArrayIndexOf(
        self.lootBoxerTowers,
        GetUnitTypeId(tower)
    ) > -1
end
return ____exports
