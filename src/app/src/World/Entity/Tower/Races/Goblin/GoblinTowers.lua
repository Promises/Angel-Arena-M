--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____GoblinMineLayer = require("app.src.World.Entity.Tower.Races.Goblin.GoblinMineLayer")
local GoblinMineLayer = ____GoblinMineLayer.GoblinMineLayer
local ____GoblinTinkerer = require("app.src.World.Entity.Tower.Races.Goblin.GoblinTinkerer")
local GoblinTinkerer = ____GoblinTinkerer.GoblinTinkerer
local ____GoblinBlademaster = require("app.src.World.Entity.Tower.Races.Goblin.GoblinBlademaster")
local GoblinBlademaster = ____GoblinBlademaster.GoblinBlademaster
local ____GoblinSapper = require("app.src.World.Entity.Tower.Races.Goblin.GoblinSapper")
local GoblinSapper = ____GoblinSapper.GoblinSapper
local ____GoblinAlchemist = require("app.src.World.Entity.Tower.Races.Goblin.GoblinAlchemist")
local GoblinAlchemist = ____GoblinAlchemist.GoblinAlchemist
____exports.GoblinTowers = {}
local GoblinTowers = ____exports.GoblinTowers
GoblinTowers.name = "GoblinTowers"
GoblinTowers.__index = GoblinTowers
GoblinTowers.prototype = {}
GoblinTowers.prototype.__index = GoblinTowers.prototype
GoblinTowers.prototype.constructor = GoblinTowers
GoblinTowers.____super = RaceTowers
setmetatable(GoblinTowers, GoblinTowers.____super)
setmetatable(GoblinTowers.prototype, GoblinTowers.____super.prototype)
function GoblinTowers.new(...)
    local self = setmetatable({}, GoblinTowers.prototype)
    self:____constructor(...)
    return self
end
function GoblinTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("o01R"),
        GoblinMineLayer
    )
    list:add(
        FourCC("o01S"),
        GoblinTinkerer
    )
    list:add(
        FourCC("o01P"),
        GoblinBlademaster
    )
    list:add(
        FourCC("o01M"),
        GoblinSapper
    )
    list:add(
        FourCC("o01O"),
        GoblinAlchemist
    )
end
return ____exports
