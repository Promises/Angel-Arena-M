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
