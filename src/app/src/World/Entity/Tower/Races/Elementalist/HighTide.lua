--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.HighTide = {}
local HighTide = ____exports.HighTide
HighTide.name = "HighTide"
HighTide.__index = HighTide
HighTide.prototype = {}
HighTide.prototype.__index = __TS__Index(HighTide.prototype)
HighTide.prototype.__newindex = __TS__NewIndex(HighTide.prototype)
HighTide.prototype.constructor = HighTide
HighTide.____super = Tower
setmetatable(HighTide, HighTide.____super)
setmetatable(HighTide.prototype, HighTide.____super.prototype)
function HighTide.new(...)
    local self = setmetatable({}, HighTide.prototype)
    self:____constructor(...)
    return self
end
function HighTide.prototype.EndOfRoundAction(self)
    self:Upgrade(
        FourCC("u01F")
    )
end
return ____exports
