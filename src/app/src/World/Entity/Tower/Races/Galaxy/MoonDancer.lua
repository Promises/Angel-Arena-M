--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.MoonDancer = {}
local MoonDancer = ____exports.MoonDancer
MoonDancer.name = "MoonDancer"
MoonDancer.__index = MoonDancer
MoonDancer.prototype = {}
MoonDancer.prototype.__index = __TS__Index(MoonDancer.prototype)
MoonDancer.prototype.__newindex = __TS__NewIndex(MoonDancer.prototype)
MoonDancer.prototype.constructor = MoonDancer
MoonDancer.____super = Tower
setmetatable(MoonDancer, MoonDancer.____super)
setmetatable(MoonDancer.prototype, MoonDancer.____super.prototype)
function MoonDancer.new(...)
    local self = setmetatable({}, MoonDancer.prototype)
    self:____constructor(...)
    return self
end
function MoonDancer.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if u == self.tower then
        local mana = GetUnitStateSwap(UNIT_STATE_MANA, self.tower) + 1
        SetUnitManaBJ(self.tower, mana)
        if mana > 4 then
            SetUnitManaBJ(self.tower, 0)
            self:DoSpell(self.game)
        end
    end
end
function MoonDancer.prototype.DoSpell(self, game)
    local target = game.gameDamageEngineGlobals.udg_DamageEventTarget
    if not target then
        return
    end
    local spellPoint = GetUnitLoc(target)
    local tempUnit = CreateUnitAtLoc(
        self.owner.wcPlayer,
        FourCC("u008"),
        spellPoint,
        bj_UNIT_FACING
    )
    UnitApplyTimedLifeBJ(
        1,
        FourCC("BTLF"),
        tempUnit
    )
    UnitAddAbilityBJ(
        FourCC("A022"),
        tempUnit
    )
    IssueTargetOrderBJ(tempUnit, "blizzard", target)
    RemoveLocation(spellPoint)
end
return ____exports
