--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____Magtheridon = require("app.src.World.Entity.Tower.Races.Outland.Magtheridon")
local Magtheridon = ____Magtheridon.Magtheridon
____exports.OutlandTowers = {}
local OutlandTowers = ____exports.OutlandTowers
OutlandTowers.name = "OutlandTowers"
OutlandTowers.__index = OutlandTowers
OutlandTowers.prototype = {}
OutlandTowers.prototype.__index = OutlandTowers.prototype
OutlandTowers.prototype.constructor = OutlandTowers
OutlandTowers.____super = RaceTowers
setmetatable(OutlandTowers, OutlandTowers.____super)
setmetatable(OutlandTowers.prototype, OutlandTowers.____super.prototype)
function OutlandTowers.new(...)
    local self = setmetatable({}, OutlandTowers.prototype)
    self:____constructor(...)
    return self
end
function OutlandTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("u01C"),
        Magtheridon
    )
end
return ____exports
