--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Prawn = {}
local Prawn = ____exports.Prawn
Prawn.name = "Prawn"
Prawn.__index = Prawn
Prawn.prototype = {}
Prawn.prototype.__index = __TS__Index(Prawn.prototype)
Prawn.prototype.__newindex = __TS__NewIndex(Prawn.prototype)
Prawn.prototype.constructor = Prawn
Prawn.____super = Tower
setmetatable(Prawn, Prawn.____super)
setmetatable(Prawn.prototype, Prawn.____super.prototype)
function Prawn.new(...)
    local self = setmetatable({}, Prawn.prototype)
    self:____constructor(...)
    return self
end
function Prawn.prototype.GenericAttack(self)
    self:CastSpellOnAttackedUnitLocation("carrionswarm")
end
return ____exports
