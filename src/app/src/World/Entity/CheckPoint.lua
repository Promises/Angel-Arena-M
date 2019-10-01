--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
____exports.CheckPoint = {}
local CheckPoint = ____exports.CheckPoint
CheckPoint.name = "CheckPoint"
CheckPoint.__index = CheckPoint
CheckPoint.prototype = {}
CheckPoint.prototype.____getters = {}
CheckPoint.prototype.__index = __TS__Index(CheckPoint.prototype)
CheckPoint.prototype.____setters = {}
CheckPoint.prototype.__newindex = __TS__NewIndex(CheckPoint.prototype)
CheckPoint.prototype.constructor = CheckPoint
function CheckPoint.new(...)
    local self = setmetatable({}, CheckPoint.prototype)
    self:____constructor(...)
    return self
end
function CheckPoint.prototype.____constructor(self, rectangle, worldMap)
    self.rectangle = rectangle
    self.worldMap = worldMap
    self.eventTrig = Trigger.new()
    self.eventTrig:RegisterEnterRectSimple(rectangle)
    self.eventTrig:AddCondition(
        function() return self:verifyTargetCheckpoint() end
    )
    self.eventTrig:AddAction(
        function() return self:checkPointAction() end
    )
end
function CheckPoint.prototype.____getters.previous(self)
    return self._previous
end
function CheckPoint.prototype.____getters.next(self)
    return self._next
end
function CheckPoint.prototype.____setters.previous(self, value)
    self._previous = value
end
function CheckPoint.prototype.____setters.next(self, value)
    self._next = value
end
function CheckPoint.prototype.verifyTargetCheckpoint(self)
    if not self.isEnteringUnitCreep then
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
                return spawnedCreep.targetCheckpoint == self
            end
        end
    end
    return true
end
function CheckPoint.prototype.checkPointAction(self)
    if not self.next then
        return
    end
    local spawnedCreeps = self.worldMap.spawnedCreeps
    if spawnedCreeps ~= nil then
        local creep = spawnedCreeps.unitMap:get(
            GetHandleIdBJ(
                GetEnteringUnit()
            )
        )
        if creep ~= nil then
            creep.targetCheckpoint = self.next
            IssuePointOrder(
                GetEnteringUnit(),
                "move",
                GetRectCenterX(self.next.rectangle),
                GetRectCenterY(self.next.rectangle)
            )
            if UnitHasBuffBJ(
                GetEnteringUnit(),
                FourCC("B028")
            ) then
                creep:morningPerson()
            end
        end
    end
end
function CheckPoint.prototype.isEnteringUnitCreep(self)
    local ownerID = GetPlayerId(
        GetOwningPlayer(
            GetEnteringUnit()
        )
    )
    local ____switch19 = ownerID
    if ____switch19 == COLOUR.NAVY then
        goto ____switch19_case_0
    end
    if ____switch19 == COLOUR.TURQUOISE then
        goto ____switch19_case_1
    end
    if ____switch19 == COLOUR.VOILET then
        goto ____switch19_case_2
    end
    if ____switch19 == COLOUR.WHEAT then
        goto ____switch19_case_3
    end
    goto ____switch19_case_default
    ::____switch19_case_0::
    ::____switch19_case_1::
    ::____switch19_case_2::
    ::____switch19_case_3::
    do
        return true
    end
    ::____switch19_case_default::
    do
        return false
    end
    ::____switch19_end::
end
return ____exports
