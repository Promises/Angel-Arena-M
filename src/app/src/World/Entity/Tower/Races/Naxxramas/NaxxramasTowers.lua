--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____CitadelOfNaxxramas = require("app.src.World.Entity.Tower.Races.Naxxramas.CitadelOfNaxxramas")
local CitadelOfNaxxramas = ____CitadelOfNaxxramas.CitadelOfNaxxramas
local ____StalaggFeugen = require("app.src.World.Entity.Tower.Races.Naxxramas.StalaggFeugen")
local StalaggFeugen = ____StalaggFeugen.StalaggFeugen
local ____KelThuzad = require("app.src.World.Entity.Tower.Races.Naxxramas.KelThuzad")
local KelThuzad = ____KelThuzad.KelThuzad
local ____Sapphiron = require("app.src.World.Entity.Tower.Races.Naxxramas.Sapphiron")
local Sapphiron = ____Sapphiron.Sapphiron
local ____Maexxna = require("app.src.World.Entity.Tower.Races.Naxxramas.Maexxna")
local Maexxna = ____Maexxna.Maexxna
local ____Thaddius = require("app.src.World.Entity.Tower.Races.Naxxramas.Thaddius")
local Thaddius = ____Thaddius.Thaddius
____exports.NaxxramasTowers = {}
local NaxxramasTowers = ____exports.NaxxramasTowers
NaxxramasTowers.name = "NaxxramasTowers"
NaxxramasTowers.__index = NaxxramasTowers
NaxxramasTowers.prototype = {}
NaxxramasTowers.prototype.__index = NaxxramasTowers.prototype
NaxxramasTowers.prototype.constructor = NaxxramasTowers
NaxxramasTowers.____super = RaceTowers
setmetatable(NaxxramasTowers, NaxxramasTowers.____super)
setmetatable(NaxxramasTowers.prototype, NaxxramasTowers.____super.prototype)
function NaxxramasTowers.new(...)
    local self = setmetatable({}, NaxxramasTowers.prototype)
    self:____constructor(...)
    return self
end
function NaxxramasTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("oC7C"),
        CitadelOfNaxxramas
    )
    list:add(
        FourCC("oC7D"),
        StalaggFeugen
    )
    list:add(
        FourCC("oC7E"),
        StalaggFeugen
    )
    list:add(
        FourCC("oC7K"),
        KelThuzad
    )
    list:add(
        FourCC("oC7J"),
        Sapphiron
    )
    list:add(
        FourCC("oC7G"),
        Maexxna
    )
    list:add(
        FourCC("oC7F"),
        Thaddius
    )
end
return ____exports
