--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
local CreepAbility = ____CreepAbility.CreepAbility
____exports.ArmorBonus = {}
local ArmorBonus = ____exports.ArmorBonus
ArmorBonus.name = "ArmorBonus"
ArmorBonus.__index = ArmorBonus
ArmorBonus.prototype = {}
ArmorBonus.prototype.__index = __TS__Index(ArmorBonus.prototype)
ArmorBonus.prototype.__newindex = __TS__NewIndex(ArmorBonus.prototype)
ArmorBonus.prototype.constructor = ArmorBonus
ArmorBonus.____super = CreepAbility
setmetatable(ArmorBonus, ArmorBonus.____super)
setmetatable(ArmorBonus.prototype, ArmorBonus.____super.prototype)
function ArmorBonus.new(...)
    local self = setmetatable({}, ArmorBonus.prototype)
    self:____constructor(...)
    return self
end
function ArmorBonus.prototype.____constructor(self, abilityUnit)
    CreepAbility.prototype.____constructor(self, "A06C", abilityUnit)
end
return ____exports
