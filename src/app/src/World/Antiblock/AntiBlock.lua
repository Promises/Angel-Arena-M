--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local settings = require("app.src.World.GlobalSettings")
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
local ____Maze = require("app.src.World.Antiblock.Maze")
local Walkable = ____Maze.Walkable
____exports.AntiBlock = {}
local AntiBlock = ____exports.AntiBlock
AntiBlock.name = "AntiBlock"
AntiBlock.__index = AntiBlock
AntiBlock.prototype = {}
AntiBlock.prototype.__index = AntiBlock.prototype
AntiBlock.prototype.constructor = AntiBlock
function AntiBlock.new(...)
    local self = setmetatable({}, AntiBlock.prototype)
    self:____constructor(...)
    return self
end
function AntiBlock.prototype.____constructor(self, worldMap)
    self._worldMap = worldMap
    self._eventTrigger = Trigger.new()
    self._eventTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_START)
    self._eventTrigger:AddAction(
        function() return self:Action() end
    )
    self._cancelBuildingTrigger = Trigger.new()
    self._cancelBuildingTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL)
    self._cancelBuildingTrigger:AddAction(
        function() return self:CanceledBuilding() end
    )
end
function AntiBlock.prototype.Action(self)
    local consUnit = GetConstructingStructure()
    local x = GetUnitX(
        GetConstructingStructure()
    )
    local y = GetUnitY(
        GetConstructingStructure()
    )
    local loc = GetUnitLoc(consUnit)
    local antiJuggleTowers = {}
    local hasBuiltOnAntiJuggle = false
    ForGroup(
        GetUnitsInRangeOfLocAll(128, loc),
        function()
            if GetUnitTypeId(
                GetEnumUnit()
            ) == FourCC("uC14") then
                if GetUnitX(
                    GetEnumUnit()
                ) == x and GetUnitY(
                    GetEnumUnit()
                ) == y then
                    hasBuiltOnAntiJuggle = true
                    RemoveUnit(
                        GetEnumUnit()
                    )
                else
                    __TS__ArrayPush(
                        antiJuggleTowers,
                        GetEnumUnit()
                    )
                end
            end
        end
    )
    local player = self._worldMap.game.players:get(
        GetPlayerId(
            GetOwningPlayer(consUnit)
        )
    )
    if player == nil then
        return
    end
    local isWaveInProgress = not not self._worldMap.gameRoundHandler and self._worldMap.gameRoundHandler.isWaveInProgress
    local antiJuggleEnabled = not not self._worldMap.gameRoundHandler and self._worldMap.gameRoundHandler.antiJuggleEnabled
    local antiJuggleCreeps = {}
    if isWaveInProgress and hasBuiltOnAntiJuggle == false and antiJuggleEnabled then
        local isJuggling = false
        ForGroup(
            GetUnitsInRangeOfLocAll(128, loc),
            function()
                local ownerID = GetPlayerId(
                    GetOwningPlayer(
                        GetEnumUnit()
                    )
                )
                local ____switch12 = ownerID
                if ____switch12 == COLOUR.NAVY then
                    goto ____switch12_case_0
                end
                if ____switch12 == COLOUR.TURQUOISE then
                    goto ____switch12_case_1
                end
                if ____switch12 == COLOUR.VOILET then
                    goto ____switch12_case_2
                end
                if ____switch12 == COLOUR.WHEAT then
                    goto ____switch12_case_3
                end
                goto ____switch12_case_default
                ::____switch12_case_0::
                ::____switch12_case_1::
                ::____switch12_case_2::
                ::____switch12_case_3::
                do
                    if IsUnitAliveBJ(
                        GetEnumUnit()
                    ) then
                        local creep = self._worldMap.spawnedCreeps.unitMap:get(
                            GetHandleId(
                                GetEnumUnit()
                            )
                        )
                        if creep ~= nil then
                            __TS__ArrayPush(antiJuggleCreeps, creep)
                        else
                            Log.Debug("Creep is missing in spawnedCreeps unitMap")
                        end
                        isJuggling = true
                    end
                    goto ____switch12_end
                end
                ::____switch12_case_default::
                do
                    goto ____switch12_end
                end
                ::____switch12_end::
            end
        )
        if isJuggling then
            RemoveLocation(loc)
            return self:juggling(consUnit, player, antiJuggleCreeps)
        end
    end
    RemoveLocation(loc)
    if GetUnitAbilityLevelSwapped(
        FourCC("A0CR"),
        consUnit
    ) > 0 then
        if not player:getRectangle():ContainsUnit(consUnit) then
            return self:homesick(consUnit, player)
        end
    end
    local playerSpawnId
    do
        local i = 0
        while i < #settings.PLAYER_AREAS do
            if settings.PLAYER_AREAS[i + 1]:ContainsUnit(consUnit) then
                playerSpawnId = i
                break
            end
            i = i + 1
        end
    end
    if playerSpawnId == nil then
        return
    end
    local maze = self._worldMap.playerMazes[playerSpawnId + 1]
    local leftSide = ((x - 64) - maze.minX) / 64
    local rightSide = (x - maze.minX) / 64
    local topSide = (y - maze.minY) / 64
    local bottomSide = ((y - 64) - maze.minY) / 64
    maze:setWalkable(leftSide, bottomSide, Walkable.Blocked)
    maze:setWalkable(rightSide, bottomSide, Walkable.Blocked)
    maze:setWalkable(leftSide, topSide, Walkable.Blocked)
    maze:setWalkable(rightSide, topSide, Walkable.Blocked)
    local playerSpawn = self._worldMap.playerSpawns[playerSpawnId + 1]
    local spawnOne = playerSpawn.spawnOne
    local firstCheckpoint = spawnOne.next
    local spawnX = math.max(
        math.min(
            math.floor(
                (GetRectCenterX(spawnOne.rectangle) - maze.minX) / 64
            ),
            maze.width - 1
        ),
        0
    )
    local spawnY = math.max(
        math.min(
            math.floor(
                (GetRectCenterY(spawnOne.rectangle) - maze.minY) / 64
            ),
            maze.height - 1
        ),
        0
    )
    local firstCheckpointX = math.floor(
        (GetRectCenterX(firstCheckpoint.rectangle) - maze.minX) / 64
    )
    local firstCheckpointY = math.floor(
        (GetRectCenterY(firstCheckpoint.rectangle) - maze.minY) / 64
    )
    local firstCheckpointBFS = maze:breathFirstSearch(spawnX, spawnY, firstCheckpointX, firstCheckpointY)
    if firstCheckpointBFS == -1 then
        maze:setWalkable(leftSide, bottomSide, Walkable.Walkable)
        maze:setWalkable(rightSide, bottomSide, Walkable.Walkable)
        maze:setWalkable(leftSide, topSide, Walkable.Walkable)
        maze:setWalkable(rightSide, topSide, Walkable.Walkable)
        __TS__ArrayForEach(
            antiJuggleTowers,
            function(____, antiJuggleTower)
                local antiJuggleX = GetUnitX(antiJuggleTower)
                local antiJuggleY = GetUnitY(antiJuggleTower)
                local antiJuggleLeftSide = ((antiJuggleX - 64) - maze.minX) / 64
                local antiJuggleRightSide = (antiJuggleX - maze.minX) / 64
                local antiJuggleTopSide = (antiJuggleY - maze.minY) / 64
                local antiJuggleBottomSide = ((antiJuggleY - 64) - maze.minY) / 64
                maze:setWalkable(antiJuggleLeftSide, antiJuggleBottomSide, Walkable.Protected)
                maze:setWalkable(antiJuggleRightSide, antiJuggleBottomSide, Walkable.Protected)
                maze:setWalkable(antiJuggleLeftSide, antiJuggleTopSide, Walkable.Protected)
                maze:setWalkable(antiJuggleRightSide, antiJuggleTopSide, Walkable.Protected)
            end
        )
        return self:blocking(consUnit, player)
    end
    local secondCheckpoint = firstCheckpoint.next
    local secondCheckpointX = math.floor(
        (GetRectCenterX(secondCheckpoint.rectangle) - maze.minX) / 64
    )
    local secondCheckpointY = math.floor(
        (GetRectCenterY(secondCheckpoint.rectangle) - maze.minY) / 64
    )
    local secondCheckpointBFS = maze:breathFirstSearch(firstCheckpointX, firstCheckpointY, secondCheckpointX, secondCheckpointY)
    if secondCheckpointBFS == -1 then
        maze:setWalkable(leftSide, bottomSide, Walkable.Walkable)
        maze:setWalkable(rightSide, bottomSide, Walkable.Walkable)
        maze:setWalkable(leftSide, topSide, Walkable.Walkable)
        maze:setWalkable(rightSide, topSide, Walkable.Walkable)
        __TS__ArrayForEach(
            antiJuggleTowers,
            function(____, antiJuggleTower)
                local antiJuggleX = GetUnitX(antiJuggleTower)
                local antiJuggleY = GetUnitY(antiJuggleTower)
                local antiJuggleLeftSide = ((antiJuggleX - 64) - maze.minX) / 64
                local antiJuggleRightSide = (antiJuggleX - maze.minX) / 64
                local antiJuggleTopSide = (antiJuggleY - maze.minY) / 64
                local antiJuggleBottomSide = ((antiJuggleY - 64) - maze.minY) / 64
                maze:setWalkable(antiJuggleLeftSide, antiJuggleBottomSide, Walkable.Protected)
                maze:setWalkable(antiJuggleRightSide, antiJuggleBottomSide, Walkable.Protected)
                maze:setWalkable(antiJuggleLeftSide, antiJuggleTopSide, Walkable.Protected)
                maze:setWalkable(antiJuggleRightSide, antiJuggleTopSide, Walkable.Protected)
            end
        )
        return self:blocking(consUnit, player)
    end
    local ____end = secondCheckpoint.next
    local endX = math.max(
        math.min(
            math.floor(
                (GetRectCenterX(____end.rectangle) - maze.minX) / 64
            ),
            maze.width - 1
        ),
        0
    )
    local endY = math.max(
        math.min(
            math.floor(
                (GetRectCenterY(____end.rectangle) - maze.minY) / 64
            ),
            maze.height - 1
        ),
        0
    )
    local exitPointBFS = maze:breathFirstSearch(secondCheckpointX, secondCheckpointY, endX, endY)
    if exitPointBFS == -1 then
        maze:setWalkable(leftSide, bottomSide, Walkable.Walkable)
        maze:setWalkable(rightSide, bottomSide, Walkable.Walkable)
        maze:setWalkable(leftSide, topSide, Walkable.Walkable)
        maze:setWalkable(rightSide, topSide, Walkable.Walkable)
        __TS__ArrayForEach(
            antiJuggleTowers,
            function(____, antiJuggleTower)
                local antiJuggleX = GetUnitX(antiJuggleTower)
                local antiJuggleY = GetUnitY(antiJuggleTower)
                local antiJuggleLeftSide = ((antiJuggleX - 64) - maze.minX) / 64
                local antiJuggleRightSide = (antiJuggleX - maze.minX) / 64
                local antiJuggleTopSide = (antiJuggleY - maze.minY) / 64
                local antiJuggleBottomSide = ((antiJuggleY - 64) - maze.minY) / 64
                maze:setWalkable(antiJuggleLeftSide, antiJuggleBottomSide, Walkable.Protected)
                maze:setWalkable(antiJuggleRightSide, antiJuggleBottomSide, Walkable.Protected)
                maze:setWalkable(antiJuggleLeftSide, antiJuggleTopSide, Walkable.Protected)
                maze:setWalkable(antiJuggleRightSide, antiJuggleTopSide, Walkable.Protected)
            end
        )
        return self:blocking(consUnit, player)
    end
    player.totalMazeLength = firstCheckpointBFS + secondCheckpointBFS + exitPointBFS
end
function AntiBlock.prototype.blocking(self, consUnit, player)
    player:sendMessage("|CFFFF0303[Anti-Block]|r |CFFFFFF01Detected a possible blocking attempt." .. " Your building has been cancelled and you have been refunded the full cost.|r")
    self:cancelBuilding(consUnit)
end
function AntiBlock.prototype.juggling(self, consUnit, player, antiJuggleCreeps)
    player:sendMessage("|CFFFF0303[Anti-Juggle]|r |CFFFFFF01Detected a possible juggling attempt." .. " Your building has been cancelled and you have been refunded the full cost.|r")
    self:cancelBuilding(consUnit)
    __TS__ArrayForEach(
        antiJuggleCreeps,
        function(____, creep) return creep:ReapplyMovement() end
    )
end
function AntiBlock.prototype.homesick(self, consUnit, player)
    player:sendMessage("|CFFFF0303Your tower got|r " .. "|CFFFFFF01homesick|r" .. " |CFFFF0303for being too far away from your spawn.|r")
    self:cancelBuilding(consUnit)
end
function AntiBlock.prototype.cancelBuilding(self, consUnit)
    TriggerSleepAction(0.01)
    IssueImmediateOrderById(consUnit, settings.UNIT_ORDER_CANCEL_UPGRADE)
    RemoveUnit(consUnit)
end
function AntiBlock.prototype.CanceledBuilding(self)
    local u = GetCancelledStructure()
    self:CleanUpRemovedConstruction(u)
end
function AntiBlock.prototype.CleanUpRemovedConstruction(self, u)
    local playerSpawnId
    do
        local i = 0
        while i < #settings.PLAYER_AREAS do
            if settings.PLAYER_AREAS[i + 1]:ContainsUnit(u) then
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
    local x = GetUnitX(u)
    local y = GetUnitY(u)
    local maze = self._worldMap.playerMazes[playerSpawnId + 1]
    local leftSide = ((x - 64) - maze.minX) / 64
    local rightSide = (x - maze.minX) / 64
    local topSide = (y - maze.minY) / 64
    local bottomSide = ((y - 64) - maze.minY) / 64
    maze:setWalkable(leftSide, bottomSide, Walkable.Walkable)
    maze:setWalkable(rightSide, bottomSide, Walkable.Walkable)
    maze:setWalkable(leftSide, topSide, Walkable.Walkable)
    maze:setWalkable(rightSide, topSide, Walkable.Walkable)
end
return ____exports
