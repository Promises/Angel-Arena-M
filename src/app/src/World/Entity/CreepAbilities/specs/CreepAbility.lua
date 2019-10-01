--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.CreepAbility = {}
local CreepAbility = ____exports.CreepAbility
CreepAbility.name = "CreepAbility"
CreepAbility.__index = CreepAbility
CreepAbility.prototype = {}
CreepAbility.prototype.____getters = {}
CreepAbility.prototype.__index = __TS__Index(CreepAbility.prototype)
CreepAbility.prototype.____setters = {}
CreepAbility.prototype.__newindex = __TS__NewIndex(CreepAbility.prototype)
CreepAbility.prototype.constructor = CreepAbility
function CreepAbility.new(...)
    local self = setmetatable({}, CreepAbility.prototype)
    self:____constructor(...)
    return self
end
function CreepAbility.prototype.____constructor(self, abiID, abilityUnit)
    self.abilityId = FourCC(abiID)
    UnitAddAbility(abilityUnit, self.abilityId)
end
function CreepAbility.prototype.____getters.game(self)
    return self._game
end
function CreepAbility.prototype.____setters.game(self, value)
    self._game = value
end
function CreepAbility.prototype.SetupGame(self, game)
    self._game = game
end
function CreepAbility.prototype.GetID(self)
    return self.abilityId
end
function CreepAbility.prototype.IsFinalDamageModificationCreepAbility(self)
    return self.ModifyFinalDamage ~= nil
end
function CreepAbility.prototype.IsAttackActionCreepAbility(self)
    return self.AttackAction ~= nil
end
function CreepAbility.prototype.AddAbilityToCreep(self, creep)
    if not self.game or not self.game.worldMap.gameRoundHandler then
        return
    end
    local currentWave = self.game.worldMap.waveCreeps[self.game.worldMap.gameRoundHandler.currentWave]
    if self:GetID() == FourCC("A01E") and currentWave:getCreepType() == CREEP_TYPE.AIR then
        return
    end
    UnitAddAbilityBJ(
        self:GetID(),
        creep.creep
    )
    SetUnitAbilityLevelSwapped(
        self:GetID(),
        creep.creep,
        self.game.worldMap.gameRoundHandler.currentWave + 1
    )
end
return ____exports
