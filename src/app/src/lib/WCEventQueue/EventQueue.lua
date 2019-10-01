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
