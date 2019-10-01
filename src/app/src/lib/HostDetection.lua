--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
____exports.HostDetection = {}
local HostDetection = ____exports.HostDetection
HostDetection.name = "HostDetection"
HostDetection.__index = HostDetection
HostDetection.prototype = {}
HostDetection.prototype.__index = HostDetection.prototype
HostDetection.prototype.constructor = HostDetection
function HostDetection.new(...)
    local self = setmetatable({}, HostDetection.prototype)
    self:____constructor(...)
    return self
end
function HostDetection.prototype.____constructor(self)
    self.HostDetectMap = Map.new()
    self.LocalHostFlag = not self.HostDetectMap:has(0) and BlzGetFrameByName("NameMenu", 1) and Location(0, 0) and self.HostDetectMap:get(0) == "1"
    self.SyncTrig = Trigger.new()
    self.HostPlayer = nil
    do
        local i = 0
        while i < bj_MAX_PLAYERS do
            self.SyncTrig:RegisterPlayerSyncEvent(
                Player(i),
                "hostdetect",
                false
            )
            i = i + 1
        end
    end
    self.SyncTrig:AddAction(
        function() return self:OnHostSync() end
    )
    if self:IsLocalPlayerHost() then
        BlzSendSyncData("hostdetect", "1")
    end
end
function HostDetection.prototype.IsLocalPlayerHost(self)
    return self.LocalHostFlag
end
function HostDetection.prototype.OnHostSync(self)
    self.HostPlayer = GetTriggerPlayer()
    DisableTrigger(
        GetTriggeringTrigger()
    )
end
function HostDetection.prototype.GetHost(self)
    return self.HostPlayer
end
function HostDetection.prototype.IsHostDetected(self)
    return self.HostPlayer ~= nil
end
return ____exports
