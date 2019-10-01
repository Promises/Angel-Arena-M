--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local settings = require("app.src.World.GlobalSettings")
____exports.SpawnedCreeps = {}
local SpawnedCreeps = ____exports.SpawnedCreeps
SpawnedCreeps.name = "SpawnedCreeps"
SpawnedCreeps.__index = SpawnedCreeps
SpawnedCreeps.prototype = {}
SpawnedCreeps.prototype.__index = SpawnedCreeps.prototype
SpawnedCreeps.prototype.constructor = SpawnedCreeps
function SpawnedCreeps.new(...)
    local self = setmetatable({}, SpawnedCreeps.prototype)
    self:____constructor(...)
    return self
end
function SpawnedCreeps.prototype.____constructor(self, worldMap)
    self.unitMap = Map.new()
    self.chimearaIds = {
        FourCC("e004"),
        FourCC("e009"),
        FourCC("e00U"),
        FourCC("e00V"),
        FourCC("e000")
    }
    self.worldMap = worldMap
    self.unitDiesTrigger = Trigger.new()
    self.unitDiesTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_DEATH)
    self.unitDiesTrigger:AddAction(
        function() return self:RemoveDeadCreeps() end
    )
end
function SpawnedCreeps.prototype.printUnit(self)
    local test = self.unitMap:get(
        GetHandleIdBJ(
            GetTriggerUnit()
        )
    )
    if test ~= nil then
        test:printId()
    end
end
function SpawnedCreeps.prototype.RemoveDeadCreeps(self)
    local creep = self.unitMap:get(
        GetHandleIdBJ(
            GetDyingUnit()
        )
    )
    if not creep then
        local dyingId = GetUnitTypeId(
            GetDyingUnit()
        )
        local owningplayer = self.worldMap.game.players:get(
            GetPlayerId(
                GetOwningPlayer(
                    GetDyingUnit()
                )
            )
        )
        if __TS__ArrayIndexOf(
            self.chimearaIds,
            GetUnitTypeId(
                GetDyingUnit()
            )
        ) >= 0 then
            if owningplayer then
                owningplayer.chimeraCount = owningplayer.chimeraCount - 1
            end
        end
        if dyingId == FourCC("u042") then
            if owningplayer then
                owningplayer.zerglings = owningplayer.zerglings - 1
            end
        end
        if owningplayer then
            local tower = owningplayer:GetTower(
                GetHandleId(
                    GetDyingUnit()
                )
            )
            if tower then
                tower:Remove()
                return
            end
        end
        RemoveUnit(
            GetDyingUnit()
        )
        return
    end
    local area
    do
        local i = 0
        while i < #settings.PLAYER_AREAS do
            if settings.PLAYER_AREAS[i + 1]:ContainsCreep(creep) then
                area = i
                break
            end
            i = i + 1
        end
    end
    if area then
        self.worldMap.playerSpawns[area + 1]:AreaTowerActions(creep)
    end
    local player = self.worldMap.game.players:get(
        GetPlayerId(
            GetOwningPlayer(
                GetKillingUnitBJ()
            )
        )
    )
    if player then
        player:GiveKillCount()
    end
    self.unitMap:delete(
        creep:getHandleId()
    )
    RemoveUnit(creep.creep)
end
return ____exports
