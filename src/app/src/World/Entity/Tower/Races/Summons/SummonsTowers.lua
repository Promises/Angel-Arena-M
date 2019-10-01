--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____Prawn = require("app.src.World.Entity.Tower.Races.Summons.Prawn")
local Prawn = ____Prawn.Prawn
local ____LavaSpawn = require("app.src.World.Entity.Tower.Races.Summons.LavaSpawn")
local LavaSpawn = ____LavaSpawn.LavaSpawn
____exports.SummonsTowers = {}
local SummonsTowers = ____exports.SummonsTowers
SummonsTowers.name = "SummonsTowers"
SummonsTowers.__index = SummonsTowers
SummonsTowers.prototype = {}
SummonsTowers.prototype.__index = SummonsTowers.prototype
SummonsTowers.prototype.constructor = SummonsTowers
SummonsTowers.____super = RaceTowers
setmetatable(SummonsTowers, SummonsTowers.____super)
setmetatable(SummonsTowers.prototype, SummonsTowers.____super.prototype)
function SummonsTowers.new(...)
    local self = setmetatable({}, SummonsTowers.prototype)
    self:____constructor(...)
    return self
end
function SummonsTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("h027"),
        Prawn
    )
    list:add(
        FourCC("h026"),
        LavaSpawn
    )
end
return ____exports
