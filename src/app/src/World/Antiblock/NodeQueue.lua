--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.NodeQueue = {}
local NodeQueue = ____exports.NodeQueue
NodeQueue.name = "NodeQueue"
NodeQueue.__index = NodeQueue
NodeQueue.prototype = {}
NodeQueue.prototype.__index = NodeQueue.prototype
NodeQueue.prototype.constructor = NodeQueue
function NodeQueue.new(...)
    local self = setmetatable({}, NodeQueue.prototype)
    self:____constructor(...)
    return self
end
function NodeQueue.prototype.____constructor(self)
    self._nodes = {}
    self._i = 0
end
function NodeQueue.prototype.push(self, node)
    __TS__ArrayPush(self._nodes, node)
end
function NodeQueue.prototype.empty(self)
    return self._i >= #self._nodes
end
function NodeQueue.prototype.front(self)
    return self._nodes[self._i + 1]
end
function NodeQueue.prototype.pop(self)
    __TS__ArrayShift(self._nodes)
end
return ____exports
