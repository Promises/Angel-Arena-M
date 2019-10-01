--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Queue = {}
local Queue = ____exports.Queue
Queue.name = "Queue"
Queue.__index = Queue
Queue.prototype = {}
Queue.prototype.__index = Queue.prototype
Queue.prototype.constructor = Queue
function Queue.new(...)
    local self = setmetatable({}, Queue.prototype)
    self:____constructor(...)
    return self
end
function Queue.prototype.____constructor(self)
    self._store = {}
end
function Queue.prototype.push(self, val)
    __TS__ArrayPush(self._store, val)
end
function Queue.prototype.pop(self)
    return __TS__ArrayShift(self._store)
end
function Queue.prototype.size(self)
    return #self._store
end
return ____exports
