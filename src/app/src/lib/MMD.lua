--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.MMDGoal = {}
____exports.MMDGoal.None = 0
____exports.MMDGoal[____exports.MMDGoal.None] = "None"
____exports.MMDGoal.High = 1
____exports.MMDGoal[____exports.MMDGoal.High] = "High"
____exports.MMDGoal.Low = 2
____exports.MMDGoal[____exports.MMDGoal.Low] = "Low"
____exports.MMDType = {}
____exports.MMDType.String = 0
____exports.MMDType[____exports.MMDType.String] = "String"
____exports.MMDType.Number = 1
____exports.MMDType[____exports.MMDType.Number] = "Number"
____exports.MMDType.Boolean = 2
____exports.MMDType[____exports.MMDType.Boolean] = "Boolean"
____exports.MMDOperator = {}
____exports.MMDOperator.Add = 0
____exports.MMDOperator[____exports.MMDOperator.Add] = "Add"
____exports.MMDOperator.Subtract = 1
____exports.MMDOperator[____exports.MMDOperator.Subtract] = "Subtract"
____exports.MMDOperator.Set = 2
____exports.MMDOperator[____exports.MMDOperator.Set] = "Set"
____exports.MMDSuggest = {}
____exports.MMDSuggest.None = 0
____exports.MMDSuggest[____exports.MMDSuggest.None] = "None"
____exports.MMDSuggest.Track = 1
____exports.MMDSuggest[____exports.MMDSuggest.Track] = "Track"
____exports.MMDSuggest.Leaderboard = 2
____exports.MMDSuggest[____exports.MMDSuggest.Leaderboard] = "Leaderboard"
____exports.MMDFlag = {}
____exports.MMDFlag.Drawer = 0
____exports.MMDFlag[____exports.MMDFlag.Drawer] = "Drawer"
____exports.MMDFlag.Loser = 1
____exports.MMDFlag[____exports.MMDFlag.Loser] = "Loser"
____exports.MMDFlag.Winner = 2
____exports.MMDFlag[____exports.MMDFlag.Winner] = "Winner"
____exports.MMDFlag.Leaver = 3
____exports.MMDFlag[____exports.MMDFlag.Leaver] = "Leaver"
____exports.MMDFlag.Practising = 4
____exports.MMDFlag[____exports.MMDFlag.Practising] = "Practising"
local Senders = {}
Senders.None = 0
Senders[Senders.None] = "None"
Senders.Naive = 1
Senders[Senders.Naive] = "Naive"
Senders.Better = 2
Senders[Senders.Better] = "Better"
Senders.Safe = 3
Senders[Senders.Safe] = "Safe"
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
    self.highPriority = ____exports.Queue.new()
    self.medPriority = ____exports.Queue.new()
    self.lowPriority = ____exports.Queue.new()
    self.currentTask = nil
    self.ticker = CreateTrigger()
    TriggerRegisterTimerEventPeriodic(self.ticker, 0.1)
    TriggerAddAction(
        self.ticker,
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
local MMDNode = {}
MMDNode.name = "MMDNode"
MMDNode.__index = MMDNode
MMDNode.prototype = {}
MMDNode.prototype.____getters = {}
MMDNode.prototype.__index = __TS__Index(MMDNode.prototype)
MMDNode.prototype.constructor = MMDNode
function MMDNode.new(...)
    local self = setmetatable({}, MMDNode.prototype)
    self:____constructor(...)
    return self
end
function MMDNode.prototype.____constructor(self, key, message, mmd)
    self.mmd = mmd
    self._message = message
    self._key = tostring(key)
    self._timeout = mmd:GetTime() + 7 + GetRandomReal(
        0,
        2 + 0.1 * GetPlayerId(
            GetTriggerPlayer()
        )
    )
    self._checksum = mmd:PoorHash(self._message, key)
end
function MMDNode.prototype.____getters.timeout(self)
    return self._timeout
end
function MMDNode.prototype.____getters.key(self)
    return self._key
end
function MMDNode.prototype.____getters.message(self)
    return self._message
end
function MMDNode.prototype.____getters.checksum(self)
    return self._checksum
end
function MMDNode.prototype.send(self)
    StoreInteger(
        self.mmd.gameCache,
        tostring(self.mmd.M_KEY_VAL) .. tostring(self._key),
        self._message,
        self._checksum
    )
    StoreInteger(
        self.mmd.gameCache,
        tostring(self.mmd.M_KEY_CHK) .. tostring(self._key),
        self._key,
        self._checksum
    )
    SyncStoredInteger(
        self.mmd.gameCache,
        tostring(self.mmd.M_KEY_VAL) .. tostring(self._key),
        self._message
    )
    SyncStoredInteger(
        self.mmd.gameCache,
        tostring(self.mmd.M_KEY_CHK) .. tostring(self._key),
        self._key
    )
    return true
end
____exports.MMD = {}
local MMD = ____exports.MMD
MMD.name = "MMD"
MMD.__index = MMD
MMD.prototype = {}
MMD.prototype.____getters = {}
MMD.prototype.__index = __TS__Index(MMD.prototype)
MMD.prototype.constructor = MMD
function MMD.new(...)
    local self = setmetatable({}, MMD.prototype)
    self:____constructor(...)
    return self
end
function MMD.prototype.____constructor(self)
    self.FILENAME = "MMD.Dat"
    self.clock = CreateTimer()
    self.CURRENT_VERSION = 2
    self.MINIMUM_PARSER_VERSION = 2
    self.ESCAPED_CHARS = " \\"
    self.SHOW_DEBUG_MESSAGES = true
    self.queue = {}
    self.senders = Senders.Naive
    self.M_KEY_VAL = "val:"
    self.M_KEY_CHK = "chk:"
    self.initialised = false
    self.messageCount = 0
    local t = CreateTrigger()
    TriggerRegisterTimerEvent(t, 0, false)
    TriggerAddAction(
        t,
        function() return self:init() end
    )
    self.eventQueue = ____exports.EventQueue.new()
    FlushGameCache(
        InitGameCache(self.FILENAME)
    )
    self._gameCache = InitGameCache(self.FILENAME)
    TimerStart(self.clock, 999999999, false, nil)
end
function MMD.prototype.____getters.gameCache(self)
    return self._gameCache
end
function MMD.prototype.init(self)
    self.initialised = true
    self:emit(
        "init version " .. tostring(self.MINIMUM_PARSER_VERSION) .. " " .. tostring(self.CURRENT_VERSION)
    )
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            if GetPlayerSlotState(
                Player(i)
            ) == PLAYER_SLOT_STATE_PLAYING then
                if GetPlayerController(
                    Player(i)
                ) == MAP_CONTROL_USER then
                    self:emit(
                        "init pid " .. tostring(i) .. " " .. tostring(
                            self:pack(
                                GetPlayerName(
                                    Player(i)
                                )
                            )
                        )
                    )
                end
            end
            i = i + 1
        end
    end
    local t = CreateTrigger()
    TriggerAddAction(
        t,
        function() return self:tick() end
    )
    TriggerRegisterTimerEvent(t, 0.37, true)
end
function MMD.prototype.tick(self)
    for ____, node in ipairs(self.queue) do
        if node.timeout >= self:GetTime() then
            break
        end
        if not HaveStoredInteger(
            self.gameCache,
            tostring(self.M_KEY_VAL) .. tostring(node.key),
            node.message
        ) then
            self:RaiseGuard("message skipping")
            node:send()
        elseif not HaveStoredInteger(
            self.gameCache,
            tostring(self.M_KEY_CHK) .. tostring(node.key),
            node.key
        ) then
            self:RaiseGuard("checksum skipping")
            node:send()
        elseif GetStoredInteger(
            self.gameCache,
            tostring(self.M_KEY_VAL) .. tostring(node.key),
            node.message
        ) ~= node.checksum then
            self:RaiseGuard("message tampering")
            node:send()
        elseif GetStoredInteger(
            self.gameCache,
            tostring(self.M_KEY_CHK) .. tostring(node.key),
            node.key
        ) ~= node.checksum then
            self:RaiseGuard("checksum tampering")
            node:send()
        end
    end
    do
        local i = 0
        while i < 10 do
            if not HaveStoredInteger(
                self.gameCache,
                tostring(self.M_KEY_CHK) .. tostring(self.messageCount),
                tostring(self.messageCount)
            ) then
                break
            end
            self:RaiseGuard("message insertion")
            self:emit("Blank")
            i = i + 1
        end
    end
end
function MMD.prototype.pack(self, value)
    local result = ""
    do
        local i = 0
        while i < #value do
            local currentLetter = string.sub(value, i + 1, i + 1)
            do
                local j = 0
                while j < #self.ESCAPED_CHARS do
                    if currentLetter == string.sub(self.ESCAPED_CHARS, j + 1, j + 1) then
                        currentLetter = "\\" .. tostring(currentLetter)
                        break
                    end
                    j = j + 1
                end
            end
            result = tostring(result) .. tostring(currentLetter)
            i = i + 1
        end
    end
    return result
end
function MMD.prototype.emit(self, message)
    if not self.initialised then
        if self.SHOW_DEBUG_MESSAGES then
            print("MMD Emit Error: Library not initialized yet.")
        end
        return
    end
    local queueItem = MMDNode.new(self.messageCount, message, self)
    __TS__ArrayPush(self.queue, queueItem)
    self.messageCount = self.messageCount + 1
    if self:isEmitter() then
        self.eventQueue:AddMed(
            function() return queueItem:send() end
        )
    end
end
function MMD.prototype.isEmitter(self)
    local picks = {}
    local pickFlags = {}
    local n = 0
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            if GetPlayerSlotState(
                Player(i)
            ) == PLAYER_SLOT_STATE_PLAYING then
                if GetPlayerController(
                    Player(i)
                ) == MAP_CONTROL_USER then
                    if n < self.senders then
                        picks[n + 1] = i
                        pickFlags[i + 1] = true
                    else
                        local r = GetRandomInt(0, n)
                        if r < self.senders then
                            pickFlags[picks[r + 1] + 1] = false
                            picks[r + 1] = i
                            pickFlags[i + 1] = true
                        end
                    end
                    n = n + 1
                end
            end
            i = i + 1
        end
    end
    return pickFlags[GetPlayerId(
        GetTriggerPlayer()
    ) + 1]
end
function MMD.prototype.GetTime(self)
    return TimerGetElapsed(self.clock)
end
function MMD.prototype.PoorHash(self, str, seed)
    local n = #str
    local m = n + seed
    do
        local i = 0
        while i < n do
            m = m * 41 + string.byte(str, i + 1)
            i = i + 1
        end
    end
    return m
end
function MMD.prototype.RaiseGuard(self, reason)
    if self.SHOW_DEBUG_MESSAGES then
        print(
            "MMD: Guard Raised! (" .. tostring(reason) .. ")"
        )
    end
    self.senders = Senders.Safe
end
function MMD.prototype.DefineValue(self, name, ____type, goal, suggestion)
    if #name > 32 then
        if self.SHOW_DEBUG_MESSAGES then
            print("MMD Def Error: Variable name is too long.")
        end
    elseif #name == 0 then
        if self.SHOW_DEBUG_MESSAGES then
            print("MMD Def Error: Variable name is empty.")
        end
    elseif ____type == ____exports.MMDType.String and goal ~= ____exports.MMDGoal.None then
        if self.SHOW_DEBUG_MESSAGES then
            print("MMD Def Error: Strings must have goal type of none.")
        end
    elseif GetStoredInteger(self.gameCache, "types", name) ~= 0 then
        if self.SHOW_DEBUG_MESSAGES then
            print("MMD Def Error: Variable name is empty.")
        end
    else
        StoreInteger(self.gameCache, "types", name, ____type)
        self:emit(
            "DefVarP " .. tostring(
                self:pack(name)
            ) .. " " .. tostring(____type) .. " " .. tostring(goal) .. " " .. tostring(suggestion)
        )
    end
end
function MMD.prototype.update_value(self, name, p, op, value, ____type)
    local id = GetPlayerId(p)
    if not p or id < 0 or id >= bj_MAX_PLAYER_SLOTS then
        if self.SHOW_DEBUG_MESSAGES then
            print("MMD Set Error: Invalid player. Must be P1 to P24.")
        end
    elseif ____type ~= GetStoredInteger(self.gameCache, "types", name) then
        if self.SHOW_DEBUG_MESSAGES then
            print("MMD Set Error: Updated value of undefined variable or used value of incorrect type.")
        end
    elseif #name > 50 then
        if self.SHOW_DEBUG_MESSAGES then
            print("MMD Set Error: Variable name is too long.")
        end
    elseif #name == 0 then
        if self.SHOW_DEBUG_MESSAGES then
            print("MMD Set Error: Variable name is empty.")
        end
    else
        self:emit(
            "VarP " .. tostring(id) .. " " .. tostring(
                self:pack(name)
            ) .. " " .. tostring(op) .. " " .. tostring(value)
        )
    end
end
function MMD.prototype.UpdateValueNumber(self, name, p, op, value)
    self:update_value(
        name,
        p,
        op,
        tostring(value),
        ____exports.MMDType.Number
    )
end
function MMD.prototype.FlagPlayer(self, p, flag)
    local id = GetPlayerId(p)
    if not p then
        if self.SHOW_DEBUG_MESSAGES then
            print("MMD Flag Error: Invalid player. Must be P1 to P24.")
        end
    elseif GetPlayerController(p) == MAP_CONTROL_USER then
        self:emit(
            "FlagP " .. tostring(id) .. " " .. tostring(flag)
        )
    end
end
function MMD.prototype.UpdateValueString(self, name, p, value)
    self:update_value(
        name,
        p,
        ____exports.MMDOperator.Set,
        "\"" .. tostring(value) .. "\"",
        ____exports.MMDType.String
    )
end
function MMD.prototype.DefineEvent(self, name, ...)
    local args = ({...})
    if GetStoredInteger(self.gameCache, "events", name) ~= 0 then
        if self.SHOW_DEBUG_MESSAGES then
            print("MMD DefEvent Error: Event redefined.")
        end
    else
        StoreInteger(self.gameCache, "events", name, #args)
        self:emit(
            "DefEvent " .. tostring(
                self:pack(name)
            ) .. " " .. tostring(#args - 1) .. " " .. tostring(
                self:JoinListOfStrings(args)
            )
        )
    end
end
function MMD.prototype.DefineSetting(self, name, ____type, value)
    if GetStoredInteger(self.gameCache, "setting", name) ~= 0 then
        if self.SHOW_DEBUG_MESSAGES then
            print("MMD DefEvent Error: Setting redefined.")
        end
    else
        StoreInteger(self.gameCache, "setting", name, 1)
        self:emit(
            "setting " .. tostring(
                self:pack(name)
            ) .. " " .. tostring(____type) .. " " .. tostring(value)
        )
    end
end
function MMD.prototype.DefineSettingString(self, name, value)
    self:DefineSetting(name, ____exports.MMDType.String, value)
end
function MMD.prototype.DefineSettingNumber(self, name, value)
    self:DefineSetting(
        name,
        ____exports.MMDType.Number,
        tostring(value)
    )
end
function MMD.prototype.DefineSettingBoolean(self, name, value)
    self:DefineSetting(name, ____exports.MMDType.Boolean, value and "1" or "0")
end
function MMD.prototype.LogEvent(self, name, ...)
    local args = ({...})
    local storedValue = GetStoredInteger(self.gameCache, "events", name)
    if storedValue ~= #args then
        if self.SHOW_DEBUG_MESSAGES then
            if storedValue ~= 0 then
                print(
                    "MMD LogEvent Error: Event defined with different # of args. [" .. tostring(storedValue) .. "]"
                )
            else
                print("MMD LogEvent Error: Event not defined.")
            end
        end
    else
        self:emit(
            "Event " .. tostring(
                self:pack(name)
            ) .. " " .. tostring(
                self:JoinListOfStrings(args)
            )
        )
    end
end
function MMD.prototype.LogCustom(self, uniqueID, data)
    self:emit(
        "custom " .. tostring(
            self:pack(uniqueID)
        ) .. " " .. tostring(
            self:pack(data)
        )
    )
end
function MMD.prototype.JoinListOfStrings(self, listOfStrings)
    local result = ""
    local first = true
    for ____, str in ipairs(listOfStrings) do
        if not first then
            result = tostring(result) .. " "
        end
        result = tostring(result) .. tostring(
            self:pack(str)
        )
        first = false
    end
    return result
end
return ____exports
