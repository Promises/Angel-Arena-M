--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____Kael = require("app.src.World.Entity.Tower.Races.HighElven.Kael")
local Kael = ____Kael.Kael
____exports.HighElvenTowers = {}
local HighElvenTowers = ____exports.HighElvenTowers
HighElvenTowers.name = "HighElvenTowers"
HighElvenTowers.__index = HighElvenTowers
HighElvenTowers.prototype = {}
HighElvenTowers.prototype.__index = HighElvenTowers.prototype
HighElvenTowers.prototype.constructor = HighElvenTowers
HighElvenTowers.____super = RaceTowers
setmetatable(HighElvenTowers, HighElvenTowers.____super)
setmetatable(HighElvenTowers.prototype, HighElvenTowers.____super.prototype)
function HighElvenTowers.new(...)
    local self = setmetatable({}, HighElvenTowers.prototype)
    self:____constructor(...)
    return self
end
function HighElvenTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("o00N"),
        Kael
    )
end
return ____exports
