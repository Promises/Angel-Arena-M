-- ceres header start

local ceres = {
}

local __ceres_hooks = {
    ["main::before"] = {},
    ["main::after"] = {},
    ["config::before"] = {},
    ["config::after"] = {}
}

local function __ceres_hookCall(hookName)
    for _, callback in pairs(__ceres_hooks[hookName]) do
        callback()
    end
end

local __ceres_customMain = nil
local __ceres_customConfig = nil

local function __ceresMain()
    __ceres_hookCall("main::before")
    if __ceres_customMain ~= nil then
        __ceres_customMain()
    else
        ceres.__oldMain()
    end
    __ceres_hookCall("main::after")
end

local function __ceresConfig()
    __ceres_hookCall("config::before")
    if __ceres_customConfig ~= nil then
        __ceres_customConfig()
    else
        ceres.__oldConfig()
    end
    __ceres_hookCall("config::after")
end

function ceres.addHook(hookName, callback)
    table.insert(__ceres_hooks[hookName], ceres.wrapCatch(callback))
end

function ceres.setMain(callback)
    __ceres_customMain = callback
end

function ceres.setConfig(callback)
    __ceres_customConfig = callback
end

function ceres.catch(callback, ...)
    local success, err = pcall(callback, ...)

    if not success then
        print(err)
    end
end

function ceres.wrapCatch(callback)
    return function(...)
        ceres.catch(callback, ...)
    end
end

local __modules = {}

require = function(name)
    local module = __modules[name]

    if module ~= nil then
        if module.initialized then
            return module.cached
        else
            module.initialized = true
            module.cached = module.loader()
            return module.cached
        end
    else
        error("module not found")
    end
end

-- ceres header end
gg_rct_Region_000 = nil
gg_rct_Region_001 = nil
gg_rct_Region_002 = nil
gg_rct_Region_003 = nil
gg_trg_Melee_Initialization = nil
function InitGlobals()
end

function CreateRegions()
    local we
    gg_rct_Region_000 = Rect(-5312.0, 1280.0, -3552.0, 2784.0)
    we = AddWeatherEffect(gg_rct_Region_000, FourCC("LRaa"))
    EnableWeatherEffect(we, true)
    gg_rct_Region_001 = Rect(-5312.0, 3296.0, -3680.0, 4992.0)
    we = AddWeatherEffect(gg_rct_Region_001, FourCC("RLlr"))
    EnableWeatherEffect(we, true)
    gg_rct_Region_002 = Rect(-5280.0, -800.0, -3680.0, 768.0)
    we = AddWeatherEffect(gg_rct_Region_002, FourCC("MEds"))
    EnableWeatherEffect(we, true)
    gg_rct_Region_003 = Rect(-5408.0, -4928.0, -3616.0, -3168.0)
    we = AddWeatherEffect(gg_rct_Region_003, FourCC("SNbs"))
    EnableWeatherEffect(we, true)
end

function Trig_Melee_Initialization_Actions()
    MeleeStartingVisibility()
    MeleeStartingHeroLimit()
    MeleeGrantHeroItems()
    MeleeStartingResources()
    MeleeClearExcessUnits()
    MeleeStartingUnits()
    MeleeStartingAI()
    MeleeInitVictoryDefeat()
end

function InitTrig_Melee_Initialization()
    gg_trg_Melee_Initialization = CreateTrigger()
    TriggerAddAction(gg_trg_Melee_Initialization, Trig_Melee_Initialization_Actions)
end

function InitCustomTriggers()
    InitTrig_Melee_Initialization()
end

function RunInitializationTriggers()
    ConditionalTriggerExecute(gg_trg_Melee_Initialization)
end

function InitCustomPlayerSlots()
    SetPlayerStartLocation(Player(0), 0)
    SetPlayerColor(Player(0), ConvertPlayerColor(0))
    SetPlayerRacePreference(Player(0), RACE_PREF_HUMAN)
    SetPlayerRaceSelectable(Player(0), true)
    SetPlayerController(Player(0), MAP_CONTROL_USER)
end

function InitCustomTeams()
    SetPlayerTeam(Player(0), 0)
end

function main()
    SetCameraBounds(-9472.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), -5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM), 9472.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), 5120.0 - GetCameraMargin(CAMERA_MARGIN_TOP), -9472.0 + GetCameraMargin(CAMERA_MARGIN_LEFT), 5120.0 - GetCameraMargin(CAMERA_MARGIN_TOP), 9472.0 - GetCameraMargin(CAMERA_MARGIN_RIGHT), -5632.0 + GetCameraMargin(CAMERA_MARGIN_BOTTOM))
    SetDayNightModels("Environment\\DNC\\DNCLordaeron\\DNCLordaeronTerrain\\DNCLordaeronTerrain.mdl", "Environment\\DNC\\DNCLordaeron\\DNCLordaeronUnit\\DNCLordaeronUnit.mdl")
    NewSoundEnvironment("Default")
    SetAmbientDaySound("CityScapeDay")
    SetAmbientNightSound("CityScapeNight")
    SetMapMusic("Music", true, 0)
    CreateRegions()
    InitBlizzard()
    InitGlobals()
    InitCustomTriggers()
    RunInitializationTriggers()
end

function config()
    SetMapName("TRIGSTR_004")
    SetMapDescription("TRIGSTR_006")
    SetPlayers(1)
    SetTeams(1)
    SetGamePlacement(MAP_PLACEMENT_USE_MAP_SETTINGS)
    DefineStartLocation(0, 7808.0, -1408.0)
    InitCustomPlayerSlots()
    SetPlayerSlotAvailable(Player(0), MAP_CONTROL_USER)
    InitGenericPlayerSlots()
end


function __module_0()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    function ____exports.PatchNatives(self)
    end
    return ____exports
    
end
__modules["app.src.JassOverrides.NativePatcher"] = {initialized = false, cached = nil, loader = __module_0}
function __module_1()
    function __TS__ArrayConcat(arr1, ...)
        local args = ({...})
        local out = {}
        for ____, val in ipairs(arr1) do
            out[#out + 1] = val
        end
        for ____, arg in ipairs(args) do
            if pcall(
                function() return #arg end
            ) and type(arg) ~= "string" then
                local argAsArray = arg
                for ____, val in ipairs(argAsArray) do
                    out[#out + 1] = val
                end
            else
                out[#out + 1] = arg
            end
        end
        return out
    end
    
    function __TS__ArrayEvery(arr, callbackfn)
        do
            local i = 0
            while i < #arr do
                if not callbackfn(_G, arr[i + 1], i, arr) then
                    return false
                end
                i = i + 1
            end
        end
        return true
    end
    
    function __TS__ArrayFilter(arr, callbackfn)
        local result = {}
        do
            local i = 0
            while i < #arr do
                if callbackfn(_G, arr[i + 1], i, arr) then
                    result[#result + 1] = arr[i + 1]
                end
                i = i + 1
            end
        end
        return result
    end
    
    function __TS__ArrayForEach(arr, callbackFn)
        do
            local i = 0
            while i < #arr do
                callbackFn(_G, arr[i + 1], i, arr)
                i = i + 1
            end
        end
    end
    
    function __TS__ArrayFindIndex(arr, callbackFn)
        do
            local i = 0
            local len = #arr
            while i < len do
                if callbackFn(_G, arr[i + 1], i, arr) then
                    return i
                end
                i = i + 1
            end
        end
        return -1
    end
    
    function __TS__ArrayIndexOf(arr, searchElement, fromIndex)
        local len = #arr
        if len == 0 then
            return -1
        end
        local n = 0
        if fromIndex then
            n = fromIndex
        end
        if n >= len then
            return -1
        end
        local k
        if n >= 0 then
            k = n
        else
            k = len + n
            if k < 0 then
                k = 0
            end
        end
        do
            local i = k
            while i < len do
                if arr[i + 1] == searchElement then
                    return i
                end
                i = i + 1
            end
        end
        return -1
    end
    
    function __TS__ArrayMap(arr, callbackfn)
        local newArray = {}
        do
            local i = 0
            while i < #arr do
                newArray[i + 1] = callbackfn(_G, arr[i + 1], i, arr)
                i = i + 1
            end
        end
        return newArray
    end
    
    function __TS__ArrayPush(arr, ...)
        local items = ({...})
        for ____, item in ipairs(items) do
            arr[#arr + 1] = item
        end
        return #arr
    end
    
    function __TS__ArrayReduce(arr, callbackFn, initial)
        local len = #arr
        if len == 0 and initial == nil then
            error("Reduce of empty array with no initial value")
        end
        local k = 0
        local accumulator = initial
        if initial == nil then
            accumulator = arr[1]
            k = k + 1
        end
        while k < len do
            accumulator = callbackFn(_G, accumulator, arr[k + 1], k, arr)
            k = k + 1
        end
        return accumulator
    end
    
    function __TS__ArrayReverse(arr)
        local i = 0
        local j = #arr - 1
        while i < j do
            local temp = arr[j + 1]
            arr[j + 1] = arr[i + 1]
            arr[i + 1] = temp
            i = i + 1
            j = j - 1
        end
        return arr
    end
    
    function __TS__ArrayShift(arr)
        return table.remove(arr, 1)
    end
    
    function __TS__ArrayUnshift(arr, ...)
        local items = ({...})
        do
            local i = #items - 1
            while i >= 0 do
                table.insert(arr, 1, items[i + 1])
                i = i - 1
            end
        end
        return #arr
    end
    
    function __TS__ArraySort(arr, compareFn)
        if compareFn ~= nil then
            table.sort(
                arr,
                function(a, b) return compareFn(_G, a, b) < 0 end
            )
        else
            table.sort(arr)
        end
        return arr
    end
    
    function __TS__ArraySlice(list, first, last)
        local len = #list
        local relativeStart = first or 0
        local k
        if relativeStart < 0 then
            k = math.max(len + relativeStart, 0)
        else
            k = math.min(relativeStart, len)
        end
        local relativeEnd = last
        if last == nil then
            relativeEnd = len
        end
        local final
        if relativeEnd < 0 then
            final = math.max(len + relativeEnd, 0)
        else
            final = math.min(relativeEnd, len)
        end
        local out = {}
        local n = 0
        while k < final do
            out[n + 1] = list[k + 1]
            k = k + 1
            n = n + 1
        end
        return out
    end
    
    function __TS__ArraySome(arr, callbackfn)
        do
            local i = 0
            while i < #arr do
                if callbackfn(_G, arr[i + 1], i, arr) then
                    return true
                end
                i = i + 1
            end
        end
        return false
    end
    
    function __TS__ArraySplice(list, start, deleteCount, ...)
        local items = ({...})
        local len = #list
        local actualStart
        if start < 0 then
            actualStart = math.max(len + start, 0)
        else
            actualStart = math.min(start, len)
        end
        local itemCount = #items
        local actualDeleteCount
        if not start then
            actualDeleteCount = 0
        elseif not deleteCount then
            actualDeleteCount = len - actualStart
        else
            actualDeleteCount = math.min(
                math.max(deleteCount, 0),
                len - actualStart
            )
        end
        local out = {}
        do
            local k = 0
            while k < actualDeleteCount do
                local from = actualStart + k
                if list[from + 1] then
                    out[k + 1] = list[from + 1]
                end
                k = k + 1
            end
        end
        if itemCount < actualDeleteCount then
            do
                local k = actualStart
                while k < len - actualDeleteCount do
                    local from = k + actualDeleteCount
                    local to = k + itemCount
                    if list[from + 1] then
                        list[to + 1] = list[from + 1]
                    else
                        list[to + 1] = nil
                    end
                    k = k + 1
                end
            end
            do
                local k = len
                while k > len - actualDeleteCount + itemCount do
                    list[k] = nil
                    k = k - 1
                end
            end
        elseif itemCount > actualDeleteCount then
            do
                local k = len - actualDeleteCount
                while k > actualStart do
                    local from = k + actualDeleteCount - 1
                    local to = k + itemCount - 1
                    if list[from + 1] then
                        list[to + 1] = list[from + 1]
                    else
                        list[to + 1] = nil
                    end
                    k = k - 1
                end
            end
        end
        local j = actualStart
        for ____, e in ipairs(items) do
            list[j + 1] = e
            j = j + 1
        end
        do
            local k = #list - 1
            while k >= len - actualDeleteCount + itemCount do
                list[k + 1] = nil
                k = k - 1
            end
        end
        return out
    end
    
    function __TS__ArrayToObject(array)
        local object = {}
        do
            local i = 0
            while i < #array do
                object[i] = array[i + 1]
                i = i + 1
            end
        end
        return object
    end
    
    function __TS__ArrayFlat(array, depth)
        if depth == nil then
            depth = 1
        end
        local result = {}
        for ____, value in ipairs(array) do
            if depth > 0 and type(value) == "table" and value[1] ~= nil then
                result = __TS__ArrayConcat(
                    result,
                    __TS__ArrayFlat(value, depth - 1)
                )
            else
                result[#result + 1] = value
            end
        end
        return result
    end
    
    function __TS__ArrayFlatMap(array, callback)
        local result = {}
        do
            local i = 0
            while i < #array do
                local value = callback(_G, array[i + 1], i, array)
                if type(value) == "table" and value[1] ~= nil then
                    result = __TS__ArrayConcat(result, value)
                else
                    result[#result + 1] = value
                end
                i = i + 1
            end
        end
        return result
    end
    
    function __TS__ArraySetLength(arr, length)
        if length < 0 or length ~= length or length == math.huge or math.floor(length) ~= length then
            error(
                "invalid array length: " .. tostring(length)
            )
        end
        do
            local i = #arr - 1
            while i >= length do
                arr[i + 1] = nil
                i = i - 1
            end
        end
        return length
    end
    
    function __TS__ClassIndex(classTable, key)
        while true do
            local getters = rawget(classTable, "____getters")
            if getters then
                local getter
                getter = getters[key]
                if getter then
                    return getter(classTable)
                end
            end
            classTable = rawget(classTable, "____super")
            if not classTable then
                break
            end
            local val = rawget(classTable, key)
            if val ~= nil then
                return val
            end
        end
    end
    
    function __TS__ClassNewIndex(classTable, key, val)
        local tbl = classTable
        repeat
            do
                local setters = rawget(tbl, "____setters")
                if setters then
                    local setter
                    setter = setters[key]
                    if setter then
                        setter(tbl, val)
                        return
                    end
                end
                tbl = rawget(tbl, "____super")
            end
        until not tbl
        rawset(classTable, key, val)
    end
    
    function __TS__Decorate(decorators, target, key, desc)
        local result = target
        do
            local i = #decorators
            while i >= 0 do
                local decorator = decorators[i + 1]
                if decorator then
                    local oldResult = result
                    if key == nil then
                        result = decorator(_G, result)
                    elseif desc ~= nil then
                        result = decorator(_G, target, key, result)
                    else
                        result = decorator(_G, target, key)
                    end
                    result = result or oldResult
                end
                i = i - 1
            end
        end
        return result
    end
    
    function __TS__FunctionApply(fn, thisArg, args)
        if args then
            return fn(
                thisArg,
                (unpack or table.unpack)(args)
            )
        else
            return fn(thisArg)
        end
    end
    
    function __TS__FunctionBind(fn, thisArg, ...)
        local boundArgs = ({...})
        return function(____, ...)
            local args = ({...})
            do
                local i = 0
                while i < #boundArgs do
                    table.insert(args, i + 1, boundArgs[i + 1])
                    i = i + 1
                end
            end
            return fn(
                thisArg,
                (unpack or table.unpack)(args)
            )
        end
    end
    
    function __TS__FunctionCall(fn, thisArg, ...)
        local args = ({...})
        return fn(
            thisArg,
            (unpack or table.unpack)(args)
        )
    end
    
    function __TS__Index(classProto)
        return function(tbl, key)
            local proto = classProto
            while true do
                local val = rawget(proto, key)
                if val ~= nil then
                    return val
                end
                local getters = rawget(proto, "____getters")
                if getters then
                    local getter
                    getter = getters[key]
                    if getter then
                        return getter(tbl)
                    end
                end
                local base = rawget(
                    rawget(proto, "constructor"),
                    "____super"
                )
                if not base then
                    break
                end
                proto = rawget(base, "prototype")
            end
        end
    end
    
    local ____symbolMetatable = {
        __tostring = function(self)
            if self.description == nil then
                return "Symbol()"
            else
                return "Symbol(" .. tostring(self.description) .. ")"
            end
        end
    }
    function __TS__Symbol(description)
        return setmetatable({description = description}, ____symbolMetatable)
    end
    Symbol = {
        iterator = __TS__Symbol("Symbol.iterator"),
        hasInstance = __TS__Symbol("Symbol.hasInstance"),
        species = __TS__Symbol("Symbol.species"),
        toStringTag = __TS__Symbol("Symbol.toStringTag")
    }
    
    function __TS__InstanceOf(obj, classTbl)
        if type(classTbl) ~= "table" then
            error("Right-hand side of \'instanceof\' is not an object")
        end
        if classTbl[Symbol.hasInstance] ~= nil then
            return not not classTbl[Symbol.hasInstance](classTbl, obj)
        end
        if obj ~= nil then
            local luaClass = obj.constructor
            while luaClass ~= nil do
                if luaClass == classTbl then
                    return true
                end
                luaClass = luaClass.____super
            end
        end
        return false
    end
    
    function __TS__InstanceOfObject(value)
        local valueType = type(value)
        return valueType == "table" or valueType == "function"
    end
    
    function __TS__Iterator(iterable)
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            return function()
                local result = iterator:next()
                if not result.done then
                    return result.value
                else
                    return nil
                end
            end
        else
            local i = 0
            return function()
                i = i + 1
                return iterable[i]
            end
        end
    end
    
    Map = (function()
        Map = {}
        Map.name = "Map"
        Map.__index = Map
        Map.prototype = {}
        Map.prototype.__index = Map.prototype
        Map.prototype.constructor = Map
        function Map.new(...)
            local self = setmetatable({}, Map.prototype)
            self:____constructor(...)
            return self
        end
        function Map.prototype.____constructor(self, entries)
            self[Symbol.toStringTag] = "Map"
            self.items = {}
            self.size = 0
            self.nextKey = {}
            self.previousKey = {}
            if entries == nil then
                return
            end
            local iterable = entries
            if iterable[Symbol.iterator] then
                local iterator = iterable[Symbol.iterator](iterable)
                while true do
                    local result = iterator:next()
                    if result.done then
                        break
                    end
                    local value = result.value
                    self:set(value[1], value[2])
                end
            else
                local array = entries
                for ____, kvp in ipairs(array) do
                    self:set(kvp[1], kvp[2])
                end
            end
        end
        function Map.prototype.clear(self)
            self.items = {}
            self.nextKey = {}
            self.previousKey = {}
            self.firstKey = nil
            self.lastKey = nil
            self.size = 0
            return
        end
        function Map.prototype.delete(self, key)
            local contains = self:has(key)
            if contains then
                self.size = self.size - 1
                local next = self.nextKey[key]
                local previous = self.previousKey[key]
                if next and previous then
                    self.nextKey[previous] = next
                    self.previousKey[next] = previous
                elseif next then
                    self.firstKey = next
                    self.previousKey[next] = nil
                elseif previous then
                    self.lastKey = previous
                    self.nextKey[previous] = nil
                else
                    self.firstKey = nil
                    self.lastKey = nil
                end
                self.nextKey[key] = nil
                self.previousKey[key] = nil
            end
            self.items[key] = nil
            return contains
        end
        function Map.prototype.forEach(self, callback)
            for key in __TS__Iterator(
                self:keys()
            ) do
                callback(_G, self.items[key], key, self)
            end
            return
        end
        function Map.prototype.get(self, key)
            return self.items[key]
        end
        function Map.prototype.has(self, key)
            return self.nextKey[key] ~= nil or self.lastKey == key
        end
        function Map.prototype.set(self, key, value)
            local isNewValue = not self:has(key)
            if isNewValue then
                self.size = self.size + 1
            end
            self.items[key] = value
            if self.firstKey == nil then
                self.firstKey = key
                self.lastKey = key
            elseif isNewValue then
                self.nextKey[self.lastKey] = key
                self.previousKey[key] = self.lastKey
                self.lastKey = key
            end
            return self
        end
        Map.prototype[Symbol.iterator] = function(self)
            return self:entries()
        end
        function Map.prototype.entries(self)
            local items = self.items
            local nextKey = self.nextKey
            local key = self.firstKey
            return {
                [Symbol.iterator] = function(self)
                    return self
                end,
                next = function(self)
                    local result = {done = not key, value = {key, items[key]}}
                    key = nextKey[key]
                    return result
                end
            }
        end
        function Map.prototype.keys(self)
            local nextKey = self.nextKey
            local key = self.firstKey
            return {
                [Symbol.iterator] = function(self)
                    return self
                end,
                next = function(self)
                    local result = {done = not key, value = key}
                    key = nextKey[key]
                    return result
                end
            }
        end
        function Map.prototype.values(self)
            local items = self.items
            local nextKey = self.nextKey
            local key = self.firstKey
            return {
                [Symbol.iterator] = function(self)
                    return self
                end,
                next = function(self)
                    local result = {done = not key, value = items[key]}
                    key = nextKey[key]
                    return result
                end
            }
        end
        Map[Symbol.species] = Map
        return Map
    end)()
    
    function __TS__NewIndex(classProto)
        return function(tbl, key, val)
            local proto = classProto
            while true do
                local setters = rawget(proto, "____setters")
                if setters then
                    local setter
                    setter = setters[key]
                    if setter then
                        setter(tbl, val)
                        return
                    end
                end
                local base = rawget(
                    rawget(proto, "constructor"),
                    "____super"
                )
                if not base then
                    break
                end
                proto = rawget(base, "prototype")
            end
            rawset(tbl, key, val)
        end
    end
    
    function __TS__Number(value)
        local valueType = type(value)
        if valueType == "number" then
            return value
        elseif valueType == "string" then
            local numberValue = tonumber(value)
            if numberValue then
                return numberValue
            end
            if value == "Infinity" then
                return math.huge
            end
            if value == "-Infinity" then
                return -math.huge
            end
            local stringWithoutSpaces = string.gsub(value, "%s", "")
            if stringWithoutSpaces == "" then
                return 0
            end
            return (0 / 0)
        elseif valueType == "boolean" then
            return value and 1 or 0
        else
            return (0 / 0)
        end
    end
    
    function __TS__NumberIsFinite(value)
        return type(value) == "number" and value == value and value ~= math.huge and value ~= -math.huge
    end
    
    function __TS__NumberIsNaN(value)
        return value ~= value
    end
    
    function __TS__ObjectAssign(to, ...)
        local sources = ({...})
        if to == nil then
            return to
        end
        for ____, source in ipairs(sources) do
            for key in pairs(source) do
                to[key] = source[key]
            end
        end
        return to
    end
    
    function __TS__ObjectEntries(obj)
        local result = {}
        for key in pairs(obj) do
            result[#result + 1] = {key, obj[key]}
        end
        return result
    end
    
    function __TS__ObjectFromEntries(entries)
        local obj = {}
        local iterable = entries
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                obj[value[1]] = value[2]
            end
        else
            for ____, entry in ipairs(entries) do
                obj[entry[1]] = entry[2]
            end
        end
        return obj
    end
    
    function __TS__ObjectKeys(obj)
        local result = {}
        for key in pairs(obj) do
            result[#result + 1] = key
        end
        return result
    end
    
    function __TS__ObjectRest(target, usedProperties)
        local result = {}
        for property in pairs(target) do
            if not usedProperties[property] then
                result[property] = target[property]
            end
        end
        return result
    end
    
    function __TS__ObjectValues(obj)
        local result = {}
        for key in pairs(obj) do
            result[#result + 1] = obj[key]
        end
        return result
    end
    
    Set = (function()
        Set = {}
        Set.name = "Set"
        Set.__index = Set
        Set.prototype = {}
        Set.prototype.__index = Set.prototype
        Set.prototype.constructor = Set
        function Set.new(...)
            local self = setmetatable({}, Set.prototype)
            self:____constructor(...)
            return self
        end
        function Set.prototype.____constructor(self, values)
            self[Symbol.toStringTag] = "Set"
            self.size = 0
            self.nextKey = {}
            self.previousKey = {}
            if values == nil then
                return
            end
            local iterable = values
            if iterable[Symbol.iterator] then
                local iterator = iterable[Symbol.iterator](iterable)
                while true do
                    local result = iterator:next()
                    if result.done then
                        break
                    end
                    self:add(result.value)
                end
            else
                local array = values
                for ____, value in ipairs(array) do
                    self:add(value)
                end
            end
        end
        function Set.prototype.add(self, value)
            local isNewValue = not self:has(value)
            if isNewValue then
                self.size = self.size + 1
            end
            if self.firstKey == nil then
                self.firstKey = value
                self.lastKey = value
            elseif isNewValue then
                self.nextKey[self.lastKey] = value
                self.previousKey[value] = self.lastKey
                self.lastKey = value
            end
            return self
        end
        function Set.prototype.clear(self)
            self.nextKey = {}
            self.previousKey = {}
            self.firstKey = nil
            self.lastKey = nil
            self.size = 0
            return
        end
        function Set.prototype.delete(self, value)
            local contains = self:has(value)
            if contains then
                self.size = self.size - 1
                local next = self.nextKey[value]
                local previous = self.previousKey[value]
                if next and previous then
                    self.nextKey[previous] = next
                    self.previousKey[next] = previous
                elseif next then
                    self.firstKey = next
                    self.previousKey[next] = nil
                elseif previous then
                    self.lastKey = previous
                    self.nextKey[previous] = nil
                else
                    self.firstKey = nil
                    self.lastKey = nil
                end
                self.nextKey[value] = nil
                self.previousKey[value] = nil
            end
            return contains
        end
        function Set.prototype.forEach(self, callback)
            for key in __TS__Iterator(
                self:keys()
            ) do
                callback(_G, key, key, self)
            end
        end
        function Set.prototype.has(self, value)
            return self.nextKey[value] ~= nil or self.lastKey == value
        end
        Set.prototype[Symbol.iterator] = function(self)
            return self:values()
        end
        function Set.prototype.entries(self)
            local nextKey = self.nextKey
            local key = self.firstKey
            return {
                [Symbol.iterator] = function(self)
                    return self
                end,
                next = function(self)
                    local result = {done = not key, value = {key, key}}
                    key = nextKey[key]
                    return result
                end
            }
        end
        function Set.prototype.keys(self)
            local nextKey = self.nextKey
            local key = self.firstKey
            return {
                [Symbol.iterator] = function(self)
                    return self
                end,
                next = function(self)
                    local result = {done = not key, value = key}
                    key = nextKey[key]
                    return result
                end
            }
        end
        function Set.prototype.values(self)
            local nextKey = self.nextKey
            local key = self.firstKey
            return {
                [Symbol.iterator] = function(self)
                    return self
                end,
                next = function(self)
                    local result = {done = not key, value = key}
                    key = nextKey[key]
                    return result
                end
            }
        end
        Set[Symbol.species] = Set
        return Set
    end)()
    
    WeakMap = (function()
        WeakMap = {}
        WeakMap.name = "WeakMap"
        WeakMap.__index = WeakMap
        WeakMap.prototype = {}
        WeakMap.prototype.__index = WeakMap.prototype
        WeakMap.prototype.constructor = WeakMap
        function WeakMap.new(...)
            local self = setmetatable({}, WeakMap.prototype)
            self:____constructor(...)
            return self
        end
        function WeakMap.prototype.____constructor(self, entries)
            self[Symbol.toStringTag] = "WeakMap"
            self.items = {}
            setmetatable(self.items, {__mode = "k"})
            if entries == nil then
                return
            end
            local iterable = entries
            if iterable[Symbol.iterator] then
                local iterator = iterable[Symbol.iterator](iterable)
                while true do
                    local result = iterator:next()
                    if result.done then
                        break
                    end
                    local value = result.value
                    self.items[value[1]] = value[2]
                end
            else
                for ____, kvp in ipairs(entries) do
                    self.items[kvp[1]] = kvp[2]
                end
            end
        end
        function WeakMap.prototype.delete(self, key)
            local contains = self:has(key)
            self.items[key] = nil
            return contains
        end
        function WeakMap.prototype.get(self, key)
            return self.items[key]
        end
        function WeakMap.prototype.has(self, key)
            return self.items[key] ~= nil
        end
        function WeakMap.prototype.set(self, key, value)
            self.items[key] = value
            return self
        end
        WeakMap[Symbol.species] = WeakMap
        return WeakMap
    end)()
    
    WeakSet = (function()
        WeakSet = {}
        WeakSet.name = "WeakSet"
        WeakSet.__index = WeakSet
        WeakSet.prototype = {}
        WeakSet.prototype.__index = WeakSet.prototype
        WeakSet.prototype.constructor = WeakSet
        function WeakSet.new(...)
            local self = setmetatable({}, WeakSet.prototype)
            self:____constructor(...)
            return self
        end
        function WeakSet.prototype.____constructor(self, values)
            self[Symbol.toStringTag] = "WeakSet"
            self.items = {}
            setmetatable(self.items, {__mode = "k"})
            if values == nil then
                return
            end
            local iterable = values
            if iterable[Symbol.iterator] then
                local iterator = iterable[Symbol.iterator](iterable)
                while true do
                    local result = iterator:next()
                    if result.done then
                        break
                    end
                    self.items[result.value] = true
                end
            else
                for ____, value in ipairs(values) do
                    self.items[value] = true
                end
            end
        end
        function WeakSet.prototype.add(self, value)
            self.items[value] = true
            return self
        end
        function WeakSet.prototype.delete(self, value)
            local contains = self:has(value)
            self.items[value] = nil
            return contains
        end
        function WeakSet.prototype.has(self, value)
            return self.items[value] == true
        end
        WeakSet[Symbol.species] = WeakSet
        return WeakSet
    end)()
    
    function __TS__SourceMapTraceBack(fileName, sourceMap)
        _G.__TS__sourcemap = _G.__TS__sourcemap or {}
        _G.__TS__sourcemap[fileName] = sourceMap
        if _G.__TS__originalTraceback == nil then
            _G.__TS__originalTraceback = debug.traceback
            debug.traceback = function(thread, message, level)
                local trace = _G.__TS__originalTraceback(thread, message, level)
                local result = string.gsub(
                    trace,
                    "(%S+).lua:(%d+)",
                    function(file, line)
                        local fileSourceMap = _G.__TS__sourcemap[tostring(file) .. ".lua"]
                        if fileSourceMap and fileSourceMap[line] then
                            return tostring(file) .. ".ts:" .. tostring(fileSourceMap[line])
                        end
                        return tostring(file) .. ".lua:" .. tostring(line)
                    end
                )
                return result
            end
        end
    end
    
    function __TS__Spread(iterable)
        local arr = {}
        if type(iterable) == "string" then
            do
                local i = 0
                while i < #iterable do
                    arr[#arr + 1] = string.sub(iterable, i + 1, i + 1)
                    i = i + 1
                end
            end
        else
            for item in __TS__Iterator(iterable) do
                arr[#arr + 1] = item
            end
        end
        return (table.unpack or unpack)(arr)
    end
    
    function __TS__StringConcat(str1, ...)
        local args = ({...})
        local out = str1
        for ____, arg in ipairs(args) do
            out = tostring(out) .. tostring(arg)
        end
        return out
    end
    
    function __TS__StringEndsWith(self, searchString, endPosition)
        if endPosition == nil or endPosition > #self then
            endPosition = #self
        end
        return string.sub(self, endPosition - #searchString + 1, endPosition) == searchString
    end
    
    function __TS__StringPadEnd(self, maxLength, fillString)
        if fillString == nil then
            fillString = " "
        end
        if maxLength ~= maxLength then
            maxLength = 0
        end
        if maxLength == -math.huge or maxLength == math.huge then
            error("Invalid string length")
        end
        if #self >= maxLength or #fillString == 0 then
            return self
        end
        maxLength = maxLength - #self
        if maxLength > #fillString then
            fillString = tostring(fillString) .. tostring(
                string.rep(
                    fillString,
                    math.floor(maxLength / #fillString)
                )
            )
        end
        return tostring(self) .. tostring(
            string.sub(
                fillString,
                1,
                math.floor(maxLength)
            )
        )
    end
    
    function __TS__StringPadStart(self, maxLength, fillString)
        if fillString == nil then
            fillString = " "
        end
        if maxLength ~= maxLength then
            maxLength = 0
        end
        if maxLength == -math.huge or maxLength == math.huge then
            error("Invalid string length")
        end
        if #self >= maxLength or #fillString == 0 then
            return self
        end
        maxLength = maxLength - #self
        if maxLength > #fillString then
            fillString = tostring(fillString) .. tostring(
                string.rep(
                    fillString,
                    math.floor(maxLength / #fillString)
                )
            )
        end
        return tostring(
            string.sub(
                fillString,
                1,
                math.floor(maxLength)
            )
        ) .. tostring(self)
    end
    
    function __TS__StringReplace(source, searchValue, replaceValue)
        searchValue = string.gsub(searchValue, "[%%%(%)%.%+%-%*%?%[%^%$]", "%%%1")
        if type(replaceValue) == "string" then
            replaceValue = string.gsub(replaceValue, "[%%%(%)%.%+%-%*%?%[%^%$]", "%%%1")
            local result = string.gsub(source, searchValue, replaceValue, 1)
            return result
        else
            local result = string.gsub(
                source,
                searchValue,
                function(match) return replaceValue(_G, match) end,
                1
            )
            return result
        end
    end
    
    function __TS__StringSplit(source, separator, limit)
        if limit == nil then
            limit = 4294967295
        end
        if limit == 0 then
            return {}
        end
        local out = {}
        local index = 0
        local count = 0
        if separator == nil or separator == "" then
            while index < #source - 1 and count < limit do
                out[count + 1] = string.sub(source, index + 1, index + 1)
                count = count + 1
                index = index + 1
            end
        else
            local separatorLength = #separator
            local nextIndex = ((string.find(source, separator, nil, true) or 0) - 1)
            while nextIndex >= 0 and count < limit do
                out[count + 1] = string.sub(source, index + 1, nextIndex)
                count = count + 1
                index = nextIndex + separatorLength
                nextIndex = ((string.find(source, separator, index + 1, true) or 0) - 1)
            end
        end
        if count < limit then
            out[count + 1] = string.sub(source, index + 1)
        end
        return out
    end
    
    function __TS__StringStartsWith(self, searchString, position)
        if position == nil or position < 0 then
            position = 0
        end
        return string.sub(self, position + 1, #searchString + position) == searchString
    end
    
    local ____symbolRegistry = {}
    function __TS__SymbolRegistryFor(key)
        if not ____symbolRegistry[key] then
            ____symbolRegistry[key] = __TS__Symbol(key)
        end
        return ____symbolRegistry[key]
    end
    function __TS__SymbolRegistryKeyFor(sym)
        for key in pairs(____symbolRegistry) do
            if ____symbolRegistry[key] == sym then
                return key
            end
        end
    end
    
    function __TS__TypeOf(value)
        local luaType = type(value)
        if luaType == "table" then
            return "object"
        elseif luaType == "nil" then
            return "undefined"
        else
            return luaType
        end
    end
    
    
end
__modules["lualib_bundle"] = {initialized = false, cached = nil, loader = __module_1}
function __module_2()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    ____exports.LogLevel = {}
    ____exports.LogLevel.None = -1
    ____exports.LogLevel[____exports.LogLevel.None] = "None"
    ____exports.LogLevel.Message = 0
    ____exports.LogLevel[____exports.LogLevel.Message] = "Message"
    ____exports.LogLevel.Verbose = 1
    ____exports.LogLevel[____exports.LogLevel.Verbose] = "Verbose"
    ____exports.LogLevel.Event = 2
    ____exports.LogLevel[____exports.LogLevel.Event] = "Event"
    ____exports.LogLevel.Debug = 3
    ____exports.LogLevel[____exports.LogLevel.Debug] = "Debug"
    ____exports.LogLevel.Information = 4
    ____exports.LogLevel[____exports.LogLevel.Information] = "Information"
    ____exports.LogLevel.Warning = 5
    ____exports.LogLevel[____exports.LogLevel.Warning] = "Warning"
    ____exports.LogLevel.Error = 6
    ____exports.LogLevel[____exports.LogLevel.Error] = "Error"
    ____exports.LogLevel.Fatal = 7
    ____exports.LogLevel[____exports.LogLevel.Fatal] = "Fatal"
    ____exports.LogEventType = {}
    ____exports.LogEventType.Text = 0
    ____exports.LogEventType[____exports.LogEventType.Text] = "Text"
    ____exports.LogEventType.Parameter = 1
    ____exports.LogEventType[____exports.LogEventType.Parameter] = "Parameter"
    ____exports.LogEvent = {}
    local LogEvent = ____exports.LogEvent
    LogEvent.name = "LogEvent"
    LogEvent.__index = LogEvent
    LogEvent.prototype = {}
    LogEvent.prototype.__index = LogEvent.prototype
    LogEvent.prototype.constructor = LogEvent
    function LogEvent.new(...)
        local self = setmetatable({}, LogEvent.prototype)
        self:____constructor(...)
        return self
    end
    function LogEvent.prototype.____constructor(self, Type, Text, Value)
        self.Type = Type
        self.Text = Text
        self.Value = Value
    end
    ____exports.Log = {}
    local Log = ____exports.Log
    do
        local _sinks
        function Log.Init(sinks)
            _sinks = sinks
        end
        local function Parse(message, ...)
            local args = ({...})
            local logEvents = {}
            local matcher = string.gmatch(message, "{.-}")
            local match
            local text
            local n = 0
            local i = 0
            while (function()
                match = matcher(nil)
                return match
            end)() do
                do
                    local s, e = string.find(message, match, 1, true)
                    if not s or not e then
                        goto __continue5
                    end
                    text = string.sub(message, i + 1, s - 1)
                    if text ~= "" then
                        __TS__ArrayPush(
                            logEvents,
                            ____exports.LogEvent.new(____exports.LogEventType.Text, text, nil)
                        )
                    end
                    __TS__ArrayPush(
                        logEvents,
                        ____exports.LogEvent.new(____exports.LogEventType.Parameter, match, args[n + 1])
                    )
                    i = e
                    n = n + 1
                end
                ::__continue5::
            end
            text = string.sub(message, i + 1)
            if text ~= "" then
                __TS__ArrayPush(
                    logEvents,
                    ____exports.LogEvent.new(____exports.LogEventType.Text, text, nil)
                )
            end
            return logEvents
        end
        function Log.Log(level, message, ...)
            local args = ({...})
            local logEvents = Parse(
                message,
                table.unpack(args)
            )
            do
                local index = 0
                while index < #_sinks do
                    if _sinks[index + 1]:LogLevel() <= level then
                        _sinks[index + 1]:Log(level, logEvents)
                    end
                    index = index + 1
                end
            end
        end
        function Log.Fatal(message, ...)
            local args = ({...})
            Log.Log(
                ____exports.LogLevel.Fatal,
                message,
                table.unpack(args)
            )
        end
        function Log.Error(message, ...)
            local args = ({...})
            Log.Log(
                ____exports.LogLevel.Error,
                message,
                table.unpack(args)
            )
        end
        function Log.Warning(message, ...)
            local args = ({...})
            Log.Log(
                ____exports.LogLevel.Warning,
                message,
                table.unpack(args)
            )
        end
        function Log.Information(message, ...)
            local args = ({...})
            Log.Log(
                ____exports.LogLevel.Information,
                message,
                table.unpack(args)
            )
        end
        function Log.Debug(message, ...)
            local args = ({...})
            Log.Log(
                ____exports.LogLevel.Debug,
                message,
                table.unpack(args)
            )
        end
        function Log.Message(message, ...)
            local args = ({...})
            Log.Log(
                ____exports.LogLevel.Message,
                message,
                table.unpack(args)
            )
        end
        function Log.Event(id, message)
            Log.Log(
                ____exports.LogLevel.Event,
                "{\"event\":" .. tostring(id) .. ", \"data\": " .. tostring(message) .. "}"
            )
        end
        function Log.Verbose(message, ...)
            local args = ({...})
            Log.Log(
                ____exports.LogLevel.Verbose,
                message,
                table.unpack(args)
            )
        end
    end
    return ____exports
    
end
__modules["app.src.lib.Serilog.Serilog"] = {initialized = false, cached = nil, loader = __module_2}
function __module_3()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    local LogEventType = ____Serilog.LogEventType
    local LogLevel = ____Serilog.LogLevel
    ____exports.StringSink = {}
    local StringSink = ____exports.StringSink
    StringSink.name = "StringSink"
    StringSink.__index = StringSink
    StringSink.prototype = {}
    StringSink.prototype.__index = StringSink.prototype
    StringSink.prototype.constructor = StringSink
    function StringSink.new(...)
        local self = setmetatable({}, StringSink.prototype)
        self:____constructor(...)
        return self
    end
    function StringSink.prototype.____constructor(self, logLevel, printer)
        self.logLevel = logLevel
        self.printer = printer
        _G.SendMessage = function(msg)
            Log.Message(
                "{\"s\":\"BROADCAST\", \"m\":\"" .. tostring(msg) .. "\"}"
            )
            SendMessageUnlogged(msg)
        end
    end
    function StringSink.prototype.LogLevel(self)
        return self.logLevel
    end
    function StringSink.prototype.Log(self, level, events)
        local message = ""
        do
            local index = 0
            while index < #events do
                local event = events[index + 1]
                if event.Type == LogEventType.Text then
                    message = tostring(message) .. tostring(event.Text)
                elseif event.Type == LogEventType.Parameter then
                    local whichType = type(event.Value)
                    local color = ____exports.StringSink.Colors[whichType]
                    if color then
                        message = tostring(message) .. "|cff" .. tostring(color)
                    end
                    if ____exports.StringSink.Brackets[whichType] then
                        message = tostring(message) .. "{ "
                    end
                    message = tostring(message) .. tostring(event.Value)
                    if ____exports.StringSink.Brackets[whichType] then
                        message = tostring(message) .. " }"
                    end
                    if color then
                        message = tostring(message) .. "|r"
                    end
                end
                index = index + 1
            end
        end
        self.printer(
            string.format("[%s]: %s", ____exports.StringSink.Prefix[level], message)
        )
    end
    StringSink.Prefix = {[LogLevel.None] = "|cffffffffNON|r", [LogLevel.Verbose] = "|cff9d9d9dVRB|r", [LogLevel.Debug] = "|cff9d9d9dDBG|r", [LogLevel.Information] = "|cffe6cc80INF|r", [LogLevel.Message] = "|cffe6cc80MSG|r", [LogLevel.Event] = "|cffe6cc80EVT|r", [LogLevel.Warning] = "|cffffcc00WRN|r", [LogLevel.Error] = "|cffff8000ERR|r", [LogLevel.Fatal] = "|cffff0000FTL|r"}
    StringSink.Colors = {["nil"] = "9d9d9d", boolean = "1eff00", number = "00ccff", string = "ff8000", table = "ffcc00", ["function"] = "ffcc00", userdata = "ffcc00"}
    StringSink.Brackets = {["nil"] = false, boolean = false, number = false, string = false, table = true, ["function"] = true, userdata = true}
    return ____exports
    
end
__modules["app.src.lib.Serilog.Sinks.StringSink"] = {initialized = false, cached = nil, loader = __module_3}
function __module_4()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    ____exports.Rectangle = {}
    local Rectangle = ____exports.Rectangle
    Rectangle.name = "Rectangle"
    Rectangle.__index = Rectangle
    Rectangle.prototype = {}
    Rectangle.prototype.____getters = {}
    Rectangle.prototype.__index = __TS__Index(Rectangle.prototype)
    Rectangle.prototype.constructor = Rectangle
    function Rectangle.new(...)
        local self = setmetatable({}, Rectangle.prototype)
        self:____constructor(...)
        return self
    end
    function Rectangle.prototype.____constructor(self, area)
        self.area = area
    end
    function Rectangle.prototype.____getters.minX(self)
        return self.area[1]
    end
    function Rectangle.prototype.____getters.minY(self)
        return self.area[2]
    end
    function Rectangle.prototype.____getters.maxX(self)
        return self.area[3]
    end
    function Rectangle.prototype.____getters.maxY(self)
        return self.area[4]
    end
    function Rectangle.prototype.ContainsCreep(self, whichCreep)
        return self:ContainsUnit(whichCreep.creep)
    end
    function Rectangle.prototype.ContainsUnit(self, whichUnit)
        if GetUnitX(whichUnit) < self.area[1] then
            return false
        end
        if GetUnitX(whichUnit) > self.area[3] then
            return false
        end
        if GetUnitY(whichUnit) < self.area[2] then
            return false
        end
        if GetUnitY(whichUnit) > self.area[4] then
            return false
        end
        return true
    end
    function Rectangle.prototype.ContainsDestructable(self, destr)
        if destr:x() < self.area[1] then
            return false
        end
        if destr:x() > self.area[3] then
            return false
        end
        if destr:y() < self.area[2] then
            return false
        end
        if destr:y() > self.area[4] then
            return false
        end
        return true
    end
    function Rectangle.prototype.__tostring(self)
        return "{ x: " .. tostring(self.minX) .. "}, y: " .. tostring(self.minY) .. " }, { x: " .. tostring(self.maxX) .. ", y: " .. tostring(self.maxY) .. " }"
    end
    function Rectangle.prototype.toRect(self)
        return Rect(self.minX, self.minY, self.maxX, self.maxY)
    end
    function Rectangle.prototype.GetCenterX(self)
        local x1 = self.minX
        local x2 = self.maxX
        return (x1 + x2) / 2
    end
    function Rectangle.prototype.GetCenterY(self)
        local y1 = self.minY
        local y2 = self.maxY
        return (y1 + y2) / 2
    end
    return ____exports
    
end
__modules["app.src.JassOverrides.Rectangle"] = {initialized = false, cached = nil, loader = __module_4}
function __module_5()
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
    
end
__modules["app.src.World.GlobalSettings"] = {initialized = false, cached = nil, loader = __module_5}
function __module_6()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____GlobalSettings = require("app.src.World.GlobalSettings")
    local COLOUR_CODES = ____GlobalSettings.COLOUR_CODES
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    ____exports.AbstractPlayer = {}
    local AbstractPlayer = ____exports.AbstractPlayer
    AbstractPlayer.name = "AbstractPlayer"
    AbstractPlayer.__index = AbstractPlayer
    AbstractPlayer.prototype = {}
    AbstractPlayer.prototype.__index = AbstractPlayer.prototype
    AbstractPlayer.prototype.constructor = AbstractPlayer
    function AbstractPlayer.new(...)
        local self = setmetatable({}, AbstractPlayer.prototype)
        self:____constructor(...)
        return self
    end
    function AbstractPlayer.prototype.____constructor(self, id)
        self.id = id
        self.wcPlayer = Player(id)
    end
    function AbstractPlayer.prototype.makeAlliance(self, otherPlayer)
        SetPlayerAllianceStateBJ(self.wcPlayer, otherPlayer.wcPlayer, bj_ALLIANCE_ALLIED_VISION)
    end
    function AbstractPlayer.prototype.getPlayerColour(self)
        return string.lower(COLOUR[self.id])
    end
    function AbstractPlayer.prototype.getColourCode(self)
        return COLOUR_CODES[self.id + 1]
    end
    function AbstractPlayer.prototype.getNameWithColour(self)
        return Util:ColourString(
            self:getColourCode(),
            self:getPlayerName()
        )
    end
    function AbstractPlayer.prototype.getPlayerName(self)
        return GetPlayerName(self.wcPlayer)
    end
    function AbstractPlayer.prototype.sendMessage(self, message)
        Log.Message(
            "{\"s\":\"" .. tostring(
                self:getPlayerName()
            ) .. "\", \"m\":\"" .. tostring(message) .. "\"}"
        )
        DisplayTimedTextToPlayer(self.wcPlayer, 0, 0, 10, message)
    end
    function AbstractPlayer.prototype.setGold(self, amount)
        SetPlayerStateBJ(self.wcPlayer, PLAYER_STATE_RESOURCE_GOLD, amount)
    end
    function AbstractPlayer.prototype.setLumber(self, amount)
        SetPlayerStateBJ(self.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER, amount)
    end
    function AbstractPlayer.prototype.setHandicap(self, percentage)
        SetPlayerHandicapBJ(self.wcPlayer, percentage)
    end
    function AbstractPlayer.prototype.giveLumber(self, amount)
        AdjustPlayerStateBJ(amount, self.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER)
    end
    function AbstractPlayer.prototype.giveGold(self, amount)
        if amount then
            AdjustPlayerStateBJ(amount, self.wcPlayer, PLAYER_STATE_RESOURCE_GOLD)
        end
    end
    function AbstractPlayer.prototype.getGold(self)
        return GetPlayerState(self.wcPlayer, PLAYER_STATE_RESOURCE_GOLD)
    end
    function AbstractPlayer.prototype.getLumber(self)
        return GetPlayerState(self.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER)
    end
    function AbstractPlayer.prototype.defeatPlayer(self)
        CustomDefeatBJ(self.wcPlayer, "Defeat!")
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Players.AbstractPlayer"] = {initialized = false, cached = nil, loader = __module_6}
function __module_7()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    ____exports.Trigger = {}
    local Trigger = ____exports.Trigger
    Trigger.name = "Trigger"
    Trigger.__index = Trigger
    Trigger.prototype = {}
    Trigger.prototype.__index = Trigger.prototype
    Trigger.prototype.constructor = Trigger
    function Trigger.new(...)
        local self = setmetatable({}, Trigger.prototype)
        self:____constructor(...)
        return self
    end
    function Trigger.prototype.____constructor(self)
        self.nativeTrigger = CreateTrigger()
    end
    function Trigger.EvaluateCondition(self, func)
        local answer = false
        xpcall(
            function()
                answer = func(nil)
            end,
            function(err)
                self:printError(err)
            end
        )
        return answer
    end
    function Trigger.printError(self, err)
        Log.Fatal(err)
    end
    function Trigger.prototype.AddAction(self, actionFunc)
        return TriggerAddAction(
            self.nativeTrigger,
            function() return ({
                xpcall(
                    function() return actionFunc(nil) end,
                    function(err) return ____exports.Trigger:printError(err) end
                )
            }) end
        )
    end
    function Trigger.prototype.RegisterTimerEvent(self, timeout, periodic)
        return TriggerRegisterTimerEvent(self.nativeTrigger, timeout, periodic)
    end
    function Trigger.prototype.RegisterTimerEventSingle(self, timeout)
        return TriggerRegisterTimerEventSingle(self.nativeTrigger, timeout)
    end
    function Trigger.prototype.RegisterTimerEventPeriodic(self, timeout)
        return TriggerRegisterTimerEventPeriodic(self.nativeTrigger, timeout)
    end
    function Trigger.prototype.RegisterPlayerStateEvent(self, whichPlayer, whichState, opcode, limitval)
        return TriggerRegisterPlayerStateEvent(self.nativeTrigger, whichPlayer, whichState, opcode, limitval)
    end
    function Trigger.prototype.RegisterDeathEvent(self, whichWidget)
        return TriggerRegisterDeathEvent(self.nativeTrigger, whichWidget)
    end
    function Trigger.prototype.RegisterDialogEventBJ(self, whichDialog)
        return TriggerRegisterDialogEventBJ(self.nativeTrigger, whichDialog)
    end
    function Trigger.prototype.RegisterEnterRectSimple(self, r)
        return TriggerRegisterEnterRectSimple(self.nativeTrigger, r)
    end
    function Trigger.prototype.RegisterEnterRectangle(self, area)
        local rectangle = Rect(area.minX, area.minY, area.maxX, area.maxY)
        local trigEvent = self:RegisterEnterRectSimple(rectangle)
        RemoveRect(rectangle)
        return trigEvent
    end
    function Trigger.prototype.AddCondition(self, func)
        return TriggerAddCondition(
            self.nativeTrigger,
            Condition(
                function() return ____exports.Trigger:EvaluateCondition(func) end
            )
        )
    end
    function Trigger.prototype.AddFilterFuncCondition(self, filter)
        return TriggerAddCondition(self.nativeTrigger, filter)
    end
    function Trigger.prototype.RegisterAnyUnitEventBJ(self, whichEvent)
        TriggerRegisterAnyUnitEventBJ(self.nativeTrigger, whichEvent)
    end
    function Trigger.prototype.RegisterPlayerChatEvent(self, whichPlayer, chatMessageToDetect, exactMatchOnly)
        return TriggerRegisterPlayerChatEvent(self.nativeTrigger, whichPlayer, chatMessageToDetect, exactMatchOnly)
    end
    function Trigger.prototype.RegisterPlayerUnitEventSimple(self, whichPlayer, whichEvent)
        return TriggerRegisterPlayerUnitEventSimple(self.nativeTrigger, whichPlayer, whichEvent)
    end
    function Trigger.prototype.RegisterPlayerEventLeave(self, whichPlayer)
        return TriggerRegisterPlayerEventLeave(self.nativeTrigger, whichPlayer.wcPlayer)
    end
    function Trigger.prototype.RegisterPlayerUnitEvent(self, whichPlayer, whichPlayerUnitEvent, filter)
        return TriggerRegisterPlayerUnitEvent(
            self.nativeTrigger,
            whichPlayer,
            whichPlayerUnitEvent,
            (filter == nil and function() return nil end or function() return filter end)()
        )
    end
    function Trigger.prototype.RegisterPlayerSyncEvent(self, whichPlayer, prefix, fromServer)
        return BlzTriggerRegisterPlayerSyncEvent(self.nativeTrigger, whichPlayer, prefix, fromServer)
    end
    function Trigger.prototype.Execute(self)
        TriggerExecute(self.nativeTrigger)
    end
    function Trigger.prototype.Disable(self)
        DisableTrigger(self.nativeTrigger)
    end
    function Trigger.prototype.Enable(self)
        EnableTrigger(self.nativeTrigger)
    end
    return ____exports
    
end
__modules["app.src.JassOverrides.Trigger"] = {initialized = false, cached = nil, loader = __module_7}
function __module_8()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    ____exports.TimedEvent = {}
    local TimedEvent = ____exports.TimedEvent
    TimedEvent.name = "TimedEvent"
    TimedEvent.__index = TimedEvent
    TimedEvent.prototype = {}
    TimedEvent.prototype.__index = TimedEvent.prototype
    TimedEvent.prototype.constructor = TimedEvent
    function TimedEvent.new(...)
        local self = setmetatable({}, TimedEvent.prototype)
        self:____constructor(...)
        return self
    end
    function TimedEvent.prototype.____constructor(self, func, time, safe)
        if safe == nil then
            safe = true
        end
        self.safe = safe
        self.time = time
        self.func = func
    end
    function TimedEvent.prototype.AttemptAction(self, currentTick, teq)
        if not self.endtime then
            self.endtime = ((currentTick + self.time) % 100000) - 1
            if self.endtime < 0 then
                self.endtime = 0
            end
        end
        if self.endtime <= currentTick then
            if self.safe then
                teq:GetGame().safeEventQueue:AddMed(self.func)
            else
                teq:GetGame().eventQueue:AddMed(self.func)
            end
            return true
        end
        return false
    end
    return ____exports
    
end
__modules["app.src.lib.WCEventQueue.TimedEvent"] = {initialized = false, cached = nil, loader = __module_8}
function __module_9()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____AbstractPlayer = require("app.src.World.Entity.Players.AbstractPlayer")
    local AbstractPlayer = ____AbstractPlayer.AbstractPlayer
    local ____GlobalSettings = require("app.src.World.GlobalSettings")
    local ALLOW_PLAYER_TOWER_LOCATIONS = ____GlobalSettings.ALLOW_PLAYER_TOWER_LOCATIONS
    local PLAYER_AREAS = ____GlobalSettings.PLAYER_AREAS
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    local ____TimedEvent = require("app.src.lib.WCEventQueue.TimedEvent")
    local TimedEvent = ____TimedEvent.TimedEvent
    ____exports.Defender = {}
    local Defender = ____exports.Defender
    Defender.name = "Defender"
    Defender.__index = Defender
    Defender.prototype = {}
    Defender.prototype.____getters = {}
    Defender.prototype.__index = __TS__Index(Defender.prototype)
    Defender.prototype.____setters = {}
    Defender.prototype.__newindex = __TS__NewIndex(Defender.prototype)
    Defender.prototype.constructor = Defender
    Defender.____super = AbstractPlayer
    setmetatable(Defender, Defender.____super)
    setmetatable(Defender.prototype, Defender.____super.prototype)
    function Defender.new(...)
        local self = setmetatable({}, Defender.prototype)
        self:____constructor(...)
        return self
    end
    function Defender.prototype.____constructor(self, id, game)
        AbstractPlayer.prototype.____constructor(self, id)
        self.chimeraCount = 0
        self.zerglings = 0
        self.loggedDebug = false
        self.seaElemetals = 0
        self.goldReward = 0
        self._voidFragments = 0
        self._voidFragmentTick = 0
        self._scoreSlot = 0
        self._kills = 0
        self._hasHybridRandomed = false
        self._hasHardcoreRandomed = false
        self._hasNormalPicked = false
        self._races = {}
        self._totalMazeLength = 0
        self.towersEnabled = true
        self._repickCounter = 0
        self._hybridTowers = {}
        self.deniedPlayers = Map.new()
        self._towersArray = {}
        self.holoMaze = nil
        self._builders = {}
        self._towerForces = Map.new()
        self.protectedTowers = {
            FourCC("n01D"),
            FourCC("n01E"),
            FourCC("n01F"),
            FourCC("n01G"),
            FourCC("n01I"),
            FourCC("n009")
        }
        self.game = game
        self:setUpPlayerVariables()
        self.leaveTrigger = Trigger.new()
        self.leaveTrigger:RegisterPlayerEventLeave(self)
        self.leaveTrigger:AddCondition(
            function() return self:PlayerLeftTheGameConditions(game) end
        )
        self.leaveTrigger:AddAction(
            function() return self:PlayerLeftTheGame() end
        )
        self.selectUnitTrigger = Trigger.new()
        self.selectUnitTrigger:RegisterPlayerUnitEvent(self.wcPlayer, EVENT_PLAYER_UNIT_SELECTED)
        self.selectUnitTrigger:AddAction(
            function() return self:SelectUnit() end
        )
        self.game.gameCommandHandler.commandTrigger:RegisterPlayerChatEvent(self.wcPlayer, "", false)
    end
    function Defender.prototype.____getters.towerForces(self)
        return self._towerForces
    end
    function Defender.prototype.____getters.builders(self)
        return self._builders
    end
    function Defender.prototype.____getters.totalMazeLength(self)
        return self._totalMazeLength
    end
    function Defender.prototype.____getters.hybridTowers(self)
        return self._hybridTowers
    end
    function Defender.prototype.____getters.hasHardcoreRandomed(self)
        return self._hasHardcoreRandomed
    end
    function Defender.prototype.____getters.hasNormalPicked(self)
        return self._hasNormalPicked
    end
    function Defender.prototype.____getters.races(self)
        return self._races
    end
    function Defender.prototype.____getters.towersArray(self)
        return self._towersArray
    end
    function Defender.prototype.____getters.hybridBuilder(self)
        return self._hybridBuilder
    end
    function Defender.prototype.____getters.hasHybridRandomed(self)
        return self._hasHybridRandomed
    end
    function Defender.prototype.____getters.lootBoxer(self)
        return self._lootBoxer
    end
    function Defender.prototype.____getters.voidBuilder(self)
        return self._voidBuilder
    end
    function Defender.prototype.____getters.repickCounter(self)
        return self._repickCounter
    end
    function Defender.prototype.____getters.kills(self)
        return self._kills
    end
    function Defender.prototype.____getters.scoreSlot(self)
        return self._scoreSlot
    end
    function Defender.prototype.____setters.builders(self, value)
        self._builders = value
    end
    function Defender.prototype.____setters.totalMazeLength(self, value)
        self._totalMazeLength = value
    end
    function Defender.prototype.____setters.hybridTowers(self, value)
        self._hybridTowers = value
    end
    function Defender.prototype.____setters.hasHardcoreRandomed(self, value)
        self._hasHardcoreRandomed = value
    end
    function Defender.prototype.____setters.hasNormalPicked(self, value)
        self._hasNormalPicked = value
    end
    function Defender.prototype.____setters.races(self, value)
        self._races = value
    end
    function Defender.prototype.____setters.hybridBuilder(self, value)
        self._hybridBuilder = value
    end
    function Defender.prototype.____setters.hasHybridRandomed(self, value)
        self._hasHybridRandomed = value
    end
    function Defender.prototype.____setters.lootBoxer(self, value)
        self._lootBoxer = value
    end
    function Defender.prototype.____setters.voidBuilder(self, value)
        self._voidBuilder = value
    end
    function Defender.prototype.____setters.repickCounter(self, value)
        self._repickCounter = value
    end
    function Defender.prototype.____setters.kills(self, value)
        self._kills = value
    end
    function Defender.prototype.____setters.scoreSlot(self, value)
        self._scoreSlot = value
    end
    function Defender.prototype.setHoloMaze(self, holoMaze)
        if self.holoMaze ~= nil then
            self.holoMaze:Destroy()
        end
        self.holoMaze = holoMaze
    end
    function Defender.prototype.setUpPlayerVariables(self)
        CreateFogModifierRectBJ(
            true,
            self.wcPlayer,
            FOG_OF_WAR_VISIBLE,
            GetPlayableMapRect()
        )
        SetPlayerStateBJ(self.wcPlayer, PLAYER_STATE_RESOURCE_GOLD, self.id == COLOUR.GRAY and 150 or 100)
        SetPlayerStateBJ(self.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER, 1)
        local allowTowerLoc = ALLOW_PLAYER_TOWER_LOCATIONS[self.id + 1]
        self.allowPlayerTower = CreateUnit(
            self.wcPlayer,
            FourCC("h03S"),
            allowTowerLoc.x,
            allowTowerLoc.y,
            0
        )
        SetUnitVertexColor(self.allowPlayerTower, 0, 255, 0, 255)
    end
    function Defender.prototype.hasRace(self, race)
        return __TS__ArrayIndexOf(self._races, race) ~= -1
    end
    function Defender.prototype.getArea(self)
        return PLAYER_AREAS[self.id + 1]
    end
    function Defender.prototype.getCenterX(self)
        local x1 = self:getArea().minX
        local x2 = self:getArea().maxX
        return (x1 + x2) / 2
    end
    function Defender.prototype.getCenterY(self)
        local y1 = self:getArea().minY
        local y2 = self:getArea().maxY
        return (y1 + y2) / 2
    end
    function Defender.prototype.getVoidBuilder(self)
        return self._voidBuilder
    end
    function Defender.prototype.getLootBoxer(self)
        return self._lootBoxer
    end
    function Defender.prototype.getRectangle(self)
        return self:getArea()
    end
    function Defender.prototype.PlayerLeftTheGameConditions(self, game)
        if game.gameLives > 0 then
            return true
        end
        SendMessage(
            tostring(
                self:getNameWithColour()
            ) .. " has left the game!"
        )
        return false
    end
    function Defender.prototype.PlayerLeftTheGame(self)
        SendMessage(
            tostring(
                self:getNameWithColour()
            ) .. " has left the game!"
        )
        self.game.worldMap.playerSpawns[self.id + 1].isOpen = false
        if self.game.scoreBoard and self._scoreSlot > -1 then
            MultiboardSetItemValueBJ(
                self.game.scoreBoard.board,
                1,
                7 + self._scoreSlot,
                Util:ColourString(
                    self:getColourCode(),
                    "<Quit>"
                )
            )
            self._scoreSlot = -1
        end
        for ____, builder in ipairs(self.builders) do
            RemoveUnit(builder)
        end
        if self.hybridBuilder then
            RemoveUnit(self.hybridBuilder)
        end
        local leaveFunction = TimedEvent.new(
            function() return self:AfterPlayerLeft() end,
            20
        )
        self.game.timedEventQueue:AddEvent(leaveFunction)
    end
    function Defender.prototype.AfterPlayerLeft(self)
        self.game.safeEventQueue:AddMed(
            function() return self:DistributeAndDestroyTowers() end
        )
        self:setHoloMaze(nil)
        return true
    end
    function Defender.prototype.AddTower(self, tower)
        __TS__ArrayPush(self._towersArray, tower)
    end
    function Defender.prototype.GiveKillCount(self)
        self._kills = self._kills + 1
        if self.game.scoreBoard then
            MultiboardSetItemValueBJ(
                self.game.scoreBoard.board,
                2,
                7 + self._scoreSlot,
                tostring(self._kills)
            )
        end
        if self.killHook then
            self:killHook()
        end
    end
    function Defender.prototype.GetTower(self, id)
        local indx = __TS__ArrayFindIndex(
            self._towersArray,
            function(____, element) return element.UniqueID == id end
        )
        if indx >= 0 then
            return self._towersArray[indx + 1]
        end
        return nil
    end
    function Defender.prototype.DistributePlayerGold(self)
        local leavingPlayerGold = self:getGold()
        local goldDistribution = leavingPlayerGold / (self.game.players.size - 1)
        goldDistribution = math.floor(goldDistribution * 0.3)
        for player in __TS__Iterator(
            self.game.players:values()
        ) do
            player:sendMessage(
                "You have received |cffffcc00" .. tostring(goldDistribution) .. "|r gold from the leaving player!"
            )
            player:giveGold(goldDistribution)
        end
    end
    function Defender.prototype.DistributeAndDestroyTowers(self)
        if #self._towersArray > 0 then
            local tower = self._towersArray[1]
            if tower then
                self.game.sellTower:SellTower(tower.tower)
                return false
            end
        end
        self:DistributePlayerGold()
        self:setGold(0)
        self.game.players:delete(self.id)
        return true
    end
    function Defender.prototype.ClaimTowers(self)
        local rectangle = self:getRectangle():toRect()
        local grp = GetUnitsInRectMatching(
            rectangle,
            Condition(
                function() return self:IsOwnerNotMe() end
            )
        )
        ForGroupBJ(
            grp,
            function() return self:ClaimTower() end
        )
        RemoveRect(rectangle)
        DestroyGroup(grp)
    end
    function Defender.prototype.ClaimTower(self)
        if IsUnitType(
            GetEnumUnit(),
            UNIT_TYPE_STRUCTURE
        ) then
            local owner = self.game.players:get(
                GetPlayerId(
                    GetOwningPlayer(
                        GetEnumUnit()
                    )
                )
            )
            if owner then
                local tower = owner:GetTower(
                    GetHandleIdBJ(
                        GetEnumUnit()
                    )
                )
                if tower then
                    tower:Sell()
                    tower:SetOwnership(self)
                end
            end
        elseif not IsUnitType(
            GetEnumUnit(),
            UNIT_TYPE_SUMMONED
        ) then
            local owner = self.game.players:get(
                GetPlayerId(
                    GetOwningPlayer(
                        GetEnumUnit()
                    )
                )
            )
            if owner and owner ~= self then
                SetUnitPosition(
                    GetEnumUnit(),
                    owner:getCenterX(),
                    owner:getCenterY()
                )
            end
        end
    end
    function Defender.prototype.DisableTowers(self)
        self.towersEnabled = not self.towersEnabled
        __TS__ArrayForEach(
            self.towersArray,
            function(____, tower)
                if tower:GetSellValue() <= 10 and not (__TS__ArrayIndexOf(
                    self.protectedTowers,
                    tower:GetTypeID()
                ) >= 0) then
                    if self.towersEnabled then
                        PauseUnitBJ(false, tower.tower)
                    else
                        PauseUnitBJ(true, tower.tower)
                    end
                end
            end
        )
        if self.towersEnabled then
            self:sendMessage("Towers enabled")
        else
            self:sendMessage("Towers disabled")
        end
    end
    function Defender.prototype.GetVoidFragments(self)
        return self._voidFragments
    end
    function Defender.prototype.GetVoidFragmentTick(self)
        return self._voidFragmentTick
    end
    function Defender.prototype.SetVoidFragments(self, value)
        self._voidFragments = value
    end
    function Defender.prototype.SetVoidFragmentTick(self, value)
        self._voidFragmentTick = value
    end
    function Defender.prototype.HasDenied(self, num)
        return not not self.deniedPlayers:get(num)
    end
    function Defender.prototype.ReRenderAllowPlayersTower(self)
        local red = 0
        local green = 255
        local allowTower = self.allowPlayerTower
        if allowTower then
            self.deniedPlayers:forEach(
                function(____, value, key)
                    if value then
                        if GetLocalPlayer() == Player(key) then
                            red = 255
                            green = 0
                        end
                    end
                end
            )
            SetUnitVertexColor(allowTower, red, green, 0, 255)
        end
    end
    function Defender.prototype.DenyAllPlayers(self)
        self.game.players:forEach(
            function(____, player)
                if self.id ~= player.id then
                    self.deniedPlayers:set(player.id, true)
                end
            end
        )
        self:ReRenderAllowPlayersTower()
    end
    function Defender.prototype.DenyPlayer(self, num)
        self.deniedPlayers:set(num, true)
        self:ReRenderAllowPlayersTower()
    end
    function Defender.prototype.AllowAllPlayers(self)
        self.game.players:forEach(
            function(____, player)
                if self.id ~= player.id then
                    self.deniedPlayers:set(player.id, false)
                end
            end
        )
        self:ReRenderAllowPlayersTower()
    end
    function Defender.prototype.AllowPlayer(self, num)
        self.deniedPlayers:set(num, false)
        self:ReRenderAllowPlayersTower()
    end
    function Defender.prototype.DestroyLeftoverUnits(self)
        if GetOwningPlayer(
            GetEnumUnit()
        ) == GetTriggerPlayer() then
            RemoveUnit(
                GetEnumUnit()
            )
        end
    end
    function Defender.prototype.GetLogStr(self)
        return "{\"colour\":" .. tostring(self.id) .. ", \"name\": \"" .. tostring(
            self:getPlayerName()
        ) .. "\"}"
    end
    function Defender.prototype.IsOwnerNotMe(self)
        return GetOwningPlayer(
            GetFilterUnit()
        ) ~= self.wcPlayer
    end
    function Defender.prototype.RemoveTower(self, handleId)
        self._towersArray = __TS__ArrayFilter(
            self._towersArray,
            function(____, elem) return elem.UniqueID ~= handleId end
        )
    end
    function Defender.prototype.SelectUnit(self)
        if GetOwningPlayer(
            GetTriggerUnit()
        ) == self.wcPlayer then
            PauseUnit(
                GetTriggerUnit(),
                false
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Players.Defender"] = {initialized = false, cached = nil, loader = __module_9}
function __module_10()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____AbstractPlayer = require("app.src.World.Entity.Players.AbstractPlayer")
    local AbstractPlayer = ____AbstractPlayer.AbstractPlayer
    ____exports.Attacker = {}
    local Attacker = ____exports.Attacker
    Attacker.name = "Attacker"
    Attacker.__index = Attacker
    Attacker.prototype = {}
    Attacker.prototype.__index = Attacker.prototype
    Attacker.prototype.constructor = Attacker
    Attacker.____super = AbstractPlayer
    setmetatable(Attacker, Attacker.____super)
    setmetatable(Attacker.prototype, Attacker.____super.prototype)
    function Attacker.new(...)
        local self = setmetatable({}, Attacker.prototype)
        self:____constructor(...)
        return self
    end
    function Attacker.prototype.____constructor(self, id, game)
        AbstractPlayer.prototype.____constructor(self, id)
        SetPlayerName(self.wcPlayer, "Forces of Darkness")
        SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY, true, self.wcPlayer)
        for humanPlayer in __TS__Iterator(
            game.players:values()
        ) do
            SetPlayerAllianceStateBJ(humanPlayer.wcPlayer, self.wcPlayer, bj_ALLIANCE_UNALLIED)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Players.Attacker"] = {initialized = false, cached = nil, loader = __module_10}
function __module_11()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    ____exports.CheckPoint = {}
    local CheckPoint = ____exports.CheckPoint
    CheckPoint.name = "CheckPoint"
    CheckPoint.__index = CheckPoint
    CheckPoint.prototype = {}
    CheckPoint.prototype.____getters = {}
    CheckPoint.prototype.__index = __TS__Index(CheckPoint.prototype)
    CheckPoint.prototype.____setters = {}
    CheckPoint.prototype.__newindex = __TS__NewIndex(CheckPoint.prototype)
    CheckPoint.prototype.constructor = CheckPoint
    function CheckPoint.new(...)
        local self = setmetatable({}, CheckPoint.prototype)
        self:____constructor(...)
        return self
    end
    function CheckPoint.prototype.____constructor(self, rectangle, worldMap)
        self.rectangle = rectangle
        self.worldMap = worldMap
        self.eventTrig = Trigger.new()
        self.eventTrig:RegisterEnterRectSimple(rectangle)
        self.eventTrig:AddCondition(
            function() return self:verifyTargetCheckpoint() end
        )
        self.eventTrig:AddAction(
            function() return self:checkPointAction() end
        )
    end
    function CheckPoint.prototype.____getters.previous(self)
        return self._previous
    end
    function CheckPoint.prototype.____getters.next(self)
        return self._next
    end
    function CheckPoint.prototype.____setters.previous(self, value)
        self._previous = value
    end
    function CheckPoint.prototype.____setters.next(self, value)
        self._next = value
    end
    function CheckPoint.prototype.verifyTargetCheckpoint(self)
        if not self.isEnteringUnitCreep then
            return false
        end
        local spawnedCreeps = self.worldMap.spawnedCreeps
        if spawnedCreeps ~= nil then
            local spawnedCreep = spawnedCreeps.unitMap:get(
                GetHandleIdBJ(
                    GetEnteringUnit()
                )
            )
            if spawnedCreep ~= nil then
                if spawnedCreep.targetCheckpoint then
                    return spawnedCreep.targetCheckpoint == self
                end
            end
        end
        return true
    end
    function CheckPoint.prototype.checkPointAction(self)
        if not self.next then
            return
        end
        local spawnedCreeps = self.worldMap.spawnedCreeps
        if spawnedCreeps ~= nil then
            local creep = spawnedCreeps.unitMap:get(
                GetHandleIdBJ(
                    GetEnteringUnit()
                )
            )
            if creep ~= nil then
                creep.targetCheckpoint = self.next
                IssuePointOrder(
                    GetEnteringUnit(),
                    "move",
                    GetRectCenterX(self.next.rectangle),
                    GetRectCenterY(self.next.rectangle)
                )
                if UnitHasBuffBJ(
                    GetEnteringUnit(),
                    FourCC("B028")
                ) then
                    creep:morningPerson()
                end
            end
        end
    end
    function CheckPoint.prototype.isEnteringUnitCreep(self)
        local ownerID = GetPlayerId(
            GetOwningPlayer(
                GetEnteringUnit()
            )
        )
        local ____switch19 = ownerID
        if ____switch19 == COLOUR.NAVY then
            goto ____switch19_case_0
        end
        if ____switch19 == COLOUR.TURQUOISE then
            goto ____switch19_case_1
        end
        if ____switch19 == COLOUR.VOILET then
            goto ____switch19_case_2
        end
        if ____switch19 == COLOUR.WHEAT then
            goto ____switch19_case_3
        end
        goto ____switch19_case_default
        ::____switch19_case_0::
        ::____switch19_case_1::
        ::____switch19_case_2::
        ::____switch19_case_3::
        do
            return true
        end
        ::____switch19_case_default::
        do
            return false
        end
        ::____switch19_end::
    end
    return ____exports
    
end
__modules["app.src.World.Entity.CheckPoint"] = {initialized = false, cached = nil, loader = __module_11}
function __module_12()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____CheckPoint = require("app.src.World.Entity.CheckPoint")
    local CheckPoint = ____CheckPoint.CheckPoint
    local ____GlobalSettings = require("app.src.World.GlobalSettings")
    local Sounds = ____GlobalSettings.Sounds
    ____exports.Ship = {}
    local Ship = ____exports.Ship
    Ship.name = "Ship"
    Ship.__index = Ship
    Ship.prototype = {}
    Ship.prototype.__index = __TS__Index(Ship.prototype)
    Ship.prototype.__newindex = __TS__NewIndex(Ship.prototype)
    Ship.prototype.constructor = Ship
    Ship.____super = CheckPoint
    setmetatable(Ship, Ship.____super)
    setmetatable(Ship.prototype, Ship.____super.prototype)
    function Ship.new(...)
        local self = setmetatable({}, Ship.prototype)
        self:____constructor(...)
        return self
    end
    function Ship.prototype.____constructor(self, ship, worldMap)
        CheckPoint.prototype.____constructor(
            self,
            Rect(-768, -4992, 768, -4800),
            worldMap
        )
        self.destination = Rect(-5440, -5664, -5184, -4864)
        self.ship = ship
        self.worldMap = worldMap
        self.game = self.worldMap.game
    end
    function Ship.prototype.MoveShip(self)
        IssuePointOrder(
            self.ship,
            "move",
            GetRectCenterX(self.destination),
            GetRectCenterY(self.destination)
        )
    end
    function Ship.prototype.checkPointAction(self)
        local u = GetEnteringUnit()
        if self.game.gameEnded or not self.game.worldMap.gameRoundHandler then
            return
        end
        if self.game.worldMap.gameRoundHandler.currentWave >= 36 then
            RemoveUnit(u)
        end
        local spawnedCreeps = self.worldMap.spawnedCreeps
        if spawnedCreeps ~= nil then
            local creep = spawnedCreeps.unitMap:get(
                GetHandleIdBJ(
                    GetEnteringUnit()
                )
            )
            if creep ~= nil then
                if creep:getTypeId() == FourCC("uC72") then
                    SendMessage("Archimonde has boarded the ship! |cFFFF0000YOU LOSE!|r")
                    self.game.gameLives = 0
                else
                    if self.game.worldMap.waveCreeps[self.game.worldMap.gameRoundHandler.currentWave]:getCreepType() == CREEP_TYPE.CHAMPION then
                        self.game.gameLives = self.game.gameLives - math.ceil(
                            GetUnitLifePercent(creep.creep) / 10
                        )
                    else
                        self.game.gameLives = self.game.gameLives - math.ceil(
                            GetUnitLifePercent(creep.creep) / 20
                        )
                    end
                    if self.game.gameLives <= 0 then
                        self.game.gameLives = 0
                    end
                    SendMessage(
                        "|c00ff0000A unit has boarded the ship!|r " .. tostring(self.game.gameLives) .. "|c00ff0000% of your lives left|r"
                    )
                end
                creep.targetCheckpoint = nil
                spawnedCreeps.unitMap:delete(
                    GetHandleIdBJ(
                        GetEnteringUnit()
                    )
                )
                RemoveUnit(creep.creep)
                PlaySoundBJ(Sounds.loseALifeSound)
                if self.game.scoreBoard then
                    MultiboardSetItemValueBJ(
                        self.game.scoreBoard.board,
                        2,
                        4,
                        tostring(self.game.gameLives) .. "%"
                    )
                end
                if self.game.gameLives <= 0 then
                    self.game:GameOver()
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Ship"] = {initialized = false, cached = nil, loader = __module_12}
function __module_13()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    ____exports.WaveCreep = {}
    local WaveCreep = ____exports.WaveCreep
    WaveCreep.name = "WaveCreep"
    WaveCreep.__index = WaveCreep
    WaveCreep.prototype = {}
    WaveCreep.prototype.__index = WaveCreep.prototype
    WaveCreep.prototype.constructor = WaveCreep
    function WaveCreep.new(...)
        local self = setmetatable({}, WaveCreep.prototype)
        self:____constructor(...)
        return self
    end
    function WaveCreep.prototype.____constructor(self, wave, id, name)
        self.wave = wave
        self.id = id
        self.name = name
        self.type = self:getCreepType()
        self:getArmourType()
    end
    function WaveCreep.prototype.getCreepType(self)
        local ____switch3 = self.wave
        if ____switch3 == 5 then
            goto ____switch3_case_0
        end
        if ____switch3 == 15 then
            goto ____switch3_case_1
        end
        if ____switch3 == 20 then
            goto ____switch3_case_2
        end
        if ____switch3 == 25 then
            goto ____switch3_case_3
        end
        if ____switch3 == 30 then
            goto ____switch3_case_4
        end
        if ____switch3 == 9 then
            goto ____switch3_case_5
        end
        if ____switch3 == 14 then
            goto ____switch3_case_6
        end
        if ____switch3 == 19 then
            goto ____switch3_case_7
        end
        if ____switch3 == 24 then
            goto ____switch3_case_8
        end
        if ____switch3 == 29 then
            goto ____switch3_case_9
        end
        if ____switch3 == 31 then
            goto ____switch3_case_10
        end
        if ____switch3 == 35 then
            goto ____switch3_case_11
        end
        if ____switch3 == 36 then
            goto ____switch3_case_12
        end
        if ____switch3 == 37 then
            goto ____switch3_case_13
        end
        goto ____switch3_case_default
        ::____switch3_case_0::
        ::____switch3_case_1::
        ::____switch3_case_2::
        ::____switch3_case_3::
        ::____switch3_case_4::
        do
            return CREEP_TYPE.AIR
        end
        ::____switch3_case_5::
        ::____switch3_case_6::
        ::____switch3_case_7::
        ::____switch3_case_8::
        ::____switch3_case_9::
        ::____switch3_case_10::
        do
            return CREEP_TYPE.CHAMPION
        end
        ::____switch3_case_11::
        ::____switch3_case_12::
        ::____switch3_case_13::
        do
            return CREEP_TYPE.BOSS
        end
        ::____switch3_case_default::
        do
            return CREEP_TYPE.NORMAL
        end
        ::____switch3_end::
    end
    function WaveCreep.prototype.getArmourType(self)
        local ____switch5 = self.wave
        if ____switch5 == 1 then
            goto ____switch5_case_0
        end
        if ____switch5 == 6 then
            goto ____switch5_case_1
        end
        if ____switch5 == 9 then
            goto ____switch5_case_2
        end
        if ____switch5 == 14 then
            goto ____switch5_case_3
        end
        if ____switch5 == 21 then
            goto ____switch5_case_4
        end
        if ____switch5 == 29 then
            goto ____switch5_case_5
        end
        if ____switch5 == 34 then
            goto ____switch5_case_6
        end
        if ____switch5 == 4 then
            goto ____switch5_case_7
        end
        if ____switch5 == 8 then
            goto ____switch5_case_8
        end
        if ____switch5 == 11 then
            goto ____switch5_case_9
        end
        if ____switch5 == 16 then
            goto ____switch5_case_10
        end
        if ____switch5 == 19 then
            goto ____switch5_case_11
        end
        if ____switch5 == 23 then
            goto ____switch5_case_12
        end
        if ____switch5 == 27 then
            goto ____switch5_case_13
        end
        if ____switch5 == 32 then
            goto ____switch5_case_14
        end
        if ____switch5 == 3 then
            goto ____switch5_case_15
        end
        if ____switch5 == 7 then
            goto ____switch5_case_16
        end
        if ____switch5 == 12 then
            goto ____switch5_case_17
        end
        if ____switch5 == 17 then
            goto ____switch5_case_18
        end
        if ____switch5 == 24 then
            goto ____switch5_case_19
        end
        if ____switch5 == 28 then
            goto ____switch5_case_20
        end
        if ____switch5 == 33 then
            goto ____switch5_case_21
        end
        if ____switch5 == 2 then
            goto ____switch5_case_22
        end
        if ____switch5 == 5 then
            goto ____switch5_case_23
        end
        if ____switch5 == 13 then
            goto ____switch5_case_24
        end
        if ____switch5 == 15 then
            goto ____switch5_case_25
        end
        if ____switch5 == 20 then
            goto ____switch5_case_26
        end
        if ____switch5 == 25 then
            goto ____switch5_case_27
        end
        if ____switch5 == 30 then
            goto ____switch5_case_28
        end
        if ____switch5 == 10 then
            goto ____switch5_case_29
        end
        if ____switch5 == 18 then
            goto ____switch5_case_30
        end
        if ____switch5 == 22 then
            goto ____switch5_case_31
        end
        if ____switch5 == 26 then
            goto ____switch5_case_32
        end
        if ____switch5 == 31 then
            goto ____switch5_case_33
        end
        if ____switch5 == 35 then
            goto ____switch5_case_34
        end
        if ____switch5 == 36 then
            goto ____switch5_case_35
        end
        if ____switch5 == 37 then
            goto ____switch5_case_36
        end
        goto ____switch5_case_default
        ::____switch5_case_0::
        ::____switch5_case_1::
        ::____switch5_case_2::
        ::____switch5_case_3::
        ::____switch5_case_4::
        ::____switch5_case_5::
        ::____switch5_case_6::
        do
            return ARMOUR_TYPE.UNARMOURED
        end
        ::____switch5_case_7::
        ::____switch5_case_8::
        ::____switch5_case_9::
        ::____switch5_case_10::
        ::____switch5_case_11::
        ::____switch5_case_12::
        ::____switch5_case_13::
        ::____switch5_case_14::
        do
            return ARMOUR_TYPE.LIGHT
        end
        ::____switch5_case_15::
        ::____switch5_case_16::
        ::____switch5_case_17::
        ::____switch5_case_18::
        ::____switch5_case_19::
        ::____switch5_case_20::
        ::____switch5_case_21::
        do
            return ARMOUR_TYPE.MEDIUM
        end
        ::____switch5_case_22::
        ::____switch5_case_23::
        ::____switch5_case_24::
        ::____switch5_case_25::
        ::____switch5_case_26::
        ::____switch5_case_27::
        ::____switch5_case_28::
        do
            return ARMOUR_TYPE.HEAVY
        end
        ::____switch5_case_29::
        ::____switch5_case_30::
        ::____switch5_case_31::
        ::____switch5_case_32::
        ::____switch5_case_33::
        do
            return ARMOUR_TYPE.FORTIFIED
        end
        ::____switch5_case_34::
        ::____switch5_case_35::
        ::____switch5_case_36::
        do
            return ARMOUR_TYPE.HERO
        end
        ::____switch5_case_default::
        do
            Log.Error(
                "COULD NOT FIND ARMOUR TYPE FOR " .. tostring(self.wave) .. ":" .. tostring(self.id) .. ":" .. tostring(self.name)
            )
            return ARMOUR_TYPE.UNARMOURED
        end
        ::____switch5_end::
    end
    return ____exports
    
end
__modules["app.src.World.Entity.WaveCreep"] = {initialized = false, cached = nil, loader = __module_13}
function __module_14()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    ____exports.Race = {}
    local Race = ____exports.Race
    Race.name = "Race"
    Race.__index = Race
    Race.prototype = {}
    Race.prototype.__index = Race.prototype
    Race.prototype.constructor = Race
    function Race.new(...)
        local self = setmetatable({}, Race.prototype)
        self:____constructor(...)
        return self
    end
    function Race.prototype.____constructor(self, id, name, itemid, map, enabled)
        if enabled == nil then
            enabled = true
        end
        self.id = id
        self.name = name
        self.itemid = itemid
        self.enabled = enabled
        self.map = map
        if not enabled then
            map.disabledRaces = map.disabledRaces + 1
        end
    end
    function Race.prototype.pickAction(self, player)
        __TS__ArrayPush(
            player.builders,
            CreateUnit(
                player.wcPlayer,
                FourCC(self.id),
                player:getCenterX(),
                player:getCenterY(),
                bj_UNIT_FACING
            )
        )
    end
    return ____exports
    
end
__modules["app.src.World.Game.Races.Race"] = {initialized = false, cached = nil, loader = __module_14}
function __module_15()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    ____exports.Creep = {}
    local Creep = ____exports.Creep
    Creep.name = "Creep"
    Creep.__index = Creep
    Creep.prototype = {}
    Creep.prototype.__index = Creep.prototype
    Creep.prototype.constructor = Creep
    function Creep.new(...)
        local self = setmetatable({}, Creep.prototype)
        self:____constructor(...)
        return self
    end
    function Creep.prototype.____constructor(self, creep, gameRound, abilities, game)
        self.creep = creep
        self.gameRound = gameRound
        self.game = game
        self:AddArmorBonusByDifficulty()
        self:AddHPBonusByDifficulty()
        self.abilities = abilities
    end
    function Creep.prototype.ReapplyMovement(self)
        if not self.targetCheckpoint then
            Log.Fatal("Creep is missing pathing data")
            return
        end
        IssuePointOrder(
            self.creep,
            "move",
            GetRectCenterX(self.targetCheckpoint.rectangle),
            GetRectCenterY(self.targetCheckpoint.rectangle)
        )
    end
    function Creep.prototype.printId(self)
    end
    function Creep.prototype.getName(self)
        return GetUnitName(self.creep)
    end
    function Creep.prototype.getTypeId(self)
        return GetUnitTypeId(self.creep)
    end
    function Creep.prototype.getHandleId(self)
        return GetHandleIdBJ(self.creep)
    end
    function Creep.prototype.getLocation(self)
        return GetUnitLoc(self.creep)
    end
    function Creep.prototype.morningPerson(self)
        local mdlFile = "Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl"
        DestroyEffect(
            AddSpecialEffect(
                mdlFile,
                GetUnitX(self.creep),
                GetUnitY(self.creep)
            )
        )
        SetUnitLifePercentBJ(
            GetEnteringUnit(),
            GetUnitLifePercent(self.creep) + 0.5 * self.gameRound.currentWave
        )
    end
    function Creep.prototype.AddCreepAbilities(self)
        for ____, ability in ipairs(self.abilities) do
            ability:AddAbilityToCreep(self)
        end
    end
    function Creep.prototype.AddArmorBonusByDifficulty(self)
        local unitArmorScaling = math.floor(
            BlzGetUnitArmor(self.creep) * (self.game.diffVote.difficulty / 100) + 0.5
        )
        BlzSetUnitArmor(self.creep, unitArmorScaling)
    end
    function Creep.prototype.AddHPBonusByDifficulty(self)
        local unitHPScaling = math.floor(
            BlzGetUnitMaxHP(self.creep) * (self.game.diffVote.difficulty / 100) + 0.5
        )
        BlzSetUnitMaxHP(self.creep, unitHPScaling)
        SetUnitLifeBJ(self.creep, unitHPScaling)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Creep"] = {initialized = false, cached = nil, loader = __module_15}
function __module_16()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    local ____Creep = require("app.src.World.Entity.Creep")
    local Creep = ____Creep.Creep
    local ____GlobalSettings = require("app.src.World.GlobalSettings")
    local PLAYER_AREAS = ____GlobalSettings.PLAYER_AREAS
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    ____exports.PlayerSpawns = {}
    local PlayerSpawns = ____exports.PlayerSpawns
    PlayerSpawns.name = "PlayerSpawns"
    PlayerSpawns.__index = PlayerSpawns
    PlayerSpawns.prototype = {}
    PlayerSpawns.prototype.____getters = {}
    PlayerSpawns.prototype.__index = __TS__Index(PlayerSpawns.prototype)
    PlayerSpawns.prototype.____setters = {}
    PlayerSpawns.prototype.__newindex = __TS__NewIndex(PlayerSpawns.prototype)
    PlayerSpawns.prototype.constructor = PlayerSpawns
    function PlayerSpawns.new(...)
        local self = setmetatable({}, PlayerSpawns.prototype)
        self:____constructor(...)
        return self
    end
    function PlayerSpawns.prototype.____constructor(self, worldMap, colourId)
        self.areaTowers = Map.new()
        self.worldMap = worldMap
        self.isOpen = false
        self.colourId = colourId
        self.area = PLAYER_AREAS[self.colourId + 1]
        self.enterTrig = Trigger.new()
        self.enterTrig:RegisterEnterRectangle(self.area)
        self.enterTrig:AddAction(
            function() return self:EnterRegions() end
        )
    end
    function PlayerSpawns.prototype.____getters.spawnOne(self)
        return self._spawnOne
    end
    function PlayerSpawns.prototype.____getters.spawnTwo(self)
        return self._spawnTwo
    end
    function PlayerSpawns.prototype.____setters.spawnOne(self, value)
        self._spawnOne = value
        if self.spawnOne then
            self.oneTrig = Trigger.new()
            self.oneTrig:RegisterEnterRectSimple(self.spawnOne.rectangle)
            self.oneTrig:AddCondition(
                function() return self:EnteringUnitIsCreepAndHasNoCheckpoint() end
            )
            self.oneTrig:AddAction(
                function() return self:SpawnAction(self.spawnOne) end
            )
        end
    end
    function PlayerSpawns.prototype.____setters.spawnTwo(self, value)
        self._spawnTwo = value
        if self.spawnTwo then
            self.twoTrig = Trigger.new()
            self.twoTrig:RegisterEnterRectSimple(self.spawnTwo.rectangle)
            self.twoTrig:AddCondition(
                function() return self:EnteringUnitIsCreepAndHasNoCheckpoint() end
            )
            self.twoTrig:AddAction(
                function() return self:SpawnAction(self.spawnTwo) end
            )
        end
    end
    function PlayerSpawns.prototype.SpawnCreep(self, gameRound, spawned, abilities, wave, creepOwner)
        if not self.isOpen then
            return
        end
        if self.spawnOne then
            local creep = CreateUnit(
                Player(COLOUR.NAVY + creepOwner % 4),
                FourCC(wave.id),
                GetRectCenterX(self.spawnOne.rectangle),
                GetRectCenterY(self.spawnOne.rectangle),
                self:getSpawnFace(self.colourId)
            )
            spawned:set(
                GetHandleId(creep),
                Creep.new(creep, gameRound, abilities, self.worldMap.game)
            )
            if wave.wave ~= 37 then
                if self.spawnTwo then
                    creep = CreateUnit(
                        Player(COLOUR.NAVY + creepOwner % 4),
                        FourCC(wave.id),
                        GetRectCenterX(self.spawnTwo.rectangle),
                        GetRectCenterY(self.spawnTwo.rectangle),
                        self:getSpawnFace(self.colourId)
                    )
                    spawned:set(
                        GetHandleId(creep),
                        Creep.new(creep, gameRound, abilities, self.worldMap.game)
                    )
                end
            end
        end
    end
    function PlayerSpawns.prototype.getSpawnFace(self, id)
        local ____switch19 = id
        if ____switch19 == COLOUR.RED then
            goto ____switch19_case_0
        end
        if ____switch19 == COLOUR.PINK then
            goto ____switch19_case_1
        end
        if ____switch19 == COLOUR.BLUE then
            goto ____switch19_case_2
        end
        if ____switch19 == COLOUR.PURPLE then
            goto ____switch19_case_3
        end
        if ____switch19 == COLOUR.YELLOW then
            goto ____switch19_case_4
        end
        if ____switch19 == COLOUR.ORANGE then
            goto ____switch19_case_5
        end
        if ____switch19 == COLOUR.GRAY then
            goto ____switch19_case_6
        end
        if ____switch19 == COLOUR.BROWN then
            goto ____switch19_case_7
        end
        if ____switch19 == COLOUR.MAROON then
            goto ____switch19_case_8
        end
        if ____switch19 == COLOUR.TEAL then
            goto ____switch19_case_9
        end
        if ____switch19 == COLOUR.GREEN then
            goto ____switch19_case_10
        end
        if ____switch19 == COLOUR.LIGHT_BLUE then
            goto ____switch19_case_11
        end
        if ____switch19 == COLOUR.DARK_GREEN then
            goto ____switch19_case_12
        end
        goto ____switch19_case_default
        ::____switch19_case_0::
        ::____switch19_case_1::
        do
            return 180
        end
        ::____switch19_case_2::
        ::____switch19_case_3::
        ::____switch19_case_4::
        ::____switch19_case_5::
        ::____switch19_case_6::
        ::____switch19_case_7::
        ::____switch19_case_8::
        do
            return 270
        end
        ::____switch19_case_9::
        ::____switch19_case_10::
        do
            return 0
        end
        ::____switch19_case_11::
        ::____switch19_case_12::
        do
            return 90
        end
        ::____switch19_case_default::
        do
            Log.Error(
                "getSpawnFace, could not find player: " .. tostring(id)
            )
            return 0
        end
        ::____switch19_end::
    end
    function PlayerSpawns.prototype.EnteringUnitIsCreepAndHasNoCheckpoint(self)
        if not self:isEnteringUnitCreep() then
            return false
        end
        local spawnedCreeps = self.worldMap.spawnedCreeps
        if spawnedCreeps ~= nil then
            local spawnedCreep = spawnedCreeps.unitMap:get(
                GetHandleIdBJ(
                    GetEnteringUnit()
                )
            )
            if spawnedCreep ~= nil then
                if spawnedCreep.targetCheckpoint then
                    return false
                end
            end
        end
        return true
    end
    function PlayerSpawns.prototype.isEnteringUnitCreep(self)
        local ownerID = GetPlayerId(
            GetOwningPlayer(
                GetEnteringUnit()
            )
        )
        local ____switch26 = ownerID
        if ____switch26 == COLOUR.NAVY then
            goto ____switch26_case_0
        end
        if ____switch26 == COLOUR.TURQUOISE then
            goto ____switch26_case_1
        end
        if ____switch26 == COLOUR.VOILET then
            goto ____switch26_case_2
        end
        if ____switch26 == COLOUR.WHEAT then
            goto ____switch26_case_3
        end
        goto ____switch26_case_default
        ::____switch26_case_0::
        ::____switch26_case_1::
        ::____switch26_case_2::
        ::____switch26_case_3::
        do
            return true
        end
        ::____switch26_case_default::
        do
            return false
        end
        ::____switch26_end::
    end
    function PlayerSpawns.prototype.SpawnAction(self, spawn)
        if self.spawnOne and not spawn.next then
            spawn = self.spawnOne
        end
        if not spawn.next then
            return
        end
        local spawnedCreeps = self.worldMap.spawnedCreeps
        if spawnedCreeps ~= nil then
            local spawnedCreep = spawnedCreeps.unitMap:get(
                GetHandleIdBJ(
                    GetEnteringUnit()
                )
            )
            if spawnedCreep then
                if spawn.next then
                    spawnedCreep.targetCheckpoint = spawn.next
                    IssuePointOrder(
                        GetEnteringUnit(),
                        "move",
                        GetRectCenterX(spawn.next.rectangle),
                        GetRectCenterY(spawn.next.rectangle)
                    )
                    spawnedCreep:AddCreepAbilities()
                end
            end
        end
    end
    function PlayerSpawns.prototype.AreaTowerActions(self, dyingCreep)
        for tower in __TS__Iterator(
            self.areaTowers:values()
        ) do
            tower:PassiveCreepDiesInAreaEffect(dyingCreep)
        end
    end
    function PlayerSpawns.prototype.EnterRegions(self)
        if self:isEnteringUnitCreep() then
            if not self.isOpen then
                if not UnitHasBuffBJ(
                    GetEnteringUnit(),
                    FourCC("Bblo")
                ) then
                    local dummy = CreateUnit(
                        Player(PLAYER_NEUTRAL_PASSIVE),
                        FourCC("u008"),
                        0,
                        -5300,
                        bj_UNIT_FACING
                    )
                    UnitAddAbilityBJ(
                        FourCC("A068"),
                        dummy
                    )
                    IssueTargetOrderBJ(
                        dummy,
                        "bloodlust",
                        GetEnteringUnit()
                    )
                    UnitApplyTimedLifeBJ(
                        1,
                        FourCC("BTLF"),
                        dummy
                    )
                end
            else
                UnitRemoveBuffBJ(
                    FourCC("Bblo"),
                    GetEnteringUnit()
                )
            end
        elseif IsUnitType(
            GetEnteringUnit(),
            UNIT_TYPE_SUMMONED
        ) then
            if GetUnitTypeId(
                GetTriggerUnit()
            ) ~= FourCC("u008") then
                if GetOwningPlayer(
                    GetEnteringUnit()
                ) ~= Player(self.colourId) then
                    SetUnitPosition(
                        GetEnteringUnit(),
                        self.area:GetCenterX(),
                        self.area:GetCenterY()
                    )
                end
            end
        elseif self.worldMap.game.players:get(self.colourId) and not IsUnitType(
            GetEnteringUnit(),
            UNIT_TYPE_STRUCTURE
        ) then
            local areaPlayer = self.worldMap.game.players:get(self.colourId)
            if areaPlayer:HasDenied(
                GetPlayerId(
                    GetOwningPlayer(
                        GetEnteringUnit()
                    )
                )
            ) then
                SetUnitPosition(
                    GetEnteringUnit(),
                    PLAYER_AREAS[GetPlayerId(
                        GetOwningPlayer(
                            GetEnteringUnit()
                        )
                    ) + 1]:GetCenterX(),
                    PLAYER_AREAS[GetPlayerId(
                        GetOwningPlayer(
                            GetEnteringUnit()
                        )
                    ) + 1]:GetCenterY()
                )
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.PlayerSpawns"] = {initialized = false, cached = nil, loader = __module_16}
function __module_17()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    local settings = require("app.src.World.GlobalSettings")
    ____exports.SpawnedCreeps = {}
    local SpawnedCreeps = ____exports.SpawnedCreeps
    SpawnedCreeps.name = "SpawnedCreeps"
    SpawnedCreeps.__index = SpawnedCreeps
    SpawnedCreeps.prototype = {}
    SpawnedCreeps.prototype.__index = SpawnedCreeps.prototype
    SpawnedCreeps.prototype.constructor = SpawnedCreeps
    function SpawnedCreeps.new(...)
        local self = setmetatable({}, SpawnedCreeps.prototype)
        self:____constructor(...)
        return self
    end
    function SpawnedCreeps.prototype.____constructor(self, worldMap)
        self.unitMap = Map.new()
        self.chimearaIds = {
            FourCC("e004"),
            FourCC("e009"),
            FourCC("e00U"),
            FourCC("e00V"),
            FourCC("e000")
        }
        self.worldMap = worldMap
        self.unitDiesTrigger = Trigger.new()
        self.unitDiesTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_DEATH)
        self.unitDiesTrigger:AddAction(
            function() return self:RemoveDeadCreeps() end
        )
    end
    function SpawnedCreeps.prototype.printUnit(self)
        local test = self.unitMap:get(
            GetHandleIdBJ(
                GetTriggerUnit()
            )
        )
        if test ~= nil then
            test:printId()
        end
    end
    function SpawnedCreeps.prototype.RemoveDeadCreeps(self)
        local creep = self.unitMap:get(
            GetHandleIdBJ(
                GetDyingUnit()
            )
        )
        if not creep then
            local dyingId = GetUnitTypeId(
                GetDyingUnit()
            )
            local owningplayer = self.worldMap.game.players:get(
                GetPlayerId(
                    GetOwningPlayer(
                        GetDyingUnit()
                    )
                )
            )
            if __TS__ArrayIndexOf(
                self.chimearaIds,
                GetUnitTypeId(
                    GetDyingUnit()
                )
            ) >= 0 then
                if owningplayer then
                    owningplayer.chimeraCount = owningplayer.chimeraCount - 1
                end
            end
            if dyingId == FourCC("u042") then
                if owningplayer then
                    owningplayer.zerglings = owningplayer.zerglings - 1
                end
            end
            if owningplayer then
                local tower = owningplayer:GetTower(
                    GetHandleId(
                        GetDyingUnit()
                    )
                )
                if tower then
                    tower:Remove()
                    return
                end
            end
            RemoveUnit(
                GetDyingUnit()
            )
            return
        end
        local area
        do
            local i = 0
            while i < #settings.PLAYER_AREAS do
                if settings.PLAYER_AREAS[i + 1]:ContainsCreep(creep) then
                    area = i
                    break
                end
                i = i + 1
            end
        end
        if area then
            self.worldMap.playerSpawns[area + 1]:AreaTowerActions(creep)
        end
        local player = self.worldMap.game.players:get(
            GetPlayerId(
                GetOwningPlayer(
                    GetKillingUnitBJ()
                )
            )
        )
        if player then
            player:GiveKillCount()
        end
        self.unitMap:delete(
            creep:getHandleId()
        )
        RemoveUnit(creep.creep)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.SpawnedCreeps"] = {initialized = false, cached = nil, loader = __module_17}
function __module_18()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____CheckPoint = require("app.src.World.Entity.CheckPoint")
    local CheckPoint = ____CheckPoint.CheckPoint
    ____exports.Teleporter = {}
    local Teleporter = ____exports.Teleporter
    Teleporter.name = "Teleporter"
    Teleporter.__index = Teleporter
    Teleporter.prototype = {}
    Teleporter.prototype.__index = __TS__Index(Teleporter.prototype)
    Teleporter.prototype.__newindex = __TS__NewIndex(Teleporter.prototype)
    Teleporter.prototype.constructor = Teleporter
    Teleporter.____super = CheckPoint
    setmetatable(Teleporter, Teleporter.____super)
    setmetatable(Teleporter.prototype, Teleporter.____super.prototype)
    function Teleporter.new(...)
        local self = setmetatable({}, Teleporter.prototype)
        self:____constructor(...)
        return self
    end
    function Teleporter.prototype.____constructor(self, rectangle, worldMap, facing)
        CheckPoint.prototype.____constructor(self, rectangle, worldMap)
        self.facing = facing
    end
    function Teleporter.prototype.checkPointAction(self)
        if not self.next then
            return
        end
        local x = GetRectCenterX(self.next.rectangle)
        local y = GetRectCenterY(self.next.rectangle)
        local spawnedCreeps = self.worldMap.spawnedCreeps
        if spawnedCreeps ~= nil then
            local spawnedCreep = spawnedCreeps.unitMap:get(
                GetHandleIdBJ(
                    GetEnteringUnit()
                )
            )
            if spawnedCreep ~= nil then
                spawnedCreep.targetCheckpoint = self.next
                SetUnitPosition(
                    GetEnteringUnit(),
                    x,
                    y
                )
                SetUnitFacing(
                    GetEnteringUnit(),
                    self.facing
                )
                DestroyEffect(
                    AddSpecialEffect("Abilities/Spells/Human/MassTeleport/MassTeleportCaster.mdl", x, y)
                )
                IssuePointOrder(
                    GetEnteringUnit(),
                    "move",
                    GetRectCenterX(self.next.rectangle),
                    GetRectCenterY(self.next.rectangle)
                )
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Teleporter"] = {initialized = false, cached = nil, loader = __module_18}
function __module_19()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Race = require("app.src.World.Game.Races.Race")
    local Race = ____Race.Race
    ____exports.RaceVoid = {}
    local RaceVoid = ____exports.RaceVoid
    RaceVoid.name = "RaceVoid"
    RaceVoid.__index = RaceVoid
    RaceVoid.prototype = {}
    RaceVoid.prototype.__index = RaceVoid.prototype
    RaceVoid.prototype.constructor = RaceVoid
    RaceVoid.____super = Race
    setmetatable(RaceVoid, RaceVoid.____super)
    setmetatable(RaceVoid.prototype, RaceVoid.____super.prototype)
    function RaceVoid.new(...)
        local self = setmetatable({}, RaceVoid.prototype)
        self:____constructor(...)
        return self
    end
    function RaceVoid.prototype.pickAction(self, player)
        player.voidBuilder = CreateUnit(
            player.wcPlayer,
            FourCC(self.id),
            player:getCenterX(),
            player:getCenterY(),
            bj_UNIT_FACING
        )
        local voidBuilder = player:getVoidBuilder()
        if voidBuilder ~= nil then
            UnitAddItemByIdSwapped(
                FourCC("I01Y"),
                voidBuilder
            )
            UnitAddItemByIdSwapped(
                FourCC("I01Z"),
                voidBuilder
            )
            UnitAddItemByIdSwapped(
                FourCC("I020"),
                voidBuilder
            )
            UnitAddItemByIdSwapped(
                FourCC("I01X"),
                voidBuilder
            )
            UnitAddItemByIdSwapped(
                FourCC("I02E"),
                voidBuilder
            )
        end
        __TS__ArrayPush(player.builders, player.voidBuilder)
    end
    return ____exports
    
end
__modules["app.src.World.Game.Races.RaceVoid"] = {initialized = false, cached = nil, loader = __module_19}
function __module_20()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Race = require("app.src.World.Game.Races.Race")
    local Race = ____Race.Race
    ____exports.RaceLootBoxer = {}
    local RaceLootBoxer = ____exports.RaceLootBoxer
    RaceLootBoxer.name = "RaceLootBoxer"
    RaceLootBoxer.__index = RaceLootBoxer
    RaceLootBoxer.prototype = {}
    RaceLootBoxer.prototype.__index = RaceLootBoxer.prototype
    RaceLootBoxer.prototype.constructor = RaceLootBoxer
    RaceLootBoxer.____super = Race
    setmetatable(RaceLootBoxer, RaceLootBoxer.____super)
    setmetatable(RaceLootBoxer.prototype, RaceLootBoxer.____super.prototype)
    function RaceLootBoxer.new(...)
        local self = setmetatable({}, RaceLootBoxer.prototype)
        self:____constructor(...)
        return self
    end
    function RaceLootBoxer.prototype.pickAction(self, player)
        if player.lootBoxer then
            player:sendMessage("I\'m sorry Dave, I\'m afraid I can\'t do that")
            player:giveLumber(1)
            return
        end
        player.lootBoxer = CreateUnit(
            player.wcPlayer,
            FourCC(self.id),
            player:getCenterX(),
            player:getCenterY(),
            bj_UNIT_FACING
        )
        __TS__ArrayPush(player.builders, player.lootBoxer)
    end
    return ____exports
    
end
__modules["app.src.World.Game.Races.RaceLootBoxer"] = {initialized = false, cached = nil, loader = __module_20}
function __module_21()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    ____exports.Node = {}
    local Node = ____exports.Node
    Node.name = "Node"
    Node.__index = Node
    Node.prototype = {}
    Node.prototype.__index = Node.prototype
    Node.prototype.constructor = Node
    function Node.new(...)
        local self = setmetatable({}, Node.prototype)
        self:____constructor(...)
        return self
    end
    function Node.prototype.____constructor(self, x, y, distance)
        self.x = x
        self.y = y
        self.distance = distance
    end
    return ____exports
    
end
__modules["app.src.World.Antiblock.Node"] = {initialized = false, cached = nil, loader = __module_21}
function __module_22()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    ____exports.NodeQueue = {}
    local NodeQueue = ____exports.NodeQueue
    NodeQueue.name = "NodeQueue"
    NodeQueue.__index = NodeQueue
    NodeQueue.prototype = {}
    NodeQueue.prototype.__index = NodeQueue.prototype
    NodeQueue.prototype.constructor = NodeQueue
    function NodeQueue.new(...)
        local self = setmetatable({}, NodeQueue.prototype)
        self:____constructor(...)
        return self
    end
    function NodeQueue.prototype.____constructor(self)
        self._nodes = {}
        self._i = 0
    end
    function NodeQueue.prototype.push(self, node)
        __TS__ArrayPush(self._nodes, node)
    end
    function NodeQueue.prototype.empty(self)
        return self._i >= #self._nodes
    end
    function NodeQueue.prototype.front(self)
        return self._nodes[self._i + 1]
    end
    function NodeQueue.prototype.pop(self)
        __TS__ArrayShift(self._nodes)
    end
    return ____exports
    
end
__modules["app.src.World.Antiblock.NodeQueue"] = {initialized = false, cached = nil, loader = __module_22}
function __module_23()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Node = require("app.src.World.Antiblock.Node")
    local Node = ____Node.Node
    local ____NodeQueue = require("app.src.World.Antiblock.NodeQueue")
    local NodeQueue = ____NodeQueue.NodeQueue
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    ____exports.Walkable = {}
    ____exports.Walkable.Walkable = 0
    ____exports.Walkable[____exports.Walkable.Walkable] = "Walkable"
    ____exports.Walkable.Blocked = 1
    ____exports.Walkable[____exports.Walkable.Blocked] = "Blocked"
    ____exports.Walkable.Protected = 2
    ____exports.Walkable[____exports.Walkable.Protected] = "Protected"
    ____exports.Maze = {}
    local Maze = ____exports.Maze
    Maze.name = "Maze"
    Maze.__index = Maze
    Maze.prototype = {}
    Maze.prototype.__index = Maze.prototype
    Maze.prototype.constructor = Maze
    function Maze.new(...)
        local self = setmetatable({}, Maze.prototype)
        self:____constructor(...)
        return self
    end
    function Maze.prototype.____constructor(self, minX, minY, maxX, maxY, width, height, maze)
        self.antiJugglers = {}
        self.minX = minX
        self.minY = minY
        self.maxX = maxX
        self.maxY = maxY
        self.width = width
        self.height = height
        self.maze = maze
    end
    function Maze.prototype.setWalkable(self, x, y, isWalkable)
        self.maze[x + 1][y + 1] = isWalkable
    end
    function Maze.prototype.breathFirstSearch(self, sourceX, sourceY, destinationX, destinationY)
        if self.maze[sourceX + 1][sourceY + 1] ~= ____exports.Walkable.Walkable or self.maze[destinationX + 1][destinationY + 1] ~= ____exports.Walkable.Walkable then
            return -1
        end
        local visited = {}
        do
            local i = 0
            while i < self.width do
                do
                    local j = 0
                    while j < self.height do
                        visited[(i + j * self.width) + 1] = false
                        j = j + 1
                    end
                end
                i = i + 1
            end
        end
        visited[(sourceX + sourceY * self.width) + 1] = true
        local q = NodeQueue.new()
        local s = Node.new(sourceX, sourceY, 0)
        q:push(s)
        while not q:empty() do
            local curr = q:front()
            if curr.x == destinationX and curr.y == destinationY then
                return curr.distance
            end
            q:pop()
            do
                local i = 0
                while i < 4 do
                    local row = curr.x + ____exports.Maze.ROW_NUM[i + 1]
                    local col = curr.y + ____exports.Maze.COL_NUM[i + 1]
                    if self:isValid(row, col) and self.maze[row + 1][col + 1] == ____exports.Walkable.Walkable and visited[(row + col * self.width) + 1] == false then
                        visited[(row + col * self.width) + 1] = true
                        q:push(
                            Node.new(row, col, curr.distance + 1)
                        )
                    end
                    i = i + 1
                end
            end
        end
        return -1
    end
    function Maze.prototype.isValid(self, row, col)
        return (row >= 0 and row < self.width and col >= 0 and col < self.height)
    end
    function Maze.prototype.Cleanup(self, x, y)
        if self.maze[x + 1][y + 1] == ____exports.Walkable.Protected then
            self:setWalkable(x, y, ____exports.Walkable.Walkable)
        end
    end
    function Maze.prototype.CleanAll(self)
        for ____, antijuggle in ipairs(self.antiJugglers) do
            antijuggle:EndOfRoundAction()
        end
        self.antiJugglers = {}
        do
            local x = 0
            while x < self.width do
                do
                    local y = 0
                    while y < self.height do
                        self:Cleanup(x, y)
                        y = y + 1
                    end
                end
                x = x + 1
            end
        end
    end
    function Maze.prototype.SanityCheck(self)
        do
            local x = 0
            while x < self.width do
                do
                    local y = 0
                    while y < self.height do
                        local cornerX = (x * 64) + self.minX
                        local cornerY = y * 64 + self.minY
                        if IsTerrainPathable(cornerX, cornerY, PATHING_TYPE_WALKABILITY) == (self.maze[x + 1][y + 1] == ____exports.Walkable.Walkable) or IsTerrainPathable(cornerX, cornerY + 32, PATHING_TYPE_WALKABILITY) == (self.maze[x + 1][y + 1] == ____exports.Walkable.Walkable) or IsTerrainPathable(cornerX + 32, cornerY, PATHING_TYPE_WALKABILITY) == (self.maze[x + 1][y + 1] == ____exports.Walkable.Walkable) or IsTerrainPathable(cornerX + 32, cornerY + 32, PATHING_TYPE_WALKABILITY) == (self.maze[x + 1][y + 1] == ____exports.Walkable.Walkable) then
                            Log.Error(
                                tostring(x) .. ", " .. tostring(y) .. " is a missmatch"
                            )
                        end
                        y = y + 1
                    end
                end
                x = x + 1
            end
        end
    end
    function Maze.prototype.CheckAll(self)
        do
            local x = 0
            while x < self.width do
                do
                    local y = 0
                    while y < self.height do
                        local cornerX = (x * 64) + self.minX
                        local cornerY = y * 64 + self.minY
                        if IsTerrainPathable(cornerX, cornerY, PATHING_TYPE_WALKABILITY) or IsTerrainPathable(cornerX, cornerY + 32, PATHING_TYPE_WALKABILITY) or IsTerrainPathable(cornerX + 32, cornerY, PATHING_TYPE_WALKABILITY) or IsTerrainPathable(cornerX + 32, cornerY + 32, PATHING_TYPE_WALKABILITY) then
                            Log.Debug(
                                tostring(x) .. ", " .. tostring(y) .. " is a unwalkable"
                            )
                        end
                        y = y + 1
                    end
                end
                x = x + 1
            end
        end
    end
    function Maze.prototype.AddAntiJuggler(self, antijuggle)
        __TS__ArrayPush(self.antiJugglers, antijuggle)
    end
    Maze.ROW_NUM = {-1, 0, 0, 1}
    Maze.COL_NUM = {0, -1, 1, 0}
    return ____exports
    
end
__modules["app.src.World.Antiblock.Maze"] = {initialized = false, cached = nil, loader = __module_23}
function __module_24()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local settings = require("app.src.World.GlobalSettings")
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    local ____Maze = require("app.src.World.Antiblock.Maze")
    local Walkable = ____Maze.Walkable
    ____exports.AntiBlock = {}
    local AntiBlock = ____exports.AntiBlock
    AntiBlock.name = "AntiBlock"
    AntiBlock.__index = AntiBlock
    AntiBlock.prototype = {}
    AntiBlock.prototype.__index = AntiBlock.prototype
    AntiBlock.prototype.constructor = AntiBlock
    function AntiBlock.new(...)
        local self = setmetatable({}, AntiBlock.prototype)
        self:____constructor(...)
        return self
    end
    function AntiBlock.prototype.____constructor(self, worldMap)
        self._worldMap = worldMap
        self._eventTrigger = Trigger.new()
        self._eventTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_START)
        self._eventTrigger:AddAction(
            function() return self:Action() end
        )
        self._cancelBuildingTrigger = Trigger.new()
        self._cancelBuildingTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_CANCEL)
        self._cancelBuildingTrigger:AddAction(
            function() return self:CanceledBuilding() end
        )
    end
    function AntiBlock.prototype.Action(self)
        local consUnit = GetConstructingStructure()
        local x = GetUnitX(
            GetConstructingStructure()
        )
        local y = GetUnitY(
            GetConstructingStructure()
        )
        local loc = GetUnitLoc(consUnit)
        local antiJuggleTowers = {}
        local hasBuiltOnAntiJuggle = false
        ForGroup(
            GetUnitsInRangeOfLocAll(128, loc),
            function()
                if GetUnitTypeId(
                    GetEnumUnit()
                ) == FourCC("uC14") then
                    if GetUnitX(
                        GetEnumUnit()
                    ) == x and GetUnitY(
                        GetEnumUnit()
                    ) == y then
                        hasBuiltOnAntiJuggle = true
                        RemoveUnit(
                            GetEnumUnit()
                        )
                    else
                        __TS__ArrayPush(
                            antiJuggleTowers,
                            GetEnumUnit()
                        )
                    end
                end
            end
        )
        local player = self._worldMap.game.players:get(
            GetPlayerId(
                GetOwningPlayer(consUnit)
            )
        )
        if player == nil then
            return
        end
        local isWaveInProgress = not not self._worldMap.gameRoundHandler and self._worldMap.gameRoundHandler.isWaveInProgress
        local antiJuggleEnabled = not not self._worldMap.gameRoundHandler and self._worldMap.gameRoundHandler.antiJuggleEnabled
        local antiJuggleCreeps = {}
        if isWaveInProgress and hasBuiltOnAntiJuggle == false and antiJuggleEnabled then
            local isJuggling = false
            ForGroup(
                GetUnitsInRangeOfLocAll(128, loc),
                function()
                    local ownerID = GetPlayerId(
                        GetOwningPlayer(
                            GetEnumUnit()
                        )
                    )
                    local ____switch12 = ownerID
                    if ____switch12 == COLOUR.NAVY then
                        goto ____switch12_case_0
                    end
                    if ____switch12 == COLOUR.TURQUOISE then
                        goto ____switch12_case_1
                    end
                    if ____switch12 == COLOUR.VOILET then
                        goto ____switch12_case_2
                    end
                    if ____switch12 == COLOUR.WHEAT then
                        goto ____switch12_case_3
                    end
                    goto ____switch12_case_default
                    ::____switch12_case_0::
                    ::____switch12_case_1::
                    ::____switch12_case_2::
                    ::____switch12_case_3::
                    do
                        if IsUnitAliveBJ(
                            GetEnumUnit()
                        ) then
                            local creep = self._worldMap.spawnedCreeps.unitMap:get(
                                GetHandleId(
                                    GetEnumUnit()
                                )
                            )
                            if creep ~= nil then
                                __TS__ArrayPush(antiJuggleCreeps, creep)
                            else
                                Log.Debug("Creep is missing in spawnedCreeps unitMap")
                            end
                            isJuggling = true
                        end
                        goto ____switch12_end
                    end
                    ::____switch12_case_default::
                    do
                        goto ____switch12_end
                    end
                    ::____switch12_end::
                end
            )
            if isJuggling then
                RemoveLocation(loc)
                return self:juggling(consUnit, player, antiJuggleCreeps)
            end
        end
        RemoveLocation(loc)
        if GetUnitAbilityLevelSwapped(
            FourCC("A0CR"),
            consUnit
        ) > 0 then
            if not player:getRectangle():ContainsUnit(consUnit) then
                return self:homesick(consUnit, player)
            end
        end
        local playerSpawnId
        do
            local i = 0
            while i < #settings.PLAYER_AREAS do
                if settings.PLAYER_AREAS[i + 1]:ContainsUnit(consUnit) then
                    playerSpawnId = i
                    break
                end
                i = i + 1
            end
        end
        if playerSpawnId == nil then
            return
        end
        local maze = self._worldMap.playerMazes[playerSpawnId + 1]
        local leftSide = ((x - 64) - maze.minX) / 64
        local rightSide = (x - maze.minX) / 64
        local topSide = (y - maze.minY) / 64
        local bottomSide = ((y - 64) - maze.minY) / 64
        maze:setWalkable(leftSide, bottomSide, Walkable.Blocked)
        maze:setWalkable(rightSide, bottomSide, Walkable.Blocked)
        maze:setWalkable(leftSide, topSide, Walkable.Blocked)
        maze:setWalkable(rightSide, topSide, Walkable.Blocked)
        local playerSpawn = self._worldMap.playerSpawns[playerSpawnId + 1]
        local spawnOne = playerSpawn.spawnOne
        local firstCheckpoint = spawnOne.next
        local spawnX = math.max(
            math.min(
                math.floor(
                    (GetRectCenterX(spawnOne.rectangle) - maze.minX) / 64
                ),
                maze.width - 1
            ),
            0
        )
        local spawnY = math.max(
            math.min(
                math.floor(
                    (GetRectCenterY(spawnOne.rectangle) - maze.minY) / 64
                ),
                maze.height - 1
            ),
            0
        )
        local firstCheckpointX = math.floor(
            (GetRectCenterX(firstCheckpoint.rectangle) - maze.minX) / 64
        )
        local firstCheckpointY = math.floor(
            (GetRectCenterY(firstCheckpoint.rectangle) - maze.minY) / 64
        )
        local firstCheckpointBFS = maze:breathFirstSearch(spawnX, spawnY, firstCheckpointX, firstCheckpointY)
        if firstCheckpointBFS == -1 then
            maze:setWalkable(leftSide, bottomSide, Walkable.Walkable)
            maze:setWalkable(rightSide, bottomSide, Walkable.Walkable)
            maze:setWalkable(leftSide, topSide, Walkable.Walkable)
            maze:setWalkable(rightSide, topSide, Walkable.Walkable)
            __TS__ArrayForEach(
                antiJuggleTowers,
                function(____, antiJuggleTower)
                    local antiJuggleX = GetUnitX(antiJuggleTower)
                    local antiJuggleY = GetUnitY(antiJuggleTower)
                    local antiJuggleLeftSide = ((antiJuggleX - 64) - maze.minX) / 64
                    local antiJuggleRightSide = (antiJuggleX - maze.minX) / 64
                    local antiJuggleTopSide = (antiJuggleY - maze.minY) / 64
                    local antiJuggleBottomSide = ((antiJuggleY - 64) - maze.minY) / 64
                    maze:setWalkable(antiJuggleLeftSide, antiJuggleBottomSide, Walkable.Protected)
                    maze:setWalkable(antiJuggleRightSide, antiJuggleBottomSide, Walkable.Protected)
                    maze:setWalkable(antiJuggleLeftSide, antiJuggleTopSide, Walkable.Protected)
                    maze:setWalkable(antiJuggleRightSide, antiJuggleTopSide, Walkable.Protected)
                end
            )
            return self:blocking(consUnit, player)
        end
        local secondCheckpoint = firstCheckpoint.next
        local secondCheckpointX = math.floor(
            (GetRectCenterX(secondCheckpoint.rectangle) - maze.minX) / 64
        )
        local secondCheckpointY = math.floor(
            (GetRectCenterY(secondCheckpoint.rectangle) - maze.minY) / 64
        )
        local secondCheckpointBFS = maze:breathFirstSearch(firstCheckpointX, firstCheckpointY, secondCheckpointX, secondCheckpointY)
        if secondCheckpointBFS == -1 then
            maze:setWalkable(leftSide, bottomSide, Walkable.Walkable)
            maze:setWalkable(rightSide, bottomSide, Walkable.Walkable)
            maze:setWalkable(leftSide, topSide, Walkable.Walkable)
            maze:setWalkable(rightSide, topSide, Walkable.Walkable)
            __TS__ArrayForEach(
                antiJuggleTowers,
                function(____, antiJuggleTower)
                    local antiJuggleX = GetUnitX(antiJuggleTower)
                    local antiJuggleY = GetUnitY(antiJuggleTower)
                    local antiJuggleLeftSide = ((antiJuggleX - 64) - maze.minX) / 64
                    local antiJuggleRightSide = (antiJuggleX - maze.minX) / 64
                    local antiJuggleTopSide = (antiJuggleY - maze.minY) / 64
                    local antiJuggleBottomSide = ((antiJuggleY - 64) - maze.minY) / 64
                    maze:setWalkable(antiJuggleLeftSide, antiJuggleBottomSide, Walkable.Protected)
                    maze:setWalkable(antiJuggleRightSide, antiJuggleBottomSide, Walkable.Protected)
                    maze:setWalkable(antiJuggleLeftSide, antiJuggleTopSide, Walkable.Protected)
                    maze:setWalkable(antiJuggleRightSide, antiJuggleTopSide, Walkable.Protected)
                end
            )
            return self:blocking(consUnit, player)
        end
        local ____end = secondCheckpoint.next
        local endX = math.max(
            math.min(
                math.floor(
                    (GetRectCenterX(____end.rectangle) - maze.minX) / 64
                ),
                maze.width - 1
            ),
            0
        )
        local endY = math.max(
            math.min(
                math.floor(
                    (GetRectCenterY(____end.rectangle) - maze.minY) / 64
                ),
                maze.height - 1
            ),
            0
        )
        local exitPointBFS = maze:breathFirstSearch(secondCheckpointX, secondCheckpointY, endX, endY)
        if exitPointBFS == -1 then
            maze:setWalkable(leftSide, bottomSide, Walkable.Walkable)
            maze:setWalkable(rightSide, bottomSide, Walkable.Walkable)
            maze:setWalkable(leftSide, topSide, Walkable.Walkable)
            maze:setWalkable(rightSide, topSide, Walkable.Walkable)
            __TS__ArrayForEach(
                antiJuggleTowers,
                function(____, antiJuggleTower)
                    local antiJuggleX = GetUnitX(antiJuggleTower)
                    local antiJuggleY = GetUnitY(antiJuggleTower)
                    local antiJuggleLeftSide = ((antiJuggleX - 64) - maze.minX) / 64
                    local antiJuggleRightSide = (antiJuggleX - maze.minX) / 64
                    local antiJuggleTopSide = (antiJuggleY - maze.minY) / 64
                    local antiJuggleBottomSide = ((antiJuggleY - 64) - maze.minY) / 64
                    maze:setWalkable(antiJuggleLeftSide, antiJuggleBottomSide, Walkable.Protected)
                    maze:setWalkable(antiJuggleRightSide, antiJuggleBottomSide, Walkable.Protected)
                    maze:setWalkable(antiJuggleLeftSide, antiJuggleTopSide, Walkable.Protected)
                    maze:setWalkable(antiJuggleRightSide, antiJuggleTopSide, Walkable.Protected)
                end
            )
            return self:blocking(consUnit, player)
        end
        player.totalMazeLength = firstCheckpointBFS + secondCheckpointBFS + exitPointBFS
    end
    function AntiBlock.prototype.blocking(self, consUnit, player)
        player:sendMessage("|CFFFF0303[Anti-Block]|r |CFFFFFF01Detected a possible blocking attempt." .. " Your building has been cancelled and you have been refunded the full cost.|r")
        self:cancelBuilding(consUnit)
    end
    function AntiBlock.prototype.juggling(self, consUnit, player, antiJuggleCreeps)
        player:sendMessage("|CFFFF0303[Anti-Juggle]|r |CFFFFFF01Detected a possible juggling attempt." .. " Your building has been cancelled and you have been refunded the full cost.|r")
        self:cancelBuilding(consUnit)
        __TS__ArrayForEach(
            antiJuggleCreeps,
            function(____, creep) return creep:ReapplyMovement() end
        )
    end
    function AntiBlock.prototype.homesick(self, consUnit, player)
        player:sendMessage("|CFFFF0303Your tower got|r " .. "|CFFFFFF01homesick|r" .. " |CFFFF0303for being too far away from your spawn.|r")
        self:cancelBuilding(consUnit)
    end
    function AntiBlock.prototype.cancelBuilding(self, consUnit)
        TriggerSleepAction(0.01)
        IssueImmediateOrderById(consUnit, settings.UNIT_ORDER_CANCEL_UPGRADE)
        RemoveUnit(consUnit)
    end
    function AntiBlock.prototype.CanceledBuilding(self)
        local u = GetCancelledStructure()
        self:CleanUpRemovedConstruction(u)
    end
    function AntiBlock.prototype.CleanUpRemovedConstruction(self, u)
        local playerSpawnId
        do
            local i = 0
            while i < #settings.PLAYER_AREAS do
                if settings.PLAYER_AREAS[i + 1]:ContainsUnit(u) then
                    playerSpawnId = i
                    break
                end
                i = i + 1
            end
        end
        if playerSpawnId == nil then
            Log.Fatal("Unable to locate the correct player spawn")
            return
        end
        local x = GetUnitX(u)
        local y = GetUnitY(u)
        local maze = self._worldMap.playerMazes[playerSpawnId + 1]
        local leftSide = ((x - 64) - maze.minX) / 64
        local rightSide = (x - maze.minX) / 64
        local topSide = (y - maze.minY) / 64
        local bottomSide = ((y - 64) - maze.minY) / 64
        maze:setWalkable(leftSide, bottomSide, Walkable.Walkable)
        maze:setWalkable(rightSide, bottomSide, Walkable.Walkable)
        maze:setWalkable(leftSide, topSide, Walkable.Walkable)
        maze:setWalkable(rightSide, topSide, Walkable.Walkable)
    end
    return ____exports
    
end
__modules["app.src.World.Antiblock.AntiBlock"] = {initialized = false, cached = nil, loader = __module_24}
function __module_25()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    ____exports.Destructable = {}
    local Destructable = ____exports.Destructable
    Destructable.name = "Destructable"
    Destructable.__index = Destructable
    Destructable.prototype = {}
    Destructable.prototype.__index = Destructable.prototype
    Destructable.prototype.constructor = Destructable
    function Destructable.new(...)
        local self = setmetatable({}, Destructable.prototype)
        self:____constructor(...)
        return self
    end
    function Destructable.prototype.____constructor(self, destr)
        self.destr = destr
        ____exports.Destructable._byDestr:set(destr, self)
    end
    function Destructable.Create(self, objectid, x, y, face, scale, variation)
        return ____exports.Destructable.new(
            CreateDestructable(objectid, x, y, face, scale, variation)
        )
    end
    function Destructable.CreateZ(self, objectid, x, y, z, face, scale, variation)
        return ____exports.Destructable.new(
            CreateDestructableZ(objectid, x, y, z, face, scale, variation)
        )
    end
    function Destructable.CreateDead(self, objectid, x, y, face, scale, variation)
        return ____exports.Destructable.new(
            CreateDeadDestructable(objectid, x, y, face, scale, variation)
        )
    end
    function Destructable.CreateDeadZ(self, objectid, x, y, z, face, scale, variation)
        return ____exports.Destructable.new(
            CreateDeadDestructableZ(objectid, x, y, z, face, scale, variation)
        )
    end
    function Destructable.ByDestr(self, destr)
        return ____exports.Destructable._byDestr:has(destr) and ____exports.Destructable._byDestr:get(destr) or ____exports.Destructable.new(destr)
    end
    function Destructable.FilterDestructable(self)
        return self:ByDestr(
            GetFilterDestructable()
        )
    end
    function Destructable.EnumDestructable(self)
        return self:ByDestr(
            GetEnumDestructable()
        )
    end
    function Destructable.OrderTargetDestructable(self)
        return self:ByDestr(
            GetOrderTargetDestructable()
        )
    end
    function Destructable.SpellTargetDestructable(self)
        return self:ByDestr(
            GetSpellTargetDestructable()
        )
    end
    function Destructable.TriggerDestructable(self)
        return self:ByDestr(
            GetTriggerDestructable()
        )
    end
    function Destructable.EnumInRect(self, r, filter, actionFunc)
        EnumDestructablesInRect(
            r,
            filter,
            function() return actionFunc end
        )
    end
    function Destructable.prototype.Destroy(self)
        RemoveDestructable(self.destr)
    end
    function Destructable.prototype.Kill(self)
        KillDestructable(self.destr)
    end
    function Destructable.prototype.SetInvulnerable(self, flag)
        SetDestructableInvulnerable(self.destr, flag)
    end
    function Destructable.prototype.IsInvulnerable(self)
        return IsDestructableInvulnerable(self.destr)
    end
    function Destructable.prototype.TypeId(self)
        return GetDestructableTypeId(self.destr)
    end
    function Destructable.prototype.x(self)
        return GetDestructableX(self.destr)
    end
    function Destructable.prototype.y(self)
        return GetDestructableY(self.destr)
    end
    function Destructable.prototype.life(self)
        return GetDestructableLife(self.destr)
    end
    function Destructable.prototype.SetLife(self, life)
        SetDestructableLife(self.destr, life)
    end
    function Destructable.prototype.MaxLife(self)
        return GetDestructableMaxLife(self.destr)
    end
    function Destructable.prototype.SetMaxLife(self, max)
        SetDestructableMaxLife(self.destr, max)
    end
    function Destructable.prototype.RestoreLife(self, life, birth)
        DestructableRestoreLife(self.destr, life, birth)
    end
    function Destructable.prototype.SetAnimation(self, whichAnimation)
        SetDestructableAnimation(self.destr, whichAnimation)
    end
    function Destructable.prototype.QueueAnimation(self, whichAnimation)
        QueueDestructableAnimation(self.destr, whichAnimation)
    end
    function Destructable.prototype.SetAnimationSpeed(self, speedFactor)
        SetDestructableAnimationSpeed(self.destr, speedFactor)
    end
    function Destructable.prototype.Show(self, flag)
        ShowDestructable(self.destr, flag)
    end
    function Destructable.prototype.OccluderHeight(self)
        return GetDestructableOccluderHeight(self.destr)
    end
    function Destructable.prototype.SetOccluderHeight(self, height)
        SetDestructableOccluderHeight(self.destr, height)
    end
    function Destructable.prototype.GetName(self)
        return GetDestructableName(self.destr)
    end
    Destructable._byDestr = Map.new()
    return ____exports
    
end
__modules["app.src.lib.common.destructable"] = {initialized = false, cached = nil, loader = __module_25}
function __module_26()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____Maze = require("app.src.World.Antiblock.Maze")
    local Walkable = ____Maze.Walkable
    local settings = require("app.src.World.GlobalSettings")
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    local ____destructable = require("app.src.lib.common.destructable")
    local Destructable = ____destructable.Destructable
    ____exports.AntiJuggleTower = {}
    local AntiJuggleTower = ____exports.AntiJuggleTower
    AntiJuggleTower.name = "AntiJuggleTower"
    AntiJuggleTower.__index = AntiJuggleTower
    AntiJuggleTower.prototype = {}
    AntiJuggleTower.prototype.__index = AntiJuggleTower.prototype
    AntiJuggleTower.prototype.constructor = AntiJuggleTower
    function AntiJuggleTower.new(...)
        local self = setmetatable({}, AntiJuggleTower.prototype)
        self:____constructor(...)
        return self
    end
    function AntiJuggleTower.prototype.____constructor(self, game, tower)
        self.leftSide = 0
        self.rightSide = 0
        self.topSide = 0
        self.bottomSide = 0
        self.game = game
        self.x = GetUnitX(tower.tower)
        self.y = GetUnitY(tower.tower)
        RemoveUnit(tower.tower)
        self.destructable = Destructable:Create(
            FourCC("YTpc"),
            self.x,
            self.y,
            bj_UNIT_FACING,
            1,
            1
        )
        local playerSpawnId
        do
            local i = 0
            while i < #settings.PLAYER_AREAS do
                if settings.PLAYER_AREAS[i + 1]:ContainsDestructable(self.destructable) then
                    playerSpawnId = i
                    break
                end
                i = i + 1
            end
        end
        if playerSpawnId == nil then
            Log.Error("Unable to locate the correct player spawn")
            return
        end
        local maze = self.game.worldMap.playerMazes[playerSpawnId + 1]
        maze:AddAntiJuggler(self)
        self.leftSide = ((self.x - 64) - maze.minX) / 64
        self.rightSide = (self.x - maze.minX) / 64
        self.topSide = (self.y - maze.minY) / 64
        self.bottomSide = ((self.y - 64) - maze.minY) / 64
        maze:setWalkable(self.leftSide, self.bottomSide, Walkable.Protected)
        maze:setWalkable(self.rightSide, self.bottomSide, Walkable.Protected)
        maze:setWalkable(self.leftSide, self.topSide, Walkable.Protected)
        maze:setWalkable(self.rightSide, self.topSide, Walkable.Protected)
    end
    function AntiJuggleTower.prototype.EndOfRoundAction(self)
        self.destructable:Destroy()
    end
    return ____exports
    
end
__modules["app.src.World.Entity.AntiJuggle.AntiJuggleTower"] = {initialized = false, cached = nil, loader = __module_26}
function __module_27()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local settings = require("app.src.World.GlobalSettings")
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    local ____Rectangle = require("app.src.JassOverrides.Rectangle")
    local Rectangle = ____Rectangle.Rectangle
    local ____AntiJuggleTower = require("app.src.World.Entity.AntiJuggle.AntiJuggleTower")
    local AntiJuggleTower = ____AntiJuggleTower.AntiJuggleTower
    ____exports.Tower = {}
    local Tower = ____exports.Tower
    Tower.name = "Tower"
    Tower.__index = Tower
    Tower.prototype = {}
    Tower.prototype.____getters = {}
    Tower.prototype.__index = __TS__Index(Tower.prototype)
    Tower.prototype.____setters = {}
    Tower.prototype.__newindex = __TS__NewIndex(Tower.prototype)
    Tower.prototype.constructor = Tower
    function Tower.new(...)
        local self = setmetatable({}, Tower.prototype)
        self:____constructor(...)
        return self
    end
    function Tower.prototype.____constructor(self, tower, owner, game)
        self._leaverOwned = false
        self._game = game
        self._tower = tower
        self._UniqueID = GetHandleIdBJ(tower)
        self._owner = owner
        self._towerValue = GetUnitGoldCost(
            self:GetTypeID()
        )
        owner:AddTower(self)
    end
    function Tower.prototype.____getters.towerValue(self)
        return self._towerValue
    end
    function Tower.prototype.____getters.game(self)
        return self._game
    end
    function Tower.prototype.____getters.UniqueID(self)
        return self._UniqueID
    end
    function Tower.prototype.____getters.owner(self)
        return self._owner
    end
    function Tower.prototype.____getters.tower(self)
        return self._tower
    end
    function Tower.prototype.____getters.leaverOwned(self)
        return self._leaverOwned
    end
    function Tower.prototype.____setters.towerValue(self, value)
        self._towerValue = value
    end
    function Tower.prototype.____setters.leaverOwned(self, value)
        self._leaverOwned = value
    end
    function Tower.prototype.GetName(self)
        return GetUnitName(self.tower)
    end
    function Tower.prototype.GetTypeID(self)
        return GetUnitTypeId(self.tower)
    end
    function Tower.prototype.GetRectangle(self)
        local x = GetUnitX(self.tower)
        local y = GetUnitX(self.tower)
        return Rectangle.new({x - 64, y - 64, x + 64, y + 64})
    end
    function Tower.prototype.Upgrade(self, newTypeId)
        self:Sell()
        local u = ReplaceUnitBJ(self.tower, newTypeId, bj_UNIT_STATE_METHOD_DEFAULTS)
        local newTower = self.game.worldMap.towerConstruction:SetupTower(u, self.owner)
        newTower._towerValue = newTower._towerValue + self._towerValue
        return newTower
    end
    function Tower.prototype.IsEndOfRoundTower(self)
        return self.EndOfRoundAction ~= nil
    end
    function Tower.prototype.IsAttackActionTower(self)
        return self.AttackAction ~= nil
    end
    function Tower.prototype.IsInitialDamageModificationTower(self)
        return self.InitialDamageModification ~= nil
    end
    function Tower.prototype.IsGenericAutoAttackTower(self)
        return self.GenericAttack ~= nil
    end
    function Tower.prototype.IsKillingActionTower(self)
        return self.KillingAction ~= nil
    end
    function Tower.prototype.IsAreaEffectTower(self)
        return self.PassiveCreepDiesInAreaEffect ~= nil
    end
    function Tower.prototype.IsTowerForceTower(self)
        return self.UpdateSize ~= nil
    end
    function Tower.prototype.IsConstructActionTower(self)
        return self.ConstructionFinished ~= nil
    end
    function Tower.prototype.IsSellActionTower(self)
        return self.SellAction ~= nil
    end
    function Tower.prototype.IsLimitedTower(self)
        return self.MaxCount ~= nil
    end
    function Tower.prototype.IsTickingTower(self)
        return self.GetTickModulo ~= nil
    end
    function Tower.prototype.Sell(self)
        if self:IsEndOfRoundTower() and self.game.worldMap.gameRoundHandler then
            self.game.worldMap.gameTurn:RemoveEndOfRoundTower(self.UniqueID)
        end
        if self:IsAttackActionTower() then
            self.game.gameDamageEngine.initialDamageEventTowers:delete(self.UniqueID)
        end
        if self:IsTickingTower() then
            self.game.towerTicker:RemoveTickingTower(self.UniqueID)
        end
        if self:IsInitialDamageModificationTower() then
            self.game.gameDamageEngine.initialDamageModificationEventTowers:delete(self.UniqueID)
        end
        if self:IsGenericAutoAttackTower() then
            self.game.worldMap.towerConstruction.genericAttacks:delete(self.UniqueID)
        end
        if self:IsKillingActionTower() then
            self.game.worldMap.towerConstruction.killingActions:delete(self.UniqueID)
        end
        if self:IsSellActionTower() then
            self:SellAction()
        end
        if self:IsTowerForceTower() then
            if self.owner.towerForces:has(
                self:GetTypeID()
            ) then
                self.owner.towerForces:set(
                    self:GetTypeID(),
                    self.owner.towerForces:get(
                        self:GetTypeID()
                    ) - 1
                )
                for ____, towerx in ipairs(self.owner.towersArray) do
                    if towerx:IsTowerForceTower() and towerx.GetTypeID == self.GetTypeID then
                        towerx:UpdateSize()
                    end
                end
            end
        end
        if self:IsAreaEffectTower() then
            local area
            do
                local i = 0
                while i < #settings.PLAYER_AREAS do
                    if settings.PLAYER_AREAS[i + 1]:ContainsUnit(self.tower) then
                        area = i
                        break
                    end
                    i = i + 1
                end
            end
            if area then
                self.game.worldMap.playerSpawns[area + 1].areaTowers:delete(self.UniqueID)
            else
                Log.Fatal(
                    tostring(
                        GetUnitName(self.tower)
                    ) .. " built outside of requires area, unable to remove. Please screenshot and report"
                )
            end
        end
        self.owner:RemoveTower(self.UniqueID)
    end
    function Tower.prototype.CastSpellOnAttackedUnitLocation(self, spell)
        local x = GetUnitX(
            GetAttackedUnitBJ()
        )
        local y = GetUnitY(
            GetAttackedUnitBJ()
        )
        IssuePointOrder(
            GetAttacker(),
            spell,
            x,
            y
        )
    end
    function Tower.prototype.SetOwnership(self, newOwner)
        SetUnitOwner(self.tower, newOwner.wcPlayer, true)
        self:Sell()
        local newTower = self.game.worldMap.towerConstruction:SetupTower(self.tower, newOwner)
        newTower._towerValue = self._towerValue
        return newTower
    end
    function Tower.prototype.GetSellValue(self)
        return self.towerValue
    end
    function Tower.prototype.Remove(self)
        self:Sell()
        if self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.isWaveInProgress then
            local antijuggle = AntiJuggleTower.new(self._game, self)
        end
        RemoveUnit(self.tower)
    end
    function Tower.prototype.IsTargetTick(self, currentTick, modulo)
        if not self:IsTickingTower() then
            Log.Debug(
                tostring(
                    self:GetName()
                ) .. " is not a ticking tower"
            )
            return false
        end
        if self.targetTick == nil then
            self:SetTargetTick(currentTick, modulo)
            return false
        end
        if currentTick >= self.targetTick then
            self:SetTargetTick(currentTick, modulo)
            return true
        end
        return false
    end
    function Tower.prototype.SetTargetTick(self, currentTick, modulo)
        if not self:IsTickingTower() then
            Log.Debug(
                tostring(
                    self:GetName()
                ) .. " is not a ticking tower"
            )
            return
        end
        self.targetTick = (currentTick + self:GetTickModulo()) % modulo
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Specs.Tower"] = {initialized = false, cached = nil, loader = __module_27}
function __module_28()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    ____exports.HybridTierOne = {{id = "u00C", name = "[Forsaken] - Tombstone"}, {id = "h00Z", name = "[Dragons] - Dragonkin"}, {id = "h011", name = "[Goblins] - Pocket Factory"}, {id = "h03W", name = "[Demon] - Felguard"}, {id = "hC66", name = "[Humans] - Tower"}, {id = "hC21", name = "[Undead] - Ghast"}, {id = "o003", name = "[Outland] - Chaos Grunt"}, {id = "o009", name = "[High Elven] - Elven Swordsman"}, {id = "oC14", name = "[Giants] - Sasquatch"}, {id = "h01C", name = "[Tavern] - Centaur Outrunner"}, {id = "n009", name = "[Corrupt N.Elves] - Corrupted Moon Well"}, {id = "n03D", name = "[Forest Trolls] - Forest Troll"}, {id = "n055", name = "[Caerbannog] - French Soldier"}, {id = "n029", name = "[Gnolls] - Gnoll"}, {id = "n01Y", name = "[Critters] - Mazing Tower"}, {id = "n05H", name = "[Dwarves] - Undead Dwarf"}, {id = "h02H", name = "[Uniques] - Marine"}, {id = "h01Z", name = "[Summons] - Spirit Wolf"}, {id = "h03D", name = "[Draenei] - Draenei Hut"}, {id = "n02H", name = "[Corrupt N.Elves] - Roots"}, {id = "hC02", name = "[Orc Stronghold] - Grunt"}, {id = "hC11", name = "[Aviaries] - Hippogryph"}, {id = "e00J", name = "[Galaxy] - Star Shooter"}, {id = "h04K", name = "[Arachnid] - Basement Barrel"}, {id = "h02G", name = "[Void Cult] - Void Worshipper"}, {id = "h03E", name = "[Workers Union] - Orc Peon"}, {id = "e00E", name = "[Night Elves] - Wisp"}, {id = "h04T", name = "[Cavernous Creatures] - Cavern Mushroom"}, {id = "n00F", name = "[Ice Trolls] - Ice Troll"}}
    ____exports.HybridTierTwo = {{id = "u00D", name = "[Forsaken] - Necromancer"}, {id = "h010", name = "[Dragons] - Dragon Egg"}, {id = "o01M", name = "[Goblins] - Sappers"}, {id = "hC27", name = "[Undead] - Crypt Fiend"}, {id = "o004", name = "[Outland] - Nether Drake Hatchling"}, {id = "oC18", name = "[Aviaries] - Gargoyle"}, {id = "oC19", name = "[Orc Stronghold] - Headhunter"}, {id = "o00A", name = "[High Elven] - High Elf Archer"}, {id = "oC35", name = "[Giants] - Ogre Warrior"}, {id = "n00O", name = "[Corrupt N.Elves] - Corrupted Ent"}, {id = "n05I", name = "[Dwarven Mine] - Mortar Dwarves"}, {id = "h020", name = "[Summons] - Water Elemental"}, {id = "h04H", name = "[Draenei] - Salamander Hatchling"}, {id = "h03U", name = "[Demon] - Felhound"}, {id = "oC56", name = "[Undead] - Meat Wagon"}, {id = "h01E", name = "[Gnolls] - Gnoll Warden"}, {id = "n056", name = "[Caerbannog] - Cow Catapult (Sheep)"}, {id = "n00M", name = "[Corrupt N.Elves] - Den"}, {id = "n05J", name = "[Dwarven Mine] - Dwarven Hunter"}, {id = "n03E", name = "[Forest Trolls] - Forest Troll Beserker"}, {id = "n02B", name = "[Gnolls] - Gnoll Brute"}, {id = "n05K", name = "[Dwarven Mine] - Mountain Dwarf"}, {id = "n01T", name = "[Critters] - Stag"}, {id = "e00K", name = "[Galaxy] - Moon Dancer"}, {id = "n010", name = "[Corrupt N.Elves] - Corrupted Ancient of Lore"}, {id = "h03I", name = "[Workers Union] - Undead Acolyte"}, {id = "hC80", name = "[Night Elves] - Huntress"}, {id = "h04R", name = "[Cavernous Creatures] - Small Cavernous Growth"}, {id = "h041", name = "[Cavernous Creatures] - Cavern Frog"}, {id = "n00G", name = "[Ice Trolls] - Ice Troll Berserker"}}
    ____exports.HybridTierThree = {{id = "u00E", name = "[Forsaken] - Abomination"}, {id = "hC08", name = "[Humans] - Knight"}, {id = "h04F", name = "[Draenei] - Draenei Seer"}, {id = "hC53", name = "[Giants] - Rock Giant"}, {id = "hC36", name = "[Aviaries] - Gyrocopter"}, {id = "o005", name = "[Outland] - Chaos Warlock"}, {id = "oC73", name = "[Undead] - Obsidian Statue"}, {id = "n03F", name = "[Forest Trolls] - Forest Troll Trapper"}, {id = "n02C", name = "[Gnolls] - Gnoll Elite"}, {id = "n057", name = "[Caerbannog] - Witch Hunter (Peasant)"}, {id = "h02A", name = "[Uniques] - Orc Firebat"}, {id = "h022", name = "[Summons] - Spirit Bear"}, {id = "n01U", name = "[Critters] - Frog"}, {id = "e00L", name = "[Galaxy] - Druid"}, {id = "n00H", name = "[Ice Trolls] - Ice Troll Trapper"}}
    ____exports.HybridTierFour = {{id = "u00F", name = "[Forsaken] - Gargoyle Spire"}, {id = "o01R", name = "[Goblins] - Goblin Minelayer"}, {id = "o01N", name = "[Goblins] - Shredder"}, {id = "oC58", name = "[Orc Stronghold] - Barrelmaster"}, {id = "o00B", name = "[High Elven] - Elven Sorceress"}, {id = "h01D", name = "[Forest Trolls] - Forest Troll Shadow Priest"}, {id = "n00L", name = "[Corrupt N.Elves] - Corrupted Ancient Protector"}, {id = "n05L", name = "[Dwarven Mine] - Blacksmith"}, {id = "n03G", name = "[Forest Trolls] - Forest Troll Warlord"}, {id = "n058", name = "[Caerbannog] - The Knights Who Say Ni!"}, {id = "h005", name = "[Aviaries] - Gryphon Rider"}, {id = "h025", name = "[Summons] - Serpent Ward"}, {id = "hC54", name = "[Humans] - Siege Engine"}, {id = "h03X", name = "[Demon] - Succubus"}, {id = "h00Q", name = "Batrider"}, {id = "h00M", name = "[Aviaries] - Harpy"}, {id = "hC94", name = "[Undead] - Lich"}, {id = "o00R", name = "[Undead] - Boneyard"}, {id = "o007", name = "[Outland] - Fel Champion"}, {id = "o012", name = "[Shrine of Buffs] - Chaos Shrine"}, {id = "oC26", name = "[Giants] - Iron Golem Statue"}, {id = "o00X", name = "[Giants] - Ancient Golem"}, {id = "oC64", name = "[Orc Stronghold] - Tauren"}, {id = "hC34", name = "[Tavern] - Harpy Scout"}, {id = "n05M", name = "[Dwarven Mine] - Dwarven Warrior"}, {id = "n03H", name = "[Forest Trolls] - Forest Troll Shadow Priest"}, {id = "n059", name = "[Caerbannog] - Tim the Enchanter"}, {id = "h02J", name = "[Uniques] - Admiral Proudmoore"}, {id = "h026", name = "[Summons] - Lava Spawn"}, {id = "h02R", name = "[Draenei] - Draenei Demolisher"}, {id = "h006", name = "[Humans] - Phoenix Egg"}, {id = "e00O", name = "[Galaxy] - Night Star"}, {id = "n00U", name = "[Demon] - Summoning Shrine"}, {id = "h02F", name = "[Void Cult] - Void Priest"}, {id = "h03F", name = "[Workers Union] - Human Peasant"}, {id = "hC82", name = "[Night Elves] - Ancient Protector"}, {id = "hC86", name = "[Night Elves] - Chimaera Roost"}, {id = "h04M", name = "[Cavernous Creatures] - Cavern Hermit"}, {id = "o00C", name = "[High Elven] - High Elf Captain"}, {id = "n018", name = "[Ice Trolls] - Ice Troll Priest"}, {id = "n01W", name = "[Critters] - Penguin"}}
    ____exports.HybridTierFive = {{id = "u010", name = "[Forsaken] - Banshee"}, {id = "h03V", name = "[Demon] - Doom Guard"}, {id = "hC97", name = "[Giants] - Ogre Magi"}, {id = "h00R", name = "[Undead] - Sacrificial Pit"}, {id = "o006", name = "[Shrine of Buffs] - Chaos Kodo Beast"}, {id = "oC67", name = "[Giants] - Ogre Lord"}, {id = "oC60", name = "[Aviaries] - Wyvern"}, {id = "h01G", name = "[Tavern] - Razormane"}, {id = "n00N", name = "[Corrupt N.Elves] - Corrupted Ancient of War"}, {id = "n05B", name = "[Caerbannog] - Brother Maynard"}, {id = "n03I", name = "[Forest Trolls] - Forest Troll High Priest"}, {id = "n02D", name = "[Gnolls] - Gnoll Poacher"}, {id = "n05A", name = "[Caerbannog] - Killer Rabbit"}, {id = "h027", name = "[Summons] - Prawn"}, {id = "h04B", name = "[Humans] - Cold Tower"}, {id = "o00S", name = "[Orc Stronghold] - Tauren Chieftain"}, {id = "h04G", name = "[Draenei] - Draenei Spiritualist"}, {id = "e00P", name = "[Galaxy] - Star Chaser"}, {id = "o00Z", name = "[High Elven] - Ballista"}, {id = "h04N", name = "[Cavernous Creatures] - Cavern Turtle"}, {id = "n019", name = "[Ice Trolls] - Ice Troll High Priest"}}
    ____exports.HybridTierSix = {{id = "o01O", name = "[Goblins] - Alchemist"}, {id = "h02K", name = "[Uniques] - Butthole Monstrosity"}, {id = "o013", name = "[Shrine of Buffs] - Chaos Pool"}, {id = "oC68", name = "[Aviaries] - Chimera"}, {id = "o00Q", name = "[High Elven] - Spellbreaker"}, {id = "n00P", name = "[Corrupt N.Elves] - Corrupted Tree of Life"}, {id = "n05N", name = "[Dwarven Mine] - Flying Dwarf"}, {id = "n03J", name = "[Forest Trolls] - Forest Troll Joker"}, {id = "n01Z", name = "[Critters] - Pig"}, {id = "h00K", name = "[Humans] - Death Tower"}, {id = "h028", name = "[Summons] - Skeletal Mage"}, {id = "e00Q", name = "[Galaxy] - Space Runner"}, {id = "h03G", name = "[Workers Union] - Naga Slave"}, {id = "h00B", name = "[Night Elves] - Ancient of Wind"}, {id = "h04Q", name = "[Cavernous Creatures] - Cavern Druid"}, {id = "n01A", name = "[Ice Trolls] - Ice Troll Joker"}}
    ____exports.HybridTierSeven = {{id = "u011", name = "[Forsaken] - Destroyer"}, {id = "o01P", name = "[Goblins] - Goblin Blademaster"}, {id = "h02L", name = "[Uniques] - Hydralisk"}, {id = "o00D", name = "[High Elven] - Sylvanus Windrunner"}, {id = "h00F", name = "[Demon] - Demonized Dreadlord"}, {id = "h00N", name = "[Undead] - Infernal Fireblaster"}, {id = "o016", name = "[Outland] - Black Citadel WarMachine"}, {id = "oC74", name = "[Undead] - Dune Worm"}, {id = "o015", name = "[Giants] - Giant Revenant"}, {id = "o008", name = "[Shrine of Buffs] - Grom Hellscream"}, {id = "o00G", name = "[Giants] - Flesh Golem"}, {id = "o00U", name = "[Aviaries] - Phoenix"}, {id = "o00P", name = "[Orc Stronghold] - Rexxar"}, {id = "o00Y", name = "[Giants] - Sea Giant"}, {id = "h04I", name = "[Draenei] - Salamander Lord"}, {id = "n05O", name = "[Dwarven Mine] - Battle Golem"}, {id = "n02E", name = "[Gnolls] - Gnoll Assassin"}, {id = "n01X", name = "[Critters] - Lizard"}, {id = "n05C", name = "[Caerbannog] - Sir Galahad the Pure"}, {id = "h029", name = "[Summons] - Spirit Hawk"}, {id = "h04C", name = "[Humans] - Boulder Tower"}, {id = "n00S", name = "[Corrupt N.Elves] - Corrupted Warden"}, {id = "e00R", name = "[Galaxy] - Celestial Mist"}, {id = "h01M", name = "[Void Cult] - Void Fissure"}, {id = "h03H", name = "[Workers Union] - Night Elf Wisp"}, {id = "h00G", name = "[Night Elves] - Warden"}, {id = "h04O", name = "[Cavernous Creatures] - Cavern Revenant"}, {id = "n01B", name = "[Ice Trolls] - Ice Troll King"}}
    ____exports.HybridTierEight = {{id = "u012", name = "[Forsaken] - Varimathras"}, {id = "n020", name = "[Critters] - Snow Owl"}, {id = "h002", name = "[Orc Stronghold] - Rokhan"}, {id = "o01B", name = "[Outland] - Rend Blackhand"}, {id = "o00N", name = "[High Elven] - Kael"}, {id = "h01U", name = "[Tavern] - Fire Lord"}, {id = "n03L", name = "[Forest Trolls] - Forest Troll King"}, {id = "n02F", name = "[Gnolls] - Gnoll Warden"}, {id = "n05D", name = "[Caerbannog] - Shrubbery"}, {id = "h02B", name = "[Summons] - Treant"}, {id = "h04D", name = "[Humans] - Flame Tower"}, {id = "h00L", name = "[Humans] - Dalaran Guard Tower"}, {id = "o00L", name = "[Demon] - Mannoroth"}, {id = "h02Q", name = "[Uniques] - Iron Arthas"}, {id = "h02C", name = "[Summons] - Quilbeast"}, {id = "h00I", name = "[Draenei] - Akama"}, {id = "e00S", name = "[Galaxy] - Moonlight"}, {id = "h01A", name = "[Void Cult] - Void Corrupter"}, {id = "e008", name = "[Night Elves] - Illidan"}}
    ____exports.HybridTierNine = {{id = "u013", name = "[Forsaken] - Sylvanas Windrunner"}, {id = "u01C", name = "[Outland] - Magtheridon"}, {id = "o01S", name = "[Goblins] - Tinker"}, {id = "oC65", name = "[Orc Stronghold] - Warchief Thrall"}, {id = "n03B", name = "[Cavernous Creatures] - Spirit Hydra"}, {id = "n021", name = "[Critters] - Black Sheep"}, {id = "h000", name = "[Undead] - Antonidas the Undead"}, {id = "eC93", name = "[Demon] - Kil\'jaeden"}, {id = "n00R", name = "[Corrupt N.Elves] - Corrupted Shandris"}, {id = "n05Q", name = "[Dwarven Mine] - Dwarf King (Statue)"}, {id = "n03K", name = "[Forest Trolls] - Forest Troll Emperor"}, {id = "n05F", name = "[Caerbannog] - Sir Lancelot the Brave"}, {id = "n02R", name = "Dragon Turtle"}, {id = "n05E", name = "[Caerbannog] - The Black Beast of Arrrghhh"}, {id = "n02G", name = "[Gnolls] - Gnoll Leader"}, {id = "h02D", name = "[Summons] - Avatar of Vengeance"}, {id = "h02V", name = "[Humans] - Earth-Fury"}, {id = "e00T", name = "[Galaxy] - The Creator"}, {id = "o001", name = "[Giants] - Giant King"}, {id = "n01C", name = "[Ice Trolls] - Ice Troll Emperor"}}
    return ____exports
    
end
__modules["app.src.Generated.hybridRandomGEN"] = {initialized = false, cached = nil, loader = __module_28}
function __module_29()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____hybridRandomGEN = require("app.src.Generated.hybridRandomGEN")
    local HybridTierEight = ____hybridRandomGEN.HybridTierEight
    local HybridTierFive = ____hybridRandomGEN.HybridTierFive
    local HybridTierFour = ____hybridRandomGEN.HybridTierFour
    local HybridTierNine = ____hybridRandomGEN.HybridTierNine
    local HybridTierOne = ____hybridRandomGEN.HybridTierOne
    local HybridTierSeven = ____hybridRandomGEN.HybridTierSeven
    local HybridTierSix = ____hybridRandomGEN.HybridTierSix
    local HybridTierThree = ____hybridRandomGEN.HybridTierThree
    local HybridTierTwo = ____hybridRandomGEN.HybridTierTwo
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    ____exports.LootBoxerHandler = {}
    local LootBoxerHandler = ____exports.LootBoxerHandler
    LootBoxerHandler.name = "LootBoxerHandler"
    LootBoxerHandler.__index = LootBoxerHandler
    LootBoxerHandler.prototype = {}
    LootBoxerHandler.prototype.__index = LootBoxerHandler.prototype
    LootBoxerHandler.prototype.constructor = LootBoxerHandler
    function LootBoxerHandler.new(...)
        local self = setmetatable({}, LootBoxerHandler.prototype)
        self:____constructor(...)
        return self
    end
    function LootBoxerHandler.prototype.____constructor(self, constuction, game)
        self.constuction = constuction
        self.game = game
        self.abilityUpgradeTrigger = Trigger.new()
        self.abilityUpgradeTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_CAST)
        self.abilityUpgradeTrigger:AddCondition(
            function() return self:IsUpgradeAbility() end
        )
        self.abilityUpgradeTrigger:AddAction(
            function() return self:UpgradeToTower() end
        )
    end
    function LootBoxerHandler.prototype.GetId(self, tier)
        local newId
        local ____switch5 = tier + 1
        if ____switch5 == 1 then
            goto ____switch5_case_0
        end
        if ____switch5 == 2 then
            goto ____switch5_case_1
        end
        if ____switch5 == 3 then
            goto ____switch5_case_2
        end
        if ____switch5 == 4 then
            goto ____switch5_case_3
        end
        if ____switch5 == 5 then
            goto ____switch5_case_4
        end
        if ____switch5 == 6 then
            goto ____switch5_case_5
        end
        if ____switch5 == 7 then
            goto ____switch5_case_6
        end
        if ____switch5 == 8 then
            goto ____switch5_case_7
        end
        if ____switch5 == 9 then
            goto ____switch5_case_8
        end
        goto ____switch5_case_default
        ::____switch5_case_0::
        do
            newId = FourCC(
                HybridTierOne[Util:RandomInt(0, #HybridTierOne - 1) + 1].id
            )
            goto ____switch5_end
        end
        ::____switch5_case_1::
        do
            newId = FourCC(
                HybridTierTwo[Util:RandomInt(0, #HybridTierTwo - 1) + 1].id
            )
            goto ____switch5_end
        end
        ::____switch5_case_2::
        do
            newId = FourCC(
                HybridTierThree[Util:RandomInt(0, #HybridTierThree - 1) + 1].id
            )
            goto ____switch5_end
        end
        ::____switch5_case_3::
        do
            newId = FourCC(
                HybridTierFour[Util:RandomInt(0, #HybridTierFour - 1) + 1].id
            )
            goto ____switch5_end
        end
        ::____switch5_case_4::
        do
            newId = FourCC(
                HybridTierFive[Util:RandomInt(0, #HybridTierFive - 1) + 1].id
            )
            goto ____switch5_end
        end
        ::____switch5_case_5::
        do
            newId = FourCC(
                HybridTierSix[Util:RandomInt(0, #HybridTierSix - 1) + 1].id
            )
            goto ____switch5_end
        end
        ::____switch5_case_6::
        do
            newId = FourCC(
                HybridTierSeven[Util:RandomInt(0, #HybridTierSeven - 1) + 1].id
            )
            goto ____switch5_end
        end
        ::____switch5_case_7::
        do
            newId = FourCC(
                HybridTierEight[Util:RandomInt(0, #HybridTierEight - 1) + 1].id
            )
            goto ____switch5_end
        end
        ::____switch5_case_8::
        do
            newId = FourCC(
                HybridTierNine[Util:RandomInt(0, #HybridTierNine - 1) + 1].id
            )
            goto ____switch5_end
        end
        ::____switch5_case_default::
        do
            Log.Fatal("failed to get loot boxer tier")
            newId = FourCC(
                HybridTierOne[Util:RandomInt(0, #HybridTierOne - 1) + 1].id
            )
            goto ____switch5_end
        end
        ::____switch5_end::
        return newId
    end
    function LootBoxerHandler.prototype.handleLootBoxTower(self, tower, owner, tier)
        local newId
        local lootBoxer = owner:getLootBoxer()
        if not lootBoxer then
            return tower
        end
        if tier >= 3 then
            SetUnitAbilityLevelSwapped(
                FourCC("A0EX"),
                tower,
                tier + 1
            )
            return tower
        end
        newId = self:GetId(tier)
        self:AddItemToLootBoxer(tier, lootBoxer)
        tower = ReplaceUnitBJ(
            GetConstructedStructure(),
            newId,
            bj_UNIT_STATE_METHOD_DEFAULTS
        )
        return tower
    end
    function LootBoxerHandler.prototype.AddItemToLootBoxer(self, tier, lootBoxer)
        local randomInt = Util:RandomInt(1, 100)
        if tier < 3 then
            if randomInt <= 100 - (5 * (tier + 1)) then
                UnitAddItemByIdSwapped(
                    FourCC("I02F"),
                    lootBoxer
                )
            elseif randomInt <= 100 - 2 * (tier + 1) then
                UnitAddItemByIdSwapped(
                    FourCC("I029"),
                    lootBoxer
                )
            else
                UnitAddItemByIdSwapped(
                    FourCC("I02B"),
                    lootBoxer
                )
            end
        else
            local ____switch15 = tier + 1
            if ____switch15 == 4 then
                goto ____switch15_case_0
            end
            if ____switch15 == 5 then
                goto ____switch15_case_1
            end
            if ____switch15 == 6 then
                goto ____switch15_case_2
            end
            if ____switch15 == 7 then
                goto ____switch15_case_3
            end
            if ____switch15 == 8 then
                goto ____switch15_case_4
            end
            if ____switch15 == 9 then
                goto ____switch15_case_5
            end
            goto ____switch15_case_default
            ::____switch15_case_0::
            ::____switch15_case_1::
            do
                if randomInt <= 100 - 20 + 10 * (tier - 4 + 1) then
                    UnitAddItemByIdSwapped(
                        FourCC("I02F"),
                        lootBoxer
                    )
                    SetItemCharges(
                        GetLastCreatedItem(),
                        GetRandomInt(1, tier)
                    )
                elseif randomInt <= 100 - 10 + 5 * (tier - 4 + 1) then
                    UnitAddItemByIdSwapped(
                        FourCC("I029"),
                        lootBoxer
                    )
                elseif randomInt <= 100 - 2 * (tier - 3 + 1) then
                    UnitAddItemByIdSwapped(
                        FourCC("I02B"),
                        lootBoxer
                    )
                else
                    UnitAddItemByIdSwapped(
                        FourCC("I028"),
                        lootBoxer
                    )
                end
                goto ____switch15_end
            end
            ::____switch15_case_2::
            do
                if randomInt <= 100 - 20 + 10 * (tier - 4 + 1) then
                    UnitAddItemByIdSwapped(
                        FourCC("I02F"),
                        lootBoxer
                    )
                    SetItemCharges(
                        GetLastCreatedItem(),
                        GetRandomInt(1, tier)
                    )
                elseif randomInt <= 100 - 10 + 5 * (tier - 4 + 1) then
                    UnitAddItemByIdSwapped(
                        FourCC("I02B"),
                        lootBoxer
                    )
                elseif randomInt <= 100 - 2 * (tier - 3 + 1) then
                    UnitAddItemByIdSwapped(
                        FourCC("I028"),
                        lootBoxer
                    )
                else
                    UnitAddItemByIdSwapped(
                        FourCC("I02A"),
                        lootBoxer
                    )
                end
                goto ____switch15_end
            end
            ::____switch15_case_3::
            do
                self:GetRandomItem(tier, randomInt, lootBoxer, "I028", 70, "I02B", 85, "I02A", 95, "I02C")
                goto ____switch15_end
            end
            ::____switch15_case_4::
            do
                self:GetRandomItem(tier, randomInt, lootBoxer, "I028", 65, "I02A", 80, "I02B", 92, "I02C")
                goto ____switch15_end
            end
            ::____switch15_case_5::
            do
                self:GetRandomItem(tier, randomInt, lootBoxer, "I028", 60, "I02A", 80, "I02B", 90, "I02C")
                goto ____switch15_end
            end
            ::____switch15_case_default::
            do
                Log.Fatal("failed to get loot boxer item tier")
                self:AddItemToLootBoxer(1, lootBoxer)
                goto ____switch15_end
            end
            ::____switch15_end::
        end
    end
    function LootBoxerHandler.prototype.GetRandomItem(self, tier, randomInt, lootBoxer, itemOne, chanceOne, itemTwo, chanceTwo, itemThree, chanceThree, defaultItem)
        if randomInt <= 100 - 20 + 10 * (tier - 4 + 1) then
            UnitAddItemByIdSwapped(
                FourCC("I02F"),
                lootBoxer
            )
            SetItemCharges(
                GetLastCreatedItem(),
                GetRandomInt(1 + (tier - 5), tier)
            )
        elseif randomInt <= chanceOne then
            UnitAddItemByIdSwapped(
                FourCC(itemOne),
                lootBoxer
            )
        elseif randomInt <= chanceTwo then
            UnitAddItemByIdSwapped(
                FourCC(itemTwo),
                lootBoxer
            )
        elseif randomInt <= chanceThree then
            UnitAddItemByIdSwapped(
                FourCC(itemThree),
                lootBoxer
            )
        else
            UnitAddItemByIdSwapped(
                FourCC(defaultItem),
                lootBoxer
            )
        end
    end
    function LootBoxerHandler.prototype.IsUpgradeAbility(self)
        return GetSpellAbilityId() == FourCC("A0EX")
    end
    function LootBoxerHandler.prototype.UpgradeToTower(self)
        local tower = GetSpellAbilityUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(tower)
            )
        )
        if not owner then
            return
        end
        local instance = owner:GetTower(
            GetHandleIdBJ(tower)
        )
        if instance then
            instance:Sell()
        end
        tower = ReplaceUnitBJ(
            tower,
            self:GetId(
                __TS__ArrayIndexOf(
                    self.constuction.lootBoxerTowers,
                    GetUnitTypeId(tower)
                )
            ),
            bj_UNIT_STATE_METHOD_DEFAULTS
        )
        local lootBoxer = owner:getLootBoxer()
        if lootBoxer then
            self:AddItemToLootBoxer(
                __TS__ArrayIndexOf(
                    self.constuction.lootBoxerTowers,
                    GetUnitTypeId(tower)
                ),
                lootBoxer
            )
        end
        self.constuction:SetupTower(tower, owner)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.LootBoxer.LootBoxerHandler"] = {initialized = false, cached = nil, loader = __module_29}
function __module_30()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    ____exports.TowerMap = {}
    local TowerMap = ____exports.TowerMap
    TowerMap.name = "TowerMap"
    TowerMap.__index = TowerMap
    TowerMap.prototype = {}
    TowerMap.prototype.__index = TowerMap.prototype
    TowerMap.prototype.constructor = TowerMap
    TowerMap.____super = Map
    setmetatable(TowerMap, TowerMap.____super)
    setmetatable(TowerMap.prototype, TowerMap.____super.prototype)
    function TowerMap.new(...)
        local self = setmetatable({}, TowerMap.prototype)
        self:____constructor(...)
        return self
    end
    function TowerMap.prototype.____constructor(self, ...)
        Map.prototype.____constructor(self, ...)
        self.duplicateKeys = {}
        self._keyArray = {}
        self.add = function(____, key, value)
            if self:has(key) then
                __TS__ArrayPush(self.duplicateKeys, key)
                return self
            end
            __TS__ArrayPush(self._keyArray, key)
            return self:set(key, value)
        end
    end
    function TowerMap.prototype.GetArray(self)
        return self._keyArray
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Specs.TowerMap"] = {initialized = false, cached = nil, loader = __module_30}
function __module_31()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    ____exports.RaceTowers = {}
    local RaceTowers = ____exports.RaceTowers
    RaceTowers.name = "RaceTowers"
    RaceTowers.__index = RaceTowers
    RaceTowers.prototype = {}
    RaceTowers.prototype.__index = RaceTowers.prototype
    RaceTowers.prototype.constructor = RaceTowers
    function RaceTowers.new(...)
        local self = setmetatable({}, RaceTowers.prototype)
        self:____constructor(...)
        return self
    end
    function RaceTowers.prototype.____constructor(self)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.RaceTowers"] = {initialized = false, cached = nil, loader = __module_31}
function __module_32()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    local ____GlobalSettings = require("app.src.World.GlobalSettings")
    local AOB_ITEM_LOOT_LEVEL_ONE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_ONE
    ____exports.Adventurer = {}
    local Adventurer = ____exports.Adventurer
    Adventurer.name = "Adventurer"
    Adventurer.__index = Adventurer
    Adventurer.prototype = {}
    Adventurer.prototype.__index = __TS__Index(Adventurer.prototype)
    Adventurer.prototype.__newindex = __TS__NewIndex(Adventurer.prototype)
    Adventurer.prototype.constructor = Adventurer
    Adventurer.____super = Tower
    setmetatable(Adventurer, Adventurer.____super)
    setmetatable(Adventurer.prototype, Adventurer.____super.prototype)
    function Adventurer.new(...)
        local self = setmetatable({}, Adventurer.prototype)
        self:____constructor(...)
        return self
    end
    function Adventurer.prototype.KillingAction(self)
        local u = GetKillingUnitBJ()
        local target = GetDyingUnit()
        if u == self.tower and target then
            if UnitItemInSlotBJ(u, 1) == nil then
                local lootindx = Util:RandomInt(0, #AOB_ITEM_LOOT_LEVEL_ONE - 1)
                UnitAddItemById(u, AOB_ITEM_LOOT_LEVEL_ONE[lootindx + 1])
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.AllianceOfBlades.Adventurer"] = {initialized = false, cached = nil, loader = __module_32}
function __module_33()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    local ____GlobalSettings = require("app.src.World.GlobalSettings")
    local AOB_ITEM_LOOT_LEVEL_ONE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_ONE
    ____exports.Scavenger = {}
    local Scavenger = ____exports.Scavenger
    Scavenger.name = "Scavenger"
    Scavenger.__index = Scavenger
    Scavenger.prototype = {}
    Scavenger.prototype.__index = __TS__Index(Scavenger.prototype)
    Scavenger.prototype.__newindex = __TS__NewIndex(Scavenger.prototype)
    Scavenger.prototype.constructor = Scavenger
    Scavenger.____super = Tower
    setmetatable(Scavenger, Scavenger.____super)
    setmetatable(Scavenger.prototype, Scavenger.____super.prototype)
    function Scavenger.new(...)
        local self = setmetatable({}, Scavenger.prototype)
        self:____constructor(...)
        return self
    end
    function Scavenger.prototype.Scavenge(self)
        if UnitItemInSlot(self.tower, 0) == nil then
            local lootindx = Util:RandomInt(0, #AOB_ITEM_LOOT_LEVEL_ONE - 1)
            local i = CreateItem(
                AOB_ITEM_LOOT_LEVEL_ONE[lootindx + 1],
                GetUnitX(self.tower),
                GetUnitY(self.tower)
            )
            if not UnitAddItem(self.tower, i) then
                RemoveItem(i)
            end
        end
    end
    function Scavenger.prototype.Action(self)
        self:Scavenge()
    end
    function Scavenger.prototype.GetTickModulo(self)
        return 300
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.AllianceOfBlades.Scavenger"] = {initialized = false, cached = nil, loader = __module_33}
function __module_34()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____Adventurer = require("app.src.World.Entity.Tower.Races.AllianceOfBlades.Adventurer")
    local Adventurer = ____Adventurer.Adventurer
    local ____Scavenger = require("app.src.World.Entity.Tower.Races.AllianceOfBlades.Scavenger")
    local Scavenger = ____Scavenger.Scavenger
    ____exports.AllianceOfBladesTowers = {}
    local AllianceOfBladesTowers = ____exports.AllianceOfBladesTowers
    AllianceOfBladesTowers.name = "AllianceOfBladesTowers"
    AllianceOfBladesTowers.__index = AllianceOfBladesTowers
    AllianceOfBladesTowers.prototype = {}
    AllianceOfBladesTowers.prototype.__index = AllianceOfBladesTowers.prototype
    AllianceOfBladesTowers.prototype.constructor = AllianceOfBladesTowers
    AllianceOfBladesTowers.____super = RaceTowers
    setmetatable(AllianceOfBladesTowers, AllianceOfBladesTowers.____super)
    setmetatable(AllianceOfBladesTowers.prototype, AllianceOfBladesTowers.____super.prototype)
    function AllianceOfBladesTowers.new(...)
        local self = setmetatable({}, AllianceOfBladesTowers.prototype)
        self:____constructor(...)
        return self
    end
    function AllianceOfBladesTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("n02T"),
            Adventurer
        )
        list:add(
            FourCC("n02X"),
            Scavenger
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.AllianceOfBlades.AllianceOfBladesTowers"] = {initialized = false, cached = nil, loader = __module_34}
function __module_35()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.AcidSpittingSpider = {}
    local AcidSpittingSpider = ____exports.AcidSpittingSpider
    AcidSpittingSpider.name = "AcidSpittingSpider"
    AcidSpittingSpider.__index = AcidSpittingSpider
    AcidSpittingSpider.prototype = {}
    AcidSpittingSpider.prototype.__index = __TS__Index(AcidSpittingSpider.prototype)
    AcidSpittingSpider.prototype.__newindex = __TS__NewIndex(AcidSpittingSpider.prototype)
    AcidSpittingSpider.prototype.constructor = AcidSpittingSpider
    AcidSpittingSpider.____super = Tower
    setmetatable(AcidSpittingSpider, AcidSpittingSpider.____super)
    setmetatable(AcidSpittingSpider.prototype, AcidSpittingSpider.____super.prototype)
    function AcidSpittingSpider.new(...)
        local self = setmetatable({}, AcidSpittingSpider.prototype)
        self:____constructor(...)
        return self
    end
    function AcidSpittingSpider.prototype.AttackAction(self)
        if Util:RandomInt(1, 4) ~= 1 then
            return
        end
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(u),
                GetUnitY(u),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                20,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A073"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "acidbomb", target)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Arachnid.AcidSpittingSpider"] = {initialized = false, cached = nil, loader = __module_35}
function __module_36()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.NerubianBehemoth = {}
    local NerubianBehemoth = ____exports.NerubianBehemoth
    NerubianBehemoth.name = "NerubianBehemoth"
    NerubianBehemoth.__index = NerubianBehemoth
    NerubianBehemoth.prototype = {}
    NerubianBehemoth.prototype.__index = __TS__Index(NerubianBehemoth.prototype)
    NerubianBehemoth.prototype.__newindex = __TS__NewIndex(NerubianBehemoth.prototype)
    NerubianBehemoth.prototype.constructor = NerubianBehemoth
    NerubianBehemoth.____super = Tower
    setmetatable(NerubianBehemoth, NerubianBehemoth.____super)
    setmetatable(NerubianBehemoth.prototype, NerubianBehemoth.____super.prototype)
    function NerubianBehemoth.new(...)
        local self = setmetatable({}, NerubianBehemoth.prototype)
        self:____constructor(...)
        return self
    end
    function NerubianBehemoth.prototype.AttackAction(self)
        if Util:RandomInt(1, 4) ~= 1 then
            return
        end
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(u),
                GetUnitY(u),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                1,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A0AH"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "cripple", target)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Arachnid.NerubianBehemoth"] = {initialized = false, cached = nil, loader = __module_36}
function __module_37()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.ParasiticBroodmother = {}
    local ParasiticBroodmother = ____exports.ParasiticBroodmother
    ParasiticBroodmother.name = "ParasiticBroodmother"
    ParasiticBroodmother.__index = ParasiticBroodmother
    ParasiticBroodmother.prototype = {}
    ParasiticBroodmother.prototype.__index = __TS__Index(ParasiticBroodmother.prototype)
    ParasiticBroodmother.prototype.__newindex = __TS__NewIndex(ParasiticBroodmother.prototype)
    ParasiticBroodmother.prototype.constructor = ParasiticBroodmother
    ParasiticBroodmother.____super = Tower
    setmetatable(ParasiticBroodmother, ParasiticBroodmother.____super)
    setmetatable(ParasiticBroodmother.prototype, ParasiticBroodmother.____super.prototype)
    function ParasiticBroodmother.new(...)
        local self = setmetatable({}, ParasiticBroodmother.prototype)
        self:____constructor(...)
        return self
    end
    function ParasiticBroodmother.prototype.GenericAttack(self)
        IssueTargetOrderBJ(
            GetAttacker(),
            "parasite",
            GetAttackedUnitBJ()
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Arachnid.ParasiticBroodmother"] = {initialized = false, cached = nil, loader = __module_37}
function __module_38()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.CrackedBarrel = {}
    local CrackedBarrel = ____exports.CrackedBarrel
    CrackedBarrel.name = "CrackedBarrel"
    CrackedBarrel.__index = CrackedBarrel
    CrackedBarrel.prototype = {}
    CrackedBarrel.prototype.__index = __TS__Index(CrackedBarrel.prototype)
    CrackedBarrel.prototype.__newindex = __TS__NewIndex(CrackedBarrel.prototype)
    CrackedBarrel.prototype.constructor = CrackedBarrel
    CrackedBarrel.____super = Tower
    setmetatable(CrackedBarrel, CrackedBarrel.____super)
    setmetatable(CrackedBarrel.prototype, CrackedBarrel.____super.prototype)
    function CrackedBarrel.new(...)
        local self = setmetatable({}, CrackedBarrel.prototype)
        self:____constructor(...)
        return self
    end
    function CrackedBarrel.prototype.MaxCount(self)
        return 12
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Arachnid.CrackedBarrel"] = {initialized = false, cached = nil, loader = __module_38}
function __module_39()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____AcidSpittingSpider = require("app.src.World.Entity.Tower.Races.Arachnid.AcidSpittingSpider")
    local AcidSpittingSpider = ____AcidSpittingSpider.AcidSpittingSpider
    local ____NerubianBehemoth = require("app.src.World.Entity.Tower.Races.Arachnid.NerubianBehemoth")
    local NerubianBehemoth = ____NerubianBehemoth.NerubianBehemoth
    local ____ParasiticBroodmother = require("app.src.World.Entity.Tower.Races.Arachnid.ParasiticBroodmother")
    local ParasiticBroodmother = ____ParasiticBroodmother.ParasiticBroodmother
    local ____CrackedBarrel = require("app.src.World.Entity.Tower.Races.Arachnid.CrackedBarrel")
    local CrackedBarrel = ____CrackedBarrel.CrackedBarrel
    ____exports.ArachnidTowers = {}
    local ArachnidTowers = ____exports.ArachnidTowers
    ArachnidTowers.name = "ArachnidTowers"
    ArachnidTowers.__index = ArachnidTowers
    ArachnidTowers.prototype = {}
    ArachnidTowers.prototype.__index = ArachnidTowers.prototype
    ArachnidTowers.prototype.constructor = ArachnidTowers
    ArachnidTowers.____super = RaceTowers
    setmetatable(ArachnidTowers, ArachnidTowers.____super)
    setmetatable(ArachnidTowers.prototype, ArachnidTowers.____super.prototype)
    function ArachnidTowers.new(...)
        local self = setmetatable({}, ArachnidTowers.prototype)
        self:____constructor(...)
        return self
    end
    function ArachnidTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("o019"),
            AcidSpittingSpider
        )
        list:add(
            FourCC("h00W"),
            NerubianBehemoth
        )
        list:add(
            FourCC("o01A"),
            ParasiticBroodmother
        )
        list:add(
            FourCC("h03T"),
            CrackedBarrel
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Arachnid.ArachnidTowers"] = {initialized = false, cached = nil, loader = __module_39}
function __module_40()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Wyvern = {}
    local Wyvern = ____exports.Wyvern
    Wyvern.name = "Wyvern"
    Wyvern.__index = Wyvern
    Wyvern.prototype = {}
    Wyvern.prototype.__index = __TS__Index(Wyvern.prototype)
    Wyvern.prototype.__newindex = __TS__NewIndex(Wyvern.prototype)
    Wyvern.prototype.constructor = Wyvern
    Wyvern.____super = Tower
    setmetatable(Wyvern, Wyvern.____super)
    setmetatable(Wyvern.prototype, Wyvern.____super.prototype)
    function Wyvern.new(...)
        local self = setmetatable({}, Wyvern.prototype)
        self:____constructor(...)
        return self
    end
    function Wyvern.prototype.AttackAction(self)
        if self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.currentWave + 1 == 35 then
            return
        end
        if self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.currentWave + 1 == 36 then
            return
        end
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if u == self.tower then
            local loc = GetUnitLoc(self.tower)
            local grp = GetUnitsInRangeOfLocAll(128, loc)
            ForGroupBJ(
                grp,
                function() return self:AttackGroup() end
            )
            DestroyGroup(grp)
            RemoveLocation(loc)
        end
    end
    function Wyvern.prototype.AttackGroup(self)
        if GetPlayerId(
            GetOwningPlayer(
                GetEnumUnit()
            )
        ) > COLOUR.NAVY then
            SetUnitLifeBJ(
                GetEnumUnit(),
                RMaxBJ(
                    1,
                    GetUnitStateSwap(
                        UNIT_STATE_LIFE,
                        GetEnumUnit()
                    ) * 0.85
                )
            )
            DestroyEffect(
                AddSpecialEffectTargetUnitBJ(
                    "origin",
                    GetEnumUnit(),
                    "Abilities\\Spells\\Orc\\LightningShield\\LightningShieldTarget.mdl"
                )
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Aviaries.Wyvern"] = {initialized = false, cached = nil, loader = __module_40}
function __module_41()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Gyrocopter = {}
    local Gyrocopter = ____exports.Gyrocopter
    Gyrocopter.name = "Gyrocopter"
    Gyrocopter.__index = Gyrocopter
    Gyrocopter.prototype = {}
    Gyrocopter.prototype.__index = __TS__Index(Gyrocopter.prototype)
    Gyrocopter.prototype.__newindex = __TS__NewIndex(Gyrocopter.prototype)
    Gyrocopter.prototype.constructor = Gyrocopter
    Gyrocopter.____super = Tower
    setmetatable(Gyrocopter, Gyrocopter.____super)
    setmetatable(Gyrocopter.prototype, Gyrocopter.____super.prototype)
    function Gyrocopter.new(...)
        local self = setmetatable({}, Gyrocopter.prototype)
        self:____constructor(...)
        return self
    end
    function Gyrocopter.prototype.GenericAttack(self)
        IssueTargetOrderBJ(
            GetAttacker(),
            "chainlightning",
            GetAttackedUnitBJ()
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Aviaries.Gyrocopter"] = {initialized = false, cached = nil, loader = __module_41}
function __module_42()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____Wyvern = require("app.src.World.Entity.Tower.Races.Aviaries.Wyvern")
    local Wyvern = ____Wyvern.Wyvern
    local ____Gyrocopter = require("app.src.World.Entity.Tower.Races.Aviaries.Gyrocopter")
    local Gyrocopter = ____Gyrocopter.Gyrocopter
    ____exports.AviariesTowers = {}
    local AviariesTowers = ____exports.AviariesTowers
    AviariesTowers.name = "AviariesTowers"
    AviariesTowers.__index = AviariesTowers
    AviariesTowers.prototype = {}
    AviariesTowers.prototype.__index = AviariesTowers.prototype
    AviariesTowers.prototype.constructor = AviariesTowers
    AviariesTowers.____super = RaceTowers
    setmetatable(AviariesTowers, AviariesTowers.____super)
    setmetatable(AviariesTowers.prototype, AviariesTowers.____super.prototype)
    function AviariesTowers.new(...)
        local self = setmetatable({}, AviariesTowers.prototype)
        self:____constructor(...)
        return self
    end
    function AviariesTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("oC60"),
            Wyvern
        )
        list:add(
            FourCC("hC36"),
            Gyrocopter
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Aviaries.AviariesTowers"] = {initialized = false, cached = nil, loader = __module_42}
function __module_43()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.CavernDruid = {}
    local CavernDruid = ____exports.CavernDruid
    CavernDruid.name = "CavernDruid"
    CavernDruid.__index = CavernDruid
    CavernDruid.prototype = {}
    CavernDruid.prototype.__index = __TS__Index(CavernDruid.prototype)
    CavernDruid.prototype.__newindex = __TS__NewIndex(CavernDruid.prototype)
    CavernDruid.prototype.constructor = CavernDruid
    CavernDruid.____super = Tower
    setmetatable(CavernDruid, CavernDruid.____super)
    setmetatable(CavernDruid.prototype, CavernDruid.____super.prototype)
    function CavernDruid.new(...)
        local self = setmetatable({}, CavernDruid.prototype)
        self:____constructor(...)
        return self
    end
    function CavernDruid.prototype.InitialDamageModification(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if u == self.tower then
            do
                local ____obj, ____index = self.game.gameDamageEngineGlobals, "udg_DamageEventAmount"
                ____obj[____index] = ____obj[____index] + (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) * 25)
            end
            SetUnitManaBJ(self.tower, 0)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.CavernousCreatures.CavernDruid"] = {initialized = false, cached = nil, loader = __module_43}
function __module_44()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.CavernHermit = {}
    local CavernHermit = ____exports.CavernHermit
    CavernHermit.name = "CavernHermit"
    CavernHermit.__index = CavernHermit
    CavernHermit.prototype = {}
    CavernHermit.prototype.__index = __TS__Index(CavernHermit.prototype)
    CavernHermit.prototype.__newindex = __TS__NewIndex(CavernHermit.prototype)
    CavernHermit.prototype.constructor = CavernHermit
    CavernHermit.____super = Tower
    setmetatable(CavernHermit, CavernHermit.____super)
    setmetatable(CavernHermit.prototype, CavernHermit.____super.prototype)
    function CavernHermit.new(...)
        local self = setmetatable({}, CavernHermit.prototype)
        self:____constructor(...)
        return self
    end
    function CavernHermit.prototype.AttackAction(self)
        if not self.game.gameDamageEngineGlobals.udg_IsDamageSpell then
            return
        end
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            if Util:RandomInt(1, 3) ~= 1 then
                return
            end
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(u),
                GetUnitY(u),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                3,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A0CC"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "lightningshield", target)
        end
    end
    function CavernHermit.prototype.GenericAttack(self)
        self:CastSpellOnAttackedUnitLocation("carrionswarm")
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.CavernousCreatures.CavernHermit"] = {initialized = false, cached = nil, loader = __module_44}
function __module_45()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.CavernMushroom = {}
    local CavernMushroom = ____exports.CavernMushroom
    CavernMushroom.name = "CavernMushroom"
    CavernMushroom.__index = CavernMushroom
    CavernMushroom.prototype = {}
    CavernMushroom.prototype.__index = __TS__Index(CavernMushroom.prototype)
    CavernMushroom.prototype.__newindex = __TS__NewIndex(CavernMushroom.prototype)
    CavernMushroom.prototype.constructor = CavernMushroom
    CavernMushroom.____super = Tower
    setmetatable(CavernMushroom, CavernMushroom.____super)
    setmetatable(CavernMushroom.prototype, CavernMushroom.____super.prototype)
    function CavernMushroom.new(...)
        local self = setmetatable({}, CavernMushroom.prototype)
        self:____constructor(...)
        return self
    end
    function CavernMushroom.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "Locustswarm"
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.CavernousCreatures.CavernMushroom"] = {initialized = false, cached = nil, loader = __module_45}
function __module_46()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.CavernRevenant = {}
    local CavernRevenant = ____exports.CavernRevenant
    CavernRevenant.name = "CavernRevenant"
    CavernRevenant.__index = CavernRevenant
    CavernRevenant.prototype = {}
    CavernRevenant.prototype.__index = __TS__Index(CavernRevenant.prototype)
    CavernRevenant.prototype.__newindex = __TS__NewIndex(CavernRevenant.prototype)
    CavernRevenant.prototype.constructor = CavernRevenant
    CavernRevenant.____super = Tower
    setmetatable(CavernRevenant, CavernRevenant.____super)
    setmetatable(CavernRevenant.prototype, CavernRevenant.____super.prototype)
    function CavernRevenant.new(...)
        local self = setmetatable({}, CavernRevenant.prototype)
        self:____constructor(...)
        return self
    end
    function CavernRevenant.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            if not (self.game.gameDamageEngineGlobals.udg_DamageEventAOE == 1) then
                return
            end
            if not (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) >= 25) then
                return
            end
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("n00D"),
                GetUnitX(target),
                GetUnitY(target),
                bj_UNIT_FACING
            )
            SetUnitManaBJ(
                self.tower,
                (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) - 25)
            )
            UnitApplyTimedLifeBJ(
                60,
                FourCC("BTLF"),
                tempUnit
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.CavernousCreatures.CavernRevenant"] = {initialized = false, cached = nil, loader = __module_46}
function __module_47()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.CavernTurtle = {}
    local CavernTurtle = ____exports.CavernTurtle
    CavernTurtle.name = "CavernTurtle"
    CavernTurtle.__index = CavernTurtle
    CavernTurtle.prototype = {}
    CavernTurtle.prototype.__index = __TS__Index(CavernTurtle.prototype)
    CavernTurtle.prototype.__newindex = __TS__NewIndex(CavernTurtle.prototype)
    CavernTurtle.prototype.constructor = CavernTurtle
    CavernTurtle.____super = Tower
    setmetatable(CavernTurtle, CavernTurtle.____super)
    setmetatable(CavernTurtle.prototype, CavernTurtle.____super.prototype)
    function CavernTurtle.new(...)
        local self = setmetatable({}, CavernTurtle.prototype)
        self:____constructor(...)
        return self
    end
    function CavernTurtle.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            if not (self.game.gameDamageEngineGlobals.udg_DamageEventAOE == 1) then
                return
            end
            if not (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) >= 100) then
                return
            end
            SetUnitManaBJ(
                self.tower,
                (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) - 100)
            )
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(target),
                GetUnitY(target),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                3,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A0BY"),
                tempUnit
            )
            IssueImmediateOrderBJ(tempUnit, "fanofknives")
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.CavernousCreatures.CavernTurtle"] = {initialized = false, cached = nil, loader = __module_47}
function __module_48()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.GrowthLvl2 = {}
    local GrowthLvl2 = ____exports.GrowthLvl2
    GrowthLvl2.name = "GrowthLvl2"
    GrowthLvl2.__index = GrowthLvl2
    GrowthLvl2.prototype = {}
    GrowthLvl2.prototype.__index = __TS__Index(GrowthLvl2.prototype)
    GrowthLvl2.prototype.__newindex = __TS__NewIndex(GrowthLvl2.prototype)
    GrowthLvl2.prototype.constructor = GrowthLvl2
    GrowthLvl2.____super = Tower
    setmetatable(GrowthLvl2, GrowthLvl2.____super)
    setmetatable(GrowthLvl2.prototype, GrowthLvl2.____super.prototype)
    function GrowthLvl2.new(...)
        local self = setmetatable({}, GrowthLvl2.prototype)
        self:____constructor(...)
        return self
    end
    function GrowthLvl2.prototype.____constructor(self, tower, owner, game)
        Tower.prototype.____constructor(self, tower, owner, game)
        SetUnitAbilityLevelSwapped(
            FourCC("A0CG"),
            self.tower,
            2
        )
        SetUnitAbilityLevelSwapped(
            FourCC("S00A"),
            self.tower,
            2
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.CavernousCreatures.Growth.GrowthLvl2"] = {initialized = false, cached = nil, loader = __module_48}
function __module_49()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.GrowthLvl3 = {}
    local GrowthLvl3 = ____exports.GrowthLvl3
    GrowthLvl3.name = "GrowthLvl3"
    GrowthLvl3.__index = GrowthLvl3
    GrowthLvl3.prototype = {}
    GrowthLvl3.prototype.__index = __TS__Index(GrowthLvl3.prototype)
    GrowthLvl3.prototype.__newindex = __TS__NewIndex(GrowthLvl3.prototype)
    GrowthLvl3.prototype.constructor = GrowthLvl3
    GrowthLvl3.____super = Tower
    setmetatable(GrowthLvl3, GrowthLvl3.____super)
    setmetatable(GrowthLvl3.prototype, GrowthLvl3.____super.prototype)
    function GrowthLvl3.new(...)
        local self = setmetatable({}, GrowthLvl3.prototype)
        self:____constructor(...)
        return self
    end
    function GrowthLvl3.prototype.____constructor(self, tower, owner, game)
        Tower.prototype.____constructor(self, tower, owner, game)
        SetUnitAbilityLevelSwapped(
            FourCC("A0CG"),
            self.tower,
            3
        )
        SetUnitAbilityLevelSwapped(
            FourCC("S00A"),
            self.tower,
            3
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.CavernousCreatures.Growth.GrowthLvl3"] = {initialized = false, cached = nil, loader = __module_49}
function __module_50()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____CavernDruid = require("app.src.World.Entity.Tower.Races.CavernousCreatures.CavernDruid")
    local CavernDruid = ____CavernDruid.CavernDruid
    local ____CavernHermit = require("app.src.World.Entity.Tower.Races.CavernousCreatures.CavernHermit")
    local CavernHermit = ____CavernHermit.CavernHermit
    local ____CavernMushroom = require("app.src.World.Entity.Tower.Races.CavernousCreatures.CavernMushroom")
    local CavernMushroom = ____CavernMushroom.CavernMushroom
    local ____CavernRevenant = require("app.src.World.Entity.Tower.Races.CavernousCreatures.CavernRevenant")
    local CavernRevenant = ____CavernRevenant.CavernRevenant
    local ____CavernTurtle = require("app.src.World.Entity.Tower.Races.CavernousCreatures.CavernTurtle")
    local CavernTurtle = ____CavernTurtle.CavernTurtle
    local ____GrowthLvl2 = require("app.src.World.Entity.Tower.Races.CavernousCreatures.Growth.GrowthLvl2")
    local GrowthLvl2 = ____GrowthLvl2.GrowthLvl2
    local ____GrowthLvl3 = require("app.src.World.Entity.Tower.Races.CavernousCreatures.Growth.GrowthLvl3")
    local GrowthLvl3 = ____GrowthLvl3.GrowthLvl3
    ____exports.CavernousCreaturesTowers = {}
    local CavernousCreaturesTowers = ____exports.CavernousCreaturesTowers
    CavernousCreaturesTowers.name = "CavernousCreaturesTowers"
    CavernousCreaturesTowers.__index = CavernousCreaturesTowers
    CavernousCreaturesTowers.prototype = {}
    CavernousCreaturesTowers.prototype.__index = CavernousCreaturesTowers.prototype
    CavernousCreaturesTowers.prototype.constructor = CavernousCreaturesTowers
    CavernousCreaturesTowers.____super = RaceTowers
    setmetatable(CavernousCreaturesTowers, CavernousCreaturesTowers.____super)
    setmetatable(CavernousCreaturesTowers.prototype, CavernousCreaturesTowers.____super.prototype)
    function CavernousCreaturesTowers.new(...)
        local self = setmetatable({}, CavernousCreaturesTowers.prototype)
        self:____constructor(...)
        return self
    end
    function CavernousCreaturesTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("h04Q"),
            CavernDruid
        )
        list:add(
            FourCC("h04M"),
            CavernHermit
        )
        list:add(
            FourCC("h04T"),
            CavernMushroom
        )
        list:add(
            FourCC("h04O"),
            CavernRevenant
        )
        list:add(
            FourCC("h04N"),
            CavernTurtle
        )
        list:add(
            FourCC("h04S"),
            GrowthLvl2
        )
        list:add(
            FourCC("h04L"),
            GrowthLvl3
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.CavernousCreatures.CavernousCreaturesTowers"] = {initialized = false, cached = nil, loader = __module_50}
function __module_51()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.CorruptedTreeofLife = {}
    local CorruptedTreeofLife = ____exports.CorruptedTreeofLife
    CorruptedTreeofLife.name = "CorruptedTreeofLife"
    CorruptedTreeofLife.__index = CorruptedTreeofLife
    CorruptedTreeofLife.prototype = {}
    CorruptedTreeofLife.prototype.__index = __TS__Index(CorruptedTreeofLife.prototype)
    CorruptedTreeofLife.prototype.__newindex = __TS__NewIndex(CorruptedTreeofLife.prototype)
    CorruptedTreeofLife.prototype.constructor = CorruptedTreeofLife
    CorruptedTreeofLife.____super = Tower
    setmetatable(CorruptedTreeofLife, CorruptedTreeofLife.____super)
    setmetatable(CorruptedTreeofLife.prototype, CorruptedTreeofLife.____super.prototype)
    function CorruptedTreeofLife.new(...)
        local self = setmetatable({}, CorruptedTreeofLife.prototype)
        self:____constructor(...)
        return self
    end
    function CorruptedTreeofLife.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            if not (GetUnitAbilityLevelSwapped(
                FourCC("A091"),
                self.tower
            ) > 0) then
                return
            end
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(target),
                GetUnitY(target),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                1,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A090"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "chainlightning", target)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.CorruptedNightElves.CorruptedTreeofLife"] = {initialized = false, cached = nil, loader = __module_51}
function __module_52()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.CorruptedAncientProtector = {}
    local CorruptedAncientProtector = ____exports.CorruptedAncientProtector
    CorruptedAncientProtector.name = "CorruptedAncientProtector"
    CorruptedAncientProtector.__index = CorruptedAncientProtector
    CorruptedAncientProtector.prototype = {}
    CorruptedAncientProtector.prototype.__index = __TS__Index(CorruptedAncientProtector.prototype)
    CorruptedAncientProtector.prototype.__newindex = __TS__NewIndex(CorruptedAncientProtector.prototype)
    CorruptedAncientProtector.prototype.constructor = CorruptedAncientProtector
    CorruptedAncientProtector.____super = Tower
    setmetatable(CorruptedAncientProtector, CorruptedAncientProtector.____super)
    setmetatable(CorruptedAncientProtector.prototype, CorruptedAncientProtector.____super.prototype)
    function CorruptedAncientProtector.new(...)
        local self = setmetatable({}, CorruptedAncientProtector.prototype)
        self:____constructor(...)
        return self
    end
    function CorruptedAncientProtector.prototype.Action(self)
        if self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.isWaveInProgress then
            local y = GetUnitY(self.tower)
            local x = GetUnitX(self.tower)
            local dummy = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x,
                y,
                0
            )
            UnitApplyTimedLifeBJ(
                11,
                FourCC("BTLF"),
                dummy
            )
            UnitAddAbilityBJ(
                FourCC("A010"),
                dummy
            )
            IssueImmediateOrderBJ(dummy, "starfall")
        end
    end
    function CorruptedAncientProtector.prototype.GetTickModulo(self)
        return 300
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.CorruptedNightElves.CorruptedAncientProtector"] = {initialized = false, cached = nil, loader = __module_52}
function __module_53()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____CorruptedTreeofLife = require("app.src.World.Entity.Tower.Races.CorruptedNightElves.CorruptedTreeofLife")
    local CorruptedTreeofLife = ____CorruptedTreeofLife.CorruptedTreeofLife
    local ____CorruptedAncientProtector = require("app.src.World.Entity.Tower.Races.CorruptedNightElves.CorruptedAncientProtector")
    local CorruptedAncientProtector = ____CorruptedAncientProtector.CorruptedAncientProtector
    ____exports.CorruptedNightElfTowers = {}
    local CorruptedNightElfTowers = ____exports.CorruptedNightElfTowers
    CorruptedNightElfTowers.name = "CorruptedNightElfTowers"
    CorruptedNightElfTowers.__index = CorruptedNightElfTowers
    CorruptedNightElfTowers.prototype = {}
    CorruptedNightElfTowers.prototype.__index = CorruptedNightElfTowers.prototype
    CorruptedNightElfTowers.prototype.constructor = CorruptedNightElfTowers
    CorruptedNightElfTowers.____super = RaceTowers
    setmetatable(CorruptedNightElfTowers, CorruptedNightElfTowers.____super)
    setmetatable(CorruptedNightElfTowers.prototype, CorruptedNightElfTowers.____super.prototype)
    function CorruptedNightElfTowers.new(...)
        local self = setmetatable({}, CorruptedNightElfTowers.prototype)
        self:____constructor(...)
        return self
    end
    function CorruptedNightElfTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("n00P"),
            CorruptedTreeofLife
        )
        list:add(
            FourCC("n00L"),
            CorruptedAncientProtector
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.CorruptedNightElves.CorruptedNightElfTowers"] = {initialized = false, cached = nil, loader = __module_53}
function __module_54()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.FelGuard = {}
    local FelGuard = ____exports.FelGuard
    FelGuard.name = "FelGuard"
    FelGuard.__index = FelGuard
    FelGuard.prototype = {}
    FelGuard.prototype.__index = __TS__Index(FelGuard.prototype)
    FelGuard.prototype.__newindex = __TS__NewIndex(FelGuard.prototype)
    FelGuard.prototype.constructor = FelGuard
    FelGuard.____super = Tower
    setmetatable(FelGuard, FelGuard.____super)
    setmetatable(FelGuard.prototype, FelGuard.____super.prototype)
    function FelGuard.new(...)
        local self = setmetatable({}, FelGuard.prototype)
        self:____constructor(...)
        return self
    end
    function FelGuard.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if Util:RandomInt(1, 4) ~= 1 then
            return
        end
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                3,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A06W"),
                tempUnit
            )
            IssuePointOrder(
                tempUnit,
                "breathoffrost",
                GetUnitX(target),
                GetUnitY(target)
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Demon.FelGuard"] = {initialized = false, cached = nil, loader = __module_54}
function __module_55()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Mannoroth = {}
    local Mannoroth = ____exports.Mannoroth
    Mannoroth.name = "Mannoroth"
    Mannoroth.__index = Mannoroth
    Mannoroth.prototype = {}
    Mannoroth.prototype.__index = __TS__Index(Mannoroth.prototype)
    Mannoroth.prototype.__newindex = __TS__NewIndex(Mannoroth.prototype)
    Mannoroth.prototype.constructor = Mannoroth
    Mannoroth.____super = Tower
    setmetatable(Mannoroth, Mannoroth.____super)
    setmetatable(Mannoroth.prototype, Mannoroth.____super.prototype)
    function Mannoroth.new(...)
        local self = setmetatable({}, Mannoroth.prototype)
        self:____constructor(...)
        return self
    end
    function Mannoroth.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if Util:RandomInt(1, 3) ~= 1 then
            return
        end
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                3,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A06V"),
                tempUnit
            )
            IssueImmediateOrderBJ(tempUnit, "howlofterror")
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Demon.Mannoroth"] = {initialized = false, cached = nil, loader = __module_55}
function __module_56()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.SummoningShrine = {}
    local SummoningShrine = ____exports.SummoningShrine
    SummoningShrine.name = "SummoningShrine"
    SummoningShrine.__index = SummoningShrine
    SummoningShrine.prototype = {}
    SummoningShrine.prototype.__index = __TS__Index(SummoningShrine.prototype)
    SummoningShrine.prototype.__newindex = __TS__NewIndex(SummoningShrine.prototype)
    SummoningShrine.prototype.constructor = SummoningShrine
    SummoningShrine.____super = Tower
    setmetatable(SummoningShrine, SummoningShrine.____super)
    setmetatable(SummoningShrine.prototype, SummoningShrine.____super.prototype)
    function SummoningShrine.new(...)
        local self = setmetatable({}, SummoningShrine.prototype)
        self:____constructor(...)
        return self
    end
    function SummoningShrine.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(target),
                GetUnitY(target),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                3,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A06P"),
                tempUnit
            )
            IssuePointOrder(
                tempUnit,
                "dreadlordinferno",
                GetUnitX(target),
                GetUnitY(target)
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Demon.SummoningShrine"] = {initialized = false, cached = nil, loader = __module_56}
function __module_57()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.KilJaeden = {}
    local KilJaeden = ____exports.KilJaeden
    KilJaeden.name = "KilJaeden"
    KilJaeden.__index = KilJaeden
    KilJaeden.prototype = {}
    KilJaeden.prototype.__index = __TS__Index(KilJaeden.prototype)
    KilJaeden.prototype.__newindex = __TS__NewIndex(KilJaeden.prototype)
    KilJaeden.prototype.constructor = KilJaeden
    KilJaeden.____super = Tower
    setmetatable(KilJaeden, KilJaeden.____super)
    setmetatable(KilJaeden.prototype, KilJaeden.____super.prototype)
    function KilJaeden.new(...)
        local self = setmetatable({}, KilJaeden.prototype)
        self:____constructor(...)
        return self
    end
    function KilJaeden.prototype.GenericAttack(self)
        self:CastSpellOnAttackedUnitLocation("rainofchaos")
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Demon.KilJaeden"] = {initialized = false, cached = nil, loader = __module_57}
function __module_58()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.DemonizedDreadlord = {}
    local DemonizedDreadlord = ____exports.DemonizedDreadlord
    DemonizedDreadlord.name = "DemonizedDreadlord"
    DemonizedDreadlord.__index = DemonizedDreadlord
    DemonizedDreadlord.prototype = {}
    DemonizedDreadlord.prototype.__index = __TS__Index(DemonizedDreadlord.prototype)
    DemonizedDreadlord.prototype.__newindex = __TS__NewIndex(DemonizedDreadlord.prototype)
    DemonizedDreadlord.prototype.constructor = DemonizedDreadlord
    DemonizedDreadlord.____super = Tower
    setmetatable(DemonizedDreadlord, DemonizedDreadlord.____super)
    setmetatable(DemonizedDreadlord.prototype, DemonizedDreadlord.____super.prototype)
    function DemonizedDreadlord.new(...)
        local self = setmetatable({}, DemonizedDreadlord.prototype)
        self:____constructor(...)
        return self
    end
    function DemonizedDreadlord.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "berserk"
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Demon.DemonizedDreadlord"] = {initialized = false, cached = nil, loader = __module_58}
function __module_59()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____FelGuard = require("app.src.World.Entity.Tower.Races.Demon.FelGuard")
    local FelGuard = ____FelGuard.FelGuard
    local ____Mannoroth = require("app.src.World.Entity.Tower.Races.Demon.Mannoroth")
    local Mannoroth = ____Mannoroth.Mannoroth
    local ____SummoningShrine = require("app.src.World.Entity.Tower.Races.Demon.SummoningShrine")
    local SummoningShrine = ____SummoningShrine.SummoningShrine
    local ____KilJaeden = require("app.src.World.Entity.Tower.Races.Demon.KilJaeden")
    local KilJaeden = ____KilJaeden.KilJaeden
    local ____DemonizedDreadlord = require("app.src.World.Entity.Tower.Races.Demon.DemonizedDreadlord")
    local DemonizedDreadlord = ____DemonizedDreadlord.DemonizedDreadlord
    ____exports.DemonTowers = {}
    local DemonTowers = ____exports.DemonTowers
    DemonTowers.name = "DemonTowers"
    DemonTowers.__index = DemonTowers
    DemonTowers.prototype = {}
    DemonTowers.prototype.__index = DemonTowers.prototype
    DemonTowers.prototype.constructor = DemonTowers
    DemonTowers.____super = RaceTowers
    setmetatable(DemonTowers, DemonTowers.____super)
    setmetatable(DemonTowers.prototype, DemonTowers.____super.prototype)
    function DemonTowers.new(...)
        local self = setmetatable({}, DemonTowers.prototype)
        self:____constructor(...)
        return self
    end
    function DemonTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("h03W"),
            FelGuard
        )
        list:add(
            FourCC("o00L"),
            Mannoroth
        )
        list:add(
            FourCC("n00U"),
            SummoningShrine
        )
        list:add(
            FourCC("eC93"),
            KilJaeden
        )
        list:add(
            FourCC("h00F"),
            DemonizedDreadlord
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Demon.DemonTowers"] = {initialized = false, cached = nil, loader = __module_59}
function __module_60()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.DraeneiSeer = {}
    local DraeneiSeer = ____exports.DraeneiSeer
    DraeneiSeer.name = "DraeneiSeer"
    DraeneiSeer.__index = DraeneiSeer
    DraeneiSeer.prototype = {}
    DraeneiSeer.prototype.__index = __TS__Index(DraeneiSeer.prototype)
    DraeneiSeer.prototype.__newindex = __TS__NewIndex(DraeneiSeer.prototype)
    DraeneiSeer.prototype.constructor = DraeneiSeer
    DraeneiSeer.____super = Tower
    setmetatable(DraeneiSeer, DraeneiSeer.____super)
    setmetatable(DraeneiSeer.prototype, DraeneiSeer.____super.prototype)
    function DraeneiSeer.new(...)
        local self = setmetatable({}, DraeneiSeer.prototype)
        self:____constructor(...)
        return self
    end
    function DraeneiSeer.prototype.GenericAttack(self)
        IssueTargetOrderBJ(
            GetAttacker(),
            "lightningshield",
            GetAttackedUnitBJ()
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Draenei.DraeneiSeer"] = {initialized = false, cached = nil, loader = __module_60}
function __module_61()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Akama = {}
    local Akama = ____exports.Akama
    Akama.name = "Akama"
    Akama.__index = Akama
    Akama.prototype = {}
    Akama.prototype.__index = __TS__Index(Akama.prototype)
    Akama.prototype.__newindex = __TS__NewIndex(Akama.prototype)
    Akama.prototype.constructor = Akama
    Akama.____super = Tower
    setmetatable(Akama, Akama.____super)
    setmetatable(Akama.prototype, Akama.____super.prototype)
    function Akama.new(...)
        local self = setmetatable({}, Akama.prototype)
        self:____constructor(...)
        return self
    end
    function Akama.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "spiritwolf"
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Draenei.Akama"] = {initialized = false, cached = nil, loader = __module_61}
function __module_62()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.SalamanderLord = {}
    local SalamanderLord = ____exports.SalamanderLord
    SalamanderLord.name = "SalamanderLord"
    SalamanderLord.__index = SalamanderLord
    SalamanderLord.prototype = {}
    SalamanderLord.prototype.__index = __TS__Index(SalamanderLord.prototype)
    SalamanderLord.prototype.__newindex = __TS__NewIndex(SalamanderLord.prototype)
    SalamanderLord.prototype.constructor = SalamanderLord
    SalamanderLord.____super = Tower
    setmetatable(SalamanderLord, SalamanderLord.____super)
    setmetatable(SalamanderLord.prototype, SalamanderLord.____super.prototype)
    function SalamanderLord.new(...)
        local self = setmetatable({}, SalamanderLord.prototype)
        self:____constructor(...)
        return self
    end
    function SalamanderLord.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "stomp"
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Draenei.SalamanderLord"] = {initialized = false, cached = nil, loader = __module_62}
function __module_63()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____DraeneiSeer = require("app.src.World.Entity.Tower.Races.Draenei.DraeneiSeer")
    local DraeneiSeer = ____DraeneiSeer.DraeneiSeer
    local ____Akama = require("app.src.World.Entity.Tower.Races.Draenei.Akama")
    local Akama = ____Akama.Akama
    local ____SalamanderLord = require("app.src.World.Entity.Tower.Races.Draenei.SalamanderLord")
    local SalamanderLord = ____SalamanderLord.SalamanderLord
    ____exports.DraeneiTowers = {}
    local DraeneiTowers = ____exports.DraeneiTowers
    DraeneiTowers.name = "DraeneiTowers"
    DraeneiTowers.__index = DraeneiTowers
    DraeneiTowers.prototype = {}
    DraeneiTowers.prototype.__index = DraeneiTowers.prototype
    DraeneiTowers.prototype.constructor = DraeneiTowers
    DraeneiTowers.____super = RaceTowers
    setmetatable(DraeneiTowers, DraeneiTowers.____super)
    setmetatable(DraeneiTowers.prototype, DraeneiTowers.____super.prototype)
    function DraeneiTowers.new(...)
        local self = setmetatable({}, DraeneiTowers.prototype)
        self:____constructor(...)
        return self
    end
    function DraeneiTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("h04F"),
            DraeneiSeer
        )
        list:add(
            FourCC("h00I"),
            Akama
        )
        list:add(
            FourCC("h04I"),
            SalamanderLord
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Draenei.DraeneiTowers"] = {initialized = false, cached = nil, loader = __module_63}
function __module_64()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.DwarfKing = {}
    local DwarfKing = ____exports.DwarfKing
    DwarfKing.name = "DwarfKing"
    DwarfKing.__index = DwarfKing
    DwarfKing.prototype = {}
    DwarfKing.prototype.__index = __TS__Index(DwarfKing.prototype)
    DwarfKing.prototype.__newindex = __TS__NewIndex(DwarfKing.prototype)
    DwarfKing.prototype.constructor = DwarfKing
    DwarfKing.____super = Tower
    setmetatable(DwarfKing, DwarfKing.____super)
    setmetatable(DwarfKing.prototype, DwarfKing.____super.prototype)
    function DwarfKing.new(...)
        local self = setmetatable({}, DwarfKing.prototype)
        self:____constructor(...)
        return self
    end
    function DwarfKing.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if Util:RandomInt(1, 100) >= 3 then
            return
        end
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                3,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A0AT"),
                tempUnit
            )
            IssuePointOrder(
                tempUnit,
                "shockwave",
                GetUnitX(target),
                GetUnitY(target)
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Dwaven.DwarfKing"] = {initialized = false, cached = nil, loader = __module_64}
function __module_65()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.FlyingDwarf = {}
    local FlyingDwarf = ____exports.FlyingDwarf
    FlyingDwarf.name = "FlyingDwarf"
    FlyingDwarf.__index = FlyingDwarf
    FlyingDwarf.prototype = {}
    FlyingDwarf.prototype.__index = __TS__Index(FlyingDwarf.prototype)
    FlyingDwarf.prototype.__newindex = __TS__NewIndex(FlyingDwarf.prototype)
    FlyingDwarf.prototype.constructor = FlyingDwarf
    FlyingDwarf.____super = Tower
    setmetatable(FlyingDwarf, FlyingDwarf.____super)
    setmetatable(FlyingDwarf.prototype, FlyingDwarf.____super.prototype)
    function FlyingDwarf.new(...)
        local self = setmetatable({}, FlyingDwarf.prototype)
        self:____constructor(...)
        return self
    end
    function FlyingDwarf.prototype.GenericAttack(self)
        self:CastSpellOnAttackedUnitLocation("clusterrockets")
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Dwaven.FlyingDwarf"] = {initialized = false, cached = nil, loader = __module_65}
function __module_66()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____DwarfKing = require("app.src.World.Entity.Tower.Races.Dwaven.DwarfKing")
    local DwarfKing = ____DwarfKing.DwarfKing
    local ____FlyingDwarf = require("app.src.World.Entity.Tower.Races.Dwaven.FlyingDwarf")
    local FlyingDwarf = ____FlyingDwarf.FlyingDwarf
    ____exports.DwarfTowers = {}
    local DwarfTowers = ____exports.DwarfTowers
    DwarfTowers.name = "DwarfTowers"
    DwarfTowers.__index = DwarfTowers
    DwarfTowers.prototype = {}
    DwarfTowers.prototype.__index = DwarfTowers.prototype
    DwarfTowers.prototype.constructor = DwarfTowers
    DwarfTowers.____super = RaceTowers
    setmetatable(DwarfTowers, DwarfTowers.____super)
    setmetatable(DwarfTowers.prototype, DwarfTowers.____super.prototype)
    function DwarfTowers.new(...)
        local self = setmetatable({}, DwarfTowers.prototype)
        self:____constructor(...)
        return self
    end
    function DwarfTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("n05Q"),
            DwarfKing
        )
        list:add(
            FourCC("n05N"),
            FlyingDwarf
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Dwaven.DwarfTowers"] = {initialized = false, cached = nil, loader = __module_66}
function __module_67()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Undead = {}
    local Undead = ____exports.Undead
    Undead.name = "Undead"
    Undead.__index = Undead
    Undead.prototype = {}
    Undead.prototype.__index = __TS__Index(Undead.prototype)
    Undead.prototype.__newindex = __TS__NewIndex(Undead.prototype)
    Undead.prototype.constructor = Undead
    Undead.____super = Tower
    setmetatable(Undead, Undead.____super)
    setmetatable(Undead.prototype, Undead.____super.prototype)
    function Undead.new(...)
        local self = setmetatable({}, Undead.prototype)
        self:____constructor(...)
        return self
    end
    function Undead.prototype.EndOfRoundAction(self)
        BlzSetUnitBaseDamage(
            self.tower,
            BlzGetUnitBaseDamage(self.tower, 0) + 5,
            0
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Elementalist.Undead"] = {initialized = false, cached = nil, loader = __module_67}
function __module_68()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Sapling = {}
    local Sapling = ____exports.Sapling
    Sapling.name = "Sapling"
    Sapling.__index = Sapling
    Sapling.prototype = {}
    Sapling.prototype.__index = __TS__Index(Sapling.prototype)
    Sapling.prototype.__newindex = __TS__NewIndex(Sapling.prototype)
    Sapling.prototype.constructor = Sapling
    Sapling.____super = Tower
    setmetatable(Sapling, Sapling.____super)
    setmetatable(Sapling.prototype, Sapling.____super.prototype)
    function Sapling.new(...)
        local self = setmetatable({}, Sapling.prototype)
        self:____constructor(...)
        return self
    end
    function Sapling.prototype.EndOfRoundAction(self)
        if GetUnitStateSwap(UNIT_STATE_MANA, self.tower) == 5 then
            self:Upgrade(
                FourCC("u036")
            )
        else
            SetUnitManaBJ(
                self.tower,
                GetUnitStateSwap(UNIT_STATE_MANA, self.tower) + 1
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Elementalist.Sapling"] = {initialized = false, cached = nil, loader = __module_68}
function __module_69()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Undead2 = {}
    local Undead2 = ____exports.Undead2
    Undead2.name = "Undead2"
    Undead2.__index = Undead2
    Undead2.prototype = {}
    Undead2.prototype.__index = __TS__Index(Undead2.prototype)
    Undead2.prototype.__newindex = __TS__NewIndex(Undead2.prototype)
    Undead2.prototype.constructor = Undead2
    Undead2.____super = Tower
    setmetatable(Undead2, Undead2.____super)
    setmetatable(Undead2.prototype, Undead2.____super.prototype)
    function Undead2.new(...)
        local self = setmetatable({}, Undead2.prototype)
        self:____constructor(...)
        return self
    end
    function Undead2.prototype.EndOfRoundAction(self)
        BlzSetUnitBaseDamage(
            self.tower,
            BlzGetUnitBaseDamage(self.tower, 0) + 15,
            0
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Elementalist.Undead2"] = {initialized = false, cached = nil, loader = __module_69}
function __module_70()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.LowTide = {}
    local LowTide = ____exports.LowTide
    LowTide.name = "LowTide"
    LowTide.__index = LowTide
    LowTide.prototype = {}
    LowTide.prototype.__index = __TS__Index(LowTide.prototype)
    LowTide.prototype.__newindex = __TS__NewIndex(LowTide.prototype)
    LowTide.prototype.constructor = LowTide
    LowTide.____super = Tower
    setmetatable(LowTide, LowTide.____super)
    setmetatable(LowTide.prototype, LowTide.____super.prototype)
    function LowTide.new(...)
        local self = setmetatable({}, LowTide.prototype)
        self:____constructor(...)
        return self
    end
    function LowTide.prototype.EndOfRoundAction(self)
        if GetUnitStateSwap(UNIT_STATE_MANA, self.tower) == 2 then
            self:Upgrade(
                FourCC("u029")
            )
        else
            SetUnitManaBJ(
                self.tower,
                GetUnitStateSwap(UNIT_STATE_MANA, self.tower) + 1
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Elementalist.LowTide"] = {initialized = false, cached = nil, loader = __module_70}
function __module_71()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Bubbles = {}
    local Bubbles = ____exports.Bubbles
    Bubbles.name = "Bubbles"
    Bubbles.__index = Bubbles
    Bubbles.prototype = {}
    Bubbles.prototype.__index = __TS__Index(Bubbles.prototype)
    Bubbles.prototype.__newindex = __TS__NewIndex(Bubbles.prototype)
    Bubbles.prototype.constructor = Bubbles
    Bubbles.____super = Tower
    setmetatable(Bubbles, Bubbles.____super)
    setmetatable(Bubbles.prototype, Bubbles.____super.prototype)
    function Bubbles.new(...)
        local self = setmetatable({}, Bubbles.prototype)
        self:____constructor(...)
        return self
    end
    function Bubbles.prototype.EndOfRoundAction(self)
        if BlzGetUnitBaseDamage(self.tower, 0) <= 4 then
            self:Upgrade(
                FourCC("n027")
            )
        else
            BlzSetUnitBaseDamage(
                self.tower,
                BlzGetUnitBaseDamage(self.tower, 0) - 5,
                0
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Elementalist.Bubbles"] = {initialized = false, cached = nil, loader = __module_71}
function __module_72()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    local ____GlobalSettings = require("app.src.World.GlobalSettings")
    local ELEMENTALIST_ABILITIES = ____GlobalSettings.ELEMENTALIST_ABILITIES
    ____exports.UnchargedRune = {}
    local UnchargedRune = ____exports.UnchargedRune
    UnchargedRune.name = "UnchargedRune"
    UnchargedRune.__index = UnchargedRune
    UnchargedRune.prototype = {}
    UnchargedRune.prototype.__index = __TS__Index(UnchargedRune.prototype)
    UnchargedRune.prototype.__newindex = __TS__NewIndex(UnchargedRune.prototype)
    UnchargedRune.prototype.constructor = UnchargedRune
    UnchargedRune.____super = Tower
    setmetatable(UnchargedRune, UnchargedRune.____super)
    setmetatable(UnchargedRune.prototype, UnchargedRune.____super.prototype)
    function UnchargedRune.new(...)
        local self = setmetatable({}, UnchargedRune.prototype)
        self:____constructor(...)
        return self
    end
    function UnchargedRune.prototype.____constructor(self, tower, owner, game)
        Tower.prototype.____constructor(self, tower, owner, game)
        self:AddAbilities()
    end
    function UnchargedRune.prototype.AddAbilities(self)
        local nums = {}
        do
            local i = 0
            while i < #ELEMENTALIST_ABILITIES - 1 do
                __TS__ArrayPush(nums, i)
                UnitRemoveAbilityBJ(ELEMENTALIST_ABILITIES[nums[i + 1] + 1], self.tower)
                i = i + 1
            end
        end
        Util:ShuffleArray(nums)
        UnitAddAbilityBJ(ELEMENTALIST_ABILITIES[nums[1] + 1], self.tower)
        UnitAddAbilityBJ(ELEMENTALIST_ABILITIES[nums[2] + 1], self.tower)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Elementalist.UnchargedRune"] = {initialized = false, cached = nil, loader = __module_72}
function __module_73()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.DormantPheonixEgg = {}
    local DormantPheonixEgg = ____exports.DormantPheonixEgg
    DormantPheonixEgg.name = "DormantPheonixEgg"
    DormantPheonixEgg.__index = DormantPheonixEgg
    DormantPheonixEgg.prototype = {}
    DormantPheonixEgg.prototype.__index = __TS__Index(DormantPheonixEgg.prototype)
    DormantPheonixEgg.prototype.__newindex = __TS__NewIndex(DormantPheonixEgg.prototype)
    DormantPheonixEgg.prototype.constructor = DormantPheonixEgg
    DormantPheonixEgg.____super = Tower
    setmetatable(DormantPheonixEgg, DormantPheonixEgg.____super)
    setmetatable(DormantPheonixEgg.prototype, DormantPheonixEgg.____super.prototype)
    function DormantPheonixEgg.new(...)
        local self = setmetatable({}, DormantPheonixEgg.prototype)
        self:____constructor(...)
        return self
    end
    function DormantPheonixEgg.prototype.EndOfRoundAction(self)
        SetUnitManaBJ(
            self.tower,
            GetUnitStateSwap(UNIT_STATE_MANA, self.tower) + 1
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Elementalist.DormantPheonixEgg"] = {initialized = false, cached = nil, loader = __module_73}
function __module_74()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Blaze = {}
    local Blaze = ____exports.Blaze
    Blaze.name = "Blaze"
    Blaze.__index = Blaze
    Blaze.prototype = {}
    Blaze.prototype.__index = __TS__Index(Blaze.prototype)
    Blaze.prototype.__newindex = __TS__NewIndex(Blaze.prototype)
    Blaze.prototype.constructor = Blaze
    Blaze.____super = Tower
    setmetatable(Blaze, Blaze.____super)
    setmetatable(Blaze.prototype, Blaze.____super.prototype)
    function Blaze.new(...)
        local self = setmetatable({}, Blaze.prototype)
        self:____constructor(...)
        return self
    end
    function Blaze.prototype.EndOfRoundAction(self)
        self:Upgrade(
            FourCC("n027")
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Elementalist.Blaze"] = {initialized = false, cached = nil, loader = __module_74}
function __module_75()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Tornado = {}
    local Tornado = ____exports.Tornado
    Tornado.name = "Tornado"
    Tornado.__index = Tornado
    Tornado.prototype = {}
    Tornado.prototype.__index = __TS__Index(Tornado.prototype)
    Tornado.prototype.__newindex = __TS__NewIndex(Tornado.prototype)
    Tornado.prototype.constructor = Tornado
    Tornado.____super = Tower
    setmetatable(Tornado, Tornado.____super)
    setmetatable(Tornado.prototype, Tornado.____super.prototype)
    function Tornado.new(...)
        local self = setmetatable({}, Tornado.prototype)
        self:____constructor(...)
        return self
    end
    function Tornado.prototype.EndOfRoundAction(self)
        if GetUnitAbilityLevel(
            self.tower,
            FourCC("A0E0")
        ) > 0 then
            UnitRemoveAbility(
                self.tower,
                FourCC("A0E0")
            )
            UnitAddAbility(
                self.tower,
                FourCC("A0E1")
            )
            UnitAddAbility(
                self.tower,
                FourCC("A0E2")
            )
        else
            UnitRemoveAbility(
                self.tower,
                FourCC("A0E1")
            )
            UnitRemoveAbility(
                self.tower,
                FourCC("A0E2")
            )
            UnitAddAbility(
                self.tower,
                FourCC("A0E0")
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Elementalist.Tornado"] = {initialized = false, cached = nil, loader = __module_75}
function __module_76()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.HighTide = {}
    local HighTide = ____exports.HighTide
    HighTide.name = "HighTide"
    HighTide.__index = HighTide
    HighTide.prototype = {}
    HighTide.prototype.__index = __TS__Index(HighTide.prototype)
    HighTide.prototype.__newindex = __TS__NewIndex(HighTide.prototype)
    HighTide.prototype.constructor = HighTide
    HighTide.____super = Tower
    setmetatable(HighTide, HighTide.____super)
    setmetatable(HighTide.prototype, HighTide.____super.prototype)
    function HighTide.new(...)
        local self = setmetatable({}, HighTide.prototype)
        self:____constructor(...)
        return self
    end
    function HighTide.prototype.EndOfRoundAction(self)
        self:Upgrade(
            FourCC("u01F")
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Elementalist.HighTide"] = {initialized = false, cached = nil, loader = __module_76}
function __module_77()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Plague = {}
    local Plague = ____exports.Plague
    Plague.name = "Plague"
    Plague.__index = Plague
    Plague.prototype = {}
    Plague.prototype.__index = __TS__Index(Plague.prototype)
    Plague.prototype.__newindex = __TS__NewIndex(Plague.prototype)
    Plague.prototype.constructor = Plague
    Plague.____super = Tower
    setmetatable(Plague, Plague.____super)
    setmetatable(Plague.prototype, Plague.____super.prototype)
    function Plague.new(...)
        local self = setmetatable({}, Plague.prototype)
        self:____constructor(...)
        return self
    end
    function Plague.prototype.PassiveCreepDiesInAreaEffect(self, dyingCreep)
        local loc = dyingCreep:getLocation()
        local dummy = CreateUnitAtLoc(
            self.owner.wcPlayer,
            FourCC("u008"),
            loc,
            bj_UNIT_FACING
        )
        UnitAddAbilityBJ(
            FourCC("A0DZ"),
            dummy
        )
        UnitApplyTimedLifeBJ(
            5,
            FourCC("BTLF"),
            dummy
        )
        RemoveLocation(loc)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Elementalist.Plague"] = {initialized = false, cached = nil, loader = __module_77}
function __module_78()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____Undead = require("app.src.World.Entity.Tower.Races.Elementalist.Undead")
    local Undead = ____Undead.Undead
    local ____Sapling = require("app.src.World.Entity.Tower.Races.Elementalist.Sapling")
    local Sapling = ____Sapling.Sapling
    local ____Undead2 = require("app.src.World.Entity.Tower.Races.Elementalist.Undead2")
    local Undead2 = ____Undead2.Undead2
    local ____LowTide = require("app.src.World.Entity.Tower.Races.Elementalist.LowTide")
    local LowTide = ____LowTide.LowTide
    local ____Bubbles = require("app.src.World.Entity.Tower.Races.Elementalist.Bubbles")
    local Bubbles = ____Bubbles.Bubbles
    local ____UnchargedRune = require("app.src.World.Entity.Tower.Races.Elementalist.UnchargedRune")
    local UnchargedRune = ____UnchargedRune.UnchargedRune
    local ____DormantPheonixEgg = require("app.src.World.Entity.Tower.Races.Elementalist.DormantPheonixEgg")
    local DormantPheonixEgg = ____DormantPheonixEgg.DormantPheonixEgg
    local ____Blaze = require("app.src.World.Entity.Tower.Races.Elementalist.Blaze")
    local Blaze = ____Blaze.Blaze
    local ____Tornado = require("app.src.World.Entity.Tower.Races.Elementalist.Tornado")
    local Tornado = ____Tornado.Tornado
    local ____HighTide = require("app.src.World.Entity.Tower.Races.Elementalist.HighTide")
    local HighTide = ____HighTide.HighTide
    local ____Plague = require("app.src.World.Entity.Tower.Races.Elementalist.Plague")
    local Plague = ____Plague.Plague
    ____exports.ElementalistTowers = {}
    local ElementalistTowers = ____exports.ElementalistTowers
    ElementalistTowers.name = "ElementalistTowers"
    ElementalistTowers.__index = ElementalistTowers
    ElementalistTowers.prototype = {}
    ElementalistTowers.prototype.__index = ElementalistTowers.prototype
    ElementalistTowers.prototype.constructor = ElementalistTowers
    ElementalistTowers.____super = RaceTowers
    setmetatable(ElementalistTowers, ElementalistTowers.____super)
    setmetatable(ElementalistTowers.prototype, ElementalistTowers.____super.prototype)
    function ElementalistTowers.new(...)
        local self = setmetatable({}, ElementalistTowers.prototype)
        self:____constructor(...)
        return self
    end
    function ElementalistTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("n00A"),
            UnchargedRune
        )
        list:add(
            FourCC("n026"),
            Undead
        )
        list:add(
            FourCC("u038"),
            Undead2
        )
        list:add(
            FourCC("u01D"),
            DormantPheonixEgg
        )
        list:add(
            FourCC("u01F"),
            LowTide
        )
        list:add(
            FourCC("u029"),
            HighTide
        )
        list:add(
            FourCC("u021"),
            Sapling
        )
        list:add(
            FourCC("u022"),
            Tornado
        )
        list:add(
            FourCC("u026"),
            Bubbles
        )
        list:add(
            FourCC("u027"),
            Blaze
        )
        list:add(
            FourCC("u020"),
            Plague
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Elementalist.ElementalistTowers"] = {initialized = false, cached = nil, loader = __module_78}
function __module_79()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.ForestTrollHighPriest = {}
    local ForestTrollHighPriest = ____exports.ForestTrollHighPriest
    ForestTrollHighPriest.name = "ForestTrollHighPriest"
    ForestTrollHighPriest.__index = ForestTrollHighPriest
    ForestTrollHighPriest.prototype = {}
    ForestTrollHighPriest.prototype.__index = __TS__Index(ForestTrollHighPriest.prototype)
    ForestTrollHighPriest.prototype.__newindex = __TS__NewIndex(ForestTrollHighPriest.prototype)
    ForestTrollHighPriest.prototype.constructor = ForestTrollHighPriest
    ForestTrollHighPriest.____super = Tower
    setmetatable(ForestTrollHighPriest, ForestTrollHighPriest.____super)
    setmetatable(ForestTrollHighPriest.prototype, ForestTrollHighPriest.____super.prototype)
    function ForestTrollHighPriest.new(...)
        local self = setmetatable({}, ForestTrollHighPriest.prototype)
        self:____constructor(...)
        return self
    end
    function ForestTrollHighPriest.prototype.GenericAttack(self)
        self:CastSpellOnAttackedUnitLocation("monsoon")
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.ForestTrolls.ForestTrollHighPriest"] = {initialized = false, cached = nil, loader = __module_79}
function __module_80()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____ForestTrollHighPriest = require("app.src.World.Entity.Tower.Races.ForestTrolls.ForestTrollHighPriest")
    local ForestTrollHighPriest = ____ForestTrollHighPriest.ForestTrollHighPriest
    ____exports.ForestTrollTowers = {}
    local ForestTrollTowers = ____exports.ForestTrollTowers
    ForestTrollTowers.name = "ForestTrollTowers"
    ForestTrollTowers.__index = ForestTrollTowers
    ForestTrollTowers.prototype = {}
    ForestTrollTowers.prototype.__index = ForestTrollTowers.prototype
    ForestTrollTowers.prototype.constructor = ForestTrollTowers
    ForestTrollTowers.____super = RaceTowers
    setmetatable(ForestTrollTowers, ForestTrollTowers.____super)
    setmetatable(ForestTrollTowers.prototype, ForestTrollTowers.____super.prototype)
    function ForestTrollTowers.new(...)
        local self = setmetatable({}, ForestTrollTowers.prototype)
        self:____constructor(...)
        return self
    end
    function ForestTrollTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("n03I"),
            ForestTrollHighPriest
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.ForestTrolls.ForestTrollTowers"] = {initialized = false, cached = nil, loader = __module_80}
function __module_81()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.GargoyleSpire = {}
    local GargoyleSpire = ____exports.GargoyleSpire
    GargoyleSpire.name = "GargoyleSpire"
    GargoyleSpire.__index = GargoyleSpire
    GargoyleSpire.prototype = {}
    GargoyleSpire.prototype.__index = __TS__Index(GargoyleSpire.prototype)
    GargoyleSpire.prototype.__newindex = __TS__NewIndex(GargoyleSpire.prototype)
    GargoyleSpire.prototype.constructor = GargoyleSpire
    GargoyleSpire.____super = Tower
    setmetatable(GargoyleSpire, GargoyleSpire.____super)
    setmetatable(GargoyleSpire.prototype, GargoyleSpire.____super.prototype)
    function GargoyleSpire.new(...)
        local self = setmetatable({}, GargoyleSpire.prototype)
        self:____constructor(...)
        return self
    end
    function GargoyleSpire.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "Locustswarm"
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Forsaken.GargoyleSpire"] = {initialized = false, cached = nil, loader = __module_81}
function __module_82()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Varimathras = {}
    local Varimathras = ____exports.Varimathras
    Varimathras.name = "Varimathras"
    Varimathras.__index = Varimathras
    Varimathras.prototype = {}
    Varimathras.prototype.__index = __TS__Index(Varimathras.prototype)
    Varimathras.prototype.__newindex = __TS__NewIndex(Varimathras.prototype)
    Varimathras.prototype.constructor = Varimathras
    Varimathras.____super = Tower
    setmetatable(Varimathras, Varimathras.____super)
    setmetatable(Varimathras.prototype, Varimathras.____super.prototype)
    function Varimathras.new(...)
        local self = setmetatable({}, Varimathras.prototype)
        self:____constructor(...)
        return self
    end
    function Varimathras.prototype.GenericAttack(self)
        IssueTargetOrderBJ(
            GetAttacker(),
            "doom",
            GetAttackedUnitBJ()
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Forsaken.Varimathras"] = {initialized = false, cached = nil, loader = __module_82}
function __module_83()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____GargoyleSpire = require("app.src.World.Entity.Tower.Races.Forsaken.GargoyleSpire")
    local GargoyleSpire = ____GargoyleSpire.GargoyleSpire
    local ____Varimathras = require("app.src.World.Entity.Tower.Races.Forsaken.Varimathras")
    local Varimathras = ____Varimathras.Varimathras
    ____exports.ForsakenTowers = {}
    local ForsakenTowers = ____exports.ForsakenTowers
    ForsakenTowers.name = "ForsakenTowers"
    ForsakenTowers.__index = ForsakenTowers
    ForsakenTowers.prototype = {}
    ForsakenTowers.prototype.__index = ForsakenTowers.prototype
    ForsakenTowers.prototype.constructor = ForsakenTowers
    ForsakenTowers.____super = RaceTowers
    setmetatable(ForsakenTowers, ForsakenTowers.____super)
    setmetatable(ForsakenTowers.prototype, ForsakenTowers.____super.prototype)
    function ForsakenTowers.new(...)
        local self = setmetatable({}, ForsakenTowers.prototype)
        self:____constructor(...)
        return self
    end
    function ForsakenTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("u00F"),
            GargoyleSpire
        )
        list:add(
            FourCC("u012"),
            Varimathras
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Forsaken.ForsakenTowers"] = {initialized = false, cached = nil, loader = __module_83}
function __module_84()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.MoonDancer = {}
    local MoonDancer = ____exports.MoonDancer
    MoonDancer.name = "MoonDancer"
    MoonDancer.__index = MoonDancer
    MoonDancer.prototype = {}
    MoonDancer.prototype.__index = __TS__Index(MoonDancer.prototype)
    MoonDancer.prototype.__newindex = __TS__NewIndex(MoonDancer.prototype)
    MoonDancer.prototype.constructor = MoonDancer
    MoonDancer.____super = Tower
    setmetatable(MoonDancer, MoonDancer.____super)
    setmetatable(MoonDancer.prototype, MoonDancer.____super.prototype)
    function MoonDancer.new(...)
        local self = setmetatable({}, MoonDancer.prototype)
        self:____constructor(...)
        return self
    end
    function MoonDancer.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if u == self.tower then
            local mana = GetUnitStateSwap(UNIT_STATE_MANA, self.tower) + 1
            SetUnitManaBJ(self.tower, mana)
            if mana > 4 then
                SetUnitManaBJ(self.tower, 0)
                self:DoSpell(self.game)
            end
        end
    end
    function MoonDancer.prototype.DoSpell(self, game)
        local target = game.gameDamageEngineGlobals.udg_DamageEventTarget
        if not target then
            return
        end
        local spellPoint = GetUnitLoc(target)
        local tempUnit = CreateUnitAtLoc(
            self.owner.wcPlayer,
            FourCC("u008"),
            spellPoint,
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            1,
            FourCC("BTLF"),
            tempUnit
        )
        UnitAddAbilityBJ(
            FourCC("A022"),
            tempUnit
        )
        IssueTargetOrderBJ(tempUnit, "blizzard", target)
        RemoveLocation(spellPoint)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Galaxy.MoonDancer"] = {initialized = false, cached = nil, loader = __module_84}
function __module_85()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.StarChaser = {}
    local StarChaser = ____exports.StarChaser
    StarChaser.name = "StarChaser"
    StarChaser.__index = StarChaser
    StarChaser.prototype = {}
    StarChaser.prototype.__index = __TS__Index(StarChaser.prototype)
    StarChaser.prototype.__newindex = __TS__NewIndex(StarChaser.prototype)
    StarChaser.prototype.constructor = StarChaser
    StarChaser.____super = Tower
    setmetatable(StarChaser, StarChaser.____super)
    setmetatable(StarChaser.prototype, StarChaser.____super.prototype)
    function StarChaser.new(...)
        local self = setmetatable({}, StarChaser.prototype)
        self:____constructor(...)
        return self
    end
    function StarChaser.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "starfall"
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Galaxy.StarChaser"] = {initialized = false, cached = nil, loader = __module_85}
function __module_86()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.CelestialMist = {}
    local CelestialMist = ____exports.CelestialMist
    CelestialMist.name = "CelestialMist"
    CelestialMist.__index = CelestialMist
    CelestialMist.prototype = {}
    CelestialMist.prototype.__index = __TS__Index(CelestialMist.prototype)
    CelestialMist.prototype.__newindex = __TS__NewIndex(CelestialMist.prototype)
    CelestialMist.prototype.constructor = CelestialMist
    CelestialMist.____super = Tower
    setmetatable(CelestialMist, CelestialMist.____super)
    setmetatable(CelestialMist.prototype, CelestialMist.____super.prototype)
    function CelestialMist.new(...)
        local self = setmetatable({}, CelestialMist.prototype)
        self:____constructor(...)
        return self
    end
    function CelestialMist.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "starfall"
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Galaxy.CelestialMist"] = {initialized = false, cached = nil, loader = __module_86}
function __module_87()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____MoonDancer = require("app.src.World.Entity.Tower.Races.Galaxy.MoonDancer")
    local MoonDancer = ____MoonDancer.MoonDancer
    local ____StarChaser = require("app.src.World.Entity.Tower.Races.Galaxy.StarChaser")
    local StarChaser = ____StarChaser.StarChaser
    local ____CelestialMist = require("app.src.World.Entity.Tower.Races.Galaxy.CelestialMist")
    local CelestialMist = ____CelestialMist.CelestialMist
    ____exports.GalaxyTowers = {}
    local GalaxyTowers = ____exports.GalaxyTowers
    GalaxyTowers.name = "GalaxyTowers"
    GalaxyTowers.__index = GalaxyTowers
    GalaxyTowers.prototype = {}
    GalaxyTowers.prototype.__index = GalaxyTowers.prototype
    GalaxyTowers.prototype.constructor = GalaxyTowers
    GalaxyTowers.____super = RaceTowers
    setmetatable(GalaxyTowers, GalaxyTowers.____super)
    setmetatable(GalaxyTowers.prototype, GalaxyTowers.____super.prototype)
    function GalaxyTowers.new(...)
        local self = setmetatable({}, GalaxyTowers.prototype)
        self:____constructor(...)
        return self
    end
    function GalaxyTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("e00K"),
            MoonDancer
        )
        list:add(
            FourCC("e00P"),
            StarChaser
        )
        list:add(
            FourCC("e00R"),
            CelestialMist
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Galaxy.GalaxyTowers"] = {initialized = false, cached = nil, loader = __module_87}
function __module_88()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.OgreWarrior = {}
    local OgreWarrior = ____exports.OgreWarrior
    OgreWarrior.name = "OgreWarrior"
    OgreWarrior.__index = OgreWarrior
    OgreWarrior.prototype = {}
    OgreWarrior.prototype.__index = __TS__Index(OgreWarrior.prototype)
    OgreWarrior.prototype.__newindex = __TS__NewIndex(OgreWarrior.prototype)
    OgreWarrior.prototype.constructor = OgreWarrior
    OgreWarrior.____super = Tower
    setmetatable(OgreWarrior, OgreWarrior.____super)
    setmetatable(OgreWarrior.prototype, OgreWarrior.____super.prototype)
    function OgreWarrior.new(...)
        local self = setmetatable({}, OgreWarrior.prototype)
        self:____constructor(...)
        return self
    end
    function OgreWarrior.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            if UnitHasBuffBJ(
                target,
                FourCC("B01J")
            ) then
                return
            end
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(target),
                GetUnitY(target),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                1,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A029"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "slow", target)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Giants.OgreWarrior"] = {initialized = false, cached = nil, loader = __module_88}
function __module_89()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.FleshGolem = {}
    local FleshGolem = ____exports.FleshGolem
    FleshGolem.name = "FleshGolem"
    FleshGolem.__index = FleshGolem
    FleshGolem.prototype = {}
    FleshGolem.prototype.__index = __TS__Index(FleshGolem.prototype)
    FleshGolem.prototype.__newindex = __TS__NewIndex(FleshGolem.prototype)
    FleshGolem.prototype.constructor = FleshGolem
    FleshGolem.____super = Tower
    setmetatable(FleshGolem, FleshGolem.____super)
    setmetatable(FleshGolem.prototype, FleshGolem.____super.prototype)
    function FleshGolem.new(...)
        local self = setmetatable({}, FleshGolem.prototype)
        self:____constructor(...)
        return self
    end
    function FleshGolem.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "berserk"
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Giants.FleshGolem"] = {initialized = false, cached = nil, loader = __module_89}
function __module_90()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.RockGiant = {}
    local RockGiant = ____exports.RockGiant
    RockGiant.name = "RockGiant"
    RockGiant.__index = RockGiant
    RockGiant.prototype = {}
    RockGiant.prototype.__index = __TS__Index(RockGiant.prototype)
    RockGiant.prototype.__newindex = __TS__NewIndex(RockGiant.prototype)
    RockGiant.prototype.constructor = RockGiant
    RockGiant.____super = Tower
    setmetatable(RockGiant, RockGiant.____super)
    setmetatable(RockGiant.prototype, RockGiant.____super.prototype)
    function RockGiant.new(...)
        local self = setmetatable({}, RockGiant.prototype)
        self:____constructor(...)
        return self
    end
    function RockGiant.prototype.KillingAction(self)
        local u = GetKillingUnitBJ()
        local target = GetDyingUnit()
        if u == self.tower and target then
            local mana = GetUnitStateSwap(UNIT_STATE_MANA, self.tower) + 1
            SetUnitManaBJ(self.tower, mana)
            if mana > 39 then
                SetUnitManaBJ(self.tower, 0)
                self:Upgrade(
                    FourCC("h00A")
                )
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Giants.RockGiant"] = {initialized = false, cached = nil, loader = __module_90}
function __module_91()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.SeaGiant = {}
    local SeaGiant = ____exports.SeaGiant
    SeaGiant.name = "SeaGiant"
    SeaGiant.__index = SeaGiant
    SeaGiant.prototype = {}
    SeaGiant.prototype.__index = __TS__Index(SeaGiant.prototype)
    SeaGiant.prototype.__newindex = __TS__NewIndex(SeaGiant.prototype)
    SeaGiant.prototype.constructor = SeaGiant
    SeaGiant.____super = Tower
    setmetatable(SeaGiant, SeaGiant.____super)
    setmetatable(SeaGiant.prototype, SeaGiant.____super.prototype)
    function SeaGiant.new(...)
        local self = setmetatable({}, SeaGiant.prototype)
        self:____constructor(...)
        return self
    end
    function SeaGiant.prototype.KillingAction(self)
        local u = GetKillingUnitBJ()
        local target = GetDyingUnit()
        if u == self.tower and target then
            local x = GetUnitX(target)
            local y = GetUnitY(target)
            local rand = Util:RandomInt(0, 359)
            local dummyOne = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x + 10 * CosBJ(rand + 45),
                y + 10 * SinBJ(rand + 45),
                0
            )
            local dummyTwo = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x + 10 * CosBJ(rand + 135),
                y + 10 * SinBJ(rand + 135),
                0
            )
            local dummyThree = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x + 10 * CosBJ(rand + 225),
                y + 10 * SinBJ(rand + 225),
                0
            )
            local dummyFour = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x + 10 * CosBJ(rand + 315),
                y + 10 * SinBJ(rand + 315),
                0
            )
            UnitApplyTimedLifeBJ(
                1,
                FourCC("BTLF"),
                dummyOne
            )
            UnitApplyTimedLifeBJ(
                1,
                FourCC("BTLF"),
                dummyTwo
            )
            UnitApplyTimedLifeBJ(
                1,
                FourCC("BTLF"),
                dummyThree
            )
            UnitApplyTimedLifeBJ(
                1,
                FourCC("BTLF"),
                dummyFour
            )
            UnitAddAbilityBJ(
                FourCC("A03T"),
                dummyOne
            )
            UnitAddAbilityBJ(
                FourCC("A03T"),
                dummyTwo
            )
            UnitAddAbilityBJ(
                FourCC("A03T"),
                dummyThree
            )
            UnitAddAbilityBJ(
                FourCC("A03T"),
                dummyFour
            )
            IssuePointOrder(
                dummyOne,
                "carrionswarm",
                x + 150 * CosBJ(rand + 45),
                y + 150 * SinBJ(rand + 45)
            )
            IssuePointOrder(
                dummyTwo,
                "carrionswarm",
                x + 150 * CosBJ(rand + 135),
                y + 150 * SinBJ(rand + 135)
            )
            IssuePointOrder(
                dummyThree,
                "carrionswarm",
                x + 150 * CosBJ(rand + 225),
                y + 150 * SinBJ(rand + 225)
            )
            IssuePointOrder(
                dummyFour,
                "carrionswarm",
                x + 150 * CosBJ(rand + 315),
                y + 150 * SinBJ(rand + 315)
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Giants.SeaGiant"] = {initialized = false, cached = nil, loader = __module_91}
function __module_92()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.OgreMagi = {}
    local OgreMagi = ____exports.OgreMagi
    OgreMagi.name = "OgreMagi"
    OgreMagi.__index = OgreMagi
    OgreMagi.prototype = {}
    OgreMagi.prototype.__index = __TS__Index(OgreMagi.prototype)
    OgreMagi.prototype.__newindex = __TS__NewIndex(OgreMagi.prototype)
    OgreMagi.prototype.constructor = OgreMagi
    OgreMagi.____super = Tower
    setmetatable(OgreMagi, OgreMagi.____super)
    setmetatable(OgreMagi.prototype, OgreMagi.____super.prototype)
    function OgreMagi.new(...)
        local self = setmetatable({}, OgreMagi.prototype)
        self:____constructor(...)
        return self
    end
    function OgreMagi.prototype.Action(self)
        local y = GetUnitY(self.tower)
        local x = GetUnitX(self.tower)
        local dummy = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            x,
            y,
            0
        )
        UnitApplyTimedLifeBJ(
            1,
            FourCC("BTLF"),
            dummy
        )
        UnitAddAbilityBJ(
            FourCC("A036"),
            dummy
        )
        IssueImmediateOrderBJ(dummy, "battleroar")
    end
    function OgreMagi.prototype.GetTickModulo(self)
        return 99
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Giants.OgreMagi"] = {initialized = false, cached = nil, loader = __module_92}
function __module_93()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.AncientGolem = {}
    local AncientGolem = ____exports.AncientGolem
    AncientGolem.name = "AncientGolem"
    AncientGolem.__index = AncientGolem
    AncientGolem.prototype = {}
    AncientGolem.prototype.__index = __TS__Index(AncientGolem.prototype)
    AncientGolem.prototype.__newindex = __TS__NewIndex(AncientGolem.prototype)
    AncientGolem.prototype.constructor = AncientGolem
    AncientGolem.____super = Tower
    setmetatable(AncientGolem, AncientGolem.____super)
    setmetatable(AncientGolem.prototype, AncientGolem.____super.prototype)
    function AncientGolem.new(...)
        local self = setmetatable({}, AncientGolem.prototype)
        self:____constructor(...)
        return self
    end
    function AncientGolem.prototype.Action(self)
        local mana = GetUnitStateSwap(UNIT_STATE_MANA, self.tower) + 1
        SetUnitManaBJ(self.tower, mana)
        BlzSetUnitBaseDamage(
            self.tower,
            BlzGetUnitBaseDamage(self.tower, 0) + 75,
            0
        )
        SetUnitScalePercent(self.tower, 30 + (mana * 10), 30 + (mana * 10), 30 + (mana * 10))
        if mana > 6 then
            self.game.towerTicker:RemoveTickingTower(self.UniqueID)
        end
    end
    function AncientGolem.prototype.GetTickModulo(self)
        return 599
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Giants.AncientGolem"] = {initialized = false, cached = nil, loader = __module_93}
function __module_94()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.IronGolemStatue = {}
    local IronGolemStatue = ____exports.IronGolemStatue
    IronGolemStatue.name = "IronGolemStatue"
    IronGolemStatue.__index = IronGolemStatue
    IronGolemStatue.prototype = {}
    IronGolemStatue.prototype.__index = __TS__Index(IronGolemStatue.prototype)
    IronGolemStatue.prototype.__newindex = __TS__NewIndex(IronGolemStatue.prototype)
    IronGolemStatue.prototype.constructor = IronGolemStatue
    IronGolemStatue.____super = Tower
    setmetatable(IronGolemStatue, IronGolemStatue.____super)
    setmetatable(IronGolemStatue.prototype, IronGolemStatue.____super.prototype)
    function IronGolemStatue.new(...)
        local self = setmetatable({}, IronGolemStatue.prototype)
        self:____constructor(...)
        return self
    end
    function IronGolemStatue.prototype.Action(self)
        if self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.isWaveInProgress then
            local y = GetUnitY(self.tower)
            local x = GetUnitX(self.tower)
            local impalers = {}
            __TS__ArrayPush(
                impalers,
                CreateUnit(
                    self.owner.wcPlayer,
                    FourCC("u008"),
                    x + 100 * CosBJ(135),
                    y + 100 * SinBJ(135),
                    0
                )
            )
            __TS__ArrayPush(
                impalers,
                CreateUnit(
                    self.owner.wcPlayer,
                    FourCC("u008"),
                    x + 100 * CosBJ(225),
                    y + 100 * SinBJ(225),
                    0
                )
            )
            __TS__ArrayPush(
                impalers,
                CreateUnit(
                    self.owner.wcPlayer,
                    FourCC("u008"),
                    x + 100 * CosBJ(315),
                    y + 100 * SinBJ(315),
                    0
                )
            )
            __TS__ArrayPush(
                impalers,
                CreateUnit(
                    self.owner.wcPlayer,
                    FourCC("u008"),
                    x + 100 * CosBJ(45),
                    y + 100 * SinBJ(45),
                    0
                )
            )
            __TS__ArrayPush(
                impalers,
                CreateUnit(
                    self.owner.wcPlayer,
                    FourCC("u008"),
                    x + 100 * CosBJ(0),
                    y + 100 * SinBJ(0),
                    0
                )
            )
            __TS__ArrayPush(
                impalers,
                CreateUnit(
                    self.owner.wcPlayer,
                    FourCC("u008"),
                    x + 100 * CosBJ(90),
                    y + 100 * SinBJ(90),
                    0
                )
            )
            __TS__ArrayPush(
                impalers,
                CreateUnit(
                    self.owner.wcPlayer,
                    FourCC("u008"),
                    x + 100 * CosBJ(180),
                    y + 100 * SinBJ(180),
                    0
                )
            )
            __TS__ArrayPush(
                impalers,
                CreateUnit(
                    self.owner.wcPlayer,
                    FourCC("u008"),
                    x + 100 * CosBJ(270),
                    y + 100 * SinBJ(270),
                    0
                )
            )
            __TS__ArrayForEach(
                impalers,
                function(____, impaler)
                    UnitApplyTimedLifeBJ(
                        1,
                        FourCC("BTLF"),
                        impaler
                    )
                    UnitAddAbilityBJ(
                        FourCC("A030"),
                        impaler
                    )
                end
            )
            IssuePointOrder(
                impalers[1],
                "impale",
                x + 150 * CosBJ(45),
                y + 150 * SinBJ(45)
            )
            IssuePointOrder(
                impalers[2],
                "impale",
                x + 150 * CosBJ(135),
                y + 150 * SinBJ(135)
            )
            IssuePointOrder(
                impalers[3],
                "impale",
                x + 150 * CosBJ(225),
                y + 150 * SinBJ(225)
            )
            IssuePointOrder(
                impalers[4],
                "impale",
                x + 150 * CosBJ(315),
                y + 150 * SinBJ(315)
            )
            IssuePointOrder(
                impalers[5],
                "impale",
                x + 150 * CosBJ(0),
                y + 150 * SinBJ(0)
            )
            IssuePointOrder(
                impalers[6],
                "impale",
                x + 150 * CosBJ(90),
                y + 150 * SinBJ(90)
            )
            IssuePointOrder(
                impalers[7],
                "impale",
                x + 150 * CosBJ(180),
                y + 150 * SinBJ(180)
            )
            IssuePointOrder(
                impalers[8],
                "impale",
                x + 150 * CosBJ(270),
                y + 150 * SinBJ(270)
            )
        end
    end
    function IronGolemStatue.prototype.GetTickModulo(self)
        return 49
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Giants.IronGolemStatue"] = {initialized = false, cached = nil, loader = __module_94}
function __module_95()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____OgreWarrior = require("app.src.World.Entity.Tower.Races.Giants.OgreWarrior")
    local OgreWarrior = ____OgreWarrior.OgreWarrior
    local ____FleshGolem = require("app.src.World.Entity.Tower.Races.Giants.FleshGolem")
    local FleshGolem = ____FleshGolem.FleshGolem
    local ____RockGiant = require("app.src.World.Entity.Tower.Races.Giants.RockGiant")
    local RockGiant = ____RockGiant.RockGiant
    local ____SeaGiant = require("app.src.World.Entity.Tower.Races.Giants.SeaGiant")
    local SeaGiant = ____SeaGiant.SeaGiant
    local ____OgreMagi = require("app.src.World.Entity.Tower.Races.Giants.OgreMagi")
    local OgreMagi = ____OgreMagi.OgreMagi
    local ____AncientGolem = require("app.src.World.Entity.Tower.Races.Giants.AncientGolem")
    local AncientGolem = ____AncientGolem.AncientGolem
    local ____IronGolemStatue = require("app.src.World.Entity.Tower.Races.Giants.IronGolemStatue")
    local IronGolemStatue = ____IronGolemStatue.IronGolemStatue
    ____exports.GiantsTowers = {}
    local GiantsTowers = ____exports.GiantsTowers
    GiantsTowers.name = "GiantsTowers"
    GiantsTowers.__index = GiantsTowers
    GiantsTowers.prototype = {}
    GiantsTowers.prototype.__index = GiantsTowers.prototype
    GiantsTowers.prototype.constructor = GiantsTowers
    GiantsTowers.____super = RaceTowers
    setmetatable(GiantsTowers, GiantsTowers.____super)
    setmetatable(GiantsTowers.prototype, GiantsTowers.____super.prototype)
    function GiantsTowers.new(...)
        local self = setmetatable({}, GiantsTowers.prototype)
        self:____constructor(...)
        return self
    end
    function GiantsTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("oC35"),
            OgreWarrior
        )
        list:add(
            FourCC("o00G"),
            FleshGolem
        )
        list:add(
            FourCC("hC53"),
            RockGiant
        )
        list:add(
            FourCC("o00Y"),
            SeaGiant
        )
        list:add(
            FourCC("hC97"),
            OgreMagi
        )
        list:add(
            FourCC("o00X"),
            AncientGolem
        )
        list:add(
            FourCC("oC26"),
            IronGolemStatue
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Giants.GiantsTowers"] = {initialized = false, cached = nil, loader = __module_95}
function __module_96()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.GoblinMineLayer = {}
    local GoblinMineLayer = ____exports.GoblinMineLayer
    GoblinMineLayer.name = "GoblinMineLayer"
    GoblinMineLayer.__index = GoblinMineLayer
    GoblinMineLayer.prototype = {}
    GoblinMineLayer.prototype.__index = __TS__Index(GoblinMineLayer.prototype)
    GoblinMineLayer.prototype.__newindex = __TS__NewIndex(GoblinMineLayer.prototype)
    GoblinMineLayer.prototype.constructor = GoblinMineLayer
    GoblinMineLayer.____super = Tower
    setmetatable(GoblinMineLayer, GoblinMineLayer.____super)
    setmetatable(GoblinMineLayer.prototype, GoblinMineLayer.____super.prototype)
    function GoblinMineLayer.new(...)
        local self = setmetatable({}, GoblinMineLayer.prototype)
        self:____constructor(...)
        return self
    end
    function GoblinMineLayer.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            if not (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) >= 15) then
                return
            end
            local mine = CreateUnit(
                self.owner.wcPlayer,
                FourCC("h013"),
                GetUnitX(target),
                GetUnitY(target),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                2,
                FourCC("BTLF"),
                mine
            )
            SetUnitManaBJ(
                self.tower,
                (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) - 15)
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Goblin.GoblinMineLayer"] = {initialized = false, cached = nil, loader = __module_96}
function __module_97()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.GoblinTinkerer = {}
    local GoblinTinkerer = ____exports.GoblinTinkerer
    GoblinTinkerer.name = "GoblinTinkerer"
    GoblinTinkerer.__index = GoblinTinkerer
    GoblinTinkerer.prototype = {}
    GoblinTinkerer.prototype.__index = __TS__Index(GoblinTinkerer.prototype)
    GoblinTinkerer.prototype.__newindex = __TS__NewIndex(GoblinTinkerer.prototype)
    GoblinTinkerer.prototype.constructor = GoblinTinkerer
    GoblinTinkerer.____super = Tower
    setmetatable(GoblinTinkerer, GoblinTinkerer.____super)
    setmetatable(GoblinTinkerer.prototype, GoblinTinkerer.____super.prototype)
    function GoblinTinkerer.new(...)
        local self = setmetatable({}, GoblinTinkerer.prototype)
        self:____constructor(...)
        return self
    end
    function GoblinTinkerer.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if Util:RandomInt(1, 100) > 5 then
            return
        end
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                3,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A0B9"),
                tempUnit
            )
            IssuePointOrder(
                tempUnit,
                "clusterrockets",
                GetUnitX(target),
                GetUnitY(target)
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Goblin.GoblinTinkerer"] = {initialized = false, cached = nil, loader = __module_97}
function __module_98()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.GoblinBlademaster = {}
    local GoblinBlademaster = ____exports.GoblinBlademaster
    GoblinBlademaster.name = "GoblinBlademaster"
    GoblinBlademaster.__index = GoblinBlademaster
    GoblinBlademaster.prototype = {}
    GoblinBlademaster.prototype.__index = __TS__Index(GoblinBlademaster.prototype)
    GoblinBlademaster.prototype.__newindex = __TS__NewIndex(GoblinBlademaster.prototype)
    GoblinBlademaster.prototype.constructor = GoblinBlademaster
    GoblinBlademaster.____super = Tower
    setmetatable(GoblinBlademaster, GoblinBlademaster.____super)
    setmetatable(GoblinBlademaster.prototype, GoblinBlademaster.____super.prototype)
    function GoblinBlademaster.new(...)
        local self = setmetatable({}, GoblinBlademaster.prototype)
        self:____constructor(...)
        return self
    end
    function GoblinBlademaster.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if Util:RandomInt(1, 100) > 8 then
            return
        end
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                10,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A0D6"),
                tempUnit
            )
            IssueImmediateOrderBJ(tempUnit, "spiritwolf")
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Goblin.GoblinBlademaster"] = {initialized = false, cached = nil, loader = __module_98}
function __module_99()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.GoblinSapper = {}
    local GoblinSapper = ____exports.GoblinSapper
    GoblinSapper.name = "GoblinSapper"
    GoblinSapper.__index = GoblinSapper
    GoblinSapper.prototype = {}
    GoblinSapper.prototype.__index = __TS__Index(GoblinSapper.prototype)
    GoblinSapper.prototype.__newindex = __TS__NewIndex(GoblinSapper.prototype)
    GoblinSapper.prototype.constructor = GoblinSapper
    GoblinSapper.____super = Tower
    setmetatable(GoblinSapper, GoblinSapper.____super)
    setmetatable(GoblinSapper.prototype, GoblinSapper.____super.prototype)
    function GoblinSapper.new(...)
        local self = setmetatable({}, GoblinSapper.prototype)
        self:____constructor(...)
        return self
    end
    function GoblinSapper.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "stomp"
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Goblin.GoblinSapper"] = {initialized = false, cached = nil, loader = __module_99}
function __module_100()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.GoblinAlchemist = {}
    local GoblinAlchemist = ____exports.GoblinAlchemist
    GoblinAlchemist.name = "GoblinAlchemist"
    GoblinAlchemist.__index = GoblinAlchemist
    GoblinAlchemist.prototype = {}
    GoblinAlchemist.prototype.__index = __TS__Index(GoblinAlchemist.prototype)
    GoblinAlchemist.prototype.__newindex = __TS__NewIndex(GoblinAlchemist.prototype)
    GoblinAlchemist.prototype.constructor = GoblinAlchemist
    GoblinAlchemist.____super = Tower
    setmetatable(GoblinAlchemist, GoblinAlchemist.____super)
    setmetatable(GoblinAlchemist.prototype, GoblinAlchemist.____super.prototype)
    function GoblinAlchemist.new(...)
        local self = setmetatable({}, GoblinAlchemist.prototype)
        self:____constructor(...)
        return self
    end
    function GoblinAlchemist.prototype.GenericAttack(self)
        IssueTargetOrderBJ(
            GetAttacker(),
            "acidbomb",
            GetAttackedUnitBJ()
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Goblin.GoblinAlchemist"] = {initialized = false, cached = nil, loader = __module_100}
function __module_101()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____GoblinMineLayer = require("app.src.World.Entity.Tower.Races.Goblin.GoblinMineLayer")
    local GoblinMineLayer = ____GoblinMineLayer.GoblinMineLayer
    local ____GoblinTinkerer = require("app.src.World.Entity.Tower.Races.Goblin.GoblinTinkerer")
    local GoblinTinkerer = ____GoblinTinkerer.GoblinTinkerer
    local ____GoblinBlademaster = require("app.src.World.Entity.Tower.Races.Goblin.GoblinBlademaster")
    local GoblinBlademaster = ____GoblinBlademaster.GoblinBlademaster
    local ____GoblinSapper = require("app.src.World.Entity.Tower.Races.Goblin.GoblinSapper")
    local GoblinSapper = ____GoblinSapper.GoblinSapper
    local ____GoblinAlchemist = require("app.src.World.Entity.Tower.Races.Goblin.GoblinAlchemist")
    local GoblinAlchemist = ____GoblinAlchemist.GoblinAlchemist
    ____exports.GoblinTowers = {}
    local GoblinTowers = ____exports.GoblinTowers
    GoblinTowers.name = "GoblinTowers"
    GoblinTowers.__index = GoblinTowers
    GoblinTowers.prototype = {}
    GoblinTowers.prototype.__index = GoblinTowers.prototype
    GoblinTowers.prototype.constructor = GoblinTowers
    GoblinTowers.____super = RaceTowers
    setmetatable(GoblinTowers, GoblinTowers.____super)
    setmetatable(GoblinTowers.prototype, GoblinTowers.____super.prototype)
    function GoblinTowers.new(...)
        local self = setmetatable({}, GoblinTowers.prototype)
        self:____constructor(...)
        return self
    end
    function GoblinTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("o01R"),
            GoblinMineLayer
        )
        list:add(
            FourCC("o01S"),
            GoblinTinkerer
        )
        list:add(
            FourCC("o01P"),
            GoblinBlademaster
        )
        list:add(
            FourCC("o01M"),
            GoblinSapper
        )
        list:add(
            FourCC("o01O"),
            GoblinAlchemist
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Goblin.GoblinTowers"] = {initialized = false, cached = nil, loader = __module_101}
function __module_102()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Kael = {}
    local Kael = ____exports.Kael
    Kael.name = "Kael"
    Kael.__index = Kael
    Kael.prototype = {}
    Kael.prototype.__index = __TS__Index(Kael.prototype)
    Kael.prototype.__newindex = __TS__NewIndex(Kael.prototype)
    Kael.prototype.constructor = Kael
    Kael.____super = Tower
    setmetatable(Kael, Kael.____super)
    setmetatable(Kael.prototype, Kael.____super.prototype)
    function Kael.new(...)
        local self = setmetatable({}, Kael.prototype)
        self:____constructor(...)
        return self
    end
    function Kael.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "Locustswarm"
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.HighElven.Kael"] = {initialized = false, cached = nil, loader = __module_102}
function __module_103()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____Kael = require("app.src.World.Entity.Tower.Races.HighElven.Kael")
    local Kael = ____Kael.Kael
    ____exports.HighElvenTowers = {}
    local HighElvenTowers = ____exports.HighElvenTowers
    HighElvenTowers.name = "HighElvenTowers"
    HighElvenTowers.__index = HighElvenTowers
    HighElvenTowers.prototype = {}
    HighElvenTowers.prototype.__index = HighElvenTowers.prototype
    HighElvenTowers.prototype.constructor = HighElvenTowers
    HighElvenTowers.____super = RaceTowers
    setmetatable(HighElvenTowers, HighElvenTowers.____super)
    setmetatable(HighElvenTowers.prototype, HighElvenTowers.____super.prototype)
    function HighElvenTowers.new(...)
        local self = setmetatable({}, HighElvenTowers.prototype)
        self:____constructor(...)
        return self
    end
    function HighElvenTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("o00N"),
            Kael
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.HighElven.HighElvenTowers"] = {initialized = false, cached = nil, loader = __module_103}
function __module_104()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.VenomTower = {}
    local VenomTower = ____exports.VenomTower
    VenomTower.name = "VenomTower"
    VenomTower.__index = VenomTower
    VenomTower.prototype = {}
    VenomTower.prototype.__index = __TS__Index(VenomTower.prototype)
    VenomTower.prototype.__newindex = __TS__NewIndex(VenomTower.prototype)
    VenomTower.prototype.constructor = VenomTower
    VenomTower.____super = Tower
    setmetatable(VenomTower, VenomTower.____super)
    setmetatable(VenomTower.prototype, VenomTower.____super.prototype)
    function VenomTower.new(...)
        local self = setmetatable({}, VenomTower.prototype)
        self:____constructor(...)
        return self
    end
    function VenomTower.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if u == self.tower then
            IssueImmediateOrderBJ(self.tower, "stop")
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Human.VenomTower"] = {initialized = false, cached = nil, loader = __module_104}
function __module_105()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.SirGalahad = {}
    local SirGalahad = ____exports.SirGalahad
    SirGalahad.name = "SirGalahad"
    SirGalahad.__index = SirGalahad
    SirGalahad.prototype = {}
    SirGalahad.prototype.__index = __TS__Index(SirGalahad.prototype)
    SirGalahad.prototype.__newindex = __TS__NewIndex(SirGalahad.prototype)
    SirGalahad.prototype.constructor = SirGalahad
    SirGalahad.____super = Tower
    setmetatable(SirGalahad, SirGalahad.____super)
    setmetatable(SirGalahad.prototype, SirGalahad.____super.prototype)
    function SirGalahad.new(...)
        local self = setmetatable({}, SirGalahad.prototype)
        self:____constructor(...)
        return self
    end
    function SirGalahad.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "spiritwolf"
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Human.SirGalahad"] = {initialized = false, cached = nil, loader = __module_105}
function __module_106()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____VenomTower = require("app.src.World.Entity.Tower.Races.Human.VenomTower")
    local VenomTower = ____VenomTower.VenomTower
    local ____SirGalahad = require("app.src.World.Entity.Tower.Races.Human.SirGalahad")
    local SirGalahad = ____SirGalahad.SirGalahad
    ____exports.HumanTowers = {}
    local HumanTowers = ____exports.HumanTowers
    HumanTowers.name = "HumanTowers"
    HumanTowers.__index = HumanTowers
    HumanTowers.prototype = {}
    HumanTowers.prototype.__index = HumanTowers.prototype
    HumanTowers.prototype.constructor = HumanTowers
    HumanTowers.____super = RaceTowers
    setmetatable(HumanTowers, HumanTowers.____super)
    setmetatable(HumanTowers.prototype, HumanTowers.____super.prototype)
    function HumanTowers.new(...)
        local self = setmetatable({}, HumanTowers.prototype)
        self:____constructor(...)
        return self
    end
    function HumanTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("h045"),
            VenomTower
        )
        list:add(
            FourCC("n05C"),
            SirGalahad
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Human.HumanTowers"] = {initialized = false, cached = nil, loader = __module_106}
function __module_107()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.IceTrollKing = {}
    local IceTrollKing = ____exports.IceTrollKing
    IceTrollKing.name = "IceTrollKing"
    IceTrollKing.__index = IceTrollKing
    IceTrollKing.prototype = {}
    IceTrollKing.prototype.__index = __TS__Index(IceTrollKing.prototype)
    IceTrollKing.prototype.__newindex = __TS__NewIndex(IceTrollKing.prototype)
    IceTrollKing.prototype.constructor = IceTrollKing
    IceTrollKing.____super = Tower
    setmetatable(IceTrollKing, IceTrollKing.____super)
    setmetatable(IceTrollKing.prototype, IceTrollKing.____super.prototype)
    function IceTrollKing.new(...)
        local self = setmetatable({}, IceTrollKing.prototype)
        self:____constructor(...)
        return self
    end
    function IceTrollKing.prototype.____constructor(self, tower, owner, game)
        Tower.prototype.____constructor(self, tower, owner, game)
        self:AddCriticalStrike()
    end
    function IceTrollKing.prototype.AddCriticalStrike(self)
        local loc = GetUnitLoc(self.tower)
        local grp = GetUnitsInRangeOfLocMatching(
            182,
            loc,
            Condition(
                function() return self:InitializeCriticalStrikeGroupConditions() end
            )
        )
        RemoveLocation(loc)
        DestroyGroup(grp)
    end
    function IceTrollKing.prototype.Action(self)
        self:AddCriticalStrike()
    end
    function IceTrollKing.prototype.GetTickModulo(self)
        return 599
    end
    function IceTrollKing.prototype.InitializeCriticalStrikeGroupConditions(self)
        if not IsUnitType(
            GetFilterUnit(),
            UNIT_TYPE_STRUCTURE
        ) then
            return false
        end
        if GetFilterUnit() == self.tower then
            return false
        end
        if GetUnitAbilityLevel(
            GetFilterUnit(),
            FourCC("A0CN")
        ) > 0 then
            return false
        end
        UnitAddAbilityBJ(
            FourCC("A0CN"),
            GetFilterUnit()
        )
        return true
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.IceTrolls.IceTrollKing"] = {initialized = false, cached = nil, loader = __module_107}
function __module_108()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.IceTrollEmperor = {}
    local IceTrollEmperor = ____exports.IceTrollEmperor
    IceTrollEmperor.name = "IceTrollEmperor"
    IceTrollEmperor.__index = IceTrollEmperor
    IceTrollEmperor.prototype = {}
    IceTrollEmperor.prototype.__index = __TS__Index(IceTrollEmperor.prototype)
    IceTrollEmperor.prototype.__newindex = __TS__NewIndex(IceTrollEmperor.prototype)
    IceTrollEmperor.prototype.constructor = IceTrollEmperor
    IceTrollEmperor.____super = Tower
    setmetatable(IceTrollEmperor, IceTrollEmperor.____super)
    setmetatable(IceTrollEmperor.prototype, IceTrollEmperor.____super.prototype)
    function IceTrollEmperor.new(...)
        local self = setmetatable({}, IceTrollEmperor.prototype)
        self:____constructor(...)
        return self
    end
    function IceTrollEmperor.prototype.Action(self)
        if self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.isWaveInProgress then
            self:CastBlizzard()
        end
    end
    function IceTrollEmperor.prototype.GetTickModulo(self)
        return 10
    end
    function IceTrollEmperor.prototype.CastBlizzard(self)
        local unitX = GetUnitX(self.tower)
        local unitY = GetUnitY(self.tower)
        local x = unitX + GetRandomReal(0, 500) - 250
        local y = unitY + GetRandomReal(0, 500) - 250
        local dummy = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            x,
            y,
            0
        )
        UnitApplyTimedLifeBJ(
            2,
            FourCC("BTLF"),
            dummy
        )
        UnitAddAbilityBJ(
            FourCC("A0CO"),
            dummy
        )
        IssuePointOrder(dummy, "blizzard", x, y)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.IceTrolls.IceTrollEmperor"] = {initialized = false, cached = nil, loader = __module_108}
function __module_109()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.IceTrollPriest = {}
    local IceTrollPriest = ____exports.IceTrollPriest
    IceTrollPriest.name = "IceTrollPriest"
    IceTrollPriest.__index = IceTrollPriest
    IceTrollPriest.prototype = {}
    IceTrollPriest.prototype.__index = __TS__Index(IceTrollPriest.prototype)
    IceTrollPriest.prototype.__newindex = __TS__NewIndex(IceTrollPriest.prototype)
    IceTrollPriest.prototype.constructor = IceTrollPriest
    IceTrollPriest.____super = Tower
    setmetatable(IceTrollPriest, IceTrollPriest.____super)
    setmetatable(IceTrollPriest.prototype, IceTrollPriest.____super.prototype)
    function IceTrollPriest.new(...)
        local self = setmetatable({}, IceTrollPriest.prototype)
        self:____constructor(...)
        return self
    end
    function IceTrollPriest.prototype.____constructor(self, ...)
        Tower.prototype.____constructor(self, ...)
        self.targets = {}
    end
    function IceTrollPriest.prototype.FrostNova(self)
        local loc = GetUnitLoc(self.tower)
        local grp = GetUnitsInRangeOfLocMatching(
            500,
            loc,
            Condition(
                function() return self:InitializeFrostNovaGroupConditions() end
            )
        )
        if #self.targets > 0 then
            local indx = Util:RandomInt(0, #self.targets - 1)
            local x = GetUnitX(self.tower)
            local y = GetUnitY(self.tower)
            local dummy = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x,
                y,
                0
            )
            UnitApplyTimedLifeBJ(
                1,
                FourCC("BTLF"),
                dummy
            )
            UnitAddAbilityBJ(
                FourCC("A08J"),
                dummy
            )
            IssueTargetOrderBJ(dummy, "frostnova", self.targets[indx + 1])
        end
        RemoveLocation(loc)
        DestroyGroup(grp)
    end
    function IceTrollPriest.prototype.Action(self)
        self:FrostNova()
    end
    function IceTrollPriest.prototype.GetTickModulo(self)
        return 49
    end
    function IceTrollPriest.prototype.InitializeFrostNovaGroupConditions(self)
        if not Util:isUnitCreep(
            GetFilterUnit()
        ) then
            return false
        end
        if not IsUnitAliveBJ(
            GetFilterUnit()
        ) then
            return false
        end
        __TS__ArrayPush(
            self.targets,
            GetFilterUnit()
        )
        return true
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.IceTrolls.IceTrollPriest"] = {initialized = false, cached = nil, loader = __module_109}
function __module_110()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____IceTrollKing = require("app.src.World.Entity.Tower.Races.IceTrolls.IceTrollKing")
    local IceTrollKing = ____IceTrollKing.IceTrollKing
    local ____IceTrollEmperor = require("app.src.World.Entity.Tower.Races.IceTrolls.IceTrollEmperor")
    local IceTrollEmperor = ____IceTrollEmperor.IceTrollEmperor
    local ____IceTrollPriest = require("app.src.World.Entity.Tower.Races.IceTrolls.IceTrollPriest")
    local IceTrollPriest = ____IceTrollPriest.IceTrollPriest
    ____exports.IceTrollTowers = {}
    local IceTrollTowers = ____exports.IceTrollTowers
    IceTrollTowers.name = "IceTrollTowers"
    IceTrollTowers.__index = IceTrollTowers
    IceTrollTowers.prototype = {}
    IceTrollTowers.prototype.__index = IceTrollTowers.prototype
    IceTrollTowers.prototype.constructor = IceTrollTowers
    IceTrollTowers.____super = RaceTowers
    setmetatable(IceTrollTowers, IceTrollTowers.____super)
    setmetatable(IceTrollTowers.prototype, IceTrollTowers.____super.prototype)
    function IceTrollTowers.new(...)
        local self = setmetatable({}, IceTrollTowers.prototype)
        self:____constructor(...)
        return self
    end
    function IceTrollTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("n01B"),
            IceTrollKing
        )
        list:add(
            FourCC("n01C"),
            IceTrollEmperor
        )
        list:add(
            FourCC("n018"),
            IceTrollPriest
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.IceTrolls.IceTrollTowers"] = {initialized = false, cached = nil, loader = __module_110}
function __module_111()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.DemonicIllidan = {}
    local DemonicIllidan = ____exports.DemonicIllidan
    DemonicIllidan.name = "DemonicIllidan"
    DemonicIllidan.__index = DemonicIllidan
    DemonicIllidan.prototype = {}
    DemonicIllidan.prototype.__index = __TS__Index(DemonicIllidan.prototype)
    DemonicIllidan.prototype.__newindex = __TS__NewIndex(DemonicIllidan.prototype)
    DemonicIllidan.prototype.constructor = DemonicIllidan
    DemonicIllidan.____super = Tower
    setmetatable(DemonicIllidan, DemonicIllidan.____super)
    setmetatable(DemonicIllidan.prototype, DemonicIllidan.____super.prototype)
    function DemonicIllidan.new(...)
        local self = setmetatable({}, DemonicIllidan.prototype)
        self:____constructor(...)
        return self
    end
    function DemonicIllidan.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if not self.game.gameDamageEngineGlobals.udg_IsDamageSpell then
            return
        end
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(target),
                GetUnitY(target),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                4,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A0BZ"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "soulburn", target)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.NightElf.DemonicIllidan"] = {initialized = false, cached = nil, loader = __module_111}
function __module_112()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.CorruptedIllidan = {}
    local CorruptedIllidan = ____exports.CorruptedIllidan
    CorruptedIllidan.name = "CorruptedIllidan"
    CorruptedIllidan.__index = CorruptedIllidan
    CorruptedIllidan.prototype = {}
    CorruptedIllidan.prototype.__index = __TS__Index(CorruptedIllidan.prototype)
    CorruptedIllidan.prototype.__newindex = __TS__NewIndex(CorruptedIllidan.prototype)
    CorruptedIllidan.prototype.constructor = CorruptedIllidan
    CorruptedIllidan.____super = Tower
    setmetatable(CorruptedIllidan, CorruptedIllidan.____super)
    setmetatable(CorruptedIllidan.prototype, CorruptedIllidan.____super.prototype)
    function CorruptedIllidan.new(...)
        local self = setmetatable({}, CorruptedIllidan.prototype)
        self:____constructor(...)
        return self
    end
    function CorruptedIllidan.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if not self.game.gameDamageEngineGlobals.udg_IsDamageSpell then
            return
        end
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                3,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A0BZ"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "soulburn", target)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.NightElf.CorruptedIllidan"] = {initialized = false, cached = nil, loader = __module_112}
function __module_113()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Warden = {}
    local Warden = ____exports.Warden
    Warden.name = "Warden"
    Warden.__index = Warden
    Warden.prototype = {}
    Warden.prototype.__index = __TS__Index(Warden.prototype)
    Warden.prototype.__newindex = __TS__NewIndex(Warden.prototype)
    Warden.prototype.constructor = Warden
    Warden.____super = Tower
    setmetatable(Warden, Warden.____super)
    setmetatable(Warden.prototype, Warden.____super.prototype)
    function Warden.new(...)
        local self = setmetatable({}, Warden.prototype)
        self:____constructor(...)
        return self
    end
    function Warden.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                3,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A0BM"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "shadowstrike", target)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.NightElf.Warden"] = {initialized = false, cached = nil, loader = __module_113}
function __module_114()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Wisp = {}
    local Wisp = ____exports.Wisp
    Wisp.name = "Wisp"
    Wisp.__index = Wisp
    Wisp.prototype = {}
    Wisp.prototype.__index = __TS__Index(Wisp.prototype)
    Wisp.prototype.__newindex = __TS__NewIndex(Wisp.prototype)
    Wisp.prototype.constructor = Wisp
    Wisp.____super = Tower
    setmetatable(Wisp, Wisp.____super)
    setmetatable(Wisp.prototype, Wisp.____super.prototype)
    function Wisp.new(...)
        local self = setmetatable({}, Wisp.prototype)
        self:____constructor(...)
        return self
    end
    function Wisp.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "thunderclap"
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.NightElf.Wisp"] = {initialized = false, cached = nil, loader = __module_114}
function __module_115()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.AncientProtector = {}
    local AncientProtector = ____exports.AncientProtector
    AncientProtector.name = "AncientProtector"
    AncientProtector.__index = AncientProtector
    AncientProtector.prototype = {}
    AncientProtector.prototype.__index = __TS__Index(AncientProtector.prototype)
    AncientProtector.prototype.__newindex = __TS__NewIndex(AncientProtector.prototype)
    AncientProtector.prototype.constructor = AncientProtector
    AncientProtector.____super = Tower
    setmetatable(AncientProtector, AncientProtector.____super)
    setmetatable(AncientProtector.prototype, AncientProtector.____super.prototype)
    function AncientProtector.new(...)
        local self = setmetatable({}, AncientProtector.prototype)
        self:____constructor(...)
        return self
    end
    function AncientProtector.prototype.GenericAttack(self)
        local u = GetAttacker()
        if u == self.tower then
            if not (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) >= 30) then
                return
            end
            if not (UnitInventoryCount(self.tower) <= 1) then
                return
            end
            SetUnitManaPercentBJ(self.tower, 0)
            local roll = Util:RandomInt(1, 3)
            local ____switch5 = roll
            if ____switch5 == 1 then
                goto ____switch5_case_0
            end
            if ____switch5 == 2 then
                goto ____switch5_case_1
            end
            if ____switch5 == 3 then
                goto ____switch5_case_2
            end
            goto ____switch5_end
            ::____switch5_case_0::
            do
                UnitAddItemByIdSwapped(
                    FourCC("I023"),
                    self.tower
                )
                goto ____switch5_end
            end
            ::____switch5_case_1::
            do
                UnitAddItemByIdSwapped(
                    FourCC("I021"),
                    self.tower
                )
                goto ____switch5_end
            end
            ::____switch5_case_2::
            do
                UnitAddItemByIdSwapped(
                    FourCC("I022"),
                    self.tower
                )
                goto ____switch5_end
            end
            ::____switch5_end::
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.NightElf.AncientProtector"] = {initialized = false, cached = nil, loader = __module_115}
function __module_116()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.ChimaeraRoost = {}
    local ChimaeraRoost = ____exports.ChimaeraRoost
    ChimaeraRoost.name = "ChimaeraRoost"
    ChimaeraRoost.__index = ChimaeraRoost
    ChimaeraRoost.prototype = {}
    ChimaeraRoost.prototype.__index = __TS__Index(ChimaeraRoost.prototype)
    ChimaeraRoost.prototype.__newindex = __TS__NewIndex(ChimaeraRoost.prototype)
    ChimaeraRoost.prototype.constructor = ChimaeraRoost
    ChimaeraRoost.____super = Tower
    setmetatable(ChimaeraRoost, ChimaeraRoost.____super)
    setmetatable(ChimaeraRoost.prototype, ChimaeraRoost.____super.prototype)
    function ChimaeraRoost.new(...)
        local self = setmetatable({}, ChimaeraRoost.prototype)
        self:____constructor(...)
        return self
    end
    function ChimaeraRoost.prototype.Action(self)
        if self.owner.chimeraCount <= 3 then
            do
                local ____obj, ____index = self.owner, "chimeraCount"
                ____obj[____index] = ____obj[____index] + 1
            end
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("e004"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
        end
    end
    function ChimaeraRoost.prototype.GetTickModulo(self)
        return 150
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.NightElf.ChimaeraRoost"] = {initialized = false, cached = nil, loader = __module_116}
function __module_117()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____DemonicIllidan = require("app.src.World.Entity.Tower.Races.NightElf.DemonicIllidan")
    local DemonicIllidan = ____DemonicIllidan.DemonicIllidan
    local ____CorruptedIllidan = require("app.src.World.Entity.Tower.Races.NightElf.CorruptedIllidan")
    local CorruptedIllidan = ____CorruptedIllidan.CorruptedIllidan
    local ____Warden = require("app.src.World.Entity.Tower.Races.NightElf.Warden")
    local Warden = ____Warden.Warden
    local ____Wisp = require("app.src.World.Entity.Tower.Races.NightElf.Wisp")
    local Wisp = ____Wisp.Wisp
    local ____AncientProtector = require("app.src.World.Entity.Tower.Races.NightElf.AncientProtector")
    local AncientProtector = ____AncientProtector.AncientProtector
    local ____ChimaeraRoost = require("app.src.World.Entity.Tower.Races.NightElf.ChimaeraRoost")
    local ChimaeraRoost = ____ChimaeraRoost.ChimaeraRoost
    ____exports.NightElfTowers = {}
    local NightElfTowers = ____exports.NightElfTowers
    NightElfTowers.name = "NightElfTowers"
    NightElfTowers.__index = NightElfTowers
    NightElfTowers.prototype = {}
    NightElfTowers.prototype.__index = NightElfTowers.prototype
    NightElfTowers.prototype.constructor = NightElfTowers
    NightElfTowers.____super = RaceTowers
    setmetatable(NightElfTowers, NightElfTowers.____super)
    setmetatable(NightElfTowers.prototype, NightElfTowers.____super.prototype)
    function NightElfTowers.new(...)
        local self = setmetatable({}, NightElfTowers.prototype)
        self:____constructor(...)
        return self
    end
    function NightElfTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("h00S"),
            DemonicIllidan
        )
        list:add(
            FourCC("eC83"),
            CorruptedIllidan
        )
        list:add(
            FourCC("h00G"),
            Warden
        )
        list:add(
            FourCC("e00E"),
            Wisp
        )
        list:add(
            FourCC("hC82"),
            AncientProtector
        )
        list:add(
            FourCC("hC86"),
            ChimaeraRoost
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.NightElf.NightElfTowers"] = {initialized = false, cached = nil, loader = __module_117}
function __module_118()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Rokhan = {}
    local Rokhan = ____exports.Rokhan
    Rokhan.name = "Rokhan"
    Rokhan.__index = Rokhan
    Rokhan.prototype = {}
    Rokhan.prototype.__index = __TS__Index(Rokhan.prototype)
    Rokhan.prototype.__newindex = __TS__NewIndex(Rokhan.prototype)
    Rokhan.prototype.constructor = Rokhan
    Rokhan.____super = Tower
    setmetatable(Rokhan, Rokhan.____super)
    setmetatable(Rokhan.prototype, Rokhan.____super.prototype)
    function Rokhan.new(...)
        local self = setmetatable({}, Rokhan.prototype)
        self:____constructor(...)
        return self
    end
    function Rokhan.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("o00H"),
                GetUnitX(target),
                GetUnitY(target),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                5,
                FourCC("BTLF"),
                tempUnit
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.OrcStronghold.Rokhan"] = {initialized = false, cached = nil, loader = __module_118}
function __module_119()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.WarchiefThrall = {}
    local WarchiefThrall = ____exports.WarchiefThrall
    WarchiefThrall.name = "WarchiefThrall"
    WarchiefThrall.__index = WarchiefThrall
    WarchiefThrall.prototype = {}
    WarchiefThrall.prototype.__index = __TS__Index(WarchiefThrall.prototype)
    WarchiefThrall.prototype.__newindex = __TS__NewIndex(WarchiefThrall.prototype)
    WarchiefThrall.prototype.constructor = WarchiefThrall
    WarchiefThrall.____super = Tower
    setmetatable(WarchiefThrall, WarchiefThrall.____super)
    setmetatable(WarchiefThrall.prototype, WarchiefThrall.____super.prototype)
    function WarchiefThrall.new(...)
        local self = setmetatable({}, WarchiefThrall.prototype)
        self:____constructor(...)
        return self
    end
    function WarchiefThrall.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if Util:RandomInt(1, 100) > 5 then
            return
        end
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                3,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A03J"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "forkedlightning", target)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.OrcStronghold.WarchiefThrall"] = {initialized = false, cached = nil, loader = __module_119}
function __module_120()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Berserker = {}
    local Berserker = ____exports.Berserker
    Berserker.name = "Berserker"
    Berserker.__index = Berserker
    Berserker.prototype = {}
    Berserker.prototype.__index = __TS__Index(Berserker.prototype)
    Berserker.prototype.__newindex = __TS__NewIndex(Berserker.prototype)
    Berserker.prototype.constructor = Berserker
    Berserker.____super = Tower
    setmetatable(Berserker, Berserker.____super)
    setmetatable(Berserker.prototype, Berserker.____super.prototype)
    function Berserker.new(...)
        local self = setmetatable({}, Berserker.prototype)
        self:____constructor(...)
        return self
    end
    function Berserker.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "berserk"
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.OrcStronghold.Berserker"] = {initialized = false, cached = nil, loader = __module_120}
function __module_121()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____Rokhan = require("app.src.World.Entity.Tower.Races.OrcStronghold.Rokhan")
    local Rokhan = ____Rokhan.Rokhan
    local ____WarchiefThrall = require("app.src.World.Entity.Tower.Races.OrcStronghold.WarchiefThrall")
    local WarchiefThrall = ____WarchiefThrall.WarchiefThrall
    local ____Berserker = require("app.src.World.Entity.Tower.Races.OrcStronghold.Berserker")
    local Berserker = ____Berserker.Berserker
    ____exports.OrcStrongholdTowers = {}
    local OrcStrongholdTowers = ____exports.OrcStrongholdTowers
    OrcStrongholdTowers.name = "OrcStrongholdTowers"
    OrcStrongholdTowers.__index = OrcStrongholdTowers
    OrcStrongholdTowers.prototype = {}
    OrcStrongholdTowers.prototype.__index = OrcStrongholdTowers.prototype
    OrcStrongholdTowers.prototype.constructor = OrcStrongholdTowers
    OrcStrongholdTowers.____super = RaceTowers
    setmetatable(OrcStrongholdTowers, OrcStrongholdTowers.____super)
    setmetatable(OrcStrongholdTowers.prototype, OrcStrongholdTowers.____super.prototype)
    function OrcStrongholdTowers.new(...)
        local self = setmetatable({}, OrcStrongholdTowers.prototype)
        self:____constructor(...)
        return self
    end
    function OrcStrongholdTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("h002"),
            Rokhan
        )
        list:add(
            FourCC("oC65"),
            WarchiefThrall
        )
        list:add(
            FourCC("o00E"),
            Berserker
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.OrcStronghold.OrcStrongholdTowers"] = {initialized = false, cached = nil, loader = __module_121}
function __module_122()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Magtheridon = {}
    local Magtheridon = ____exports.Magtheridon
    Magtheridon.name = "Magtheridon"
    Magtheridon.__index = Magtheridon
    Magtheridon.prototype = {}
    Magtheridon.prototype.__index = __TS__Index(Magtheridon.prototype)
    Magtheridon.prototype.__newindex = __TS__NewIndex(Magtheridon.prototype)
    Magtheridon.prototype.constructor = Magtheridon
    Magtheridon.____super = Tower
    setmetatable(Magtheridon, Magtheridon.____super)
    setmetatable(Magtheridon.prototype, Magtheridon.____super.prototype)
    function Magtheridon.new(...)
        local self = setmetatable({}, Magtheridon.prototype)
        self:____constructor(...)
        return self
    end
    function Magtheridon.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if Util:RandomInt(1, 100) > 15 then
            return
        end
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                3,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A0DT"),
                tempUnit
            )
            IssuePointOrder(
                tempUnit,
                "rainoffire",
                GetUnitX(target),
                GetUnitY(target)
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Outland.Magtheridon"] = {initialized = false, cached = nil, loader = __module_122}
function __module_123()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____Magtheridon = require("app.src.World.Entity.Tower.Races.Outland.Magtheridon")
    local Magtheridon = ____Magtheridon.Magtheridon
    ____exports.OutlandTowers = {}
    local OutlandTowers = ____exports.OutlandTowers
    OutlandTowers.name = "OutlandTowers"
    OutlandTowers.__index = OutlandTowers
    OutlandTowers.prototype = {}
    OutlandTowers.prototype.__index = OutlandTowers.prototype
    OutlandTowers.prototype.constructor = OutlandTowers
    OutlandTowers.____super = RaceTowers
    setmetatable(OutlandTowers, OutlandTowers.____super)
    setmetatable(OutlandTowers.prototype, OutlandTowers.____super.prototype)
    function OutlandTowers.new(...)
        local self = setmetatable({}, OutlandTowers.prototype)
        self:____constructor(...)
        return self
    end
    function OutlandTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("u01C"),
            Magtheridon
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Outland.OutlandTowers"] = {initialized = false, cached = nil, loader = __module_123}
function __module_124()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.KodoBeast = {}
    local KodoBeast = ____exports.KodoBeast
    KodoBeast.name = "KodoBeast"
    KodoBeast.__index = KodoBeast
    KodoBeast.prototype = {}
    KodoBeast.prototype.__index = __TS__Index(KodoBeast.prototype)
    KodoBeast.prototype.__newindex = __TS__NewIndex(KodoBeast.prototype)
    KodoBeast.prototype.constructor = KodoBeast
    KodoBeast.____super = Tower
    setmetatable(KodoBeast, KodoBeast.____super)
    setmetatable(KodoBeast.prototype, KodoBeast.____super.prototype)
    function KodoBeast.new(...)
        local self = setmetatable({}, KodoBeast.prototype)
        self:____constructor(...)
        return self
    end
    function KodoBeast.prototype.GenericAttack(self)
        IssueTargetOrderBJ(
            GetAttacker(),
            "devour",
            GetAttackedUnitBJ()
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.ShrineOfBuffs.KodoBeast"] = {initialized = false, cached = nil, loader = __module_124}
function __module_125()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____KodoBeast = require("app.src.World.Entity.Tower.Races.ShrineOfBuffs.KodoBeast")
    local KodoBeast = ____KodoBeast.KodoBeast
    ____exports.ShrineOfBuffsTowers = {}
    local ShrineOfBuffsTowers = ____exports.ShrineOfBuffsTowers
    ShrineOfBuffsTowers.name = "ShrineOfBuffsTowers"
    ShrineOfBuffsTowers.__index = ShrineOfBuffsTowers
    ShrineOfBuffsTowers.prototype = {}
    ShrineOfBuffsTowers.prototype.__index = ShrineOfBuffsTowers.prototype
    ShrineOfBuffsTowers.prototype.constructor = ShrineOfBuffsTowers
    ShrineOfBuffsTowers.____super = RaceTowers
    setmetatable(ShrineOfBuffsTowers, ShrineOfBuffsTowers.____super)
    setmetatable(ShrineOfBuffsTowers.prototype, ShrineOfBuffsTowers.____super.prototype)
    function ShrineOfBuffsTowers.new(...)
        local self = setmetatable({}, ShrineOfBuffsTowers.prototype)
        self:____constructor(...)
        return self
    end
    function ShrineOfBuffsTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("oC58"),
            KodoBeast
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.ShrineOfBuffs.ShrineOfBuffsTowers"] = {initialized = false, cached = nil, loader = __module_125}
function __module_126()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Prawn = {}
    local Prawn = ____exports.Prawn
    Prawn.name = "Prawn"
    Prawn.__index = Prawn
    Prawn.prototype = {}
    Prawn.prototype.__index = __TS__Index(Prawn.prototype)
    Prawn.prototype.__newindex = __TS__NewIndex(Prawn.prototype)
    Prawn.prototype.constructor = Prawn
    Prawn.____super = Tower
    setmetatable(Prawn, Prawn.____super)
    setmetatable(Prawn.prototype, Prawn.____super.prototype)
    function Prawn.new(...)
        local self = setmetatable({}, Prawn.prototype)
        self:____constructor(...)
        return self
    end
    function Prawn.prototype.GenericAttack(self)
        self:CastSpellOnAttackedUnitLocation("carrionswarm")
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Summons.Prawn"] = {initialized = false, cached = nil, loader = __module_126}
function __module_127()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.LavaSpawn = {}
    local LavaSpawn = ____exports.LavaSpawn
    LavaSpawn.name = "LavaSpawn"
    LavaSpawn.__index = LavaSpawn
    LavaSpawn.prototype = {}
    LavaSpawn.prototype.__index = __TS__Index(LavaSpawn.prototype)
    LavaSpawn.prototype.__newindex = __TS__NewIndex(LavaSpawn.prototype)
    LavaSpawn.prototype.constructor = LavaSpawn
    LavaSpawn.____super = Tower
    setmetatable(LavaSpawn, LavaSpawn.____super)
    setmetatable(LavaSpawn.prototype, LavaSpawn.____super.prototype)
    function LavaSpawn.new(...)
        local self = setmetatable({}, LavaSpawn.prototype)
        self:____constructor(...)
        return self
    end
    function LavaSpawn.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "thunderclap"
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Summons.LavaSpawn"] = {initialized = false, cached = nil, loader = __module_127}
function __module_128()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____Prawn = require("app.src.World.Entity.Tower.Races.Summons.Prawn")
    local Prawn = ____Prawn.Prawn
    local ____LavaSpawn = require("app.src.World.Entity.Tower.Races.Summons.LavaSpawn")
    local LavaSpawn = ____LavaSpawn.LavaSpawn
    ____exports.SummonsTowers = {}
    local SummonsTowers = ____exports.SummonsTowers
    SummonsTowers.name = "SummonsTowers"
    SummonsTowers.__index = SummonsTowers
    SummonsTowers.prototype = {}
    SummonsTowers.prototype.__index = SummonsTowers.prototype
    SummonsTowers.prototype.constructor = SummonsTowers
    SummonsTowers.____super = RaceTowers
    setmetatable(SummonsTowers, SummonsTowers.____super)
    setmetatable(SummonsTowers.prototype, SummonsTowers.____super.prototype)
    function SummonsTowers.new(...)
        local self = setmetatable({}, SummonsTowers.prototype)
        self:____constructor(...)
        return self
    end
    function SummonsTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("h027"),
            Prawn
        )
        list:add(
            FourCC("h026"),
            LavaSpawn
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Summons.SummonsTowers"] = {initialized = false, cached = nil, loader = __module_128}
function __module_129()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.EarthPandaren = {}
    local EarthPandaren = ____exports.EarthPandaren
    EarthPandaren.name = "EarthPandaren"
    EarthPandaren.__index = EarthPandaren
    EarthPandaren.prototype = {}
    EarthPandaren.prototype.__index = __TS__Index(EarthPandaren.prototype)
    EarthPandaren.prototype.__newindex = __TS__NewIndex(EarthPandaren.prototype)
    EarthPandaren.prototype.constructor = EarthPandaren
    EarthPandaren.____super = Tower
    setmetatable(EarthPandaren, EarthPandaren.____super)
    setmetatable(EarthPandaren.prototype, EarthPandaren.____super.prototype)
    function EarthPandaren.new(...)
        local self = setmetatable({}, EarthPandaren.prototype)
        self:____constructor(...)
        return self
    end
    function EarthPandaren.prototype.GenericAttack(self)
        IssueTargetOrderBJ(
            GetAttacker(),
            "drunkenhaze",
            GetAttackedUnitBJ()
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Tavern.EarthPandaren"] = {initialized = false, cached = nil, loader = __module_129}
function __module_130()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.StormPandaren = {}
    local StormPandaren = ____exports.StormPandaren
    StormPandaren.name = "StormPandaren"
    StormPandaren.__index = StormPandaren
    StormPandaren.prototype = {}
    StormPandaren.prototype.__index = __TS__Index(StormPandaren.prototype)
    StormPandaren.prototype.__newindex = __TS__NewIndex(StormPandaren.prototype)
    StormPandaren.prototype.constructor = StormPandaren
    StormPandaren.____super = Tower
    setmetatable(StormPandaren, StormPandaren.____super)
    setmetatable(StormPandaren.prototype, StormPandaren.____super.prototype)
    function StormPandaren.new(...)
        local self = setmetatable({}, StormPandaren.prototype)
        self:____constructor(...)
        return self
    end
    function StormPandaren.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if u == self.tower then
            local randomInt = Util:RandomInt(1, 6)
            local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
            if not target then
                return
            end
            local spellPoint = GetUnitLoc(self.tower)
            local loc = GetUnitLoc(target)
            local tempUnit = CreateUnitAtLocSaveLast(
                self.owner.wcPlayer,
                FourCC("u008"),
                spellPoint,
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                3,
                FourCC("BTLF"),
                tempUnit
            )
            local ____switch4 = randomInt
            if ____switch4 == 1 then
                goto ____switch4_case_0
            end
            if ____switch4 == 2 then
                goto ____switch4_case_1
            end
            if ____switch4 == 3 then
                goto ____switch4_case_2
            end
            if ____switch4 == 4 then
                goto ____switch4_case_3
            end
            if ____switch4 == 5 then
                goto ____switch4_case_4
            end
            goto ____switch4_case_default
            ::____switch4_case_0::
            do
                UnitAddAbilityBJ(
                    FourCC("A078"),
                    tempUnit
                )
                IssuePointOrderLocBJ(tempUnit, "clusterrockets", loc)
                goto ____switch4_end
            end
            ::____switch4_case_1::
            do
                UnitAddAbilityBJ(
                    FourCC("A00F"),
                    tempUnit
                )
                IssuePointOrderLocBJ(tempUnit, "flamestrike", loc)
                goto ____switch4_end
            end
            ::____switch4_case_2::
            do
                UnitAddAbilityBJ(
                    FourCC("A02N"),
                    tempUnit
                )
                IssuePointOrderLocBJ(tempUnit, "impale", loc)
                goto ____switch4_end
            end
            ::____switch4_case_3::
            do
                UnitAddAbilityBJ(
                    FourCC("A02M"),
                    tempUnit
                )
                IssuePointOrderLocBJ(tempUnit, "carrionswarm", loc)
                goto ____switch4_end
            end
            ::____switch4_case_4::
            do
                UnitAddAbilityBJ(
                    FourCC("A08P"),
                    tempUnit
                )
                IssuePointOrderLocBJ(tempUnit, "rainoffire", loc)
                goto ____switch4_end
            end
            ::____switch4_case_default::
            do
                UnitAddAbilityBJ(
                    FourCC("A00J"),
                    tempUnit
                )
                IssuePointOrderLocBJ(tempUnit, "fanofknives", loc)
                goto ____switch4_end
            end
            ::____switch4_end::
            RemoveLocation(spellPoint)
            RemoveLocation(loc)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Tavern.StormPandaren"] = {initialized = false, cached = nil, loader = __module_130}
function __module_131()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.FirePandaren = {}
    local FirePandaren = ____exports.FirePandaren
    FirePandaren.name = "FirePandaren"
    FirePandaren.__index = FirePandaren
    FirePandaren.prototype = {}
    FirePandaren.prototype.__index = __TS__Index(FirePandaren.prototype)
    FirePandaren.prototype.__newindex = __TS__NewIndex(FirePandaren.prototype)
    FirePandaren.prototype.constructor = FirePandaren
    FirePandaren.____super = Tower
    setmetatable(FirePandaren, FirePandaren.____super)
    setmetatable(FirePandaren.prototype, FirePandaren.____super.prototype)
    function FirePandaren.new(...)
        local self = setmetatable({}, FirePandaren.prototype)
        self:____constructor(...)
        return self
    end
    function FirePandaren.prototype.GenericAttack(self)
        self:CastSpellOnAttackedUnitLocation("breathoffire")
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Tavern.FirePandaren"] = {initialized = false, cached = nil, loader = __module_131}
function __module_132()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____EarthPandaren = require("app.src.World.Entity.Tower.Races.Tavern.EarthPandaren")
    local EarthPandaren = ____EarthPandaren.EarthPandaren
    local ____StormPandaren = require("app.src.World.Entity.Tower.Races.Tavern.StormPandaren")
    local StormPandaren = ____StormPandaren.StormPandaren
    local ____FirePandaren = require("app.src.World.Entity.Tower.Races.Tavern.FirePandaren")
    local FirePandaren = ____FirePandaren.FirePandaren
    ____exports.TavernTowers = {}
    local TavernTowers = ____exports.TavernTowers
    TavernTowers.name = "TavernTowers"
    TavernTowers.__index = TavernTowers
    TavernTowers.prototype = {}
    TavernTowers.prototype.__index = TavernTowers.prototype
    TavernTowers.prototype.constructor = TavernTowers
    TavernTowers.____super = RaceTowers
    setmetatable(TavernTowers, TavernTowers.____super)
    setmetatable(TavernTowers.prototype, TavernTowers.____super.prototype)
    function TavernTowers.new(...)
        local self = setmetatable({}, TavernTowers.prototype)
        self:____constructor(...)
        return self
    end
    function TavernTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("h01F"),
            EarthPandaren
        )
        list:add(
            FourCC("h01J"),
            StormPandaren
        )
        list:add(
            FourCC("h01I"),
            FirePandaren
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Tavern.TavernTowers"] = {initialized = false, cached = nil, loader = __module_132}
function __module_133()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.SacrificialPit = {}
    local SacrificialPit = ____exports.SacrificialPit
    SacrificialPit.name = "SacrificialPit"
    SacrificialPit.__index = SacrificialPit
    SacrificialPit.prototype = {}
    SacrificialPit.prototype.__index = __TS__Index(SacrificialPit.prototype)
    SacrificialPit.prototype.__newindex = __TS__NewIndex(SacrificialPit.prototype)
    SacrificialPit.prototype.constructor = SacrificialPit
    SacrificialPit.____super = Tower
    setmetatable(SacrificialPit, SacrificialPit.____super)
    setmetatable(SacrificialPit.prototype, SacrificialPit.____super.prototype)
    function SacrificialPit.new(...)
        local self = setmetatable({}, SacrificialPit.prototype)
        self:____constructor(...)
        return self
    end
    function SacrificialPit.prototype.PassiveCreepDiesInAreaEffect(self, dyingCreep)
        local loc = dyingCreep:getLocation()
        local dummy = CreateUnitAtLoc(
            self.owner.wcPlayer,
            FourCC("u008"),
            loc,
            bj_UNIT_FACING
        )
        UnitAddAbilityBJ(
            FourCC("A08P"),
            dummy
        )
        IssuePointOrderLocBJ(dummy, "rainoffire", loc)
        UnitApplyTimedLifeBJ(
            3,
            FourCC("BTLF"),
            dummy
        )
        RemoveLocation(loc)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Undead.SacrificialPit"] = {initialized = false, cached = nil, loader = __module_133}
function __module_134()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____SacrificialPit = require("app.src.World.Entity.Tower.Races.Undead.SacrificialPit")
    local SacrificialPit = ____SacrificialPit.SacrificialPit
    ____exports.UndeadTowers = {}
    local UndeadTowers = ____exports.UndeadTowers
    UndeadTowers.name = "UndeadTowers"
    UndeadTowers.__index = UndeadTowers
    UndeadTowers.prototype = {}
    UndeadTowers.prototype.__index = UndeadTowers.prototype
    UndeadTowers.prototype.constructor = UndeadTowers
    UndeadTowers.____super = RaceTowers
    setmetatable(UndeadTowers, UndeadTowers.____super)
    setmetatable(UndeadTowers.prototype, UndeadTowers.____super.prototype)
    function UndeadTowers.new(...)
        local self = setmetatable({}, UndeadTowers.prototype)
        self:____constructor(...)
        return self
    end
    function UndeadTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("h00R"),
            SacrificialPit
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Undead.UndeadTowers"] = {initialized = false, cached = nil, loader = __module_134}
function __module_135()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.AncientMonstrosity = {}
    local AncientMonstrosity = ____exports.AncientMonstrosity
    AncientMonstrosity.name = "AncientMonstrosity"
    AncientMonstrosity.__index = AncientMonstrosity
    AncientMonstrosity.prototype = {}
    AncientMonstrosity.prototype.__index = __TS__Index(AncientMonstrosity.prototype)
    AncientMonstrosity.prototype.__newindex = __TS__NewIndex(AncientMonstrosity.prototype)
    AncientMonstrosity.prototype.constructor = AncientMonstrosity
    AncientMonstrosity.____super = Tower
    setmetatable(AncientMonstrosity, AncientMonstrosity.____super)
    setmetatable(AncientMonstrosity.prototype, AncientMonstrosity.____super.prototype)
    function AncientMonstrosity.new(...)
        local self = setmetatable({}, AncientMonstrosity.prototype)
        self:____constructor(...)
        return self
    end
    function AncientMonstrosity.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if Util:RandomInt(1, 2) == 1 then
            return
        end
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                20,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A0EE"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "acidbomb", target)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Unique.AncientMonstrosity"] = {initialized = false, cached = nil, loader = __module_135}
function __module_136()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Hydralisk = {}
    local Hydralisk = ____exports.Hydralisk
    Hydralisk.name = "Hydralisk"
    Hydralisk.__index = Hydralisk
    Hydralisk.prototype = {}
    Hydralisk.prototype.__index = __TS__Index(Hydralisk.prototype)
    Hydralisk.prototype.__newindex = __TS__NewIndex(Hydralisk.prototype)
    Hydralisk.prototype.constructor = Hydralisk
    Hydralisk.____super = Tower
    setmetatable(Hydralisk, Hydralisk.____super)
    setmetatable(Hydralisk.prototype, Hydralisk.____super.prototype)
    function Hydralisk.new(...)
        local self = setmetatable({}, Hydralisk.prototype)
        self:____constructor(...)
        return self
    end
    function Hydralisk.prototype.KillingAction(self)
        local u = GetKillingUnitBJ()
        local target = GetDyingUnit()
        if u == self.tower and target then
            if GetUnitAbilityLevelSwapped(
                FourCC("A0EH"),
                self.tower
            ) <= 50 then
                IncUnitAbilityLevelSwapped(
                    FourCC("A0EH"),
                    self.tower
                )
            end
            if GetUnitAbilityLevelSwapped(
                FourCC("A0EI"),
                self.tower
            ) <= 50 then
                IncUnitAbilityLevelSwapped(
                    FourCC("A0EI"),
                    self.tower
                )
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Unique.Hydralisk"] = {initialized = false, cached = nil, loader = __module_136}
function __module_137()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Marine = {}
    local Marine = ____exports.Marine
    Marine.name = "Marine"
    Marine.__index = Marine
    Marine.prototype = {}
    Marine.prototype.__index = __TS__Index(Marine.prototype)
    Marine.prototype.__newindex = __TS__NewIndex(Marine.prototype)
    Marine.prototype.constructor = Marine
    Marine.____super = Tower
    setmetatable(Marine, Marine.____super)
    setmetatable(Marine.prototype, Marine.____super.prototype)
    function Marine.new(...)
        local self = setmetatable({}, Marine.prototype)
        self:____constructor(...)
        return self
    end
    function Marine.prototype.UpdateSize(self)
        SetUnitAbilityLevelSwapped(
            FourCC("A0EJ"),
            self.tower,
            self.owner.towerForces:get(
                self:GetTypeID()
            )
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Unique.Marine"] = {initialized = false, cached = nil, loader = __module_137}
function __module_138()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.ProudMoore = {}
    local ProudMoore = ____exports.ProudMoore
    ProudMoore.name = "ProudMoore"
    ProudMoore.__index = ProudMoore
    ProudMoore.prototype = {}
    ProudMoore.prototype.__index = __TS__Index(ProudMoore.prototype)
    ProudMoore.prototype.__newindex = __TS__NewIndex(ProudMoore.prototype)
    ProudMoore.prototype.constructor = ProudMoore
    ProudMoore.____super = Tower
    setmetatable(ProudMoore, ProudMoore.____super)
    setmetatable(ProudMoore.prototype, ProudMoore.____super.prototype)
    function ProudMoore.new(...)
        local self = setmetatable({}, ProudMoore.prototype)
        self:____constructor(...)
        return self
    end
    function ProudMoore.prototype.MaxCount(self)
        return 1
    end
    function ProudMoore.prototype.ConstructionFinished(self)
        do
            local i = 0
            while i < 8 do
                self:SpawnSeaElemental(i)
                i = i + 1
            end
        end
    end
    function ProudMoore.prototype.SpawnSeaElemental(self, i)
        if self.owner.seaElemetals < 8 then
            local towerLoc = GetUnitLoc(self.tower)
            local targetLoc = PolarProjectionBJ(towerLoc, 400, (i * (360 / 8)))
            CreateUnitAtLoc(
                self.owner.wcPlayer,
                FourCC("u041"),
                targetLoc,
                bj_UNIT_FACING
            )
            do
                local ____obj, ____index = self.owner, "seaElemetals"
                ____obj[____index] = ____obj[____index] + 1
            end
            RemoveLocation(targetLoc)
            RemoveLocation(towerLoc)
        end
    end
    function ProudMoore.prototype.SellAction(self)
        local towerLoc = GetUnitLoc(self.tower)
        local grp = GetUnitsInRangeOfLocAll(512, towerLoc)
        ForGroupBJ(
            grp,
            function() return self:RemoveElemental() end
        )
        DestroyGroup(grp)
        RemoveLocation(towerLoc)
    end
    function ProudMoore.prototype.RemoveElemental(self)
        if GetUnitTypeId(
            GetEnumUnit()
        ) == FourCC("u041") then
            RemoveUnit(
                GetEnumUnit()
            )
            do
                local ____obj, ____index = self.owner, "seaElemetals"
                ____obj[____index] = ____obj[____index] - 1
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Unique.ProudMoore"] = {initialized = false, cached = nil, loader = __module_138}
function __module_139()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Sammy = {}
    local Sammy = ____exports.Sammy
    Sammy.name = "Sammy"
    Sammy.__index = Sammy
    Sammy.prototype = {}
    Sammy.prototype.__index = __TS__Index(Sammy.prototype)
    Sammy.prototype.__newindex = __TS__NewIndex(Sammy.prototype)
    Sammy.prototype.constructor = Sammy
    Sammy.____super = Tower
    setmetatable(Sammy, Sammy.____super)
    setmetatable(Sammy.prototype, Sammy.____super.prototype)
    function Sammy.new(...)
        local self = setmetatable({}, Sammy.prototype)
        self:____constructor(...)
        return self
    end
    function Sammy.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if u == self.tower then
            SetUnitManaBJ(
                self.tower,
                (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) + 1)
            )
            if GetUnitStateSwap(UNIT_STATE_MANA, self.tower) >= 1000 then
                self:Upgrade(
                    FourCC("u040")
                )
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Unique.Sammy"] = {initialized = false, cached = nil, loader = __module_139}
function __module_140()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.ZerglingHive = {}
    local ZerglingHive = ____exports.ZerglingHive
    ZerglingHive.name = "ZerglingHive"
    ZerglingHive.__index = ZerglingHive
    ZerglingHive.prototype = {}
    ZerglingHive.prototype.__index = __TS__Index(ZerglingHive.prototype)
    ZerglingHive.prototype.__newindex = __TS__NewIndex(ZerglingHive.prototype)
    ZerglingHive.prototype.constructor = ZerglingHive
    ZerglingHive.____super = Tower
    setmetatable(ZerglingHive, ZerglingHive.____super)
    setmetatable(ZerglingHive.prototype, ZerglingHive.____super.prototype)
    function ZerglingHive.new(...)
        local self = setmetatable({}, ZerglingHive.prototype)
        self:____constructor(...)
        return self
    end
    function ZerglingHive.prototype.GenericAttack(self)
        if Util:RandomInt(0, 100) >= 98 and self.owner.zerglings <= 24 then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u042"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
            do
                local ____obj, ____index = self.owner, "zerglings"
                ____obj[____index] = ____obj[____index] + 1
            end
            UnitApplyTimedLifeBJ(
                10,
                FourCC("BTLF"),
                tempUnit
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Unique.ZerglingHive"] = {initialized = false, cached = nil, loader = __module_140}
function __module_141()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.TheDarkness = {}
    local TheDarkness = ____exports.TheDarkness
    TheDarkness.name = "TheDarkness"
    TheDarkness.__index = TheDarkness
    TheDarkness.prototype = {}
    TheDarkness.prototype.__index = __TS__Index(TheDarkness.prototype)
    TheDarkness.prototype.__newindex = __TS__NewIndex(TheDarkness.prototype)
    TheDarkness.prototype.constructor = TheDarkness
    TheDarkness.____super = Tower
    setmetatable(TheDarkness, TheDarkness.____super)
    setmetatable(TheDarkness.prototype, TheDarkness.____super.prototype)
    function TheDarkness.new(...)
        local self = setmetatable({}, TheDarkness.prototype)
        self:____constructor(...)
        return self
    end
    function TheDarkness.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                2,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A0EG"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "cripple", target)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Unique.TheDarkness"] = {initialized = false, cached = nil, loader = __module_141}
function __module_142()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____AncientMonstrosity = require("app.src.World.Entity.Tower.Races.Unique.AncientMonstrosity")
    local AncientMonstrosity = ____AncientMonstrosity.AncientMonstrosity
    local ____Hydralisk = require("app.src.World.Entity.Tower.Races.Unique.Hydralisk")
    local Hydralisk = ____Hydralisk.Hydralisk
    local ____Marine = require("app.src.World.Entity.Tower.Races.Unique.Marine")
    local Marine = ____Marine.Marine
    local ____ProudMoore = require("app.src.World.Entity.Tower.Races.Unique.ProudMoore")
    local ProudMoore = ____ProudMoore.ProudMoore
    local ____Sammy = require("app.src.World.Entity.Tower.Races.Unique.Sammy")
    local Sammy = ____Sammy.Sammy
    local ____ZerglingHive = require("app.src.World.Entity.Tower.Races.Unique.ZerglingHive")
    local ZerglingHive = ____ZerglingHive.ZerglingHive
    local ____TheDarkness = require("app.src.World.Entity.Tower.Races.Unique.TheDarkness")
    local TheDarkness = ____TheDarkness.TheDarkness
    ____exports.UniqueTowers = {}
    local UniqueTowers = ____exports.UniqueTowers
    UniqueTowers.name = "UniqueTowers"
    UniqueTowers.__index = UniqueTowers
    UniqueTowers.prototype = {}
    UniqueTowers.prototype.__index = UniqueTowers.prototype
    UniqueTowers.prototype.constructor = UniqueTowers
    UniqueTowers.____super = RaceTowers
    setmetatable(UniqueTowers, UniqueTowers.____super)
    setmetatable(UniqueTowers.prototype, UniqueTowers.____super.prototype)
    function UniqueTowers.new(...)
        local self = setmetatable({}, UniqueTowers.prototype)
        self:____constructor(...)
        return self
    end
    function UniqueTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("h02K"),
            AncientMonstrosity
        )
        list:add(
            FourCC("h02L"),
            Hydralisk
        )
        list:add(
            FourCC("h02H"),
            Marine
        )
        list:add(
            FourCC("h02J"),
            ProudMoore
        )
        list:add(
            FourCC("u03F"),
            Sammy
        )
        list:add(
            FourCC("u03E"),
            ZerglingHive
        )
        list:add(
            FourCC("u040"),
            TheDarkness
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Unique.UniqueTowers"] = {initialized = false, cached = nil, loader = __module_142}
function __module_143()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.VoidPriest = {}
    local VoidPriest = ____exports.VoidPriest
    VoidPriest.name = "VoidPriest"
    VoidPriest.__index = VoidPriest
    VoidPriest.prototype = {}
    VoidPriest.prototype.__index = __TS__Index(VoidPriest.prototype)
    VoidPriest.prototype.__newindex = __TS__NewIndex(VoidPriest.prototype)
    VoidPriest.prototype.constructor = VoidPriest
    VoidPriest.____super = Tower
    setmetatable(VoidPriest, VoidPriest.____super)
    setmetatable(VoidPriest.prototype, VoidPriest.____super.prototype)
    function VoidPriest.new(...)
        local self = setmetatable({}, VoidPriest.prototype)
        self:____constructor(...)
        return self
    end
    function VoidPriest.prototype.GenericAttack(self)
        IssueTargetOrderBJ(
            GetAttacker(),
            "frostnova",
            GetAttackedUnitBJ()
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Void.VoidPriest"] = {initialized = false, cached = nil, loader = __module_143}
function __module_144()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.VoidFissure = {}
    local VoidFissure = ____exports.VoidFissure
    VoidFissure.name = "VoidFissure"
    VoidFissure.__index = VoidFissure
    VoidFissure.prototype = {}
    VoidFissure.prototype.__index = __TS__Index(VoidFissure.prototype)
    VoidFissure.prototype.__newindex = __TS__NewIndex(VoidFissure.prototype)
    VoidFissure.prototype.constructor = VoidFissure
    VoidFissure.____super = Tower
    setmetatable(VoidFissure, VoidFissure.____super)
    setmetatable(VoidFissure.prototype, VoidFissure.____super.prototype)
    function VoidFissure.new(...)
        local self = setmetatable({}, VoidFissure.prototype)
        self:____constructor(...)
        return self
    end
    function VoidFissure.prototype.____constructor(self, tower, owner, game)
        Tower.prototype.____constructor(self, tower, owner, game)
        self.owner:SetVoidFragmentTick(
            self.owner:GetVoidFragmentTick() + 50
        )
    end
    function VoidFissure.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(
            GetAttacker(),
            "roar"
        )
    end
    function VoidFissure.prototype.SellAction(self)
        self.owner:SetVoidFragmentTick(
            self.owner:GetVoidFragmentTick() - 50
        )
    end
    function VoidFissure.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            local rndSpell = Util:RandomInt(1, 4)
            local x = GetUnitX(self.tower)
            local y = GetUnitY(self.tower)
            local dummy = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x,
                y,
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                3,
                FourCC("BTLF"),
                dummy
            )
            local ____switch6 = rndSpell
            if ____switch6 == 1 then
                goto ____switch6_case_0
            end
            if ____switch6 == 2 then
                goto ____switch6_case_1
            end
            if ____switch6 == 3 then
                goto ____switch6_case_2
            end
            if ____switch6 == 4 then
                goto ____switch6_case_3
            end
            goto ____switch6_end
            ::____switch6_case_0::
            do
                UnitAddAbilityBJ(
                    FourCC("A09I"),
                    dummy
                )
                IssuePointOrder(dummy, "blizzard", x, y)
                goto ____switch6_end
            end
            ::____switch6_case_1::
            do
                UnitAddAbilityBJ(
                    FourCC("A09N"),
                    dummy
                )
                IssuePointOrder(dummy, "flamestrike", x, y)
                goto ____switch6_end
            end
            ::____switch6_case_2::
            do
                UnitAddAbilityBJ(
                    FourCC("A09K"),
                    dummy
                )
                IssuePointOrder(dummy, "monsoon", x, y)
                goto ____switch6_end
            end
            ::____switch6_case_3::
            do
                UnitAddAbilityBJ(
                    FourCC("A09J"),
                    dummy
                )
                IssuePointOrder(dummy, "rainoffire", x, y)
                goto ____switch6_end
            end
            ::____switch6_end::
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Void.VoidFissure"] = {initialized = false, cached = nil, loader = __module_144}
function __module_145()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.VoidWorshipper = {}
    local VoidWorshipper = ____exports.VoidWorshipper
    VoidWorshipper.name = "VoidWorshipper"
    VoidWorshipper.__index = VoidWorshipper
    VoidWorshipper.prototype = {}
    VoidWorshipper.prototype.__index = __TS__Index(VoidWorshipper.prototype)
    VoidWorshipper.prototype.__newindex = __TS__NewIndex(VoidWorshipper.prototype)
    VoidWorshipper.prototype.constructor = VoidWorshipper
    VoidWorshipper.____super = Tower
    setmetatable(VoidWorshipper, VoidWorshipper.____super)
    setmetatable(VoidWorshipper.prototype, VoidWorshipper.____super.prototype)
    function VoidWorshipper.new(...)
        local self = setmetatable({}, VoidWorshipper.prototype)
        self:____constructor(...)
        return self
    end
    function VoidWorshipper.prototype.____constructor(self, tower, owner, game)
        Tower.prototype.____constructor(self, tower, owner, game)
        self.owner:SetVoidFragmentTick(
            self.owner:GetVoidFragmentTick() + 1
        )
    end
    function VoidWorshipper.prototype.MaxCount(self)
        return 40
    end
    function VoidWorshipper.prototype.Action(self)
        local fragments = self.owner:GetVoidFragments()
        local newDmg = math.floor(
            14 + IMinBJ(35, 0.1 * fragments)
        )
        BlzSetUnitBaseDamage(self.tower, newDmg, 0)
    end
    function VoidWorshipper.prototype.GetTickModulo(self)
        return 9
    end
    function VoidWorshipper.prototype.SellAction(self)
        self.owner:SetVoidFragmentTick(
            self.owner:GetVoidFragmentTick() - 1
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Void.VoidWorshipper"] = {initialized = false, cached = nil, loader = __module_145}
function __module_146()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.VoidBeing = {}
    local VoidBeing = ____exports.VoidBeing
    VoidBeing.name = "VoidBeing"
    VoidBeing.__index = VoidBeing
    VoidBeing.prototype = {}
    VoidBeing.prototype.__index = __TS__Index(VoidBeing.prototype)
    VoidBeing.prototype.__newindex = __TS__NewIndex(VoidBeing.prototype)
    VoidBeing.prototype.constructor = VoidBeing
    VoidBeing.____super = Tower
    setmetatable(VoidBeing, VoidBeing.____super)
    setmetatable(VoidBeing.prototype, VoidBeing.____super.prototype)
    function VoidBeing.new(...)
        local self = setmetatable({}, VoidBeing.prototype)
        self:____constructor(...)
        return self
    end
    function VoidBeing.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if u == self.tower then
            SetUnitLifeBJ(
                self.tower,
                GetUnitStateSwap(UNIT_STATE_LIFE, self.tower) + 2
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Void.VoidBeing"] = {initialized = false, cached = nil, loader = __module_146}
function __module_147()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.VoidCorrupter = {}
    local VoidCorrupter = ____exports.VoidCorrupter
    VoidCorrupter.name = "VoidCorrupter"
    VoidCorrupter.__index = VoidCorrupter
    VoidCorrupter.prototype = {}
    VoidCorrupter.prototype.__index = __TS__Index(VoidCorrupter.prototype)
    VoidCorrupter.prototype.__newindex = __TS__NewIndex(VoidCorrupter.prototype)
    VoidCorrupter.prototype.constructor = VoidCorrupter
    VoidCorrupter.____super = Tower
    setmetatable(VoidCorrupter, VoidCorrupter.____super)
    setmetatable(VoidCorrupter.prototype, VoidCorrupter.____super.prototype)
    function VoidCorrupter.new(...)
        local self = setmetatable({}, VoidCorrupter.prototype)
        self:____constructor(...)
        return self
    end
    function VoidCorrupter.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            BlzSetUnitArmor(
                target,
                BlzGetUnitArmor(target) - 0.25
            )
        end
    end
    function VoidCorrupter.prototype.KillingAction(self)
        if GetKillingUnitBJ() == self.tower then
            CreateTextTagUnitBJ("TRIGSTR_7925", self.tower, 0, 10, 100, 100, 100, 0)
            SetTextTagVelocityBJ(
                GetLastCreatedTextTag(),
                40,
                90
            )
            SetTextTagPermanentBJ(
                GetLastCreatedTextTag(),
                false
            )
            SetTextTagLifespanBJ(
                GetLastCreatedTextTag(),
                4
            )
            SetTextTagFadepointBJ(
                GetLastCreatedTextTag(),
                2
            )
            self.owner:SetVoidFragments(
                self.owner:GetVoidFragments() + 5
            )
            if self.owner:getVoidBuilder() then
                SetUnitManaBJ(
                    self.owner:getVoidBuilder(),
                    self.owner:GetVoidFragments()
                )
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Void.VoidCorrupter"] = {initialized = false, cached = nil, loader = __module_147}
function __module_148()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.VoidWorshipperHusk = {}
    local VoidWorshipperHusk = ____exports.VoidWorshipperHusk
    VoidWorshipperHusk.name = "VoidWorshipperHusk"
    VoidWorshipperHusk.__index = VoidWorshipperHusk
    VoidWorshipperHusk.prototype = {}
    VoidWorshipperHusk.prototype.__index = __TS__Index(VoidWorshipperHusk.prototype)
    VoidWorshipperHusk.prototype.__newindex = __TS__NewIndex(VoidWorshipperHusk.prototype)
    VoidWorshipperHusk.prototype.constructor = VoidWorshipperHusk
    VoidWorshipperHusk.____super = Tower
    setmetatable(VoidWorshipperHusk, VoidWorshipperHusk.____super)
    setmetatable(VoidWorshipperHusk.prototype, VoidWorshipperHusk.____super.prototype)
    function VoidWorshipperHusk.new(...)
        local self = setmetatable({}, VoidWorshipperHusk.prototype)
        self:____constructor(...)
        return self
    end
    function VoidWorshipperHusk.prototype.____constructor(self, tower, owner, game)
        Tower.prototype.____constructor(self, tower, owner, game)
        self.owner:SetVoidFragmentTick(
            self.owner:GetVoidFragmentTick() + 1
        )
    end
    function VoidWorshipperHusk.prototype.SellAction(self)
        self.owner:SetVoidFragmentTick(
            self.owner:GetVoidFragmentTick() - 1
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Void.VoidWorshipperHusk"] = {initialized = false, cached = nil, loader = __module_148}
function __module_149()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____VoidPriest = require("app.src.World.Entity.Tower.Races.Void.VoidPriest")
    local VoidPriest = ____VoidPriest.VoidPriest
    local ____VoidFissure = require("app.src.World.Entity.Tower.Races.Void.VoidFissure")
    local VoidFissure = ____VoidFissure.VoidFissure
    local ____VoidWorshipper = require("app.src.World.Entity.Tower.Races.Void.VoidWorshipper")
    local VoidWorshipper = ____VoidWorshipper.VoidWorshipper
    local ____VoidBeing = require("app.src.World.Entity.Tower.Races.Void.VoidBeing")
    local VoidBeing = ____VoidBeing.VoidBeing
    local ____VoidCorrupter = require("app.src.World.Entity.Tower.Races.Void.VoidCorrupter")
    local VoidCorrupter = ____VoidCorrupter.VoidCorrupter
    local ____VoidWorshipperHusk = require("app.src.World.Entity.Tower.Races.Void.VoidWorshipperHusk")
    local VoidWorshipperHusk = ____VoidWorshipperHusk.VoidWorshipperHusk
    ____exports.VoidTowers = {}
    local VoidTowers = ____exports.VoidTowers
    VoidTowers.name = "VoidTowers"
    VoidTowers.__index = VoidTowers
    VoidTowers.prototype = {}
    VoidTowers.prototype.__index = VoidTowers.prototype
    VoidTowers.prototype.constructor = VoidTowers
    VoidTowers.____super = RaceTowers
    setmetatable(VoidTowers, VoidTowers.____super)
    setmetatable(VoidTowers.prototype, VoidTowers.____super.prototype)
    function VoidTowers.new(...)
        local self = setmetatable({}, VoidTowers.prototype)
        self:____constructor(...)
        return self
    end
    function VoidTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("h02F"),
            VoidPriest
        )
        list:add(
            FourCC("h01M"),
            VoidFissure
        )
        list:add(
            FourCC("h02G"),
            VoidWorshipper
        )
        list:add(
            FourCC("h02S"),
            VoidWorshipperHusk
        )
        list:add(
            FourCC("h00T"),
            VoidBeing
        )
        list:add(
            FourCC("h01A"),
            VoidCorrupter
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Void.VoidTowers"] = {initialized = false, cached = nil, loader = __module_149}
function __module_150()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.NagaSlave = {}
    local NagaSlave = ____exports.NagaSlave
    NagaSlave.name = "NagaSlave"
    NagaSlave.__index = NagaSlave
    NagaSlave.prototype = {}
    NagaSlave.prototype.__index = __TS__Index(NagaSlave.prototype)
    NagaSlave.prototype.__newindex = __TS__NewIndex(NagaSlave.prototype)
    NagaSlave.prototype.constructor = NagaSlave
    NagaSlave.____super = Tower
    setmetatable(NagaSlave, NagaSlave.____super)
    setmetatable(NagaSlave.prototype, NagaSlave.____super.prototype)
    function NagaSlave.new(...)
        local self = setmetatable({}, NagaSlave.prototype)
        self:____constructor(...)
        return self
    end
    function NagaSlave.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if u == self.tower then
            if not (GetUnitAbilityLevel(
                self.tower,
                FourCC("A09U")
            ) > 0) then
                return
            end
            BlzSetUnitBaseDamage(
                self.tower,
                BlzGetUnitBaseDamage(self.tower, 0) + 20,
                0
            )
            self:DoSpell(self.game)
        end
    end
    function NagaSlave.prototype.DoSpell(self, game)
        local randomInt = Util:RandomInt(1, 4)
        local target = game.gameDamageEngineGlobals.udg_DamageEventTarget
        if not target then
            return
        end
        if randomInt == 1 or randomInt == 2 then
            local spellPoint = GetUnitLoc(self.tower)
            local tempUnit = CreateUnitAtLocSaveLast(
                self.owner.wcPlayer,
                FourCC("u008"),
                spellPoint,
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                3,
                FourCC("BTLF"),
                tempUnit
            )
            if randomInt == 1 then
                UnitAddAbilityBJ(
                    FourCC("A09W"),
                    tempUnit
                )
                IssueTargetOrderBJ(tempUnit, "thunderbolt", target)
            else
                UnitAddAbilityBJ(
                    FourCC("A09X"),
                    tempUnit
                )
                IssueTargetOrderBJ(tempUnit, "forkedlightning", target)
            end
            RemoveLocation(spellPoint)
        end
    end
    function NagaSlave.prototype.EndOfRoundAction(self)
        BlzSetUnitBaseDamage(self.tower, 19, 0)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.WorkersUnion.NagaSlave"] = {initialized = false, cached = nil, loader = __module_150}
function __module_151()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.OrcPeon = {}
    local OrcPeon = ____exports.OrcPeon
    OrcPeon.name = "OrcPeon"
    OrcPeon.__index = OrcPeon
    OrcPeon.prototype = {}
    OrcPeon.prototype.__index = __TS__Index(OrcPeon.prototype)
    OrcPeon.prototype.__newindex = __TS__NewIndex(OrcPeon.prototype)
    OrcPeon.prototype.constructor = OrcPeon
    OrcPeon.____super = Tower
    setmetatable(OrcPeon, OrcPeon.____super)
    setmetatable(OrcPeon.prototype, OrcPeon.____super.prototype)
    function OrcPeon.new(...)
        local self = setmetatable({}, OrcPeon.prototype)
        self:____constructor(...)
        return self
    end
    function OrcPeon.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if u == self.tower then
            if not (GetUnitAbilityLevel(
                self.tower,
                FourCC("A09Q")
            ) > 0) then
                return
            end
            BlzSetUnitBaseDamage(
                self.tower,
                BlzGetUnitBaseDamage(self.tower, 0) + 1,
                0
            )
        end
    end
    function OrcPeon.prototype.EndOfRoundAction(self)
        BlzSetUnitBaseDamage(self.tower, 0, 0)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.WorkersUnion.OrcPeon"] = {initialized = false, cached = nil, loader = __module_151}
function __module_152()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.HumanPeasant = {}
    local HumanPeasant = ____exports.HumanPeasant
    HumanPeasant.name = "HumanPeasant"
    HumanPeasant.__index = HumanPeasant
    HumanPeasant.prototype = {}
    HumanPeasant.prototype.__index = __TS__Index(HumanPeasant.prototype)
    HumanPeasant.prototype.__newindex = __TS__NewIndex(HumanPeasant.prototype)
    HumanPeasant.prototype.constructor = HumanPeasant
    HumanPeasant.____super = Tower
    setmetatable(HumanPeasant, HumanPeasant.____super)
    setmetatable(HumanPeasant.prototype, HumanPeasant.____super.prototype)
    function HumanPeasant.new(...)
        local self = setmetatable({}, HumanPeasant.prototype)
        self:____constructor(...)
        return self
    end
    function HumanPeasant.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if u == self.tower then
            if not (GetUnitAbilityLevel(
                self.tower,
                FourCC("A09T")
            ) > 0) then
                return
            end
            BlzSetUnitBaseDamage(
                self.tower,
                BlzGetUnitBaseDamage(self.tower, 0) + 2,
                0
            )
        end
    end
    function HumanPeasant.prototype.EndOfRoundAction(self)
        BlzSetUnitBaseDamage(self.tower, 9, 0)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.WorkersUnion.HumanPeasant"] = {initialized = false, cached = nil, loader = __module_152}
function __module_153()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.UndeadAcolyte = {}
    local UndeadAcolyte = ____exports.UndeadAcolyte
    UndeadAcolyte.name = "UndeadAcolyte"
    UndeadAcolyte.__index = UndeadAcolyte
    UndeadAcolyte.prototype = {}
    UndeadAcolyte.prototype.__index = __TS__Index(UndeadAcolyte.prototype)
    UndeadAcolyte.prototype.__newindex = __TS__NewIndex(UndeadAcolyte.prototype)
    UndeadAcolyte.prototype.constructor = UndeadAcolyte
    UndeadAcolyte.____super = Tower
    setmetatable(UndeadAcolyte, UndeadAcolyte.____super)
    setmetatable(UndeadAcolyte.prototype, UndeadAcolyte.____super.prototype)
    function UndeadAcolyte.new(...)
        local self = setmetatable({}, UndeadAcolyte.prototype)
        self:____constructor(...)
        return self
    end
    function UndeadAcolyte.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if self.game.gameDamageEngineGlobals.udg_DamageEventAOE ~= 1 then
            return
        end
        if u == self.tower then
            if not (GetUnitAbilityLevel(
                self.tower,
                FourCC("A09S")
            ) > 0) then
                return
            end
            BlzSetUnitBaseDamage(
                self.tower,
                BlzGetUnitBaseDamage(self.tower, 0) + 5,
                0
            )
        end
    end
    function UndeadAcolyte.prototype.EndOfRoundAction(self)
        BlzSetUnitBaseDamage(self.tower, 4, 0)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.WorkersUnion.UndeadAcolyte"] = {initialized = false, cached = nil, loader = __module_153}
function __module_154()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.NightElfWisp = {}
    local NightElfWisp = ____exports.NightElfWisp
    NightElfWisp.name = "NightElfWisp"
    NightElfWisp.__index = NightElfWisp
    NightElfWisp.prototype = {}
    NightElfWisp.prototype.__index = __TS__Index(NightElfWisp.prototype)
    NightElfWisp.prototype.__newindex = __TS__NewIndex(NightElfWisp.prototype)
    NightElfWisp.prototype.constructor = NightElfWisp
    NightElfWisp.____super = Tower
    setmetatable(NightElfWisp, NightElfWisp.____super)
    setmetatable(NightElfWisp.prototype, NightElfWisp.____super.prototype)
    function NightElfWisp.new(...)
        local self = setmetatable({}, NightElfWisp.prototype)
        self:____constructor(...)
        return self
    end
    function NightElfWisp.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if self.game.gameDamageEngineGlobals.udg_DamageEventAOE ~= 1 then
            return
        end
        if u == self.tower then
            if not (GetUnitAbilityLevel(
                self.tower,
                FourCC("A09V")
            ) > 0) then
                return
            end
            BlzSetUnitBaseDamage(
                self.tower,
                BlzGetUnitBaseDamage(self.tower, 0) + 40,
                0
            )
        end
    end
    function NightElfWisp.prototype.GenericAttack(self)
        IssueImmediateOrderBJ(self.tower, "stomp")
    end
    function NightElfWisp.prototype.EndOfRoundAction(self)
        BlzSetUnitBaseDamage(self.tower, 39, 0)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.WorkersUnion.NightElfWisp"] = {initialized = false, cached = nil, loader = __module_154}
function __module_155()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____NagaSlave = require("app.src.World.Entity.Tower.Races.WorkersUnion.NagaSlave")
    local NagaSlave = ____NagaSlave.NagaSlave
    local ____OrcPeon = require("app.src.World.Entity.Tower.Races.WorkersUnion.OrcPeon")
    local OrcPeon = ____OrcPeon.OrcPeon
    local ____HumanPeasant = require("app.src.World.Entity.Tower.Races.WorkersUnion.HumanPeasant")
    local HumanPeasant = ____HumanPeasant.HumanPeasant
    local ____UndeadAcolyte = require("app.src.World.Entity.Tower.Races.WorkersUnion.UndeadAcolyte")
    local UndeadAcolyte = ____UndeadAcolyte.UndeadAcolyte
    local ____NightElfWisp = require("app.src.World.Entity.Tower.Races.WorkersUnion.NightElfWisp")
    local NightElfWisp = ____NightElfWisp.NightElfWisp
    ____exports.WorkersUnionTowers = {}
    local WorkersUnionTowers = ____exports.WorkersUnionTowers
    WorkersUnionTowers.name = "WorkersUnionTowers"
    WorkersUnionTowers.__index = WorkersUnionTowers
    WorkersUnionTowers.prototype = {}
    WorkersUnionTowers.prototype.__index = WorkersUnionTowers.prototype
    WorkersUnionTowers.prototype.constructor = WorkersUnionTowers
    WorkersUnionTowers.____super = RaceTowers
    setmetatable(WorkersUnionTowers, WorkersUnionTowers.____super)
    setmetatable(WorkersUnionTowers.prototype, WorkersUnionTowers.____super.prototype)
    function WorkersUnionTowers.new(...)
        local self = setmetatable({}, WorkersUnionTowers.prototype)
        self:____constructor(...)
        return self
    end
    function WorkersUnionTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("h03G"),
            NagaSlave
        )
        list:add(
            FourCC("h03E"),
            OrcPeon
        )
        list:add(
            FourCC("h03F"),
            HumanPeasant
        )
        list:add(
            FourCC("h03I"),
            UndeadAcolyte
        )
        list:add(
            FourCC("h03H"),
            NightElfWisp
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.WorkersUnion.WorkersUnionTowers"] = {initialized = false, cached = nil, loader = __module_155}
function __module_156()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.CitadelOfNaxxramas = {}
    local CitadelOfNaxxramas = ____exports.CitadelOfNaxxramas
    CitadelOfNaxxramas.name = "CitadelOfNaxxramas"
    CitadelOfNaxxramas.__index = CitadelOfNaxxramas
    CitadelOfNaxxramas.prototype = {}
    CitadelOfNaxxramas.prototype.__index = __TS__Index(CitadelOfNaxxramas.prototype)
    CitadelOfNaxxramas.prototype.__newindex = __TS__NewIndex(CitadelOfNaxxramas.prototype)
    CitadelOfNaxxramas.prototype.constructor = CitadelOfNaxxramas
    CitadelOfNaxxramas.____super = Tower
    setmetatable(CitadelOfNaxxramas, CitadelOfNaxxramas.____super)
    setmetatable(CitadelOfNaxxramas.prototype, CitadelOfNaxxramas.____super.prototype)
    function CitadelOfNaxxramas.new(...)
        local self = setmetatable({}, CitadelOfNaxxramas.prototype)
        self:____constructor(...)
        return self
    end
    function CitadelOfNaxxramas.prototype.MaxCount(self)
        return 1
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Naxxramas.CitadelOfNaxxramas"] = {initialized = false, cached = nil, loader = __module_156}
function __module_157()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.StalaggFeugen = {}
    local StalaggFeugen = ____exports.StalaggFeugen
    StalaggFeugen.name = "StalaggFeugen"
    StalaggFeugen.__index = StalaggFeugen
    StalaggFeugen.prototype = {}
    StalaggFeugen.prototype.__index = __TS__Index(StalaggFeugen.prototype)
    StalaggFeugen.prototype.__newindex = __TS__NewIndex(StalaggFeugen.prototype)
    StalaggFeugen.prototype.constructor = StalaggFeugen
    StalaggFeugen.____super = Tower
    setmetatable(StalaggFeugen, StalaggFeugen.____super)
    setmetatable(StalaggFeugen.prototype, StalaggFeugen.____super.prototype)
    function StalaggFeugen.new(...)
        local self = setmetatable({}, StalaggFeugen.prototype)
        self:____constructor(...)
        return self
    end
    function StalaggFeugen.prototype.____constructor(self, tower, owner, game)
        Tower.prototype.____constructor(self, tower, owner, game)
        self:AddUpgrade()
    end
    function StalaggFeugen.prototype.AddUpgrade(self)
        local loc = GetUnitLoc(self.tower)
        local grp = GetUnitsInRangeOfLocMatching(
            182,
            loc,
            Condition(
                function() return self:InitializeUpgradeGroupConditions() end
            )
        )
        RemoveLocation(loc)
        DestroyGroup(grp)
    end
    function StalaggFeugen.prototype.Action(self)
        self:AddUpgrade()
    end
    function StalaggFeugen.prototype.GetTickModulo(self)
        return 599
    end
    function StalaggFeugen.prototype.InitializeUpgradeGroupConditions(self)
        if not IsUnitType(
            GetFilterUnit(),
            UNIT_TYPE_STRUCTURE
        ) then
            return false
        end
        if GetUnitTypeId(
            GetFilterUnit()
        ) ~= FourCC("oC7D") and GetUnitTypeId(
            GetFilterUnit()
        ) ~= FourCC("oC7E") then
            return false
        end
        if GetFilterUnit() == self.tower then
            return false
        end
        if GetUnitAbilityLevel(
            GetFilterUnit(),
            FourCC("A0F5")
        ) > 0 then
            return false
        end
        UnitAddAbilityBJ(
            FourCC("A0F5"),
            GetFilterUnit()
        )
        return true
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Naxxramas.StalaggFeugen"] = {initialized = false, cached = nil, loader = __module_157}
function __module_158()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.KelThuzad = {}
    local KelThuzad = ____exports.KelThuzad
    KelThuzad.name = "KelThuzad"
    KelThuzad.__index = KelThuzad
    KelThuzad.prototype = {}
    KelThuzad.prototype.__index = __TS__Index(KelThuzad.prototype)
    KelThuzad.prototype.__newindex = __TS__NewIndex(KelThuzad.prototype)
    KelThuzad.prototype.constructor = KelThuzad
    KelThuzad.____super = Tower
    setmetatable(KelThuzad, KelThuzad.____super)
    setmetatable(KelThuzad.prototype, KelThuzad.____super.prototype)
    function KelThuzad.new(...)
        local self = setmetatable({}, KelThuzad.prototype)
        self:____constructor(...)
        return self
    end
    function KelThuzad.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            BlzSetUnitArmor(
                target,
                BlzGetUnitArmor(target) - 0.1 * (1 - (GetUnitMoveSpeed(target) / GetUnitDefaultMoveSpeed(target)))
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Naxxramas.KelThuzad"] = {initialized = false, cached = nil, loader = __module_158}
function __module_159()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Sapphiron = {}
    local Sapphiron = ____exports.Sapphiron
    Sapphiron.name = "Sapphiron"
    Sapphiron.__index = Sapphiron
    Sapphiron.prototype = {}
    Sapphiron.prototype.__index = __TS__Index(Sapphiron.prototype)
    Sapphiron.prototype.__newindex = __TS__NewIndex(Sapphiron.prototype)
    Sapphiron.prototype.constructor = Sapphiron
    Sapphiron.____super = Tower
    setmetatable(Sapphiron, Sapphiron.____super)
    setmetatable(Sapphiron.prototype, Sapphiron.____super.prototype)
    function Sapphiron.new(...)
        local self = setmetatable({}, Sapphiron.prototype)
        self:____constructor(...)
        return self
    end
    function Sapphiron.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if u == self.tower then
            if GetUnitStateSwap(UNIT_STATE_MANA, self.tower) >= 100 then
                SetUnitManaBJ(
                    self.tower,
                    GetUnitStateSwap(UNIT_STATE_MANA, self.tower) - 100
                )
                if GetUnitAbilityLevelSwapped(
                    FourCC("A0F9"),
                    self.tower
                ) <= 6 then
                    IncUnitAbilityLevelSwapped(
                        FourCC("A0F9"),
                        self.tower
                    )
                end
            end
            SetUnitManaBJ(
                self.tower,
                GetUnitStateSwap(UNIT_STATE_MANA, u) + 1
            )
        end
    end
    function Sapphiron.prototype.EndOfRoundAction(self)
        SetUnitAbilityLevelSwapped(
            FourCC("A0F9"),
            self.tower,
            1
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Naxxramas.Sapphiron"] = {initialized = false, cached = nil, loader = __module_159}
function __module_160()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Maexxna = {}
    local Maexxna = ____exports.Maexxna
    Maexxna.name = "Maexxna"
    Maexxna.__index = Maexxna
    Maexxna.prototype = {}
    Maexxna.prototype.__index = __TS__Index(Maexxna.prototype)
    Maexxna.prototype.__newindex = __TS__NewIndex(Maexxna.prototype)
    Maexxna.prototype.constructor = Maexxna
    Maexxna.____super = Tower
    setmetatable(Maexxna, Maexxna.____super)
    setmetatable(Maexxna.prototype, Maexxna.____super.prototype)
    function Maexxna.new(...)
        local self = setmetatable({}, Maexxna.prototype)
        self:____constructor(...)
        return self
    end
    function Maexxna.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                20,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A0FA"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "acidbomb", target)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Naxxramas.Maexxna"] = {initialized = false, cached = nil, loader = __module_160}
function __module_161()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    ____exports.Thaddius = {}
    local Thaddius = ____exports.Thaddius
    Thaddius.name = "Thaddius"
    Thaddius.__index = Thaddius
    Thaddius.prototype = {}
    Thaddius.prototype.__index = __TS__Index(Thaddius.prototype)
    Thaddius.prototype.__newindex = __TS__NewIndex(Thaddius.prototype)
    Thaddius.prototype.constructor = Thaddius
    Thaddius.____super = Tower
    setmetatable(Thaddius, Thaddius.____super)
    setmetatable(Thaddius.prototype, Thaddius.____super.prototype)
    function Thaddius.new(...)
        local self = setmetatable({}, Thaddius.prototype)
        self:____constructor(...)
        return self
    end
    function Thaddius.prototype.AttackAction(self)
        local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if u == self.tower and target then
            local tempUnit = CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                GetUnitX(self.tower),
                GetUnitY(self.tower),
                bj_UNIT_FACING
            )
            UnitApplyTimedLifeBJ(
                2,
                FourCC("BTLF"),
                tempUnit
            )
            UnitAddAbilityBJ(
                FourCC("A0FC"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "chainlightning", target)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Naxxramas.Thaddius"] = {initialized = false, cached = nil, loader = __module_161}
function __module_162()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
    local RaceTowers = ____RaceTowers.RaceTowers
    local ____CitadelOfNaxxramas = require("app.src.World.Entity.Tower.Races.Naxxramas.CitadelOfNaxxramas")
    local CitadelOfNaxxramas = ____CitadelOfNaxxramas.CitadelOfNaxxramas
    local ____StalaggFeugen = require("app.src.World.Entity.Tower.Races.Naxxramas.StalaggFeugen")
    local StalaggFeugen = ____StalaggFeugen.StalaggFeugen
    local ____KelThuzad = require("app.src.World.Entity.Tower.Races.Naxxramas.KelThuzad")
    local KelThuzad = ____KelThuzad.KelThuzad
    local ____Sapphiron = require("app.src.World.Entity.Tower.Races.Naxxramas.Sapphiron")
    local Sapphiron = ____Sapphiron.Sapphiron
    local ____Maexxna = require("app.src.World.Entity.Tower.Races.Naxxramas.Maexxna")
    local Maexxna = ____Maexxna.Maexxna
    local ____Thaddius = require("app.src.World.Entity.Tower.Races.Naxxramas.Thaddius")
    local Thaddius = ____Thaddius.Thaddius
    ____exports.NaxxramasTowers = {}
    local NaxxramasTowers = ____exports.NaxxramasTowers
    NaxxramasTowers.name = "NaxxramasTowers"
    NaxxramasTowers.__index = NaxxramasTowers
    NaxxramasTowers.prototype = {}
    NaxxramasTowers.prototype.__index = NaxxramasTowers.prototype
    NaxxramasTowers.prototype.constructor = NaxxramasTowers
    NaxxramasTowers.____super = RaceTowers
    setmetatable(NaxxramasTowers, NaxxramasTowers.____super)
    setmetatable(NaxxramasTowers.prototype, NaxxramasTowers.____super.prototype)
    function NaxxramasTowers.new(...)
        local self = setmetatable({}, NaxxramasTowers.prototype)
        self:____constructor(...)
        return self
    end
    function NaxxramasTowers.prototype.AddTowersToList(self, list)
        list:add(
            FourCC("oC7C"),
            CitadelOfNaxxramas
        )
        list:add(
            FourCC("oC7D"),
            StalaggFeugen
        )
        list:add(
            FourCC("oC7E"),
            StalaggFeugen
        )
        list:add(
            FourCC("oC7K"),
            KelThuzad
        )
        list:add(
            FourCC("oC7J"),
            Sapphiron
        )
        list:add(
            FourCC("oC7G"),
            Maexxna
        )
        list:add(
            FourCC("oC7F"),
            Thaddius
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.Naxxramas.NaxxramasTowers"] = {initialized = false, cached = nil, loader = __module_162}
function __module_163()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____TowerMap = require("app.src.World.Entity.Tower.Specs.TowerMap")
    local TowerMap = ____TowerMap.TowerMap
    local ____AllianceOfBladesTowers = require("app.src.World.Entity.Tower.Races.AllianceOfBlades.AllianceOfBladesTowers")
    local AllianceOfBladesTowers = ____AllianceOfBladesTowers.AllianceOfBladesTowers
    local ____ArachnidTowers = require("app.src.World.Entity.Tower.Races.Arachnid.ArachnidTowers")
    local ArachnidTowers = ____ArachnidTowers.ArachnidTowers
    local ____AviariesTowers = require("app.src.World.Entity.Tower.Races.Aviaries.AviariesTowers")
    local AviariesTowers = ____AviariesTowers.AviariesTowers
    local ____CavernousCreaturesTowers = require("app.src.World.Entity.Tower.Races.CavernousCreatures.CavernousCreaturesTowers")
    local CavernousCreaturesTowers = ____CavernousCreaturesTowers.CavernousCreaturesTowers
    local ____CorruptedNightElfTowers = require("app.src.World.Entity.Tower.Races.CorruptedNightElves.CorruptedNightElfTowers")
    local CorruptedNightElfTowers = ____CorruptedNightElfTowers.CorruptedNightElfTowers
    local ____DemonTowers = require("app.src.World.Entity.Tower.Races.Demon.DemonTowers")
    local DemonTowers = ____DemonTowers.DemonTowers
    local ____DraeneiTowers = require("app.src.World.Entity.Tower.Races.Draenei.DraeneiTowers")
    local DraeneiTowers = ____DraeneiTowers.DraeneiTowers
    local ____DwarfTowers = require("app.src.World.Entity.Tower.Races.Dwaven.DwarfTowers")
    local DwarfTowers = ____DwarfTowers.DwarfTowers
    local ____ElementalistTowers = require("app.src.World.Entity.Tower.Races.Elementalist.ElementalistTowers")
    local ElementalistTowers = ____ElementalistTowers.ElementalistTowers
    local ____ForestTrollTowers = require("app.src.World.Entity.Tower.Races.ForestTrolls.ForestTrollTowers")
    local ForestTrollTowers = ____ForestTrollTowers.ForestTrollTowers
    local ____ForsakenTowers = require("app.src.World.Entity.Tower.Races.Forsaken.ForsakenTowers")
    local ForsakenTowers = ____ForsakenTowers.ForsakenTowers
    local ____GalaxyTowers = require("app.src.World.Entity.Tower.Races.Galaxy.GalaxyTowers")
    local GalaxyTowers = ____GalaxyTowers.GalaxyTowers
    local ____GiantsTowers = require("app.src.World.Entity.Tower.Races.Giants.GiantsTowers")
    local GiantsTowers = ____GiantsTowers.GiantsTowers
    local ____GoblinTowers = require("app.src.World.Entity.Tower.Races.Goblin.GoblinTowers")
    local GoblinTowers = ____GoblinTowers.GoblinTowers
    local ____HighElvenTowers = require("app.src.World.Entity.Tower.Races.HighElven.HighElvenTowers")
    local HighElvenTowers = ____HighElvenTowers.HighElvenTowers
    local ____HumanTowers = require("app.src.World.Entity.Tower.Races.Human.HumanTowers")
    local HumanTowers = ____HumanTowers.HumanTowers
    local ____IceTrollTowers = require("app.src.World.Entity.Tower.Races.IceTrolls.IceTrollTowers")
    local IceTrollTowers = ____IceTrollTowers.IceTrollTowers
    local ____NightElfTowers = require("app.src.World.Entity.Tower.Races.NightElf.NightElfTowers")
    local NightElfTowers = ____NightElfTowers.NightElfTowers
    local ____OrcStrongholdTowers = require("app.src.World.Entity.Tower.Races.OrcStronghold.OrcStrongholdTowers")
    local OrcStrongholdTowers = ____OrcStrongholdTowers.OrcStrongholdTowers
    local ____OutlandTowers = require("app.src.World.Entity.Tower.Races.Outland.OutlandTowers")
    local OutlandTowers = ____OutlandTowers.OutlandTowers
    local ____ShrineOfBuffsTowers = require("app.src.World.Entity.Tower.Races.ShrineOfBuffs.ShrineOfBuffsTowers")
    local ShrineOfBuffsTowers = ____ShrineOfBuffsTowers.ShrineOfBuffsTowers
    local ____SummonsTowers = require("app.src.World.Entity.Tower.Races.Summons.SummonsTowers")
    local SummonsTowers = ____SummonsTowers.SummonsTowers
    local ____TavernTowers = require("app.src.World.Entity.Tower.Races.Tavern.TavernTowers")
    local TavernTowers = ____TavernTowers.TavernTowers
    local ____UndeadTowers = require("app.src.World.Entity.Tower.Races.Undead.UndeadTowers")
    local UndeadTowers = ____UndeadTowers.UndeadTowers
    local ____UniqueTowers = require("app.src.World.Entity.Tower.Races.Unique.UniqueTowers")
    local UniqueTowers = ____UniqueTowers.UniqueTowers
    local ____VoidTowers = require("app.src.World.Entity.Tower.Races.Void.VoidTowers")
    local VoidTowers = ____VoidTowers.VoidTowers
    local ____WorkersUnionTowers = require("app.src.World.Entity.Tower.Races.WorkersUnion.WorkersUnionTowers")
    local WorkersUnionTowers = ____WorkersUnionTowers.WorkersUnionTowers
    local ____AntiJuggleTower = require("app.src.World.Entity.AntiJuggle.AntiJuggleTower")
    local AntiJuggleTower = ____AntiJuggleTower.AntiJuggleTower
    local ____NaxxramasTowers = require("app.src.World.Entity.Tower.Races.Naxxramas.NaxxramasTowers")
    local NaxxramasTowers = ____NaxxramasTowers.NaxxramasTowers
    function ____exports.InitialiseAllRaceTowers(self)
        local _towerTypes = TowerMap.new()
        local races = {}
        __TS__ArrayPush(
            races,
            AllianceOfBladesTowers.new()
        )
        __TS__ArrayPush(
            races,
            ArachnidTowers.new()
        )
        __TS__ArrayPush(
            races,
            AviariesTowers.new()
        )
        __TS__ArrayPush(
            races,
            CavernousCreaturesTowers.new()
        )
        __TS__ArrayPush(
            races,
            CorruptedNightElfTowers.new()
        )
        __TS__ArrayPush(
            races,
            DemonTowers.new()
        )
        __TS__ArrayPush(
            races,
            DraeneiTowers.new()
        )
        __TS__ArrayPush(
            races,
            DwarfTowers.new()
        )
        __TS__ArrayPush(
            races,
            ElementalistTowers.new()
        )
        __TS__ArrayPush(
            races,
            ForestTrollTowers.new()
        )
        __TS__ArrayPush(
            races,
            ForsakenTowers.new()
        )
        __TS__ArrayPush(
            races,
            GalaxyTowers.new()
        )
        __TS__ArrayPush(
            races,
            GiantsTowers.new()
        )
        __TS__ArrayPush(
            races,
            GoblinTowers.new()
        )
        __TS__ArrayPush(
            races,
            HighElvenTowers.new()
        )
        __TS__ArrayPush(
            races,
            HumanTowers.new()
        )
        __TS__ArrayPush(
            races,
            IceTrollTowers.new()
        )
        __TS__ArrayPush(
            races,
            NightElfTowers.new()
        )
        __TS__ArrayPush(
            races,
            OrcStrongholdTowers.new()
        )
        __TS__ArrayPush(
            races,
            OutlandTowers.new()
        )
        __TS__ArrayPush(
            races,
            ShrineOfBuffsTowers.new()
        )
        __TS__ArrayPush(
            races,
            SummonsTowers.new()
        )
        __TS__ArrayPush(
            races,
            TavernTowers.new()
        )
        __TS__ArrayPush(
            races,
            UndeadTowers.new()
        )
        __TS__ArrayPush(
            races,
            UniqueTowers.new()
        )
        __TS__ArrayPush(
            races,
            NaxxramasTowers.new()
        )
        __TS__ArrayPush(
            races,
            VoidTowers.new()
        )
        __TS__ArrayPush(
            races,
            WorkersUnionTowers.new()
        )
        __TS__ArrayForEach(
            races,
            function(____, race) return race:AddTowersToList(_towerTypes) end
        )
        _towerTypes:add(
            FourCC("uC14"),
            AntiJuggleTower
        )
        return _towerTypes
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.Races.RaceInitialiser"] = {initialized = false, cached = nil, loader = __module_163}
function __module_164()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    local settings = require("app.src.World.GlobalSettings")
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
    local Tower = ____Tower.Tower
    local ____LootBoxerHandler = require("app.src.World.Entity.Tower.Races.LootBoxer.LootBoxerHandler")
    local LootBoxerHandler = ____LootBoxerHandler.LootBoxerHandler
    local ____RaceInitialiser = require("app.src.World.Entity.Tower.Races.RaceInitialiser")
    local InitialiseAllRaceTowers = ____RaceInitialiser.InitialiseAllRaceTowers
    ____exports.TowerConstruction = {}
    local TowerConstruction = ____exports.TowerConstruction
    TowerConstruction.name = "TowerConstruction"
    TowerConstruction.__index = TowerConstruction
    TowerConstruction.prototype = {}
    TowerConstruction.prototype.____getters = {}
    TowerConstruction.prototype.__index = __TS__Index(TowerConstruction.prototype)
    TowerConstruction.prototype.constructor = TowerConstruction
    function TowerConstruction.new(...)
        local self = setmetatable({}, TowerConstruction.prototype)
        self:____constructor(...)
        return self
    end
    function TowerConstruction.prototype.____constructor(self, game)
        self.races = {}
        self.genericAttacks = Map.new()
        self.killingActions = Map.new()
        self.lootBoxerTowers = {
            FourCC("u044"),
            FourCC("u045"),
            FourCC("u047"),
            FourCC("u046"),
            FourCC("u048"),
            FourCC("u049"),
            FourCC("u04A"),
            FourCC("u04B"),
            FourCC("u04C")
        }
        self.game = game
        self._towerTypes = InitialiseAllRaceTowers(nil)
        self.lootBoxerHander = LootBoxerHandler.new(self, game)
        self.towerConstructTrigger = Trigger.new()
        self.towerConstructTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_CONSTRUCT_FINISH)
        self.towerConstructTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_UPGRADE_FINISH)
        self.towerConstructTrigger:AddAction(
            function() return self:ConstructionFinished() end
        )
        self.towerUpgradeTrigger = Trigger.new()
        self.towerUpgradeTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_UPGRADE_FINISH)
        self.towerUpgradeTrigger:AddAction(
            function() return self:UpgradeTower() end
        )
        self.genericAttackTrigger = Trigger.new()
        self.genericAttackTrigger:RegisterPlayerUnitEventSimple(
            Player(COLOUR.NAVY),
            EVENT_PLAYER_UNIT_ATTACKED
        )
        self.genericAttackTrigger:RegisterPlayerUnitEventSimple(
            Player(COLOUR.TURQUOISE),
            EVENT_PLAYER_UNIT_ATTACKED
        )
        self.genericAttackTrigger:RegisterPlayerUnitEventSimple(
            Player(COLOUR.VOILET),
            EVENT_PLAYER_UNIT_ATTACKED
        )
        self.genericAttackTrigger:RegisterPlayerUnitEventSimple(
            Player(COLOUR.WHEAT),
            EVENT_PLAYER_UNIT_ATTACKED
        )
        self.genericAttackTrigger:AddAction(
            function() return self:DoGenericTowerAttacks() end
        )
        self.killingActionsTrigger = Trigger.new()
        self.killingActionsTrigger:RegisterPlayerUnitEventSimple(
            Player(COLOUR.NAVY),
            EVENT_PLAYER_UNIT_DEATH
        )
        self.killingActionsTrigger:RegisterPlayerUnitEventSimple(
            Player(COLOUR.TURQUOISE),
            EVENT_PLAYER_UNIT_DEATH
        )
        self.killingActionsTrigger:RegisterPlayerUnitEventSimple(
            Player(COLOUR.VOILET),
            EVENT_PLAYER_UNIT_DEATH
        )
        self.killingActionsTrigger:RegisterPlayerUnitEventSimple(
            Player(COLOUR.WHEAT),
            EVENT_PLAYER_UNIT_DEATH
        )
        self.killingActionsTrigger:AddAction(
            function() return self:DoKillingTowerActions() end
        )
    end
    function TowerConstruction.prototype.____getters.towerTypes(self)
        return self._towerTypes
    end
    function TowerConstruction.prototype.UpgradeTower(self)
        local tower = GetTriggerUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(tower)
            )
        )
        if not owner then
            return
        end
        local instance = owner:GetTower(
            GetHandleIdBJ(tower)
        )
        if instance then
            instance:Sell()
            local newTower = self.game.worldMap.towerConstruction:SetupTower(tower, owner)
            newTower.towerValue = newTower.towerValue + instance.towerValue
        end
    end
    function TowerConstruction.prototype.ConstructionFinished(self)
        local tower = GetTriggerUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(tower)
            )
        )
        UnitRemoveAbilityBJ(
            FourCC("ARal"),
            tower
        )
        if not owner then
            return
        end
        self:SetupTower(tower, owner)
    end
    function TowerConstruction.prototype.SetupTower(self, tower, owner)
        local ObjectExtendsTower
        if self:isLootBoxer(tower) then
            tower = self.lootBoxerHander:handleLootBoxTower(
                tower,
                owner,
                __TS__ArrayIndexOf(
                    self.lootBoxerTowers,
                    GetUnitTypeId(tower)
                )
            )
            UnitRemoveAbilityBJ(
                FourCC("ARal"),
                tower
            )
        end
        local obj = self._towerTypes:get(
            GetUnitTypeId(tower)
        )
        if obj then
            ObjectExtendsTower = obj.new(tower, owner, self.game)
        else
            ObjectExtendsTower = Tower.new(tower, owner, self.game)
        end
        if ObjectExtendsTower:IsEndOfRoundTower() and self.game.worldMap.gameRoundHandler then
            self.game.worldMap.gameTurn:AddEndOfRoundTower(ObjectExtendsTower.UniqueID, ObjectExtendsTower)
        end
        if ObjectExtendsTower:IsAttackActionTower() then
            self.game.gameDamageEngine:AddInitialDamageEventTower(ObjectExtendsTower.UniqueID, ObjectExtendsTower)
        end
        if ObjectExtendsTower:IsInitialDamageModificationTower() then
            self.game.gameDamageEngine:AddInitialDamageModificationEventTower(ObjectExtendsTower.UniqueID, ObjectExtendsTower)
        end
        if ObjectExtendsTower:IsGenericAutoAttackTower() then
            self.genericAttacks:set(ObjectExtendsTower.UniqueID, ObjectExtendsTower)
        end
        if ObjectExtendsTower:IsKillingActionTower() then
            self.killingActions:set(ObjectExtendsTower.UniqueID, ObjectExtendsTower)
        end
        if ObjectExtendsTower:IsLimitedTower() then
            if owner.hasHybridRandomed then
                if __TS__ArrayFindIndex(
                    owner.hybridTowers,
                    function(____, elem) return elem == DecodeFourCC(
                        nil,
                        ObjectExtendsTower:GetTypeID()
                    ) end
                ) >= 0 or __TS__ArrayFindIndex(
                    owner.hybridTowers,
                    function() return "h03T" == DecodeFourCC(
                        nil,
                        ObjectExtendsTower:GetTypeID()
                    ) end
                ) >= 0 then
                    SetPlayerTechMaxAllowedSwap(
                        GetUnitTypeId(ObjectExtendsTower.tower),
                        ObjectExtendsTower:MaxCount(),
                        owner.wcPlayer
                    )
                end
            else
                SetPlayerTechMaxAllowedSwap(
                    GetUnitTypeId(ObjectExtendsTower.tower),
                    ObjectExtendsTower:MaxCount(),
                    owner.wcPlayer
                )
            end
        end
        if ObjectExtendsTower:IsConstructActionTower() then
            ObjectExtendsTower:ConstructionFinished()
        end
        if ObjectExtendsTower:IsTickingTower() then
            self.game.towerTicker:AddTickingTower(ObjectExtendsTower.UniqueID, ObjectExtendsTower)
        end
        if ObjectExtendsTower:IsTowerForceTower() then
            if owner.towerForces:has(
                ObjectExtendsTower:GetTypeID()
            ) then
                owner.towerForces:set(
                    ObjectExtendsTower:GetTypeID(),
                    owner.towerForces:get(
                        ObjectExtendsTower:GetTypeID()
                    ) + 1
                )
                for ____, towerx in ipairs(owner.towersArray) do
                    if towerx:IsTowerForceTower() and towerx.GetTypeID == ObjectExtendsTower.GetTypeID then
                        towerx:UpdateSize()
                    end
                end
            else
                owner.towerForces:set(
                    ObjectExtendsTower:GetTypeID(),
                    1
                )
            end
        end
        if ObjectExtendsTower:IsAreaEffectTower() then
            local area
            do
                local i = 0
                while i < #settings.PLAYER_AREAS do
                    if settings.PLAYER_AREAS[i + 1]:ContainsUnit(tower) then
                        area = i
                        break
                    end
                    i = i + 1
                end
            end
            if area then
                self.game.worldMap.playerSpawns[area + 1].areaTowers:set(ObjectExtendsTower.UniqueID, ObjectExtendsTower)
            else
                Log.Fatal(
                    tostring(
                        GetUnitName(tower)
                    ) .. " built outside of requires area. Please screenshot and report"
                )
            end
        end
        return ObjectExtendsTower
    end
    function TowerConstruction.prototype.DoGenericTowerAttacks(self)
        local generic = self.genericAttacks:get(
            GetHandleId(
                GetAttacker()
            )
        )
        if generic then
            generic:GenericAttack()
        end
    end
    function TowerConstruction.prototype.DoKillingTowerActions(self)
        local killing = self.killingActions:get(
            GetHandleId(
                GetKillingUnit()
            )
        )
        if killing then
            killing:KillingAction()
        end
    end
    function TowerConstruction.prototype.isLootBoxer(self, tower)
        return __TS__ArrayIndexOf(
            self.lootBoxerTowers,
            GetUnitTypeId(tower)
        ) > -1
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.TowerConstruction"] = {initialized = false, cached = nil, loader = __module_164}
function __module_165()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    ____exports.Effect = {}
    local Effect = ____exports.Effect
    Effect.name = "Effect"
    Effect.__index = Effect
    Effect.prototype = {}
    Effect.prototype.__index = Effect.prototype
    Effect.prototype.constructor = Effect
    function Effect.new(...)
        local self = setmetatable({}, Effect.prototype)
        self:____constructor(...)
        return self
    end
    function Effect.prototype.____constructor(self, eff)
        self.eff = eff
    end
    function Effect.prototype.Destroy(self)
        DestroyEffect(self.eff)
    end
    return ____exports
    
end
__modules["app.src.JassOverrides.Effect"] = {initialized = false, cached = nil, loader = __module_165}
function __module_166()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    ____exports.HologramCheckpointDistance = {}
    local HologramCheckpointDistance = ____exports.HologramCheckpointDistance
    HologramCheckpointDistance.name = "HologramCheckpointDistance"
    HologramCheckpointDistance.__index = HologramCheckpointDistance
    HologramCheckpointDistance.prototype = {}
    HologramCheckpointDistance.prototype.__index = HologramCheckpointDistance.prototype
    HologramCheckpointDistance.prototype.constructor = HologramCheckpointDistance
    function HologramCheckpointDistance.new(...)
        local self = setmetatable({}, HologramCheckpointDistance.prototype)
        self:____constructor(...)
        return self
    end
    function HologramCheckpointDistance.prototype.____constructor(self, x, y)
        self.x = x
        self.y = y
        self.xDividedBy9 = self.x / 9
        self.xDividedBy18 = self.x / 18
        self.xDividedBy36 = self.x / 36
        self.yDividedBy9 = self.y / 9
        self.yDividedBy18 = self.y / 18
        self.yDividedBy36 = self.y / 36
    end
    return ____exports
    
end
__modules["app.src.World.Holograms.HologramCheckpointDistance"] = {initialized = false, cached = nil, loader = __module_166}
function __module_167()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____Effect = require("app.src.JassOverrides.Effect")
    local Effect = ____Effect.Effect
    local ____HologramCheckpointDistance = require("app.src.World.Holograms.HologramCheckpointDistance")
    local HologramCheckpointDistance = ____HologramCheckpointDistance.HologramCheckpointDistance
    ____exports.DirectionalArrow = {}
    local DirectionalArrow = ____exports.DirectionalArrow
    DirectionalArrow.name = "DirectionalArrow"
    DirectionalArrow.__index = DirectionalArrow
    DirectionalArrow.prototype = {}
    DirectionalArrow.prototype.__index = DirectionalArrow.prototype
    DirectionalArrow.prototype.constructor = DirectionalArrow
    function DirectionalArrow.new(...)
        local self = setmetatable({}, DirectionalArrow.prototype)
        self:____constructor(...)
        return self
    end
    function DirectionalArrow.prototype.____constructor(self, modelPath, firstCheckpointX, firstCheckpointY, secondCheckpointX, secondCheckpointY)
        local dist = HologramCheckpointDistance.new(secondCheckpointX - firstCheckpointX, secondCheckpointY - firstCheckpointY)
        self.effects = {
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 2 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 2 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 3 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 3 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 4 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 4 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 5 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 5 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 6 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 6 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 7 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 7 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 8 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 8 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 9 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 9 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 10 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 10 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 11 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 11 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 12 * dist.xDividedBy36, firstCheckpointY - dist.yDividedBy9 - 12 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 3 * dist.xDividedBy36 + dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 3 * dist.yDividedBy36 + dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 4 * dist.xDividedBy36 + 2 * dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 4 * dist.yDividedBy36 + 2 * dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 5 * dist.xDividedBy36 + 3 * dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 5 * dist.yDividedBy36 + 3 * dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 3 * dist.xDividedBy36 - dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 3 * dist.yDividedBy36 - dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 4 * dist.xDividedBy36 - 2 * dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 4 * dist.yDividedBy36 - 2 * dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX - dist.xDividedBy9 - 5 * dist.xDividedBy36 - 3 * dist.yDividedBy36, firstCheckpointY - dist.yDividedBy9 - 5 * dist.yDividedBy36 - 3 * dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 2 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 2 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 3 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 3 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 4 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 4 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 5 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 5 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 6 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 6 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 7 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 7 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 8 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 8 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 9 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 9 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 10 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 10 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 11 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 11 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 12 * dist.xDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 12 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 11 * dist.xDividedBy36 + dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 11 * dist.yDividedBy36 + dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 10 * dist.xDividedBy36 + 2 * dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 10 * dist.yDividedBy36 + 2 * dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 9 * dist.xDividedBy36 + 3 * dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 9 * dist.yDividedBy36 + 3 * dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 11 * dist.xDividedBy36 - dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 11 * dist.yDividedBy36 - dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 10 * dist.xDividedBy36 - 2 * dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 10 * dist.yDividedBy36 - 2 * dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 3 * dist.xDividedBy9 + 9 * dist.xDividedBy36 - 3 * dist.yDividedBy36, firstCheckpointY + 3 * dist.yDividedBy9 + 9 * dist.yDividedBy36 - 3 * dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 2 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 2 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 3 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 3 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 4 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 4 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 5 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 5 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 6 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 6 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 7 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 8 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 8 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 9 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 9 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 10 * dist.xDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 10 * dist.yDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 9 * dist.xDividedBy36 + dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 9 * dist.yDividedBy36 + dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 8 * dist.xDividedBy36 + 2 * dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 8 * dist.yDividedBy36 + 2 * dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy36 + 3 * dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 7 * dist.yDividedBy36 + 3 * dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 9 * dist.xDividedBy36 - dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 9 * dist.yDividedBy36 - dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 8 * dist.xDividedBy36 - 2 * dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 8 * dist.yDividedBy36 - 2 * dist.xDividedBy36)
            ),
            Effect.new(
                AddSpecialEffect(modelPath, firstCheckpointX + 10 * dist.xDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy36 - 3 * dist.yDividedBy36, firstCheckpointY + 10 * dist.yDividedBy9 + dist.yDividedBy18 + 7 * dist.yDividedBy36 - 3 * dist.xDividedBy36)
            )
        }
    end
    function DirectionalArrow.prototype.Destroy(self)
        local eff = table.remove(self.effects)
        while eff ~= nil do
            eff:Destroy()
            eff = table.remove(self.effects)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Game.DirectionalArrow"] = {initialized = false, cached = nil, loader = __module_167}
function __module_168()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    ____exports.ArchimondeGate = {}
    local ArchimondeGate = ____exports.ArchimondeGate
    ArchimondeGate.name = "ArchimondeGate"
    ArchimondeGate.__index = ArchimondeGate
    ArchimondeGate.prototype = {}
    ArchimondeGate.prototype.__index = ArchimondeGate.prototype
    ArchimondeGate.prototype.constructor = ArchimondeGate
    function ArchimondeGate.new(...)
        local self = setmetatable({}, ArchimondeGate.prototype)
        self:____constructor(...)
        return self
    end
    function ArchimondeGate.prototype.____constructor(self, archimonde)
        self.gate = CreateDestructable(
            FourCC("B000"),
            3520,
            -5312,
            0,
            0.9,
            0
        )
        self.trig = Trigger.new()
        self.trig:RegisterDeathEvent(self.gate)
        self.trig:AddAction(
            function() return IssuePointOrder(archimonde, "move", 1000, -5050) end
        )
    end
    return ____exports
    
end
__modules["app.src.World.Game.ArchimondeGate"] = {initialized = false, cached = nil, loader = __module_168}
function __module_169()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    ____exports.ArchimondeTeleport = {}
    local ArchimondeTeleport = ____exports.ArchimondeTeleport
    ArchimondeTeleport.name = "ArchimondeTeleport"
    ArchimondeTeleport.__index = ArchimondeTeleport
    ArchimondeTeleport.prototype = {}
    ArchimondeTeleport.prototype.__index = ArchimondeTeleport.prototype
    ArchimondeTeleport.prototype.constructor = ArchimondeTeleport
    function ArchimondeTeleport.new(...)
        local self = setmetatable({}, ArchimondeTeleport.prototype)
        self:____constructor(...)
        return self
    end
    function ArchimondeTeleport.prototype.____constructor(self, archimonde)
        self.trig = Trigger.new()
        self.trig:RegisterEnterRectSimple(
            Rect(992, -5216, 1056, -4992)
        )
        self.trig:AddCondition(
            function() return GetEnteringUnit() == archimonde end
        )
        self.trig:AddAction(
            function() return RemoveUnit(archimonde) end
        )
    end
    return ____exports
    
end
__modules["app.src.World.Game.ArchimondeTeleport"] = {initialized = false, cached = nil, loader = __module_169}
function __module_170()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    ____exports.GameTurn = {}
    local GameTurn = ____exports.GameTurn
    GameTurn.name = "GameTurn"
    GameTurn.__index = GameTurn
    GameTurn.prototype = {}
    GameTurn.prototype.__index = GameTurn.prototype
    GameTurn.prototype.constructor = GameTurn
    function GameTurn.new(...)
        local self = setmetatable({}, GameTurn.prototype)
        self:____constructor(...)
        return self
    end
    function GameTurn.prototype.____constructor(self)
        self._endOfTurnTowerArray = {}
    end
    function GameTurn.prototype.EndOfRoundTowers(self)
        return self._endOfTurnTowerArray
    end
    function GameTurn.prototype.AddEndOfRoundTower(self, id, endOfRoundTower)
        __TS__ArrayPush(self._endOfTurnTowerArray, endOfRoundTower)
    end
    function GameTurn.prototype.RemoveEndOfRoundTower(self, id)
        self._endOfTurnTowerArray = __TS__ArrayFilter(
            self._endOfTurnTowerArray,
            function(____, tower)
                return tower.UniqueID ~= id
            end
        )
    end
    return ____exports
    
end
__modules["app.src.World.Game.BaseMaul.GameTurn"] = {initialized = false, cached = nil, loader = __module_170}
function __module_171()
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
    
end
__modules["app.src.World.WorldMap"] = {initialized = false, cached = nil, loader = __module_171}
function __module_172()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    ____exports.AbstractHologramMaze = {}
    local AbstractHologramMaze = ____exports.AbstractHologramMaze
    AbstractHologramMaze.name = "AbstractHologramMaze"
    AbstractHologramMaze.__index = AbstractHologramMaze
    AbstractHologramMaze.prototype = {}
    AbstractHologramMaze.prototype.__index = AbstractHologramMaze.prototype
    AbstractHologramMaze.prototype.constructor = AbstractHologramMaze
    function AbstractHologramMaze.new(...)
        local self = setmetatable({}, AbstractHologramMaze.prototype)
        self:____constructor(...)
        return self
    end
    function AbstractHologramMaze.prototype.____constructor(self)
        self.images = {}
    end
    function AbstractHologramMaze.prototype.Destroy(self)
        local img = table.remove(self.images)
        while img ~= nil do
            img:Destroy()
            img = table.remove(self.images)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Holograms.AbstractHologramMaze"] = {initialized = false, cached = nil, loader = __module_172}
function __module_173()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    ____exports.Image = {}
    local Image = ____exports.Image
    Image.name = "Image"
    Image.__index = Image
    Image.prototype = {}
    Image.prototype.__index = Image.prototype
    Image.prototype.constructor = Image
    function Image.new(...)
        local self = setmetatable({}, Image.prototype)
        self:____constructor(...)
        return self
    end
    function Image.prototype.____constructor(self, imagePath, size, x, y, z)
        self.img = CreateImage(imagePath, size, size, 0, x - (size / 2), y - (size / 2), z, 0, 0, 0, 2)
    end
    function Image.prototype.Destroy(self)
        DestroyImage(self.img)
    end
    function Image.prototype.SetImageRenderAlways(self, flag)
        SetImageRenderAlways(self.img, flag)
    end
    function Image.prototype.ShowImage(self, flag)
        ShowImage(self.img, flag)
    end
    return ____exports
    
end
__modules["app.src.JassOverrides.Image"] = {initialized = false, cached = nil, loader = __module_173}
function __module_174()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____AbstractHologramMaze = require("app.src.World.Holograms.AbstractHologramMaze")
    local AbstractHologramMaze = ____AbstractHologramMaze.AbstractHologramMaze
    local ____Image = require("app.src.JassOverrides.Image")
    local Image = ____Image.Image
    local ____HologramCheckpointDistance = require("app.src.World.Holograms.HologramCheckpointDistance")
    local HologramCheckpointDistance = ____HologramCheckpointDistance.HologramCheckpointDistance
    ____exports.AdvancedHoloMaze = {}
    local AdvancedHoloMaze = ____exports.AdvancedHoloMaze
    AdvancedHoloMaze.name = "AdvancedHoloMaze"
    AdvancedHoloMaze.__index = AdvancedHoloMaze
    AdvancedHoloMaze.prototype = {}
    AdvancedHoloMaze.prototype.__index = AdvancedHoloMaze.prototype
    AdvancedHoloMaze.prototype.constructor = AdvancedHoloMaze
    AdvancedHoloMaze.____super = AbstractHologramMaze
    setmetatable(AdvancedHoloMaze, AdvancedHoloMaze.____super)
    setmetatable(AdvancedHoloMaze.prototype, AdvancedHoloMaze.____super.prototype)
    function AdvancedHoloMaze.new(...)
        local self = setmetatable({}, AdvancedHoloMaze.prototype)
        self:____constructor(...)
        return self
    end
    function AdvancedHoloMaze.prototype.____constructor(self, imagePath, firstCheckpointX, firstCheckpointY, secondCheckpointX, secondCheckpointY)
        AbstractHologramMaze.prototype.____constructor(self)
        local dist = HologramCheckpointDistance.new(secondCheckpointX - firstCheckpointX, secondCheckpointY - firstCheckpointY)
        self.images = {
            Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9, firstCheckpointY + dist.yDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy9, firstCheckpointY - dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9, firstCheckpointY - dist.yDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9 + dist.yDividedBy9, firstCheckpointY + 2 * dist.yDividedBy9 + dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + 3 * dist.xDividedBy9 + 2 * dist.yDividedBy9, firstCheckpointY + 3 * dist.yDividedBy9 + 2 * dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + 4 * dist.xDividedBy9 + 3 * dist.yDividedBy9, firstCheckpointY + 4 * dist.yDividedBy9 + 3 * dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + 5 * dist.xDividedBy9 + 4 * dist.yDividedBy9, firstCheckpointY + 5 * dist.yDividedBy9 + 4 * dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + 6 * dist.xDividedBy9 + 5 * dist.yDividedBy9, firstCheckpointY + 6 * dist.yDividedBy9 + 5 * dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + 7 * dist.xDividedBy9 + 5 * dist.yDividedBy9, firstCheckpointY + 7 * dist.yDividedBy9 + 5 * dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + 8 * dist.xDividedBy9 + 4 * dist.yDividedBy9, firstCheckpointY + 8 * dist.yDividedBy9 + 4 * dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + 9 * dist.xDividedBy9 + 3 * dist.yDividedBy9, firstCheckpointY + 9 * dist.yDividedBy9 + 3 * dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + 10 * dist.xDividedBy9 + 2 * dist.yDividedBy9, firstCheckpointY + 10 * dist.yDividedBy9 + 2 * dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + 11 * dist.xDividedBy9 + dist.yDividedBy9, firstCheckpointY + 11 * dist.yDividedBy9 + dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + 12 * dist.xDividedBy9, firstCheckpointY + 12 * dist.yDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + 13 * dist.xDividedBy9 - dist.yDividedBy9, firstCheckpointY + 13 * dist.yDividedBy9 - dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + 13 * dist.xDividedBy9 + dist.xDividedBy18 - 2 * dist.yDividedBy9, firstCheckpointY + 13 * dist.yDividedBy9 + dist.yDividedBy18 - 2 * dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy18 + dist.yDividedBy9, firstCheckpointY - dist.yDividedBy18 + dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy18 + dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + dist.yDividedBy18 + dist.xDividedBy9 + dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9 + dist.xDividedBy18 + 2 * dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + dist.yDividedBy9 + dist.yDividedBy18 + 2 * dist.xDividedBy9 + dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9 + dist.xDividedBy18 + 3 * dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + 2 * dist.yDividedBy9 + dist.yDividedBy18 + 3 * dist.xDividedBy9 + dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + 3 * dist.xDividedBy9 + dist.xDividedBy18 + 4 * dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + 3 * dist.yDividedBy9 + dist.yDividedBy18 + 4 * dist.xDividedBy9 + dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9 + 5 * dist.yDividedBy9, firstCheckpointY + 2 * dist.yDividedBy9 + 5 * dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9 + 4 * dist.yDividedBy9, firstCheckpointY + dist.yDividedBy9 + 4 * dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + 3 * dist.yDividedBy9, firstCheckpointY + 3 * dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9 + 5 * dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + dist.yDividedBy9 + 5 * dist.xDividedBy9 + dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9 + 3 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy9 + 3 * dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX - 2 * dist.xDividedBy9 + 2 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - 2 * dist.yDividedBy9 + 2 * dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX - 2 * dist.xDividedBy9 - dist.xDividedBy18 + dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - 2 * dist.yDividedBy9 - dist.yDividedBy18 + dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX - 2 * dist.xDividedBy9 - dist.xDividedBy18 - dist.yDividedBy18, firstCheckpointY - 2 * dist.yDividedBy9 - dist.yDividedBy18 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9 - dist.xDividedBy18 - dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy9 - dist.yDividedBy18 - dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9 - dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY + dist.yDividedBy9 - dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9 - dist.xDividedBy18 - dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY + 2 * dist.yDividedBy9 - dist.yDividedBy18 - dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + 3 * dist.xDividedBy9 - dist.xDividedBy18 - dist.yDividedBy18, firstCheckpointY + 3 * dist.yDividedBy9 - dist.yDividedBy18 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + 4 * dist.xDividedBy9 - dist.xDividedBy18 + dist.yDividedBy18, firstCheckpointY + 4 * dist.yDividedBy9 - dist.yDividedBy18 + dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + 5 * dist.xDividedBy9 - dist.xDividedBy18 + dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + 5 * dist.yDividedBy9 - dist.yDividedBy18 + dist.xDividedBy9 + dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + 6 * dist.xDividedBy9 - dist.xDividedBy18 + 2 * dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + 6 * dist.yDividedBy9 - dist.yDividedBy18 + 2 * dist.xDividedBy9 + dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + 7 * dist.xDividedBy9 - dist.xDividedBy18 + 3 * dist.yDividedBy9 + dist.yDividedBy18, firstCheckpointY + 7 * dist.yDividedBy9 - dist.yDividedBy18 + 3 * dist.xDividedBy9 + dist.xDividedBy18, 0)
        }
        __TS__ArrayForEach(
            self.images,
            function(____, img)
                img:SetImageRenderAlways(true)
                img:ShowImage(true)
            end
        )
    end
    return ____exports
    
end
__modules["app.src.World.Holograms.AdvancedHoloMaze"] = {initialized = false, cached = nil, loader = __module_174}
function __module_175()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____AbstractHologramMaze = require("app.src.World.Holograms.AbstractHologramMaze")
    local AbstractHologramMaze = ____AbstractHologramMaze.AbstractHologramMaze
    local ____Image = require("app.src.JassOverrides.Image")
    local Image = ____Image.Image
    local ____HologramCheckpointDistance = require("app.src.World.Holograms.HologramCheckpointDistance")
    local HologramCheckpointDistance = ____HologramCheckpointDistance.HologramCheckpointDistance
    ____exports.SimpleHoloMaze = {}
    local SimpleHoloMaze = ____exports.SimpleHoloMaze
    SimpleHoloMaze.name = "SimpleHoloMaze"
    SimpleHoloMaze.__index = SimpleHoloMaze
    SimpleHoloMaze.prototype = {}
    SimpleHoloMaze.prototype.__index = SimpleHoloMaze.prototype
    SimpleHoloMaze.prototype.constructor = SimpleHoloMaze
    SimpleHoloMaze.____super = AbstractHologramMaze
    setmetatable(SimpleHoloMaze, SimpleHoloMaze.____super)
    setmetatable(SimpleHoloMaze.prototype, SimpleHoloMaze.____super.prototype)
    function SimpleHoloMaze.new(...)
        local self = setmetatable({}, SimpleHoloMaze.prototype)
        self:____constructor(...)
        return self
    end
    function SimpleHoloMaze.prototype.____constructor(self, imagePath, firstCheckpointX, firstCheckpointY, secondCheckpointX, secondCheckpointY)
        AbstractHologramMaze.prototype.____constructor(self)
        local dist = HologramCheckpointDistance.new(secondCheckpointX - firstCheckpointX, secondCheckpointY - firstCheckpointY)
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9, firstCheckpointY + dist.yDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9, firstCheckpointY + 2 * dist.yDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + 3 * dist.xDividedBy9, firstCheckpointY + 3 * dist.yDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + 4 * dist.xDividedBy9, firstCheckpointY + 4 * dist.yDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + 5 * dist.xDividedBy9, firstCheckpointY + 5 * dist.yDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + 6 * dist.xDividedBy9, firstCheckpointY + 6 * dist.yDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + 7 * dist.xDividedBy9, firstCheckpointY + 7 * dist.yDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy9, firstCheckpointY - dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9, firstCheckpointY - dist.yDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy9 - dist.xDividedBy18, firstCheckpointY - dist.yDividedBy18 + dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy9 + dist.yDividedBy18 + dist.xDividedBy18, firstCheckpointY + dist.yDividedBy18 + dist.xDividedBy9 + dist.xDividedBy18, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + 8 * dist.xDividedBy9, firstCheckpointY + 8 * dist.yDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy9 + 9 * dist.xDividedBy9, firstCheckpointY + 9 * dist.yDividedBy9 + dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + 10 * dist.xDividedBy9, firstCheckpointY + 10 * dist.yDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy9 + 9 * dist.xDividedBy9 + dist.xDividedBy18, firstCheckpointY + 9 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18, firstCheckpointY + dist.yDividedBy18 + dist.xDividedBy18 + dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 2 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 2 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 3 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 3 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 4 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 4 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 5 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 5 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 6 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 6 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy18 + dist.yDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 7 * dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 8 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 8 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 7 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 7 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 6 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 6 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 5 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 5 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 4 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 4 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 3 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 3 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + 2 * dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + 2 * dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
        )
        __TS__ArrayPush(
            self.images,
            Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy18 - dist.yDividedBy9 + dist.xDividedBy18 + dist.xDividedBy9, firstCheckpointY + dist.yDividedBy18 + dist.yDividedBy9 - dist.xDividedBy18 - dist.xDividedBy9, 0)
        )
        __TS__ArrayForEach(
            self.images,
            function(____, img)
                img:SetImageRenderAlways(true)
                img:ShowImage(true)
            end
        )
    end
    return ____exports
    
end
__modules["app.src.World.Holograms.SimpleHoloMaze"] = {initialized = false, cached = nil, loader = __module_175}
function __module_176()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____AbstractHologramMaze = require("app.src.World.Holograms.AbstractHologramMaze")
    local AbstractHologramMaze = ____AbstractHologramMaze.AbstractHologramMaze
    local ____Image = require("app.src.JassOverrides.Image")
    local Image = ____Image.Image
    local ____HologramCheckpointDistance = require("app.src.World.Holograms.HologramCheckpointDistance")
    local HologramCheckpointDistance = ____HologramCheckpointDistance.HologramCheckpointDistance
    ____exports.CircleHoloMaze = {}
    local CircleHoloMaze = ____exports.CircleHoloMaze
    CircleHoloMaze.name = "CircleHoloMaze"
    CircleHoloMaze.__index = CircleHoloMaze
    CircleHoloMaze.prototype = {}
    CircleHoloMaze.prototype.__index = CircleHoloMaze.prototype
    CircleHoloMaze.prototype.constructor = CircleHoloMaze
    CircleHoloMaze.____super = AbstractHologramMaze
    setmetatable(CircleHoloMaze, CircleHoloMaze.____super)
    setmetatable(CircleHoloMaze.prototype, CircleHoloMaze.____super.prototype)
    function CircleHoloMaze.new(...)
        local self = setmetatable({}, CircleHoloMaze.prototype)
        self:____constructor(...)
        return self
    end
    function CircleHoloMaze.prototype.____constructor(self, imagePath, firstCheckpointX, firstCheckpointY, secondCheckpointX, secondCheckpointY)
        AbstractHologramMaze.prototype.____constructor(self)
        local dist = HologramCheckpointDistance.new(secondCheckpointX - firstCheckpointX, secondCheckpointY - firstCheckpointY)
        self.images = {
            Image.new(imagePath, 192, firstCheckpointX + dist.yDividedBy9, firstCheckpointY + dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9, firstCheckpointY + dist.yDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX - dist.yDividedBy9, firstCheckpointY - dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9 - dist.xDividedBy18 + dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy9 - dist.yDividedBy18 + dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9 - dist.xDividedBy18 + 2 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy9 - dist.yDividedBy18 + 2 * dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy18 + 3 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy18 + 3 * dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy18 + 3 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY + dist.yDividedBy18 + 3 * dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9 + dist.xDividedBy18 + 2 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY + dist.yDividedBy9 + dist.yDividedBy18 + 2 * dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9 + dist.xDividedBy18 + dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY + 2 * dist.yDividedBy9 + dist.yDividedBy18 + dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + 2 * dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy18, firstCheckpointY + 2 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY + dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX + dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY + dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX - dist.xDividedBy9 + dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18, firstCheckpointY - dist.yDividedBy9 + dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18, 0),
            Image.new(imagePath, 192, firstCheckpointX - 2 * dist.xDividedBy9 + dist.xDividedBy18 - 2 * dist.yDividedBy9, firstCheckpointY - 2 * dist.yDividedBy9 + dist.yDividedBy18 - 2 * dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX - 3 * dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy9, firstCheckpointY - 3 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX - 3 * dist.xDividedBy9, firstCheckpointY - 3 * dist.yDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX - 3 * dist.xDividedBy9 + dist.yDividedBy9, firstCheckpointY - 3 * dist.yDividedBy9 + dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX - 3 * dist.xDividedBy9 + 2 * dist.yDividedBy9, firstCheckpointY - 3 * dist.yDividedBy9 + 2 * dist.xDividedBy9, 0),
            Image.new(imagePath, 192, firstCheckpointX - 2 * dist.xDividedBy9 + 3 * dist.yDividedBy9, firstCheckpointY - 2 * dist.yDividedBy9 + 3 * dist.xDividedBy9, 0)
        }
        __TS__ArrayForEach(
            self.images,
            function(____, img)
                img:SetImageRenderAlways(true)
                img:ShowImage(true)
            end
        )
    end
    return ____exports
    
end
__modules["app.src.World.Holograms.CircleHoloMaze"] = {initialized = false, cached = nil, loader = __module_176}
function __module_177()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____Defender = require("app.src.World.Entity.Players.Defender")
    local Defender = ____Defender.Defender
    local ____TimedEvent = require("app.src.lib.WCEventQueue.TimedEvent")
    local TimedEvent = ____TimedEvent.TimedEvent
    local ____HologramCheckpointDistance = require("app.src.World.Holograms.HologramCheckpointDistance")
    local HologramCheckpointDistance = ____HologramCheckpointDistance.HologramCheckpointDistance
    ____exports.DummyPlayer = {}
    local DummyPlayer = ____exports.DummyPlayer
    DummyPlayer.name = "DummyPlayer"
    DummyPlayer.__index = DummyPlayer
    DummyPlayer.prototype = {}
    DummyPlayer.prototype.__index = DummyPlayer.prototype
    DummyPlayer.prototype.constructor = DummyPlayer
    function DummyPlayer.new(...)
        local self = setmetatable({}, DummyPlayer.prototype)
        self:____constructor(...)
        return self
    end
    function DummyPlayer.prototype.____constructor(self, game, slot)
        self.step = 0
        self.towers = {
            FourCC("h00L"),
            FourCC("h02V"),
            FourCC("o012"),
            FourCC("o006"),
            FourCC("o013"),
            FourCC("o008")
        }
        self.currentIndx = 0
        self.game = game
        self.slot = slot
        self:Setup()
    end
    function DummyPlayer.prototype.Setup(self)
        local dummyPlayer = Defender.new(self.slot, self.game)
        self.player = dummyPlayer
        self.game.players:set(self.slot, dummyPlayer)
        self.game.worldMap.playerSpawns[self.slot + 1].isOpen = true
        self.game.timedEventQueue:AddEvent(
            TimedEvent.new(
                function() return self:ConstructTowers() end,
                10,
                false
            )
        )
        self.step = 0
        return true
    end
    function DummyPlayer.prototype.ConstructTowers(self)
        if self:CreateTowersForPlayer() then
            self.game.timedEventQueue:AddEvent(
                TimedEvent.new(
                    function() return self:Leave() end,
                    150,
                    false
                )
            )
            return true
        end
        return false
    end
    function DummyPlayer.prototype.Leave(self)
        if not self.player then
            self:Setup()
            return false
        end
        self.player:PlayerLeftTheGame()
        self.game.timedEventQueue:AddEvent(
            TimedEvent.new(
                function() return self:Setup() end,
                150,
                true
            )
        )
        return true
    end
    function DummyPlayer.prototype.GetTower(self)
        self.currentIndx = self.currentIndx + 1
        if self.currentIndx == #self.game.worldMap.towerConstruction.towerTypes:GetArray() then
            self.currentIndx = 0
        end
        return self.game.worldMap.towerConstruction.towerTypes:GetArray()[self.currentIndx + 1]
    end
    function DummyPlayer.prototype.CreateTowersForPlayer(self)
        if not self.player then
            return true
        end
        local firstSpawn = self.game.worldMap.playerSpawns[self.player.id + 1].spawnOne
        if firstSpawn == nil then
            return true
        end
        local firstCheckpoint = firstSpawn.next
        if firstCheckpoint == nil then
            return true
        end
        local secondCheckpoint = firstCheckpoint.next
        if secondCheckpoint == nil then
            return true
        end
        local firstCheckpointX = GetRectCenterX(firstCheckpoint.rectangle)
        local firstCheckpointY = GetRectCenterY(firstCheckpoint.rectangle)
        local secondCheckpointX = GetRectCenterX(secondCheckpoint.rectangle)
        local secondCheckpointY = GetRectCenterY(secondCheckpoint.rectangle)
        local dist = HologramCheckpointDistance.new(secondCheckpointX - firstCheckpointX, secondCheckpointY - firstCheckpointY)
        self.step = self.step + 1
        if self.step == 1 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX + dist.yDividedBy9,
                    firstCheckpointY + dist.xDividedBy9,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 2 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX + dist.xDividedBy9,
                    firstCheckpointY + dist.yDividedBy9,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 3 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX - dist.yDividedBy9,
                    firstCheckpointY - dist.xDividedBy9,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 4 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX - dist.xDividedBy9 - dist.yDividedBy18,
                    firstCheckpointY - dist.yDividedBy9 - dist.xDividedBy18,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 5 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX - dist.xDividedBy9 - dist.xDividedBy18 + dist.yDividedBy9 - dist.yDividedBy18,
                    firstCheckpointY - dist.yDividedBy9 - dist.yDividedBy18 + dist.xDividedBy9 - dist.xDividedBy18,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 6 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX - dist.xDividedBy9 - dist.xDividedBy18 + 2 * dist.yDividedBy9 - dist.yDividedBy18,
                    firstCheckpointY - dist.yDividedBy9 - dist.yDividedBy18 + 2 * dist.xDividedBy9 - dist.xDividedBy18,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 7 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX - dist.xDividedBy18 + 3 * dist.yDividedBy9 - dist.yDividedBy18,
                    firstCheckpointY - dist.yDividedBy18 + 3 * dist.xDividedBy9 - dist.xDividedBy18,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 8 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX + dist.xDividedBy18 + 3 * dist.yDividedBy9 - dist.yDividedBy18,
                    firstCheckpointY + dist.yDividedBy18 + 3 * dist.xDividedBy9 - dist.xDividedBy18,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 9 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX + dist.xDividedBy9 + dist.xDividedBy18 + 2 * dist.yDividedBy9 - dist.yDividedBy18,
                    firstCheckpointY + dist.yDividedBy9 + dist.yDividedBy18 + 2 * dist.xDividedBy9 - dist.xDividedBy18,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 10 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX + 2 * dist.xDividedBy9 + dist.xDividedBy18 + dist.yDividedBy9 - dist.yDividedBy18,
                    firstCheckpointY + 2 * dist.yDividedBy9 + dist.yDividedBy18 + dist.xDividedBy9 - dist.xDividedBy18,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 11 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX + 2 * dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy18,
                    firstCheckpointY + 2 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy18,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 12 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX + dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy9 - dist.yDividedBy18,
                    firstCheckpointY + dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9 - dist.xDividedBy18,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 13 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX + dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18,
                    firstCheckpointY + dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 14 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX - dist.xDividedBy9 + dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18,
                    firstCheckpointY - dist.yDividedBy9 + dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 15 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX - 2 * dist.xDividedBy9 + dist.xDividedBy18 - 2 * dist.yDividedBy9,
                    firstCheckpointY - 2 * dist.yDividedBy9 + dist.yDividedBy18 - 2 * dist.xDividedBy9,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 16 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX - 3 * dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy9,
                    firstCheckpointY - 3 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 17 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX - 3 * dist.xDividedBy9,
                    firstCheckpointY - 3 * dist.yDividedBy9,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 18 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX - 3 * dist.xDividedBy9 + dist.yDividedBy9,
                    firstCheckpointY - 3 * dist.yDividedBy9 + dist.xDividedBy9,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 19 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX - 3 * dist.xDividedBy9 + 2 * dist.yDividedBy9,
                    firstCheckpointY - 3 * dist.yDividedBy9 + 2 * dist.xDividedBy9,
                    bj_UNIT_FACING
                ),
                self.player
            )
            return false
        end
        if self.step == 20 then
            self.game.worldMap.towerConstruction:SetupTower(
                CreateUnit(
                    self.player.wcPlayer,
                    self:GetTower(),
                    firstCheckpointX - 2 * dist.xDividedBy9 + 3 * dist.yDividedBy9,
                    firstCheckpointY - 2 * dist.yDividedBy9 + 3 * dist.xDividedBy9,
                    0
                ),
                self.player
            )
            return false
        end
        return true
    end
    return ____exports
    
end
__modules["app.src.World.Entity.EmulatedPlayer.DummyPlayer"] = {initialized = false, cached = nil, loader = __module_177}
function __module_178()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GlobalSettings = require("app.src.World.GlobalSettings")
    local COLOUR_CODES = ____GlobalSettings.COLOUR_CODES
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    local ____AdvancedHoloMaze = require("app.src.World.Holograms.AdvancedHoloMaze")
    local AdvancedHoloMaze = ____AdvancedHoloMaze.AdvancedHoloMaze
    local ____SimpleHoloMaze = require("app.src.World.Holograms.SimpleHoloMaze")
    local SimpleHoloMaze = ____SimpleHoloMaze.SimpleHoloMaze
    local ____CircleHoloMaze = require("app.src.World.Holograms.CircleHoloMaze")
    local CircleHoloMaze = ____CircleHoloMaze.CircleHoloMaze
    local ____TimedEvent = require("app.src.lib.WCEventQueue.TimedEvent")
    local TimedEvent = ____TimedEvent.TimedEvent
    local ____DummyPlayer = require("app.src.World.Entity.EmulatedPlayer.DummyPlayer")
    local DummyPlayer = ____DummyPlayer.DummyPlayer
    ____exports.Commands = {}
    local Commands = ____exports.Commands
    Commands.name = "Commands"
    Commands.__index = Commands
    Commands.prototype = {}
    Commands.prototype.__index = Commands.prototype
    Commands.prototype.constructor = Commands
    function Commands.new(...)
        local self = setmetatable({}, Commands.prototype)
        self:____constructor(...)
        return self
    end
    function Commands.prototype.____constructor(self, game)
        self.voteKickInProgress = false
        self.hasVotedToKick = {}
        self.voteKickTimer = CreateTimer()
        self.drawings = {}
        self.game = game
        self.commandTrigger = Trigger.new()
        self.commandTrigger:AddAction(
            function() return self:handleCommand() end
        )
        do
            local i = 0
            while i < bj_MAX_PLAYER_SLOTS do
                self.hasVotedToKick[i + 1] = false
                i = i + 1
            end
        end
    end
    function Commands.prototype.handleDebugCommand(self, player, command, command2)
        Log.Debug(
            Util:ArraysToString(command)
        )
        local amount = 0
        local ____switch5 = command[1]
        if ____switch5 == "dummy" then
            goto ____switch5_case_0
        end
        if ____switch5 == "ui" then
            goto ____switch5_case_1
        end
        if ____switch5 == "openall" then
            goto ____switch5_case_2
        end
        if ____switch5 == "gold" then
            goto ____switch5_case_3
        end
        if ____switch5 == "lumber" then
            goto ____switch5_case_4
        end
        if ____switch5 == "lives" then
            goto ____switch5_case_5
        end
        if ____switch5 == "closeall" then
            goto ____switch5_case_6
        end
        if ____switch5 == "diff" then
            goto ____switch5_case_7
        end
        if ____switch5 == "wave" then
            goto ____switch5_case_8
        end
        if ____switch5 == "draw" then
            goto ____switch5_case_9
        end
        if ____switch5 == "undraw" then
            goto ____switch5_case_10
        end
        if ____switch5 == "killall" then
            goto ____switch5_case_11
        end
        if ____switch5 == "events" then
            goto ____switch5_case_12
        end
        if ____switch5 == "timer" then
            goto ____switch5_case_13
        end
        if ____switch5 == "start" then
            goto ____switch5_case_14
        end
        if ____switch5 == "startwave" then
            goto ____switch5_case_15
        end
        if ____switch5 == "leave" then
            goto ____switch5_case_16
        end
        if ____switch5 == "spawn" then
            goto ____switch5_case_17
        end
        if ____switch5 == "tm" then
            goto ____switch5_case_18
        end
        if ____switch5 == "sanity" then
            goto ____switch5_case_19
        end
        if ____switch5 == "time" then
            goto ____switch5_case_20
        end
        goto ____switch5_end
        ::____switch5_case_0::
        do
            local dummy11 = DummyPlayer.new(self.game, 2)
            goto ____switch5_end
        end
        ::____switch5_case_1::
        do
            CreateDestructable(
                FourCC("YTpc"),
                0,
                0,
                bj_UNIT_FACING,
                1,
                0
            )
            CreateDestructable(
                FourCC("YTpc"),
                0 + 128,
                0,
                bj_UNIT_FACING,
                1,
                0
            )
            CreateDestructable(
                FourCC("YTpc"),
                0 - 128,
                0,
                bj_UNIT_FACING,
                1,
                0
            )
            goto ____switch5_end
        end
        ::____switch5_case_2::
        do
            player:sendMessage("All spawns are now open!")
            self:OpenAllSpawns()
            goto ____switch5_end
        end
        ::____switch5_case_3::
        do
            amount = Util:ParseInt(command[2])
            if not amount then
                player:sendMessage(
                    Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
                )
                return
            end
            player:sendMessage(
                "Gold was set to |cFFFFCC00" .. tostring(amount) .. "|r"
            )
            player:setGold(amount)
            goto ____switch5_end
        end
        ::____switch5_case_4::
        do
            amount = Util:ParsePositiveInt(command[2])
            if not amount then
                player:sendMessage(
                    Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
                )
                return
            end
            player:sendMessage(
                "Lumber was set to |cFF00C850" .. tostring(amount) .. "|r"
            )
            player:setLumber(amount)
            goto ____switch5_end
        end
        ::____switch5_case_5::
        do
            amount = Util:ParseInt(command[2])
            if not amount then
                player:sendMessage(
                    Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
                )
                return
            end
            amount = math.floor(
                __TS__Number(amount)
            )
            self.game.gameLives = amount
            self.game.startLives = amount
            player:sendMessage(
                "Lives were set to |cFFFFCC00" .. tostring(amount) .. "|r"
            )
            goto ____switch5_end
        end
        ::____switch5_case_6::
        do
            player:sendMessage("All spawns are now closed!")
            self:CloseAllSpawns()
            goto ____switch5_end
        end
        ::____switch5_case_7::
        do
            amount = Util:ParsePositiveInt(command[2])
            if not amount then
                player:sendMessage(
                    Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
                )
                return
            end
            player:sendMessage(
                "Difficulty was set to " .. tostring(amount) .. "%"
            )
            self.game.diffVote.difficulty = amount
            for ____, enemy in ipairs(self.game.enemies) do
                enemy:setHandicap(amount)
            end
            goto ____switch5_end
        end
        ::____switch5_case_8::
        do
            amount = Util:ParsePositiveInt(command[2])
            if not amount then
                player:sendMessage(
                    Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
                )
                return
            end
            if amount > #self.game.worldMap.waveCreeps then
                player:sendMessage(
                    Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
                )
                return
            end
            player:sendMessage(
                "Current wave was set to " .. tostring(amount)
            )
            if self.game.worldMap.gameRoundHandler then
                self.game.worldMap.gameRoundHandler.currentWave = amount
            end
            goto ____switch5_end
        end
        ::____switch5_case_9::
        do
            local arr = {}
            local ____switch14 = command[2]
            if ____switch14 == "ab" then
                goto ____switch14_case_0
            end
            if ____switch14 == "antiblock" then
                goto ____switch14_case_1
            end
            goto ____switch14_end
            ::____switch14_case_0::
            ::____switch14_case_1::
            do
                goto ____switch14_end
            end
            ::____switch14_end::
            do
                local i = 0
                while i < #command - 2 do
                    if not command[(2 + i) + 1] then
                        Log.Error("Missing arguments")
                        return
                    end
                    if not arr then
                        Log.Error("invalid array")
                        return
                    end
                    if not arr[command[(2 + i) + 1] + 1] then
                        Log.Error("invalid index")
                        return
                    end
                    self:DrawRect(arr[command[(2 + i) + 1] + 1])
                    i = i + 1
                end
            end
            goto ____switch5_end
        end
        ::____switch5_case_10::
        do
            self:DestroyDrawings()
            goto ____switch5_end
        end
        ::____switch5_case_11::
        do
            local spawnedCreeps = self.game.worldMap.spawnedCreeps
            if spawnedCreeps then
                spawnedCreeps.unitMap:forEach(
                    function(____, u) return KillUnit(u.creep) end
                )
            end
            goto ____switch5_end
        end
        ::____switch5_case_12::
        do
            Log.Debug(
                "TickEvents: " .. tostring(
                    self.game.towerTicker:GetTickingTowerCount()
                )
            )
            goto ____switch5_end
        end
        ::____switch5_case_13::
        do
            self:TestTimeout()
            goto ____switch5_end
        end
        ::____switch5_case_14::
        ::____switch5_case_15::
        do
            self.game.waveTimer = 1
            goto ____switch5_end
        end
        ::____switch5_case_16::
        do
            player:PlayerLeftTheGame()
            goto ____switch5_end
        end
        ::____switch5_case_17::
        do
            local id = command2[2]
            if #id == 4 then
                local u = CreateUnit(
                    player.wcPlayer,
                    FourCC(id),
                    BlzGetTriggerPlayerMouseX(),
                    BlzGetTriggerPlayerMouseY(),
                    bj_UNIT_FACING
                )
                self.game.worldMap.towerConstruction:SetupTower(u, player)
            end
            goto ____switch5_end
        end
        ::____switch5_case_18::
        do
            player:sendMessage(
                Util:ArraysToString(self.game.worldMap.playerMazes[player.id + 1].maze)
            )
            PreloadGenStart()
            self:MazeToString(self.game.worldMap.playerMazes[player.id + 1].maze)
            PreloadGenEnd("testmap.txt")
            goto ____switch5_end
        end
        ::____switch5_case_19::
        do
            self.game.worldMap.playerMazes[player.id + 1]:SanityCheck()
            self.game.worldMap.playerMazes[player.id + 1]:CheckAll()
            goto ____switch5_end
        end
        ::____switch5_case_20::
        do
            amount = Util:ParsePositiveInt(command[2])
            if not amount then
                player:sendMessage(
                    Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
                )
                return
            end
            self.game.waveTimer = amount
            goto ____switch5_end
        end
        ::____switch5_end::
    end
    function Commands.prototype.handleCommand(self)
        local player = self.game.players:get(
            GetPlayerId(
                GetTriggerPlayer()
            )
        )
        if not player then
            return
        end
        if string.sub(
            GetEventPlayerChatString(),
            1,
            0 + 1
        ) ~= "-" then
            Log.Event(
                0,
                "{\"message\":\"" .. tostring(
                    GetEventPlayerChatString()
                ) .. "\", \"sender\": \"" .. tostring(
                    player:GetLogStr()
                ) .. "\"}"
            )
            return
        end
        local playerCommand = string.lower(
            string.sub(
                GetEventPlayerChatString(),
                2
            )
        )
        local playerCommand2 = string.sub(
            GetEventPlayerChatString(),
            2
        )
        local command = __TS__StringSplit(playerCommand, " ")
        local command2 = __TS__StringSplit(playerCommand2, " ")
        Log.Event(
            4,
            "{\"command\":\"" .. tostring(
                Util:ArraysToString(command)
            ) .. "\", \"sender\": \"" .. tostring(
                player:GetLogStr()
            ) .. "\"}"
        )
        if command[1] == "air" then
            player:sendMessage("|cFF999999Air:|r 5 / 15 / 20 / 25 / 30")
        elseif command[1] == "boss" then
            player:sendMessage("|cFF3737F2Boss:|r 9 / 14 / 19 / 24 / 29 / 31")
        elseif command[1] == "champ" or command[1] == "champion" then
            player:sendMessage("|cFFF2A137Champion:|r 35 / 36")
        elseif command[1] == "light" then
            player:sendMessage("|cFF6d7c86Light:|r 4 / 8 / 11 / 16 / 19 / 23 / 27 / 32")
        elseif command[1] == "medium" then
            player:sendMessage("|cFF416073Medium:|r 3 / 7 / 12 / 17 / 24 / 28 / 33")
        elseif command[1] == "heavy" then
            player:sendMessage("|cFF154360Heavy:|r 2 / 5 / 13 / 15 / 20 / 25 / 30 / 32 / 35")
        elseif command[1] == "fortified" then
            player:sendMessage("|cFFCA8500Fortified:|r 10 / 18 / 22 / 26 / 31")
        elseif command[1] == "hero" then
            player:sendMessage("|cFF7525FFHero:|r 36")
        elseif command[1] == "waves" then
            player:sendMessage("|cFF999999Air:|r 5 / 15 / 20 / 25 / 30\n|cFF3737F2Boss:|r 9 / 14 / 19 / 24 / 29 / 31\n|cFFF2A137Champion:|r 35 / 36\n|cFF6d7c86Light:|r 4 / 8 / 11 / 16 / 19 / 23 / 27 / 32\n|cFF416073Medium:|r 3 / 7 / 12 / 17 / 24 / 28 / 33\n|cFF154360Heavy:|r 2 / 5 / 13 / 15 / 20 / 25 / 30 / 32 / 35\n|cFFCA8500Fortified:|r 10 / 18 / 22 / 26 / 31\n|cFF7525FFHero:|r 36")
        elseif command[1] == "buffs" then
            player:sendMessage("|cFFFFCC00Hardened Skin:|r Creeps ignore 2x creep level incoming physical damage\n" .. "|cFFFFCC00Evasion:|r Creeps will have a 1x creep level chance to evade physical damage\n" .. "|cFFFFCC00Armor Bonus:|r Increases creep armor by creep level divided by 3\n" .. "|cFFFFCC00Cripple Aura:|r Whenever a creep takes damage it has a 10% chance to cripple the attacking tower," .. "slowing attack speed by 1.5% times creep level\n" .. "|cFFFFCC00Spell Shield:|r Blocks targetting spells from casting every 4 (minus 0.1 times creep level) second\n" .. "|cFFFFCC00Tornado Aura:|r Nearby towers are slowed by 1% times creep level\n" .. "|cFFFFCC00Vampiric Aura:|r Creeps have a 10% chance to heal for 4x creep level\n" .. "|cFFFFCC00Divine Shield:|r Creeps ignore damage until they\'ve been damaged 1x creep level times\n" .. "|cFFFFCC00Walk it Off:|r slowed down creeps take 0.5% times creep level less damage\n" .. "|cFFFFCC00Morning Person:|r creeps heal for 0.5% times creep level of their max health every time they " .. "reach a checkpoint (not teleports)")
        elseif command[1] == "repick" then
            if self:RepickConditions(player) then
                self:RepickActions(player)
            else
                DisplayTimedTextToPlayer(
                    GetTriggerPlayer(),
                    0,
                    0,
                    5,
                    "You can only repick before wave 1!"
                )
            end
        elseif command[1] == "sa" or command[1] == "sellall" then
        elseif command[1] == "y" or command[1] == "yes" then
            self:VoteYes(player)
        elseif command[1] == "kick" or command[1] == "votekick" then
            if command[2] then
                local receiver = self:getPlayerIdFromColourName(command[2])
                local receivingPlayer = self.game.players:get(receiver)
                if receivingPlayer then
                    self:VoteKick(player, receivingPlayer)
                else
                    player:sendMessage("Player not available")
                end
            end
        elseif command[1] == "give" or command[1] == "send" then
            if command[2] and command[3] then
                local receiver = self:getPlayerIdFromColourName(command[2])
                local receivingPlayer = self.game.players:get(receiver)
                local amount = Util:ParsePositiveInt(command[3])
                if not amount then
                    player:sendMessage(
                        Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
                    )
                    return
                end
                self:giveGoldToPlayer(receivingPlayer, player, amount)
            end
        elseif command[1] == "allow" then
            if command[2] then
                local receiver = self:getPlayerIdFromColourName(command[2])
                local receivingPlayer = self.game.players:get(receiver)
                if receivingPlayer then
                    player:AllowPlayer(receivingPlayer.id)
                else
                    player:sendMessage(
                        Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Colour")
                    )
                end
            end
        elseif command[1] == "deny" then
            if command[2] then
                local receiver = self:getPlayerIdFromColourName(command[2])
                local receivingPlayer = self.game.players:get(receiver)
                if receivingPlayer then
                    player:DenyPlayer(receivingPlayer.id)
                    player:ClaimTowers()
                else
                    player:sendMessage(
                        Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Colour")
                    )
                end
            end
        elseif command[1] == "allowall" then
            player:AllowAllPlayers()
            player:sendMessage("ALL players are now |cFF00FF00allowed|r to build in your spawn!")
        elseif command[1] == "denyall" then
            player:DenyAllPlayers()
            player:ClaimTowers()
            player:sendMessage("ALL players are now |cFFFF0000denied|r access to your spawn!")
        elseif command[1] == "claim" then
            player:ClaimTowers()
            player:sendMessage("All towers in your spawn has now been claimed.")
        elseif command[1] == "zoom" or command[1] == "cam" then
            if GetLocalPlayer() == player.wcPlayer then
                local amount = Util:ParsePositiveInt(command[2])
                if not amount then
                    player:sendMessage(
                        Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
                    )
                    return
                end
                SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, amount, 1)
            end
        elseif command[1] == "dt" or command[1] == "disabletowers" then
            player:DisableTowers()
        elseif command[1] == "buildings" or command[1] == "towers" then
            if command[2] then
                local receiver = self:getPlayerIdFromColourName(command[2])
                local receivingPlayer = self.game.players:get(receiver)
                if receivingPlayer then
                    if receivingPlayer.hasHybridRandomed then
                        for ____, towerstr in ipairs(receivingPlayer.hybridTowers) do
                            player:sendMessage(
                                self.game.racePicking.HybridPool:get(towerstr).name
                            )
                        end
                    else
                        player:sendMessage(
                            tostring(
                                receivingPlayer:getNameWithColour()
                            ) .. " has not hybrid randomed."
                        )
                    end
                else
                    player:sendMessage(
                        Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Colour")
                    )
                end
            else
                player:sendMessage("Wrong Usage: -buildings <colour>")
            end
        elseif command[1] == "maze" then
            local invalidMaze = false
            if #command == 2 then
                local playerId = GetPlayerId(
                    GetTriggerPlayer()
                )
                local firstSpawn = self.game.worldMap.playerSpawns[playerId + 1].spawnOne
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
                local imagePath = ""
                imagePath = "ReplaceableTextures\\Splats\\SuggestedPlacementSplat.blp"
                local ____switch76 = command[2]
                if ____switch76 == "none" then
                    goto ____switch76_case_0
                end
                if ____switch76 == "1" then
                    goto ____switch76_case_1
                end
                if ____switch76 == "2" then
                    goto ____switch76_case_2
                end
                if ____switch76 == "3" then
                    goto ____switch76_case_3
                end
                goto ____switch76_case_default
                ::____switch76_case_0::
                do
                    player:setHoloMaze(nil)
                    goto ____switch76_end
                end
                ::____switch76_case_1::
                do
                    player:setHoloMaze(
                        CircleHoloMaze.new(
                            imagePath,
                            GetRectCenterX(firstCheckpoint.rectangle),
                            GetRectCenterY(firstCheckpoint.rectangle),
                            GetRectCenterX(secondCheckpoint.rectangle),
                            GetRectCenterY(secondCheckpoint.rectangle)
                        )
                    )
                    goto ____switch76_end
                end
                ::____switch76_case_2::
                do
                    player:setHoloMaze(
                        SimpleHoloMaze.new(
                            imagePath,
                            GetRectCenterX(firstCheckpoint.rectangle),
                            GetRectCenterY(firstCheckpoint.rectangle),
                            GetRectCenterX(secondCheckpoint.rectangle),
                            GetRectCenterY(secondCheckpoint.rectangle)
                        )
                    )
                    goto ____switch76_end
                end
                ::____switch76_case_3::
                do
                    player:setHoloMaze(
                        AdvancedHoloMaze.new(
                            imagePath,
                            GetRectCenterX(firstCheckpoint.rectangle),
                            GetRectCenterY(firstCheckpoint.rectangle),
                            GetRectCenterX(secondCheckpoint.rectangle),
                            GetRectCenterY(secondCheckpoint.rectangle)
                        )
                    )
                    goto ____switch76_end
                end
                ::____switch76_case_default::
                do
                    invalidMaze = true
                    goto ____switch76_end
                end
                ::____switch76_end::
            else
                invalidMaze = true
            end
            if invalidMaze == true then
                player:sendMessage("Unknown maze selected, please try one of the mazes shown below\n" .. "|cFFFFCC00-maze none|r: removes the current maze\n" .. "|cFFFFCC00-maze 1|r: shows a very simple circled maze\n" .. "|cFFFFCC00-maze 2|r: shows a basic maze\n" .. "|cFFFFCC00-maze 3|r: shows a more advanced maze")
            end
        end
        if self.game.debugMode then
            self:handleDebugCommand(player, command, command2)
        end
    end
    function Commands.prototype.getPlayerIdFromColourName(self, color)
        return Util.COLOUR_IDS[string.upper(color)]
    end
    function Commands.prototype.RepickActions(self, player)
        local grp = GetUnitsInRectAll(
            GetPlayableMapRect()
        )
        local maxGold = player.id == COLOUR.GRAY and 150 or 100
        if player:getGold() > maxGold then
            player:setGold(maxGold)
        end
        player:setLumber(1)
        ForGroupBJ(
            grp,
            function() return self:RemovePlayerUnits(player) end
        )
        DestroyGroup(grp)
    end
    function Commands.prototype.RepickConditions(self, player)
        if not (self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.currentWave == 1) then
            return false
        end
        if self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.isWaveInProgress then
            return false
        end
        if player.hasHardcoreRandomed then
            return false
        end
        if player.hasHybridRandomed then
            return false
        end
        return true
    end
    function Commands.prototype.RemovePlayerUnits(self, player)
        if GetOwningPlayer(
            GetEnumUnit()
        ) == player.wcPlayer then
            if self:RepickRemoveConditions(
                GetEnumUnit()
            ) then
                RemoveUnit(
                    GetEnumUnit()
                )
            end
        end
    end
    function Commands.prototype.RepickRemoveConditions(self, Unit)
        if GetUnitTypeId(Unit) == FourCC("h03S") then
            return false
        end
        if GetUnitTypeId(Unit) == FourCC("e00C") then
            return false
        end
        return true
    end
    function Commands.prototype.OpenAllSpawns(self)
        for ____, spawn in ipairs(self.game.worldMap.playerSpawns) do
            spawn.isOpen = true
        end
    end
    function Commands.prototype.CloseAllSpawns(self)
        for ____, spawn in ipairs(self.game.worldMap.playerSpawns) do
            spawn.isOpen = false
        end
    end
    function Commands.prototype.giveGoldToPlayer(self, receivingPlayer, player, amount)
        if receivingPlayer then
            if player:getGold() >= amount then
                player:setGold(
                    player:getGold() - amount
                )
                receivingPlayer:setGold(
                    receivingPlayer:getGold() + amount
                )
                player:sendMessage(
                    "You\'ve sent " .. tostring(
                        Util:ColourString(
                            "#FFCC00",
                            tostring(amount)
                        )
                    ) .. " gold to " .. tostring(
                        receivingPlayer:getNameWithColour()
                    )
                )
                receivingPlayer:sendMessage(
                    "You\'ve received " .. tostring(
                        Util:ColourString(
                            "#FFCC00",
                            tostring(amount)
                        )
                    ) .. " gold from " .. tostring(
                        player:getNameWithColour()
                    )
                )
            else
                player:sendMessage("You do not have this much gold")
            end
        else
            player:sendMessage(
                Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Receiver")
            )
        end
    end
    function Commands.prototype.VoteKick(self, player, receivingPlayer)
        if not self.voteKickInProgress then
            if player ~= receivingPlayer then
                SendMessage(
                    tostring(
                        player:getNameWithColour()
                    ) .. " has started a votekick for " .. tostring(
                        receivingPlayer:getNameWithColour()
                    ) .. " (say -y to vote)"
                )
                self.voteKickInProgress = true
                self.voteAgainstPlayer = receivingPlayer
                self.hasVotedToKick[player.id + 1] = true
                self.game.timedEventQueue:AddEvent(
                    TimedEvent.new(
                        function() return self:VotekickExpire() end,
                        300,
                        false
                    )
                )
            else
                player:sendMessage("You idiot, you cannot stomp your own ass with the front of your own foot.")
            end
        else
            player:sendMessage("There is already a votekick in progress")
        end
    end
    function Commands.prototype.VotekickExpire(self)
        local count = self:CountCurrentVotes()
        if self.voteAgainstPlayer then
            SendMessage(
                "Votekick for " .. tostring(
                    self.voteAgainstPlayer:getNameWithColour()
                ) .. " has ended with " .. tostring(count) .. " votes"
            )
        end
        self.voteKickInProgress = false
        return true
    end
    function Commands.prototype.VoteYes(self, player)
        if self.voteKickInProgress then
            if not self.hasVotedToKick[player.id + 1] then
                if not (self.voteAgainstPlayer == player) then
                    self.hasVotedToKick[player.id + 1] = true
                    self:CheckVotes()
                else
                    player:sendMessage("You can not kick yourself")
                end
            else
                player:sendMessage("You have already voted to kick this player")
            end
        else
            player:sendMessage("There is no votekick in progress")
        end
    end
    function Commands.prototype.CheckVotes(self)
        local currentVotes = self:CountCurrentVotes()
        local neededVotes = (self.game.players.size / 2) + 1
        local missingVotes = neededVotes - currentVotes
        if currentVotes >= neededVotes then
            if self.voteAgainstPlayer then
                self.game.worldMap.playerSpawns[self.voteAgainstPlayer.id + 1].isOpen = false
                self:RemoveAllKickedPlayerTowers()
                if self.game.scoreBoard then
                    MultiboardSetItemValueBJ(
                        self.game.scoreBoard.board,
                        1,
                        7 + self.voteAgainstPlayer.scoreSlot,
                        Util:ColourString(
                            self.voteAgainstPlayer:getColourCode(),
                            "<Kicked>"
                        )
                    )
                end
                self.game.players:delete(self.voteAgainstPlayer.id)
                SendMessage(
                    "Votekick for " .. tostring(
                        self.voteAgainstPlayer:getNameWithColour()
                    ) .. " has succeeded!"
                )
                CustomDefeatBJ(self.voteAgainstPlayer.wcPlayer, "Kicked!")
                self.voteKickInProgress = false
            end
        else
            SendMessage(
                "You\'ll need " .. tostring(missingVotes) .. " more votes to kick"
            )
        end
    end
    function Commands.prototype.CountCurrentVotes(self)
        local count = 0
        do
            local i = 0
            while i < #self.hasVotedToKick do
                if self.hasVotedToKick[i + 1] then
                    count = count + 1
                end
                i = i + 1
            end
        end
        return count
    end
    function Commands.prototype.RemoveAllKickedPlayerTowers(self)
        local grp = GetUnitsInRectAll(
            GetPlayableMapRect()
        )
        ForGroupBJ(
            GetUnitsInRectAll(
                GetPlayableMapRect()
            ),
            function() return self:RemoveKickedPlayerTowers() end
        )
        DestroyGroup(grp)
    end
    function Commands.prototype.RemoveKickedPlayerTowers(self)
        if self:IsPickedUnitOwnedByKickedPlayer() then
            RemoveUnit(
                GetEnumUnit()
            )
        end
    end
    function Commands.prototype.IsPickedUnitOwnedByKickedPlayer(self)
        if not self.voteAgainstPlayer then
            return false
        end
        if not (GetPlayerId(
            GetOwningPlayer(
                GetEnumUnit()
            )
        ) == self.voteAgainstPlayer.id) then
            return false
        end
        if not (GetUnitTypeId(
            GetEnumUnit()
        ) ~= FourCC("h03S")) then
            return false
        end
        return true
    end
    function Commands.prototype.DrawRect(self, rectangle)
        local x1 = rectangle.minX
        local y1 = rectangle.minY
        local x2 = rectangle.maxX
        local y2 = rectangle.maxY
        local model = "Doodads\\Cinematic\\DemonFootPrint\\DemonFootPrint0.mdl"
        local sfx = {}
        do
            local x = x1
            while x < x2 do
                __TS__ArrayPush(
                    sfx,
                    AddSpecialEffect(model, x, y1)
                )
                x = x + 16
            end
        end
        do
            local y = y1
            while y < y2 do
                __TS__ArrayPush(
                    sfx,
                    AddSpecialEffect(model, x2, y)
                )
                y = y + 16
            end
        end
        do
            local x = x1
            while x < x2 do
                __TS__ArrayPush(
                    sfx,
                    AddSpecialEffect(model, x, y2)
                )
                x = x + 16
            end
        end
        do
            local y = y1
            while y < y2 do
                __TS__ArrayPush(
                    sfx,
                    AddSpecialEffect(model, x1, y)
                )
                y = y + 16
            end
        end
        __TS__ArrayPush(self.drawings, sfx)
    end
    function Commands.prototype.DestroyDrawings(self)
        for ____, drawing in ipairs(self.drawings) do
            for sfx in __TS__Iterator(drawing) do
                DestroyEffect(sfx)
            end
        end
        self.drawings = {}
    end
    function Commands.prototype.TestTimeout(self)
        self.game.timedEventQueue:AddEvent(
            TimedEvent.new(
                function() return self:Timeout() end,
                20,
                false
            )
        )
    end
    function Commands.prototype.Timeout(self)
        Log.Debug("Hello world")
        return true
    end
    function Commands.prototype.MazeToString(self, maze)
        local output = "["
        Preload("{\"logevent\":}")
        do
            local i = 0
            while i < #maze do
                do
                    if i == #maze - 1 then
                        Preload(
                            "\"" .. tostring(
                                Util:ArraysToString(maze[i + 1])
                            ) .. "\""
                        )
                        goto __continue147
                    end
                    Preload(
                        "\"" .. tostring(
                            Util:ArraysToString(maze[i + 1])
                        ) .. "\""
                    )
                end
                ::__continue147::
                i = i + 1
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Game.Commands"] = {initialized = false, cached = nil, loader = __module_178}
function __module_179()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local settings = require("app.src.World.GlobalSettings")
    local ____GlobalSettings = require("app.src.World.GlobalSettings")
    local ARMOUR_TYPE_COLOURS = ____GlobalSettings.ARMOUR_TYPE_COLOURS
    local ARMOUR_TYPE_NAMES = ____GlobalSettings.ARMOUR_TYPE_NAMES
    ____exports.MultiBoard = {}
    local MultiBoard = ____exports.MultiBoard
    MultiBoard.name = "MultiBoard"
    MultiBoard.__index = MultiBoard
    MultiBoard.prototype = {}
    MultiBoard.prototype.__index = MultiBoard.prototype
    MultiBoard.prototype.constructor = MultiBoard
    function MultiBoard.new(...)
        local self = setmetatable({}, MultiBoard.prototype)
        self:____constructor(...)
        return self
    end
    function MultiBoard.prototype.____constructor(self, game)
        self.scoreboardColumnWidth = {}
        self.game = game
        self.scoreboardColumnWidth[2] = 10
        self.scoreboardColumnWidth[3] = 8
        self.board = CreateMultiboardBJ(2, self.game.players.size + 6, settings.GAME_NAME)
        MultiboardSetItemValueBJ(self.board, 1, 1, "Starting in")
        MultiboardSetItemValueBJ(
            self.board,
            2,
            1,
            tostring(self.game.waveTimer)
        )
        MultiboardSetItemValueBJ(self.board, 1, 2, "Level")
        if self.game.worldMap.gameRoundHandler then
            MultiboardSetItemValueBJ(
                self.board,
                2,
                2,
                tostring(self.game.worldMap.gameRoundHandler.currentWave)
            )
        end
        MultiboardSetItemValueBJ(self.board, 1, 3, "Difficulty")
        MultiboardSetItemValueBJ(self.board, 1, 4, "Lives")
        MultiboardSetItemValueBJ(
            self.board,
            2,
            4,
            tostring(self.game.gameLives) .. "%"
        )
        MultiboardSetItemValueBJ(self.board, 1, 5, "Armour Type")
        local armourType = string.lower(
            ARMOUR_TYPE_NAMES[self.game.worldMap.waveCreeps[1]:getArmourType() + 1]
        )
        armourType = tostring(
            string.upper(
                string.sub(armourType, 1, 1)
            )
        ) .. tostring(
            string.sub(armourType, 2)
        )
        MultiboardSetItemValueBJ(
            self.board,
            2,
            5,
            Util:ColourString(
                ARMOUR_TYPE_COLOURS[self.game.worldMap.waveCreeps[1]:getArmourType() + 1],
                armourType
            )
        )
        MultiboardSetItemValueBJ(self.board, 1, 7, "Player")
        MultiboardSetItemValueBJ(self.board, 2, 7, "Kills")
        MultiboardSetItemWidthBJ(self.board, 1, 1, self.scoreboardColumnWidth[2])
        MultiboardSetItemWidthBJ(self.board, 2, 1, self.scoreboardColumnWidth[3])
        MultiboardSetItemWidthBJ(self.board, 1, 2, self.scoreboardColumnWidth[2])
        MultiboardSetItemWidthBJ(self.board, 2, 2, self.scoreboardColumnWidth[3])
        MultiboardSetItemWidthBJ(self.board, 1, 3, self.scoreboardColumnWidth[2])
        MultiboardSetItemWidthBJ(self.board, 2, 3, self.scoreboardColumnWidth[3])
        MultiboardSetItemWidthBJ(self.board, 1, 4, self.scoreboardColumnWidth[2])
        MultiboardSetItemWidthBJ(self.board, 2, 4, self.scoreboardColumnWidth[3])
        MultiboardSetItemWidthBJ(self.board, 1, 5, self.scoreboardColumnWidth[2])
        MultiboardSetItemWidthBJ(self.board, 2, 5, self.scoreboardColumnWidth[3])
        MultiboardSetItemWidthBJ(self.board, 1, 6, self.scoreboardColumnWidth[2])
        MultiboardSetItemWidthBJ(self.board, 2, 6, self.scoreboardColumnWidth[3])
        MultiboardSetItemStyleBJ(self.board, 1, 1, true, false)
        MultiboardSetItemStyleBJ(self.board, 2, 1, true, false)
        MultiboardSetItemStyleBJ(self.board, 1, 2, true, false)
        MultiboardSetItemStyleBJ(self.board, 2, 2, true, false)
        MultiboardSetItemStyleBJ(self.board, 1, 3, true, false)
        MultiboardSetItemStyleBJ(self.board, 2, 3, true, false)
        MultiboardSetItemStyleBJ(self.board, 1, 4, true, false)
        MultiboardSetItemStyleBJ(self.board, 2, 4, true, false)
        MultiboardSetItemStyleBJ(self.board, 1, 5, true, false)
        MultiboardSetItemStyleBJ(self.board, 2, 5, true, false)
        MultiboardSetItemStyleBJ(self.board, 1, 6, true, false)
        MultiboardSetItemStyleBJ(self.board, 2, 6, true, false)
        self:InitializePlayerScores()
        MultiboardDisplayBJ(true, self.board)
    end
    function MultiBoard.prototype.InitializePlayerScores(self)
        local count = 0
        do
            local i = 0
            while i < bj_MAX_PLAYER_SLOTS do
                local player = self.game.players:get(i)
                if player then
                    player.scoreSlot = count
                    MultiboardSetItemValueBJ(
                        self.board,
                        1,
                        7 + count,
                        player:getNameWithColour()
                    )
                    MultiboardSetItemValueBJ(
                        self.board,
                        2,
                        7 + count,
                        tostring(player.kills)
                    )
                    MultiboardSetItemStyleBJ(self.board, 1, 7 + count, true, false)
                    MultiboardSetItemStyleBJ(self.board, 2, 7 + count, true, false)
                    MultiboardSetItemWidthBJ(self.board, 1, 7 + count, self.scoreboardColumnWidth[2])
                    MultiboardSetItemWidthBJ(self.board, 2, 7 + count, self.scoreboardColumnWidth[3])
                    count = count + 1
                end
                i = i + 1
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Game.MultiBoard"] = {initialized = false, cached = nil, loader = __module_179}
function __module_180()
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
    
end
__modules["app.src.World.Game.BaseMaul.AbstractGameRound"] = {initialized = false, cached = nil, loader = __module_180}
function __module_181()
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
    
end
__modules["app.src.World.Game.ClassicMaul.ClassicGameRound"] = {initialized = false, cached = nil, loader = __module_181}
function __module_182()
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
    
end
__modules["app.src.World.Game.BlitzMaul.BlitzGameRound"] = {initialized = false, cached = nil, loader = __module_182}
function __module_183()
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
    
end
__modules["app.src.World.Game.Vote"] = {initialized = false, cached = nil, loader = __module_183}
function __module_184()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    local ____hybridRandomGEN = require("app.src.Generated.hybridRandomGEN")
    local HybridTierEight = ____hybridRandomGEN.HybridTierEight
    local HybridTierFive = ____hybridRandomGEN.HybridTierFive
    local HybridTierFour = ____hybridRandomGEN.HybridTierFour
    local HybridTierNine = ____hybridRandomGEN.HybridTierNine
    local HybridTierOne = ____hybridRandomGEN.HybridTierOne
    local HybridTierSeven = ____hybridRandomGEN.HybridTierSeven
    local HybridTierSix = ____hybridRandomGEN.HybridTierSix
    local HybridTierThree = ____hybridRandomGEN.HybridTierThree
    local HybridTierTwo = ____hybridRandomGEN.HybridTierTwo
    ____exports.RacePicking = {}
    local RacePicking = ____exports.RacePicking
    RacePicking.name = "RacePicking"
    RacePicking.__index = RacePicking
    RacePicking.prototype = {}
    RacePicking.prototype.__index = RacePicking.prototype
    RacePicking.prototype.constructor = RacePicking
    function RacePicking.new(...)
        local self = setmetatable({}, RacePicking.prototype)
        self:____constructor(...)
        return self
    end
    function RacePicking.prototype.____constructor(self, game)
        self.HybridPool = Map.new()
        self.game = game
        self.raceSelectTrigger = Trigger.new()
        self.raceSelectTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SELL_ITEM)
        self.raceSelectTrigger:AddCondition(
            function() return self:RaceSelectionConditions() end
        )
        self.raceSelectTrigger:AddAction(
            function() return self:RaceSelectionActions() end
        )
        self:CreateHybridPool()
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("h03Q"),
            -1920,
            3000,
            0
        )
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("h00H"),
            -1920,
            2624,
            0
        )
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("h00O"),
            -1920,
            2240,
            0
        )
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("h03C"),
            -1920,
            1856,
            0
        )
        CreateUnit(
            Player(PLAYER_NEUTRAL_PASSIVE),
            FourCC("h03K"),
            -1920,
            1472,
            0
        )
        for player in __TS__Iterator(
            self.game.players:values()
        ) do
            CreateUnit(
                player.wcPlayer,
                FourCC("e00C"),
                -1920,
                3000,
                0
            )
            CreateUnit(
                player.wcPlayer,
                FourCC("e00C"),
                -1920,
                2624,
                0
            )
            CreateUnit(
                player.wcPlayer,
                FourCC("e00C"),
                -1920,
                2240,
                0
            )
            CreateUnit(
                player.wcPlayer,
                FourCC("e00C"),
                -1920,
                1856,
                0
            )
            CreateUnit(
                player.wcPlayer,
                FourCC("e00C"),
                -1920,
                1472,
                0
            )
        end
    end
    function RacePicking.prototype.RaceSelectionConditions(self)
        if GetUnitTypeId(
            GetSellingUnit()
        ) == FourCC("h03Q") then
            return true
        end
        if GetUnitTypeId(
            GetSellingUnit()
        ) == FourCC("h00H") then
            return true
        end
        if GetUnitTypeId(
            GetSellingUnit()
        ) == FourCC("h00O") then
            return true
        end
        if GetUnitTypeId(
            GetSellingUnit()
        ) == FourCC("h03C") then
            return true
        end
        if GetUnitTypeId(
            GetSellingUnit()
        ) == FourCC("h03K") then
            return true
        end
        return false
    end
    function RacePicking.prototype.PickRaceForPlayerByItem(self, player, raceItem)
        if raceItem == FourCC("I00W") then
            if player.hasHybridRandomed then
                player:giveLumber(1)
                player:sendMessage("You can only use Hybrid Random!")
            else
                if not player.hasHardcoreRandomed then
                    if player.repickCounter == 0 then
                        player.hasHardcoreRandomed = true
                        self:HardCoreRandomRace(player)
                        player:giveGold(50)
                    else
                        player:giveLumber(1)
                        player:sendMessage("You can\'t hardcore random after using normal random!")
                    end
                else
                    player:giveLumber(1)
                end
            end
        elseif raceItem == FourCC("I00V") then
            if player.hasHybridRandomed then
                player:giveLumber(1)
                player:sendMessage("You can only use Hybrid Random!")
            else
                if player.repickCounter < 3 then
                    player.repickCounter = player.repickCounter + 1
                end
                player:giveGold(40 - 10 * player.repickCounter)
                self:NormalRandomRace(player)
            end
        elseif raceItem == FourCC("I00X") then
            if player.repickCounter == 0 and not player.hasHardcoreRandomed and not player.hasNormalPicked then
                self:HybridRandomRace(player)
                player:giveGold(50)
            else
                player:giveLumber(1)
                player:sendMessage("You can\'t hybrid random after using normal / hardcore random / selection!")
            end
        else
            if player.hasHybridRandomed then
                player:giveLumber(1)
                player:sendMessage("You can only use Hybrid Random!")
            else
                player.hasNormalPicked = true
                self:GetSelectedRace(player, raceItem)
            end
        end
    end
    function RacePicking.prototype.RaceSelectionActions(self)
        local player = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(
                    GetBuyingUnit()
                )
            )
        )
        if not player then
            return
        end
        self.game.worldMap.playerSpawns[player.id + 1].isOpen = true
        local soldItem = GetItemTypeId(
            GetSoldItem()
        )
        self:PickRaceForPlayerByItem(player, soldItem)
    end
    function RacePicking.prototype.HardCoreRandomRace(self, player)
        local randomedRace = self:RandomRace(player)
        if randomedRace then
            SendMessage(
                tostring(
                    player:getNameWithColour()
                ) .. " has |cFF375FF1ra|r|cFF364CF0nd|r|cFF3535EFom|r|cFF4A34EFed|r " .. tostring(randomedRace.name)
            )
        end
    end
    function RacePicking.prototype.GiveBuyingPlayerBuilder(self, player, randomedRace)
        randomedRace:pickAction(player)
    end
    function RacePicking.prototype.GetSelectedRace(self, player, soldItem)
        local race = self:getRaceFromItem(soldItem)
        if race then
            __TS__ArrayPush(player.races, race)
            race:pickAction(player)
            SendMessage(
                tostring(
                    player:getNameWithColour()
                ) .. " has chosen " .. tostring(race.name)
            )
        end
    end
    function RacePicking.prototype.getRaceFromItem(self, soldItem)
        for ____, race in ipairs(self.game.worldMap.races) do
            if FourCC(race.itemid) == soldItem then
                return race
            end
        end
        return nil
    end
    function RacePicking.prototype.NormalRandomRace(self, player)
        local randomedRace = self:RandomRace(player)
        if randomedRace then
            SendMessage(
                tostring(
                    player:getNameWithColour()
                ) .. " has |cFF375FF1ra|r|cFF364CF0nd|r|cFF3535EFom|r|cFF4A34EFed|r " .. tostring(randomedRace.name)
            )
        end
    end
    function RacePicking.prototype.RandomRace(self, player)
        local randomNumber = Util:RandomInt(0, #self.game.worldMap.races - 1)
        if #self.game.worldMap.races - #player.races <= self.game.worldMap.disabledRaces then
            player:giveLumber(1)
            return
        end
        local randomedRace = self.game.worldMap.races[randomNumber + 1]
        if not randomedRace.enabled then
            return self:RandomRace(player)
        end
        if player:hasRace(randomedRace) then
            return self:RandomRace(player)
        end
        __TS__ArrayPush(player.races, randomedRace)
        self:GiveBuyingPlayerBuilder(player, randomedRace)
        return randomedRace
    end
    function RacePicking.prototype.randomChoice(self, myarr, blacklist)
        if blacklist == nil then
            blacklist = {}
        end
        local choice = myarr[math.floor(
            math.random() * #myarr
        ) + 1]
        if __TS__ArrayIndexOf(blacklist, choice) >= 0 then
            choice = self:randomChoice(myarr, blacklist)
        end
        return choice
    end
    function RacePicking.prototype.HybridRandomRace(self, player)
        local t1 = self:randomChoice(HybridTierOne, player.hybridTowers).id
        local t2 = self:randomChoice(HybridTierTwo, player.hybridTowers).id
        local t3 = self:randomChoice(HybridTierThree, player.hybridTowers).id
        local t4 = self:randomChoice(HybridTierFour, player.hybridTowers).id
        local t5 = self:randomChoice(HybridTierFive, player.hybridTowers).id
        local t6 = self:randomChoice(HybridTierSix, player.hybridTowers).id
        local t7 = self:randomChoice(HybridTierSeven, player.hybridTowers).id
        local t8 = self:randomChoice(HybridTierEight, player.hybridTowers).id
        local t9 = self:randomChoice(HybridTierNine, player.hybridTowers).id
        player.hybridTowers = {}
        __TS__ArrayPush(player.hybridTowers, t1)
        __TS__ArrayPush(player.hybridTowers, t2)
        __TS__ArrayPush(player.hybridTowers, t3)
        __TS__ArrayPush(player.hybridTowers, t4)
        __TS__ArrayPush(player.hybridTowers, t5)
        __TS__ArrayPush(player.hybridTowers, t6)
        __TS__ArrayPush(player.hybridTowers, t7)
        __TS__ArrayPush(player.hybridTowers, t8)
        __TS__ArrayPush(player.hybridTowers, t9)
        if not player.hasHybridRandomed then
            player.hybridBuilder = CreateUnit(
                player.wcPlayer,
                FourCC("e00I"),
                player:getCenterX(),
                player:getCenterY(),
                0
            )
        end
        player.hasHybridRandomed = true
        for ____, tower in ipairs(HybridTierOne) do
            if tower.id ~= t1 then
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    false,
                    player.wcPlayer
                )
            else
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    true,
                    player.wcPlayer
                )
            end
        end
        for ____, tower in ipairs(HybridTierTwo) do
            if tower.id ~= t2 then
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    false,
                    player.wcPlayer
                )
            else
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    true,
                    player.wcPlayer
                )
            end
        end
        for ____, tower in ipairs(HybridTierThree) do
            if tower.id ~= t3 then
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    false,
                    player.wcPlayer
                )
            else
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    true,
                    player.wcPlayer
                )
            end
        end
        for ____, tower in ipairs(HybridTierFour) do
            if tower.id ~= t4 then
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    false,
                    player.wcPlayer
                )
            else
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    true,
                    player.wcPlayer
                )
            end
        end
        for ____, tower in ipairs(HybridTierFive) do
            if tower.id ~= t5 then
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    false,
                    player.wcPlayer
                )
            else
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    true,
                    player.wcPlayer
                )
            end
        end
        for ____, tower in ipairs(HybridTierSix) do
            if tower.id ~= t6 then
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    false,
                    player.wcPlayer
                )
            else
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    true,
                    player.wcPlayer
                )
            end
        end
        for ____, tower in ipairs(HybridTierSeven) do
            if tower.id ~= t7 then
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    false,
                    player.wcPlayer
                )
            else
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    true,
                    player.wcPlayer
                )
            end
        end
        for ____, tower in ipairs(HybridTierEight) do
            if tower.id ~= t8 then
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    false,
                    player.wcPlayer
                )
            else
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    true,
                    player.wcPlayer
                )
            end
        end
        for ____, tower in ipairs(HybridTierNine) do
            if tower.id ~= t9 then
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    false,
                    player.wcPlayer
                )
            else
                SetPlayerUnitAvailableBJ(
                    FourCC(tower.id),
                    true,
                    player.wcPlayer
                )
            end
        end
        SendMessage(
            tostring(
                player:getNameWithColour()
            ) .. " has |cFFB0F442hy|r|cFF8CF442b|r|cFF42F4C5r|r|cFF42F4F1id|r randomed!"
        )
    end
    function RacePicking.prototype.CreateHybridPool(self)
        __TS__ArrayForEach(
            HybridTierEight,
            function(____, d) return self.HybridPool:set(d.id, d) end
        )
        __TS__ArrayForEach(
            HybridTierFive,
            function(____, d) return self.HybridPool:set(d.id, d) end
        )
        __TS__ArrayForEach(
            HybridTierFour,
            function(____, d) return self.HybridPool:set(d.id, d) end
        )
        __TS__ArrayForEach(
            HybridTierNine,
            function(____, d) return self.HybridPool:set(d.id, d) end
        )
        __TS__ArrayForEach(
            HybridTierOne,
            function(____, d) return self.HybridPool:set(d.id, d) end
        )
        __TS__ArrayForEach(
            HybridTierSeven,
            function(____, d) return self.HybridPool:set(d.id, d) end
        )
        __TS__ArrayForEach(
            HybridTierSix,
            function(____, d) return self.HybridPool:set(d.id, d) end
        )
        __TS__ArrayForEach(
            HybridTierThree,
            function(____, d) return self.HybridPool:set(d.id, d) end
        )
        __TS__ArrayForEach(
            HybridTierTwo,
            function(____, d) return self.HybridPool:set(d.id, d) end
        )
    end
    return ____exports
    
end
__modules["app.src.World.Game.RacePicking"] = {initialized = false, cached = nil, loader = __module_184}
function __module_185()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    ____exports.Quests = {{title = "0.0.1", icon = "ReplaceableTextures\\CommandButtons\\BTNAmbush.blp", stype = bj_QUESTTYPE_REQ_DISCOVERED, body = "Updates:\n - fixed Green and Teal\'s broken spawns\n"}, {title = "Commands", icon = "ReplaceableTextures\\CommandButtons\\BTNReplay-Loop.blp", stype = bj_QUESTTYPE_OPT_DISCOVERED, body = "List of in-game commands\n\n|cffffcc00-waves|r (shows you information about every wave)\n|cffffcc00-air|r (tells you when air waves are coming)\n|cffffcc00-boss|r (Tells you when boss waves are coming)\n|cffffcc00-champion|r (tells you when champion waves are coming)\n|cffffcc00-light|r (tells you when light armored waves are coming)\n|cffffcc00-medium|r (tells you when medium armored waves are coming)\n|cffffcc00-heavy|r (tells you when heavy armored waves are coming)\n|cffffcc00-fortified|r (tells you when fortified armor waves are coming)\n|cffffcc00-hero|r (tells you when hero armored waves are coming)\n|cffffcc00-sellall|r or |cffffcc00-sa|r (sells all towers given to you when a player left)\n|cffffcc00-claim|r (claims ownership of all towers built in your area.)"}, {title = "Commands 2", icon = "ReplaceableTextures\\CommandButtons\\BTNReplay-Loop.blp", stype = bj_QUESTTYPE_OPT_DISCOVERED, body = "List of in-game commands\n\n|cffffcc00-deny <color>|r (denies the specified color access to your spawn and gives their towers to you)\n|cffffcc00-allow <color>|r (allows the specified color access to your spawn)\n|cffffcc00-denyall|r (denies access to your spawn for all players)\n|cffffcc00-allowall|r (allows access to your spawn for all players)\n|cffffcc00-zoom <value>|r (zooms your camera out)\n|cffffcc00-buffs|r (gives detailed information about creep buffs)\n|cffffcc00-dt/-disabletowers|r (disables your basic tier 1 tower that sell for 10 or less gold)\n|cffffcc00-give <color> <amount>|r (gives the specified color a specified amount of gold)\n|cffffcc00-votekick <color>|r (starts a votekick for the specified color)\n-buildings <colour> (Gets List of players hybrid towers)"}, {title = "Bugs & Suggestions", icon = "ReplaceableTextures\\CommandButtons\\BTNReplay-Play.blp", stype = bj_QUESTTYPE_OPT_DISCOVERED, body = "If you find a bug or want to suggest a change or feature for our map please post it on maulbot.com and our developers will happily look into it!\n(Please make your post detailed so it\'s easier for us to find the bug or implement your feature)"}, {title = "Armor types", icon = "ReplaceableTextures\\CommandButtons\\BTNHumanArmorUpOne.blp", stype = bj_QUESTTYPE_OPT_DISCOVERED, body = "Unarmored takes 150% damage from piercing attacks and 150% damage from siege\nLight takes 200% from piercing and 125% from magic attacks\nMedium takes 150% damage from normal, 75% from piercing, 75% from magic and 50% from siege\nHeavy armor takes 200% damage from magic attacks\nFortified takes 70% from normal, 35% from piercing, 35% from magic, 150% from siege and 50% from hero\n\nAnything unmentioned deals the standard 100% damage"}}
    return ____exports
    
end
__modules["app.src.Generated.questsGEN"] = {initialized = false, cached = nil, loader = __module_185}
function __module_186()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    ____exports.BUILD_DATE = "Sep 30 2019"
    ____exports.BUILD_NUMBER = "NaN"
    return ____exports
    
end
__modules["app.src.Generated.Version"] = {initialized = false, cached = nil, loader = __module_186}
function __module_187()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    local settings = require("app.src.World.GlobalSettings")
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    local ____Maze = require("app.src.World.Antiblock.Maze")
    local Walkable = ____Maze.Walkable
    local ____AntiJuggleTower = require("app.src.World.Entity.AntiJuggle.AntiJuggleTower")
    local AntiJuggleTower = ____AntiJuggleTower.AntiJuggleTower
    ____exports.SellTower = {}
    local SellTower = ____exports.SellTower
    SellTower.name = "SellTower"
    SellTower.__index = SellTower
    SellTower.prototype = {}
    SellTower.prototype.__index = SellTower.prototype
    SellTower.prototype.constructor = SellTower
    function SellTower.new(...)
        local self = setmetatable({}, SellTower.prototype)
        self:____constructor(...)
        return self
    end
    function SellTower.prototype.____constructor(self, game)
        self._game = game
        self._sellTrigger = Trigger.new()
        self._sellTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_EFFECT)
        self._sellTrigger:AddCondition(
            function() return self:AreWeSellingTheTower() end
        )
        self._sellTrigger:AddAction(
            function() return self:FindAndSellTower() end
        )
    end
    function SellTower.prototype.AreWeSellingTheTower(self)
        return GetSpellAbilityId() == FourCC("A02D")
    end
    function SellTower.prototype.SellTower(self, unit)
        local playerSpawnId
        local value = GetUnitPointValue(unit)
        do
            local i = 0
            while i < #settings.PLAYER_AREAS do
                if settings.PLAYER_AREAS[i + 1]:ContainsUnit(unit) then
                    playerSpawnId = i
                    break
                end
                i = i + 1
            end
        end
        if playerSpawnId == nil then
            Log.Fatal("Unable to locate the correct player spawn")
            return
        end
        local owningPlayer = GetOwningPlayer(unit)
        local player = self._game.players:get(
            GetPlayerId(owningPlayer)
        )
        if player then
            local tower = player:GetTower(
                GetHandleId(unit)
            )
            if tower then
                value = math.floor(
                    tower:GetSellValue()
                )
                if tower:GetTypeID() ~= FourCC("n01Y") and tower:GetTypeID() ~= FourCC("n00M") and tower:GetTypeID() ~= FourCC("e00L") then
                    value = Util:Round(value * 0.75)
                end
                tower:Sell()
            end
            if not (GetUnitAbilityLevel(
                unit,
                FourCC("A02D")
            ) > 0) then
                value = 0
            end
            if player then
                player:giveGold(value)
            end
            local txt = CreateTextTagUnitBJ(
                ToString(nil, value),
                unit,
                1,
                10,
                100,
                80,
                0,
                0
            )
            SetTextTagPermanentBJ(txt, false)
            SetTextTagLifespanBJ(txt, 2)
            SetTextTagVelocityBJ(txt, 64, 90)
            DestroyEffect(
                AddSpecialEffect(
                    "Abilities\\Spells\\Items\\ResourceItems\\ResourceEffectTarget.mdl",
                    GetUnitX(unit),
                    GetUnitY(unit)
                )
            )
            PlaySoundOnUnitBJ(settings.Sounds.goldSound, 100, unit)
            local isWaveInProgress = (self._game.worldMap.gameRoundHandler and function() return self._game.worldMap.gameRoundHandler.isWaveInProgress end or function() return false end)()
            local x = GetUnitX(unit)
            local y = GetUnitY(unit)
            if isWaveInProgress and tower then
                local antijuggle = AntiJuggleTower.new(self._game, tower)
            else
                Log.Debug("Setting maze")
                local maze = self._game.worldMap.playerMazes[playerSpawnId + 1]
                local leftSide = ((x - 64) - maze.minX) / 64
                local rightSide = (x - maze.minX) / 64
                local topSide = (y - maze.minY) / 64
                local bottomSide = ((y - 64) - maze.minY) / 64
                maze:setWalkable(leftSide, bottomSide, Walkable.Walkable)
                maze:setWalkable(rightSide, bottomSide, Walkable.Walkable)
                maze:setWalkable(leftSide, topSide, Walkable.Walkable)
                maze:setWalkable(rightSide, topSide, Walkable.Walkable)
                RemoveUnit(unit)
            end
        end
    end
    function SellTower.prototype.FindAndSellTower(self)
        local unit = GetTriggerUnit()
        self:SellTower(unit)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Tower.SellTower"] = {initialized = false, cached = nil, loader = __module_187}
function __module_188()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    local settings = require("app.src.World.GlobalSettings")
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    ____exports.DamageEngine = {}
    local DamageEngine = ____exports.DamageEngine
    DamageEngine.name = "DamageEngine"
    DamageEngine.__index = DamageEngine
    DamageEngine.prototype = {}
    DamageEngine.prototype.__index = DamageEngine.prototype
    DamageEngine.prototype.constructor = DamageEngine
    function DamageEngine.new(...)
        local self = setmetatable({}, DamageEngine.prototype)
        self:____constructor(...)
        return self
    end
    function DamageEngine.prototype.____constructor(self, damageEngineGlobals)
        self.initialDamageEvent = {}
        self.initialDamageEventTowers = Map.new()
        self.initialDamageModificationEventTowers = Map.new()
        self.initialDamageEventBuffs = {}
        self.initialDamageEventAbilities = {}
        self.initialDamageEventCreepAbilities = {}
        self.multiplicativeDamageModificationEventBuff = {}
        self.zeroDamageEvent = {}
        self.damageEventAOEActions = {}
        self.damageEventLethalActions = {}
        self.initialDamageModificationEvent = {}
        self.multiplicativeDamageModificationEvent = {}
        self.preFinalDamageModificationEvent = {}
        self.finalDamageModificationEvent = {}
        self.finalDamageModificationCreepAbilities = {}
        self.afterDamageEvent = {}
        self.started = false
        self.finished = false
        self.recursion = -1
        self.recursive = false
        self.purge = false
        self.preDamage = false
        self.holdClear = false
        self.ticker = CreateTimer()
        self.trig = Trigger.new()
        self.otrg = Trigger.new()
        self.previousAmount = 0
        self.previousValue = 0
        self.previousType = 0
        self.previousCode = false
        self.previousPierce = 0
        self.armorType = 0
        self.previousArmor = 0
        self.prevPreArmor = 0
        self.defenseType = 0
        self.previousDefense = 0
        self.prevPreDefense = 0
        self.lastSource = {}
        self.lastTarget = {}
        self.lastAmount = {}
        self.lastAttackT = {}
        self.lastDamageT = {}
        self.lastWeaponT = {}
        self.lastTrig = {}
        self.lastType = {}
        self.damageEngineGlobals = damageEngineGlobals
        self.otrg:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_DAMAGED)
        self.otrg:AddFilterFuncCondition(
            Filter(
                function() return self:OnDamage() end
            )
        )
        self.trig:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_DAMAGING)
        self.trig:AddFilterFuncCondition(
            Filter(
                function() return self:OnPreDamage() end
            )
        )
    end
    function DamageEngine.prototype.AddInitialDamageEvent(self, event)
        __TS__ArrayPush(self.initialDamageEvent, event)
    end
    function DamageEngine.prototype.AddInitialDamageEventTower(self, handleId, tower)
        self.initialDamageEventTowers:set(handleId, tower)
    end
    function DamageEngine.prototype.AddInitialDamageEventBuff(self, buff)
        __TS__ArrayPush(self.initialDamageEventBuffs, buff)
    end
    function DamageEngine.prototype.AddInitialDamageEventAbility(self, ability)
        __TS__ArrayPush(self.initialDamageEventAbilities, ability)
    end
    function DamageEngine.prototype.AddInitialDamageEventCreepAbility(self, ability)
        __TS__ArrayPush(self.initialDamageEventCreepAbilities, ability)
    end
    function DamageEngine.prototype.AddZeroDamageEvent(self, event)
        __TS__ArrayPush(self.zeroDamageEvent, event)
    end
    function DamageEngine.prototype.AddInitialDamageModificationEvent(self, event)
        __TS__ArrayPush(self.initialDamageModificationEvent, event)
    end
    function DamageEngine.prototype.AddInitialDamageModificationEventTower(self, handleId, tower)
        self.initialDamageModificationEventTowers:set(handleId, tower)
    end
    function DamageEngine.prototype.AddMultiplicativeDamageModificationEvent(self, event)
        __TS__ArrayPush(self.multiplicativeDamageModificationEvent, event)
    end
    function DamageEngine.prototype.AddMultiplicativeDamageModificationEventBuff(self, buff)
        __TS__ArrayPush(self.multiplicativeDamageModificationEventBuff, buff)
    end
    function DamageEngine.prototype.AddPreFinalDamageModificationEvent(self, event)
        __TS__ArrayPush(self.preFinalDamageModificationEvent, event)
    end
    function DamageEngine.prototype.AddLethalDamageEvent(self, event)
        __TS__ArrayPush(self.damageEventLethalActions, event)
    end
    function DamageEngine.prototype.AddAOEDamageEvent(self, event)
        __TS__ArrayPush(self.damageEventAOEActions, event)
    end
    function DamageEngine.prototype.AddFinalDamageModificationEvent(self, event)
        __TS__ArrayPush(self.finalDamageModificationEvent, event)
    end
    function DamageEngine.prototype.AddFinalDamageModificationCreepAbility(self, ObjectExtendsAbility)
        __TS__ArrayPush(self.finalDamageModificationCreepAbilities, ObjectExtendsAbility)
    end
    function DamageEngine.prototype.AddAfterDamageEvent(self, event)
        __TS__ArrayPush(self.afterDamageEvent, event)
    end
    function DamageEngine.prototype.InitialDamageEvent(self)
        if self.damageEngineGlobals.udg_DamageEventSource then
            local handleId = GetHandleId(self.damageEngineGlobals.udg_DamageEventSource)
            local damagingUnit = self.initialDamageEventTowers:get(handleId)
            if damagingUnit then
                damagingUnit:AttackAction()
            end
        end
        __TS__ArrayForEach(
            self.initialDamageEventBuffs,
            function(____, buff) return buff:AttackAction() end
        )
        __TS__ArrayForEach(
            self.initialDamageEventAbilities,
            function(____, ability) return ability:AttackAction() end
        )
        __TS__ArrayForEach(
            self.initialDamageEventCreepAbilities,
            function(____, ability) return ability:AttackAction() end
        )
    end
    function DamageEngine.prototype.ZeroDamageEvent(self)
        __TS__ArrayForEach(
            self.zeroDamageEvent,
            function(____, action) return action(nil) end
        )
    end
    function DamageEngine.prototype.DamageEventAOE(self)
        __TS__ArrayForEach(
            self.damageEventAOEActions,
            function(____, action) return action(nil) end
        )
    end
    function DamageEngine.prototype.DamageEventLethal(self)
        __TS__ArrayForEach(
            self.damageEventLethalActions,
            function(____, action) return action(nil) end
        )
    end
    function DamageEngine.prototype.InitialDamageModificationEvent(self)
        if self.damageEngineGlobals.udg_DamageEventSource then
            local handleId = GetHandleId(self.damageEngineGlobals.udg_DamageEventSource)
            local damagingUnit = self.initialDamageModificationEventTowers:get(handleId)
            if damagingUnit then
                damagingUnit:InitialDamageModification()
            end
        end
    end
    function DamageEngine.prototype.MultiplicativeDamageModificationEvent(self)
        __TS__ArrayForEach(
            self.multiplicativeDamageModificationEvent,
            function(____, action) return action(nil) end
        )
        __TS__ArrayForEach(
            self.multiplicativeDamageModificationEventBuff,
            function(____, buff) return buff:ModifyDamage() end
        )
    end
    function DamageEngine.prototype.PreFinalDamageModificationEvent(self)
        __TS__ArrayForEach(
            self.preFinalDamageModificationEvent,
            function(____, action) return action(nil) end
        )
    end
    function DamageEngine.prototype.FinalDamageModificationEvent(self)
        __TS__ArrayForEach(
            self.finalDamageModificationEvent,
            function(____, action) return action(nil) end
        )
        __TS__ArrayForEach(
            self.finalDamageModificationCreepAbilities,
            function(____, ability) return ability:ModifyFinalDamage() end
        )
    end
    function DamageEngine.prototype.AfterDamageEvent(self)
        __TS__ArrayForEach(
            self.afterDamageEvent,
            function(____, action) return action(nil) end
        )
    end
    function DamageEngine.prototype.Error(self)
        local s = "WARNING: Recursion error when dealing damage! "
        s = tostring(s) .. "Prior to dealing damage from within a DamageEvent response trigger, do this:\n"
        s = tostring(s) .. "Set DamageEventTrigger = (This Trigger)\n"
        s = tostring(s) .. "Unit - Cause <Source> to damage <Target>...\n\n"
        s = tostring(s) .. "Alternatively, just use the UNKNOWN damage type. It will skip recursive damage on its own without needing the \"Set\" line:/n"
        s = tostring(s) .. "Unit - Cause <Source> to damage <Target>, dealing <Amount> damage of attack type <Attack Type> and damage type Unknown"
        ClearTextMessages()
        Log.Fatal(s)
    end
    function DamageEngine.prototype.OnAOEEnd(self)
        if self.damageEngineGlobals.udg_DamageEventAOE > 1 then
            self:DamageEventAOE()
            self.damageEngineGlobals.udg_DamageEventAOE = 1
        end
        self.damageEngineGlobals.udg_DamageEventLevel = 1
        self.damageEngineGlobals.udg_EnhancedDamageTarget = nil
        self.damageEngineGlobals.udg_AOEDamageSource = nil
        GroupClear(self.damageEngineGlobals.udg_DamageEventAOEGroup)
    end
    function DamageEngine.prototype.Finish(self)
        local i = -1
        if self.finished then
            self.finished = false
            if self.damageEngineGlobals.udg_DamageEventPrevAmt ~= 0 and self.damageEngineGlobals.udg_DamageEventDamageT ~= settings.DAMAGE_TYPE_UNKNOWN then
                self.recursive = true
                self:AfterDamageEvent()
                self.recursive = false
            end
            if self.recursion > -1 and not self.holdClear and not self.purge then
                self.purge = true
                do
                    while i >= self.recursion do
                        i = i + 1
                        self.damageEngineGlobals.udg_NextDamageType = self.lastType[i + 1]
                        if self.lastTrig[i + 1] ~= nil then
                            DisableTrigger(self.lastTrig[i + 1])
                        end
                        UnitDamageTarget(self.lastSource[i + 1], self.lastTarget[i + 1], self.lastAmount[i + 1], true, false, self.lastAttackT[i + 1], self.lastDamageT[i + 1], self.lastWeaponT[i + 1])
                        self:Finish()
                    end
                end
                do
                    while i <= -1 do
                        if self.lastTrig[i + 1] ~= nil then
                            EnableTrigger(self.lastTrig[i + 1])
                        end
                        i = i - 1
                    end
                end
                self.recursion = -1
                self.purge = false
            end
        end
    end
    function DamageEngine.prototype.OnExpire(self)
        self.started = false
        self:Finish()
        self:OnAOEEnd()
    end
    function DamageEngine.prototype.CalibrateMR(self)
        self.damageEngineGlobals.udg_IsDamageMelee = false
        self.damageEngineGlobals.udg_IsDamageRanged = false
        self.damageEngineGlobals.udg_IsDamageSpell = self.damageEngineGlobals.udg_DamageEventAttackT == 0
        if self.damageEngineGlobals.udg_DamageEventDamageT == settings.DAMAGE_TYPE_NORMAL and not self.damageEngineGlobals.udg_IsDamageSpell then
            self.damageEngineGlobals.udg_IsDamageMelee = IsUnitType(self.damageEngineGlobals.udg_DamageEventSource, UNIT_TYPE_MELEE_ATTACKER)
            self.damageEngineGlobals.udg_IsDamageRanged = IsUnitType(self.damageEngineGlobals.udg_DamageEventSource, UNIT_TYPE_RANGED_ATTACKER)
            if self.damageEngineGlobals.udg_IsDamageMelee and self.damageEngineGlobals.udg_IsDamageRanged then
                self.damageEngineGlobals.udg_IsDamageMelee = self.damageEngineGlobals.udg_DamageEventWeaponT > 0
                self.damageEngineGlobals.udg_IsDamageRanged = not self.damageEngineGlobals.udg_IsDamageMelee
            end
        end
    end
    function DamageEngine.prototype.OnPreDamage(self)
        local src = GetEventDamageSource()
        local tgt = BlzGetEventDamageTarget()
        local amt = GetEventDamage()
        local at = BlzGetEventAttackType()
        local dt = BlzGetEventDamageType()
        local wt = BlzGetEventWeaponType()
        self:Finish()
        if self.damageEngineGlobals.udg_NextDamageType == 0 and (self.damageEngineGlobals.udg_DamageEventTrigger ~= nil or self.recursive) then
            self.damageEngineGlobals.udg_NextDamageType = self.damageEngineGlobals.udg_DamageTypeCode
        end
        if self.recursive then
            if amt ~= 0 then
                if self.recursion < 512 then
                    self.recursion = self.recursion + 1
                    self.lastAmount[self.recursion + 1] = amt
                    self.lastSource[self.recursion + 1] = src
                    self.lastTarget[self.recursion + 1] = tgt
                    self.lastAttackT[self.recursion + 1] = at
                    self.lastDamageT[self.recursion + 1] = dt
                    self.lastWeaponT[self.recursion + 1] = wt
                    self.lastTrig[self.recursion + 1] = self.damageEngineGlobals.udg_DamageEventTrigger
                    self.lastType[self.recursion + 1] = self.damageEngineGlobals.udg_NextDamageType
                else
                    self:Error()
                end
            end
            self.damageEngineGlobals.udg_NextDamageType = 0
            self.damageEngineGlobals.udg_DamageEventTrigger = nil
            BlzSetEventDamage(0)
        else
            if not self.purge then
                if self.started then
                    if src ~= self.damageEngineGlobals.udg_AOEDamageSource then
                        self:OnAOEEnd()
                        self.damageEngineGlobals.udg_AOEDamageSource = src
                    elseif tgt == self.damageEngineGlobals.udg_EnhancedDamageTarget then
                        self.damageEngineGlobals.udg_DamageEventLevel = self.damageEngineGlobals.udg_DamageEventLevel + 1
                    elseif not IsUnitInGroup(tgt, self.damageEngineGlobals.udg_DamageEventAOEGroup) then
                        self.damageEngineGlobals.udg_DamageEventAOE = self.damageEngineGlobals.udg_DamageEventAOE + 1
                    end
                    if self.preDamage then
                        self.preDamage = false
                        self.previousAmount = self.damageEngineGlobals.udg_DamageEventAmount
                        self.previousValue = self.damageEngineGlobals.udg_DamageEventPrevAmt
                        self.previousType = self.damageEngineGlobals.udg_DamageEventType
                        self.previousCode = self.damageEngineGlobals.udg_IsDamageCode
                        self.previousArmor = self.armorType
                        self.previousDefense = self.damageEngineGlobals.udg_DamageEventDefenseT
                        self.prevPreDefense = self.defenseType
                        self.previousPierce = self.damageEngineGlobals.udg_DamageEventArmorPierced
                        self.holdClear = true
                    end
                else
                    TimerStart(
                        self.ticker,
                        0,
                        false,
                        function() return self:OnExpire() end
                    )
                    self.started = true
                    self.damageEngineGlobals.udg_AOEDamageSource = src
                    self.damageEngineGlobals.udg_EnhancedDamageTarget = tgt
                end
                GroupAddUnit(self.damageEngineGlobals.udg_DamageEventAOEGroup, tgt)
            end
            self.damageEngineGlobals.udg_DamageEventType = self.damageEngineGlobals.udg_NextDamageType
            if self.damageEngineGlobals.udg_NextDamageType ~= 0 then
                self.damageEngineGlobals.udg_DamageEventType = self.damageEngineGlobals.udg_NextDamageType
                self.damageEngineGlobals.udg_NextDamageType = 0
                self.damageEngineGlobals.udg_IsDamageCode = true
                self.damageEngineGlobals.udg_DamageEventTrigger = nil
            end
            self.damageEngineGlobals.udg_DamageEventOverride = dt == nil or amt == 0 or self.damageEngineGlobals.udg_DamageEventType * self.damageEngineGlobals.udg_DamageEventType == 4
            self.damageEngineGlobals.udg_DamageEventPrevAmt = amt
            self.damageEngineGlobals.udg_DamageEventSource = src
            self.damageEngineGlobals.udg_DamageEventTarget = tgt
            self.damageEngineGlobals.udg_DamageEventAmount = amt
            self.damageEngineGlobals.udg_DamageEventAttackT = GetHandleId(at)
            self.damageEngineGlobals.udg_DamageEventDamageT = GetHandleId(dt)
            self.damageEngineGlobals.udg_DamageEventWeaponT = GetHandleId(wt)
            self:CalibrateMR()
            self.damageEngineGlobals.udg_DamageEventArmorT = BlzGetUnitIntegerField(self.damageEngineGlobals.udg_DamageEventTarget, UNIT_IF_ARMOR_TYPE)
            self.damageEngineGlobals.udg_DamageEventDefenseT = BlzGetUnitIntegerField(self.damageEngineGlobals.udg_DamageEventTarget, UNIT_IF_DEFENSE_TYPE)
            self.armorType = self.damageEngineGlobals.udg_DamageEventArmorT
            self.defenseType = self.damageEngineGlobals.udg_DamageEventDefenseT
            self.damageEngineGlobals.udg_DamageEventArmorPierced = 0
            if not self.damageEngineGlobals.udg_DamageEventOverride then
                self.recursive = true
                self:InitialDamageModificationEvent()
                self.damageEngineGlobals.udg_DamageEventOverride = self.damageEngineGlobals.udg_DamageEventOverride or self.damageEngineGlobals.udg_DamageEventType * self.damageEngineGlobals.udg_DamageEventType == 4
                if not self.damageEngineGlobals.udg_DamageEventOverride then
                    self:MultiplicativeDamageModificationEvent()
                    self:PreFinalDamageModificationEvent()
                end
                self.recursive = false
                BlzSetEventAttackType(
                    ConvertAttackType(self.damageEngineGlobals.udg_DamageEventAttackT)
                )
                BlzSetEventDamageType(
                    ConvertDamageType(self.damageEngineGlobals.udg_DamageEventDamageT)
                )
                BlzSetEventWeaponType(
                    ConvertWeaponType(self.damageEngineGlobals.udg_DamageEventWeaponT)
                )
                if self.damageEngineGlobals.udg_DamageEventArmorPierced ~= 0 then
                    BlzSetUnitArmor(
                        self.damageEngineGlobals.udg_DamageEventTarget,
                        BlzGetUnitArmor(self.damageEngineGlobals.udg_DamageEventTarget) - self.damageEngineGlobals.udg_DamageEventArmorPierced
                    )
                end
                if self.armorType ~= self.damageEngineGlobals.udg_DamageEventArmorT then
                    BlzSetUnitIntegerField(self.damageEngineGlobals.udg_DamageEventTarget, UNIT_IF_ARMOR_TYPE, self.damageEngineGlobals.udg_DamageEventArmorT)
                end
                if self.defenseType ~= self.damageEngineGlobals.udg_DamageEventDefenseT then
                    BlzSetUnitIntegerField(self.damageEngineGlobals.udg_DamageEventTarget, UNIT_IF_DEFENSE_TYPE, self.damageEngineGlobals.udg_DamageEventDefenseT)
                end
                BlzSetEventDamage(self.damageEngineGlobals.udg_DamageEventAmount)
            end
            self.preDamage = true
        end
        return false
    end
    function DamageEngine.prototype.OnDamage(self)
        if self.recursive then
            return false
        end
        if self.preDamage then
            self.preDamage = false
        else
            self:Finish()
            self.holdClear = false
            self.damageEngineGlobals.udg_DamageEventAmount = self.previousAmount
            self.damageEngineGlobals.udg_DamageEventPrevAmt = self.previousValue
            self.damageEngineGlobals.udg_DamageEventType = self.previousType
            self.damageEngineGlobals.udg_IsDamageCode = self.previousCode
            self.damageEngineGlobals.udg_DamageEventSource = GetEventDamageSource()
            self.damageEngineGlobals.udg_DamageEventTarget = BlzGetEventDamageTarget()
            self.damageEngineGlobals.udg_DamageEventAttackT = GetHandleId(
                BlzGetEventAttackType()
            )
            self.damageEngineGlobals.udg_DamageEventDamageT = GetHandleId(
                BlzGetEventDamageType()
            )
            self.damageEngineGlobals.udg_DamageEventWeaponT = GetHandleId(
                BlzGetEventWeaponType()
            )
            self.damageEngineGlobals.udg_DamageEventArmorT = self.previousArmor
            self.damageEngineGlobals.udg_DamageEventDefenseT = self.previousDefense
            self.damageEngineGlobals.udg_DamageEventArmorPierced = self.previousPierce
            self.armorType = self.prevPreArmor
            self.defenseType = self.prevPreDefense
            self:CalibrateMR()
        end
        if self.damageEngineGlobals.udg_DamageEventArmorPierced ~= 0 then
            BlzSetUnitArmor(
                self.damageEngineGlobals.udg_DamageEventTarget,
                BlzGetUnitArmor(self.damageEngineGlobals.udg_DamageEventTarget) + self.damageEngineGlobals.udg_DamageEventArmorPierced
            )
        end
        if self.armorType ~= self.damageEngineGlobals.udg_DamageEventArmorT then
            BlzSetUnitIntegerField(self.damageEngineGlobals.udg_DamageEventTarget, UNIT_IF_ARMOR_TYPE, self.armorType)
        end
        if self.defenseType ~= self.damageEngineGlobals.udg_DamageEventDefenseT then
            BlzSetUnitIntegerField(self.damageEngineGlobals.udg_DamageEventTarget, UNIT_IF_DEFENSE_TYPE, self.defenseType)
        end
        local r = GetEventDamage()
        self.recursive = true
        if self.damageEngineGlobals.udg_DamageEventPrevAmt == 0 then
            self:ZeroDamageEvent()
        else
            if self.damageEngineGlobals.udg_DamageEventAmount ~= 0 and r ~= 0 then
                self.damageEngineGlobals.udg_DamageScalingWC3 = r / self.damageEngineGlobals.udg_DamageEventAmount
            elseif self.damageEngineGlobals.udg_DamageEventAmount > 0 then
                self.damageEngineGlobals.udg_DamageScalingWC3 = 0
            else
                self.damageEngineGlobals.udg_DamageScalingWC3 = 1
            end
            r = self.damageEngineGlobals.udg_DamageEventAmount
            self.damageEngineGlobals.udg_DamageScalingUser = r / self.damageEngineGlobals.udg_DamageEventPrevAmt
            self.damageEngineGlobals.udg_DamageEventAmount = r * self.damageEngineGlobals.udg_DamageScalingWC3
            if self.damageEngineGlobals.udg_DamageEventAmount > 0 then
                self:FinalDamageModificationEvent()
                self.damageEngineGlobals.udg_LethalDamageHP = GetWidgetLife(self.damageEngineGlobals.udg_DamageEventTarget) - self.damageEngineGlobals.udg_DamageEventAmount
                if self.damageEngineGlobals.udg_LethalDamageHP <= 0.405 then
                    self:DamageEventLethal()
                    self.damageEngineGlobals.udg_DamageEventAmount = GetWidgetLife(self.damageEngineGlobals.udg_DamageEventTarget) - self.damageEngineGlobals.udg_LethalDamageHP
                    if self.damageEngineGlobals.udg_DamageEventType < 0 and self.damageEngineGlobals.udg_LethalDamageHP <= 0.405 then
                        SetUnitExploded(self.damageEngineGlobals.udg_DamageEventTarget, true)
                    end
                end
                self.damageEngineGlobals.udg_DamageScalingUser = self.damageEngineGlobals.udg_DamageEventAmount / (self.damageEngineGlobals.udg_DamageEventPrevAmt * self.damageEngineGlobals.udg_DamageScalingWC3)
            end
            BlzSetEventDamage(self.damageEngineGlobals.udg_DamageEventAmount)
            if self.damageEngineGlobals.udg_DamageEventDamageT ~= settings.DAMAGE_TYPE_UNKNOWN then
                self:InitialDamageEvent()
            end
        end
        self.recursive = false
        self.finished = true
        if self.damageEngineGlobals.udg_DamageEventAmount <= 0 then
            self:Finish()
        end
        return false
    end
    return ____exports
    
end
__modules["app.src.World.Game.DamageEngine"] = {initialized = false, cached = nil, loader = __module_188}
function __module_189()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    ____exports.DamageEngineGlobals = {}
    local DamageEngineGlobals = ____exports.DamageEngineGlobals
    DamageEngineGlobals.name = "DamageEngineGlobals"
    DamageEngineGlobals.__index = DamageEngineGlobals
    DamageEngineGlobals.prototype = {}
    DamageEngineGlobals.prototype.__index = DamageEngineGlobals.prototype
    DamageEngineGlobals.prototype.constructor = DamageEngineGlobals
    function DamageEngineGlobals.new(...)
        local self = setmetatable({}, DamageEngineGlobals.prototype)
        self:____constructor(...)
        return self
    end
    function DamageEngineGlobals.prototype.____constructor(self)
        self.udg_DamageEventTrigger = nil
        self.udg_DamageEventOverride = false
        self.udg_NextDamageType = 0
        self.udg_DamageEventType = 0
        self.udg_DamageTypeCode = 0
        self.udg_IsDamageCode = false
        self.udg_IsDamageSpell = false
        self.udg_IsDamageMelee = false
        self.udg_IsDamageRanged = false
        self.udg_DamageEventSource = nil
        self.udg_DamageEventTarget = nil
        self.udg_DamageEventAOE = 0
        self.udg_DamageEventAOEGroup = nil
        self.udg_AOEDamageSource = nil
        self.udg_DamageEventLevel = 0
        self.udg_EnhancedDamageTarget = nil
        self.udg_DamageEventAmount = 0
        self.udg_DamageEventPrevAmt = 0
        self.udg_LethalDamageHP = 0
        self.udg_DamageEventArmorPierced = 0
        self.udg_DamageScalingWC3 = 0
        self.udg_DamageScalingUser = 0
        self.udg_DamageEventAttackT = 0
        self.udg_DamageEventDamageT = 0
        self.udg_DamageEventWeaponT = 0
        self.udg_DamageEventArmorT = 0
        self.udg_DamageEventDefenseT = 0
    end
    return ____exports
    
end
__modules["app.src.World.Game.DamageEngineGlobals"] = {initialized = false, cached = nil, loader = __module_189}
function __module_190()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    ____exports.TowerTicker = {}
    local TowerTicker = ____exports.TowerTicker
    TowerTicker.name = "TowerTicker"
    TowerTicker.__index = TowerTicker
    TowerTicker.prototype = {}
    TowerTicker.prototype.__index = TowerTicker.prototype
    TowerTicker.prototype.constructor = TowerTicker
    function TowerTicker.new(...)
        local self = setmetatable({}, TowerTicker.prototype)
        self:____constructor(...)
        return self
    end
    function TowerTicker.prototype.____constructor(self)
        self.tickingTowers = {}
        self.tick = 0
        self.maxTick = 100000
        self.trig = Trigger.new()
        self.trig:RegisterTimerEventPeriodic(0.1)
        self.trig:AddAction(
            function()
                self.tick = (self.tick + 1) % self.maxTick
                __TS__ArrayForEach(
                    self.tickingTowers,
                    function(____, tickingTower)
                        if tickingTower:IsTargetTick(self.tick, self.maxTick) then
                            tickingTower:Action()
                        end
                    end
                )
            end
        )
    end
    function TowerTicker.prototype.AddTickingTower(self, id, tickingTower)
        __TS__ArrayPush(self.tickingTowers, tickingTower)
    end
    function TowerTicker.prototype.RemoveTickingTower(self, id)
        self.tickingTowers = __TS__ArrayFilter(
            self.tickingTowers,
            function(____, tower) return tower.UniqueID ~= id end
        )
    end
    function TowerTicker.prototype.GetTickingTowerCount(self)
        return #self.tickingTowers
    end
    return ____exports
    
end
__modules["app.src.World.Game.TowerTicker"] = {initialized = false, cached = nil, loader = __module_190}
function __module_191()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    ____exports.Buff = {}
    local Buff = ____exports.Buff
    Buff.name = "Buff"
    Buff.__index = Buff
    Buff.prototype = {}
    Buff.prototype.____getters = {}
    Buff.prototype.__index = __TS__Index(Buff.prototype)
    Buff.prototype.constructor = Buff
    function Buff.new(...)
        local self = setmetatable({}, Buff.prototype)
        self:____constructor(...)
        return self
    end
    function Buff.prototype.____constructor(self, buffID, game)
        self.buffID = FourCC(buffID)
        self.game = game
        self._damageEngine = self.game.gameDamageEngine
        self._damageEngineGlobals = self.game.gameDamageEngineGlobals
    end
    function Buff.prototype.____getters.BuffID(self)
        return self.buffID
    end
    function Buff.prototype.____getters.damageEngine(self)
        return self._damageEngine
    end
    function Buff.prototype.____getters.damageEngineGlobals(self)
        return self._damageEngineGlobals
    end
    function Buff.prototype.Condition(self, target)
        return UnitHasBuffBJ(target, self.buffID)
    end
    function Buff.prototype.IsDamageModificationBuff(self)
        return self.ModifyDamage ~= nil
    end
    function Buff.prototype.IsAttackActionBuff(self)
        return self.AttackAction ~= nil
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Buff.Specs.Buff"] = {initialized = false, cached = nil, loader = __module_191}
function __module_192()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Buff = require("app.src.World.Entity.Buff.Specs.Buff")
    local Buff = ____Buff.Buff
    ____exports.CrushedDamageBuff = {}
    local CrushedDamageBuff = ____exports.CrushedDamageBuff
    CrushedDamageBuff.name = "CrushedDamageBuff"
    CrushedDamageBuff.__index = CrushedDamageBuff
    CrushedDamageBuff.prototype = {}
    CrushedDamageBuff.prototype.__index = __TS__Index(CrushedDamageBuff.prototype)
    CrushedDamageBuff.prototype.constructor = CrushedDamageBuff
    CrushedDamageBuff.____super = Buff
    setmetatable(CrushedDamageBuff, CrushedDamageBuff.____super)
    setmetatable(CrushedDamageBuff.prototype, CrushedDamageBuff.____super.prototype)
    function CrushedDamageBuff.new(...)
        local self = setmetatable({}, CrushedDamageBuff.prototype)
        self:____constructor(...)
        return self
    end
    function CrushedDamageBuff.prototype.____constructor(self, game)
        Buff.prototype.____constructor(self, "B006", game)
    end
    function CrushedDamageBuff.prototype.ModifyDamage(self)
        local target = self.damageEngineGlobals.udg_DamageEventTarget
        if not target then
            return
        end
        if not self:Condition(target) then
            return
        end
        do
            local ____obj, ____index = self.damageEngineGlobals, "udg_DamageEventAmount"
            ____obj[____index] = ____obj[____index] * 1.25
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Buff.CrushedDamageBuff"] = {initialized = false, cached = nil, loader = __module_192}
function __module_193()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Buff = require("app.src.World.Entity.Buff.Specs.Buff")
    local Buff = ____Buff.Buff
    ____exports.DrunkenHaze = {}
    local DrunkenHaze = ____exports.DrunkenHaze
    DrunkenHaze.name = "DrunkenHaze"
    DrunkenHaze.__index = DrunkenHaze
    DrunkenHaze.prototype = {}
    DrunkenHaze.prototype.__index = __TS__Index(DrunkenHaze.prototype)
    DrunkenHaze.prototype.constructor = DrunkenHaze
    DrunkenHaze.____super = Buff
    setmetatable(DrunkenHaze, DrunkenHaze.____super)
    setmetatable(DrunkenHaze.prototype, DrunkenHaze.____super.prototype)
    function DrunkenHaze.new(...)
        local self = setmetatable({}, DrunkenHaze.prototype)
        self:____constructor(...)
        return self
    end
    function DrunkenHaze.prototype.____constructor(self, game)
        Buff.prototype.____constructor(self, "B018", game)
    end
    function DrunkenHaze.prototype.ModifyDamage(self)
        local target = self.damageEngineGlobals.udg_DamageEventTarget
        if not target then
            return
        end
        if not self:Condition(target) then
            return
        end
        do
            local ____obj, ____index = self.damageEngineGlobals, "udg_DamageEventAmount"
            ____obj[____index] = ____obj[____index] * 1.25
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Buff.DrunkenHaze"] = {initialized = false, cached = nil, loader = __module_193}
function __module_194()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Buff = require("app.src.World.Entity.Buff.Specs.Buff")
    local Buff = ____Buff.Buff
    ____exports.ForceOfNature = {}
    local ForceOfNature = ____exports.ForceOfNature
    ForceOfNature.name = "ForceOfNature"
    ForceOfNature.__index = ForceOfNature
    ForceOfNature.prototype = {}
    ForceOfNature.prototype.__index = __TS__Index(ForceOfNature.prototype)
    ForceOfNature.prototype.constructor = ForceOfNature
    ForceOfNature.____super = Buff
    setmetatable(ForceOfNature, ForceOfNature.____super)
    setmetatable(ForceOfNature.prototype, ForceOfNature.____super.prototype)
    function ForceOfNature.new(...)
        local self = setmetatable({}, ForceOfNature.prototype)
        self:____constructor(...)
        return self
    end
    function ForceOfNature.prototype.____constructor(self, game)
        Buff.prototype.____constructor(self, "B005", game)
    end
    function ForceOfNature.prototype.AttackAction(self)
        local target = self.damageEngineGlobals.udg_DamageEventTarget
        if not target then
            return
        end
        if not self:Condition(target) then
            return
        end
        if self.damageEngineGlobals.udg_DamageEventAmount < GetUnitStateSwap(UNIT_STATE_LIFE, target) then
            return
        end
        if Util:RandomInt(1, 100) > 75 then
            return
        end
        if not self.damageEngineGlobals.udg_DamageEventSource then
            return
        end
        local dummy = CreateUnit(
            GetOwningPlayer(self.damageEngineGlobals.udg_DamageEventSource),
            FourCC("u005"),
            GetUnitX(target),
            GetUnitY(target),
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            10,
            FourCC("BTLF"),
            dummy
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Buff.ForceOfNature"] = {initialized = false, cached = nil, loader = __module_194}
function __module_195()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Buff = require("app.src.World.Entity.Buff.Specs.Buff")
    local Buff = ____Buff.Buff
    ____exports.IceTrollJoker = {}
    local IceTrollJoker = ____exports.IceTrollJoker
    IceTrollJoker.name = "IceTrollJoker"
    IceTrollJoker.__index = IceTrollJoker
    IceTrollJoker.prototype = {}
    IceTrollJoker.prototype.__index = __TS__Index(IceTrollJoker.prototype)
    IceTrollJoker.prototype.constructor = IceTrollJoker
    IceTrollJoker.____super = Buff
    setmetatable(IceTrollJoker, IceTrollJoker.____super)
    setmetatable(IceTrollJoker.prototype, IceTrollJoker.____super.prototype)
    function IceTrollJoker.new(...)
        local self = setmetatable({}, IceTrollJoker.prototype)
        self:____constructor(...)
        return self
    end
    function IceTrollJoker.prototype.____constructor(self, game)
        Buff.prototype.____constructor(self, "B02M", game)
    end
    function IceTrollJoker.prototype.ModifyDamage(self)
        local target = self.damageEngineGlobals.udg_DamageEventTarget
        if not target then
            return
        end
        if not self:Condition(target) then
            return
        end
        if not (GetUnitMoveSpeed(target) < GetUnitDefaultMoveSpeed(target)) then
            return
        end
        do
            local ____obj, ____index = self.damageEngineGlobals, "udg_DamageEventAmount"
            ____obj[____index] = ____obj[____index] * 3
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Buff.IceTrollJoker"] = {initialized = false, cached = nil, loader = __module_195}
function __module_196()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Buff = require("app.src.World.Entity.Buff.Specs.Buff")
    local Buff = ____Buff.Buff
    ____exports.Moonstorm = {}
    local Moonstorm = ____exports.Moonstorm
    Moonstorm.name = "Moonstorm"
    Moonstorm.__index = Moonstorm
    Moonstorm.prototype = {}
    Moonstorm.prototype.__index = __TS__Index(Moonstorm.prototype)
    Moonstorm.prototype.constructor = Moonstorm
    Moonstorm.____super = Buff
    setmetatable(Moonstorm, Moonstorm.____super)
    setmetatable(Moonstorm.prototype, Moonstorm.____super.prototype)
    function Moonstorm.new(...)
        local self = setmetatable({}, Moonstorm.prototype)
        self:____constructor(...)
        return self
    end
    function Moonstorm.prototype.____constructor(self, game)
        Buff.prototype.____constructor(self, "B01E", game)
    end
    function Moonstorm.prototype.ModifyDamage(self)
        local target = self.damageEngineGlobals.udg_DamageEventTarget
        if not target then
            return
        end
        if not self:Condition(target) then
            return
        end
        if Util:RandomInt(1, 100) > 10 then
            return
        end
        DestroyEffect(
            AddSpecialEffect(
                "Abilities\\Spells\\Other\\Monsoon\\MonsoonBoltTarget.mdl",
                GetUnitX(target),
                GetUnitY(target)
            )
        )
        do
            local ____obj, ____index = self.damageEngineGlobals, "udg_DamageEventAmount"
            ____obj[____index] = ____obj[____index] + 800
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Buff.Moonstorm"] = {initialized = false, cached = nil, loader = __module_196}
function __module_197()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Buff = require("app.src.World.Entity.Buff.Specs.Buff")
    local Buff = ____Buff.Buff
    ____exports.BattleRoar = {}
    local BattleRoar = ____exports.BattleRoar
    BattleRoar.name = "BattleRoar"
    BattleRoar.__index = BattleRoar
    BattleRoar.prototype = {}
    BattleRoar.prototype.__index = __TS__Index(BattleRoar.prototype)
    BattleRoar.prototype.constructor = BattleRoar
    BattleRoar.____super = Buff
    setmetatable(BattleRoar, BattleRoar.____super)
    setmetatable(BattleRoar.prototype, BattleRoar.____super.prototype)
    function BattleRoar.new(...)
        local self = setmetatable({}, BattleRoar.prototype)
        self:____constructor(...)
        return self
    end
    function BattleRoar.prototype.____constructor(self, game)
        Buff.prototype.____constructor(self, "B015", game)
    end
    function BattleRoar.prototype.ModifyDamage(self)
        local target = self.damageEngineGlobals.udg_DamageEventTarget
        if not target then
            return
        end
        if not self:Condition(target) then
            return
        end
        do
            local ____obj, ____index = self.damageEngineGlobals, "udg_DamageEventAmount"
            ____obj[____index] = ____obj[____index] * 1.5
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Buff.BattleRoar"] = {initialized = false, cached = nil, loader = __module_197}
function __module_198()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Buff = require("app.src.World.Entity.Buff.Specs.Buff")
    local Buff = ____Buff.Buff
    ____exports.SoulCollector = {}
    local SoulCollector = ____exports.SoulCollector
    SoulCollector.name = "SoulCollector"
    SoulCollector.__index = SoulCollector
    SoulCollector.prototype = {}
    SoulCollector.prototype.__index = __TS__Index(SoulCollector.prototype)
    SoulCollector.prototype.constructor = SoulCollector
    SoulCollector.____super = Buff
    setmetatable(SoulCollector, SoulCollector.____super)
    setmetatable(SoulCollector.prototype, SoulCollector.____super.prototype)
    function SoulCollector.new(...)
        local self = setmetatable({}, SoulCollector.prototype)
        self:____constructor(...)
        return self
    end
    function SoulCollector.prototype.____constructor(self, game)
        Buff.prototype.____constructor(self, "B02Q", game)
    end
    function SoulCollector.prototype.AttackAction(self)
        local target = self.damageEngineGlobals.udg_DamageEventTarget
        local source = self.damageEngineGlobals.udg_DamageEventSource
        if not target then
            return
        end
        if not self:Condition(target) then
            return
        end
        if self.damageEngineGlobals.udg_DamageEventAmount < GetUnitStateSwap(UNIT_STATE_LIFE, target) then
            return
        end
        if not self.damageEngineGlobals.udg_DamageEventSource then
            return
        end
        if source then
            local owner = self.game.players:get(
                GetPlayerId(
                    GetOwningPlayer(source)
                )
            )
            if owner then
                __TS__ArrayForEach(
                    owner.towersArray,
                    function(____, tower)
                        if tower:GetTypeID() == FourCC("oC7C") then
                            SetUnitManaBJ(
                                tower.tower,
                                GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) + 1
                            )
                        end
                        if GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) % 10 == 0 then
                            SetUnitAbilityLevel(
                                tower.tower,
                                FourCC("A0F6"),
                                GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) / 10
                            )
                        end
                    end
                )
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Buff.CitadelOfNaxxramas"] = {initialized = false, cached = nil, loader = __module_198}
function __module_199()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____CrushedDamageBuff = require("app.src.World.Entity.Buff.CrushedDamageBuff")
    local CrushedDamageBuff = ____CrushedDamageBuff.CrushedDamageBuff
    local ____DrunkenHaze = require("app.src.World.Entity.Buff.DrunkenHaze")
    local DrunkenHaze = ____DrunkenHaze.DrunkenHaze
    local ____ForceOfNature = require("app.src.World.Entity.Buff.ForceOfNature")
    local ForceOfNature = ____ForceOfNature.ForceOfNature
    local ____IceTrollJoker = require("app.src.World.Entity.Buff.IceTrollJoker")
    local IceTrollJoker = ____IceTrollJoker.IceTrollJoker
    local ____Moonstorm = require("app.src.World.Entity.Buff.Moonstorm")
    local Moonstorm = ____Moonstorm.Moonstorm
    local ____BattleRoar = require("app.src.World.Entity.Buff.BattleRoar")
    local BattleRoar = ____BattleRoar.BattleRoar
    local ____CitadelOfNaxxramas = require("app.src.World.Entity.Buff.CitadelOfNaxxramas")
    local SoulCollector = ____CitadelOfNaxxramas.SoulCollector
    ____exports.BuffHandler = {}
    local BuffHandler = ____exports.BuffHandler
    BuffHandler.name = "BuffHandler"
    BuffHandler.__index = BuffHandler
    BuffHandler.prototype = {}
    BuffHandler.prototype.__index = BuffHandler.prototype
    BuffHandler.prototype.constructor = BuffHandler
    function BuffHandler.new(...)
        local self = setmetatable({}, BuffHandler.prototype)
        self:____constructor(...)
        return self
    end
    function BuffHandler.prototype.____constructor(self, game)
        self.buffs = {}
        self.activeBuffs = {}
        self.game = game
        self:AddBuffsToList()
        self:SetupBuffs()
    end
    function BuffHandler.prototype.AddBuffsToList(self)
        __TS__ArrayPush(self.buffs, CrushedDamageBuff)
        __TS__ArrayPush(self.buffs, DrunkenHaze)
        __TS__ArrayPush(self.buffs, ForceOfNature)
        __TS__ArrayPush(self.buffs, IceTrollJoker)
        __TS__ArrayPush(self.buffs, Moonstorm)
        __TS__ArrayPush(self.buffs, BattleRoar)
        __TS__ArrayPush(self.buffs, SoulCollector)
    end
    function BuffHandler.prototype.SetupBuffs(self)
        for ____, buff in ipairs(self.buffs) do
            local ObjectExtendsBuff = buff.new(self.game)
            if ObjectExtendsBuff:IsDamageModificationBuff() then
                self.game.gameDamageEngine:AddMultiplicativeDamageModificationEventBuff(ObjectExtendsBuff)
            end
            if ObjectExtendsBuff:IsAttackActionBuff() then
                self.game.gameDamageEngine:AddInitialDamageEventBuff(ObjectExtendsBuff)
            end
            __TS__ArrayPush(self.activeBuffs, ObjectExtendsBuff)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Buff.BuffHandler"] = {initialized = false, cached = nil, loader = __module_199}
function __module_200()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    ____exports.Item = {}
    local Item = ____exports.Item
    Item.name = "Item"
    Item.__index = Item
    Item.prototype = {}
    Item.prototype.____getters = {}
    Item.prototype.__index = __TS__Index(Item.prototype)
    Item.prototype.____setters = {}
    Item.prototype.__newindex = __TS__NewIndex(Item.prototype)
    Item.prototype.constructor = Item
    function Item.new(...)
        local self = setmetatable({}, Item.prototype)
        self:____constructor(...)
        return self
    end
    function Item.prototype.____constructor(self, buffID, game)
        self._itemID = FourCC(buffID)
        self._game = game
    end
    function Item.prototype.____getters.game(self)
        return self._game
    end
    function Item.prototype.____getters.itemID(self)
        return self._itemID
    end
    function Item.prototype.____setters.game(self, value)
        self._game = value
    end
    function Item.prototype.____setters.itemID(self, value)
        self._itemID = value
    end
    function Item.prototype.ManipulateCondition(self)
        return GetItemTypeId(
            GetManipulatedItem()
        ) == self._itemID
    end
    function Item.prototype.ManipulateAction(self)
        Log.Debug("Missing Action")
    end
    function Item.prototype.IsStackingItem(self)
        return self.MakeStack ~= nil
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Item.Specs.Item"] = {initialized = false, cached = nil, loader = __module_200}
function __module_201()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Item = require("app.src.World.Entity.Item.Specs.Item")
    local Item = ____Item.Item
    ____exports.StackingItem = {}
    local StackingItem = ____exports.StackingItem
    StackingItem.name = "StackingItem"
    StackingItem.__index = StackingItem
    StackingItem.prototype = {}
    StackingItem.prototype.__index = __TS__Index(StackingItem.prototype)
    StackingItem.prototype.__newindex = __TS__NewIndex(StackingItem.prototype)
    StackingItem.prototype.constructor = StackingItem
    StackingItem.____super = Item
    setmetatable(StackingItem, StackingItem.____super)
    setmetatable(StackingItem.prototype, StackingItem.____super.prototype)
    function StackingItem.new(...)
        local self = setmetatable({}, StackingItem.prototype)
        self:____constructor(...)
        return self
    end
    function StackingItem.prototype.StackingCondition(self)
        if self.itemID ~= GetItemTypeId(
            GetManipulatedItem()
        ) then
            return false
        end
        if not UnitHasItemOfTypeBJ(
            GetManipulatingUnit(),
            GetItemTypeId(
                GetManipulatedItem()
            )
        ) then
            return false
        end
        if not (GetManipulatedItem() ~= GetItemOfTypeFromUnitBJ(
            GetManipulatingUnit(),
            GetItemTypeId(
                GetManipulatedItem()
            )
        )) then
            return false
        end
        return true
    end
    function StackingItem.prototype.MakeStack(self)
        SetItemCharges(
            GetItemOfTypeFromUnitBJ(
                GetManipulatingUnit(),
                GetItemTypeId(
                    GetManipulatedItem()
                )
            ),
            (GetItemCharges(
                GetItemOfTypeFromUnitBJ(
                    GetManipulatingUnit(),
                    GetItemTypeId(
                        GetManipulatedItem()
                    )
                )
            ) + GetItemCharges(
                GetManipulatedItem()
            ))
        )
        UnitRemoveItemSwapped(
            GetManipulatedItem(),
            GetManipulatingUnit()
        )
        RemoveItem(
            GetManipulatedItem()
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Item.Specs.StackingItem"] = {initialized = false, cached = nil, loader = __module_201}
function __module_202()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____StackingItem = require("app.src.World.Entity.Item.Specs.StackingItem")
    local StackingItem = ____StackingItem.StackingItem
    ____exports.LootBagItem = {}
    local LootBagItem = ____exports.LootBagItem
    LootBagItem.name = "LootBagItem"
    LootBagItem.__index = LootBagItem
    LootBagItem.prototype = {}
    LootBagItem.prototype.__index = __TS__Index(LootBagItem.prototype)
    LootBagItem.prototype.__newindex = __TS__NewIndex(LootBagItem.prototype)
    LootBagItem.prototype.constructor = LootBagItem
    LootBagItem.____super = StackingItem
    setmetatable(LootBagItem, LootBagItem.____super)
    setmetatable(LootBagItem.prototype, LootBagItem.____super.prototype)
    function LootBagItem.new(...)
        local self = setmetatable({}, LootBagItem.prototype)
        self:____constructor(...)
        return self
    end
    function LootBagItem.prototype.____constructor(self, game)
        StackingItem.prototype.____constructor(self, "I02B", game)
    end
    function LootBagItem.prototype.ManipulateAction(self)
        local roll = Util:RandomInt(1, 100)
        if roll <= 40 then
            UnitAddItemByIdSwapped(
                FourCC("I029"),
                GetTriggerUnit()
            )
        elseif roll <= 80 then
            UnitAddItemByIdSwapped(
                FourCC("I02F"),
                GetTriggerUnit()
            )
        elseif roll <= 95 then
            UnitAddItemByIdSwapped(
                FourCC("I028"),
                GetTriggerUnit()
            )
        else
            UnitAddItemByIdSwapped(
                FourCC("I02A"),
                GetTriggerUnit()
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Item.LootBoxer.LootBagItem"] = {initialized = false, cached = nil, loader = __module_202}
function __module_203()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____StackingItem = require("app.src.World.Entity.Item.Specs.StackingItem")
    local StackingItem = ____StackingItem.StackingItem
    ____exports.Rocks = {}
    local Rocks = ____exports.Rocks
    Rocks.name = "Rocks"
    Rocks.__index = Rocks
    Rocks.prototype = {}
    Rocks.prototype.__index = __TS__Index(Rocks.prototype)
    Rocks.prototype.__newindex = __TS__NewIndex(Rocks.prototype)
    Rocks.prototype.constructor = Rocks
    Rocks.____super = StackingItem
    setmetatable(Rocks, Rocks.____super)
    setmetatable(Rocks.prototype, Rocks.____super.prototype)
    function Rocks.new(...)
        local self = setmetatable({}, Rocks.prototype)
        self:____constructor(...)
        return self
    end
    function Rocks.prototype.____constructor(self, game)
        StackingItem.prototype.____constructor(self, "I02F", game)
    end
    function Rocks.prototype.ManipulateAction(self)
        local currentCharges = GetItemCharges(
            GetManipulatedItem()
        )
        if currentCharges <= 8 then
            SetItemCharges(
                GetManipulatedItem(),
                (GetItemCharges(
                    GetManipulatedItem()
                ) + 1)
            )
        else
            SetItemCharges(
                GetManipulatedItem(),
                (GetItemCharges(
                    GetManipulatedItem()
                ) - 9)
            )
            UnitAddItemByIdSwapped(
                FourCC("I02B"),
                GetManipulatingUnit()
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Item.LootBoxer.Rocks"] = {initialized = false, cached = nil, loader = __module_203}
function __module_204()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Item = require("app.src.World.Entity.Item.Specs.Item")
    local Item = ____Item.Item
    ____exports.GoldCoin = {}
    local GoldCoin = ____exports.GoldCoin
    GoldCoin.name = "GoldCoin"
    GoldCoin.__index = GoldCoin
    GoldCoin.prototype = {}
    GoldCoin.prototype.__index = __TS__Index(GoldCoin.prototype)
    GoldCoin.prototype.__newindex = __TS__NewIndex(GoldCoin.prototype)
    GoldCoin.prototype.constructor = GoldCoin
    GoldCoin.____super = Item
    setmetatable(GoldCoin, GoldCoin.____super)
    setmetatable(GoldCoin.prototype, GoldCoin.____super.prototype)
    function GoldCoin.new(...)
        local self = setmetatable({}, GoldCoin.prototype)
        self:____constructor(...)
        return self
    end
    function GoldCoin.prototype.____constructor(self, game)
        Item.prototype.____constructor(self, "I02A", game)
    end
    function GoldCoin.prototype.ManipulateAction(self)
        if __TS__ArrayIndexOf(
            self.game.worldMap.towerConstruction.lootBoxerTowers,
            GetUnitTypeId(
                GetManipulatingUnit()
            )
        ) + 1 < 4 then
            return
        end
        SetUnitManaBJ(
            GetManipulatingUnit(),
            (GetUnitStateSwap(
                UNIT_STATE_MANA,
                GetManipulatingUnit()
            ) + 2)
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Item.LootBoxer.GoldCoin"] = {initialized = false, cached = nil, loader = __module_204}
function __module_205()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Item = require("app.src.World.Entity.Item.Specs.Item")
    local Item = ____Item.Item
    ____exports.PlatinumToken = {}
    local PlatinumToken = ____exports.PlatinumToken
    PlatinumToken.name = "PlatinumToken"
    PlatinumToken.__index = PlatinumToken
    PlatinumToken.prototype = {}
    PlatinumToken.prototype.__index = __TS__Index(PlatinumToken.prototype)
    PlatinumToken.prototype.__newindex = __TS__NewIndex(PlatinumToken.prototype)
    PlatinumToken.prototype.constructor = PlatinumToken
    PlatinumToken.____super = Item
    setmetatable(PlatinumToken, PlatinumToken.____super)
    setmetatable(PlatinumToken.prototype, PlatinumToken.____super.prototype)
    function PlatinumToken.new(...)
        local self = setmetatable({}, PlatinumToken.prototype)
        self:____constructor(...)
        return self
    end
    function PlatinumToken.prototype.____constructor(self, game)
        Item.prototype.____constructor(self, "I02C", game)
    end
    function PlatinumToken.prototype.ManipulateAction(self)
        if __TS__ArrayIndexOf(
            self.game.worldMap.towerConstruction.lootBoxerTowers,
            GetUnitTypeId(
                GetManipulatingUnit()
            )
        ) + 1 < 4 then
            return
        end
        SetUnitManaBJ(
            GetManipulatingUnit(),
            (GetUnitStateSwap(
                UNIT_STATE_MANA,
                GetManipulatingUnit()
            ) + 6)
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Item.LootBoxer.PlatinumToken"] = {initialized = false, cached = nil, loader = __module_205}
function __module_206()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Item = require("app.src.World.Entity.Item.Specs.Item")
    local Item = ____Item.Item
    ____exports.WoodenSticks = {}
    local WoodenSticks = ____exports.WoodenSticks
    WoodenSticks.name = "WoodenSticks"
    WoodenSticks.__index = WoodenSticks
    WoodenSticks.prototype = {}
    WoodenSticks.prototype.__index = __TS__Index(WoodenSticks.prototype)
    WoodenSticks.prototype.__newindex = __TS__NewIndex(WoodenSticks.prototype)
    WoodenSticks.prototype.constructor = WoodenSticks
    WoodenSticks.____super = Item
    setmetatable(WoodenSticks, WoodenSticks.____super)
    setmetatable(WoodenSticks.prototype, WoodenSticks.____super.prototype)
    function WoodenSticks.new(...)
        local self = setmetatable({}, WoodenSticks.prototype)
        self:____constructor(...)
        return self
    end
    function WoodenSticks.prototype.____constructor(self, game)
        Item.prototype.____constructor(self, "I028", game)
    end
    function WoodenSticks.prototype.ManipulateAction(self)
        if __TS__ArrayIndexOf(
            self.game.worldMap.towerConstruction.lootBoxerTowers,
            GetUnitTypeId(
                GetManipulatingUnit()
            )
        ) + 1 < 4 then
            return
        end
        SetUnitManaBJ(
            GetManipulatingUnit(),
            (GetUnitStateSwap(
                UNIT_STATE_MANA,
                GetManipulatingUnit()
            ) + 1)
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Item.LootBoxer.WoodenSticks"] = {initialized = false, cached = nil, loader = __module_206}
function __module_207()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____StackingItem = require("app.src.World.Entity.Item.Specs.StackingItem")
    local StackingItem = ____StackingItem.StackingItem
    ____exports.PremiumLootTower = {}
    local PremiumLootTower = ____exports.PremiumLootTower
    PremiumLootTower.name = "PremiumLootTower"
    PremiumLootTower.__index = PremiumLootTower
    PremiumLootTower.prototype = {}
    PremiumLootTower.prototype.__index = __TS__Index(PremiumLootTower.prototype)
    PremiumLootTower.prototype.__newindex = __TS__NewIndex(PremiumLootTower.prototype)
    PremiumLootTower.prototype.constructor = PremiumLootTower
    PremiumLootTower.____super = StackingItem
    setmetatable(PremiumLootTower, PremiumLootTower.____super)
    setmetatable(PremiumLootTower.prototype, PremiumLootTower.____super.prototype)
    function PremiumLootTower.new(...)
        local self = setmetatable({}, PremiumLootTower.prototype)
        self:____constructor(...)
        return self
    end
    function PremiumLootTower.prototype.____constructor(self, game)
        StackingItem.prototype.____constructor(self, "I029", game)
    end
    function PremiumLootTower.prototype.ManipulateAction(self)
        return
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Item.LootBoxer.PremiumLootTower"] = {initialized = false, cached = nil, loader = __module_207}
function __module_208()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    local ____LootBagItem = require("app.src.World.Entity.Item.LootBoxer.LootBagItem")
    local LootBagItem = ____LootBagItem.LootBagItem
    local ____StackingItem = require("app.src.World.Entity.Item.Specs.StackingItem")
    local StackingItem = ____StackingItem.StackingItem
    local ____Rocks = require("app.src.World.Entity.Item.LootBoxer.Rocks")
    local Rocks = ____Rocks.Rocks
    local ____GoldCoin = require("app.src.World.Entity.Item.LootBoxer.GoldCoin")
    local GoldCoin = ____GoldCoin.GoldCoin
    local ____PlatinumToken = require("app.src.World.Entity.Item.LootBoxer.PlatinumToken")
    local PlatinumToken = ____PlatinumToken.PlatinumToken
    local ____WoodenSticks = require("app.src.World.Entity.Item.LootBoxer.WoodenSticks")
    local WoodenSticks = ____WoodenSticks.WoodenSticks
    local ____PremiumLootTower = require("app.src.World.Entity.Item.LootBoxer.PremiumLootTower")
    local PremiumLootTower = ____PremiumLootTower.PremiumLootTower
    ____exports.ItemHandler = {}
    local ItemHandler = ____exports.ItemHandler
    ItemHandler.name = "ItemHandler"
    ItemHandler.__index = ItemHandler
    ItemHandler.prototype = {}
    ItemHandler.prototype.__index = ItemHandler.prototype
    ItemHandler.prototype.constructor = ItemHandler
    function ItemHandler.new(...)
        local self = setmetatable({}, ItemHandler.prototype)
        self:____constructor(...)
        return self
    end
    function ItemHandler.prototype.____constructor(self, game)
        self.items = {}
        self.activeItems = {}
        self.stackingItems = {}
        self.game = game
        self:AddItemsToList()
        self:SetupItems()
        self.useItemTrigger = Trigger.new()
        self.useItemTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_USE_ITEM)
        self.useItemTrigger:AddAction(
            function() return self:UseItem() end
        )
        self.pickupItemTrigger = Trigger.new()
        self.pickupItemTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_PICKUP_ITEM)
        self.pickupItemTrigger:AddAction(
            function() return self:PickupItem() end
        )
    end
    function ItemHandler.prototype.AddItemsToList(self)
        __TS__ArrayPush(self.items, LootBagItem)
        __TS__ArrayPush(self.items, Rocks)
        __TS__ArrayPush(self.items, PremiumLootTower)
        __TS__ArrayPush(self.items, GoldCoin)
        __TS__ArrayPush(self.items, PlatinumToken)
        __TS__ArrayPush(self.items, WoodenSticks)
    end
    function ItemHandler.prototype.SetupItems(self)
        for ____, item in ipairs(self.items) do
            local ObjectExtendsItem = item.new(self.game)
            if __TS__InstanceOf(ObjectExtendsItem, StackingItem) then
                __TS__ArrayPush(self.stackingItems, ObjectExtendsItem)
            end
            __TS__ArrayPush(self.activeItems, ObjectExtendsItem)
        end
    end
    function ItemHandler.prototype.UseItem(self)
        for ____, item in ipairs(self.activeItems) do
            if item:ManipulateCondition() then
                item:ManipulateAction()
            end
        end
    end
    function ItemHandler.prototype.PickupItem(self)
        for ____, item in ipairs(self.stackingItems) do
            if item:StackingCondition() then
                item:MakeStack()
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.Item.ItemHandler"] = {initialized = false, cached = nil, loader = __module_208}
function __module_209()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    ____exports.GenericAbility = {}
    local GenericAbility = ____exports.GenericAbility
    GenericAbility.name = "GenericAbility"
    GenericAbility.__index = GenericAbility
    GenericAbility.prototype = {}
    GenericAbility.prototype.____getters = {}
    GenericAbility.prototype.__index = __TS__Index(GenericAbility.prototype)
    GenericAbility.prototype.____setters = {}
    GenericAbility.prototype.__newindex = __TS__NewIndex(GenericAbility.prototype)
    GenericAbility.prototype.constructor = GenericAbility
    function GenericAbility.new(...)
        local self = setmetatable({}, GenericAbility.prototype)
        self:____constructor(...)
        return self
    end
    function GenericAbility.prototype.____constructor(self, abiID, game)
        self.abilityId = FourCC(abiID)
        self._game = game
    end
    function GenericAbility.prototype.____getters.game(self)
        return self._game
    end
    function GenericAbility.prototype.____setters.game(self, value)
        self._game = value
    end
    function GenericAbility.prototype.Condition(self)
        return GetSpellAbilityId() == self.abilityId
    end
    function GenericAbility.prototype.IsAttackActionAbility(self)
        return self.AttackAction ~= nil
    end
    function GenericAbility.prototype.IsAbilityOnEffectTargetsUnit(self)
        return self.TargetOnEffectAction ~= nil
    end
    function GenericAbility.prototype.IsAbilityOnCastTargetsUnit(self)
        return self.TargetOnCastAction ~= nil
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.GenericAbility"] = {initialized = false, cached = nil, loader = __module_209}
function __module_210()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.FrostAttack = {}
    local FrostAttack = ____exports.FrostAttack
    FrostAttack.name = "FrostAttack"
    FrostAttack.__index = FrostAttack
    FrostAttack.prototype = {}
    FrostAttack.prototype.__index = __TS__Index(FrostAttack.prototype)
    FrostAttack.prototype.__newindex = __TS__NewIndex(FrostAttack.prototype)
    FrostAttack.prototype.constructor = FrostAttack
    FrostAttack.____super = GenericAbility
    setmetatable(FrostAttack, FrostAttack.____super)
    setmetatable(FrostAttack.prototype, FrostAttack.____super.prototype)
    function FrostAttack.new(...)
        local self = setmetatable({}, FrostAttack.prototype)
        self:____constructor(...)
        return self
    end
    function FrostAttack.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A08X", game)
    end
    function FrostAttack.prototype.AttackAction(self)
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        local source = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if target and source then
            if not (GetUnitAbilityLevelSwapped(
                FourCC("A08X"),
                source
            ) > 0) then
                return
            end
            if UnitHasBuffBJ(
                target,
                FourCC("B017")
            ) then
                return
            end
            local dummy = CreateUnit(
                GetOwningPlayer(source),
                FourCC("u008"),
                GetUnitX(target),
                GetUnitY(target),
                bj_UNIT_FACING
            )
            UnitAddAbilityBJ(
                FourCC("A02U"),
                dummy
            )
            IssueTargetOrderBJ(dummy, "slow", target)
            UnitApplyTimedLifeBJ(
                1,
                FourCC("BTLF"),
                dummy
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.FrostAttack"] = {initialized = false, cached = nil, loader = __module_210}
function __module_211()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.Move = {}
    local Move = ____exports.Move
    Move.name = "Move"
    Move.__index = Move
    Move.prototype = {}
    Move.prototype.__index = __TS__Index(Move.prototype)
    Move.prototype.__newindex = __TS__NewIndex(Move.prototype)
    Move.prototype.constructor = Move
    Move.____super = GenericAbility
    setmetatable(Move, Move.____super)
    setmetatable(Move.prototype, Move.____super.prototype)
    function Move.new(...)
        local self = setmetatable({}, Move.prototype)
        self:____constructor(...)
        return self
    end
    function Move.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0EB", game)
    end
    function Move.prototype.TargetOnEffectAction(self)
        local target = GetSpellTargetUnit()
        local creep = self.game.worldMap.spawnedCreeps.unitMap:get(
            GetHandleIdBJ(target)
        )
        if creep then
            creep:ReapplyMovement()
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Move"] = {initialized = false, cached = nil, loader = __module_211}
function __module_212()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.FelineSwiftness = {}
    local FelineSwiftness = ____exports.FelineSwiftness
    FelineSwiftness.name = "FelineSwiftness"
    FelineSwiftness.__index = FelineSwiftness
    FelineSwiftness.prototype = {}
    FelineSwiftness.prototype.__index = __TS__Index(FelineSwiftness.prototype)
    FelineSwiftness.prototype.__newindex = __TS__NewIndex(FelineSwiftness.prototype)
    FelineSwiftness.prototype.constructor = FelineSwiftness
    FelineSwiftness.____super = GenericAbility
    setmetatable(FelineSwiftness, FelineSwiftness.____super)
    setmetatable(FelineSwiftness.prototype, FelineSwiftness.____super.prototype)
    function FelineSwiftness.new(...)
        local self = setmetatable({}, FelineSwiftness.prototype)
        self:____constructor(...)
        return self
    end
    function FelineSwiftness.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0B4", game)
        self.givesAbility = FourCC("S007")
        self.maxLevel = 10
    end
    function FelineSwiftness.prototype.TargetOnCastAction(self)
        local target = GetSpellTargetUnit()
        if target then
            if GetUnitAbilityLevelSwapped(self.givesAbility, target) >= self.maxLevel then
                return
            end
            if GetUnitAbilityLevelSwapped(self.givesAbility, target) >= 1 then
                IncUnitAbilityLevelSwapped(self.givesAbility, target)
            else
                UnitAddAbilityBJ(self.givesAbility, target)
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.NightElfAncientProtector.FelineSwiftness"] = {initialized = false, cached = nil, loader = __module_212}
function __module_213()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.NaturesNourishment = {}
    local NaturesNourishment = ____exports.NaturesNourishment
    NaturesNourishment.name = "NaturesNourishment"
    NaturesNourishment.__index = NaturesNourishment
    NaturesNourishment.prototype = {}
    NaturesNourishment.prototype.__index = __TS__Index(NaturesNourishment.prototype)
    NaturesNourishment.prototype.__newindex = __TS__NewIndex(NaturesNourishment.prototype)
    NaturesNourishment.prototype.constructor = NaturesNourishment
    NaturesNourishment.____super = GenericAbility
    setmetatable(NaturesNourishment, NaturesNourishment.____super)
    setmetatable(NaturesNourishment.prototype, NaturesNourishment.____super.prototype)
    function NaturesNourishment.new(...)
        local self = setmetatable({}, NaturesNourishment.prototype)
        self:____constructor(...)
        return self
    end
    function NaturesNourishment.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0BI", game)
        self.givesAbilityOne = FourCC("A0BX")
        self.givesAbilityTwo = FourCC("S009")
        self.maxLevel = 5
    end
    function NaturesNourishment.prototype.TargetOnCastAction(self)
        local target = GetSpellTargetUnit()
        if target then
            if not (GetUnitAbilityLevelSwapped(self.givesAbilityOne, target) >= self.maxLevel) then
                if GetUnitAbilityLevelSwapped(self.givesAbilityOne, target) >= 1 then
                    IncUnitAbilityLevelSwapped(self.givesAbilityOne, target)
                else
                    UnitAddAbilityBJ(self.givesAbilityOne, target)
                end
            end
            if not (GetUnitAbilityLevelSwapped(self.givesAbilityTwo, target) >= self.maxLevel) then
                if GetUnitAbilityLevelSwapped(self.givesAbilityTwo, target) >= 1 then
                    IncUnitAbilityLevelSwapped(self.givesAbilityTwo, target)
                else
                    UnitAddAbilityBJ(self.givesAbilityTwo, target)
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.NightElfAncientProtector.NaturesNourishment"] = {initialized = false, cached = nil, loader = __module_213}
function __module_214()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.WolvenFury = {}
    local WolvenFury = ____exports.WolvenFury
    WolvenFury.name = "WolvenFury"
    WolvenFury.__index = WolvenFury
    WolvenFury.prototype = {}
    WolvenFury.prototype.__index = __TS__Index(WolvenFury.prototype)
    WolvenFury.prototype.__newindex = __TS__NewIndex(WolvenFury.prototype)
    WolvenFury.prototype.constructor = WolvenFury
    WolvenFury.____super = GenericAbility
    setmetatable(WolvenFury, WolvenFury.____super)
    setmetatable(WolvenFury.prototype, WolvenFury.____super.prototype)
    function WolvenFury.new(...)
        local self = setmetatable({}, WolvenFury.prototype)
        self:____constructor(...)
        return self
    end
    function WolvenFury.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0BG", game)
        self.givesAbility = FourCC("A0C4")
        self.maxLevel = 10
    end
    function WolvenFury.prototype.TargetOnCastAction(self)
        local target = GetSpellTargetUnit()
        if target then
            if GetUnitAbilityLevelSwapped(self.givesAbility, target) >= self.maxLevel then
                return
            end
            if GetUnitAbilityLevelSwapped(self.givesAbility, target) >= 1 then
                IncUnitAbilityLevelSwapped(self.givesAbility, target)
            else
                UnitAddAbilityBJ(self.givesAbility, target)
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.NightElfAncientProtector.WolvenFury"] = {initialized = false, cached = nil, loader = __module_214}
function __module_215()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.UnchargedRuneMorph = {}
    local UnchargedRuneMorph = ____exports.UnchargedRuneMorph
    UnchargedRuneMorph.name = "UnchargedRuneMorph"
    UnchargedRuneMorph.__index = UnchargedRuneMorph
    UnchargedRuneMorph.prototype = {}
    UnchargedRuneMorph.prototype.__index = __TS__Index(UnchargedRuneMorph.prototype)
    UnchargedRuneMorph.prototype.__newindex = __TS__NewIndex(UnchargedRuneMorph.prototype)
    UnchargedRuneMorph.prototype.constructor = UnchargedRuneMorph
    UnchargedRuneMorph.____super = GenericAbility
    setmetatable(UnchargedRuneMorph, UnchargedRuneMorph.____super)
    setmetatable(UnchargedRuneMorph.prototype, UnchargedRuneMorph.____super.prototype)
    function UnchargedRuneMorph.new(...)
        local self = setmetatable({}, UnchargedRuneMorph.prototype)
        self:____constructor(...)
        return self
    end
    function UnchargedRuneMorph.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0BO", game)
        self.abilities = {
            FourCC("A0BO"),
            FourCC("A0BS"),
            FourCC("A0C0"),
            FourCC("A0C1"),
            FourCC("A0C2"),
            FourCC("A0C3")
        }
        self.towers = {
            FourCC("n01R"),
            FourCC("n01S"),
            FourCC("n022"),
            FourCC("n023"),
            FourCC("n024"),
            FourCC("n025")
        }
    end
    function UnchargedRuneMorph.prototype.Condition(self)
        return __TS__ArrayIndexOf(
            self.abilities,
            GetSpellAbilityId()
        ) >= 0
    end
    function UnchargedRuneMorph.prototype.TargetOnEffectAction(self)
        local u = GetTriggerUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(u)
            )
        )
        if owner then
            local tower = owner:GetTower(
                GetHandleId(u)
            )
            if tower then
                tower:Upgrade(
                    self.towers[__TS__ArrayIndexOf(
                        self.abilities,
                        GetSpellAbilityId()
                    ) + 1]
                )
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Elementalist.UnchargedRuneMorph"] = {initialized = false, cached = nil, loader = __module_215}
function __module_216()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    ____exports.ElementalistSettings = {}
    local ElementalistSettings = ____exports.ElementalistSettings
    ElementalistSettings.name = "ElementalistSettings"
    ElementalistSettings.__index = ElementalistSettings
    ElementalistSettings.prototype = {}
    ElementalistSettings.prototype.__index = ElementalistSettings.prototype
    ElementalistSettings.prototype.constructor = ElementalistSettings
    function ElementalistSettings.new(...)
        local self = setmetatable({}, ElementalistSettings.prototype)
        self:____constructor(...)
        return self
    end
    function ElementalistSettings.prototype.____constructor(self)
        self.combinations = Map.new()
        self:SetupCombinations()
    end
    function ElementalistSettings.prototype.SetupCombinations(self)
        self:AddCombination("n025", "n024", "n026")
        self:AddCombination("n025", "n01S", "u01D")
        self:AddCombination("n01S", "n024", "n028")
        self:AddCombination("n01R", "n024", "n030")
        self:AddCombination("n022", "n024", "u01E")
        self:AddCombination("n025", "n01R", "u01F")
        self:AddCombination("n024", "n023", "u020")
        self:AddCombination("n025", "n022", "u021")
        self:AddCombination("n025", "n023", "u022")
        self:AddCombination("n022", "n01R", "u023")
        self:AddCombination("n022", "n023", "u024")
        self:AddCombination("n022", "n01S", "u025")
        self:AddCombination("n01R", "n023", "u026")
        self:AddCombination("n01R", "n01S", "u028")
        self:AddCombination("n01S", "n023", "u027")
        self:AddDoubling("n024", "u02A")
        self:AddDoubling("n025", "u02C")
        self:AddDoubling("n022", "u02E")
        self:AddDoubling("n01S", "u030")
        self:AddDoubling("n023", "u032")
        self:AddDoubling("n01R", "u034")
    end
    function ElementalistSettings.prototype.AddCombination(self, a, b, c)
        self.combinations:set(
            tostring(a) .. tostring(b),
            c
        )
        self.combinations:set(
            tostring(b) .. tostring(a),
            c
        )
    end
    function ElementalistSettings.prototype.AddDoubling(self, a, c)
        self.combinations:set(
            tostring(a) .. tostring(a),
            c
        )
    end
    function ElementalistSettings.prototype.GetCombination(self, a, b)
        local result = self.combinations:get(
            tostring(a) .. tostring(b)
        )
        if result then
            return result
        end
        Log.Fatal("Combination does not exist")
        return ""
    end
    function ElementalistSettings.prototype.HasCombination(self, a, b)
        return self.combinations:has(
            tostring(a) .. tostring(b)
        )
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Elementalist.ElementalistSettings"] = {initialized = false, cached = nil, loader = __module_216}
function __module_217()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.SiphonEnergy = {}
    local SiphonEnergy = ____exports.SiphonEnergy
    SiphonEnergy.name = "SiphonEnergy"
    SiphonEnergy.__index = SiphonEnergy
    SiphonEnergy.prototype = {}
    SiphonEnergy.prototype.__index = __TS__Index(SiphonEnergy.prototype)
    SiphonEnergy.prototype.__newindex = __TS__NewIndex(SiphonEnergy.prototype)
    SiphonEnergy.prototype.constructor = SiphonEnergy
    SiphonEnergy.____super = GenericAbility
    setmetatable(SiphonEnergy, SiphonEnergy.____super)
    setmetatable(SiphonEnergy.prototype, SiphonEnergy.____super.prototype)
    function SiphonEnergy.new(...)
        local self = setmetatable({}, SiphonEnergy.prototype)
        self:____constructor(...)
        return self
    end
    function SiphonEnergy.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0CT", game)
    end
    function SiphonEnergy.prototype.TargetOnEffectAction(self)
        local u = GetTriggerUnit()
        local t = GetSpellTargetUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(u)
            )
        )
        if owner then
            local source = owner:GetTower(
                GetHandleId(u)
            )
            local target = owner:GetTower(
                GetHandleId(t)
            )
            if source and target then
                if self.game.abilityHandler.elementalistSettings:HasCombination(
                    DecodeFourCC(
                        nil,
                        source:GetTypeID()
                    ),
                    DecodeFourCC(
                        nil,
                        target:GetTypeID()
                    )
                ) then
                    source:Upgrade(
                        FourCC(
                            self.game.abilityHandler.elementalistSettings:GetCombination(
                                DecodeFourCC(
                                    nil,
                                    source:GetTypeID()
                                ),
                                DecodeFourCC(
                                    nil,
                                    target:GetTypeID()
                                )
                            )
                        )
                    )
                    target:Upgrade(
                        FourCC("n027")
                    )
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Elementalist.SiphonEnergy"] = {initialized = false, cached = nil, loader = __module_217}
function __module_218()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    local ____GlobalSettings = require("app.src.World.GlobalSettings")
    local AOB_ITEM_LOOT_LEVEL_ONE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_ONE
    local AOB_ITEM_LOOT_LEVEL_TWO = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_TWO
    ____exports.Enchantment = {}
    local Enchantment = ____exports.Enchantment
    Enchantment.name = "Enchantment"
    Enchantment.__index = Enchantment
    Enchantment.prototype = {}
    Enchantment.prototype.__index = __TS__Index(Enchantment.prototype)
    Enchantment.prototype.__newindex = __TS__NewIndex(Enchantment.prototype)
    Enchantment.prototype.constructor = Enchantment
    Enchantment.____super = GenericAbility
    setmetatable(Enchantment, Enchantment.____super)
    setmetatable(Enchantment.prototype, Enchantment.____super.prototype)
    function Enchantment.new(...)
        local self = setmetatable({}, Enchantment.prototype)
        self:____constructor(...)
        return self
    end
    function Enchantment.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A03F", game)
    end
    function Enchantment.prototype.TargetOnEffectAction(self)
        local u = GetTriggerUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(u)
            )
        )
        if owner then
            local tower = owner:GetTower(
                GetHandleId(u)
            )
            if tower then
                if GetItemLevel(
                    UnitItemInSlotBJ(tower.tower, 1)
                ) == 1 then
                    local i = UnitItemInSlotBJ(tower.tower, 1)
                    local indx = __TS__ArrayIndexOf(
                        AOB_ITEM_LOOT_LEVEL_ONE,
                        GetItemTypeId(i)
                    )
                    local lvlTwoItem = AOB_ITEM_LOOT_LEVEL_TWO[indx + 1]
                    RemoveItem(
                        UnitItemInSlotBJ(tower.tower, 1)
                    )
                    UnitAddItemByIdSwapped(lvlTwoItem, tower.tower)
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.AllianceOfBlades.Enchantment"] = {initialized = false, cached = nil, loader = __module_218}
function __module_219()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.Transfuse = {}
    local Transfuse = ____exports.Transfuse
    Transfuse.name = "Transfuse"
    Transfuse.__index = Transfuse
    Transfuse.prototype = {}
    Transfuse.prototype.__index = __TS__Index(Transfuse.prototype)
    Transfuse.prototype.__newindex = __TS__NewIndex(Transfuse.prototype)
    Transfuse.prototype.constructor = Transfuse
    Transfuse.____super = GenericAbility
    setmetatable(Transfuse, Transfuse.____super)
    setmetatable(Transfuse.prototype, Transfuse.____super.prototype)
    function Transfuse.new(...)
        local self = setmetatable({}, Transfuse.prototype)
        self:____constructor(...)
        return self
    end
    function Transfuse.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A03A", game)
    end
    function Transfuse.prototype.TargetOnEffectAction(self)
        local u = GetTriggerUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(u)
            )
        )
        if owner then
            local tower = owner:GetTower(
                GetHandleId(u)
            )
            if tower then
                if GetItemLevel(
                    UnitItemInSlotBJ(tower.tower, 1)
                ) == 2 then
                    RemoveItem(
                        UnitItemInSlotBJ(tower.tower, 1)
                    )
                    SetUnitManaBJ(
                        tower.tower,
                        GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) + 1
                    )
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.AllianceOfBlades.Transfuse"] = {initialized = false, cached = nil, loader = __module_219}
function __module_220()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    local ____GlobalSettings = require("app.src.World.GlobalSettings")
    local AOB_ITEM_LOOT_LEVEL_THREE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_THREE
    local AOB_ITEM_LOOT_LEVEL_TWO = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_TWO
    ____exports.Infuse = {}
    local Infuse = ____exports.Infuse
    Infuse.name = "Infuse"
    Infuse.__index = Infuse
    Infuse.prototype = {}
    Infuse.prototype.__index = __TS__Index(Infuse.prototype)
    Infuse.prototype.__newindex = __TS__NewIndex(Infuse.prototype)
    Infuse.prototype.constructor = Infuse
    Infuse.____super = GenericAbility
    setmetatable(Infuse, Infuse.____super)
    setmetatable(Infuse.prototype, Infuse.____super.prototype)
    function Infuse.new(...)
        local self = setmetatable({}, Infuse.prototype)
        self:____constructor(...)
        return self
    end
    function Infuse.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0A7", game)
    end
    function Infuse.prototype.TargetOnEffectAction(self)
        local u = GetTriggerUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(u)
            )
        )
        if owner then
            local tower = owner:GetTower(
                GetHandleId(u)
            )
            if tower then
                if GetItemLevel(
                    UnitItemInSlotBJ(tower.tower, 1)
                ) == 2 then
                    local i = UnitItemInSlotBJ(tower.tower, 1)
                    local indx = __TS__ArrayIndexOf(
                        AOB_ITEM_LOOT_LEVEL_TWO,
                        GetItemTypeId(i)
                    )
                    RemoveItem(
                        UnitItemInSlotBJ(tower.tower, 1)
                    )
                    local mana = GetUnitStateSwap(UNIT_STATE_MANA, tower.tower)
                    SetUnitManaBJ(tower.tower, 0)
                    if 10 * mana > Util:RandomInt(0, 99) then
                        UnitAddItemByIdSwapped(AOB_ITEM_LOOT_LEVEL_THREE[indx + 1], tower.tower)
                    end
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.AllianceOfBlades.Infuse"] = {initialized = false, cached = nil, loader = __module_220}
function __module_221()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    local ____GlobalSettings = require("app.src.World.GlobalSettings")
    local AOB_ITEM_LOOT_LEVEL_FOUR = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_FOUR
    local AOB_ITEM_LOOT_LEVEL_THREE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_THREE
    ____exports.Sacrifice = {}
    local Sacrifice = ____exports.Sacrifice
    Sacrifice.name = "Sacrifice"
    Sacrifice.__index = Sacrifice
    Sacrifice.prototype = {}
    Sacrifice.prototype.__index = __TS__Index(Sacrifice.prototype)
    Sacrifice.prototype.__newindex = __TS__NewIndex(Sacrifice.prototype)
    Sacrifice.prototype.constructor = Sacrifice
    Sacrifice.____super = GenericAbility
    setmetatable(Sacrifice, Sacrifice.____super)
    setmetatable(Sacrifice.prototype, Sacrifice.____super.prototype)
    function Sacrifice.new(...)
        local self = setmetatable({}, Sacrifice.prototype)
        self:____constructor(...)
        return self
    end
    function Sacrifice.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0AJ", game)
    end
    function Sacrifice.prototype.TargetOnEffectAction(self)
        local u = GetTriggerUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(u)
            )
        )
        if owner then
            local tower = owner:GetTower(
                GetHandleId(u)
            )
            if tower then
                if GetItemLevel(
                    UnitItemInSlotBJ(tower.tower, 1)
                ) == 3 then
                    local i = UnitItemInSlotBJ(tower.tower, 1)
                    local indx = __TS__ArrayIndexOf(
                        AOB_ITEM_LOOT_LEVEL_THREE,
                        GetItemTypeId(i)
                    )
                    local mana = GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) + 1
                    SetUnitManaBJ(tower.tower, mana)
                    RemoveItem(
                        UnitItemInSlotBJ(tower.tower, 1)
                    )
                    if mana > 1 then
                        SetUnitManaBJ(tower.tower, 0)
                        UnitAddItemByIdSwapped(AOB_ITEM_LOOT_LEVEL_FOUR[indx + 1], tower.tower)
                    end
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.AllianceOfBlades.Sacrifice"] = {initialized = false, cached = nil, loader = __module_221}
function __module_222()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    local ____GlobalSettings = require("app.src.World.GlobalSettings")
    local AOB_ITEM_LOOT_LEVEL_ONE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_ONE
    local AOB_ITEM_LOOT_LEVEL_THREE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_THREE
    ____exports.AlchemicalTransmutation = {}
    local AlchemicalTransmutation = ____exports.AlchemicalTransmutation
    AlchemicalTransmutation.name = "AlchemicalTransmutation"
    AlchemicalTransmutation.__index = AlchemicalTransmutation
    AlchemicalTransmutation.prototype = {}
    AlchemicalTransmutation.prototype.__index = __TS__Index(AlchemicalTransmutation.prototype)
    AlchemicalTransmutation.prototype.__newindex = __TS__NewIndex(AlchemicalTransmutation.prototype)
    AlchemicalTransmutation.prototype.constructor = AlchemicalTransmutation
    AlchemicalTransmutation.____super = GenericAbility
    setmetatable(AlchemicalTransmutation, AlchemicalTransmutation.____super)
    setmetatable(AlchemicalTransmutation.prototype, AlchemicalTransmutation.____super.prototype)
    function AlchemicalTransmutation.new(...)
        local self = setmetatable({}, AlchemicalTransmutation.prototype)
        self:____constructor(...)
        return self
    end
    function AlchemicalTransmutation.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0B0", game)
    end
    function AlchemicalTransmutation.prototype.TargetOnEffectAction(self)
        local u = GetTriggerUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(u)
            )
        )
        if owner then
            local tower = owner:GetTower(
                GetHandleId(u)
            )
            if tower then
                if GetItemLevel(
                    UnitItemInSlotBJ(tower.tower, 1)
                ) == 1 then
                    local i = UnitItemInSlotBJ(tower.tower, 1)
                    local indx = __TS__ArrayIndexOf(
                        AOB_ITEM_LOOT_LEVEL_ONE,
                        GetItemTypeId(i)
                    )
                    RemoveItem(
                        UnitItemInSlotBJ(tower.tower, 1)
                    )
                    UnitAddItemByIdSwapped(AOB_ITEM_LOOT_LEVEL_THREE[indx + 1], tower.tower)
                else
                    owner:giveGold(75)
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.AllianceOfBlades.AlchemicalTransmutation"] = {initialized = false, cached = nil, loader = __module_222}
function __module_223()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.ChannelItem = {}
    local ChannelItem = ____exports.ChannelItem
    ChannelItem.name = "ChannelItem"
    ChannelItem.__index = ChannelItem
    ChannelItem.prototype = {}
    ChannelItem.prototype.__index = __TS__Index(ChannelItem.prototype)
    ChannelItem.prototype.__newindex = __TS__NewIndex(ChannelItem.prototype)
    ChannelItem.prototype.constructor = ChannelItem
    ChannelItem.____super = GenericAbility
    setmetatable(ChannelItem, ChannelItem.____super)
    setmetatable(ChannelItem.prototype, ChannelItem.____super.prototype)
    function ChannelItem.new(...)
        local self = setmetatable({}, ChannelItem.prototype)
        self:____constructor(...)
        return self
    end
    function ChannelItem.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A05H", game)
        self.allianceTowers = {
            FourCC("n02T"),
            FourCC("n02X"),
            FourCC("n02V"),
            FourCC("n02U"),
            FourCC("n007"),
            FourCC("n02W"),
            FourCC("n012")
        }
    end
    function ChannelItem.prototype.TargetOnEffectAction(self)
        local u = GetTriggerUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(u)
            )
        )
        if owner then
            local tower = owner:GetTower(
                GetHandleId(u)
            )
            if tower then
                if __TS__ArrayIndexOf(
                    self.allianceTowers,
                    GetUnitTypeId(
                        GetSpellTargetUnit()
                    )
                ) >= 0 then
                    UnitAddItemSwapped(
                        UnitItemInSlotBJ(tower.tower, 1),
                        GetSpellTargetUnit()
                    )
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.AllianceOfBlades.ChannelItem"] = {initialized = false, cached = nil, loader = __module_223}
function __module_224()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    local ____GlobalSettings = require("app.src.World.GlobalSettings")
    local AOB_ITEM_LOOT_LEVEL_ONE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_ONE
    ____exports.Trade = {}
    local Trade = ____exports.Trade
    Trade.name = "Trade"
    Trade.__index = Trade
    Trade.prototype = {}
    Trade.prototype.__index = __TS__Index(Trade.prototype)
    Trade.prototype.__newindex = __TS__NewIndex(Trade.prototype)
    Trade.prototype.constructor = Trade
    Trade.____super = GenericAbility
    setmetatable(Trade, Trade.____super)
    setmetatable(Trade.prototype, Trade.____super.prototype)
    function Trade.new(...)
        local self = setmetatable({}, Trade.prototype)
        self:____constructor(...)
        return self
    end
    function Trade.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A016", game)
    end
    function Trade.prototype.TargetOnEffectAction(self)
        local u = GetTriggerUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(u)
            )
        )
        if owner then
            local tower = owner:GetTower(
                GetHandleId(u)
            )
            if tower then
                if GetItemLevel(
                    UnitItemInSlotBJ(tower.tower, 1)
                ) == 1 then
                    local i = UnitItemInSlotBJ(tower.tower, 1)
                    local indx = __TS__ArrayIndexOf(
                        AOB_ITEM_LOOT_LEVEL_ONE,
                        GetItemTypeId(i)
                    )
                    local mana = GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) + 1
                    SetUnitManaBJ(tower.tower, mana)
                    RemoveItem(
                        UnitItemInSlotBJ(tower.tower, 1)
                    )
                    if mana > 1 then
                        local random = Util:RandomInt(0, #AOB_ITEM_LOOT_LEVEL_ONE - 1)
                        if random == indx then
                            random = random + 1
                        end
                        if random > #AOB_ITEM_LOOT_LEVEL_ONE - 1 then
                            random = 0
                        end
                        local newItem = AOB_ITEM_LOOT_LEVEL_ONE[random + 1]
                        UnitAddItemByIdSwapped(newItem, tower.tower)
                        SetUnitManaBJ(tower.tower, 0)
                    end
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.AllianceOfBlades.Trade"] = {initialized = false, cached = nil, loader = __module_224}
function __module_225()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.AwakenDormantPheonixEgg = {}
    local AwakenDormantPheonixEgg = ____exports.AwakenDormantPheonixEgg
    AwakenDormantPheonixEgg.name = "AwakenDormantPheonixEgg"
    AwakenDormantPheonixEgg.__index = AwakenDormantPheonixEgg
    AwakenDormantPheonixEgg.prototype = {}
    AwakenDormantPheonixEgg.prototype.__index = __TS__Index(AwakenDormantPheonixEgg.prototype)
    AwakenDormantPheonixEgg.prototype.__newindex = __TS__NewIndex(AwakenDormantPheonixEgg.prototype)
    AwakenDormantPheonixEgg.prototype.constructor = AwakenDormantPheonixEgg
    AwakenDormantPheonixEgg.____super = GenericAbility
    setmetatable(AwakenDormantPheonixEgg, AwakenDormantPheonixEgg.____super)
    setmetatable(AwakenDormantPheonixEgg.prototype, AwakenDormantPheonixEgg.____super.prototype)
    function AwakenDormantPheonixEgg.new(...)
        local self = setmetatable({}, AwakenDormantPheonixEgg.prototype)
        self:____constructor(...)
        return self
    end
    function AwakenDormantPheonixEgg.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0DV", game)
    end
    function AwakenDormantPheonixEgg.prototype.TargetOnEffectAction(self)
        local u = GetTriggerUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(u)
            )
        )
        if owner then
            local tower = owner:GetTower(
                GetHandleId(u)
            )
            if tower then
                tower:Upgrade(
                    FourCC("h006")
                )
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Elementalist.AwakenDormantPheonixEgg"] = {initialized = false, cached = nil, loader = __module_225}
function __module_226()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.PayTheToll = {}
    local PayTheToll = ____exports.PayTheToll
    PayTheToll.name = "PayTheToll"
    PayTheToll.__index = PayTheToll
    PayTheToll.prototype = {}
    PayTheToll.prototype.__index = __TS__Index(PayTheToll.prototype)
    PayTheToll.prototype.__newindex = __TS__NewIndex(PayTheToll.prototype)
    PayTheToll.prototype.constructor = PayTheToll
    PayTheToll.____super = GenericAbility
    setmetatable(PayTheToll, PayTheToll.____super)
    setmetatable(PayTheToll.prototype, PayTheToll.____super.prototype)
    function PayTheToll.new(...)
        local self = setmetatable({}, PayTheToll.prototype)
        self:____constructor(...)
        return self
    end
    function PayTheToll.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0BF", game)
    end
    function PayTheToll.prototype.TargetOnCastAction(self)
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(
                    GetSpellAbilityUnit()
                )
            )
        )
        if owner then
            local tower = owner:GetTower(
                GetHandleId(
                    GetSpellAbilityUnit()
                )
            )
            if tower then
                if owner:getGold() >= 50 then
                    owner:giveGold(-50)
                    if tower:GetTypeID() == FourCC("h02S") then
                        owner:SetVoidFragmentTick(
                            owner:GetVoidFragmentTick() - 1
                        )
                    end
                    if self.game.worldMap.antiBlock then
                        self.game.worldMap.antiBlock:CleanUpRemovedConstruction(tower.tower)
                    end
                    tower:Remove()
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Void.PayTheToll"] = {initialized = false, cached = nil, loader = __module_226}
function __module_227()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.VoidLordAbility = {}
    local VoidLordAbility = ____exports.VoidLordAbility
    VoidLordAbility.name = "VoidLordAbility"
    VoidLordAbility.__index = VoidLordAbility
    VoidLordAbility.prototype = {}
    VoidLordAbility.prototype.__index = __TS__Index(VoidLordAbility.prototype)
    VoidLordAbility.prototype.__newindex = __TS__NewIndex(VoidLordAbility.prototype)
    VoidLordAbility.prototype.constructor = VoidLordAbility
    VoidLordAbility.____super = GenericAbility
    setmetatable(VoidLordAbility, VoidLordAbility.____super)
    setmetatable(VoidLordAbility.prototype, VoidLordAbility.____super.prototype)
    function VoidLordAbility.new(...)
        local self = setmetatable({}, VoidLordAbility.prototype)
        self:____constructor(...)
        return self
    end
    function VoidLordAbility.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A09E", game)
    end
    function VoidLordAbility.prototype.TargetOnCastAction(self)
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(
                    GetSpellAbilityUnit()
                )
            )
        )
        if owner then
            local tower = owner:GetTower(
                GetHandleId(
                    GetSpellAbilityUnit()
                )
            )
            local target = owner:GetTower(
                GetHandleId(
                    GetSpellTargetUnit()
                )
            )
            if tower and target then
                if tower:GetTypeID() == FourCC("h01O") and target:GetTypeID() == FourCC("h02G") then
                    BlzSetUnitBaseDamage(
                        tower.tower,
                        (BlzGetUnitBaseDamage(tower.tower, 0) + 250),
                        0
                    )
                    target:Upgrade(
                        FourCC("h02S")
                    )
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Void.VoidLordAbility"] = {initialized = false, cached = nil, loader = __module_227}
function __module_228()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.PurchaseVoidBeast = {}
    local PurchaseVoidBeast = ____exports.PurchaseVoidBeast
    PurchaseVoidBeast.name = "PurchaseVoidBeast"
    PurchaseVoidBeast.__index = PurchaseVoidBeast
    PurchaseVoidBeast.prototype = {}
    PurchaseVoidBeast.prototype.__index = __TS__Index(PurchaseVoidBeast.prototype)
    PurchaseVoidBeast.prototype.__newindex = __TS__NewIndex(PurchaseVoidBeast.prototype)
    PurchaseVoidBeast.prototype.constructor = PurchaseVoidBeast
    PurchaseVoidBeast.____super = GenericAbility
    setmetatable(PurchaseVoidBeast, PurchaseVoidBeast.____super)
    setmetatable(PurchaseVoidBeast.prototype, PurchaseVoidBeast.____super.prototype)
    function PurchaseVoidBeast.new(...)
        local self = setmetatable({}, PurchaseVoidBeast.prototype)
        self:____constructor(...)
        return self
    end
    function PurchaseVoidBeast.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0BJ", game)
    end
    function PurchaseVoidBeast.prototype.TargetOnCastAction(self)
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(
                    GetSpellAbilityUnit()
                )
            )
        )
        if owner then
            if owner:GetVoidFragments() >= 400 then
                owner:SetVoidFragments(
                    owner:GetVoidFragments() - 400
                )
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Void.PurchaseVoidBeast"] = {initialized = false, cached = nil, loader = __module_228}
function __module_229()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.PurchaseVoidBeing = {}
    local PurchaseVoidBeing = ____exports.PurchaseVoidBeing
    PurchaseVoidBeing.name = "PurchaseVoidBeing"
    PurchaseVoidBeing.__index = PurchaseVoidBeing
    PurchaseVoidBeing.prototype = {}
    PurchaseVoidBeing.prototype.__index = __TS__Index(PurchaseVoidBeing.prototype)
    PurchaseVoidBeing.prototype.__newindex = __TS__NewIndex(PurchaseVoidBeing.prototype)
    PurchaseVoidBeing.prototype.constructor = PurchaseVoidBeing
    PurchaseVoidBeing.____super = GenericAbility
    setmetatable(PurchaseVoidBeing, PurchaseVoidBeing.____super)
    setmetatable(PurchaseVoidBeing.prototype, PurchaseVoidBeing.____super.prototype)
    function PurchaseVoidBeing.new(...)
        local self = setmetatable({}, PurchaseVoidBeing.prototype)
        self:____constructor(...)
        return self
    end
    function PurchaseVoidBeing.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0BB", game)
    end
    function PurchaseVoidBeing.prototype.TargetOnCastAction(self)
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(
                    GetSpellAbilityUnit()
                )
            )
        )
        if owner then
            if owner:GetVoidFragments() >= 100 then
                owner:SetVoidFragments(
                    owner:GetVoidFragments() - 100
                )
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Void.PurchaseVoidBeing"] = {initialized = false, cached = nil, loader = __module_229}
function __module_230()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.PurchaseVoidLord = {}
    local PurchaseVoidLord = ____exports.PurchaseVoidLord
    PurchaseVoidLord.name = "PurchaseVoidLord"
    PurchaseVoidLord.__index = PurchaseVoidLord
    PurchaseVoidLord.prototype = {}
    PurchaseVoidLord.prototype.__index = __TS__Index(PurchaseVoidLord.prototype)
    PurchaseVoidLord.prototype.__newindex = __TS__NewIndex(PurchaseVoidLord.prototype)
    PurchaseVoidLord.prototype.constructor = PurchaseVoidLord
    PurchaseVoidLord.____super = GenericAbility
    setmetatable(PurchaseVoidLord, PurchaseVoidLord.____super)
    setmetatable(PurchaseVoidLord.prototype, PurchaseVoidLord.____super.prototype)
    function PurchaseVoidLord.new(...)
        local self = setmetatable({}, PurchaseVoidLord.prototype)
        self:____constructor(...)
        return self
    end
    function PurchaseVoidLord.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0BL", game)
    end
    function PurchaseVoidLord.prototype.TargetOnCastAction(self)
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(
                    GetSpellAbilityUnit()
                )
            )
        )
        if owner then
            if owner:GetVoidFragments() >= 1200 then
                owner:SetVoidFragments(
                    owner:GetVoidFragments() - 1200
                )
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Void.PurchaseVoidLord"] = {initialized = false, cached = nil, loader = __module_230}
function __module_231()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.PurchaseVoidMonstrosity = {}
    local PurchaseVoidMonstrosity = ____exports.PurchaseVoidMonstrosity
    PurchaseVoidMonstrosity.name = "PurchaseVoidMonstrosity"
    PurchaseVoidMonstrosity.__index = PurchaseVoidMonstrosity
    PurchaseVoidMonstrosity.prototype = {}
    PurchaseVoidMonstrosity.prototype.__index = __TS__Index(PurchaseVoidMonstrosity.prototype)
    PurchaseVoidMonstrosity.prototype.__newindex = __TS__NewIndex(PurchaseVoidMonstrosity.prototype)
    PurchaseVoidMonstrosity.prototype.constructor = PurchaseVoidMonstrosity
    PurchaseVoidMonstrosity.____super = GenericAbility
    setmetatable(PurchaseVoidMonstrosity, PurchaseVoidMonstrosity.____super)
    setmetatable(PurchaseVoidMonstrosity.prototype, PurchaseVoidMonstrosity.____super.prototype)
    function PurchaseVoidMonstrosity.new(...)
        local self = setmetatable({}, PurchaseVoidMonstrosity.prototype)
        self:____constructor(...)
        return self
    end
    function PurchaseVoidMonstrosity.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0BK", game)
    end
    function PurchaseVoidMonstrosity.prototype.TargetOnCastAction(self)
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(
                    GetSpellAbilityUnit()
                )
            )
        )
        if owner then
            if owner:GetVoidFragments() >= 800 then
                owner:SetVoidFragments(
                    owner:GetVoidFragments() - 800
                )
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Void.PurchaseVoidMonstrosity"] = {initialized = false, cached = nil, loader = __module_231}
function __module_232()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.DrinkWaterRune = {}
    local DrinkWaterRune = ____exports.DrinkWaterRune
    DrinkWaterRune.name = "DrinkWaterRune"
    DrinkWaterRune.__index = DrinkWaterRune
    DrinkWaterRune.prototype = {}
    DrinkWaterRune.prototype.__index = __TS__Index(DrinkWaterRune.prototype)
    DrinkWaterRune.prototype.__newindex = __TS__NewIndex(DrinkWaterRune.prototype)
    DrinkWaterRune.prototype.constructor = DrinkWaterRune
    DrinkWaterRune.____super = GenericAbility
    setmetatable(DrinkWaterRune, DrinkWaterRune.____super)
    setmetatable(DrinkWaterRune.prototype, DrinkWaterRune.____super.prototype)
    function DrinkWaterRune.new(...)
        local self = setmetatable({}, DrinkWaterRune.prototype)
        self:____constructor(...)
        return self
    end
    function DrinkWaterRune.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0E3", game)
    end
    function DrinkWaterRune.prototype.TargetOnEffectAction(self)
        local u = GetTriggerUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(u)
            )
        )
        if owner then
            local tower = owner:GetTower(
                GetHandleId(u)
            )
            local target = owner:GetTower(
                GetHandleId(
                    GetSpellTargetUnit()
                )
            )
            if tower and target then
                local mana = GetUnitStateSwap(UNIT_STATE_MANA, tower.tower)
                if target:GetTypeID() == FourCC("n01R") then
                    target:Upgrade(
                        FourCC("n027")
                    )
                    if mana > 8 then
                        local newId = FourCC("u037")
                        if Util:RandomInt(1000, 2000) == 1337 then
                            newId = FourCC("h03G")
                        end
                        tower:Upgrade(newId)
                    else
                        SetUnitManaBJ(tower.tower, mana + 1)
                    end
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Elementalist.DrinkWaterRune"] = {initialized = false, cached = nil, loader = __module_232}
function __module_233()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.UndeadUpgrade = {}
    local UndeadUpgrade = ____exports.UndeadUpgrade
    UndeadUpgrade.name = "UndeadUpgrade"
    UndeadUpgrade.__index = UndeadUpgrade
    UndeadUpgrade.prototype = {}
    UndeadUpgrade.prototype.__index = __TS__Index(UndeadUpgrade.prototype)
    UndeadUpgrade.prototype.__newindex = __TS__NewIndex(UndeadUpgrade.prototype)
    UndeadUpgrade.prototype.constructor = UndeadUpgrade
    UndeadUpgrade.____super = GenericAbility
    setmetatable(UndeadUpgrade, UndeadUpgrade.____super)
    setmetatable(UndeadUpgrade.prototype, UndeadUpgrade.____super.prototype)
    function UndeadUpgrade.new(...)
        local self = setmetatable({}, UndeadUpgrade.prototype)
        self:____constructor(...)
        return self
    end
    function UndeadUpgrade.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0E6", game)
    end
    function UndeadUpgrade.prototype.TargetOnEffectAction(self)
        local u = GetTriggerUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(u)
            )
        )
        if owner then
            local tower = owner:GetTower(
                GetHandleId(u)
            )
            if tower then
                tower:Upgrade(
                    FourCC("u038")
                )
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Elementalist.UndeadUpgrade"] = {initialized = false, cached = nil, loader = __module_233}
function __module_234()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.PurchaseVoidMinion = {}
    local PurchaseVoidMinion = ____exports.PurchaseVoidMinion
    PurchaseVoidMinion.name = "PurchaseVoidMinion"
    PurchaseVoidMinion.__index = PurchaseVoidMinion
    PurchaseVoidMinion.prototype = {}
    PurchaseVoidMinion.prototype.__index = __TS__Index(PurchaseVoidMinion.prototype)
    PurchaseVoidMinion.prototype.__newindex = __TS__NewIndex(PurchaseVoidMinion.prototype)
    PurchaseVoidMinion.prototype.constructor = PurchaseVoidMinion
    PurchaseVoidMinion.____super = GenericAbility
    setmetatable(PurchaseVoidMinion, PurchaseVoidMinion.____super)
    setmetatable(PurchaseVoidMinion.prototype, PurchaseVoidMinion.____super.prototype)
    function PurchaseVoidMinion.new(...)
        local self = setmetatable({}, PurchaseVoidMinion.prototype)
        self:____constructor(...)
        return self
    end
    function PurchaseVoidMinion.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0EZ", game)
    end
    function PurchaseVoidMinion.prototype.TargetOnCastAction(self)
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(
                    GetSpellAbilityUnit()
                )
            )
        )
        local t = GetSpellTargetUnit()
        if owner then
            local target = owner:GetTower(
                GetHandleId(t)
            )
            if target then
                if target:GetTypeID() == FourCC("h02G") then
                    if owner:GetVoidFragments() >= 50 then
                        owner:SetVoidFragments(
                            owner:GetVoidFragments() - 50
                        )
                    end
                    local voidMinions = {"hC12", "hC13", "hC14"}
                    local index = Util:RandomInt(0, 2)
                    target:Upgrade(
                        FourCC(voidMinions[index + 1])
                    )
                else
                    SetUnitManaBJ(
                        owner:getVoidBuilder(),
                        owner:GetVoidFragments() + 50
                    )
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Void.PurchaseVoidMinion"] = {initialized = false, cached = nil, loader = __module_234}
function __module_235()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
    local GenericAbility = ____GenericAbility.GenericAbility
    ____exports.ConstructThaddius = {}
    local ConstructThaddius = ____exports.ConstructThaddius
    ConstructThaddius.name = "ConstructThaddius"
    ConstructThaddius.__index = ConstructThaddius
    ConstructThaddius.prototype = {}
    ConstructThaddius.prototype.__index = __TS__Index(ConstructThaddius.prototype)
    ConstructThaddius.prototype.__newindex = __TS__NewIndex(ConstructThaddius.prototype)
    ConstructThaddius.prototype.constructor = ConstructThaddius
    ConstructThaddius.____super = GenericAbility
    setmetatable(ConstructThaddius, ConstructThaddius.____super)
    setmetatable(ConstructThaddius.prototype, ConstructThaddius.____super.prototype)
    function ConstructThaddius.new(...)
        local self = setmetatable({}, ConstructThaddius.prototype)
        self:____constructor(...)
        return self
    end
    function ConstructThaddius.prototype.____constructor(self, game)
        GenericAbility.prototype.____constructor(self, "A0F5", game)
    end
    function ConstructThaddius.prototype.TargetOnEffectAction(self)
        local u = GetTriggerUnit()
        local t = GetSpellTargetUnit()
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(u)
            )
        )
        if owner then
            local source = owner:GetTower(
                GetHandleId(u)
            )
            local target = owner:GetTower(
                GetHandleId(t)
            )
            if source and target then
                if (source:GetTypeID() == FourCC("oC7D") and target:GetTypeID() == FourCC("oC7E")) or (source:GetTypeID() == FourCC("oC7E") and target:GetTypeID() == FourCC("oC7D")) then
                    source:Upgrade(
                        FourCC("oC7F")
                    )
                    target:Upgrade(
                        FourCC("oC76")
                    )
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.Naxxramas.StalaggFeugen"] = {initialized = false, cached = nil, loader = __module_235}
function __module_236()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____FrostAttack = require("app.src.World.Entity.GenericAbilities.FrostAttack")
    local FrostAttack = ____FrostAttack.FrostAttack
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    local ____Move = require("app.src.World.Entity.GenericAbilities.Move")
    local Move = ____Move.Move
    local ____FelineSwiftness = require("app.src.World.Entity.GenericAbilities.NightElfAncientProtector.FelineSwiftness")
    local FelineSwiftness = ____FelineSwiftness.FelineSwiftness
    local ____NaturesNourishment = require("app.src.World.Entity.GenericAbilities.NightElfAncientProtector.NaturesNourishment")
    local NaturesNourishment = ____NaturesNourishment.NaturesNourishment
    local ____WolvenFury = require("app.src.World.Entity.GenericAbilities.NightElfAncientProtector.WolvenFury")
    local WolvenFury = ____WolvenFury.WolvenFury
    local ____UnchargedRuneMorph = require("app.src.World.Entity.GenericAbilities.Elementalist.UnchargedRuneMorph")
    local UnchargedRuneMorph = ____UnchargedRuneMorph.UnchargedRuneMorph
    local ____ElementalistSettings = require("app.src.World.Entity.GenericAbilities.Elementalist.ElementalistSettings")
    local ElementalistSettings = ____ElementalistSettings.ElementalistSettings
    local ____SiphonEnergy = require("app.src.World.Entity.GenericAbilities.Elementalist.SiphonEnergy")
    local SiphonEnergy = ____SiphonEnergy.SiphonEnergy
    local ____Enchantment = require("app.src.World.Entity.GenericAbilities.AllianceOfBlades.Enchantment")
    local Enchantment = ____Enchantment.Enchantment
    local ____Transfuse = require("app.src.World.Entity.GenericAbilities.AllianceOfBlades.Transfuse")
    local Transfuse = ____Transfuse.Transfuse
    local ____Infuse = require("app.src.World.Entity.GenericAbilities.AllianceOfBlades.Infuse")
    local Infuse = ____Infuse.Infuse
    local ____Sacrifice = require("app.src.World.Entity.GenericAbilities.AllianceOfBlades.Sacrifice")
    local Sacrifice = ____Sacrifice.Sacrifice
    local ____AlchemicalTransmutation = require("app.src.World.Entity.GenericAbilities.AllianceOfBlades.AlchemicalTransmutation")
    local AlchemicalTransmutation = ____AlchemicalTransmutation.AlchemicalTransmutation
    local ____ChannelItem = require("app.src.World.Entity.GenericAbilities.AllianceOfBlades.ChannelItem")
    local ChannelItem = ____ChannelItem.ChannelItem
    local ____Trade = require("app.src.World.Entity.GenericAbilities.AllianceOfBlades.Trade")
    local Trade = ____Trade.Trade
    local ____AwakenDormantPheonixEgg = require("app.src.World.Entity.GenericAbilities.Elementalist.AwakenDormantPheonixEgg")
    local AwakenDormantPheonixEgg = ____AwakenDormantPheonixEgg.AwakenDormantPheonixEgg
    local ____PayTheToll = require("app.src.World.Entity.GenericAbilities.Void.PayTheToll")
    local PayTheToll = ____PayTheToll.PayTheToll
    local ____VoidLordAbility = require("app.src.World.Entity.GenericAbilities.Void.VoidLordAbility")
    local VoidLordAbility = ____VoidLordAbility.VoidLordAbility
    local ____PurchaseVoidBeast = require("app.src.World.Entity.GenericAbilities.Void.PurchaseVoidBeast")
    local PurchaseVoidBeast = ____PurchaseVoidBeast.PurchaseVoidBeast
    local ____PurchaseVoidBeing = require("app.src.World.Entity.GenericAbilities.Void.PurchaseVoidBeing")
    local PurchaseVoidBeing = ____PurchaseVoidBeing.PurchaseVoidBeing
    local ____PurchaseVoidLord = require("app.src.World.Entity.GenericAbilities.Void.PurchaseVoidLord")
    local PurchaseVoidLord = ____PurchaseVoidLord.PurchaseVoidLord
    local ____PurchaseVoidMonstrosity = require("app.src.World.Entity.GenericAbilities.Void.PurchaseVoidMonstrosity")
    local PurchaseVoidMonstrosity = ____PurchaseVoidMonstrosity.PurchaseVoidMonstrosity
    local ____DrinkWaterRune = require("app.src.World.Entity.GenericAbilities.Elementalist.DrinkWaterRune")
    local DrinkWaterRune = ____DrinkWaterRune.DrinkWaterRune
    local ____UndeadUpgrade = require("app.src.World.Entity.GenericAbilities.Elementalist.UndeadUpgrade")
    local UndeadUpgrade = ____UndeadUpgrade.UndeadUpgrade
    local ____PurchaseVoidMinion = require("app.src.World.Entity.GenericAbilities.Void.PurchaseVoidMinion")
    local PurchaseVoidMinion = ____PurchaseVoidMinion.PurchaseVoidMinion
    local ____StalaggFeugen = require("app.src.World.Entity.GenericAbilities.Naxxramas.StalaggFeugen")
    local ConstructThaddius = ____StalaggFeugen.ConstructThaddius
    ____exports.GenericAbilityHandler = {}
    local GenericAbilityHandler = ____exports.GenericAbilityHandler
    GenericAbilityHandler.name = "GenericAbilityHandler"
    GenericAbilityHandler.__index = GenericAbilityHandler
    GenericAbilityHandler.prototype = {}
    GenericAbilityHandler.prototype.__index = GenericAbilityHandler.prototype
    GenericAbilityHandler.prototype.constructor = GenericAbilityHandler
    function GenericAbilityHandler.new(...)
        local self = setmetatable({}, GenericAbilityHandler.prototype)
        self:____constructor(...)
        return self
    end
    function GenericAbilityHandler.prototype.____constructor(self, game)
        self.abilities = {}
        self.activeAbilities = {}
        self.elementalistSettings = ElementalistSettings.new()
        self.targetUnitOnEffectAbilities = {}
        self.targetUnitOnCastAbilities = {}
        self.game = game
        self:AddAbilitiesToList()
        self:SetupAbilities()
        self.targetUnitOnEffectAbilitiesTrigger = Trigger.new()
        self.targetUnitOnEffectAbilitiesTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_EFFECT)
        self.targetUnitOnEffectAbilitiesTrigger:AddAction(
            function() return self:DoTargetUnitOnEffectAbilities() end
        )
        self.targetUnitOnCastAbilitiesTrigger = Trigger.new()
        self.targetUnitOnCastAbilitiesTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SPELL_CAST)
        self.targetUnitOnCastAbilitiesTrigger:AddAction(
            function() return self:DoTargetUnitOnCastAbilities() end
        )
    end
    function GenericAbilityHandler.prototype.AddAbilitiesToList(self)
        __TS__ArrayPush(self.abilities, FrostAttack)
        __TS__ArrayPush(self.abilities, Move)
        __TS__ArrayPush(self.abilities, FelineSwiftness)
        __TS__ArrayPush(self.abilities, NaturesNourishment)
        __TS__ArrayPush(self.abilities, WolvenFury)
        __TS__ArrayPush(self.abilities, UnchargedRuneMorph)
        __TS__ArrayPush(self.abilities, SiphonEnergy)
        __TS__ArrayPush(self.abilities, DrinkWaterRune)
        __TS__ArrayPush(self.abilities, Enchantment)
        __TS__ArrayPush(self.abilities, Transfuse)
        __TS__ArrayPush(self.abilities, Infuse)
        __TS__ArrayPush(self.abilities, Sacrifice)
        __TS__ArrayPush(self.abilities, AlchemicalTransmutation)
        __TS__ArrayPush(self.abilities, ChannelItem)
        __TS__ArrayPush(self.abilities, Trade)
        __TS__ArrayPush(self.abilities, AwakenDormantPheonixEgg)
        __TS__ArrayPush(self.abilities, UndeadUpgrade)
        __TS__ArrayPush(self.abilities, PayTheToll)
        __TS__ArrayPush(self.abilities, VoidLordAbility)
        __TS__ArrayPush(self.abilities, PurchaseVoidBeing)
        __TS__ArrayPush(self.abilities, PurchaseVoidBeast)
        __TS__ArrayPush(self.abilities, PurchaseVoidMonstrosity)
        __TS__ArrayPush(self.abilities, PurchaseVoidLord)
        __TS__ArrayPush(self.abilities, PurchaseVoidMinion)
        __TS__ArrayPush(self.abilities, ConstructThaddius)
    end
    function GenericAbilityHandler.prototype.DoTargetUnitOnEffectAbilities(self)
        for ____, tower in ipairs(self.targetUnitOnEffectAbilities) do
            if tower:Condition() then
                tower:TargetOnEffectAction()
            end
        end
    end
    function GenericAbilityHandler.prototype.DoTargetUnitOnCastAbilities(self)
        for ____, tower in ipairs(self.targetUnitOnCastAbilities) do
            if tower:Condition() then
                tower:TargetOnCastAction()
            end
        end
    end
    function GenericAbilityHandler.prototype.SetupAbilities(self)
        for ____, ability in ipairs(self.abilities) do
            local ObjectExtendsAbility = ability.new(self.game)
            if ObjectExtendsAbility:IsAttackActionAbility() then
                self.game.gameDamageEngine:AddInitialDamageEventAbility(ObjectExtendsAbility)
            end
            if ObjectExtendsAbility:IsAbilityOnEffectTargetsUnit() then
                __TS__ArrayPush(self.targetUnitOnEffectAbilities, ObjectExtendsAbility)
            end
            if ObjectExtendsAbility:IsAbilityOnCastTargetsUnit() then
                __TS__ArrayPush(self.targetUnitOnCastAbilities, ObjectExtendsAbility)
            end
            __TS__ArrayPush(self.activeAbilities, ObjectExtendsAbility)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.GenericAbilities.GenericAbilityHandler"] = {initialized = false, cached = nil, loader = __module_236}
function __module_237()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    ____exports.VoidTicker = {}
    local VoidTicker = ____exports.VoidTicker
    VoidTicker.name = "VoidTicker"
    VoidTicker.__index = VoidTicker
    VoidTicker.prototype = {}
    VoidTicker.prototype.__index = VoidTicker.prototype
    VoidTicker.prototype.constructor = VoidTicker
    function VoidTicker.new(...)
        local self = setmetatable({}, VoidTicker.prototype)
        self:____constructor(...)
        return self
    end
    function VoidTicker.prototype.____constructor(self, game)
        self.game = game
        self.trig = Trigger.new()
        self.trig:RegisterTimerEventPeriodic(30)
        self.trig:AddAction(
            function() return self:TickVoid() end
        )
    end
    function VoidTicker.prototype.TickVoid(self)
        self.game.players:forEach(
            function(____, player)
                player:SetVoidFragments(
                    player:GetVoidFragments() + player:GetVoidFragmentTick()
                )
                if player:getVoidBuilder() then
                    SetUnitManaBJ(
                        player:getVoidBuilder(),
                        player:GetVoidFragments()
                    )
                end
                if player:GetVoidFragments() > 2000 then
                    player:SetVoidFragments(2000)
                end
            end
        )
    end
    return ____exports
    
end
__modules["app.src.World.Game.VoidTicker"] = {initialized = false, cached = nil, loader = __module_237}
function __module_238()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    ____exports.Queue = {}
    local Queue = ____exports.Queue
    Queue.name = "Queue"
    Queue.__index = Queue
    Queue.prototype = {}
    Queue.prototype.__index = Queue.prototype
    Queue.prototype.constructor = Queue
    function Queue.new(...)
        local self = setmetatable({}, Queue.prototype)
        self:____constructor(...)
        return self
    end
    function Queue.prototype.____constructor(self)
        self._store = {}
    end
    function Queue.prototype.push(self, val)
        __TS__ArrayPush(self._store, val)
    end
    function Queue.prototype.pop(self)
        return __TS__ArrayShift(self._store)
    end
    function Queue.prototype.size(self)
        return #self._store
    end
    return ____exports
    
end
__modules["app.src.lib.WCEventQueue.Queue"] = {initialized = false, cached = nil, loader = __module_238}
function __module_239()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    local ____Queue = require("app.src.lib.WCEventQueue.Queue")
    local Queue = ____Queue.Queue
    ____exports.EventQueue = {}
    local EventQueue = ____exports.EventQueue
    EventQueue.name = "EventQueue"
    EventQueue.__index = EventQueue
    EventQueue.prototype = {}
    EventQueue.prototype.__index = EventQueue.prototype
    EventQueue.prototype.constructor = EventQueue
    function EventQueue.new(...)
        local self = setmetatable({}, EventQueue.prototype)
        self:____constructor(...)
        return self
    end
    function EventQueue.prototype.____constructor(self)
        self.maxEventsPerTick = 2
        self.highPriority = Queue.new()
        self.medPriority = Queue.new()
        self.lowPriority = Queue.new()
        self.currentTask = nil
        self.ticker = Trigger.new()
        self.ticker:RegisterTimerEventPeriodic(0.1)
        self.ticker:AddAction(
            function()
                self:HandleTick()
            end
        )
    end
    function EventQueue.prototype.HandleTick(self)
        if self.currentTask then
            do
                local i = 0
                while i < self.maxEventsPerTick do
                    if self.currentTask then
                        if self:currentTask() then
                            self.currentTask = nil
                        end
                    else
                        self:GetTask()
                    end
                    i = i + 1
                end
            end
        else
            self:GetTask()
        end
    end
    function EventQueue.prototype.GetTask(self)
        if self.highPriority:size() > 0 then
            self.currentTask = self.highPriority:pop()
            return
        end
        if self.medPriority:size() > 0 then
            self.currentTask = self.medPriority:pop()
            return
        end
        if self.lowPriority:size() > 0 then
            self.currentTask = self.lowPriority:pop()
            return
        end
    end
    function EventQueue.prototype.AddHigh(self, event)
        self.highPriority:push(event)
    end
    function EventQueue.prototype.AddMed(self, event)
        self.medPriority:push(event)
    end
    function EventQueue.prototype.AddLow(self, event)
        self.lowPriority:push(event)
    end
    return ____exports
    
end
__modules["app.src.lib.WCEventQueue.EventQueue"] = {initialized = false, cached = nil, loader = __module_239}
function __module_240()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    local ____Queue = require("app.src.lib.WCEventQueue.Queue")
    local Queue = ____Queue.Queue
    ____exports.SafeEventQueue = {}
    local SafeEventQueue = ____exports.SafeEventQueue
    SafeEventQueue.name = "SafeEventQueue"
    SafeEventQueue.__index = SafeEventQueue
    SafeEventQueue.prototype = {}
    SafeEventQueue.prototype.__index = SafeEventQueue.prototype
    SafeEventQueue.prototype.constructor = SafeEventQueue
    function SafeEventQueue.new(...)
        local self = setmetatable({}, SafeEventQueue.prototype)
        self:____constructor(...)
        return self
    end
    function SafeEventQueue.prototype.____constructor(self, game)
        self.maxEventsPerTick = 2
        self.highPriority = Queue.new()
        self.medPriority = Queue.new()
        self.lowPriority = Queue.new()
        self.currentTask = nil
        self.ticker = Trigger.new()
        self.ticker:RegisterTimerEventPeriodic(0.1)
        self.ticker:AddAction(
            function()
                self:HandleTick()
            end
        )
        self.game = game
    end
    function SafeEventQueue.prototype.HandleTick(self)
        if self.game.worldMap.gameRoundHandler and not self.game.worldMap.gameRoundHandler.isWaveInProgress then
            if self.currentTask then
                do
                    local i = 0
                    while i < self.maxEventsPerTick do
                        if self.currentTask then
                            if self:currentTask() then
                                self.currentTask = nil
                            end
                        else
                            self:GetTask()
                        end
                        i = i + 1
                    end
                end
            else
                self:GetTask()
            end
        end
    end
    function SafeEventQueue.prototype.GetTask(self)
        if self.highPriority:size() > 0 then
            self.currentTask = self.highPriority:pop()
            return
        end
        if self.medPriority:size() > 0 then
            self.currentTask = self.medPriority:pop()
            return
        end
        if self.lowPriority:size() > 0 then
            self.currentTask = self.lowPriority:pop()
            return
        end
    end
    function SafeEventQueue.prototype.AddHigh(self, event)
        self.highPriority:push(event)
    end
    function SafeEventQueue.prototype.AddMed(self, event)
        self.medPriority:push(event)
    end
    function SafeEventQueue.prototype.AddLow(self, event)
        self.lowPriority:push(event)
    end
    return ____exports
    
end
__modules["app.src.lib.WCEventQueue.SafeEventQueue"] = {initialized = false, cached = nil, loader = __module_240}
function __module_241()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    ____exports.TimedEventQueue = {}
    local TimedEventQueue = ____exports.TimedEventQueue
    TimedEventQueue.name = "TimedEventQueue"
    TimedEventQueue.__index = TimedEventQueue
    TimedEventQueue.prototype = {}
    TimedEventQueue.prototype.__index = TimedEventQueue.prototype
    TimedEventQueue.prototype.constructor = TimedEventQueue
    function TimedEventQueue.new(...)
        local self = setmetatable({}, TimedEventQueue.prototype)
        self:____constructor(...)
        return self
    end
    function TimedEventQueue.prototype.____constructor(self, game)
        self.tick = 0
        self.maxTick = 100000
        self.events = Map.new()
        self.ticker = Trigger.new()
        self.ticker:RegisterTimerEventPeriodic(0.1)
        self.ticker:AddAction(
            function()
                self.tick = (self.tick + 1) % self.maxTick
                self:HandleTick()
            end
        )
        self.game = game
    end
    function TimedEventQueue.prototype.HandleTick(self)
        self.events:forEach(
            (function(____, event, key)
                if event:AttemptAction(self.tick, self) then
                    self.events:delete(key)
                end
            end)
        )
    end
    function TimedEventQueue.prototype.AddEvent(self, event)
        self.events:set(
            Util:RandomHash(10),
            event
        )
    end
    function TimedEventQueue.prototype.GetGame(self)
        return self.game
    end
    return ____exports
    
end
__modules["app.src.lib.WCEventQueue.TimedEventQueue"] = {initialized = false, cached = nil, loader = __module_241}
function __module_242()
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
    
end
__modules["app.src.World.WarcraftMaul"] = {initialized = false, cached = nil, loader = __module_242}
function __module_243()
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
    
end
__modules["app.src.lib.translators"] = {initialized = false, cached = nil, loader = __module_243}
function __module_244()
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
    
end
__modules["app.src.World.Entity.CreepAbilities.specs.CreepAbility"] = {initialized = false, cached = nil, loader = __module_244}
function __module_245()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
    local CreepAbility = ____CreepAbility.CreepAbility
    ____exports.DivineShield = {}
    local DivineShield = ____exports.DivineShield
    DivineShield.name = "DivineShield"
    DivineShield.__index = DivineShield
    DivineShield.prototype = {}
    DivineShield.prototype.__index = __TS__Index(DivineShield.prototype)
    DivineShield.prototype.__newindex = __TS__NewIndex(DivineShield.prototype)
    DivineShield.prototype.constructor = DivineShield
    DivineShield.____super = CreepAbility
    setmetatable(DivineShield, DivineShield.____super)
    setmetatable(DivineShield.prototype, DivineShield.____super.prototype)
    function DivineShield.new(...)
        local self = setmetatable({}, DivineShield.prototype)
        self:____constructor(...)
        return self
    end
    function DivineShield.prototype.____constructor(self, abilityUnit)
        CreepAbility.prototype.____constructor(self, "A01E", abilityUnit)
    end
    function DivineShield.prototype.ModifyFinalDamage(self)
        if not self.game then
            return
        end
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if target then
            if GetUnitAbilityLevel(
                target,
                self:GetID()
            ) > 0 then
                local lvl = GetUnitAbilityLevel(
                    target,
                    self:GetID()
                )
                self.game.gameDamageEngineGlobals.udg_DamageEventAmount = 0
                if lvl <= 1 then
                    UnitRemoveAbility(
                        target,
                        self:GetID()
                    )
                else
                    SetUnitAbilityLevel(
                        target,
                        self:GetID(),
                        lvl - 1
                    )
                end
            end
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.CreepAbilities.DivineShield"] = {initialized = false, cached = nil, loader = __module_245}
function __module_246()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
    local CreepAbility = ____CreepAbility.CreepAbility
    ____exports.CrippleAura = {}
    local CrippleAura = ____exports.CrippleAura
    CrippleAura.name = "CrippleAura"
    CrippleAura.__index = CrippleAura
    CrippleAura.prototype = {}
    CrippleAura.prototype.__index = __TS__Index(CrippleAura.prototype)
    CrippleAura.prototype.__newindex = __TS__NewIndex(CrippleAura.prototype)
    CrippleAura.prototype.constructor = CrippleAura
    CrippleAura.____super = CreepAbility
    setmetatable(CrippleAura, CrippleAura.____super)
    setmetatable(CrippleAura.prototype, CrippleAura.____super.prototype)
    function CrippleAura.new(...)
        local self = setmetatable({}, CrippleAura.prototype)
        self:____constructor(...)
        return self
    end
    function CrippleAura.prototype.____constructor(self, abilityUnit)
        CreepAbility.prototype.____constructor(self, "A08G", abilityUnit)
    end
    function CrippleAura.prototype.AttackAction(self)
        if not self.game or not self.game.worldMap.gameRoundHandler then
            return
        end
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        local source = self.game.gameDamageEngineGlobals.udg_DamageEventSource
        if target and source then
            if UnitHasBuffBJ(
                source,
                FourCC("B01C")
            ) then
                return
            end
            if not UnitHasBuffBJ(
                target,
                FourCC("B01D")
            ) then
                return
            end
            if Util:RandomInt(1, 100) > 10 then
                return
            end
            local tempUnit = CreateUnit(
                Player(PLAYER_NEUTRAL_PASSIVE),
                FourCC("u008"),
                0,
                -5300,
                bj_UNIT_FACING
            )
            UnitAddAbilityBJ(
                FourCC("A06B"),
                tempUnit
            )
            SetUnitAbilityLevel(
                tempUnit,
                FourCC("A06B"),
                self.game.worldMap.gameRoundHandler.currentWave + 1
            )
            UnitApplyTimedLifeBJ(
                1,
                FourCC("BTLF"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "cripple", source)
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.CreepAbilities.CrippleAura"] = {initialized = false, cached = nil, loader = __module_246}
function __module_247()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
    local CreepAbility = ____CreepAbility.CreepAbility
    ____exports.VampiricAura = {}
    local VampiricAura = ____exports.VampiricAura
    VampiricAura.name = "VampiricAura"
    VampiricAura.__index = VampiricAura
    VampiricAura.prototype = {}
    VampiricAura.prototype.__index = __TS__Index(VampiricAura.prototype)
    VampiricAura.prototype.__newindex = __TS__NewIndex(VampiricAura.prototype)
    VampiricAura.prototype.constructor = VampiricAura
    VampiricAura.____super = CreepAbility
    setmetatable(VampiricAura, VampiricAura.____super)
    setmetatable(VampiricAura.prototype, VampiricAura.____super.prototype)
    function VampiricAura.new(...)
        local self = setmetatable({}, VampiricAura.prototype)
        self:____constructor(...)
        return self
    end
    function VampiricAura.prototype.____constructor(self, abilityUnit)
        CreepAbility.prototype.____constructor(self, "A0B3", abilityUnit)
    end
    function VampiricAura.prototype.AttackAction(self)
        if not self.game or not self.game.worldMap.gameRoundHandler then
            return
        end
        local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
        if target then
            if not (GetUnitAbilityLevel(
                target,
                self:GetID()
            ) > 0) then
                return
            end
            if Util:RandomInt(1, 100) > 10 then
                return
            end
            local effectModel = "Abilities\\Spells\\Undead\\VampiricAura\\VampiricAuraTarget.mdl"
            DestroyEffectBJ(
                AddSpecialEffect(
                    effectModel,
                    GetUnitX(target),
                    GetUnitY(target)
                )
            )
            SetUnitLifeBJ(
                target,
                GetUnitStateSwap(UNIT_STATE_LIFE, target) + 4 * (self.game.worldMap.gameRoundHandler.currentWave + 1)
            )
        end
    end
    return ____exports
    
end
__modules["app.src.World.Entity.CreepAbilities.VampiricAura"] = {initialized = false, cached = nil, loader = __module_247}
function __module_248()
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
    
end
__modules["app.src.World.Entity.CreepAbilities.WalkItOff"] = {initialized = false, cached = nil, loader = __module_248}
function __module_249()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
    local CreepAbility = ____CreepAbility.CreepAbility
    ____exports.HardnedSkin = {}
    local HardnedSkin = ____exports.HardnedSkin
    HardnedSkin.name = "HardnedSkin"
    HardnedSkin.__index = HardnedSkin
    HardnedSkin.prototype = {}
    HardnedSkin.prototype.__index = __TS__Index(HardnedSkin.prototype)
    HardnedSkin.prototype.__newindex = __TS__NewIndex(HardnedSkin.prototype)
    HardnedSkin.prototype.constructor = HardnedSkin
    HardnedSkin.____super = CreepAbility
    setmetatable(HardnedSkin, HardnedSkin.____super)
    setmetatable(HardnedSkin.prototype, HardnedSkin.____super.prototype)
    function HardnedSkin.new(...)
        local self = setmetatable({}, HardnedSkin.prototype)
        self:____constructor(...)
        return self
    end
    function HardnedSkin.prototype.____constructor(self, abilityUnit)
        CreepAbility.prototype.____constructor(self, "A069", abilityUnit)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.CreepAbilities.HardnedSkin"] = {initialized = false, cached = nil, loader = __module_249}
function __module_250()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
    local CreepAbility = ____CreepAbility.CreepAbility
    ____exports.Evasion = {}
    local Evasion = ____exports.Evasion
    Evasion.name = "Evasion"
    Evasion.__index = Evasion
    Evasion.prototype = {}
    Evasion.prototype.__index = __TS__Index(Evasion.prototype)
    Evasion.prototype.__newindex = __TS__NewIndex(Evasion.prototype)
    Evasion.prototype.constructor = Evasion
    Evasion.____super = CreepAbility
    setmetatable(Evasion, Evasion.____super)
    setmetatable(Evasion.prototype, Evasion.____super.prototype)
    function Evasion.new(...)
        local self = setmetatable({}, Evasion.prototype)
        self:____constructor(...)
        return self
    end
    function Evasion.prototype.____constructor(self, abilityUnit)
        CreepAbility.prototype.____constructor(self, "A06A", abilityUnit)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.CreepAbilities.Evasion"] = {initialized = false, cached = nil, loader = __module_250}
function __module_251()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
    local CreepAbility = ____CreepAbility.CreepAbility
    ____exports.ArmorBonus = {}
    local ArmorBonus = ____exports.ArmorBonus
    ArmorBonus.name = "ArmorBonus"
    ArmorBonus.__index = ArmorBonus
    ArmorBonus.prototype = {}
    ArmorBonus.prototype.__index = __TS__Index(ArmorBonus.prototype)
    ArmorBonus.prototype.__newindex = __TS__NewIndex(ArmorBonus.prototype)
    ArmorBonus.prototype.constructor = ArmorBonus
    ArmorBonus.____super = CreepAbility
    setmetatable(ArmorBonus, ArmorBonus.____super)
    setmetatable(ArmorBonus.prototype, ArmorBonus.____super.prototype)
    function ArmorBonus.new(...)
        local self = setmetatable({}, ArmorBonus.prototype)
        self:____constructor(...)
        return self
    end
    function ArmorBonus.prototype.____constructor(self, abilityUnit)
        CreepAbility.prototype.____constructor(self, "A06C", abilityUnit)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.CreepAbilities.ArmorBonus"] = {initialized = false, cached = nil, loader = __module_251}
function __module_252()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
    local CreepAbility = ____CreepAbility.CreepAbility
    ____exports.SpellShield = {}
    local SpellShield = ____exports.SpellShield
    SpellShield.name = "SpellShield"
    SpellShield.__index = SpellShield
    SpellShield.prototype = {}
    SpellShield.prototype.__index = __TS__Index(SpellShield.prototype)
    SpellShield.prototype.__newindex = __TS__NewIndex(SpellShield.prototype)
    SpellShield.prototype.constructor = SpellShield
    SpellShield.____super = CreepAbility
    setmetatable(SpellShield, SpellShield.____super)
    setmetatable(SpellShield.prototype, SpellShield.____super.prototype)
    function SpellShield.new(...)
        local self = setmetatable({}, SpellShield.prototype)
        self:____constructor(...)
        return self
    end
    function SpellShield.prototype.____constructor(self, abilityUnit)
        CreepAbility.prototype.____constructor(self, "A00D", abilityUnit)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.CreepAbilities.SpellShield"] = {initialized = false, cached = nil, loader = __module_252}
function __module_253()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
    local CreepAbility = ____CreepAbility.CreepAbility
    ____exports.TornadoAura = {}
    local TornadoAura = ____exports.TornadoAura
    TornadoAura.name = "TornadoAura"
    TornadoAura.__index = TornadoAura
    TornadoAura.prototype = {}
    TornadoAura.prototype.__index = __TS__Index(TornadoAura.prototype)
    TornadoAura.prototype.__newindex = __TS__NewIndex(TornadoAura.prototype)
    TornadoAura.prototype.constructor = TornadoAura
    TornadoAura.____super = CreepAbility
    setmetatable(TornadoAura, TornadoAura.____super)
    setmetatable(TornadoAura.prototype, TornadoAura.____super.prototype)
    function TornadoAura.new(...)
        local self = setmetatable({}, TornadoAura.prototype)
        self:____constructor(...)
        return self
    end
    function TornadoAura.prototype.____constructor(self, abilityUnit)
        CreepAbility.prototype.____constructor(self, "A01S", abilityUnit)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.CreepAbilities.TornadoAura"] = {initialized = false, cached = nil, loader = __module_253}
function __module_254()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
    local CreepAbility = ____CreepAbility.CreepAbility
    ____exports.MorningPerson = {}
    local MorningPerson = ____exports.MorningPerson
    MorningPerson.name = "MorningPerson"
    MorningPerson.__index = MorningPerson
    MorningPerson.prototype = {}
    MorningPerson.prototype.__index = __TS__Index(MorningPerson.prototype)
    MorningPerson.prototype.__newindex = __TS__NewIndex(MorningPerson.prototype)
    MorningPerson.prototype.constructor = MorningPerson
    MorningPerson.____super = CreepAbility
    setmetatable(MorningPerson, MorningPerson.____super)
    setmetatable(MorningPerson.prototype, MorningPerson.____super.prototype)
    function MorningPerson.new(...)
        local self = setmetatable({}, MorningPerson.prototype)
        self:____constructor(...)
        return self
    end
    function MorningPerson.prototype.____constructor(self, abilityUnit)
        CreepAbility.prototype.____constructor(self, "A06D", abilityUnit)
    end
    return ____exports
    
end
__modules["app.src.World.Entity.CreepAbilities.MorningPerson"] = {initialized = false, cached = nil, loader = __module_254}
function __module_255()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    require("lualib_bundle");
    local ____exports = {}
    local ____DivineShield = require("app.src.World.Entity.CreepAbilities.DivineShield")
    local DivineShield = ____DivineShield.DivineShield
    local ____CrippleAura = require("app.src.World.Entity.CreepAbilities.CrippleAura")
    local CrippleAura = ____CrippleAura.CrippleAura
    local ____VampiricAura = require("app.src.World.Entity.CreepAbilities.VampiricAura")
    local VampiricAura = ____VampiricAura.VampiricAura
    local ____WalkItOff = require("app.src.World.Entity.CreepAbilities.WalkItOff")
    local WalkItOff = ____WalkItOff.WalkItOff
    local ____HardnedSkin = require("app.src.World.Entity.CreepAbilities.HardnedSkin")
    local HardnedSkin = ____HardnedSkin.HardnedSkin
    local ____Evasion = require("app.src.World.Entity.CreepAbilities.Evasion")
    local Evasion = ____Evasion.Evasion
    local ____ArmorBonus = require("app.src.World.Entity.CreepAbilities.ArmorBonus")
    local ArmorBonus = ____ArmorBonus.ArmorBonus
    local ____SpellShield = require("app.src.World.Entity.CreepAbilities.SpellShield")
    local SpellShield = ____SpellShield.SpellShield
    local ____TornadoAura = require("app.src.World.Entity.CreepAbilities.TornadoAura")
    local TornadoAura = ____TornadoAura.TornadoAura
    local ____MorningPerson = require("app.src.World.Entity.CreepAbilities.MorningPerson")
    local MorningPerson = ____MorningPerson.MorningPerson
    ____exports.CreepAbilityHandler = {}
    local CreepAbilityHandler = ____exports.CreepAbilityHandler
    CreepAbilityHandler.name = "CreepAbilityHandler"
    CreepAbilityHandler.__index = CreepAbilityHandler
    CreepAbilityHandler.prototype = {}
    CreepAbilityHandler.prototype.__index = CreepAbilityHandler.prototype
    CreepAbilityHandler.prototype.constructor = CreepAbilityHandler
    function CreepAbilityHandler.new(...)
        local self = setmetatable({}, CreepAbilityHandler.prototype)
        self:____constructor(...)
        return self
    end
    function CreepAbilityHandler.prototype.____constructor(self, abilityUnit)
        self.abilities = {}
        self.activeAbilities = {}
        self:AddAbilitiesToList()
        self:PreSetupAbilities(abilityUnit)
    end
    function CreepAbilityHandler.prototype.AddAbilitiesToList(self)
        __TS__ArrayPush(self.abilities, HardnedSkin)
        __TS__ArrayPush(self.abilities, Evasion)
        __TS__ArrayPush(self.abilities, ArmorBonus)
        __TS__ArrayPush(self.abilities, CrippleAura)
        __TS__ArrayPush(self.abilities, SpellShield)
        __TS__ArrayPush(self.abilities, TornadoAura)
        __TS__ArrayPush(self.abilities, VampiricAura)
        __TS__ArrayPush(self.abilities, DivineShield)
        __TS__ArrayPush(self.abilities, WalkItOff)
        __TS__ArrayPush(self.abilities, MorningPerson)
    end
    function CreepAbilityHandler.prototype.PreSetupAbilities(self, abilityUnit)
        for ____, ability in ipairs(self.abilities) do
            local ObjectExtendsAbility = ability.new(abilityUnit)
            __TS__ArrayPush(self.activeAbilities, ObjectExtendsAbility)
        end
    end
    function CreepAbilityHandler.prototype.SetupGame(self, game)
        self.game = game
        self:SetupAbilities()
    end
    function CreepAbilityHandler.prototype.SetupAbilities(self)
        if not self.game then
            return
        end
        for ____, ability in ipairs(self.activeAbilities) do
            ability:SetupGame(self.game)
            if ability:IsFinalDamageModificationCreepAbility() then
                self.game.gameDamageEngine:AddFinalDamageModificationCreepAbility(ability)
            end
            if ability:IsAttackActionCreepAbility() then
                self.game.gameDamageEngine:AddInitialDamageEventCreepAbility(ability)
            end
        end
    end
    function CreepAbilityHandler.prototype.GetAbilitiesForWave(self, wave)
        if not self.game then
            return self.activeAbilities
        end
        local currentDiff = self.game.diffVote.difficulty
        if currentDiff == 100 then
            return {}
        end
        currentDiff = currentDiff - 100
        local allAbilities = __TS__ArraySlice(self.activeAbilities, 0, #self.activeAbilities - 1)
        if wave:getCreepType() == CREEP_TYPE.BOSS then
            return allAbilities
        end
        self:ShuffleArray(allAbilities)
        local picks = math.floor(currentDiff / 100)
        local rest = currentDiff % 100
        if Util:RandomInt(1, 100) <= rest then
            picks = picks + 1
        end
        if picks == 0 then
            return {}
        end
        return __TS__ArraySlice(
            allAbilities,
            0,
            IMinBJ(picks - 1, #allAbilities - 1)
        )
    end
    function CreepAbilityHandler.prototype.ShuffleArray(self, arr)
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
    return ____exports
    
end
__modules["app.src.World.Entity.CreepAbilities.CreepAbilityHandler"] = {initialized = false, cached = nil, loader = __module_255}
function __module_256()
    ---
    --- Generated by EmmyLua(https://github.com/EmmyLua)
    --- Created by henning.
    --- DateTime: 17/07/2019 10:54
    ---
    
    
    do
        local data = {}
        function SetTimerData(whichTimer, dat)
            data[whichTimer] = dat
        end
    
        --GetData functionality doesn't even require an argument.
        function GetTimerData(whichTimer)
            if not whichTimer then whichTimer = GetExpiredTimer() end
            return data[whichTimer]
        end
    
        --NewTimer functionality includes optional parameter to pass data to timer.
        function NewTimer(dat)
            local t = CreateTimer()
            if dat then data[t] = dat end
            return t
        end
    
        --Release functionality doesn't even need for you to pass the expired timer.
        --as an arg. It also returns the user data passed.
        function ReleaseTimer(whichTimer)
            if not whichTimer then whichTimer = GetExpiredTimer() end
            local dat = data[whichTimer]
            data[whichTimer] = nil
            PauseTimer(whichTimer)
            DestroyTimer(whichTimer)
            return dat
        end
    end
    
end
__modules["app/src/LuaModules/TimerUtils"] = {initialized = false, cached = nil, loader = __module_256}
function __module_257()
    ---
    --- Generated by EmmyLua(https://github.com/EmmyLua)
    --- Created by henning.
    --- DateTime: 15/07/2019 09:07
    ---
    do
        local cMap = {}
        local aMap = {}
        local lastCondFunc
        local waitFunc
    
        local oldCond = Condition --If you don't want this Condition-overwrite behavior
        --for any particular resource, use Filter() instead of Condition(). This tool
        --is mainly for GUI users & the GUI->script compiled behavior uses Condition().
        function Condition(func)
            lastCondFunc = func
            return oldCond(func)
        end
    
        local oldTAC = TriggerAddCondition
        function TriggerAddCondition(trig, cond)
            if lastCondFunc then
                cMap[trig] = lastCondFunc --map the condition function to the trigger.
                lastCondFunc = nil
                cond = Filter(function()
                    local t = GetTriggeringTrigger()
                    if cMap[t]() then --Call the triggerconditions manually.
                        waitFunc = aMap[t]
                        waitFunc() --If this was caused by an event, call the trigger actions manually.
                    end
                end)
            end
            return oldTAC(trig, cond) --use the regular event if a boolexpr or Filter
            --was used instead of Condition()
        end
    
        local oldTAA = TriggerAddAction
        function TriggerAddAction(trig, act)
            aMap[trig] = act
            return oldTAA(trig, function()
                waitFunc = aMap[GetTriggeringTrigger()]
                waitFunc() --If this was caused by an event, call the trigger actions manually.
            end)
        end
    
        local oldEval = TriggerEvaluate
        function TriggerEvaluate(trig)
            local f = cMap[trig]
            if f then return f() end
            return oldEval(trig)
        end
    
        local oldExec = TriggerExecute
        function TriggerExecute(trig)
            waitFunc = aMap[trig]
            waitFunc()
        end
    
        function RunTrigger(trig)
            local conds = cMap[trig]
            if IsTriggerEnabled(trig) and not conds or conds() then
                waitFunc = aMap[trig]
                waitFunc()
            end
        end
    
        local skipNext = false
        function EnableWaits()
            if skipNext then
                skipNext = false
                return false
            end
            skipNext = true
            coroutine.resume(coroutine.create(function()
                waitFunc()
            end))
            return true
        end
    end
    
end
__modules["app/src/LuaModules/FastTriggers"] = {initialized = false, cached = nil, loader = __module_257}
function __module_258()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____NativePatcher = require("app.src.JassOverrides.NativePatcher")
    local PatchNatives = ____NativePatcher.PatchNatives
    local ____Serilog = require("app.src.lib.Serilog.Serilog")
    local Log = ____Serilog.Log
    local LogLevel = ____Serilog.LogLevel
    local ____StringSink = require("app.src.lib.Serilog.Sinks.StringSink")
    local StringSink = ____StringSink.StringSink
    local ____WarcraftMaul = require("app.src.World.WarcraftMaul")
    local WarcraftMaul = ____WarcraftMaul.WarcraftMaul
    local ____Trigger = require("app.src.JassOverrides.Trigger")
    local Trigger = ____Trigger.Trigger
    require("app.src.lib.translators")
    local ____CreepAbilityHandler = require("app.src.World.Entity.CreepAbilities.CreepAbilityHandler")
    local CreepAbilityHandler = ____CreepAbilityHandler.CreepAbilityHandler
    ____exports.InitGame = {}
    local InitGame = ____exports.InitGame
    InitGame.name = "InitGame"
    InitGame.__index = InitGame
    InitGame.prototype = {}
    InitGame.prototype.__index = InitGame.prototype
    InitGame.prototype.constructor = InitGame
    function InitGame.new(...)
        local self = setmetatable({}, InitGame.prototype)
        self:____constructor(...)
        return self
    end
    function InitGame.prototype.____constructor(self)
    end
    function InitGame.Main(creepAbilityHandler)
        local maul = WarcraftMaul.new(creepAbilityHandler)
        if maul.debugMode then
            Log.Information("Initialisation finished")
        end
    end
    function InitGame.run(self)
        require("app/src/LuaModules/TimerUtils")
        require("app/src/LuaModules/FastTriggers")
        PatchNatives(nil)
        Log.Init(
            {
                StringSink.new(LogLevel.Warning, SendMessageUnlogged)
            }
        )
        local creepAbilityHandler = self:SetupAbilities()
        xpcall(
            function()
                local init = Trigger.new()
                init:RegisterTimerEvent(0, false)
                init:AddAction(
                    function() return ____exports.InitGame.Main(creepAbilityHandler) end
                )
            end,
            function(err)
                Log.Fatal(err)
            end
        )
    end
    function InitGame.SetupAbilities(self)
        local abilityUnit = CreateUnit(
            Player(bj_PLAYER_NEUTRAL_EXTRA),
            FourCC("h00L"),
            0,
            0,
            0
        )
        local creepAbilityHandler = CreepAbilityHandler.new(abilityUnit)
        RemoveUnit(abilityUnit)
        return creepAbilityHandler
    end
    return ____exports
    
end
__modules["app.src.init_game"] = {initialized = false, cached = nil, loader = __module_258}
function __module_259()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____exports = {}
    local ____Version = require("app.src.Generated.Version")
    local BUILD_DATE = ____Version.BUILD_DATE
    local BUILD_NUMBER = ____Version.BUILD_NUMBER
    ____exports.InitConfig = {}
    local InitConfig = ____exports.InitConfig
    InitConfig.name = "InitConfig"
    InitConfig.__index = InitConfig
    InitConfig.prototype = {}
    InitConfig.prototype.__index = InitConfig.prototype
    InitConfig.prototype.constructor = InitConfig
    function InitConfig.new(...)
        local self = setmetatable({}, InitConfig.prototype)
        self:____constructor(...)
        return self
    end
    function InitConfig.prototype.____constructor(self)
    end
    function InitConfig.run(self)
        local message = "Welcome to Warcraft Maul.\n" .. "This is build: " .. tostring(BUILD_NUMBER) .. ", built " .. tostring(BUILD_DATE) .. ".\n" .. "Visit us on " .. tostring(
            Util:ColourString("#7ab1df", "https://maulbot.com/")
        ) .. " " .. tostring(
            Util:ColourString("#ccb896", "for the latest version and our discord channel.")
        )
        local chatbox = BlzGetFrameByName("ChatTextArea", 0)
        BlzFrameSetText(
            chatbox,
            Util:ColourString("#ccb896", message)
        )
        BlzFrameSetVertexColor(
            chatbox,
            BlzConvertColor(255, 0, 0, 0)
        )
    end
    return ____exports
    
end
__modules["app.src.init_config"] = {initialized = false, cached = nil, loader = __module_259}
function __module_260()
    --[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
    local ____init_game = require("app.src.init_game")
    local InitGame = ____init_game.InitGame
    local ____init_config = require("app.src.init_config")
    local InitConfig = ____init_config.InitConfig
    ceres.addHook(
        "config::after",
        function() return InitConfig:run() end
    )
    ceres.addHook(
        "main::after",
        function() return InitGame:run() end
    )
    
end
__modules["main"] = {initialized = false, cached = nil, loader = __module_260}

-- ceres post-script start

ceres.__oldMain = main
ceres.__oldConfig = config

function main()
    __ceresMain()
end

function config()
    __ceresConfig()
end

ceres.catch(require("main"))

-- ceres post-script end
