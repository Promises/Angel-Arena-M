--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____AbstractHologramMaze = require("app.src.World.Holograms.AbstractHologramMaze")
local AbstractHologramMaze = ____AbstractHologramMaze.AbstractHologramMaze
local ____Image = require("app.src.JassOverrides.Image")
local Image = ____Image.Image
local ____HologramCheckpointDistance = require("app.src.World.Holograms.HologramCheckpointDistance")
local HologramCheckpointDistance = ____HologramCheckpointDistance.HologramCheckpointDistance
____exports.SimpleHoloMaze = {}
local SimpleHoloMaze = ____exports.SimpleHoloMaze
SimpleHoloMaze.name = "SimpleHoloMaze"
SimpleHoloMaze.__index = SimpleHoloMaze
SimpleHoloMaze.prototype = {}
SimpleHoloMaze.prototype.__index = SimpleHoloMaze.prototype
SimpleHoloMaze.prototype.constructor = SimpleHoloMaze
SimpleHoloMaze.____super = AbstractHologramMaze
setmetatable(SimpleHoloMaze, SimpleHoloMaze.____super)
setmetatable(SimpleHoloMaze.prototype, SimpleHoloMaze.____super.prototype)
function SimpleHoloMaze.new(...)
    local self = setmetatable({}, SimpleHoloMaze.prototype)
    self:____constructor(...)
    return self
end
function SimpleHoloMaze.prototype.____constructor(self, imagePath, firstCheckpointX, firstCheckpointY, secondCheckpointX, secondCheckpointY)
    AbstractHologramMaze.prototype.____constructor(self)
    local dist = HologramCheckpointDistance.new(secondCheckpointX - firstCheckpointX, secondCheckpointY - firstCheckpointY)
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9, firstCheckpointY + dist.yDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9, firstCheckpointY + 2 * dist.yDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + 3 * dist.xDividedBy9, firstCheckpointY + 3 * dist.yDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + 4 * dist.xDividedBy9, firstCheckpointY + 4 * dist.yDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + 5 * dist.xDividedBy9, firstCheckpointY + 5 * dist.yDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + 6 * dist.xDividedBy9, firstCheckpointY + 6 * dist.yDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + 7 * dist.xDividedBy9, firstCheckpointY + 7 * dist.yDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy9, firstCheckpointY - dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9, firstCheckpointY - dist.yDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy9 - dist.xDividedBy18, firstCheckpointY - dist.yDividedBy18 + dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy9 + dist.yDividedBy18 + dist.xDividedBy18, firstCheckpointY + dist.yDividedBy18 + dist.xDividedBy9 + dist.xDividedBy18, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + 8 * dist.xDividedBy9, firstCheckpointY + 8 * dist.yDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy9 + 9 * dist.xDividedBy9, firstCheckpointY + 9 * dist.yDividedBy9 + dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + 10 * dist.xDividedBy9, firstCheckpointY + 10 * dist.yDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy9 + 9 * dist.xDividedBy9 + dist.xDividedBy18, firstCheckpointY + 9 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18, firstCheckpointY + dist.yDividedBy18 + dist.xDividedBy18 + dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 2 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 2 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 3 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 3 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 4 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 4 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 5 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 5 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 6 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 6 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 7 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 8 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 8 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 7 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 6 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 6 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 5 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 5 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 4 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 4 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 3 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 3 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 2 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 2 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
    )
    __TS__ArrayPush(
        self.images,
        Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
    )
    __TS__ArrayForEach(
        self.images,
        function(____, img)
            img:SetImageRenderAlways(true)
            img:ShowImage(true)
        end
    )
end
return ____exports
