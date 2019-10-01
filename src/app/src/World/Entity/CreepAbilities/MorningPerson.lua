--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
local CreepAbility = ____CreepAbility.CreepAbility
____exports.MorningPerson = {}
local MorningPerson = ____exports.MorningPerson
MorningPerson.name = "MorningPerson"
MorningPerson.__index = MorningPerson
MorningPerson.prototype = {}
MorningPerson.prototype.__index = __TS__Index(MorningPerson.prototype)
MorningPerson.prototype.__newindex = __TS__NewIndex(MorningPerson.prototype)
MorningPerson.prototype.constructor = MorningPerson
MorningPerson.____super = CreepAbility
setmetatable(MorningPerson, MorningPerson.____super)
setmetatable(MorningPerson.prototype, MorningPerson.____super.prototype)
function MorningPerson.new(...)
    local self = setmetatable({}, MorningPerson.prototype)
    self:____constructor(...)
    return self
end
function MorningPerson.prototype.____constructor(self, abilityUnit)
    CreepAbility.prototype.____constructor(self, "A06D", abilityUnit)
end
return ____exports
