--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.AbstractHologramMaze = {}
local AbstractHologramMaze = ____exports.AbstractHologramMaze
AbstractHologramMaze.name = "AbstractHologramMaze"
AbstractHologramMaze.__index = AbstractHologramMaze
AbstractHologramMaze.prototype = {}
AbstractHologramMaze.prototype.__index = AbstractHologramMaze.prototype
AbstractHologramMaze.prototype.constructor = AbstractHologramMaze
function AbstractHologramMaze.new(...)
    local self = setmetatable({}, AbstractHologramMaze.prototype)
    self:____constructor(...)
    return self
end
function AbstractHologramMaze.prototype.____constructor(self)
    self.images = {}
end
function AbstractHologramMaze.prototype.Destroy(self)
    local img = table.remove(self.images)
    while img ~= nil do
        img:Destroy()
        img = table.remove(self.images)
    end
end
return ____exports
