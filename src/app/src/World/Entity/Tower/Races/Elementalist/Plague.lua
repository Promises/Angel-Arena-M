--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Plague = {}
local Plague = ____exports.Plague
Plague.name = "Plague"
Plague.__index = Plague
Plague.prototype = {}
Plague.prototype.__index = __TS__Index(Plague.prototype)
Plague.prototype.__newindex = __TS__NewIndex(Plague.prototype)
Plague.prototype.constructor = Plague
Plague.____super = Tower
setmetatable(Plague, Plague.____super)
setmetatable(Plague.prototype, Plague.____super.prototype)
function Plague.new(...)
    local self = setmetatable({}, Plague.prototype)
    self:____constructor(...)
    return self
end
function Plague.prototype.PassiveCreepDiesInAreaEffect(self, dyingCreep)
    local loc = dyingCreep:getLocation()
    local dummy = CreateUnitAtLoc(
        self.owner.wcPlayer,
        FourCC("u008"),
        loc,
        bj_UNIT_FACING
    )
    UnitAddAbilityBJ(
        FourCC("A0DZ"),
        dummy
    )
    UnitApplyTimedLifeBJ(
        5,
        FourCC("BTLF"),
        dummy
    )
    RemoveLocation(loc)
end
return ____exports
