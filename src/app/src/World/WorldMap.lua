--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Ship = require("app.src.World.Entity.Ship")
local Ship = ____Ship.Ship
local ____WaveCreep = require("app.src.World.Entity.WaveCreep")
local WaveCreep = ____WaveCreep.WaveCreep
local ____Race = require("app.src.World.Game.Races.Race")
local Race = ____Race.Race
local ____PlayerSpawns = require("app.src.World.Entity.PlayerSpawns")
local PlayerSpawns = ____PlayerSpawns.PlayerSpawns
local ____SpawnedCreeps = require("app.src.World.Entity.SpawnedCreeps")
local SpawnedCreeps = ____SpawnedCreeps.SpawnedCreeps
local ____CheckPoint = require("app.src.World.Entity.CheckPoint")
local CheckPoint = ____CheckPoint.CheckPoint
local ____Teleporter = require("app.src.World.Entity.Teleporter")
local Teleporter = ____Teleporter.Teleporter
local ____RaceVoid = require("app.src.World.Game.Races.RaceVoid")
local RaceVoid = ____RaceVoid.RaceVoid
local ____RaceLootBoxer = require("app.src.World.Game.Races.RaceLootBoxer")
local RaceLootBoxer = ____RaceLootBoxer.RaceLootBoxer
local ____AntiBlock = require("app.src.World.Antiblock.AntiBlock")
local AntiBlock = ____AntiBlock.AntiBlock
local ____Maze = require("app.src.World.Antiblock.Maze")
local Maze = ____Maze.Maze
local Walkable = ____Maze.Walkable
local settings = require("app.src.World.GlobalSettings")
local ____TowerConstruction = require("app.src.World.Entity.Tower.TowerConstruction")
local TowerConstruction = ____TowerConstruction.TowerConstruction
local ____DirectionalArrow = require("app.src.World.Game.DirectionalArrow")
local DirectionalArrow = ____DirectionalArrow.DirectionalArrow
local ____ArchimondeGate = require("app.src.World.Game.ArchimondeGate")
local ArchimondeGate = ____ArchimondeGate.ArchimondeGate
local ____ArchimondeTeleport = require("app.src.World.Game.ArchimondeTeleport")
local ArchimondeTeleport = ____ArchimondeTeleport.ArchimondeTeleport
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local ____GameTurn = require("app.src.World.Game.BaseMaul.GameTurn")
local GameTurn = ____GameTurn.GameTurn
____exports.WorldMap = {}
local WorldMap = ____exports.WorldMap
WorldMap.name = "WorldMap"
WorldMap.__index = WorldMap
WorldMap.prototype = {}
WorldMap.prototype.____getters = {}
WorldMap.prototype.__index = __TS__Index(WorldMap.prototype)
WorldMap.prototype.____setters = {}
WorldMap.prototype.__newindex = __TS__NewIndex(WorldMap.prototype)
WorldMap.prototype.constructor = WorldMap
function WorldMap.new(...)
    local self = setmetatable({}, WorldMap.prototype)
    self:____constructor(...)
    return self
end
function WorldMap.prototype.____constructor(self, game)
    self.worldCreatures = Map.new()
    self.waveCreeps = {}
    self.races = {}
    self.playerSpawns = {}
    self.playerMazes = {}
    self.disabledRaces = 0
    self.game = game
    self:setupWorldCreatures()
    self._spawnedCreeps = SpawnedCreeps.new(self)
    self.towerConstruction = TowerConstruction.new(game)
    self.gameTimeTrigger = Trigger.new()
    self.gameTimeTrigger:RegisterTimerEventPeriodic(1)
    self.gameTimeTrigger:AddAction(
        function() return self:UpdateGameTime() end
    )
    self.gameTurn = GameTurn.new()
    self.antiBlock = AntiBlock.new(self)
end
function WorldMap.prototype.____getters.spawnedCreeps(self)
    return self._spawnedCreeps
end
function WorldMap.prototype.____setters.spawnedCreeps(self, value)
    self._spawnedCreeps = value
end
function WorldMap.prototype.setupWorldCreatures(self)
    self.ship = Ship.new(
        CreateUnit(
            Player(COLOUR.NAVY),
            FourCC("n05G"),
            63,
            -5343.5,
            0
        ),
        self
    )
    self:createCreepWaves()
    self:createDummyCreeps()
    self:setupRaces()
    self:setupCheckpoint()
    self:setupMazes()
    self:setupArrows()
end
function WorldMap.prototype.setupArrows(self)
    local directionalArrows = {}
    do
        local playerId = 0
        while playerId < 13 do
            local firstSpawn = self.playerSpawns[playerId + 1].spawnOne
            if firstSpawn == nil then
                return
            end
            local firstCheckpoint = firstSpawn.next
            if firstCheckpoint == nil then
                return
            end
            local secondCheckpoint = firstCheckpoint.next
            if secondCheckpoint == nil then
                return
            end
            local modelPath = ""
            modelPath = "Abilities\\Spells\\NightElf\\FaerieDragonInvis\\FaerieDragon_Invis.mdl"
            __TS__ArrayPush(
                directionalArrows,
                DirectionalArrow.new(
                    modelPath,
                    GetRectCenterX(firstCheckpoint.rectangle),
                    GetRectCenterY(firstCheckpoint.rectangle),
                    GetRectCenterX(secondCheckpoint.rectangle),
                    GetRectCenterY(secondCheckpoint.rectangle)
                )
            )
            playerId = playerId + 1
        end
    end
    local t = CreateTimer()
    TimerStart(
        t,
        10,
        false,
        function()
            local directionalArrow = table.remove(directionalArrows)
            while directionalArrow ~= nil do
                directionalArrow:Destroy()
                directionalArrow = table.remove(directionalArrows)
            end
        end
    )
end
function WorldMap.prototype.createDummyCreeps(self)
    local dummyCreeps = {}
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("u006"),
            1664,
            3072,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("hC04"),
            1792,
            3072,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("eC05"),
            1920,
            3072,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("hC16"),
            2048,
            3072,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("nC17"),
            2176,
            3072,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("nC29"),
            1664,
            2944,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("o01C"),
            1792,
            2944,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("nC30"),
            1920,
            2944,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("oC31"),
            2048,
            2944,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("nC33"),
            2176,
            2944,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("n008"),
            1664,
            2816,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("eC38"),
            1792,
            2816,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("nC39"),
            1920,
            2816,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("nC40"),
            2048,
            2816,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("nC41"),
            2176,
            2816,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("nC42"),
            1664,
            2688,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("uC43"),
            1792,
            2688,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("hC44"),
            1920,
            2688,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("uC45"),
            2048,
            2688,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("n004"),
            2176,
            2688,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("hC48"),
            1664,
            2560,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("oC47"),
            1792,
            2560,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("nC49"),
            1920,
            2560,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("nC50"),
            2048,
            2560,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("nC51"),
            2176,
            2560,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("nC69"),
            1664,
            2432,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("eC52"),
            1792,
            2432,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("oC70"),
            1920,
            2432,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("hC95"),
            2048,
            2432,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("uC71"),
            2176,
            2432,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("hC76"),
            1664,
            2304,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("h03Y"),
            1792,
            2304,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("h03Z"),
            1920,
            2304,
            270
        )
    )
    __TS__ArrayPush(
        dummyCreeps,
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("h040"),
            2048,
            2304,
            270
        )
    )
    for ____, creep in ipairs(dummyCreeps) do
        SetUnitInvulnerable(creep, true)
        PauseUnit(creep, true)
    end
    self.archimondeDummy = CreateUnit(
        Player(COLOUR.NAVY),
        FourCC("u000"),
        4868,
        -4964,
        240
    )
    PauseUnitBJ(true, self.archimondeDummy)
    self.archimondeGate = ArchimondeGate.new(self.archimondeDummy)
    self.archimondeTeleport = ArchimondeTeleport.new(self.archimondeDummy)
    CreateUnit(
        Player(PLAYER_NEUTRAL_PASSIVE),
        FourCC("n017"),
        0,
        -970,
        bj_UNIT_FACING
    )
    CreateUnit(
        Player(PLAYER_NEUTRAL_PASSIVE),
        FourCC("n017"),
        -4400,
        4737,
        bj_UNIT_FACING
    )
    CreateUnit(
        Player(PLAYER_NEUTRAL_PASSIVE),
        FourCC("n017"),
        4400,
        4737,
        bj_UNIT_FACING
    )
    CreateUnit(
        Player(PLAYER_NEUTRAL_PASSIVE),
        FourCC("n017"),
        -2176,
        700,
        bj_UNIT_FACING
    )
    CreateUnit(
        Player(PLAYER_NEUTRAL_PASSIVE),
        FourCC("n017"),
        2176,
        700,
        bj_UNIT_FACING
    )
    CreateUnit(
        Player(PLAYER_NEUTRAL_PASSIVE),
        FourCC("n017"),
        -4400,
        -2500,
        bj_UNIT_FACING
    )
    CreateUnit(
        Player(PLAYER_NEUTRAL_PASSIVE),
        FourCC("n017"),
        4400,
        -2500,
        bj_UNIT_FACING
    )
    CreateUnit(
        Player(PLAYER_NEUTRAL_PASSIVE),
        FourCC("n017"),
        1950,
        -3500,
        bj_UNIT_FACING
    )
    CreateUnit(
        Player(PLAYER_NEUTRAL_PASSIVE),
        FourCC("n017"),
        -1950,
        -3500,
        bj_UNIT_FACING
    )
end
function WorldMap.prototype.createCreepWaves(self)
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(1, "u006", "Wisp")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(2, "hC04", "Clockwerk")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(3, "eC05", "Acolyte")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(4, "hC16", "Militia")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(5, "nC17", "Wind Rider")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(6, "nC29", "Tauren Mystic")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(7, "o01C", "Grunt")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(8, "nC30", "Makrura Snapper")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(9, "oC31", "Mutant")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(10, "nC33", "Mini-Tank")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(11, "n008", "Enraged Yeti")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(12, "eC38", "Faceless Brute")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(13, "nC39", "Stampeding Reptile")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(14, "nC40", "Nymph")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(15, "nC41", "Matured Dragon")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(16, "nC42", "Merfolk Champion")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(17, "uC43", "Eternal Spirit")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(18, "hC44", "Granite Golem")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(19, "uC45", "Walking Corpse")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(20, "n004", "Adult Dragon")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(21, "hC48", "Bear")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(22, "oC47", "Heavy Tank")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(23, "nC49", "Big Game Hunter")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(24, "nC50", "Water Spirit")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(25, "nC51", "Ancient Dragon")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(26, "nC69", "Steel Golem")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(27, "eC52", "Demonic Minion")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(28, "oC70", "Fire Spirit")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(29, "hC95", "Demon Queen")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(30, "uC71", "Nether Dragon")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(31, "hC76", "Blood Golem")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(32, "h03Y", "Big Bad Ogre")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(33, "h03Z", "Snap Dragon")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(34, "h040", "Zergling")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(35, "uC72", "Archimonde")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(36, "hC79", "CRAB OF DEATH")
    )
    __TS__ArrayPush(
        self.waveCreeps,
        WaveCreep.new(37, "uC73", "Deathwing")
    )
end
function WorldMap.prototype.setupRaces(self)
    __TS__ArrayPush(
        self.races,
        Race.new("h03L", "Workers Union", "I01A", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("uC98", "Demon Portal", "I001", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("oC22", "Undead Necropolis", "I002", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("eC10", "Aviaries", "I003", self, false)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("u002", "High Elf Barracks", "I004", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("u001", "Outland", "I005", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("hC07", "Human Town Hall", "I006", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("nC03", "Orc Stronghold", "I007", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("n03W", "High Elf Farm", "I025", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("uC13", "Giants Hall", "I009", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("e00A", "The Unique", "I027", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("e007", "The Summons", "I00B", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("n00J", "Arachnid Hive", "I00C", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("o017", "Draenei Haven", "I00D", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("u00B", "Dragons", "I00E", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("e00F", "Night Elf Ancient", "I00F", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("e00W", "Elementalists", "I024", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("e002", "Tavern", "I00H", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("e003", "Corrupted Night Elves", "I00I", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("e005", "Goblins", "I00J", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("n03M", "Heros Altar", "NULL", self, false)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("e00D", "Caerbannog", "I000", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("n01V", "Critters UNITE", "I00L", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("n02A", "Gnoll Republic", "I00M", self)
    )
    __TS__ArrayPush(
        self.races,
        RaceVoid.new("h02T", "Void Cult", "I019", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("n02S", "Alliance of Blades", "I00P", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("n03C", "Cavernous Creatures", "I00Q", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("n046", "Forest Troll Hut", "I00O", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("n014", "Ice Troll Hut", "I00R", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("n03W", "Dark Troll Hut", "NULL", self, false)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("n04I", "The Forsaken", "I00T", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("e00H", "Dwarven Mine", "I00U", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("e00G", "Galaxy", "I00Z", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("oC75", "Naxxramas", "I02G", self)
    )
    __TS__ArrayPush(
        self.races,
        RaceLootBoxer.new("u043", "Loot Boxer", "I02D", self)
    )
    __TS__ArrayPush(
        self.races,
        Race.new("u01B", "Shrine of Buffs", "I026", self, false)
    )
end
function WorldMap.prototype.setupCheckpoint(self)
    local RedSpawns = PlayerSpawns.new(self, COLOUR.RED)
    RedSpawns.spawnOne = CheckPoint.new(
        Rect(-1792, 4736, -1472, 5056),
        self
    )
    RedSpawns.spawnTwo = CheckPoint.new(
        Rect(-1792, 4416, -1472, 4736),
        self
    )
    local RedCheckpoint = RedSpawns.spawnOne
    RedCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        RedCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-2464, 4704, -2400, 4768),
            self
        )
    )
    RedCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        RedCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-3616, 4704, -3552, 4768),
            self
        )
    )
    RedCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        RedCheckpoint,
        "next",
        Teleporter.new(
            Rect(-4384, 4704, -4320, 4768),
            self,
            270
        )
    )
    RedCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        RedCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-4384, 3392, -4320, 3456),
            self
        )
    )
    self.playerSpawns[COLOUR.RED + 1] = RedSpawns
    local BlueSpawns = PlayerSpawns.new(self, COLOUR.BLUE)
    BlueSpawns.spawnOne = CheckPoint.new(
        Rect(-320, 4768, 0, 5088),
        self
    )
    BlueSpawns.spawnTwo = CheckPoint.new(
        Rect(0, 4768, 320, 5088),
        self
    )
    local BluePrimaryCheckpoint = BlueSpawns.spawnOne
    BluePrimaryCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        BluePrimaryCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-64, 4032, 64, 4160),
            self
        )
    )
    BluePrimaryCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        BluePrimaryCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-64, 2880, 64, 3008),
            self
        )
    )
    BluePrimaryCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        BluePrimaryCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-64, 1920, 64, 2016),
            self
        )
    )
    local BlueSecondaryCheckpoint = BlueSpawns.spawnTwo
    BlueSecondaryCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        BlueSecondaryCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-64, 4032, 64, 4160),
            self
        )
    )
    BlueSecondaryCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        BlueSecondaryCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-64, 2880, 64, 3008),
            self
        )
    )
    BlueSecondaryCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        BlueSecondaryCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-64, 1920, 64, 2016),
            self
        )
    )
    self.playerSpawns[COLOUR.BLUE + 1] = BlueSpawns
    local TealSpawns = PlayerSpawns.new(self, COLOUR.TEAL)
    TealSpawns.spawnOne = CheckPoint.new(
        Rect(1472, 4768, 1792, 5088),
        self
    )
    TealSpawns.spawnTwo = CheckPoint.new(
        Rect(1472, 4448, 1792, 4768),
        self
    )
    local TealCheckpoint = TealSpawns.spawnOne
    TealCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        TealCheckpoint,
        "next",
        CheckPoint.new(
            Rect(2400, 4704, 2464, 4768),
            self
        )
    )
    TealCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        TealCheckpoint,
        "next",
        CheckPoint.new(
            Rect(3552, 4704, 3616, 4768),
            self
        )
    )
    TealCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        TealCheckpoint,
        "next",
        Teleporter.new(
            Rect(4320, 4704, 4384, 4768),
            self,
            270
        )
    )
    TealCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        TealCheckpoint,
        "next",
        CheckPoint.new(
            Rect(4320, 3392, 4384, 3456),
            self
        )
    )
    self.playerSpawns[COLOUR.TEAL + 1] = TealSpawns
    local PurpleSpawns = PlayerSpawns.new(self, COLOUR.PURPLE)
    PurpleSpawns.spawnOne = CheckPoint.new(
        Rect(4032, 128, 4352, 448),
        self
    )
    PurpleSpawns.spawnTwo = CheckPoint.new(
        Rect(4352, 128, 4672, 448),
        self
    )
    local PurpleCheckpoint = PurpleSpawns.spawnOne
    PurpleCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        PurpleCheckpoint,
        "next",
        CheckPoint.new(
            Rect(4320, -544, 4384, -480),
            self
        )
    )
    PurpleCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        PurpleCheckpoint,
        "next",
        CheckPoint.new(
            Rect(4320, -1696, 4384, -1632),
            self
        )
    )
    PurpleCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        PurpleCheckpoint,
        "next",
        Teleporter.new(
            Rect(4320, -2464, 4384, -2400),
            self,
            180
        )
    )
    PurpleCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        PurpleCheckpoint,
        "next",
        CheckPoint.new(
            Rect(4672, -3488, 4736, -3424),
            self
        )
    )
    self.playerSpawns[COLOUR.PURPLE + 1] = PurpleSpawns
    local YellowSpawns = PlayerSpawns.new(self, COLOUR.YELLOW)
    YellowSpawns.spawnOne = CheckPoint.new(
        Rect(-320, 1664, 0, 1984),
        self
    )
    YellowSpawns.spawnTwo = CheckPoint.new(
        Rect(0, 1664, 320, 1984),
        self
    )
    local YellowPrimaryCheckpoint = YellowSpawns.spawnOne
    YellowPrimaryCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        YellowPrimaryCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-32, 992, 32, 1056),
            self
        )
    )
    YellowPrimaryCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        YellowPrimaryCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-32, -160, 32, -96),
            self
        )
    )
    YellowPrimaryCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        YellowPrimaryCheckpoint,
        "next",
        Teleporter.new(
            Rect(-32, -928, 32, -864),
            self,
            180
        )
    )
    YellowPrimaryCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        YellowPrimaryCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-2208, -2144, -2144, -2080),
            self
        )
    )
    local YellowSecondaryCheckpoint = YellowSpawns.spawnTwo
    YellowSecondaryCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        YellowSecondaryCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-32, 992, 32, 1056),
            self
        )
    )
    YellowSecondaryCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        YellowSecondaryCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-32, -160, 32, -96),
            self
        )
    )
    YellowSecondaryCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        YellowSecondaryCheckpoint,
        "next",
        Teleporter.new(
            Rect(-32, -928, 32, -864),
            self,
            180
        )
    )
    YellowSecondaryCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        YellowSecondaryCheckpoint,
        "next",
        CheckPoint.new(
            Rect(2144, -2144, 2208, -2080),
            self
        )
    )
    self.playerSpawns[COLOUR.YELLOW + 1] = YellowSpawns
    local OrangeSpawns = PlayerSpawns.new(self, COLOUR.ORANGE)
    OrangeSpawns.spawnOne = CheckPoint.new(
        Rect(-4672, 128, -4352, 448),
        self
    )
    OrangeSpawns.spawnTwo = CheckPoint.new(
        Rect(-4352, 128, -4032, 448),
        self
    )
    local OrangeCheckpoint = OrangeSpawns.spawnOne
    OrangeCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        OrangeCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-4384, -544, -4320, -480),
            self
        )
    )
    OrangeCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        OrangeCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-4384, -1696, -4320, -1632),
            self
        )
    )
    OrangeCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        OrangeCheckpoint,
        "next",
        Teleporter.new(
            Rect(-4384, -2464, -4320, -2400),
            self,
            0
        )
    )
    OrangeCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        OrangeCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-4768, -3488, -4704, -3424),
            self
        )
    )
    self.playerSpawns[COLOUR.ORANGE + 1] = OrangeSpawns
    local GreenSpawns = PlayerSpawns.new(self, COLOUR.GREEN)
    GreenSpawns.spawnOne = CheckPoint.new(
        Rect(-4800, -3456, -4480, -3136),
        self
    )
    GreenSpawns.spawnTwo = CheckPoint.new(
        Rect(-4800, -3776, -4480, -3456),
        self
    )
    local GreenCheckpoint = GreenSpawns.spawnOne
    GreenCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        GreenCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-3872, -3488, -3808, -3424),
            self
        )
    )
    GreenCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        GreenCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-2720, -3488, -2656, -3424),
            self
        )
    )
    GreenCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        GreenCheckpoint,
        "next",
        Teleporter.new(
            Rect(-1952, -3488, -1888, -3424),
            self,
            270
        )
    )
    self.playerSpawns[COLOUR.GREEN + 1] = GreenSpawns
    local PinkSpawns = PlayerSpawns.new(self, COLOUR.PINK)
    PinkSpawns.spawnOne = CheckPoint.new(
        Rect(4480, -3456, 4800, -3136),
        self
    )
    PinkSpawns.spawnTwo = CheckPoint.new(
        Rect(4480, -3776, 4800, -3456),
        self
    )
    local PinkCheckpoint = PinkSpawns.spawnOne
    PinkCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        PinkCheckpoint,
        "next",
        CheckPoint.new(
            Rect(3808, -3488, 3872, -3424),
            self
        )
    )
    PinkCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        PinkCheckpoint,
        "next",
        CheckPoint.new(
            Rect(2656, -3488, 2720, -3424),
            self
        )
    )
    PinkCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        PinkCheckpoint,
        "next",
        Teleporter.new(
            Rect(1888, -3488, 1952, -3424),
            self,
            270
        )
    )
    self.playerSpawns[COLOUR.PINK + 1] = PinkSpawns
    local GreysSpawns = PlayerSpawns.new(self, COLOUR.GRAY)
    GreysSpawns.spawnOne = CheckPoint.new(
        Rect(-160, -2464, 160, -2144),
        self
    )
    local GreysCheckpoint = GreysSpawns.spawnOne
    GreysCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        GreysCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-32, -3104, 32, -3040),
            self
        )
    )
    GreysCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        GreysCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-32, -4256, 32, -4192),
            self
        )
    )
    GreysCheckpoint.next = self.ship ~= nil and self.ship or nil
    self.playerSpawns[COLOUR.GRAY + 1] = GreysSpawns
    local BrownSpawns = PlayerSpawns.new(self, COLOUR.BROWN)
    BrownSpawns.spawnOne = CheckPoint.new(
        Rect(-4672, 3200, -4352, 3520),
        self
    )
    BrownSpawns.spawnTwo = CheckPoint.new(
        Rect(-4352, 3200, -4032, 3520),
        self
    )
    local BrownCheckpoint = BrownSpawns.spawnOne
    BrownCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        BrownCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-4384, 2528, -4320, 2592),
            self
        )
    )
    BrownCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        BrownCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-4384, 1376, -4320, 1440),
            self
        )
    )
    BrownCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        BrownCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-4416, 384, -4288, 480),
            self
        )
    )
    self.playerSpawns[COLOUR.BROWN + 1] = BrownSpawns
    local MaroonsSpawns = PlayerSpawns.new(self, COLOUR.MAROON)
    MaroonsSpawns.spawnOne = CheckPoint.new(
        Rect(4032, 3200, 4352, 3520),
        self
    )
    MaroonsSpawns.spawnTwo = CheckPoint.new(
        Rect(4352, 3200, 4672, 3520),
        self
    )
    local MaroonsCheckpoint = MaroonsSpawns.spawnOne
    MaroonsCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        MaroonsCheckpoint,
        "next",
        CheckPoint.new(
            Rect(4320, 2528, 4384, 2592),
            self
        )
    )
    MaroonsCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        MaroonsCheckpoint,
        "next",
        CheckPoint.new(
            Rect(4320, 1376, 4384, 1440),
            self
        )
    )
    MaroonsCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        MaroonsCheckpoint,
        "next",
        CheckPoint.new(
            Rect(4288, 384, 4416, 480),
            self
        )
    )
    self.playerSpawns[COLOUR.MAROON + 1] = MaroonsSpawns
    local LightBlueSpawns = PlayerSpawns.new(self, COLOUR.LIGHT_BLUE)
    LightBlueSpawns.spawnOne = CheckPoint.new(
        Rect(-2496, -2240, -2176, -1920),
        self
    )
    LightBlueSpawns.spawnTwo = CheckPoint.new(
        Rect(-2176, -2240, -1856, -1920),
        self
    )
    local LightBlueCheckpoint = LightBlueSpawns.spawnOne
    LightBlueCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        LightBlueCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-2208, -1312, -2144, -1248),
            self
        )
    )
    LightBlueCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        LightBlueCheckpoint,
        "next",
        CheckPoint.new(
            Rect(-2208, -160, -2144, -96),
            self
        )
    )
    LightBlueCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        LightBlueCheckpoint,
        "next",
        Teleporter.new(
            Rect(-2208, 608, -2144, 672),
            self,
            270
        )
    )
    self.playerSpawns[COLOUR.LIGHT_BLUE + 1] = LightBlueSpawns
    local DarkGreenSpawns = PlayerSpawns.new(self, COLOUR.DARK_GREEN)
    DarkGreenSpawns.spawnOne = CheckPoint.new(
        Rect(1856, -2240, 2176, -1920),
        self
    )
    DarkGreenSpawns.spawnTwo = CheckPoint.new(
        Rect(2176, -2240, 2496, -1920),
        self
    )
    local DarkGreenCheckpoint = DarkGreenSpawns.spawnOne
    DarkGreenCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        DarkGreenCheckpoint,
        "next",
        CheckPoint.new(
            Rect(2144, -1312, 2208, -1248),
            self
        )
    )
    DarkGreenCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        DarkGreenCheckpoint,
        "next",
        CheckPoint.new(
            Rect(2144, -160, 2208, -96),
            self
        )
    )
    DarkGreenCheckpoint = (function(o, i, v)
        o[i] = v
        return v
    end)(
        DarkGreenCheckpoint,
        "next",
        Teleporter.new(
            Rect(2144, 608, 2208, 672),
            self,
            270
        )
    )
    self.playerSpawns[COLOUR.DARK_GREEN + 1] = DarkGreenSpawns
    RedCheckpoint.next = BrownSpawns.spawnOne.next
    BrownCheckpoint.next = OrangeSpawns.spawnOne.next
    OrangeCheckpoint.next = GreenSpawns.spawnOne.next
    GreenCheckpoint.next = GreysSpawns.spawnOne
    TealCheckpoint.next = MaroonsSpawns.spawnOne.next
    MaroonsCheckpoint.next = PurpleSpawns.spawnOne.next
    PurpleCheckpoint.next = PinkSpawns.spawnOne.next
    PinkCheckpoint.next = GreysSpawns.spawnOne
    BluePrimaryCheckpoint.next = YellowSpawns.spawnOne.next
    BlueSecondaryCheckpoint.next = YellowSpawns.spawnTwo.next
    YellowPrimaryCheckpoint.next = LightBlueSpawns.spawnOne.next
    YellowSecondaryCheckpoint.next = DarkGreenSpawns.spawnOne.next
    DarkGreenCheckpoint.next = MaroonsCheckpoint
    LightBlueCheckpoint.next = BrownCheckpoint
end
function WorldMap.prototype.setupMazes(self)
    do
        local i = 0
        while i < #settings.PLAYER_AREAS do
            local minX = settings.PLAYER_AREAS[i + 1].minX
            local minY = settings.PLAYER_AREAS[i + 1].minY
            local maxX = settings.PLAYER_AREAS[i + 1].maxX
            local maxY = settings.PLAYER_AREAS[i + 1].maxY
            local width = math.abs((maxX - minX) / 64)
            local height = math.abs((maxY - minY) / 64)
            local g = {}
            do
                local j = 0
                while j < width do
                    g[j + 1] = {}
                    do
                        local k = 0
                        while k < height do
                            g[j + 1][k + 1] = Walkable.Walkable
                            k = k + 1
                        end
                    end
                    j = j + 1
                end
            end
            self.playerMazes[i + 1] = Maze.new(minX, minY, maxX, maxY, width, height, g)
            i = i + 1
        end
    end
end
function WorldMap.prototype.HealEverythingOnMap(self)
    local grp = GetUnitsInRectAll(
        GetPlayableMapRect()
    )
    ForGroupBJ(
        grp,
        function()
            SetUnitLifePercentBJ(
                GetEnumUnit(),
                100
            )
        end
    )
    DestroyGroup(grp)
end
function WorldMap.prototype.ReplaceRunedBricksWithLava(self)
    self:ReplaceTerrainTypeId("Irbk", "Dlvc", -5888, 5888, -5888, 5888)
end
function WorldMap.prototype.ReplaceTerrainTypeId(self, OldTerrain, NewTerrain, MinX, MaxX, MinY, MaxY)
    do
        while MinY < MaxY do
            if GetTerrainType(MinX, MinY) == FourCC(OldTerrain) then
                SetTerrainType(
                    MinX,
                    MinY,
                    FourCC(NewTerrain),
                    -1,
                    1,
                    1
                )
                if GetRandomInt(0, 99) > 89 then
                    AddSpecialEffect("Abilities\\Spells\\Human\\FlameStrike\\FlameStrikeEmbers.mdl", MinX, MinY)
                end
            end
            if MinX >= MaxX then
                MinY = MinY + 128
                MinX = -5888
            else
                MinX = MinX + 128
            end
            MinY = MinY + 1
        end
    end
end
function WorldMap.prototype.RemoveEveryUnit(self)
    local grp = GetUnitsInRectAll(
        GetPlayableMapRect()
    )
    ForGroupBJ(
        grp,
        function() return self:RemoveUnitIfNotShip() end
    )
    DestroyGroup(grp)
end
function WorldMap.prototype.RemoveUnitIfNotShip(self)
    if GetUnitTypeId(
        GetEnumUnit()
    ) == FourCC("n05G") then
        KillUnit(
            GetEnumUnit()
        )
    else
        RemoveUnit(
            GetEnumUnit()
        )
    end
end
function WorldMap.prototype.UpdateGameTime(self)
    if self.game.gameEnded then
        do
            local ____obj, ____index = self.game, "gameEndTimer"
            ____obj[____index] = ____obj[____index] - 1
        end
        if self.game.scoreBoard then
            MultiboardSetItemValueBJ(self.game.scoreBoard.board, 1, 1, "End Time")
            MultiboardSetItemValueBJ(
                self.game.scoreBoard.board,
                2,
                1,
                self.game:PrettifyGameTime(self.game.gameEndTimer)
            )
        end
        if self.game.gameEndTimer <= 0 then
            self.game:DefeatAllPlayers()
        end
    else
        do
            local ____obj, ____index = self.game, "gameTime"
            ____obj[____index] = ____obj[____index] + 1
        end
        if self.gameRoundHandler then
            self.gameRoundHandler:GameTimeUpdateEvent()
        end
    end
end
return ____exports
