--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____AbstractHologramMaze = require("app.src.World.Holograms.AbstractHologramMaze")
local AbstractHologramMaze = ____AbstractHologramMaze.AbstractHologramMaze
local ____Image = require("app.src.JassOverrides.Image")
local Image = ____Image.Image
local ____HologramCheckpointDistance = require("app.src.World.Holograms.HologramCheckpointDistance")
local HologramCheckpointDistance = ____HologramCheckpointDistance.HologramCheckpointDistance
____exports.CircleHoloMaze = {}
local CircleHoloMaze = ____exports.CircleHoloMaze
CircleHoloMaze.name = "CircleHoloMaze"
CircleHoloMaze.__index = CircleHoloMaze
CircleHoloMaze.prototype = {}
CircleHoloMaze.prototype.__index = CircleHoloMaze.prototype
CircleHoloMaze.prototype.constructor = CircleHoloMaze
CircleHoloMaze.____super = AbstractHologramMaze
setmetatable(CircleHoloMaze, CircleHoloMaze.____super)
setmetatable(CircleHoloMaze.prototype, CircleHoloMaze.____super.prototype)
function CircleHoloMaze.new(...)
    local self = setmetatable({}, CircleHoloMaze.prototype)
    self:____constructor(...)
    return self
end
function CircleHoloMaze.prototype.____constructor(self, imagePath, firstCheckpointX, firstCheckpointY, secondCheckpointX, secondCheckpointY)
    AbstractHologramMaze.prototype.____constructor(self)
    local dist = HologramCheckpointDistance.new(secondCheckpointX - firstCheckpointX, secondCheckpointY - firstCheckpointY)
    self.images = {
        Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy9, firstCheckpointY + dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9, firstCheckpointY + dist.yDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy9, firstCheckpointY - dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9 - dist.xDividedBy18 + dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy9 - dist.yDividedBy18 + dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9 - dist.xDividedBy18 + 2 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy9 - dist.yDividedBy18 + 2 * dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy18 + 3 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy18 + 3 * dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy18 + 3 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY + dist.yDividedBy18 + 3 * dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9 + dist.xDividedBy18 + 2 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY + dist.yDividedBy9 + dist.yDividedBy18 + 2 * dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9 + dist.xDividedBy18 + dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY + 2 * dist.yDividedBy9 + dist.yDividedBy18 + dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy18, firstCheckpointY + 2 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY + dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY + dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9 + dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy9 + dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX - 2 * dist.xDividedBy9 + dist.xDividedBy18 - 2 * dist.yDividedBy9, firstCheckpointY - 2 * dist.yDividedBy9 + dist.yDividedBy18 - 2 * dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX - 3 * dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy9, firstCheckpointY - 3 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX - 3 * dist.xDividedBy9, firstCheckpointY - 3 * dist.yDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX - 3 * dist.xDividedBy9 + dist.yDividedBy9, firstCheckpointY - 3 * dist.yDividedBy9 + dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX - 3 * dist.xDividedBy9 + 2 * dist.yDividedBy9, firstCheckpointY - 3 * dist.yDividedBy9 + 2 * dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX - 2 * dist.xDividedBy9 + 3 * dist.yDividedBy9, firstCheckpointY - 2 * dist.yDividedBy9 + 3 * dist.xDividedBy9, 0)
    }
    __TS__ArrayForEach(
        self.images,
        function(____, img)
            img:SetImageRenderAlways(true)
            img:ShowImage(true)
        end
    )
end
return ____exports
