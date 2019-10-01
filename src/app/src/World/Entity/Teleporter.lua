--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____CheckPoint = require("app.src.World.Entity.CheckPoint")
local CheckPoint = ____CheckPoint.CheckPoint
____exports.Teleporter = {}
local Teleporter = ____exports.Teleporter
Teleporter.name = "Teleporter"
Teleporter.__index = Teleporter
Teleporter.prototype = {}
Teleporter.prototype.__index = __TS__Index(Teleporter.prototype)
Teleporter.prototype.__newindex = __TS__NewIndex(Teleporter.prototype)
Teleporter.prototype.constructor = Teleporter
Teleporter.____super = CheckPoint
setmetatable(Teleporter, Teleporter.____super)
setmetatable(Teleporter.prototype, Teleporter.____super.prototype)
function Teleporter.new(...)
    local self = setmetatable({}, Teleporter.prototype)
    self:____constructor(...)
    return self
end
function Teleporter.prototype.____constructor(self, rectangle, worldMap, facing)
    CheckPoint.prototype.____constructor(self, rectangle, worldMap)
    self.facing = facing
end
function Teleporter.prototype.checkPointAction(self)
    if not self.next then
        return
    end
    local x = GetRectCenterX(self.next.rectangle)
    local y = GetRectCenterY(self.next.rectangle)
    local spawnedCreeps = self.worldMap.spawnedCreeps
    if spawnedCreeps ~= nil then
        local spawnedCreep = spawnedCreeps.unitMap:get(
            GetHandleIdBJ(
                GetEnteringUnit()
            )
        )
        if spawnedCreep ~= nil then
            spawnedCreep.targetCheckpoint = self.next
            SetUnitPosition(
                GetEnteringUnit(),
                x,
                y
            )
            SetUnitFacing(
                GetEnteringUnit(),
                self.facing
            )
            DestroyEffect(
                AddSpecialEffect("Abilities/Spells/Human/MassTeleport/MassTeleportCaster.mdl", x, y)
            )
            IssuePointOrder(
                GetEnteringUnit(),
                "move",
                GetRectCenterX(self.next.rectangle),
                GetRectCenterY(self.next.rectangle)
            )
        end
    end
end
return ____exports
