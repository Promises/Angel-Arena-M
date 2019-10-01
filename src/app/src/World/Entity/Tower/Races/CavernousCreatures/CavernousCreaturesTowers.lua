--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____CavernDruid = require("app.src.World.Entity.Tower.Races.CavernousCreatures.CavernDruid")
local CavernDruid = ____CavernDruid.CavernDruid
local ____CavernHermit = require("app.src.World.Entity.Tower.Races.CavernousCreatures.CavernHermit")
local CavernHermit = ____CavernHermit.CavernHermit
local ____CavernMushroom = require("app.src.World.Entity.Tower.Races.CavernousCreatures.CavernMushroom")
local CavernMushroom = ____CavernMushroom.CavernMushroom
local ____CavernRevenant = require("app.src.World.Entity.Tower.Races.CavernousCreatures.CavernRevenant")
local CavernRevenant = ____CavernRevenant.CavernRevenant
local ____CavernTurtle = require("app.src.World.Entity.Tower.Races.CavernousCreatures.CavernTurtle")
local CavernTurtle = ____CavernTurtle.CavernTurtle
local ____GrowthLvl2 = require("app.src.World.Entity.Tower.Races.CavernousCreatures.Growth.GrowthLvl2")
local GrowthLvl2 = ____GrowthLvl2.GrowthLvl2
local ____GrowthLvl3 = require("app.src.World.Entity.Tower.Races.CavernousCreatures.Growth.GrowthLvl3")
local GrowthLvl3 = ____GrowthLvl3.GrowthLvl3
____exports.CavernousCreaturesTowers = {}
local CavernousCreaturesTowers = ____exports.CavernousCreaturesTowers
CavernousCreaturesTowers.name = "CavernousCreaturesTowers"
CavernousCreaturesTowers.__index = CavernousCreaturesTowers
CavernousCreaturesTowers.prototype = {}
CavernousCreaturesTowers.prototype.__index = CavernousCreaturesTowers.prototype
CavernousCreaturesTowers.prototype.constructor = CavernousCreaturesTowers
CavernousCreaturesTowers.____super = RaceTowers
setmetatable(CavernousCreaturesTowers, CavernousCreaturesTowers.____super)
setmetatable(CavernousCreaturesTowers.prototype, CavernousCreaturesTowers.____super.prototype)
function CavernousCreaturesTowers.new(...)
    local self = setmetatable({}, CavernousCreaturesTowers.prototype)
    self:____constructor(...)
    return self
end
function CavernousCreaturesTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("h04Q"),
        CavernDruid
    )
    list:add(
        FourCC("h04M"),
        CavernHermit
    )
    list:add(
        FourCC("h04T"),
        CavernMushroom
    )
    list:add(
        FourCC("h04O"),
        CavernRevenant
    )
    list:add(
        FourCC("h04N"),
        CavernTurtle
    )
    list:add(
        FourCC("h04S"),
        GrowthLvl2
    )
    list:add(
        FourCC("h04L"),
        GrowthLvl3
    )
end
return ____exports
