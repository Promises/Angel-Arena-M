--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____BronzeDragonWhelp = require("app.src.World.Entity.Tower.Races.Dragons.BronzeDragonWhelp")
local BronzeDragonWhelp = ____BronzeDragonWhelp.BronzeDragonWhelp
local ____BronzeDrake = require("app.src.World.Entity.Tower.Races.Dragons.BronzeDrake")
local BronzeDrake = ____BronzeDrake.BronzeDrake
local ____BronzeDragon = require("app.src.World.Entity.Tower.Races.Dragons.BronzeDragon")
local BronzeDragon = ____BronzeDragon.BronzeDragon
____exports.DragonTowers = {}
local DragonTowers = ____exports.DragonTowers
DragonTowers.name = "DragonTowers"
DragonTowers.__index = DragonTowers
DragonTowers.prototype = {}
DragonTowers.prototype.__index = DragonTowers.prototype
DragonTowers.prototype.constructor = DragonTowers
DragonTowers.____super = RaceTowers
setmetatable(DragonTowers, DragonTowers.____super)
setmetatable(DragonTowers.prototype, DragonTowers.____super.prototype)
function DragonTowers.new(...)
    local self = setmetatable({}, DragonTowers.prototype)
    self:____constructor(...)
    return self
end
function DragonTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("o00M"),
        BronzeDragonWhelp
    )
    list:add(
        FourCC("o01F"),
        BronzeDrake
    )
    list:add(
        FourCC("o01K"),
        BronzeDragon
    )
end
return ____exports
