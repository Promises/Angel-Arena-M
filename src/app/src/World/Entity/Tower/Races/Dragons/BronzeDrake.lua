--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.BronzeDrake = {}
local BronzeDrake = ____exports.BronzeDrake
BronzeDrake.name = "BronzeDrake"
BronzeDrake.__index = BronzeDrake
BronzeDrake.prototype = {}
BronzeDrake.prototype.__index = __TS__Index(BronzeDrake.prototype)
BronzeDrake.prototype.__newindex = __TS__NewIndex(BronzeDrake.prototype)
BronzeDrake.prototype.constructor = BronzeDrake
BronzeDrake.____super = Tower
setmetatable(BronzeDrake, BronzeDrake.____super)
setmetatable(BronzeDrake.prototype, BronzeDrake.____super.prototype)
function BronzeDrake.new(...)
    local self = setmetatable({}, BronzeDrake.prototype)
    self:____constructor(...)
    return self
end
function BronzeDrake.prototype.GenericAttack(self)
    IssueTargetOrderBJ(
        GetAttacker(),
        "slow",
        GetAttackedUnitBJ()
    )
end
return ____exports
