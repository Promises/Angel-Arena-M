--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.SirGalahad = {}
local SirGalahad = ____exports.SirGalahad
SirGalahad.name = "SirGalahad"
SirGalahad.__index = SirGalahad
SirGalahad.prototype = {}
SirGalahad.prototype.__index = __TS__Index(SirGalahad.prototype)
SirGalahad.prototype.__newindex = __TS__NewIndex(SirGalahad.prototype)
SirGalahad.prototype.constructor = SirGalahad
SirGalahad.____super = Tower
setmetatable(SirGalahad, SirGalahad.____super)
setmetatable(SirGalahad.prototype, SirGalahad.____super.prototype)
function SirGalahad.new(...)
    local self = setmetatable({}, SirGalahad.prototype)
    self:____constructor(...)
    return self
end
function SirGalahad.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "spiritwolf"
    )
end
return ____exports
