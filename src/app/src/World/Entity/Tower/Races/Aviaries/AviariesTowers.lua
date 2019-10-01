--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____Wyvern = require("app.src.World.Entity.Tower.Races.Aviaries.Wyvern")
local Wyvern = ____Wyvern.Wyvern
local ____Gyrocopter = require("app.src.World.Entity.Tower.Races.Aviaries.Gyrocopter")
local Gyrocopter = ____Gyrocopter.Gyrocopter
____exports.AviariesTowers = {}
local AviariesTowers = ____exports.AviariesTowers
AviariesTowers.name = "AviariesTowers"
AviariesTowers.__index = AviariesTowers
AviariesTowers.prototype = {}
AviariesTowers.prototype.__index = AviariesTowers.prototype
AviariesTowers.prototype.constructor = AviariesTowers
AviariesTowers.____super = RaceTowers
setmetatable(AviariesTowers, AviariesTowers.____super)
setmetatable(AviariesTowers.prototype, AviariesTowers.____super.prototype)
function AviariesTowers.new(...)
    local self = setmetatable({}, AviariesTowers.prototype)
    self:____constructor(...)
    return self
end
function AviariesTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("oC60"),
        Wyvern
    )
    list:add(
        FourCC("hC36"),
        Gyrocopter
    )
end
return ____exports
