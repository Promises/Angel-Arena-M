--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
local CreepAbility = ____CreepAbility.CreepAbility
____exports.WalkItOff = {}
local WalkItOff = ____exports.WalkItOff
WalkItOff.name = "WalkItOff"
WalkItOff.__index = WalkItOff
WalkItOff.prototype = {}
WalkItOff.prototype.__index = __TS__Index(WalkItOff.prototype)
WalkItOff.prototype.__newindex = __TS__NewIndex(WalkItOff.prototype)
WalkItOff.prototype.constructor = WalkItOff
WalkItOff.____super = CreepAbility
setmetatable(WalkItOff, WalkItOff.____super)
setmetatable(WalkItOff.prototype, WalkItOff.____super.prototype)
function WalkItOff.new(...)
    local self = setmetatable({}, WalkItOff.prototype)
    self:____constructor(...)
    return self
end
function WalkItOff.prototype.____constructor(self, abilityUnit)
    CreepAbility.prototype.____constructor(self, "A01T", abilityUnit)
end
function WalkItOff.prototype.AttackAction(self)
    if not self.game or not self.game.worldMap.gameRoundHandler then
        return
    end
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if target then
        if not UnitHasBuffBJ(
            target,
            FourCC("B01H")
        ) then
            return
        end
        if not (GetUnitMoveSpeed(target) < GetUnitDefaultMoveSpeed(target)) then
            return
        end
        do
            local ____obj, ____index = self.game.gameDamageEngineGlobals, "udg_DamageEventAmount"
            ____obj[____index] = ____obj[____index] * (1 - 0.5 * (self.game.worldMap.gameRoundHandler.currentWave + 1) * 0.01)
        end
    end
end
return ____exports
