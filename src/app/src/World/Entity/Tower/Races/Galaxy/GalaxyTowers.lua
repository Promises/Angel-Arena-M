--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____MoonDancer = require("app.src.World.Entity.Tower.Races.Galaxy.MoonDancer")
local MoonDancer = ____MoonDancer.MoonDancer
local ____StarChaser = require("app.src.World.Entity.Tower.Races.Galaxy.StarChaser")
local StarChaser = ____StarChaser.StarChaser
local ____CelestialMist = require("app.src.World.Entity.Tower.Races.Galaxy.CelestialMist")
local CelestialMist = ____CelestialMist.CelestialMist
____exports.GalaxyTowers = {}
local GalaxyTowers = ____exports.GalaxyTowers
GalaxyTowers.name = "GalaxyTowers"
GalaxyTowers.__index = GalaxyTowers
GalaxyTowers.prototype = {}
GalaxyTowers.prototype.__index = GalaxyTowers.prototype
GalaxyTowers.prototype.constructor = GalaxyTowers
GalaxyTowers.____super = RaceTowers
setmetatable(GalaxyTowers, GalaxyTowers.____super)
setmetatable(GalaxyTowers.prototype, GalaxyTowers.____super.prototype)
function GalaxyTowers.new(...)
    local self = setmetatable({}, GalaxyTowers.prototype)
    self:____constructor(...)
    return self
end
function GalaxyTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("e00K"),
        MoonDancer
    )
    list:add(
        FourCC("e00P"),
        StarChaser
    )
    list:add(
        FourCC("e00R"),
        CelestialMist
    )
end
return ____exports
