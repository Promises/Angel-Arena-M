--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____VoidPriest = require("app.src.World.Entity.Tower.Races.Void.VoidPriest")
local VoidPriest = ____VoidPriest.VoidPriest
local ____VoidFissure = require("app.src.World.Entity.Tower.Races.Void.VoidFissure")
local VoidFissure = ____VoidFissure.VoidFissure
local ____VoidWorshipper = require("app.src.World.Entity.Tower.Races.Void.VoidWorshipper")
local VoidWorshipper = ____VoidWorshipper.VoidWorshipper
local ____VoidBeing = require("app.src.World.Entity.Tower.Races.Void.VoidBeing")
local VoidBeing = ____VoidBeing.VoidBeing
local ____VoidCorrupter = require("app.src.World.Entity.Tower.Races.Void.VoidCorrupter")
local VoidCorrupter = ____VoidCorrupter.VoidCorrupter
local ____VoidWorshipperHusk = require("app.src.World.Entity.Tower.Races.Void.VoidWorshipperHusk")
local VoidWorshipperHusk = ____VoidWorshipperHusk.VoidWorshipperHusk
____exports.VoidTowers = {}
local VoidTowers = ____exports.VoidTowers
VoidTowers.name = "VoidTowers"
VoidTowers.__index = VoidTowers
VoidTowers.prototype = {}
VoidTowers.prototype.__index = VoidTowers.prototype
VoidTowers.prototype.constructor = VoidTowers
VoidTowers.____super = RaceTowers
setmetatable(VoidTowers, VoidTowers.____super)
setmetatable(VoidTowers.prototype, VoidTowers.____super.prototype)
function VoidTowers.new(...)
    local self = setmetatable({}, VoidTowers.prototype)
    self:____constructor(...)
    return self
end
function VoidTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("h02F"),
        VoidPriest
    )
    list:add(
        FourCC("h01M"),
        VoidFissure
    )
    list:add(
        FourCC("h02G"),
        VoidWorshipper
    )
    list:add(
        FourCC("h02S"),
        VoidWorshipperHusk
    )
    list:add(
        FourCC("h00T"),
        VoidBeing
    )
    list:add(
        FourCC("h01A"),
        VoidCorrupter
    )
end
return ____exports
