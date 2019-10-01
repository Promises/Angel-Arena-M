--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____Adventurer = require("app.src.World.Entity.Tower.Races.AllianceOfBlades.Adventurer")
local Adventurer = ____Adventurer.Adventurer
local ____Scavenger = require("app.src.World.Entity.Tower.Races.AllianceOfBlades.Scavenger")
local Scavenger = ____Scavenger.Scavenger
____exports.AllianceOfBladesTowers = {}
local AllianceOfBladesTowers = ____exports.AllianceOfBladesTowers
AllianceOfBladesTowers.name = "AllianceOfBladesTowers"
AllianceOfBladesTowers.__index = AllianceOfBladesTowers
AllianceOfBladesTowers.prototype = {}
AllianceOfBladesTowers.prototype.__index = AllianceOfBladesTowers.prototype
AllianceOfBladesTowers.prototype.constructor = AllianceOfBladesTowers
AllianceOfBladesTowers.____super = RaceTowers
setmetatable(AllianceOfBladesTowers, AllianceOfBladesTowers.____super)
setmetatable(AllianceOfBladesTowers.prototype, AllianceOfBladesTowers.____super.prototype)
function AllianceOfBladesTowers.new(...)
    local self = setmetatable({}, AllianceOfBladesTowers.prototype)
    self:____constructor(...)
    return self
end
function AllianceOfBladesTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("n02T"),
        Adventurer
    )
    list:add(
        FourCC("n02X"),
        Scavenger
    )
end
return ____exports
