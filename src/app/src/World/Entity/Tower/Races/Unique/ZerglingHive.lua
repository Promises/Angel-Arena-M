--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.ZerglingHive = {}
local ZerglingHive = ____exports.ZerglingHive
ZerglingHive.name = "ZerglingHive"
ZerglingHive.__index = ZerglingHive
ZerglingHive.prototype = {}
ZerglingHive.prototype.__index = __TS__Index(ZerglingHive.prototype)
ZerglingHive.prototype.__newindex = __TS__NewIndex(ZerglingHive.prototype)
ZerglingHive.prototype.constructor = ZerglingHive
ZerglingHive.____super = Tower
setmetatable(ZerglingHive, ZerglingHive.____super)
setmetatable(ZerglingHive.prototype, ZerglingHive.____super.prototype)
function ZerglingHive.new(...)
    local self = setmetatable({}, ZerglingHive.prototype)
    self:____constructor(...)
    return self
end
function ZerglingHive.prototype.GenericAttack(self)
    if Util:RandomInt(0, 100) >= 98 and self.owner.zerglings <= 24 then
        local tempUnit = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u042"),
            GetUnitX(self.tower),
            GetUnitY(self.tower),
            bj_UNIT_FACING
        )
        do
            local ____obj, ____index = self.owner, "zerglings"
            ____obj[____index] = ____obj[____index] + 1
        end
        UnitApplyTimedLifeBJ(
            10,
            FourCC("BTLF"),
            tempUnit
        )
    end
end
return ____exports
