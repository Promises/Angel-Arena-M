--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____KodoBeast = require("app.src.World.Entity.Tower.Races.ShrineOfBuffs.KodoBeast")
local KodoBeast = ____KodoBeast.KodoBeast
____exports.ShrineOfBuffsTowers = {}
local ShrineOfBuffsTowers = ____exports.ShrineOfBuffsTowers
ShrineOfBuffsTowers.name = "ShrineOfBuffsTowers"
ShrineOfBuffsTowers.__index = ShrineOfBuffsTowers
ShrineOfBuffsTowers.prototype = {}
ShrineOfBuffsTowers.prototype.__index = ShrineOfBuffsTowers.prototype
ShrineOfBuffsTowers.prototype.constructor = ShrineOfBuffsTowers
ShrineOfBuffsTowers.____super = RaceTowers
setmetatable(ShrineOfBuffsTowers, ShrineOfBuffsTowers.____super)
setmetatable(ShrineOfBuffsTowers.prototype, ShrineOfBuffsTowers.____super.prototype)
function ShrineOfBuffsTowers.new(...)
    local self = setmetatable({}, ShrineOfBuffsTowers.prototype)
    self:____constructor(...)
    return self
end
function ShrineOfBuffsTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("oC58"),
        KodoBeast
    )
end
return ____exports
