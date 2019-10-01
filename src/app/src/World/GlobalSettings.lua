--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____Rectangle = require("app.src.JassOverrides.Rectangle")
local Rectangle = ____Rectangle.Rectangle
____exports.ALLOW_PLAYER_TOWER_LOCATIONS = {{x = -1536, y = 5376}, {x = 640, y = 4992}, {x = 1536, y = 5376}, {x = 5120, y = 448}, {x = 768, y = 1984}, {x = -3616, y = 448}, {x = -4736, y = -2816}, {x = 4736, y = -2816}, {x = 512, y = -2176}, {x = -1536, y = -2176}, {x = 2816, y = -2176}, {x = -3712, y = 3456}, {x = 4992, y = 3456}}
____exports.INITIAL_LIVES = 100
____exports.GAME_END_TIME = 600
____exports.GAME_TIME_BEFORE_START = 90
____exports.GAME_TIME_BEFORE_WAVE = 20
____exports.GAME_GOLD_REWARD_BASE = 10
____exports.GAME_NAME = "Warcraft Maul Reimagined"
____exports.GAME_MODES = {}
____exports.GAME_MODES.CLASSIC = 0
____exports.GAME_MODES[____exports.GAME_MODES.CLASSIC] = "CLASSIC"
____exports.GAME_MODES.BLITZ = 1
____exports.GAME_MODES[____exports.GAME_MODES.BLITZ] = "BLITZ"
____exports.GAME_MODE_STRINGS = {"Classic Maul", "Blitz"}
____exports.GAME_MODE_COLOURS = {"#00A651", "#FF0000"}
____exports.DIFFICULTIES = {100, 200, 300, 400}
____exports.DIFFICULTY_STRINGS = {"Normal", "Medium", "Hard", "Extreme"}
____exports.DIFFICULTY_COLOURS = {"#00A651", "#FFCD00", "#FF0000", "#383838"}
____exports.COLOUR_CODES = {"#ff0303", "#0042ff", "#1ce6b9", "#540081", "#fffc00", "#fe8a0e", "#20c000", "#e55bb0", "#959697", "#7ebff1", "#106246", "#4a2a04", "#9b0000", "#0000c3", "#00eaff", "#be00fe", "#ebcd87", "#f8a48b", "#bfff80", "#dcb9eb", "#282828", "#ebf0ff", "#00781e", "#a46f33"}
____exports.CREEP_TYPE_NAMES = {"NORMAL", "AIR", "CHAMPION", "BOSS"}
____exports.CREEP_TYPE_COLOURS = {"#FFFFFF", "#999999", "#3737F2", "#F2A137"}
____exports.ARMOUR_TYPE_NAMES = {"UNARMOURED", "LIGHT", "MEDIUM", "HEAVY", "FORTIFIED", "HERO"}
____exports.ARMOUR_TYPE_COLOURS = {"#999999", "#6d7c86", "#416073", "#154360", "#CA8500", "#7525FF"}
____exports.ELEMENTALIST_ABILITIES = {
    FourCC("A0BO"),
    FourCC("A0BS"),
    FourCC("A0C0"),
    FourCC("A0C1"),
    FourCC("A0C2"),
    FourCC("A0C3")
}
____exports.AOB_ITEM_LOOT_LEVEL_ONE = {
    FourCC("I00A"),
    FourCC("I010"),
    FourCC("I011"),
    FourCC("I012"),
    FourCC("I013"),
    FourCC("I014"),
    FourCC("I015"),
    FourCC("I016")
}
____exports.AOB_ITEM_LOOT_LEVEL_TWO = {
    FourCC("I01D"),
    FourCC("I01C"),
    FourCC("I017"),
    FourCC("I01F"),
    FourCC("I01G"),
    FourCC("I01B"),
    FourCC("I01E"),
    FourCC("I018")
}
____exports.AOB_ITEM_LOOT_LEVEL_THREE = {
    FourCC("I01H"),
    FourCC("I01M"),
    FourCC("I01N"),
    FourCC("I01L"),
    FourCC("I01I"),
    FourCC("I01J"),
    FourCC("I01K"),
    FourCC("I01O")
}
____exports.AOB_ITEM_LOOT_LEVEL_FOUR = {
    FourCC("I01W"),
    FourCC("I01P"),
    FourCC("I01U"),
    FourCC("I01V"),
    FourCC("I01R"),
    FourCC("I01T"),
    FourCC("I01Q"),
    FourCC("I01S")
}
____exports.PLAYER_AREAS = {
    Rectangle.new({-4224, 3968, -1792, 5504}),
    Rectangle.new({-768, 2304, 768, 4736}),
    Rectangle.new({1792, 3968, 4224, 5504}),
    Rectangle.new({3584, -2304, 5120, 128}),
    Rectangle.new({-768, -768, 768, 1664}),
    Rectangle.new({-5120, -2304, -3584, 128}),
    Rectangle.new({-4480, -4224, -2048, -2688}),
    Rectangle.new({2048, -4224, 4480, -2688}),
    Rectangle.new({-768, -4864, 768, -2432}),
    Rectangle.new({-2944, -1920, -1408, 512}),
    Rectangle.new({1408, -1920, 2944, 512}),
    Rectangle.new({-5120, 768, -3584, 3200}),
    Rectangle.new({3584, 768, 5120, 3200})
}
____exports.Sounds = {}
local Sounds = ____exports.Sounds
Sounds.name = "Sounds"
Sounds.__index = Sounds
Sounds.prototype = {}
Sounds.prototype.__index = Sounds.prototype
Sounds.prototype.constructor = Sounds
function Sounds.new(...)
    local self = setmetatable({}, Sounds.prototype)
    self:____constructor(...)
    return self
end
function Sounds.prototype.____constructor(self)
end
Sounds.loseALifeSound = CreateSound("Abilities/Spells/Other/LoadUnload/Loading.wav", false, false, true, 10, 10, "DefaultEAXON")
Sounds.goldSound = CreateSound("Abilities/Spells/Items/ResourceItems/ReceiveGold.wav", false, true, true, 10, 10, "DefaultEAXON")
Sounds.victorySound = CreateSound("Sound/Music/mp3Music/PH1.mp3", false, false, false, 10, 10, "DefaultEAXON")
Sounds.defeatSound = CreateSound("Sound/Music/mp3Music/TragicConfrontation.mp3", false, false, false, 10, 10, "DefaultEAXON")
Sounds.impossibleDifficultySound = CreateSound("Sound/Music/mp3Music/PursuitTheme.mp3", false, false, false, 10, 10, "DefaultEAXON")
function ____exports.InitializeStaticSounds(self)
    SetSoundParamsFromLabel(____exports.Sounds.loseALifeSound, "LoadUnload")
    SetSoundDuration(____exports.Sounds.loseALifeSound, 740)
    SetSoundParamsFromLabel(____exports.Sounds.goldSound, "ReceiveGold")
    SetSoundDuration(____exports.Sounds.goldSound, 589)
    SetSoundChannel(____exports.Sounds.goldSound, 0)
    SetSoundDistances(____exports.Sounds.goldSound, 750, 1000)
end
____exports.UNIT_ORDER_CANCEL_UPGRADE = 851976
____exports.DamageTypePureExplosive = -2
____exports.DamageTypeExplosive = -1
____exports.DamageTypeCode = 1
____exports.DamageTypePure = 2
____exports.DamageTypeHeal = 3
____exports.DamageTypeBlocked = 4
____exports.DamageTypeReduced = 5
____exports.DamageTypeCriticalStrike = 6
____exports.DamageEventAOE = 1
____exports.DamageEventLevel = 1
____exports.ATTACK_TYPE_SPELLS = 0
____exports.ATTACK_TYPE_NORMAL = 1
____exports.ATTACK_TYPE_PIERCE = 2
____exports.ATTACK_TYPE_SIEGE = 3
____exports.ATTACK_TYPE_MAGIC = 4
____exports.ATTACK_TYPE_CHAOS = 5
____exports.ATTACK_TYPE_HERO = 6
____exports.DAMAGE_TYPE_UNKNOWN = 0
____exports.DAMAGE_TYPE_NORMAL = 4
____exports.DAMAGE_TYPE_ENHANCED = 5
____exports.DAMAGE_TYPE_FIRE = 8
____exports.DAMAGE_TYPE_COLD = 9
____exports.DAMAGE_TYPE_LIGHTNING = 10
____exports.DAMAGE_TYPE_POISON = 11
____exports.DAMAGE_TYPE_DISEASE = 12
____exports.DAMAGE_TYPE_DIVINE = 13
____exports.DAMAGE_TYPE_MAGIC = 14
____exports.DAMAGE_TYPE_SONIC = 15
____exports.DAMAGE_TYPE_ACID = 16
____exports.DAMAGE_TYPE_FORCE = 17
____exports.DAMAGE_TYPE_DEATH = 18
____exports.DAMAGE_TYPE_MIND = 19
____exports.DAMAGE_TYPE_PLANT = 20
____exports.DAMAGE_TYPE_DEFENSIVE = 21
____exports.DAMAGE_TYPE_DEMOLITION = 22
____exports.DAMAGE_TYPE_SLOW_POISON = 23
____exports.DAMAGE_TYPE_SPIRIT_LINK = 24
____exports.DAMAGE_TYPE_SHADOW_STRIKE = 25
____exports.DAMAGE_TYPE_UNIVERSAL = 26
____exports.WEAPON_TYPE_NONE = 0
____exports.WEAPON_TYPE_ML_CHOP = 1
____exports.WEAPON_TYPE_MM_CHOP = 2
____exports.WEAPON_TYPE_MH_CHOP = 3
____exports.WEAPON_TYPE_ML_SLICE = 4
____exports.WEAPON_TYPE_MM_SLICE = 5
____exports.WEAPON_TYPE_MH_SLICE = 6
____exports.WEAPON_TYPE_MM_BASH = 7
____exports.WEAPON_TYPE_MH_BASH = 8
____exports.WEAPON_TYPE_MM_STAB = 9
____exports.WEAPON_TYPE_MH_STAB = 10
____exports.WEAPON_TYPE_WL_SLICE = 11
____exports.WEAPON_TYPE_WM_SLICE = 12
____exports.WEAPON_TYPE_WH_SLICE = 13
____exports.WEAPON_TYPE_WL_BASH = 14
____exports.WEAPON_TYPE_WM_BASH = 15
____exports.WEAPON_TYPE_WH_BASH = 16
____exports.WEAPON_TYPE_WL_STAB = 17
____exports.WEAPON_TYPE_WM_STAB = 18
____exports.WEAPON_TYPE_CL_SLICE = 19
____exports.WEAPON_TYPE_CM_SLICE = 20
____exports.WEAPON_TYPE_CH_SLICE = 21
____exports.WEAPON_TYPE_AM_CHOP = 22
____exports.WEAPON_TYPE_RH_BASH = 23
____exports.udg_AttackTypeDebugStr = {"SPELLS", "NORMAL", "PIERCE", "SIEGE", "MAGIC", "CHAOS", "HERO"}
____exports.udg_DamageTypeDebugStr = {"UNKNOWN", nil, nil, nil, "NORMAL", "ENHANCED", nil, nil, "FIRE", "COLD", "LIGHTNING", "POISON", "DISEASE", "DIVINE", "MAGIC", "SONIC", "ACID", "FORCE", "DEATH", "MIND", "PLANT", "DEFENSIVE", "DEMOLITION", "SLOW_POISON", "SPIRIT_LINK", "SHADOW_STRIKE", "UNIVERSAL"}
____exports.udg_WeaponTypeDebugStr = {"NONE", "METAL_LIGHT_CHOP", "METAL_MEDIUM_CHOP", "METAL_HEAVY_CHOP", "METAL_LIGHT_SLICE", "METAL_MEDIUM_SLICE", "METAL_HEAVY_SLICE", "METAL_MEDIUM_BASH", "METAL_HEAVY_BASH", "METAL_MEDIUM_STAB", "METAL_HEAVY_STAB", "WOOD_LIGHT_SLICE", "WOOD_MEDIUM_SLICE", "WOOD_HEAVY_SLICE", "WOOD_LIGHT_BASH", "WOOD_MEDIUM_BASH", "WOOD_HEAVY_BASH", "WOOD_LIGHT_STAB", "WOOD_MEDIUM_STAB", "CLAW_LIGHT_SLICE", "CLAW_MEDIUM_SLICE", "CLAW_HEAVY_SLICE", "AXE_MEDIUM_CHOP", "ROCK_HEAVY_BASH"}
____exports.NO_LIVES_LOST = "|cFFF44242Co|r" .. "|cFFF47442ng|r" .. "|cFFF4A742ra|r" .. "|cFFEBF442tu|r" .. "|cFFC5F442la|r" .. "|cFF8FF442ti|r" .. "|cFF62F442on|r" .. "|cFF42F477s n|r" .. "|cFF42F4E5o l|r" .. "|cFF42A7F4iv|r" .. "|cFF425FF4es|r" .. "|cFF7A42F4 lo|r" .. "|cFFC542F4st!|r"
return ____exports
