--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.HologramCheckpointDistance = {}
local HologramCheckpointDistance = ____exports.HologramCheckpointDistance
HologramCheckpointDistance.name = "HologramCheckpointDistance"
HologramCheckpointDistance.__index = HologramCheckpointDistance
HologramCheckpointDistance.prototype = {}
HologramCheckpointDistance.prototype.__index = HologramCheckpointDistance.prototype
HologramCheckpointDistance.prototype.constructor = HologramCheckpointDistance
function HologramCheckpointDistance.new(...)
    local self = setmetatable({}, HologramCheckpointDistance.prototype)
    self:____constructor(...)
    return self
end
function HologramCheckpointDistance.prototype.____constructor(self, x, y)
    self.x = x
    self.y = y
    self.xDividedBy9 = self.x / 9
    self.xDividedBy18 = self.x / 18
    self.xDividedBy36 = self.x / 36
    self.yDividedBy9 = self.y / 9
    self.yDividedBy18 = self.y / 18
    self.yDividedBy36 = self.y / 36
end
return ____exports
