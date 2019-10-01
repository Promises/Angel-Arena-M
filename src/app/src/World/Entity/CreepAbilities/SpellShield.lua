--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
local CreepAbility = ____CreepAbility.CreepAbility
____exports.SpellShield = {}
local SpellShield = ____exports.SpellShield
SpellShield.name = "SpellShield"
SpellShield.__index = SpellShield
SpellShield.prototype = {}
SpellShield.prototype.__index = __TS__Index(SpellShield.prototype)
SpellShield.prototype.__newindex = __TS__NewIndex(SpellShield.prototype)
SpellShield.prototype.constructor = SpellShield
SpellShield.____super = CreepAbility
setmetatable(SpellShield, SpellShield.____super)
setmetatable(SpellShield.prototype, SpellShield.____super.prototype)
function SpellShield.new(...)
    local self = setmetatable({}, SpellShield.prototype)
    self:____constructor(...)
    return self
end
function SpellShield.prototype.____constructor(self, abilityUnit)
    CreepAbility.prototype.____constructor(self, "A00D", abilityUnit)
end
return ____exports
