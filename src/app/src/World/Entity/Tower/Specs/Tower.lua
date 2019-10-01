--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local settings = require("app.src.World.GlobalSettings")
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
local ____Rectangle = require("app.src.JassOverrides.Rectangle")
local Rectangle = ____Rectangle.Rectangle
local ____AntiJuggleTower = require("app.src.World.Entity.AntiJuggle.AntiJuggleTower")
local AntiJuggleTower = ____AntiJuggleTower.AntiJuggleTower
____exports.Tower = {}
local Tower = ____exports.Tower
Tower.name = "Tower"
Tower.__index = Tower
Tower.prototype = {}
Tower.prototype.____getters = {}
Tower.prototype.__index = __TS__Index(Tower.prototype)
Tower.prototype.____setters = {}
Tower.prototype.__newindex = __TS__NewIndex(Tower.prototype)
Tower.prototype.constructor = Tower
function Tower.new(...)
    local self = setmetatable({}, Tower.prototype)
    self:____constructor(...)
    return self
end
function Tower.prototype.____constructor(self, tower, owner, game)
    self._leaverOwned = false
    self._game = game
    self._tower = tower
    self._UniqueID = GetHandleIdBJ(tower)
    self._owner = owner
    self._towerValue = GetUnitGoldCost(
        self:GetTypeID()
    )
    owner:AddTower(self)
end
function Tower.prototype.____getters.towerValue(self)
    return self._towerValue
end
function Tower.prototype.____getters.game(self)
    return self._game
end
function Tower.prototype.____getters.UniqueID(self)
    return self._UniqueID
end
function Tower.prototype.____getters.owner(self)
    return self._owner
end
function Tower.prototype.____getters.tower(self)
    return self._tower
end
function Tower.prototype.____getters.leaverOwned(self)
    return self._leaverOwned
end
function Tower.prototype.____setters.towerValue(self, value)
    self._towerValue = value
end
function Tower.prototype.____setters.leaverOwned(self, value)
    self._leaverOwned = value
end
function Tower.prototype.GetName(self)
    return GetUnitName(self.tower)
end
function Tower.prototype.GetTypeID(self)
    return GetUnitTypeId(self.tower)
end
function Tower.prototype.GetRectangle(self)
    local x = GetUnitX(self.tower)
    local y = GetUnitX(self.tower)
    return Rectangle.new({x - 64, y - 64, x + 64, y + 64})
end
function Tower.prototype.Upgrade(self, newTypeId)
    self:Sell()
    local u = ReplaceUnitBJ(self.tower, newTypeId, bj_UNIT_STATE_METHOD_DEFAULTS)
    local newTower = self.game.worldMap.towerConstruction:SetupTower(u, self.owner)
    newTower._towerValue = newTower._towerValue + self._towerValue
    return newTower
end
function Tower.prototype.IsEndOfRoundTower(self)
    return self.EndOfRoundAction ~= nil
end
function Tower.prototype.IsAttackActionTower(self)
    return self.AttackAction ~= nil
end
function Tower.prototype.IsInitialDamageModificationTower(self)
    return self.InitialDamageModification ~= nil
end
function Tower.prototype.IsGenericAutoAttackTower(self)
    return self.GenericAttack ~= nil
end
function Tower.prototype.IsKillingActionTower(self)
    return self.KillingAction ~= nil
end
function Tower.prototype.IsAreaEffectTower(self)
    return self.PassiveCreepDiesInAreaEffect ~= nil
end
function Tower.prototype.IsTowerForceTower(self)
    return self.UpdateSize ~= nil
end
function Tower.prototype.IsConstructActionTower(self)
    return self.ConstructionFinished ~= nil
end
function Tower.prototype.IsSellActionTower(self)
    return self.SellAction ~= nil
end
function Tower.prototype.IsLimitedTower(self)
    return self.MaxCount ~= nil
end
function Tower.prototype.IsTickingTower(self)
    return self.GetTickModulo ~= nil
end
function Tower.prototype.Sell(self)
    if self:IsEndOfRoundTower() and self.game.worldMap.gameRoundHandler then
        self.game.worldMap.gameTurn:RemoveEndOfRoundTower(self.UniqueID)
    end
    if self:IsAttackActionTower() then
        self.game.gameDamageEngine.initialDamageEventTowers:delete(self.UniqueID)
    end
    if self:IsTickingTower() then
        self.game.towerTicker:RemoveTickingTower(self.UniqueID)
    end
    if self:IsInitialDamageModificationTower() then
        self.game.gameDamageEngine.initialDamageModificationEventTowers:delete(self.UniqueID)
    end
    if self:IsGenericAutoAttackTower() then
        self.game.worldMap.towerConstruction.genericAttacks:delete(self.UniqueID)
    end
    if self:IsKillingActionTower() then
        self.game.worldMap.towerConstruction.killingActions:delete(self.UniqueID)
    end
    if self:IsSellActionTower() then
        self:SellAction()
    end
    if self:IsTowerForceTower() then
        if self.owner.towerForces:has(
            self:GetTypeID()
        ) then
            self.owner.towerForces:set(
                self:GetTypeID(),
                self.owner.towerForces:get(
                    self:GetTypeID()
                ) - 1
            )
            for ____, towerx in ipairs(self.owner.towersArray) do
                if towerx:IsTowerForceTower() and towerx.GetTypeID == self.GetTypeID then
                    towerx:UpdateSize()
                end
            end
        end
    end
    if self:IsAreaEffectTower() then
        local area
        do
            local i = 0
            while i < #settings.PLAYER_AREAS do
                if settings.PLAYER_AREAS[i + 1]:ContainsUnit(self.tower) then
                    area = i
                    break
                end
                i = i + 1
            end
        end
        if area then
            self.game.worldMap.playerSpawns[area + 1].areaTowers:delete(self.UniqueID)
        else
            Log.Fatal(
                tostring(
                    GetUnitName(self.tower)
                ) .. " built outside of requires area, unable to remove. Please screenshot and report"
            )
        end
    end
    self.owner:RemoveTower(self.UniqueID)
end
function Tower.prototype.CastSpellOnAttackedUnitLocation(self, spell)
    local x = GetUnitX(
        GetAttackedUnitBJ()
    )
    local y = GetUnitY(
        GetAttackedUnitBJ()
    )
    IssuePointOrder(
        GetAttacker(),
        spell,
        x,
        y
    )
end
function Tower.prototype.SetOwnership(self, newOwner)
    SetUnitOwner(self.tower, newOwner.wcPlayer, true)
    self:Sell()
    local newTower = self.game.worldMap.towerConstruction:SetupTower(self.tower, newOwner)
    newTower._towerValue = self._towerValue
    return newTower
end
function Tower.prototype.GetSellValue(self)
    return self.towerValue
end
function Tower.prototype.Remove(self)
    self:Sell()
    if self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.isWaveInProgress then
        local antijuggle = AntiJuggleTower.new(self._game, self)
    end
    RemoveUnit(self.tower)
end
function Tower.prototype.IsTargetTick(self, currentTick, modulo)
    if not self:IsTickingTower() then
        Log.Debug(
            tostring(
                self:GetName()
            ) .. " is not a ticking tower"
        )
        return false
    end
    if self.targetTick == nil then
        self:SetTargetTick(currentTick, modulo)
        return false
    end
    if currentTick >= self.targetTick then
        self:SetTargetTick(currentTick, modulo)
        return true
    end
    return false
end
function Tower.prototype.SetTargetTick(self, currentTick, modulo)
    if not self:IsTickingTower() then
        Log.Debug(
            tostring(
                self:GetName()
            ) .. " is not a ticking tower"
        )
        return
    end
    self.targetTick = (currentTick + self:GetTickModulo()) % modulo
end
return ____exports
