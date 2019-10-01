--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.AncientProtector = {}
local AncientProtector = ____exports.AncientProtector
AncientProtector.name = "AncientProtector"
AncientProtector.__index = AncientProtector
AncientProtector.prototype = {}
AncientProtector.prototype.__index = __TS__Index(AncientProtector.prototype)
AncientProtector.prototype.__newindex = __TS__NewIndex(AncientProtector.prototype)
AncientProtector.prototype.constructor = AncientProtector
AncientProtector.____super = Tower
setmetatable(AncientProtector, AncientProtector.____super)
setmetatable(AncientProtector.prototype, AncientProtector.____super.prototype)
function AncientProtector.new(...)
    local self = setmetatable({}, AncientProtector.prototype)
    self:____constructor(...)
    return self
end
function AncientProtector.prototype.GenericAttack(self)
    local u = GetAttacker()
    if u == self.tower then
        if not (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) >= 30) then
            return
        end
        if not (UnitInventoryCount(self.tower) <= 1) then
            return
        end
        SetUnitManaPercentBJ(self.tower, 0)
        local roll = Util:RandomInt(1, 3)
        local ____switch5 = roll
        if ____switch5 == 1 then
            goto ____switch5_case_0
        end
        if ____switch5 == 2 then
            goto ____switch5_case_1
        end
        if ____switch5 == 3 then
            goto ____switch5_case_2
        end
        goto ____switch5_end
        ::____switch5_case_0::
        do
            UnitAddItemByIdSwapped(
                FourCC("I023"),
                self.tower
            )
            goto ____switch5_end
        end
        ::____switch5_case_1::
        do
            UnitAddItemByIdSwapped(
                FourCC("I021"),
                self.tower
            )
            goto ____switch5_end
        end
        ::____switch5_case_2::
        do
            UnitAddItemByIdSwapped(
                FourCC("I022"),
                self.tower
            )
            goto ____switch5_end
        end
        ::____switch5_end::
    end
end
return ____exports
