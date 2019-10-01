--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.IceTrollEmperor = {}
local IceTrollEmperor = ____exports.IceTrollEmperor
IceTrollEmperor.name = "IceTrollEmperor"
IceTrollEmperor.__index = IceTrollEmperor
IceTrollEmperor.prototype = {}
IceTrollEmperor.prototype.__index = __TS__Index(IceTrollEmperor.prototype)
IceTrollEmperor.prototype.__newindex = __TS__NewIndex(IceTrollEmperor.prototype)
IceTrollEmperor.prototype.constructor = IceTrollEmperor
IceTrollEmperor.____super = Tower
setmetatable(IceTrollEmperor, IceTrollEmperor.____super)
setmetatable(IceTrollEmperor.prototype, IceTrollEmperor.____super.prototype)
function IceTrollEmperor.new(...)
    local self = setmetatable({}, IceTrollEmperor.prototype)
    self:____constructor(...)
    return self
end
function IceTrollEmperor.prototype.Action(self)
    if self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.isWaveInProgress then
        self:CastBlizzard()
    end
end
function IceTrollEmperor.prototype.GetTickModulo(self)
    return 10
end
function IceTrollEmperor.prototype.CastBlizzard(self)
    local unitX = GetUnitX(self.tower)
    local unitY = GetUnitY(self.tower)
    local x = unitX + GetRandomReal(0, 500) - 250
    local y = unitY + GetRandomReal(0, 500) - 250
    local dummy = CreateUnit(
        self.owner.wcPlayer,
        FourCC("u008"),
        x,
        y,
        0
    )
    UnitApplyTimedLifeBJ(
        2,
        FourCC("BTLF"),
        dummy
    )
    UnitAddAbilityBJ(
        FourCC("A0CO"),
        dummy
    )
    IssuePointOrder(dummy, "blizzard", x, y)
end
return ____exports
