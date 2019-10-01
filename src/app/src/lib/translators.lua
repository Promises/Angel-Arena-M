--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
function SendMessage(msg)
    DisplayTimedTextToForce(
        bj_FORCE_ALL_PLAYERS,
        10,
        tostring(msg)
    )
end
console = {}
console.name = "console"
console.__index = console
console.prototype = {}
console.prototype.__index = console.prototype
console.prototype.constructor = console
function console.new(...)
    local self = setmetatable({}, console.prototype)
    self:____constructor(...)
    return self
end
function console.prototype.____constructor(self)
end
function console.log(self, input)
    SendMessage(input)
end
function SendMessageUnlogged(msg)
    DisplayTimedTextToForce(
        bj_FORCE_ALL_PLAYERS,
        10,
        tostring(msg)
    )
end
function ToString(self, input)
    return tostring(input)
end
function DecodeFourCC(self, fourcc)
    return string.char((fourcc >> 24) & 255, (fourcc >> 16) & 255, (fourcc >> 8) & 255, fourcc & 255)
end
Util = {}
Util.name = "Util"
Util.__index = Util
Util.prototype = {}
Util.prototype.__index = Util.prototype
Util.prototype.constructor = Util
function Util.new(...)
    local self = setmetatable({}, Util.prototype)
    self:____constructor(...)
    return self
end
function Util.prototype.____constructor(self)
end
function Util.isUnitCreep(self, u)
    local ownerID = GetPlayerId(
        GetOwningPlayer(u)
    )
    local ____switch9 = ownerID
    if ____switch9 == COLOUR.NAVY then
        goto ____switch9_case_0
    end
    if ____switch9 == COLOUR.TURQUOISE then
        goto ____switch9_case_1
    end
    if ____switch9 == COLOUR.VOILET then
        goto ____switch9_case_2
    end
    if ____switch9 == COLOUR.WHEAT then
        goto ____switch9_case_3
    end
    goto ____switch9_case_default
    ::____switch9_case_0::
    ::____switch9_case_1::
    ::____switch9_case_2::
    ::____switch9_case_3::
    do
        return true
    end
    ::____switch9_case_default::
    do
        return false
    end
    ::____switch9_end::
end
function Util.ColourString(self, colour, str)
    return "|cFF" .. tostring(
        string.sub(colour, 2)
    ) .. tostring(str) .. "|r"
end
function Util.RandomInt(self, min, max)
    return math.floor(
        math.random() * (max - min + 1)
    ) + min
end
function Util.ShuffleArray(self, arr)
    do
        local i = #arr - 1
        while i > 0 do
            local j = math.floor(
                math.random() * (i + 1)
            )
            local temp = arr[i + 1]
            arr[i + 1] = arr[j + 1]
            arr[j + 1] = temp
            i = i - 1
        end
    end
end
function Util.RandomHash(self, length)
    local result = ""
    local characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    local charactersLength = #characters
    do
        local i = 0
        while i < length do
            result = tostring(result) .. tostring(
                string.sub(
                    characters,
                    math.floor(
                        math.random() * charactersLength
                    ) + 1,
                    math.floor(
                        math.random() * charactersLength
                    ) + 1
                )
            )
            i = i + 1
        end
    end
    return result
end
function Util.GetRandomKey(self, collection)
    local index = math.floor(
        math.random() * collection.size
    )
    local cntr = 0
    for key in __TS__Iterator(
        collection:keys()
    ) do
        if (function()
            local ____tmp = cntr
            cntr = ____tmp + 1
            return ____tmp
        end)() == index then
            return key
        end
    end
end
function Util.GetAllKeys(self, collection)
    local keys = {}
    for key in __TS__Iterator(
        collection:keys()
    ) do
        __TS__ArrayPush(keys, key)
    end
    return keys
end
function Util.ArraysToString(self, arr)
    local output = "["
    do
        local i = 0
        while i < #arr do
            do
                if i == #arr - 1 then
                    output = tostring(output) .. "\"" .. tostring(arr[i + 1]) .. "\""
                    goto __continue22
                end
                output = tostring(output) .. "\"" .. tostring(arr[i + 1]) .. "\", "
            end
            ::__continue22::
            i = i + 1
        end
    end
    output = tostring(output) .. "]"
    return output
end
function Util.ParseInt(self, str)
    return str
end
function Util.ParsePositiveInt(self, str)
    local int = __TS__Number(str)
    if int < 0 then
        return 0
    end
    return int
end
function Util.Round(self, x)
    return math.floor(x + 0.5 - (x + 0.5) % 1)
end
Util.COLOUR_IDS = {RED = 0, BLUE = 1, TEAL = 2, PURPLE = 3, YELLOW = 4, ORANGE = 5, GREEN = 6, PINK = 7, GRAY = 8, GREY = 8, LIGHT_BLUE = 9, LIGHTBLUE = 9, LB = 9, DARK_GREEN = 10, DARKGREEN = 10, DG = 10, BROWN = 11, MAROON = 12, NAVY = 13, TURQUOISE = 14, VOILET = 15, WHEAT = 16, PEACH = 17, MINT = 18, LAVENDER = 19, COAL = 20, SNOW = 21, EMERALD = 22, PEANUT = 23}
COLOUR = {}
COLOUR.RED = 0
COLOUR[COLOUR.RED] = "RED"
COLOUR.BLUE = 1
COLOUR[COLOUR.BLUE] = "BLUE"
COLOUR.TEAL = 2
COLOUR[COLOUR.TEAL] = "TEAL"
COLOUR.PURPLE = 3
COLOUR[COLOUR.PURPLE] = "PURPLE"
COLOUR.YELLOW = 4
COLOUR[COLOUR.YELLOW] = "YELLOW"
COLOUR.ORANGE = 5
COLOUR[COLOUR.ORANGE] = "ORANGE"
COLOUR.GREEN = 6
COLOUR[COLOUR.GREEN] = "GREEN"
COLOUR.PINK = 7
COLOUR[COLOUR.PINK] = "PINK"
COLOUR.GRAY = 8
COLOUR[COLOUR.GRAY] = "GRAY"
COLOUR.LIGHT_BLUE = 9
COLOUR[COLOUR.LIGHT_BLUE] = "LIGHT_BLUE"
COLOUR.DARK_GREEN = 10
COLOUR[COLOUR.DARK_GREEN] = "DARK_GREEN"
COLOUR.BROWN = 11
COLOUR[COLOUR.BROWN] = "BROWN"
COLOUR.MAROON = 12
COLOUR[COLOUR.MAROON] = "MAROON"
COLOUR.NAVY = 13
COLOUR[COLOUR.NAVY] = "NAVY"
COLOUR.TURQUOISE = 14
COLOUR[COLOUR.TURQUOISE] = "TURQUOISE"
COLOUR.VOILET = 15
COLOUR[COLOUR.VOILET] = "VOILET"
COLOUR.WHEAT = 16
COLOUR[COLOUR.WHEAT] = "WHEAT"
COLOUR.PEACH = 17
COLOUR[COLOUR.PEACH] = "PEACH"
COLOUR.MINT = 18
COLOUR[COLOUR.MINT] = "MINT"
COLOUR.LAVENDER = 19
COLOUR[COLOUR.LAVENDER] = "LAVENDER"
COLOUR.COAL = 20
COLOUR[COLOUR.COAL] = "COAL"
COLOUR.SNOW = 21
COLOUR[COLOUR.SNOW] = "SNOW"
COLOUR.EMERALD = 22
COLOUR[COLOUR.EMERALD] = "EMERALD"
COLOUR.PEANUT = 23
COLOUR[COLOUR.PEANUT] = "PEANUT"
CREEP_TYPE = {}
CREEP_TYPE.NORMAL = 0
CREEP_TYPE[CREEP_TYPE.NORMAL] = "NORMAL"
CREEP_TYPE.AIR = 1
CREEP_TYPE[CREEP_TYPE.AIR] = "AIR"
CREEP_TYPE.CHAMPION = 2
CREEP_TYPE[CREEP_TYPE.CHAMPION] = "CHAMPION"
CREEP_TYPE.BOSS = 3
CREEP_TYPE[CREEP_TYPE.BOSS] = "BOSS"
ARMOUR_TYPE = {}
ARMOUR_TYPE.UNARMOURED = 0
ARMOUR_TYPE[ARMOUR_TYPE.UNARMOURED] = "UNARMOURED"
ARMOUR_TYPE.LIGHT = 1
ARMOUR_TYPE[ARMOUR_TYPE.LIGHT] = "LIGHT"
ARMOUR_TYPE.MEDIUM = 2
ARMOUR_TYPE[ARMOUR_TYPE.MEDIUM] = "MEDIUM"
ARMOUR_TYPE.HEAVY = 3
ARMOUR_TYPE[ARMOUR_TYPE.HEAVY] = "HEAVY"
ARMOUR_TYPE.FORTIFIED = 4
ARMOUR_TYPE[ARMOUR_TYPE.FORTIFIED] = "FORTIFIED"
ARMOUR_TYPE.HERO = 5
ARMOUR_TYPE[ARMOUR_TYPE.HERO] = "HERO"
