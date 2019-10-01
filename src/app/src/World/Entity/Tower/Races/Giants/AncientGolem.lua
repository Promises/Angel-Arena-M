--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.AncientGolem = {}
local AncientGolem = ____exports.AncientGolem
AncientGolem.name = "AncientGolem"
AncientGolem.__index = AncientGolem
AncientGolem.prototype = {}
AncientGolem.prototype.__index = __TS__Index(AncientGolem.prototype)
AncientGolem.prototype.__newindex = __TS__NewIndex(AncientGolem.prototype)
AncientGolem.prototype.constructor = AncientGolem
AncientGolem.____super = Tower
setmetatable(AncientGolem, AncientGolem.____super)
setmetatable(AncientGolem.prototype, AncientGolem.____super.prototype)
function AncientGolem.new(...)
    local self = setmetatable({}, AncientGolem.prototype)
    self:____constructor(...)
    return self
end
function AncientGolem.prototype.Action(self)
    local mana = GetUnitStateSwap(UNIT_STATE_MANA, self.tower) + 1
    SetUnitManaBJ(self.tower, mana)
    BlzSetUnitBaseDamage(
        self.tower,
        BlzGetUnitBaseDamage(self.tower, 0) + 75,
        0
    )
    SetUnitScalePercent(self.tower, 30 + (mana * 10), 30 + (mana * 10), 30 + (mana * 10))
    if mana > 6 then
        self.game.towerTicker:RemoveTickingTower(self.UniqueID)
    end
end
function AncientGolem.prototype.GetTickModulo(self)
    return 599
end
return ____exports
