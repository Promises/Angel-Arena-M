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
