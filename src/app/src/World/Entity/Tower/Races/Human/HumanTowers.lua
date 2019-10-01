--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____VenomTower = require("app.src.World.Entity.Tower.Races.Human.VenomTower")
local VenomTower = ____VenomTower.VenomTower
local ____SirGalahad = require("app.src.World.Entity.Tower.Races.Human.SirGalahad")
local SirGalahad = ____SirGalahad.SirGalahad
____exports.HumanTowers = {}
local HumanTowers = ____exports.HumanTowers
HumanTowers.name = "HumanTowers"
HumanTowers.__index = HumanTowers
HumanTowers.prototype = {}
HumanTowers.prototype.__index = HumanTowers.prototype
HumanTowers.prototype.constructor = HumanTowers
HumanTowers.____super = RaceTowers
setmetatable(HumanTowers, HumanTowers.____super)
setmetatable(HumanTowers.prototype, HumanTowers.____super.prototype)
function HumanTowers.new(...)
    local self = setmetatable({}, HumanTowers.prototype)
    self:____constructor(...)
    return self
end
function HumanTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("h045"),
        VenomTower
    )
    list:add(
        FourCC("n05C"),
        SirGalahad
    )
end
return ____exports
