--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____FelGuard = require("app.src.World.Entity.Tower.Races.Demon.FelGuard")
local FelGuard = ____FelGuard.FelGuard
local ____Mannoroth = require("app.src.World.Entity.Tower.Races.Demon.Mannoroth")
local Mannoroth = ____Mannoroth.Mannoroth
local ____SummoningShrine = require("app.src.World.Entity.Tower.Races.Demon.SummoningShrine")
local SummoningShrine = ____SummoningShrine.SummoningShrine
local ____KilJaeden = require("app.src.World.Entity.Tower.Races.Demon.KilJaeden")
local KilJaeden = ____KilJaeden.KilJaeden
local ____DemonizedDreadlord = require("app.src.World.Entity.Tower.Races.Demon.DemonizedDreadlord")
local DemonizedDreadlord = ____DemonizedDreadlord.DemonizedDreadlord
____exports.DemonTowers = {}
local DemonTowers = ____exports.DemonTowers
DemonTowers.name = "DemonTowers"
DemonTowers.__index = DemonTowers
DemonTowers.prototype = {}
DemonTowers.prototype.__index = DemonTowers.prototype
DemonTowers.prototype.constructor = DemonTowers
DemonTowers.____super = RaceTowers
setmetatable(DemonTowers, DemonTowers.____super)
setmetatable(DemonTowers.prototype, DemonTowers.____super.prototype)
function DemonTowers.new(...)
    local self = setmetatable({}, DemonTowers.prototype)
    self:____constructor(...)
    return self
end
function DemonTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("h03W"),
        FelGuard
    )
    list:add(
        FourCC("o00L"),
        Mannoroth
    )
    list:add(
        FourCC("n00U"),
        SummoningShrine
    )
    list:add(
        FourCC("eC93"),
        KilJaeden
    )
    list:add(
        FourCC("h00F"),
        DemonizedDreadlord
    )
end
return ____exports
