--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____AbstractGameRound = require("app.src.World.Game.BaseMaul.AbstractGameRound")
local AbstractGameRound = ____AbstractGameRound.AbstractGameRound
local settings = require("app.src.World.GlobalSettings")
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local ____TimedEvent = require("app.src.lib.WCEventQueue.TimedEvent")
local TimedEvent = ____TimedEvent.TimedEvent
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
local KillStreaks = {}
KillStreaks.gold = 0
KillStreaks[KillStreaks.gold] = "gold"
KillStreaks.lumber = 1
KillStreaks[KillStreaks.lumber] = "lumber"
____exports.BlitzGameRound = {}
local BlitzGameRound = ____exports.BlitzGameRound
BlitzGameRound.name = "BlitzGameRound"
BlitzGameRound.__index = BlitzGameRound
BlitzGameRound.prototype = {}
BlitzGameRound.prototype.__index = __TS__Index(BlitzGameRound.prototype)
BlitzGameRound.prototype.__newindex = __TS__NewIndex(BlitzGameRound.prototype)
BlitzGameRound.prototype.constructor = BlitzGameRound
BlitzGameRound.____super = AbstractGameRound
setmetatable(BlitzGameRound, BlitzGameRound.____super)
setmetatable(BlitzGameRound.prototype, BlitzGameRound.____super.prototype)
function BlitzGameRound.new(...)
    local self = setmetatable({}, BlitzGameRound.prototype)
    self:____constructor(...)
    return self
end
function BlitzGameRound.prototype.____constructor(self, game)
    AbstractGameRound.prototype.____constructor(self, game)
    self.shouldStartWaveTimer = false
    self.waitBetweenWaveTime = settings.GAME_TIME_BEFORE_WAVE
    self.roundOverGoldReward = settings.GAME_GOLD_REWARD_BASE + 5
    self.shouldStartSpawning = false
    self.kills = 0
    self.goldReward = settings.GAME_GOLD_REWARD_BASE + 5
    self.targetKillCount = {}
    self.lastKillCount = {0, 0}
    self.roundEndTrigger = Trigger.new()
    for ____, enemy in ipairs(self.game.enemies) do
        self.roundEndTrigger:RegisterPlayerStateEvent(enemy.wcPlayer, PLAYER_STATE_RESOURCE_FOOD_USED, EQUAL, 0)
    end
    self.roundEndTrigger:AddCondition(
        function() return self:CreepFoodConditions() end
    )
    self.roundEndTrigger:AddAction(
        function() return self:AllIsDead() end
    )
    self.roundEndTrigger:Disable()
    self.antiJuggleEnabled = false
    for player in __TS__Iterator(
        self.game.players:values()
    ) do
        player.killHook = function() return self:KillHook() end
        player.goldReward = self.roundOverGoldReward
    end
    self.targetKillCount[KillStreaks.gold + 1] = ((20 * self.game.players.size) - 10) + self.lastKillCount[KillStreaks.gold + 1]
    self.targetKillCount[KillStreaks.lumber + 1] = ((200 * self.game.players.size) - 100) + self.lastKillCount[KillStreaks.lumber + 1]
end
function BlitzGameRound.prototype.SpawnNextWave(self)
    local nextWave = self.currentWave + 1
    if nextWave % 5 == 0 or nextWave == 36 or self.currentWave == #self.game.worldMap.waveCreeps then
        if self.game.worldMap.spawnedCreeps.unitMap.size == 0 then
            self:AllIsDead()
        else
            self.roundEndTrigger:Enable()
        end
        Log.Debug("next wave is safe")
    else
        self.shouldStartSpawning = true
        self.currentWave = nextWave
        Log.Debug("spawning next")
    end
    return true
end
function BlitzGameRound.prototype.GameTimeUpdateEvent(self)
    if self.shouldStartWaveTimer then
        self.shouldStartWaveTimer = false
        self.game.waveTimer = self.waitBetweenWaveTime + 1
        self:UpdateScoreboardForWave()
    end
    if self.isWaveInProgress then
        if self.game.scoreBoard then
            MultiboardSetItemValueBJ(
                self.game.scoreBoard.board,
                2,
                1,
                self.game:PrettifyGameTime(self.game.gameTime)
            )
        end
    else
        self.game.waveTimer = self.game.waveTimer - 1
        if self.game.scoreBoard then
            MultiboardSetItemValueBJ(
                self.game.scoreBoard.board,
                2,
                1,
                Util:ColourString(
                    "#999999",
                    ToString(nil, self.game.waveTimer)
                )
            )
        end
    end
    if self.game.waveTimer == 0 and not self.isWaveInProgress or self.shouldStartSpawning then
        self.shouldStartSpawning = false
        self.isWaveInProgress = true
        if self.game.scoreBoard then
            MultiboardSetItemValueBJ(self.game.scoreBoard.board, 1, 1, "Game Time")
        end
        self.roundEndTrigger:Disable()
        if self.game.scoreBoard then
            self:UpdateWaveScoreboard()
        end
        self:SpawnCreeps()
    end
end
function BlitzGameRound.prototype.AllIsDead(self)
    if self.currentWave == #self.game.worldMap.waveCreeps then
        self:BonusRoundsOver()
    else
        self.currentWave = self.currentWave + 1
        self.roundOverGoldReward = self.roundOverGoldReward + 2
        if self.game.scoreBoard then
            MultiboardSetItemValueBJ(
                self.game.scoreBoard.board,
                2,
                2,
                tostring(self.currentWave)
            )
        end
        self:DisplayLivesLost()
        self:GiveWaveGoldReward()
        self.isWaveInProgress = false
        self.shouldStartWaveTimer = true
        self.game.worldMap:HealEverythingOnMap()
        if self.currentWave == 35 and self.game.worldMap.archimondeDummy then
            PauseUnitBJ(false, self.game.worldMap.archimondeDummy)
            IssueTargetDestructableOrder(self.game.worldMap.archimondeDummy, "attack", self.game.worldMap.archimondeGate.gate)
        end
        if self.currentWave == 36 then
            self.game:GameWin()
        end
    end
    for ____, tower in ipairs(
        self.game.worldMap.gameTurn:EndOfRoundTowers()
    ) do
        tower:EndOfRoundAction()
    end
    for ____, maze in ipairs(self.game.worldMap.playerMazes) do
        maze:CleanAll()
    end
end
function BlitzGameRound.prototype.UpdateScoreboardForWave(self)
    if self.game.scoreBoard then
        MultiboardSetItemValueBJ(self.game.scoreBoard.board, 1, 1, "Starting in")
        local armourType = settings.ARMOUR_TYPE_NAMES[self.game.worldMap.waveCreeps[self.currentWave]:getArmourType() + 1]
        armourType = tostring(
            string.upper(
                string.sub(armourType, 1, 1)
            )
        ) .. tostring(
            string.sub(
                string.lower(armourType),
                2
            )
        )
        MultiboardSetItemValueBJ(
            self.game.scoreBoard.board,
            2,
            5,
            Util:ColourString(
                settings.ARMOUR_TYPE_COLOURS[self.game.worldMap.waveCreeps[self.currentWave]:getArmourType() + 1],
                armourType
            )
        )
        local creepType = self.game.worldMap.waveCreeps[self.currentWave]:getCreepType()
        if creepType ~= CREEP_TYPE.NORMAL then
            local creepTypeName = settings.CREEP_TYPE_NAMES[self.game.worldMap.waveCreeps[self.currentWave]:getCreepType() + 1]
            creepTypeName = tostring(
                string.upper(
                    string.sub(creepTypeName, 1, 1)
                )
            ) .. tostring(
                string.sub(
                    string.lower(creepTypeName),
                    2
                )
            )
            MultiboardSetItemValueBJ(
                self.game.scoreBoard.board,
                2,
                6,
                Util:ColourString(
                    settings.CREEP_TYPE_COLOURS[self.game.worldMap.waveCreeps[self.currentWave]:getCreepType() + 1],
                    "(" .. tostring(creepTypeName) .. ")"
                )
            )
        else
            MultiboardSetItemValueBJ(self.game.scoreBoard.board, 2, 6, "")
        end
    end
end
function BlitzGameRound.prototype.UpdateWaveScoreboard(self)
    if self.game.scoreBoard then
        local armourType = settings.ARMOUR_TYPE_NAMES[self.game.worldMap.waveCreeps[self.currentWave]:getArmourType() + 1]
        armourType = tostring(
            string.upper(
                string.sub(armourType, 1, 1)
            )
        ) .. tostring(
            string.sub(
                string.lower(armourType),
                2
            )
        )
        MultiboardSetItemValueBJ(
            self.game.scoreBoard.board,
            2,
            5,
            Util:ColourString(
                settings.ARMOUR_TYPE_COLOURS[self.game.worldMap.waveCreeps[self.currentWave]:getArmourType() + 1],
                armourType
            )
        )
        local creepType = self.game.worldMap.waveCreeps[self.currentWave]:getCreepType()
        if creepType ~= CREEP_TYPE.NORMAL then
            local creepTypeName = settings.CREEP_TYPE_NAMES[self.game.worldMap.waveCreeps[self.currentWave]:getCreepType() + 1]
            creepTypeName = tostring(
                string.upper(
                    string.sub(creepTypeName, 1, 1)
                )
            ) .. tostring(
                string.sub(
                    string.lower(creepTypeName),
                    2
                )
            )
            MultiboardSetItemValueBJ(
                self.game.scoreBoard.board,
                2,
                6,
                Util:ColourString(
                    settings.CREEP_TYPE_COLOURS[self.game.worldMap.waveCreeps[self.currentWave]:getCreepType() + 1],
                    "(" .. tostring(creepTypeName) .. ")"
                )
            )
        else
            MultiboardSetItemValueBJ(self.game.scoreBoard.board, 2, 6, "")
        end
        MultiboardSetItemValueBJ(
            self.game.scoreBoard.board,
            2,
            2,
            tostring(self.currentWave)
        )
    end
end
function BlitzGameRound.prototype.CreepFoodConditions(self)
    for ____, enemy in ipairs(self.game.enemies) do
        if not (GetPlayerState(enemy.wcPlayer, PLAYER_STATE_RESOURCE_FOOD_USED) == 0) then
            return false
        end
    end
    return true
end
function BlitzGameRound.prototype.BonusRoundsOver(self)
    SendMessage("|cFFF48C42That\'s all the bonus levels, see you next time!|r")
    self.isWaveInProgress = false
    self.game.gameEndTimer = settings.GAME_END_TIME
    self.game.gameEnded = true
    local ship = self.game.worldMap.ship
    if ship then
        ship:MoveShip()
    end
    self:BonusRoundEffects()
end
function BlitzGameRound.prototype.DisplayLivesLost(self)
    if self.game.gameLives == self.game.startLives then
        SendMessage(settings.NO_LIVES_LOST)
    else
        local livesRemaining = self.game.startLives - self.game.gameLives
        SendMessage(
            tostring(livesRemaining) .. tostring(
                Util:ColourString(settings.COLOUR_CODES[COLOUR.RED + 1], "% of your lives have been lost")
            )
        )
    end
end
function BlitzGameRound.prototype.BonusRoundEffects(self)
    local t = CreateTimer()
    TimerStart(
        t,
        0.03,
        true,
        function() return self:SpamBonusEffects() end
    )
end
function BlitzGameRound.prototype.SpamBonusEffects(self)
    local x = GetRandomInt(0, 10000) - 5000
    local y = GetRandomInt(0, 10000) - 5000
    local loc = Location(x, y)
    DestroyEffect(
        AddSpecialEffectLocBJ(loc, "Abilities\\Spells\\Human\\Flare\\FlareCaster.mdl")
    )
    RemoveLocation(loc)
end
function BlitzGameRound.prototype.GiveWaveGoldReward(self)
    for player in __TS__Iterator(
        self.game.players:values()
    ) do
        if self.currentWave == 15 then
            player:giveLumber(1)
        end
        if player.id == COLOUR.GRAY then
            player:giveGold(2 * self.roundOverGoldReward)
            player:sendMessage(
                "|c0000cdf9You recieved|r " .. tostring(2 * self.roundOverGoldReward) .. " |c0000cdf9" .. "extra gold for completing level as the last defender|r " .. tostring((self.currentWave - 1))
            )
        else
            player:giveGold(self.roundOverGoldReward)
            player:sendMessage(
                "|c0000cdf9You recieved|r " .. tostring(self.roundOverGoldReward) .. " |c0000cdf9" .. "extra gold for completing level|r " .. tostring((self.currentWave - 1))
            )
        end
    end
end
function BlitzGameRound.prototype.FinishedSpawning(self)
    self.game.timedEventQueue:AddEvent(
        TimedEvent.new(
            function() return self:SpawnNextWave() end,
            80,
            false
        )
    )
end
function BlitzGameRound.prototype.KillHook(self)
    local killStreakPrefix = Util:ColourString(settings.COLOUR_CODES[COLOUR.GREEN + 1], "Kill Streak")
    self.targetKillCount[KillStreaks.gold + 1] = ((20 * self.game.players.size) - 10) + self.lastKillCount[KillStreaks.gold + 1]
    self.targetKillCount[KillStreaks.lumber + 1] = ((200 * self.game.players.size) - 100) + self.lastKillCount[KillStreaks.lumber + 1]
    self.kills = self.kills + 1
    if self.kills >= self.targetKillCount[KillStreaks.gold + 1] then
        local avgkills = 0
        for player in __TS__Iterator(
            self.game.players:values()
        ) do
            avgkills = avgkills + player.kills
        end
        avgkills = avgkills / self.game.players.size
        self.lastKillCount[KillStreaks.gold + 1] = self.kills
        for player in __TS__Iterator(
            self.game.players:values()
        ) do
            player:sendMessage(
                tostring(killStreakPrefix) .. ": Your team has killed " .. tostring(self.kills) .. " creeps, Reward " .. tostring(self.goldReward) .. " gold."
            )
            player:giveGold(
                math.floor((avgkills / player.kills) * self.goldReward)
            )
        end
        self.goldReward = self.goldReward + 5
    end
    if self.kills >= self.targetKillCount[KillStreaks.lumber + 1] then
        self.lastKillCount[KillStreaks.lumber + 1] = self.kills
        for player in __TS__Iterator(
            self.game.players:values()
        ) do
            player:sendMessage(
                tostring(killStreakPrefix) .. ": Your team has killed " .. tostring(self.kills) .. " creeps, Reward 1 lumber."
            )
            player:giveLumber(1)
        end
    end
end
return ____exports
