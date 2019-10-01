--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Rectangle = {}
local Rectangle = ____exports.Rectangle
Rectangle.name = "Rectangle"
Rectangle.__index = Rectangle
Rectangle.prototype = {}
Rectangle.prototype.____getters = {}
Rectangle.prototype.__index = __TS__Index(Rectangle.prototype)
Rectangle.prototype.constructor = Rectangle
function Rectangle.new(...)
    local self = setmetatable({}, Rectangle.prototype)
    self:____constructor(...)
    return self
end
function Rectangle.prototype.____constructor(self, area)
    self.area = area
end
function Rectangle.prototype.____getters.minX(self)
    return self.area[1]
end
function Rectangle.prototype.____getters.minY(self)
    return self.area[2]
end
function Rectangle.prototype.____getters.maxX(self)
    return self.area[3]
end
function Rectangle.prototype.____getters.maxY(self)
    return self.area[4]
end
function Rectangle.prototype.ContainsCreep(self, whichCreep)
    return self:ContainsUnit(whichCreep.creep)
end
function Rectangle.prototype.ContainsUnit(self, whichUnit)
    if GetUnitX(whichUnit) < self.area[1] then
        return false
    end
    if GetUnitX(whichUnit) > self.area[3] then
        return false
    end
    if GetUnitY(whichUnit) < self.area[2] then
        return false
    end
    if GetUnitY(whichUnit) > self.area[4] then
        return false
    end
    return true
end
function Rectangle.prototype.ContainsDestructable(self, destr)
    if destr:x() < self.area[1] then
        return false
    end
    if destr:x() > self.area[3] then
        return false
    end
    if destr:y() < self.area[2] then
        return false
    end
    if destr:y() > self.area[4] then
        return false
    end
    return true
end
function Rectangle.prototype.__tostring(self)
    return "{ x: " .. tostring(self.minX) .. "}, y: " .. tostring(self.minY) .. " }, { x: " .. tostring(self.maxX) .. ", y: " .. tostring(self.maxY) .. " }"
end
function Rectangle.prototype.toRect(self)
    return Rect(self.minX, self.minY, self.maxX, self.maxY)
end
function Rectangle.prototype.GetCenterX(self)
    local x1 = self.minX
    local x2 = self.maxX
    return (x1 + x2) / 2
end
function Rectangle.prototype.GetCenterY(self)
    local y1 = self.minY
    local y2 = self.maxY
    return (y1 + y2) / 2
end
return ____exports
