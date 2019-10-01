--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____EarthPandaren = require("app.src.World.Entity.Tower.Races.Tavern.EarthPandaren")
local EarthPandaren = ____EarthPandaren.EarthPandaren
local ____StormPandaren = require("app.src.World.Entity.Tower.Races.Tavern.StormPandaren")
local StormPandaren = ____StormPandaren.StormPandaren
local ____FirePandaren = require("app.src.World.Entity.Tower.Races.Tavern.FirePandaren")
local FirePandaren = ____FirePandaren.FirePandaren
____exports.TavernTowers = {}
local TavernTowers = ____exports.TavernTowers
TavernTowers.name = "TavernTowers"
TavernTowers.__index = TavernTowers
TavernTowers.prototype = {}
TavernTowers.prototype.__index = TavernTowers.prototype
TavernTowers.prototype.constructor = TavernTowers
TavernTowers.____super = RaceTowers
setmetatable(TavernTowers, TavernTowers.____super)
setmetatable(TavernTowers.prototype, TavernTowers.____super.prototype)
function TavernTowers.new(...)
    local self = setmetatable({}, TavernTowers.prototype)
    self:____constructor(...)
    return self
end
function TavernTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("h01F"),
        EarthPandaren
    )
    list:add(
        FourCC("h01J"),
        StormPandaren
    )
    list:add(
        FourCC("h01I"),
        FirePandaren
    )
end
return ____exports
