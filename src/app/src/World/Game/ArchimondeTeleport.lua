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
