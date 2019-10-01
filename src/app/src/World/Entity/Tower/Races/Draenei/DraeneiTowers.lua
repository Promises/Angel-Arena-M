--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____DraeneiSeer = require("app.src.World.Entity.Tower.Races.Draenei.DraeneiSeer")
local DraeneiSeer = ____DraeneiSeer.DraeneiSeer
local ____Akama = require("app.src.World.Entity.Tower.Races.Draenei.Akama")
local Akama = ____Akama.Akama
local ____SalamanderLord = require("app.src.World.Entity.Tower.Races.Draenei.SalamanderLord")
local SalamanderLord = ____SalamanderLord.SalamanderLord
____exports.DraeneiTowers = {}
local DraeneiTowers = ____exports.DraeneiTowers
DraeneiTowers.name = "DraeneiTowers"
DraeneiTowers.__index = DraeneiTowers
DraeneiTowers.prototype = {}
DraeneiTowers.prototype.__index = DraeneiTowers.prototype
DraeneiTowers.prototype.constructor = DraeneiTowers
DraeneiTowers.____super = RaceTowers
setmetatable(DraeneiTowers, DraeneiTowers.____super)
setmetatable(DraeneiTowers.prototype, DraeneiTowers.____super.prototype)
function DraeneiTowers.new(...)
    local self = setmetatable({}, DraeneiTowers.prototype)
    self:____constructor(...)
    return self
end
function DraeneiTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("h04F"),
        DraeneiSeer
    )
    list:add(
        FourCC("h00I"),
        Akama
    )
    list:add(
        FourCC("h04I"),
        SalamanderLord
    )
end
return ____exports
