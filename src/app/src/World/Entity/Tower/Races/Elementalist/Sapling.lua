--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Sapling = {}
local Sapling = ____exports.Sapling
Sapling.name = "Sapling"
Sapling.__index = Sapling
Sapling.prototype = {}
Sapling.prototype.__index = __TS__Index(Sapling.prototype)
Sapling.prototype.__newindex = __TS__NewIndex(Sapling.prototype)
Sapling.prototype.constructor = Sapling
Sapling.____super = Tower
setmetatable(Sapling, Sapling.____super)
setmetatable(Sapling.prototype, Sapling.____super.prototype)
function Sapling.new(...)
    local self = setmetatable({}, Sapling.prototype)
    self:____constructor(...)
    return self
end
function Sapling.prototype.EndOfRoundAction(self)
    if GetUnitStateSwap(UNIT_STATE_MANA, self.tower) == 5 then
        self:Upgrade(
            FourCC("u036")
        )
    else
        SetUnitManaBJ(
            self.tower,
            GetUnitStateSwap(UNIT_STATE_MANA, self.tower) + 1
        )
    end
end
return ____exports
