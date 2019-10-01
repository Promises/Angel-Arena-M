--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____AncientMonstrosity = require("app.src.World.Entity.Tower.Races.Unique.AncientMonstrosity")
local AncientMonstrosity = ____AncientMonstrosity.AncientMonstrosity
local ____Hydralisk = require("app.src.World.Entity.Tower.Races.Unique.Hydralisk")
local Hydralisk = ____Hydralisk.Hydralisk
local ____Marine = require("app.src.World.Entity.Tower.Races.Unique.Marine")
local Marine = ____Marine.Marine
local ____ProudMoore = require("app.src.World.Entity.Tower.Races.Unique.ProudMoore")
local ProudMoore = ____ProudMoore.ProudMoore
local ____Sammy = require("app.src.World.Entity.Tower.Races.Unique.Sammy")
local Sammy = ____Sammy.Sammy
local ____ZerglingHive = require("app.src.World.Entity.Tower.Races.Unique.ZerglingHive")
local ZerglingHive = ____ZerglingHive.ZerglingHive
local ____TheDarkness = require("app.src.World.Entity.Tower.Races.Unique.TheDarkness")
local TheDarkness = ____TheDarkness.TheDarkness
____exports.UniqueTowers = {}
local UniqueTowers = ____exports.UniqueTowers
UniqueTowers.name = "UniqueTowers"
UniqueTowers.__index = UniqueTowers
UniqueTowers.prototype = {}
UniqueTowers.prototype.__index = UniqueTowers.prototype
UniqueTowers.prototype.constructor = UniqueTowers
UniqueTowers.____super = RaceTowers
setmetatable(UniqueTowers, UniqueTowers.____super)
setmetatable(UniqueTowers.prototype, UniqueTowers.____super.prototype)
function UniqueTowers.new(...)
    local self = setmetatable({}, UniqueTowers.prototype)
    self:____constructor(...)
    return self
end
function UniqueTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("h02K"),
        AncientMonstrosity
    )
    list:add(
        FourCC("h02L"),
        Hydralisk
    )
    list:add(
        FourCC("h02H"),
        Marine
    )
    list:add(
        FourCC("h02J"),
        ProudMoore
    )
    list:add(
        FourCC("u03F"),
        Sammy
    )
    list:add(
        FourCC("u03E"),
        ZerglingHive
    )
    list:add(
        FourCC("u040"),
        TheDarkness
    )
end
return ____exports
