--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.BronzeDragon = {}
local BronzeDragon = ____exports.BronzeDragon
BronzeDragon.name = "BronzeDragon"
BronzeDragon.__index = BronzeDragon
BronzeDragon.prototype = {}
BronzeDragon.prototype.__index = __TS__Index(BronzeDragon.prototype)
BronzeDragon.prototype.__newindex = __TS__NewIndex(BronzeDragon.prototype)
BronzeDragon.prototype.constructor = BronzeDragon
BronzeDragon.____super = Tower
setmetatable(BronzeDragon, BronzeDragon.____super)
setmetatable(BronzeDragon.prototype, BronzeDragon.____super.prototype)
function BronzeDragon.new(...)
    local self = setmetatable({}, BronzeDragon.prototype)
    self:____constructor(...)
    return self
end
function BronzeDragon.prototype.GenericAttack(self)
    IssueTargetOrderBJ(
        GetAttacker(),
        "slow",
        GetAttackedUnitBJ()
    )
end
return ____exports
