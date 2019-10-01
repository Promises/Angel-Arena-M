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
