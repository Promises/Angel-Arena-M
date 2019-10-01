--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.GrowthLvl3 = {}
local GrowthLvl3 = ____exports.GrowthLvl3
GrowthLvl3.name = "GrowthLvl3"
GrowthLvl3.__index = GrowthLvl3
GrowthLvl3.prototype = {}
GrowthLvl3.prototype.__index = __TS__Index(GrowthLvl3.prototype)
GrowthLvl3.prototype.__newindex = __TS__NewIndex(GrowthLvl3.prototype)
GrowthLvl3.prototype.constructor = GrowthLvl3
GrowthLvl3.____super = Tower
setmetatable(GrowthLvl3, GrowthLvl3.____super)
setmetatable(GrowthLvl3.prototype, GrowthLvl3.____super.prototype)
function GrowthLvl3.new(...)
    local self = setmetatable({}, GrowthLvl3.prototype)
    self:____constructor(...)
    return self
end
function GrowthLvl3.prototype.____constructor(self, tower, owner, game)
    Tower.prototype.____constructor(self, tower, owner, game)
    SetUnitAbilityLevelSwapped(
        FourCC("A0CG"),
        self.tower,
        3
    )
    SetUnitAbilityLevelSwapped(
        FourCC("S00A"),
        self.tower,
        3
    )
end
return ____exports
