--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____AbstractHologramMaze = require("app.src.World.Holograms.AbstractHologramMaze")
local AbstractHologramMaze = ____AbstractHologramMaze.AbstractHologramMaze
local ____Image = require("app.src.JassOverrides.Image")
local Image = ____Image.Image
local ____HologramCheckpointDistance = require("app.src.World.Holograms.HologramCheckpointDistance")
local HologramCheckpointDistance = ____HologramCheckpointDistance.HologramCheckpointDistance
____exports.AdvancedHoloMaze = {}
local AdvancedHoloMaze = ____exports.AdvancedHoloMaze
AdvancedHoloMaze.name = "AdvancedHoloMaze"
AdvancedHoloMaze.__index = AdvancedHoloMaze
AdvancedHoloMaze.prototype = {}
AdvancedHoloMaze.prototype.__index = AdvancedHoloMaze.prototype
AdvancedHoloMaze.prototype.constructor = AdvancedHoloMaze
AdvancedHoloMaze.____super = AbstractHologramMaze
setmetatable(AdvancedHoloMaze, AdvancedHoloMaze.____super)
setmetatable(AdvancedHoloMaze.prototype, AdvancedHoloMaze.____super.prototype)
function AdvancedHoloMaze.new(...)
    local self = setmetatable({}, AdvancedHoloMaze.prototype)
    self:____constructor(...)
    return self
end
function AdvancedHoloMaze.prototype.____constructor(self, imagePath, firstCheckpointX, firstCheckpointY, secondCheckpointX, secondCheckpointY)
    AbstractHologramMaze.prototype.____constructor(self)
    local dist = HologramCheckpointDistance.new(secondCheckpointX - firstCheckpointX, secondCheckpointY - firstCheckpointY)
    self.images = {
        Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9, firstCheckpointY + dist.yDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy9, firstCheckpointY - dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9, firstCheckpointY - dist.yDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9 + dist.yDividedBy9, firstCheckpointY + 2 * dist.yDividedBy9 + dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + 3 * dist.xDividedBy9 + 2 * dist.yDividedBy9, firstCheckpointY + 3 * dist.yDividedBy9 + 2 * dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + 4 * dist.xDividedBy9 + 3 * dist.yDividedBy9, firstCheckpointY + 4 * dist.yDividedBy9 + 3 * dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + 5 * dist.xDividedBy9 + 4 * dist.yDividedBy9, firstCheckpointY + 5 * dist.yDividedBy9 + 4 * dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + 6 * dist.xDividedBy9 + 5 * dist.yDividedBy9, firstCheckpointY + 6 * dist.yDividedBy9 + 5 * dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + 7 * dist.xDividedBy9 + 5 * dist.yDividedBy9, firstCheckpointY + 7 * dist.yDividedBy9 + 5 * dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + 8 * dist.xDividedBy9 + 4 * dist.yDividedBy9, firstCheckpointY + 8 * dist.yDividedBy9 + 4 * dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + 9 * dist.xDividedBy9 + 3 * dist.yDividedBy9, firstCheckpointY + 9 * dist.yDividedBy9 + 3 * dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + 10 * dist.xDividedBy9 + 2 * dist.yDividedBy9, firstCheckpointY + 10 * dist.yDividedBy9 + 2 * dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + 11 * dist.xDividedBy9 + dist.yDividedBy9, firstCheckpointY + 11 * dist.yDividedBy9 + dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + 12 * dist.xDividedBy9, firstCheckpointY + 12 * dist.yDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + 13 * dist.xDividedBy9 - dist.yDividedBy9, firstCheckpointY + 13 * dist.yDividedBy9 - dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + 13 * dist.xDividedBy9 + dist.xDividedBy18 - 2 * dist.yDividedBy9, firstCheckpointY + 13 * dist.yDividedBy9 + dist.yDividedBy18 - 2 * dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy18 + dist.yDividedBy9, firstCheckpointY - dist.yDividedBy18 + dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy18 + dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + dist.yDividedBy18 + dist.xDividedBy9 + dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9 + dist.xDividedBy18 + 2 * dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + dist.yDividedBy9 + dist.yDividedBy18 + 2 * dist.xDividedBy9 + dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9 + dist.xDividedBy18 + 3 * dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + 2 * dist.yDividedBy9 + dist.yDividedBy18 + 3 * dist.xDividedBy9 + dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + 3 * dist.xDividedBy9 + dist.xDividedBy18 + 4 * dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + 3 * dist.yDividedBy9 + dist.yDividedBy18 + 4 * dist.xDividedBy9 + dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9 + 5 * dist.yDividedBy9, firstCheckpointY + 2 * dist.yDividedBy9 + 5 * dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9 + 4 * dist.yDividedBy9, firstCheckpointY + dist.yDividedBy9 + 4 * dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + 3 * dist.yDividedBy9, firstCheckpointY + 3 * dist.xDividedBy9, 0),
        Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9 + 5 * dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + dist.yDividedBy9 + 5 * dist.xDividedBy9 + dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9 + 3 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy9 + 3 * dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX - 2 * dist.xDividedBy9 + 2 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - 2 * dist.yDividedBy9 + 2 * dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX - 2 * dist.xDividedBy9 - dist.xDividedBy18 + dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - 2 * dist.yDividedBy9 - dist.yDividedBy18 + dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX - 2 * dist.xDividedBy9 - dist.xDividedBy18 - dist.yDividedBy18, firstCheckpointY - 2 * dist.yDividedBy9 - dist.yDividedBy18 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9 - dist.xDividedBy18 - dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy9 - dist.yDividedBy18 - dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9 - dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY + dist.yDividedBy9 - dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9 - dist.xDividedBy18 - dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY + 2 * dist.yDividedBy9 - dist.yDividedBy18 - dist.xDividedBy9 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + 3 * dist.xDividedBy9 - dist.xDividedBy18 - dist.yDividedBy18, firstCheckpointY + 3 * dist.yDividedBy9 - dist.yDividedBy18 - dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + 4 * dist.xDividedBy9 - dist.xDividedBy18 + dist.yDividedBy18, firstCheckpointY + 4 * dist.yDividedBy9 - dist.yDividedBy18 + dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + 5 * dist.xDividedBy9 - dist.xDividedBy18 + dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + 5 * dist.yDividedBy9 - dist.yDividedBy18 + dist.xDividedBy9 + dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + 6 * dist.xDividedBy9 - dist.xDividedBy18 + 2 * dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + 6 * dist.yDividedBy9 - dist.yDividedBy18 + 2 * dist.xDividedBy9 + dist.xDividedBy18, 0),
        Image.new(imagePath, 192, firstCheckpointX + 7 * dist.xDividedBy9 - dist.xDividedBy18 + 3 * dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + 7 * dist.yDividedBy9 - dist.yDividedBy18 + 3 * dist.xDividedBy9 + dist.xDividedBy18, 0)
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
