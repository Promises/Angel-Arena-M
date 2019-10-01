--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.RockGiant = {}
local RockGiant = ____exports.RockGiant
RockGiant.name = "RockGiant"
RockGiant.__index = RockGiant
RockGiant.prototype = {}
RockGiant.prototype.__index = __TS__Index(RockGiant.prototype)
RockGiant.prototype.__newindex = __TS__NewIndex(RockGiant.prototype)
RockGiant.prototype.constructor = RockGiant
RockGiant.____super = Tower
setmetatable(RockGiant, RockGiant.____super)
setmetatable(RockGiant.prototype, RockGiant.____super.prototype)
function RockGiant.new(...)
    local self = setmetatable({}, RockGiant.prototype)
    self:____constructor(...)
    return self
end
function RockGiant.prototype.KillingAction(self)
    local u = GetKillingUnitBJ()
    local target = GetDyingUnit()
    if u == self.tower and target then
        local mana = GetUnitStateSwap(UNIT_STATE_MANA, self.tower) + 1
        SetUnitManaBJ(self.tower, mana)
        if mana > 39 then
            SetUnitManaBJ(self.tower, 0)
            self:Upgrade(
                FourCC("h00A")
            )
        end
    end
end
return ____exports
