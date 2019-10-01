--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.KilJaeden = {}
local KilJaeden = ____exports.KilJaeden
KilJaeden.name = "KilJaeden"
KilJaeden.__index = KilJaeden
KilJaeden.prototype = {}
KilJaeden.prototype.__index = __TS__Index(KilJaeden.prototype)
KilJaeden.prototype.__newindex = __TS__NewIndex(KilJaeden.prototype)
KilJaeden.prototype.constructor = KilJaeden
KilJaeden.____super = Tower
setmetatable(KilJaeden, KilJaeden.____super)
setmetatable(KilJaeden.prototype, KilJaeden.____super.prototype)
function KilJaeden.new(...)
    local self = setmetatable({}, KilJaeden.prototype)
    self:____constructor(...)
    return self
end
function KilJaeden.prototype.GenericAttack(self)
    self:CastSpellOnAttackedUnitLocation("rainofchaos")
end
return ____exports
