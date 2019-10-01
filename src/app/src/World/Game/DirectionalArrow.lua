--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____Effect = require("app.src.JassOverrides.Effect")
local Effect = ____Effect.Effect
local ____HologramCheckpointDistance = require("app.src.World.Holograms.HologramCheckpointDistance")
local HologramCheckpointDistance = ____HologramCheckpointDistance.HologramCheckpointDistance
____exports.DirectionalArrow = {}
local DirectionalArrow = ____exports.DirectionalArrow
DirectionalArrow.name = "DirectionalArrow"
DirectionalArrow.__index = DirectionalArrow
DirectionalArrow.prototype = {}
DirectionalArrow.prototype.__index = DirectionalArrow.prototype
DirectionalArrow.prototype.constructor = DirectionalArrow
function DirectionalArrow.new(...)
    local self = setmetatable({}, DirectionalArrow.prototype)
    self:____constructor(...)
    return self
end
function DirectionalArrow.prototype.____constructor(self, modelPath, firstCheckpointX, firstCheckpointY, secondCheckpointX, secondCheckpointY)
    local dist = HologramCheckpointDistance.new(secondCheckpointX - firstCheckpointX, secondCheckpointY - firstCheckpointY)
    self.effects = {
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 2 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 2 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 3 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 3 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 4 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 4 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 5 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 5 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 6 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 6 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 7 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 7 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 8 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 8 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 9 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 9 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 10 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 10 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 11 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 11 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 12 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 12 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 3 * dist.xDividedBy36 + dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 3 * dist.yDividedBy36 + dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 4 * dist.xDividedBy36 + 2 * dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 4 * dist.yDividedBy36 + 2 * dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 5 * dist.xDividedBy36 + 3 * dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 5 * dist.yDividedBy36 + 3 * dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 3 * dist.xDividedBy36 - dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 3 * dist.yDividedBy36 - dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 4 * dist.xDividedBy36 - 2 * dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 4 * dist.yDividedBy36 - 2 * dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 5 * dist.xDividedBy36 - 3 * dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 5 * dist.yDividedBy36 - 3 * dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 2 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 2 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 3 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 3 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 4 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 4 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 5 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 5 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 6 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 6 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 7 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 7 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 8 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 8 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 9 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 9 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 10 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 10 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 11 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 11 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 12 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 12 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 11 * dist.xDividedBy36 + dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 11 * dist.yDividedBy36 + dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 10 * dist.xDividedBy36 + 2 * dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 10 * dist.yDividedBy36 + 2 * dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 9 * dist.xDividedBy36 + 3 * dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 9 * dist.yDividedBy36 + 3 * dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 11 * dist.xDividedBy36 - dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 11 * dist.yDividedBy36 - dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 10 * dist.xDividedBy36 - 2 * dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 10 * dist.yDividedBy36 - 2 * dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 9 * dist.xDividedBy36 - 3 * dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 9 * dist.yDividedBy36 - 3 * dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 2 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 2 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 3 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 3 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 4 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 4 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 5 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 5 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 6 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 6 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 7 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 8 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 8 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 9 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 9 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 10 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 10 * dist.yDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 9 * dist.xDividedBy36 + dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 9 * dist.yDividedBy36 + dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 8 * dist.xDividedBy36 + 2 * dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 8 * dist.yDividedBy36 + 2 * dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy36 + 3 * dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 7 * dist.yDividedBy36 + 3 * dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 9 * dist.xDividedBy36 - dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 9 * dist.yDividedBy36 - dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 8 * dist.xDividedBy36 - 2 * dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 8 * dist.yDividedBy36 - 2 * dist.xDividedBy36)
        ),
        Effect.new(
            AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy36 - 3 * dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 7 * dist.yDividedBy36 - 3 * dist.xDividedBy36)
        )
    }
end
function DirectionalArrow.prototype.Destroy(self)
    local eff = table.remove(self.effects)
    while eff ~= nil do
        eff:Destroy()
        eff = table.remove(self.effects)
    end
end
return ____exports
