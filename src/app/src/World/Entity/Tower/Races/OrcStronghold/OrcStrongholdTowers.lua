--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____Rokhan = require("app.src.World.Entity.Tower.Races.OrcStronghold.Rokhan")
local Rokhan = ____Rokhan.Rokhan
local ____WarchiefThrall = require("app.src.World.Entity.Tower.Races.OrcStronghold.WarchiefThrall")
local WarchiefThrall = ____WarchiefThrall.WarchiefThrall
local ____Berserker = require("app.src.World.Entity.Tower.Races.OrcStronghold.Berserker")
local Berserker = ____Berserker.Berserker
____exports.OrcStrongholdTowers = {}
local OrcStrongholdTowers = ____exports.OrcStrongholdTowers
OrcStrongholdTowers.name = "OrcStrongholdTowers"
OrcStrongholdTowers.__index = OrcStrongholdTowers
OrcStrongholdTowers.prototype = {}
OrcStrongholdTowers.prototype.__index = OrcStrongholdTowers.prototype
OrcStrongholdTowers.prototype.constructor = OrcStrongholdTowers
OrcStrongholdTowers.____super = RaceTowers
setmetatable(OrcStrongholdTowers, OrcStrongholdTowers.____super)
setmetatable(OrcStrongholdTowers.prototype, OrcStrongholdTowers.____super.prototype)
function OrcStrongholdTowers.new(...)
    local self = setmetatable({}, OrcStrongholdTowers.prototype)
    self:____constructor(...)
    return self
end
function OrcStrongholdTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("h002"),
        Rokhan
    )
    list:add(
        FourCC("oC65"),
        WarchiefThrall
    )
    list:add(
        FourCC("o00E"),
        Berserker
    )
end
return ____exports
