--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.LowTide = {}
local LowTide = ____exports.LowTide
LowTide.name = "LowTide"
LowTide.__index = LowTide
LowTide.prototype = {}
LowTide.prototype.__index = __TS__Index(LowTide.prototype)
LowTide.prototype.__newindex = __TS__NewIndex(LowTide.prototype)
LowTide.prototype.constructor = LowTide
LowTide.____super = Tower
setmetatable(LowTide, LowTide.____super)
setmetatable(LowTide.prototype, LowTide.____super.prototype)
function LowTide.new(...)
    local self = setmetatable({}, LowTide.prototype)
    self:____constructor(...)
    return self
end
function LowTide.prototype.EndOfRoundAction(self)
    if GetUnitStateSwap(UNIT_STATE_MANA, self.tower) == 2 then
        self:Upgrade(
            FourCC("u029")
        )
    else
        SetUnitManaBJ(
            self.tower,
            GetUnitStateSwap(UNIT_STATE_MANA, self.tower) + 1
        )
    end
end
return ____exports
