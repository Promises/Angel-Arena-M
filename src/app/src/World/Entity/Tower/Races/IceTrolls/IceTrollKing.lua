--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.IceTrollKing = {}
local IceTrollKing = ____exports.IceTrollKing
IceTrollKing.name = "IceTrollKing"
IceTrollKing.__index = IceTrollKing
IceTrollKing.prototype = {}
IceTrollKing.prototype.__index = __TS__Index(IceTrollKing.prototype)
IceTrollKing.prototype.__newindex = __TS__NewIndex(IceTrollKing.prototype)
IceTrollKing.prototype.constructor = IceTrollKing
IceTrollKing.____super = Tower
setmetatable(IceTrollKing, IceTrollKing.____super)
setmetatable(IceTrollKing.prototype, IceTrollKing.____super.prototype)
function IceTrollKing.new(...)
    local self = setmetatable({}, IceTrollKing.prototype)
    self:____constructor(...)
    return self
end
function IceTrollKing.prototype.____constructor(self, tower, owner, game)
    Tower.prototype.____constructor(self, tower, owner, game)
    self:AddCriticalStrike()
end
function IceTrollKing.prototype.AddCriticalStrike(self)
    local loc = GetUnitLoc(self.tower)
    local grp = GetUnitsInRangeOfLocMatching(
        182,
        loc,
        Condition(
            function() return self:InitializeCriticalStrikeGroupConditions() end
        )
    )
    RemoveLocation(loc)
    DestroyGroup(grp)
end
function IceTrollKing.prototype.Action(self)
    self:AddCriticalStrike()
end
function IceTrollKing.prototype.GetTickModulo(self)
    return 599
end
function IceTrollKing.prototype.InitializeCriticalStrikeGroupConditions(self)
    if not IsUnitType(
        GetFilterUnit(),
        UNIT_TYPE_STRUCTURE
    ) then
        return false
    end
    if GetFilterUnit() == self.tower then
        return false
    end
    if GetUnitAbilityLevel(
        GetFilterUnit(),
        FourCC("A0CN")
    ) > 0 then
        return false
    end
    UnitAddAbilityBJ(
        FourCC("A0CN"),
        GetFilterUnit()
    )
    return true
end
return ____exports
