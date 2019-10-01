--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.Node = {}
local Node = ____exports.Node
Node.name = "Node"
Node.__index = Node
Node.prototype = {}
Node.prototype.__index = Node.prototype
Node.prototype.constructor = Node
function Node.new(...)
    local self = setmetatable({}, Node.prototype)
    self:____constructor(...)
    return self
end
function Node.prototype.____constructor(self, x, y, distance)
    self.x = x
    self.y = y
    self.distance = distance
end
return ____exports
