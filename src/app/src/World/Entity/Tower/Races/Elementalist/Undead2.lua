--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Undead2 = {}
local Undead2 = ____exports.Undead2
Undead2.name = "Undead2"
Undead2.__index = Undead2
Undead2.prototype = {}
Undead2.prototype.__index = __TS__Index(Undead2.prototype)
Undead2.prototype.__newindex = __TS__NewIndex(Undead2.prototype)
Undead2.prototype.constructor = Undead2
Undead2.____super = Tower
setmetatable(Undead2, Undead2.____super)
setmetatable(Undead2.prototype, Undead2.____super.prototype)
function Undead2.new(...)
    local self = setmetatable({}, Undead2.prototype)
    self:____constructor(...)
    return self
end
function Undead2.prototype.EndOfRoundAction(self)
    BlzSetUnitBaseDamage(
        self.tower,
        BlzGetUnitBaseDamage(self.tower, 0) + 15,
        0
    )
end
return ____exports
