--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.OgreMagi = {}
local OgreMagi = ____exports.OgreMagi
OgreMagi.name = "OgreMagi"
OgreMagi.__index = OgreMagi
OgreMagi.prototype = {}
OgreMagi.prototype.__index = __TS__Index(OgreMagi.prototype)
OgreMagi.prototype.__newindex = __TS__NewIndex(OgreMagi.prototype)
OgreMagi.prototype.constructor = OgreMagi
OgreMagi.____super = Tower
setmetatable(OgreMagi, OgreMagi.____super)
setmetatable(OgreMagi.prototype, OgreMagi.____super.prototype)
function OgreMagi.new(...)
    local self = setmetatable({}, OgreMagi.prototype)
    self:____constructor(...)
    return self
end
function OgreMagi.prototype.Action(self)
    local y = GetUnitY(self.tower)
    local x = GetUnitX(self.tower)
    local dummy = CreateUnit(
        self.owner.wcPlayer,
        FourCC("u008"),
        x,
        y,
        0
    )
    UnitApplyTimedLifeBJ(
        1,
        FourCC("BTLF"),
        dummy
    )
    UnitAddAbilityBJ(
        FourCC("A036"),
        dummy
    )
    IssueImmediateOrderBJ(dummy, "battleroar")
end
function OgreMagi.prototype.GetTickModulo(self)
    return 99
end
return ____exports
