--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.ForestTrollHighPriest = {}
local ForestTrollHighPriest = ____exports.ForestTrollHighPriest
ForestTrollHighPriest.name = "ForestTrollHighPriest"
ForestTrollHighPriest.__index = ForestTrollHighPriest
ForestTrollHighPriest.prototype = {}
ForestTrollHighPriest.prototype.__index = __TS__Index(ForestTrollHighPriest.prototype)
ForestTrollHighPriest.prototype.__newindex = __TS__NewIndex(ForestTrollHighPriest.prototype)
ForestTrollHighPriest.prototype.constructor = ForestTrollHighPriest
ForestTrollHighPriest.____super = Tower
setmetatable(ForestTrollHighPriest, ForestTrollHighPriest.____super)
setmetatable(ForestTrollHighPriest.prototype, ForestTrollHighPriest.____super.prototype)
function ForestTrollHighPriest.new(...)
    local self = setmetatable({}, ForestTrollHighPriest.prototype)
    self:____constructor(...)
    return self
end
function ForestTrollHighPriest.prototype.GenericAttack(self)
    self:CastSpellOnAttackedUnitLocation("monsoon")
end
return ____exports
