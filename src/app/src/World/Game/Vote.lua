--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local settings = require("app.src.World.GlobalSettings")
local ____MultiBoard = require("app.src.World.Game.MultiBoard")
local MultiBoard = ____MultiBoard.MultiBoard
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local GAME_MODES = ____GlobalSettings.GAME_MODES
local ____ClassicGameRound = require("app.src.World.Game.ClassicMaul.ClassicGameRound")
local ClassicGameRound = ____ClassicGameRound.ClassicGameRound
local ____BlitzGameRound = require("app.src.World.Game.BlitzMaul.BlitzGameRound")
local BlitzGameRound = ____BlitzGameRound.BlitzGameRound
____exports.Vote = {}
local Vote = ____exports.Vote
Vote.name = "Vote"
Vote.__index = Vote
Vote.prototype = {}
Vote.prototype.__index = Vote.prototype
Vote.prototype.constructor = Vote
function Vote.new(...)
    local self = setmetatable({}, Vote.prototype)
    self:____constructor(...)
    return self
end
function Vote.prototype.____constructor(self, game)
    self.difficultyDialog = DialogCreate()
    self.difficultyButtons = {}
    self.modeDialog = DialogCreate()
    self.modeButtons = {}
    self.votedMode = {}
    self.votedDiff = {}
    self.totalVotedDiff = 0
    self.difficulty = 0
    self.game = game
    self.initializeVotesTrigger = Trigger.new()
    self.initializeVotesTrigger:RegisterTimerEventSingle(1)
    self.initializeVotesTrigger:AddAction(
        function() return self:InitializeVotes() end
    )
    self.difficultyVoteTrigger = Trigger.new()
    self.difficultyVoteTrigger:RegisterDialogEventBJ(self.difficultyDialog)
    self.difficultyVoteTrigger:AddAction(
        function() return self:DifficultyVote() end
    )
    self.modeVoteTrigger = Trigger.new()
    self.modeVoteTrigger:RegisterDialogEventBJ(self.modeDialog)
    self.modeVoteTrigger:AddAction(
        function() return self:ModeVote() end
    )
end
function Vote.prototype.InitializeVotes(self)
    DialogSetMessageBJ(self.difficultyDialog, "Difficulty vote:")
    do
        local i = 0
        while i < #settings.DIFFICULTIES do
            __TS__ArrayPush(
                self.difficultyButtons,
                DialogAddButtonBJ(
                    self.difficultyDialog,
                    tostring(
                        Util:ColourString(
                            settings.DIFFICULTY_COLOURS[i + 1],
                            tostring(settings.DIFFICULTIES[i + 1]) .. "% " .. tostring(settings.DIFFICULTY_STRINGS[i + 1])
                        )
                    )
                )
            )
            i = i + 1
        end
    end
    DialogSetMessageBJ(self.modeDialog, "Game mode vote:")
    do
        local i = 0
        while i < #settings.GAME_MODE_STRINGS do
            self.votedMode[i + 1] = 0
            __TS__ArrayPush(
                self.modeButtons,
                DialogAddButtonBJ(
                    self.modeDialog,
                    tostring(
                        Util:ColourString(
                            settings.GAME_MODE_COLOURS[i + 1],
                            tostring(settings.GAME_MODE_STRINGS[i + 1])
                        )
                    )
                )
            )
            i = i + 1
        end
    end
    for player in __TS__Iterator(
        self.game.players:values()
    ) do
        PanCameraToTimedForPlayer(player.wcPlayer, -1900, 2100, 0)
        DialogDisplayBJ(true, self.modeDialog, player.wcPlayer)
    end
    self:InitializeModeVoteTimer()
end
function Vote.prototype.InitializeModeVoteTimer(self)
    local t = CreateTimer()
    TimerStart(
        t,
        10,
        false,
        function() return self:ModeVoteTimeExpired() end
    )
end
function Vote.prototype.InitializeDiffVoteTimer(self)
    local t = CreateTimer()
    TimerStart(
        t,
        10,
        false,
        function() return self:VoteDiffTimerExpired() end
    )
end
function Vote.prototype.SetDifficulty(self, diffculty)
    for ____, enemy in ipairs(self.game.enemies) do
        enemy:setHandicap(diffculty)
    end
end
function Vote.prototype.ModeVoteTimeExpired(self)
    PauseTimer(
        GetExpiredTimer()
    )
    local winningMode
    do
        local i = 0
        while i < #self.votedMode do
            if not winningMode then
                winningMode = i
            else
                if self.votedMode[i + 1] > self.votedMode[winningMode + 1] then
                    winningMode = i
                end
            end
            i = i + 1
        end
    end
    if not winningMode then
        Log.Fatal("Could not parse game mode")
        return
    end
    local colouredMode = Util:ColourString(settings.GAME_MODE_COLOURS[winningMode + 1], settings.GAME_MODE_STRINGS[winningMode + 1])
    SendMessage(
        tostring(colouredMode) .. " won with " .. tostring(self.votedMode[winningMode + 1]) .. " votes."
    )
    local ____switch21 = winningMode
    if ____switch21 == GAME_MODES.CLASSIC then
        goto ____switch21_case_0
    end
    if ____switch21 == GAME_MODES.BLITZ then
        goto ____switch21_case_1
    end
    goto ____switch21_case_default
    ::____switch21_case_0::
    do
        self.game.worldMap.gameRoundHandler = ClassicGameRound.new(self.game)
        goto ____switch21_end
    end
    ::____switch21_case_1::
    do
        self.game.worldMap.gameRoundHandler = BlitzGameRound.new(self.game)
        goto ____switch21_end
    end
    ::____switch21_case_default::
    do
        Log.Fatal("Invalid game mode, defaulting to classic.")
        self.game.worldMap.gameRoundHandler = ClassicGameRound.new(self.game)
        goto ____switch21_end
    end
    ::____switch21_end::
    for player in __TS__Iterator(
        self.game.players:values()
    ) do
        DialogDisplayBJ(true, self.difficultyDialog, player.wcPlayer)
    end
    self:InitializeDiffVoteTimer()
end
function Vote.prototype.VoteDiffTimerExpired(self)
    PauseTimer(
        GetExpiredTimer()
    )
    local voteCount = 0
    for player in __TS__Iterator(
        self.game.players:values()
    ) do
        if not self.votedDiff[player.id + 1] then
            DialogDisplayBJ(false, self.difficultyDialog, player.wcPlayer)
            SendMessage(
                tostring(
                    player:getNameWithColour()
                ) .. " did not vote, their vote will not be counted"
            )
        else
            voteCount = voteCount + 1
            self.totalVotedDiff = self.totalVotedDiff + self.votedDiff[player.id + 1]
        end
    end
    self.game.scoreBoard = MultiBoard.new(self.game)
    if voteCount == 0 then
        SendMessage("Nobody voted, difficulty will automatically be set to Normal")
        self.difficulty = settings.DIFFICULTIES[1]
    else
        self.difficulty = self.totalVotedDiff / voteCount
    end
    local diffIndex = R2I(
        (self.difficulty - 100) / 100 + ModuloReal((self.difficulty - 100) / 100, 1)
    )
    self.difficulty = math.floor(self.difficulty)
    SetPlayerHandicapBJ(
        Player(PLAYER_NEUTRAL_PASSIVE),
        self.difficulty
    )
    SendMessage(
        "Difficulty was set to " .. tostring(self.difficulty) .. "% (" .. tostring(
            Util:ColourString(settings.DIFFICULTY_COLOURS[diffIndex + 1], settings.DIFFICULTY_STRINGS[diffIndex + 1])
        ) .. ")"
    )
    for player in __TS__Iterator(
        self.game.players:values()
    ) do
        for ally in __TS__Iterator(
            self.game.players:values()
        ) do
            SetPlayerAllianceBJ(player.wcPlayer, ALLIANCE_HELP_REQUEST, false, ally.wcPlayer)
        end
    end
    if self.difficulty >= 400 then
        PlaySoundBJ(settings.Sounds.impossibleDifficultySound)
        SendMessage("|cFF565656Everyone voted for Extreme, you will only have |r1|cFF565656 life!|r")
        self.game.gameLives = 1
        self.game.startLives = 1
        MultiboardSetItemValueBJ(
            self.game.scoreBoard.board,
            2,
            4,
            tostring(self.game.gameLives) .. "%"
        )
        SetWaterBaseColorBJ(100, 20, 20, 0)
        self.game.worldMap:ReplaceRunedBricksWithLava()
    end
    MultiboardSetItemValueBJ(
        self.game.scoreBoard.board,
        2,
        3,
        tostring(
            I2S(
                R2I(self.difficulty)
            )
        ) .. "% (" .. tostring(
            Util:ColourString(settings.DIFFICULTY_COLOURS[diffIndex + 1], settings.DIFFICULTY_STRINGS[diffIndex + 1])
        ) .. ")"
    )
end
function Vote.prototype.DifficultyVote(self)
    do
        local i = 0
        while i < #self.difficultyButtons do
            local button = self.difficultyButtons[i + 1]
            if GetClickedButtonBJ() == button then
                self.votedDiff[GetPlayerId(
                    GetTriggerPlayer()
                ) + 1] = settings.DIFFICULTIES[i + 1]
                SendMessage(
                    tostring(
                        Util:ColourString(
                            settings.COLOUR_CODES[GetPlayerId(
                                GetTriggerPlayer()
                            ) + 1],
                            GetPlayerName(
                                GetTriggerPlayer()
                            )
                        )
                    ) .. " voted for: " .. tostring(
                        Util:ColourString(settings.DIFFICULTY_COLOURS[i + 1], settings.DIFFICULTY_STRINGS[i + 1])
                    )
                )
            end
            i = i + 1
        end
    end
    DialogDisplayBJ(
        false,
        self.difficultyDialog,
        GetTriggerPlayer()
    )
end
function Vote.prototype.ModeVote(self)
    do
        local i = 0
        while i < #self.modeButtons do
            local button = self.modeButtons[i + 1]
            if GetClickedButtonBJ() == button then
                do
                    local ____obj, ____index = self.votedMode, i + 1
                    ____obj[____index] = ____obj[____index] + 1
                end
                SendMessage(
                    tostring(
                        Util:ColourString(
                            settings.COLOUR_CODES[GetPlayerId(
                                GetTriggerPlayer()
                            ) + 1],
                            GetPlayerName(
                                GetTriggerPlayer()
                            )
                        )
                    ) .. " voted for: " .. tostring(
                        Util:ColourString(settings.GAME_MODE_COLOURS[i + 1], settings.GAME_MODE_STRINGS[i + 1])
                    )
                )
            end
            i = i + 1
        end
    end
    DialogDisplayBJ(
        false,
        self.modeDialog,
        GetTriggerPlayer()
    )
end
return ____exports
