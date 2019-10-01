--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.FlyingDwarf = {}
local FlyingDwarf = ____exports.FlyingDwarf
FlyingDwarf.name = "FlyingDwarf"
FlyingDwarf.__index = FlyingDwarf
FlyingDwarf.prototype = {}
FlyingDwarf.prototype.__index = __TS__Index(FlyingDwarf.prototype)
FlyingDwarf.prototype.__newindex = __TS__NewIndex(FlyingDwarf.prototype)
FlyingDwarf.prototype.constructor = FlyingDwarf
FlyingDwarf.____super = Tower
setmetatable(FlyingDwarf, FlyingDwarf.____super)
setmetatable(FlyingDwarf.prototype, FlyingDwarf.____super.prototype)
function FlyingDwarf.new(...)
    local self = setmetatable({}, FlyingDwarf.prototype)
    self:____constructor(...)
    return self
end
function FlyingDwarf.prototype.GenericAttack(self)
    self:CastSpellOnAttackedUnitLocation("clusterrockets")
end
return ____exports
