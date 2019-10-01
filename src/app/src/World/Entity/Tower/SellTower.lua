--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local settings = require("app.src.World.GlobalSettings")
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
local ____Maze = require("app.src.World.Antiblock.Maze")
local Walkable = ____Maze.Walkable
local ____AntiJuggleTower = require("app.src.World.Entity.AntiJuggle.AntiJuggleTower")
local AntiJuggleTower = ____AntiJuggleTower.AntiJuggleTower
____exports.SellTower = {}
local SellTower = ____exports.SellTower
SellTower.name = "SellTower"
SellTower.__index = SellTower
SellTower.prototype = {}
SellTower.prototype.__index = SellTower.prototype
SellTower.prototype.constructor = SellTower
function SellTower.new(...)
    local self = setmetatable({}, SellTower.prototype)
    self:____constructor(...)
    return self
end
function SellTower.prototype.____constructor(self, game)
    self._game = game
    self._sellTrigger = Trigger.new()
    self._sellTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_EFFECT)
    self._sellTrigger:AddCondition(
        function() return self:AreWeSellingTheTower() end
    )
    self._sellTrigger:AddAction(
        function() return self:FindAndSellTower() end
    )
end
function SellTower.prototype.AreWeSellingTheTower(self)
    return GetSpellAbilityId() == FourCC("A02D")
end
function SellTower.prototype.SellTower(self, unit)
    local playerSpawnId
    local value = GetUnitPointValue(unit)
    do
        local i = 0
        while i < #settings.PLAYER_AREAS do
            if settings.PLAYER_AREAS[i + 1]:ContainsUnit(unit) then
                playerSpawnId = i
                break
            end
            i = i + 1
        end
    end
    if playerSpawnId == nil then
        Log.Fatal("Unable to locate the correct player spawn")
        return
    end
    local owningPlayer = GetOwningPlayer(unit)
    local player = self._game.players:get(
        GetPlayerId(owningPlayer)
    )
    if player then
        local tower = player:GetTower(
            GetHandleId(unit)
        )
        if tower then
            value = math.floor(
                tower:GetSellValue()
            )
            if tower:GetTypeID() ~= FourCC("n01Y") and tower:GetTypeID() ~= FourCC("n00M") and tower:GetTypeID() ~= FourCC("e00L") then
                value = Util:Round(value * 0.75)
            end
            tower:Sell()
        end
        if not (GetUnitAbilityLevel(
            unit,
            FourCC("A02D")
        ) > 0) then
            value = 0
        end
        if player then
            player:giveGold(value)
        end
        local txt = CreateTextTagUnitBJ(
            ToString(nil, value),
            unit,
            1,
            10,
            100,
            80,
            0,
            0
        )
        SetTextTagPermanentBJ(txt, false)
        SetTextTagLifespanBJ(txt, 2)
        SetTextTagVelocityBJ(txt, 64, 90)
        DestroyEffect(
            AddSpecialEffect(
                "Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl",
                GetUnitX(unit),
                GetUnitY(unit)
            )
        )
        PlaySoundOnUnitBJ(settings.Sounds.goldSound, 100, unit)
        local isWaveInProgress = (self._game.worldMap.gameRoundHandler and function() return self._game.worldMap.gameRoundHandler.isWaveInProgress end or function() return false end)()
        local x = GetUnitX(unit)
        local y = GetUnitY(unit)
        if isWaveInProgress and tower then
            local antijuggle = AntiJuggleTower.new(self._game, tower)
        else
            Log.Debug("Setting maze")
            local maze = self._game.worldMap.playerMazes[playerSpawnId + 1]
            local leftSide = ((x - 64) - maze.minX) / 64
            local rightSide = (x - maze.minX) / 64
            local topSide = (y - maze.minY) / 64
            local bottomSide = ((y - 64) - maze.minY) / 64
            maze:setWalkable(leftSide, bottomSide, Walkable.Walkable)
            maze:setWalkable(rightSide, bottomSide, Walkable.Walkable)
            maze:setWalkable(leftSide, topSide, Walkable.Walkable)
            maze:setWalkable(rightSide, topSide, Walkable.Walkable)
            RemoveUnit(unit)
        end
    end
end
function SellTower.prototype.FindAndSellTower(self)
    local unit = GetTriggerUnit()
    self:SellTower(unit)
end
return ____exports
