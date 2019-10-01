--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.FirePandaren = {}
local FirePandaren = ____exports.FirePandaren
FirePandaren.name = "FirePandaren"
FirePandaren.__index = FirePandaren
FirePandaren.prototype = {}
FirePandaren.prototype.__index = __TS__Index(FirePandaren.prototype)
FirePandaren.prototype.__newindex = __TS__NewIndex(FirePandaren.prototype)
FirePandaren.prototype.constructor = FirePandaren
FirePandaren.____super = Tower
setmetatable(FirePandaren, FirePandaren.____super)
setmetatable(FirePandaren.prototype, FirePandaren.____super.prototype)
function FirePandaren.new(...)
    local self = setmetatable({}, FirePandaren.prototype)
    self:____constructor(...)
    return self
end
function FirePandaren.prototype.GenericAttack(self)
    self:CastSpellOnAttackedUnitLocation("breathoffire")
end
return ____exports
