--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____OgreWarrior = require("app.src.World.Entity.Tower.Races.Giants.OgreWarrior")
local OgreWarrior = ____OgreWarrior.OgreWarrior
local ____FleshGolem = require("app.src.World.Entity.Tower.Races.Giants.FleshGolem")
local FleshGolem = ____FleshGolem.FleshGolem
local ____RockGiant = require("app.src.World.Entity.Tower.Races.Giants.RockGiant")
local RockGiant = ____RockGiant.RockGiant
local ____SeaGiant = require("app.src.World.Entity.Tower.Races.Giants.SeaGiant")
local SeaGiant = ____SeaGiant.SeaGiant
local ____OgreMagi = require("app.src.World.Entity.Tower.Races.Giants.OgreMagi")
local OgreMagi = ____OgreMagi.OgreMagi
local ____AncientGolem = require("app.src.World.Entity.Tower.Races.Giants.AncientGolem")
local AncientGolem = ____AncientGolem.AncientGolem
local ____IronGolemStatue = require("app.src.World.Entity.Tower.Races.Giants.IronGolemStatue")
local IronGolemStatue = ____IronGolemStatue.IronGolemStatue
____exports.GiantsTowers = {}
local GiantsTowers = ____exports.GiantsTowers
GiantsTowers.name = "GiantsTowers"
GiantsTowers.__index = GiantsTowers
GiantsTowers.prototype = {}
GiantsTowers.prototype.__index = GiantsTowers.prototype
GiantsTowers.prototype.constructor = GiantsTowers
GiantsTowers.____super = RaceTowers
setmetatable(GiantsTowers, GiantsTowers.____super)
setmetatable(GiantsTowers.prototype, GiantsTowers.____super.prototype)
function GiantsTowers.new(...)
    local self = setmetatable({}, GiantsTowers.prototype)
    self:____constructor(...)
    return self
end
function GiantsTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("oC35"),
        OgreWarrior
    )
    list:add(
        FourCC("o00G"),
        FleshGolem
    )
    list:add(
        FourCC("hC53"),
        RockGiant
    )
    list:add(
        FourCC("o00Y"),
        SeaGiant
    )
    list:add(
        FourCC("hC97"),
        OgreMagi
    )
    list:add(
        FourCC("o00X"),
        AncientGolem
    )
    list:add(
        FourCC("oC26"),
        IronGolemStatue
    )
end
return ____exports
