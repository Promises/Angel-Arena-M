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
