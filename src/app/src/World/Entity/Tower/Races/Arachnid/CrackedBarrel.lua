--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.CrackedBarrel = {}
local CrackedBarrel = ____exports.CrackedBarrel
CrackedBarrel.name = "CrackedBarrel"
CrackedBarrel.__index = CrackedBarrel
CrackedBarrel.prototype = {}
CrackedBarrel.prototype.__index = __TS__Index(CrackedBarrel.prototype)
CrackedBarrel.prototype.__newindex = __TS__NewIndex(CrackedBarrel.prototype)
CrackedBarrel.prototype.constructor = CrackedBarrel
CrackedBarrel.____super = Tower
setmetatable(CrackedBarrel, CrackedBarrel.____super)
setmetatable(CrackedBarrel.prototype, CrackedBarrel.____super.prototype)
function CrackedBarrel.new(...)
    local self = setmetatable({}, CrackedBarrel.prototype)
    self:____constructor(...)
    return self
end
function CrackedBarrel.prototype.MaxCount(self)
    return 12
end
return ____exports
