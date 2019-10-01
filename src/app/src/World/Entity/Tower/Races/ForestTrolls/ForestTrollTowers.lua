--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____ForestTrollHighPriest = require("app.src.World.Entity.Tower.Races.ForestTrolls.ForestTrollHighPriest")
local ForestTrollHighPriest = ____ForestTrollHighPriest.ForestTrollHighPriest
____exports.ForestTrollTowers = {}
local ForestTrollTowers = ____exports.ForestTrollTowers
ForestTrollTowers.name = "ForestTrollTowers"
ForestTrollTowers.__index = ForestTrollTowers
ForestTrollTowers.prototype = {}
ForestTrollTowers.prototype.__index = ForestTrollTowers.prototype
ForestTrollTowers.prototype.constructor = ForestTrollTowers
ForestTrollTowers.____super = RaceTowers
setmetatable(ForestTrollTowers, ForestTrollTowers.____super)
setmetatable(ForestTrollTowers.prototype, ForestTrollTowers.____super.prototype)
function ForestTrollTowers.new(...)
    local self = setmetatable({}, ForestTrollTowers.prototype)
    self:____constructor(...)
    return self
end
function ForestTrollTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("n03I"),
        ForestTrollHighPriest
    )
end
return ____exports
