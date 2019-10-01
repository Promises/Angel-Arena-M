--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local ____Creep = require("app.src.World.Entity.Creep")
local Creep = ____Creep.Creep
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local PLAYER_AREAS = ____GlobalSettings.PLAYER_AREAS
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
____exports.PlayerSpawns = {}
local PlayerSpawns = ____exports.PlayerSpawns
PlayerSpawns.name = "PlayerSpawns"
PlayerSpawns.__index = PlayerSpawns
PlayerSpawns.prototype = {}
PlayerSpawns.prototype.____getters = {}
PlayerSpawns.prototype.__index = __TS__Index(PlayerSpawns.prototype)
PlayerSpawns.prototype.____setters = {}
PlayerSpawns.prototype.__newindex = __TS__NewIndex(PlayerSpawns.prototype)
PlayerSpawns.prototype.constructor = PlayerSpawns
function PlayerSpawns.new(...)
    local self = setmetatable({}, PlayerSpawns.prototype)
    self:____constructor(...)
    return self
end
function PlayerSpawns.prototype.____constructor(self, worldMap, colourId)
    self.areaTowers = Map.new()
    self.worldMap = worldMap
    self.isOpen = false
    self.colourId = colourId
    self.area = PLAYER_AREAS[self.colourId + 1]
    self.enterTrig = Trigger.new()
    self.enterTrig:RegisterEnterRectangle(self.area)
    self.enterTrig:AddAction(
        function() return self:EnterRegions() end
    )
end
function PlayerSpawns.prototype.____getters.spawnOne(self)
    return self._spawnOne
end
function PlayerSpawns.prototype.____getters.spawnTwo(self)
    return self._spawnTwo
end
function PlayerSpawns.prototype.____setters.spawnOne(self, value)
    self._spawnOne = value
    if self.spawnOne then
        self.oneTrig = Trigger.new()
        self.oneTrig:RegisterEnterRectSimple(self.spawnOne.rectangle)
        self.oneTrig:AddCondition(
            function() return self:EnteringUnitIsCreepAndHasNoCheckpoint() end
        )
        self.oneTrig:AddAction(
            function() return self:SpawnAction(self.spawnOne) end
        )
    end
end
function PlayerSpawns.prototype.____setters.spawnTwo(self, value)
    self._spawnTwo = value
    if self.spawnTwo then
        self.twoTrig = Trigger.new()
        self.twoTrig:RegisterEnterRectSimple(self.spawnTwo.rectangle)
        self.twoTrig:AddCondition(
            function() return self:EnteringUnitIsCreepAndHasNoCheckpoint() end
        )
        self.twoTrig:AddAction(
            function() return self:SpawnAction(self.spawnTwo) end
        )
    end
end
function PlayerSpawns.prototype.SpawnCreep(self, gameRound, spawned, abilities, wave, creepOwner)
    if not self.isOpen then
        return
    end
    if self.spawnOne then
        local creep = CreateUnit(
            Player(COLOUR.NAVY + creepOwner % 4),
            FourCC(wave.id),
            GetRectCenterX(self.spawnOne.rectangle),
            GetRectCenterY(self.spawnOne.rectangle),
            self:getSpawnFace(self.colourId)
        )
        spawned:set(
            GetHandleId(creep),
            Creep.new(creep, gameRound, abilities, self.worldMap.game)
        )
        if wave.wave ~= 37 then
            if self.spawnTwo then
                creep = CreateUnit(
                    Player(COLOUR.NAVY + creepOwner % 4),
                    FourCC(wave.id),
                    GetRectCenterX(self.spawnTwo.rectangle),
                    GetRectCenterY(self.spawnTwo.rectangle),
                    self:getSpawnFace(self.colourId)
                )
                spawned:set(
                    GetHandleId(creep),
                    Creep.new(creep, gameRound, abilities, self.worldMap.game)
                )
            end
        end
    end
end
function PlayerSpawns.prototype.getSpawnFace(self, id)
    local ____switch19 = id
    if ____switch19 == COLOUR.RED then
        goto ____switch19_case_0
    end
    if ____switch19 == COLOUR.PINK then
        goto ____switch19_case_1
    end
    if ____switch19 == COLOUR.BLUE then
        goto ____switch19_case_2
    end
    if ____switch19 == COLOUR.PURPLE then
        goto ____switch19_case_3
    end
    if ____switch19 == COLOUR.YELLOW then
        goto ____switch19_case_4
    end
    if ____switch19 == COLOUR.ORANGE then
        goto ____switch19_case_5
    end
    if ____switch19 == COLOUR.GRAY then
        goto ____switch19_case_6
    end
    if ____switch19 == COLOUR.BROWN then
        goto ____switch19_case_7
    end
    if ____switch19 == COLOUR.MAROON then
        goto ____switch19_case_8
    end
    if ____switch19 == COLOUR.TEAL then
        goto ____switch19_case_9
    end
    if ____switch19 == COLOUR.GREEN then
        goto ____switch19_case_10
    end
    if ____switch19 == COLOUR.LIGHT_BLUE then
        goto ____switch19_case_11
    end
    if ____switch19 == COLOUR.DARK_GREEN then
        goto ____switch19_case_12
    end
    goto ____switch19_case_default
    ::____switch19_case_0::
    ::____switch19_case_1::
    do
        return 180
    end
    ::____switch19_case_2::
    ::____switch19_case_3::
    ::____switch19_case_4::
    ::____switch19_case_5::
    ::____switch19_case_6::
    ::____switch19_case_7::
    ::____switch19_case_8::
    do
        return 270
    end
    ::____switch19_case_9::
    ::____switch19_case_10::
    do
        return 0
    end
    ::____switch19_case_11::
    ::____switch19_case_12::
    do
        return 90
    end
    ::____switch19_case_default::
    do
        Log.Error(
            "getSpawnFace, could not find player: " .. tostring(id)
        )
        return 0
    end
    ::____switch19_end::
end
function PlayerSpawns.prototype.EnteringUnitIsCreepAndHasNoCheckpoint(self)
    if not self:isEnteringUnitCreep() then
        return false
    end
    local spawnedCreeps = self.worldMap.spawnedCreeps
    if spawnedCreeps ~= nil then
        local spawnedCreep = spawnedCreeps.unitMap:get(
            GetHandleIdBJ(
                GetEnteringUnit()
            )
        )
        if spawnedCreep ~= nil then
            if spawnedCreep.targetCheckpoint then
                return false
            end
        end
    end
    return true
end
function PlayerSpawns.prototype.isEnteringUnitCreep(self)
    local ownerID = GetPlayerId(
        GetOwningPlayer(
            GetEnteringUnit()
        )
    )
    local ____switch26 = ownerID
    if ____switch26 == COLOUR.NAVY then
        goto ____switch26_case_0
    end
    if ____switch26 == COLOUR.TURQUOISE then
        goto ____switch26_case_1
    end
    if ____switch26 == COLOUR.VOILET then
        goto ____switch26_case_2
    end
    if ____switch26 == COLOUR.WHEAT then
        goto ____switch26_case_3
    end
    goto ____switch26_case_default
    ::____switch26_case_0::
    ::____switch26_case_1::
    ::____switch26_case_2::
    ::____switch26_case_3::
    do
        return true
    end
    ::____switch26_case_default::
    do
        return false
    end
    ::____switch26_end::
end
function PlayerSpawns.prototype.SpawnAction(self, spawn)
    if self.spawnOne and not spawn.next then
        spawn = self.spawnOne
    end
    if not spawn.next then
        return
    end
    local spawnedCreeps = self.worldMap.spawnedCreeps
    if spawnedCreeps ~= nil then
        local spawnedCreep = spawnedCreeps.unitMap:get(
            GetHandleIdBJ(
                GetEnteringUnit()
            )
        )
        if spawnedCreep then
            if spawn.next then
                spawnedCreep.targetCheckpoint = spawn.next
                IssuePointOrder(
                    GetEnteringUnit(),
                    "move",
                    GetRectCenterX(spawn.next.rectangle),
                    GetRectCenterY(spawn.next.rectangle)
                )
                spawnedCreep:AddCreepAbilities()
            end
        end
    end
end
function PlayerSpawns.prototype.AreaTowerActions(self, dyingCreep)
    for tower in __TS__Iterator(
        self.areaTowers:values()
    ) do
        tower:PassiveCreepDiesInAreaEffect(dyingCreep)
    end
end
function PlayerSpawns.prototype.EnterRegions(self)
    if self:isEnteringUnitCreep() then
        if not self.isOpen then
            if not UnitHasBuffBJ(
                GetEnteringUnit(),
                FourCC("Bblo")
            ) then
                local dummy = CreateUnit(
                    Player(PLAYER_NEUTRAL_PASSIVE),
                    FourCC("u008"),
                    0,
                    -5300,
                    bj_UNIT_FACING
                )
                UnitAddAbilityBJ(
                    FourCC("A068"),
                    dummy
                )
                IssueTargetOrderBJ(
                    dummy,
                    "bloodlust",
                    GetEnteringUnit()
                )
                UnitApplyTimedLifeBJ(
                    1,
                    FourCC("BTLF"),
                    dummy
                )
            end
        else
            UnitRemoveBuffBJ(
                FourCC("Bblo"),
                GetEnteringUnit()
            )
        end
    elseif IsUnitType(
        GetEnteringUnit(),
        UNIT_TYPE_SUMMONED
    ) then
        if GetUnitTypeId(
            GetTriggerUnit()
        ) ~= FourCC("u008") then
            if GetOwningPlayer(
                GetEnteringUnit()
            ) ~= Player(self.colourId) then
                SetUnitPosition(
                    GetEnteringUnit(),
                    self.area:GetCenterX(),
                    self.area:GetCenterY()
                )
            end
        end
    elseif self.worldMap.game.players:get(self.colourId) and not IsUnitType(
        GetEnteringUnit(),
        UNIT_TYPE_STRUCTURE
    ) then
        local areaPlayer = self.worldMap.game.players:get(self.colourId)
        if areaPlayer:HasDenied(
            GetPlayerId(
                GetOwningPlayer(
                    GetEnteringUnit()
                )
            )
        ) then
            SetUnitPosition(
                GetEnteringUnit(),
                PLAYER_AREAS[GetPlayerId(
                    GetOwningPlayer(
                        GetEnteringUnit()
                    )
                ) + 1]:GetCenterX(),
                PLAYER_AREAS[GetPlayerId(
                    GetOwningPlayer(
                        GetEnteringUnit()
                    )
                ) + 1]:GetCenterY()
            )
        end
    end
end
return ____exports
