--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.VenomTower = {}
local VenomTower = ____exports.VenomTower
VenomTower.name = "VenomTower"
VenomTower.__index = VenomTower
VenomTower.prototype = {}
VenomTower.prototype.__index = __TS__Index(VenomTower.prototype)
VenomTower.prototype.__newindex = __TS__NewIndex(VenomTower.prototype)
VenomTower.prototype.constructor = VenomTower
VenomTower.____super = Tower
setmetatable(VenomTower, VenomTower.____super)
setmetatable(VenomTower.prototype, VenomTower.____super.prototype)
function VenomTower.new(...)
    local self = setmetatable({}, VenomTower.prototype)
    self:____constructor(...)
    return self
end
function VenomTower.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if u == self.tower then
        IssueImmediateOrderBJ(self.tower, "stop")
    end
end
return ____exports
