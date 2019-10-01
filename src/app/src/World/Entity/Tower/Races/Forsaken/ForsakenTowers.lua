--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____GargoyleSpire = require("app.src.World.Entity.Tower.Races.Forsaken.GargoyleSpire")
local GargoyleSpire = ____GargoyleSpire.GargoyleSpire
local ____Varimathras = require("app.src.World.Entity.Tower.Races.Forsaken.Varimathras")
local Varimathras = ____Varimathras.Varimathras
____exports.ForsakenTowers = {}
local ForsakenTowers = ____exports.ForsakenTowers
ForsakenTowers.name = "ForsakenTowers"
ForsakenTowers.__index = ForsakenTowers
ForsakenTowers.prototype = {}
ForsakenTowers.prototype.__index = ForsakenTowers.prototype
ForsakenTowers.prototype.constructor = ForsakenTowers
ForsakenTowers.____super = RaceTowers
setmetatable(ForsakenTowers, ForsakenTowers.____super)
setmetatable(ForsakenTowers.prototype, ForsakenTowers.____super.prototype)
function ForsakenTowers.new(...)
    local self = setmetatable({}, ForsakenTowers.prototype)
    self:____constructor(...)
    return self
end
function ForsakenTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("u00F"),
        GargoyleSpire
    )
    list:add(
        FourCC("u012"),
        Varimathras
    )
end
return ____exports
