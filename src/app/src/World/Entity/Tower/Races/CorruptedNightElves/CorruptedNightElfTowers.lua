--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____CorruptedTreeofLife = require("app.src.World.Entity.Tower.Races.CorruptedNightElves.CorruptedTreeofLife")
local CorruptedTreeofLife = ____CorruptedTreeofLife.CorruptedTreeofLife
local ____CorruptedAncientProtector = require("app.src.World.Entity.Tower.Races.CorruptedNightElves.CorruptedAncientProtector")
local CorruptedAncientProtector = ____CorruptedAncientProtector.CorruptedAncientProtector
____exports.CorruptedNightElfTowers = {}
local CorruptedNightElfTowers = ____exports.CorruptedNightElfTowers
CorruptedNightElfTowers.name = "CorruptedNightElfTowers"
CorruptedNightElfTowers.__index = CorruptedNightElfTowers
CorruptedNightElfTowers.prototype = {}
CorruptedNightElfTowers.prototype.__index = CorruptedNightElfTowers.prototype
CorruptedNightElfTowers.prototype.constructor = CorruptedNightElfTowers
CorruptedNightElfTowers.____super = RaceTowers
setmetatable(CorruptedNightElfTowers, CorruptedNightElfTowers.____super)
setmetatable(CorruptedNightElfTowers.prototype, CorruptedNightElfTowers.____super.prototype)
function CorruptedNightElfTowers.new(...)
    local self = setmetatable({}, CorruptedNightElfTowers.prototype)
    self:____constructor(...)
    return self
end
function CorruptedNightElfTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("n00P"),
        CorruptedTreeofLife
    )
    list:add(
        FourCC("n00L"),
        CorruptedAncientProtector
    )
end
return ____exports
