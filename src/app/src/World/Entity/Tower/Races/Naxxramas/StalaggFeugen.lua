--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.StalaggFeugen = {}
local StalaggFeugen = ____exports.StalaggFeugen
StalaggFeugen.name = "StalaggFeugen"
StalaggFeugen.__index = StalaggFeugen
StalaggFeugen.prototype = {}
StalaggFeugen.prototype.__index = __TS__Index(StalaggFeugen.prototype)
StalaggFeugen.prototype.__newindex = __TS__NewIndex(StalaggFeugen.prototype)
StalaggFeugen.prototype.constructor = StalaggFeugen
StalaggFeugen.____super = Tower
setmetatable(StalaggFeugen, StalaggFeugen.____super)
setmetatable(StalaggFeugen.prototype, StalaggFeugen.____super.prototype)
function StalaggFeugen.new(...)
    local self = setmetatable({}, StalaggFeugen.prototype)
    self:____constructor(...)
    return self
end
function StalaggFeugen.prototype.____constructor(self, tower, owner, game)
    Tower.prototype.____constructor(self, tower, owner, game)
    self:AddUpgrade()
end
function StalaggFeugen.prototype.AddUpgrade(self)
    local loc = GetUnitLoc(self.tower)
    local grp = GetUnitsInRangeOfLocMatching(
        182,
        loc,
        Condition(
            function() return self:InitializeUpgradeGroupConditions() end
        )
    )
    RemoveLocation(loc)
    DestroyGroup(grp)
end
function StalaggFeugen.prototype.Action(self)
    self:AddUpgrade()
end
function StalaggFeugen.prototype.GetTickModulo(self)
    return 599
end
function StalaggFeugen.prototype.InitializeUpgradeGroupConditions(self)
    if not IsUnitType(
        GetFilterUnit(),
        UNIT_TYPE_STRUCTURE
    ) then
        return false
    end
    if GetUnitTypeId(
        GetFilterUnit()
    ) ~= FourCC("oC7D") and GetUnitTypeId(
        GetFilterUnit()
    ) ~= FourCC("oC7E") then
        return false
    end
    if GetFilterUnit() == self.tower then
        return false
    end
    if GetUnitAbilityLevel(
        GetFilterUnit(),
        FourCC("A0F5")
    ) > 0 then
        return false
    end
    UnitAddAbilityBJ(
        FourCC("A0F5"),
        GetFilterUnit()
    )
    return true
end
return ____exports
