--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Bubbles = {}
local Bubbles = ____exports.Bubbles
Bubbles.name = "Bubbles"
Bubbles.__index = Bubbles
Bubbles.prototype = {}
Bubbles.prototype.__index = __TS__Index(Bubbles.prototype)
Bubbles.prototype.__newindex = __TS__NewIndex(Bubbles.prototype)
Bubbles.prototype.constructor = Bubbles
Bubbles.____super = Tower
setmetatable(Bubbles, Bubbles.____super)
setmetatable(Bubbles.prototype, Bubbles.____super.prototype)
function Bubbles.new(...)
    local self = setmetatable({}, Bubbles.prototype)
    self:____constructor(...)
    return self
end
function Bubbles.prototype.EndOfRoundAction(self)
    if BlzGetUnitBaseDamage(self.tower, 0) <= 4 then
        self:Upgrade(
            FourCC("n027")
        )
    else
        BlzSetUnitBaseDamage(
            self.tower,
            BlzGetUnitBaseDamage(self.tower, 0) - 5,
            0
        )
    end
end
return ____exports
