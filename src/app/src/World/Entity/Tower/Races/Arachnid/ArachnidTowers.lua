--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____AcidSpittingSpider = require("app.src.World.Entity.Tower.Races.Arachnid.AcidSpittingSpider")
local AcidSpittingSpider = ____AcidSpittingSpider.AcidSpittingSpider
local ____NerubianBehemoth = require("app.src.World.Entity.Tower.Races.Arachnid.NerubianBehemoth")
local NerubianBehemoth = ____NerubianBehemoth.NerubianBehemoth
local ____ParasiticBroodmother = require("app.src.World.Entity.Tower.Races.Arachnid.ParasiticBroodmother")
local ParasiticBroodmother = ____ParasiticBroodmother.ParasiticBroodmother
local ____CrackedBarrel = require("app.src.World.Entity.Tower.Races.Arachnid.CrackedBarrel")
local CrackedBarrel = ____CrackedBarrel.CrackedBarrel
____exports.ArachnidTowers = {}
local ArachnidTowers = ____exports.ArachnidTowers
ArachnidTowers.name = "ArachnidTowers"
ArachnidTowers.__index = ArachnidTowers
ArachnidTowers.prototype = {}
ArachnidTowers.prototype.__index = ArachnidTowers.prototype
ArachnidTowers.prototype.constructor = ArachnidTowers
ArachnidTowers.____super = RaceTowers
setmetatable(ArachnidTowers, ArachnidTowers.____super)
setmetatable(ArachnidTowers.prototype, ArachnidTowers.____super.prototype)
function ArachnidTowers.new(...)
    local self = setmetatable({}, ArachnidTowers.prototype)
    self:____constructor(...)
    return self
end
function ArachnidTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("o019"),
        AcidSpittingSpider
    )
    list:add(
        FourCC("h00W"),
        NerubianBehemoth
    )
    list:add(
        FourCC("o01A"),
        ParasiticBroodmother
    )
    list:add(
        FourCC("h03T"),
        CrackedBarrel
    )
end
return ____exports
