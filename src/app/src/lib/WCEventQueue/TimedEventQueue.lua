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
