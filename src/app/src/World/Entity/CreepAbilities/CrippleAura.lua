--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
local CreepAbility = ____CreepAbility.CreepAbility
____exports.CrippleAura = {}
local CrippleAura = ____exports.CrippleAura
CrippleAura.name = "CrippleAura"
CrippleAura.__index = CrippleAura
CrippleAura.prototype = {}
CrippleAura.prototype.__index = __TS__Index(CrippleAura.prototype)
CrippleAura.prototype.__newindex = __TS__NewIndex(CrippleAura.prototype)
CrippleAura.prototype.constructor = CrippleAura
CrippleAura.____super = CreepAbility
setmetatable(CrippleAura, CrippleAura.____super)
setmetatable(CrippleAura.prototype, CrippleAura.____super.prototype)
function CrippleAura.new(...)
    local self = setmetatable({}, CrippleAura.prototype)
    self:____constructor(...)
    return self
end
function CrippleAura.prototype.____constructor(self, abilityUnit)
    CreepAbility.prototype.____constructor(self, "A08G", abilityUnit)
end
function CrippleAura.prototype.AttackAction(self)
    if not self.game or not self.game.worldMap.gameRoundHandler then
        return
    end
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    local source = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if target and source then
        if UnitHasBuffBJ(
            source,
            FourCC("B01C")
        ) then
            return
        end
        if not UnitHasBuffBJ(
            target,
            FourCC("B01D")
        ) then
            return
        end
        if Util:RandomInt(1, 100) > 10 then
            return
        end
        local tempUnit = CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("u008"),
            0,
            -5300,
            bj_UNIT_FACING
        )
        UnitAddAbilityBJ(
            FourCC("A06B"),
            tempUnit
        )
        SetUnitAbilityLevel(
            tempUnit,
            FourCC("A06B"),
            self.game.worldMap.gameRoundHandler.currentWave + 1
        )
        UnitApplyTimedLifeBJ(
            1,
            FourCC("BTLF"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "cripple", source)
    end
end
return ____exports
