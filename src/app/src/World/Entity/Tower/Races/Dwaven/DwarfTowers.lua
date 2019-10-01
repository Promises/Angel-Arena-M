--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____DwarfKing = require("app.src.World.Entity.Tower.Races.Dwaven.DwarfKing")
local DwarfKing = ____DwarfKing.DwarfKing
local ____FlyingDwarf = require("app.src.World.Entity.Tower.Races.Dwaven.FlyingDwarf")
local FlyingDwarf = ____FlyingDwarf.FlyingDwarf
____exports.DwarfTowers = {}
local DwarfTowers = ____exports.DwarfTowers
DwarfTowers.name = "DwarfTowers"
DwarfTowers.__index = DwarfTowers
DwarfTowers.prototype = {}
DwarfTowers.prototype.__index = DwarfTowers.prototype
DwarfTowers.prototype.constructor = DwarfTowers
DwarfTowers.____super = RaceTowers
setmetatable(DwarfTowers, DwarfTowers.____super)
setmetatable(DwarfTowers.prototype, DwarfTowers.____super.prototype)
function DwarfTowers.new(...)
    local self = setmetatable({}, DwarfTowers.prototype)
    self:____constructor(...)
    return self
end
function DwarfTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("n05Q"),
        DwarfKing
    )
    list:add(
        FourCC("n05N"),
        FlyingDwarf
    )
end
return ____exports
