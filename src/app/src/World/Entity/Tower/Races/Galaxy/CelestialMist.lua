--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.CelestialMist = {}
local CelestialMist = ____exports.CelestialMist
CelestialMist.name = "CelestialMist"
CelestialMist.__index = CelestialMist
CelestialMist.prototype = {}
CelestialMist.prototype.__index = __TS__Index(CelestialMist.prototype)
CelestialMist.prototype.__newindex = __TS__NewIndex(CelestialMist.prototype)
CelestialMist.prototype.constructor = CelestialMist
CelestialMist.____super = Tower
setmetatable(CelestialMist, CelestialMist.____super)
setmetatable(CelestialMist.prototype, CelestialMist.____super.prototype)
function CelestialMist.new(...)
    local self = setmetatable({}, CelestialMist.prototype)
    self:____constructor(...)
    return self
end
function CelestialMist.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "starfall"
    )
end
return ____exports
