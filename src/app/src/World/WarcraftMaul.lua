--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Defender = require("app.src.World.Entity.Players.Defender")
local Defender = ____Defender.Defender
local settings = require("app.src.World.GlobalSettings")
local ____Attacker = require("app.src.World.Entity.Players.Attacker")
local Attacker = ____Attacker.Attacker
local ____WorldMap = require("app.src.World.WorldMap")
local WorldMap = ____WorldMap.WorldMap
local ____Commands = require("app.src.World.Game.Commands")
local Commands = ____Commands.Commands
local ____Vote = require("app.src.World.Game.Vote")
local Vote = ____Vote.Vote
local ____RacePicking = require("app.src.World.Game.RacePicking")
local RacePicking = ____RacePicking.RacePicking
local ____questsGEN = require("app.src.Generated.questsGEN")
local Quests = ____questsGEN.Quests
local ____Version = require("app.src.Generated.Version")
local BUILD_DATE = ____Version.BUILD_DATE
local BUILD_NUMBER = ____Version.BUILD_NUMBER
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
local LogLevel = ____Serilog.LogLevel
local ____StringSink = require("app.src.lib.Serilog.Sinks.StringSink")
local StringSink = ____StringSink.StringSink
local ____SellTower = require("app.src.World.Entity.Tower.SellTower")
local SellTower = ____SellTower.SellTower
local ____DamageEngine = require("app.src.World.Game.DamageEngine")
local DamageEngine = ____DamageEngine.DamageEngine
local ____DamageEngineGlobals = require("app.src.World.Game.DamageEngineGlobals")
local DamageEngineGlobals = ____DamageEngineGlobals.DamageEngineGlobals
local ____TowerTicker = require("app.src.World.Game.TowerTicker")
local TowerTicker = ____TowerTicker.TowerTicker
local ____BuffHandler = require("app.src.World.Entity.Buff.BuffHandler")
local BuffHandler = ____BuffHandler.BuffHandler
local ____ItemHandler = require("app.src.World.Entity.Item.ItemHandler")
local ItemHandler = ____ItemHandler.ItemHandler
local ____GenericAbilityHandler = require("app.src.World.Entity.GenericAbilities.GenericAbilityHandler")
local GenericAbilityHandler = ____GenericAbilityHandler.GenericAbilityHandler
local ____VoidTicker = require("app.src.World.Game.VoidTicker")
local VoidTicker = ____VoidTicker.VoidTicker
local ____EventQueue = require("app.src.lib.WCEventQueue.EventQueue")
local EventQueue = ____EventQueue.EventQueue
local ____SafeEventQueue = require("app.src.lib.WCEventQueue.SafeEventQueue")
local SafeEventQueue = ____SafeEventQueue.SafeEventQueue
local ____TimedEventQueue = require("app.src.lib.WCEventQueue.TimedEventQueue")
local TimedEventQueue = ____TimedEventQueue.TimedEventQueue
____exports.WarcraftMaul = {}
local WarcraftMaul = ____exports.WarcraftMaul
WarcraftMaul.name = "WarcraftMaul"
WarcraftMaul.__index = WarcraftMaul
WarcraftMaul.prototype = {}
WarcraftMaul.prototype.____getters = {}
WarcraftMaul.prototype.__index = __TS__Index(WarcraftMaul.prototype)
WarcraftMaul.prototype.constructor = WarcraftMaul
function WarcraftMaul.new(...)
    local self = setmetatable({}, WarcraftMaul.prototype)
    self:____constructor(...)
    return self
end
function WarcraftMaul.prototype.____constructor(self, creepAbilityHandler)
    self.debugMode = false
    self.gameEnded = false
    self.waveTimer = settings.GAME_TIME_BEFORE_START
    self.gameTime = 0
    self.gameEndTimer = settings.GAME_END_TIME
    self.gameLives = settings.INITIAL_LIVES
    self.startLives = settings.INITIAL_LIVES
    self.players = Map.new()
    self.enemies = {}
    if GetPlayerName(
        Player(COLOUR.RED)
    ) == "WorldEdit" then
        self.debugMode = true
    end
    if self.debugMode then
        Log.Init(
            {
                StringSink.new(LogLevel.Debug, SendMessageUnlogged)
            }
        )
        Log.Debug("Debug mode enabled")
    end
    self.gameCommandHandler = Commands.new(self)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            if GetPlayerSlotState(
                Player(i)
            ) == PLAYER_SLOT_STATE_PLAYING then
                if GetPlayerController(
                    Player(i)
                ) == MAP_CONTROL_USER then
                    self.players:set(
                        i,
                        Defender.new(i, self)
                    )
                end
            end
            i = i + 1
        end
    end
    __TS__ArrayPush(
        self.enemies,
        Attacker.new(COLOUR.NAVY, self)
    )
    __TS__ArrayPush(
        self.enemies,
        Attacker.new(COLOUR.TURQUOISE, self)
    )
    __TS__ArrayPush(
        self.enemies,
        Attacker.new(COLOUR.VOILET, self)
    )
    __TS__ArrayPush(
        self.enemies,
        Attacker.new(COLOUR.WHEAT, self)
    )
    for ____, enemy in ipairs(self.enemies) do
        for ____, enemyAlly in ipairs(self.enemies) do
            enemy:makeAlliance(enemyAlly)
        end
    end
    settings:InitializeStaticSounds()
    self.worldMap = WorldMap.new(self)
    self.eventQueue = EventQueue.new()
    self.safeEventQueue = SafeEventQueue.new(self)
    self.timedEventQueue = TimedEventQueue.new(self)
    self.gameDamageEngineGlobals = DamageEngineGlobals.new()
    self.towerTicker = TowerTicker.new()
    self.voidTicker = VoidTicker.new(self)
    self.gameDamageEngine = DamageEngine.new(self.gameDamageEngineGlobals)
    self.buffHandler = BuffHandler.new(self)
    self.abilityHandler = GenericAbilityHandler.new(self)
    self.itemHandler = ItemHandler.new(self)
    self._creepAbilityHandler = creepAbilityHandler
    creepAbilityHandler:SetupGame(self)
    self.diffVote = Vote.new(self)
    self.racePicking = RacePicking.new(self)
    self.sellTower = SellTower.new(self)
    for ____, quest in ipairs(Quests) do
        CreateQuestBJ(quest.stype, quest.title, quest.body, quest.icon)
    end
    SendMessage("Welcome to Warcraft Maul Reimagined")
    SendMessage(
        "This is build: " .. tostring(BUILD_NUMBER) .. ", built " .. tostring(BUILD_DATE) .. "."
    )
end
function WarcraftMaul.prototype.____getters.creepAbilityHandler(self)
    return self._creepAbilityHandler
end
function WarcraftMaul.prototype.DefeatAllPlayers(self)
    for player in __TS__Iterator(
        self.players:values()
    ) do
        player:defeatPlayer()
    end
end
function WarcraftMaul.prototype.GameWin(self)
    if self.gameLives > 0 then
        PlaySoundBJ(settings.Sounds.victorySound)
        SendMessage("|cFFF48C42YOU HAVE WON!|r")
        SendMessage("You can either leave the game or stay for bonus rounds")
        self:GameWinEffects()
    end
end
function WarcraftMaul.prototype.GameWinEffects(self)
    self.eventQueue:AddLow(
        function() return self:SpamEffects() end
    )
end
function WarcraftMaul.prototype.SpamEffects(self)
    local x = GetRandomInt(0, 10000) - 5000
    local y = GetRandomInt(0, 10000) - 5000
    DestroyEffect(
        AddSpecialEffect("Abilities\\Spells\\Human\\DispelMagic\\DispelMagicTarget.mdl", x, y)
    )
    self.eventQueue:AddLow(
        function() return self:SpamEffects() end
    )
    return true
end
function WarcraftMaul.prototype.PrettifyGameTime(self, sec)
    local hrs = math.floor(sec / 3600)
    local min = math.floor((sec - (hrs * 3600)) / 60)
    local seconds = sec - (hrs * 3600) - (min * 60)
    seconds = math.floor(seconds * 100 + 0.5) / 100
    local prettyMinutes = (min < 10 and "0" .. tostring(min) or tostring(min))
    local prettySeconds = (seconds < 10 and "0" .. tostring(
        math.floor(seconds)
    ) or tostring(
        math.floor(seconds)
    ))
    local result = (hrs < 10 and "0" .. tostring(hrs) or tostring(hrs))
    result = tostring(result) .. ":" .. tostring(prettyMinutes)
    result = tostring(result) .. ":" .. tostring(prettySeconds)
    return Util:ColourString(
        "#999999",
        tostring(result)
    )
end
function WarcraftMaul.prototype.GameOver(self)
    self.gameEndTimer = settings.GAME_END_TIME
    self.gameEnded = true
    PlaySoundBJ(settings.Sounds.defeatSound)
    SendMessage("|cFFFF0000GAME OVER|r")
    self.worldMap:RemoveEveryUnit()
end
return ____exports
