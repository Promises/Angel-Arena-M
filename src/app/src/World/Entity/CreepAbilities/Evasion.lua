--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
local CreepAbility = ____CreepAbility.CreepAbility
____exports.Evasion = {}
local Evasion = ____exports.Evasion
Evasion.name = "Evasion"
Evasion.__index = Evasion
Evasion.prototype = {}
Evasion.prototype.__index = __TS__Index(Evasion.prototype)
Evasion.prototype.__newindex = __TS__NewIndex(Evasion.prototype)
Evasion.prototype.constructor = Evasion
Evasion.____super = CreepAbility
setmetatable(Evasion, Evasion.____super)
setmetatable(Evasion.prototype, Evasion.____super.prototype)
function Evasion.new(...)
    local self = setmetatable({}, Evasion.prototype)
    self:____constructor(...)
    return self
end
function Evasion.prototype.____constructor(self, abilityUnit)
    CreepAbility.prototype.____constructor(self, "A06A", abilityUnit)
end
return ____exports
