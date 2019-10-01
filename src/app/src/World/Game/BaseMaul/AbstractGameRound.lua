--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.AbstractGameRound = {}
local AbstractGameRound = ____exports.AbstractGameRound
AbstractGameRound.name = "AbstractGameRound"
AbstractGameRound.__index = AbstractGameRound
AbstractGameRound.prototype = {}
AbstractGameRound.prototype.____getters = {}
AbstractGameRound.prototype.__index = __TS__Index(AbstractGameRound.prototype)
AbstractGameRound.prototype.____setters = {}
AbstractGameRound.prototype.__newindex = __TS__NewIndex(AbstractGameRound.prototype)
AbstractGameRound.prototype.constructor = AbstractGameRound
function AbstractGameRound.new(...)
    local self = setmetatable({}, AbstractGameRound.prototype)
    self:____constructor(...)
    return self
end
function AbstractGameRound.prototype.____constructor(self, game)
    self._isWaveInProgress = false
    self._currentWave = 1
    self.antiJuggleEnabled = true
    self.game = game
end
function AbstractGameRound.prototype.____getters.currentWave(self)
    return self._currentWave
end
function AbstractGameRound.prototype.____getters.isWaveInProgress(self)
    return self._isWaveInProgress
end
function AbstractGameRound.prototype.____setters.currentWave(self, value)
    self._currentWave = value
end
function AbstractGameRound.prototype.____setters.isWaveInProgress(self, value)
    self._isWaveInProgress = value
end
function AbstractGameRound.prototype.SpawnCreeps(self)
    local wave = self.game.worldMap.waveCreeps[self._currentWave]
    SendMessage(
        "Level " .. tostring(self._currentWave) .. " - " .. tostring(wave.name)
    )
    local spawnAmount = 10
    local ____switch7 = wave:getCreepType()
    if ____switch7 == CREEP_TYPE.CHAMPION then
        goto ____switch7_case_0
    end
    if ____switch7 == CREEP_TYPE.BOSS then
        goto ____switch7_case_1
    end
    goto ____switch7_end
    ::____switch7_case_0::
    do
        spawnAmount = 4
        goto ____switch7_end
    end
    ::____switch7_case_1::
    do
        spawnAmount = 1
        goto ____switch7_end
    end
    ::____switch7_end::
    if wave.wave > 35 then
        spawnAmount = 1
    end
    if self._currentWave == 35 then
        SetTimeOfDay(0)
        SetWaterBaseColorBJ(100, 33, 33, 0)
    end
    self:startSpawning(spawnAmount, wave)
end
function AbstractGameRound.prototype.startSpawning(self, amount, wave)
    local creepOwner = 0
    if not self.game.worldMap.spawnedCreeps then
        return
    end
    local spawned = self.game.worldMap.spawnedCreeps.unitMap
    local abilities = self.game.creepAbilityHandler:GetAbilitiesForWave(wave)
    do
        local y = 0
        while y < amount do
            do
                local i = 0
                while i < #self.game.worldMap.playerSpawns do
                    local spawn = self.game.worldMap.playerSpawns[i + 1]
                    spawn:SpawnCreep(self, spawned, abilities, wave, creepOwner)
                    i = i + 1
                end
            end
            creepOwner = creepOwner + 1
            TriggerSleepAction(0.5)
            y = y + 1
        end
    end
    self:FinishedSpawning()
end
return ____exports
