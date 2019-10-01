--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Hydralisk = {}
local Hydralisk = ____exports.Hydralisk
Hydralisk.name = "Hydralisk"
Hydralisk.__index = Hydralisk
Hydralisk.prototype = {}
Hydralisk.prototype.__index = __TS__Index(Hydralisk.prototype)
Hydralisk.prototype.__newindex = __TS__NewIndex(Hydralisk.prototype)
Hydralisk.prototype.constructor = Hydralisk
Hydralisk.____super = Tower
setmetatable(Hydralisk, Hydralisk.____super)
setmetatable(Hydralisk.prototype, Hydralisk.____super.prototype)
function Hydralisk.new(...)
    local self = setmetatable({}, Hydralisk.prototype)
    self:____constructor(...)
    return self
end
function Hydralisk.prototype.KillingAction(self)
    local u = GetKillingUnitBJ()
    local target = GetDyingUnit()
    if u == self.tower and target then
        if GetUnitAbilityLevelSwapped(
            FourCC("A0EH"),
            self.tower
        ) <= 50 then
            IncUnitAbilityLevelSwapped(
                FourCC("A0EH"),
                self.tower
            )
        end
        if GetUnitAbilityLevelSwapped(
            FourCC("A0EI"),
            self.tower
        ) <= 50 then
            IncUnitAbilityLevelSwapped(
                FourCC("A0EI"),
                self.tower
            )
        end
    end
end
return ____exports
