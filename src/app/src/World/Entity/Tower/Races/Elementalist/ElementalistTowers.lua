--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____Undead = require("app.src.World.Entity.Tower.Races.Elementalist.Undead")
local Undead = ____Undead.Undead
local ____Sapling = require("app.src.World.Entity.Tower.Races.Elementalist.Sapling")
local Sapling = ____Sapling.Sapling
local ____Undead2 = require("app.src.World.Entity.Tower.Races.Elementalist.Undead2")
local Undead2 = ____Undead2.Undead2
local ____LowTide = require("app.src.World.Entity.Tower.Races.Elementalist.LowTide")
local LowTide = ____LowTide.LowTide
local ____Bubbles = require("app.src.World.Entity.Tower.Races.Elementalist.Bubbles")
local Bubbles = ____Bubbles.Bubbles
local ____UnchargedRune = require("app.src.World.Entity.Tower.Races.Elementalist.UnchargedRune")
local UnchargedRune = ____UnchargedRune.UnchargedRune
local ____DormantPheonixEgg = require("app.src.World.Entity.Tower.Races.Elementalist.DormantPheonixEgg")
local DormantPheonixEgg = ____DormantPheonixEgg.DormantPheonixEgg
local ____Blaze = require("app.src.World.Entity.Tower.Races.Elementalist.Blaze")
local Blaze = ____Blaze.Blaze
local ____Tornado = require("app.src.World.Entity.Tower.Races.Elementalist.Tornado")
local Tornado = ____Tornado.Tornado
local ____HighTide = require("app.src.World.Entity.Tower.Races.Elementalist.HighTide")
local HighTide = ____HighTide.HighTide
local ____Plague = require("app.src.World.Entity.Tower.Races.Elementalist.Plague")
local Plague = ____Plague.Plague
____exports.ElementalistTowers = {}
local ElementalistTowers = ____exports.ElementalistTowers
ElementalistTowers.name = "ElementalistTowers"
ElementalistTowers.__index = ElementalistTowers
ElementalistTowers.prototype = {}
ElementalistTowers.prototype.__index = ElementalistTowers.prototype
ElementalistTowers.prototype.constructor = ElementalistTowers
ElementalistTowers.____super = RaceTowers
setmetatable(ElementalistTowers, ElementalistTowers.____super)
setmetatable(ElementalistTowers.prototype, ElementalistTowers.____super.prototype)
function ElementalistTowers.new(...)
    local self = setmetatable({}, ElementalistTowers.prototype)
    self:____constructor(...)
    return self
end
function ElementalistTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("n00A"),
        UnchargedRune
    )
    list:add(
        FourCC("n026"),
        Undead
    )
    list:add(
        FourCC("u038"),
        Undead2
    )
    list:add(
        FourCC("u01D"),
        DormantPheonixEgg
    )
    list:add(
        FourCC("u01F"),
        LowTide
    )
    list:add(
        FourCC("u029"),
        HighTide
    )
    list:add(
        FourCC("u021"),
        Sapling
    )
    list:add(
        FourCC("u022"),
        Tornado
    )
    list:add(
        FourCC("u026"),
        Bubbles
    )
    list:add(
        FourCC("u027"),
        Blaze
    )
    list:add(
        FourCC("u020"),
        Plague
    )
end
return ____exports
