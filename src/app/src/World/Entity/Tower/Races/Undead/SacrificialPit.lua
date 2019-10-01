--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.SacrificialPit = {}
local SacrificialPit = ____exports.SacrificialPit
SacrificialPit.name = "SacrificialPit"
SacrificialPit.__index = SacrificialPit
SacrificialPit.prototype = {}
SacrificialPit.prototype.__index = __TS__Index(SacrificialPit.prototype)
SacrificialPit.prototype.__newindex = __TS__NewIndex(SacrificialPit.prototype)
SacrificialPit.prototype.constructor = SacrificialPit
SacrificialPit.____super = Tower
setmetatable(SacrificialPit, SacrificialPit.____super)
setmetatable(SacrificialPit.prototype, SacrificialPit.____super.prototype)
function SacrificialPit.new(...)
    local self = setmetatable({}, SacrificialPit.prototype)
    self:____constructor(...)
    return self
end
function SacrificialPit.prototype.PassiveCreepDiesInAreaEffect(self, dyingCreep)
    local loc = dyingCreep:getLocation()
    local dummy = CreateUnitAtLoc(
        self.owner.wcPlayer,
        FourCC("u008"),
        loc,
        bj_UNIT_FACING
    )
    UnitAddAbilityBJ(
        FourCC("A08P"),
        dummy
    )
    IssuePointOrderLocBJ(dummy, "rainoffire", loc)
    UnitApplyTimedLifeBJ(
        3,
        FourCC("BTLF"),
        dummy
    )
    RemoveLocation(loc)
end
return ____exports
