--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____AbstractGameRound = require("app.src.World.Game.BaseMaul.AbstractGameRound")
local AbstractGameRound = ____AbstractGameRound.AbstractGameRound
local settings = require("app.src.World.GlobalSettings")
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
____exports.ClassicGameRound = {}
local ClassicGameRound = ____exports.ClassicGameRound
ClassicGameRound.name = "ClassicGameRound"
ClassicGameRound.__index = ClassicGameRound
ClassicGameRound.prototype = {}
ClassicGameRound.prototype.__index = __TS__Index(ClassicGameRound.prototype)
ClassicGameRound.prototype.__newindex = __TS__NewIndex(ClassicGameRound.prototype)
ClassicGameRound.prototype.constructor = ClassicGameRound
ClassicGameRound.____super = AbstractGameRound
setmetatable(ClassicGameRound, ClassicGameRound.____super)
setmetatable(ClassicGameRound.prototype, ClassicGameRound.____super.prototype)
function ClassicGameRound.new(...)
    local self = setmetatable({}, ClassicGameRound.prototype)
    self:____constructor(...)
    return self
end
function ClassicGameRound.prototype.____constructor(self, game)
    AbstractGameRound.prototype.____constructor(self, game)
    self.shouldStartWaveTimer = false
    self.waitBetweenWaveTime = settings.GAME_TIME_BEFORE_WAVE
    self.roundOverGoldReward = settings.GAME_GOLD_REWARD_BASE
    self.roundEndTrigger = Trigger.new()
    for ____, enemy in ipairs(self.game.enemies) do
        self.roundEndTrigger:RegisterPlayerStateEvent(enemy.wcPlayer, PLAYER_STATE_RESOURCE_FOOD_USED, EQUAL, 0)
    end
    self.roundEndTrigger:AddCondition(
        function() return self:CreepFoodConditions() end
    )
    self.roundEndTrigger:AddAction(
        function() return self:RoundEnd() end
    )
end
function ClassicGameRound.prototype.GameTimeUpdateEvent(self)
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
    if self.game.waveTimer == 0 and not self.isWaveInProgress then
        self.isWaveInProgress = true
        if self.game.scoreBoard then
            MultiboardSetItemValueBJ(self.game.scoreBoard.board, 1, 1, "Game Time")
        end
        self:SpawnCreeps()
    end
end
function ClassicGameRound.prototype.RoundEnd(self)
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
function ClassicGameRound.prototype.UpdateScoreboardForWave(self)
    if self.game.scoreBoard then
        MultiboardSetItemValueBJ(self.game.scoreBoard.board, 1, 1, "Starting in")
        local armourType = settings.ARMOUR_TYPE_NAMES[self.game.worldMap.waveCreeps[self.currentWave]:getArmourType() + 1]
        armourType = tostring(
            string.upper(
                string.sub(
                    string.lower(armourType),
                    1,
                    1
                )
            )
        ) .. tostring(
            string.sub(armourType, 2)
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
function ClassicGameRound.prototype.CreepFoodConditions(self)
    for ____, enemy in ipairs(self.game.enemies) do
        if not (GetPlayerState(enemy.wcPlayer, PLAYER_STATE_RESOURCE_FOOD_USED) == 0) then
            return false
        end
    end
    return true
end
function ClassicGameRound.prototype.BonusRoundsOver(self)
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
function ClassicGameRound.prototype.DisplayLivesLost(self)
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
function ClassicGameRound.prototype.BonusRoundEffects(self)
    local t = CreateTimer()
    TimerStart(
        t,
        0.03,
        true,
        function() return self:SpamBonusEffects() end
    )
end
function ClassicGameRound.prototype.SpamBonusEffects(self)
    local x = GetRandomInt(0, 10000) - 5000
    local y = GetRandomInt(0, 10000) - 5000
    local loc = Location(x, y)
    DestroyEffect(
        AddSpecialEffectLocBJ(loc, "Abilities\\Spells\\Human\\Flare\\FlareCaster.mdl")
    )
    RemoveLocation(loc)
end
function ClassicGameRound.prototype.GiveWaveGoldReward(self)
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
function ClassicGameRound.prototype.FinishedSpawning(self)
end
return ____exports
