--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.IceTrollPriest = {}
local IceTrollPriest = ____exports.IceTrollPriest
IceTrollPriest.name = "IceTrollPriest"
IceTrollPriest.__index = IceTrollPriest
IceTrollPriest.prototype = {}
IceTrollPriest.prototype.__index = __TS__Index(IceTrollPriest.prototype)
IceTrollPriest.prototype.__newindex = __TS__NewIndex(IceTrollPriest.prototype)
IceTrollPriest.prototype.constructor = IceTrollPriest
IceTrollPriest.____super = Tower
setmetatable(IceTrollPriest, IceTrollPriest.____super)
setmetatable(IceTrollPriest.prototype, IceTrollPriest.____super.prototype)
function IceTrollPriest.new(...)
    local self = setmetatable({}, IceTrollPriest.prototype)
    self:____constructor(...)
    return self
end
function IceTrollPriest.prototype.____constructor(self, ...)
    Tower.prototype.____constructor(self, ...)
    self.targets = {}
end
function IceTrollPriest.prototype.FrostNova(self)
    local loc = GetUnitLoc(self.tower)
    local grp = GetUnitsInRangeOfLocMatching(
        500,
        loc,
        Condition(
            function() return self:InitializeFrostNovaGroupConditions() end
        )
    )
    if #self.targets > 0 then
        local indx = Util:RandomInt(0, #self.targets - 1)
        local x = GetUnitX(self.tower)
        local y = GetUnitY(self.tower)
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
            FourCC("A08J"),
            dummy
        )
        IssueTargetOrderBJ(dummy, "frostnova", self.targets[indx + 1])
    end
    RemoveLocation(loc)
    DestroyGroup(grp)
end
function IceTrollPriest.prototype.Action(self)
    self:FrostNova()
end
function IceTrollPriest.prototype.GetTickModulo(self)
    return 49
end
function IceTrollPriest.prototype.InitializeFrostNovaGroupConditions(self)
    if not Util:isUnitCreep(
        GetFilterUnit()
    ) then
        return false
    end
    if not IsUnitAliveBJ(
        GetFilterUnit()
    ) then
        return false
    end
    __TS__ArrayPush(
        self.targets,
        GetFilterUnit()
    )
    return true
end
return ____exports
