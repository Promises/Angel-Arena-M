--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.GrowthLvl2 = {}
local GrowthLvl2 = ____exports.GrowthLvl2
GrowthLvl2.name = "GrowthLvl2"
GrowthLvl2.__index = GrowthLvl2
GrowthLvl2.prototype = {}
GrowthLvl2.prototype.__index = __TS__Index(GrowthLvl2.prototype)
GrowthLvl2.prototype.__newindex = __TS__NewIndex(GrowthLvl2.prototype)
GrowthLvl2.prototype.constructor = GrowthLvl2
GrowthLvl2.____super = Tower
setmetatable(GrowthLvl2, GrowthLvl2.____super)
setmetatable(GrowthLvl2.prototype, GrowthLvl2.____super.prototype)
function GrowthLvl2.new(...)
    local self = setmetatable({}, GrowthLvl2.prototype)
    self:____constructor(...)
    return self
end
function GrowthLvl2.prototype.____constructor(self, tower, owner, game)
    Tower.prototype.____constructor(self, tower, owner, game)
    SetUnitAbilityLevelSwapped(
        FourCC("A0CG"),
        self.tower,
        2
    )
    SetUnitAbilityLevelSwapped(
        FourCC("S00A"),
        self.tower,
        2
    )
end
return ____exports
