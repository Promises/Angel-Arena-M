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
