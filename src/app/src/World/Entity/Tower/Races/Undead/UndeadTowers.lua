--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____SacrificialPit = require("app.src.World.Entity.Tower.Races.Undead.SacrificialPit")
local SacrificialPit = ____SacrificialPit.SacrificialPit
____exports.UndeadTowers = {}
local UndeadTowers = ____exports.UndeadTowers
UndeadTowers.name = "UndeadTowers"
UndeadTowers.__index = UndeadTowers
UndeadTowers.prototype = {}
UndeadTowers.prototype.__index = UndeadTowers.prototype
UndeadTowers.prototype.constructor = UndeadTowers
UndeadTowers.____super = RaceTowers
setmetatable(UndeadTowers, UndeadTowers.____super)
setmetatable(UndeadTowers.prototype, UndeadTowers.____super.prototype)
function UndeadTowers.new(...)
    local self = setmetatable({}, UndeadTowers.prototype)
    self:____constructor(...)
    return self
end
function UndeadTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("h00R"),
        SacrificialPit
    )
end
return ____exports
