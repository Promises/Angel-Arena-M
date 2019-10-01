--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.TowerMap = {}
local TowerMap = ____exports.TowerMap
TowerMap.name = "TowerMap"
TowerMap.__index = TowerMap
TowerMap.prototype = {}
TowerMap.prototype.__index = TowerMap.prototype
TowerMap.prototype.constructor = TowerMap
TowerMap.____super = Map
setmetatable(TowerMap, TowerMap.____super)
setmetatable(TowerMap.prototype, TowerMap.____super.prototype)
function TowerMap.new(...)
    local self = setmetatable({}, TowerMap.prototype)
    self:____constructor(...)
    return self
end
function TowerMap.prototype.____constructor(self, ...)
    Map.prototype.____constructor(self, ...)
    self.duplicateKeys = {}
    self._keyArray = {}
    self.add = function(____, key, value)
        if self:has(key) then
            __TS__ArrayPush(self.duplicateKeys, key)
            return self
        end
        __TS__ArrayPush(self._keyArray, key)
        return self:set(key, value)
    end
end
function TowerMap.prototype.GetArray(self)
    return self._keyArray
end
return ____exports
