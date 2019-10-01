--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
local CreepAbility = ____CreepAbility.CreepAbility
____exports.HardnedSkin = {}
local HardnedSkin = ____exports.HardnedSkin
HardnedSkin.name = "HardnedSkin"
HardnedSkin.__index = HardnedSkin
HardnedSkin.prototype = {}
HardnedSkin.prototype.__index = __TS__Index(HardnedSkin.prototype)
HardnedSkin.prototype.__newindex = __TS__NewIndex(HardnedSkin.prototype)
HardnedSkin.prototype.constructor = HardnedSkin
HardnedSkin.____super = CreepAbility
setmetatable(HardnedSkin, HardnedSkin.____super)
setmetatable(HardnedSkin.prototype, HardnedSkin.____super.prototype)
function HardnedSkin.new(...)
    local self = setmetatable({}, HardnedSkin.prototype)
    self:____constructor(...)
    return self
end
function HardnedSkin.prototype.____constructor(self, abilityUnit)
    CreepAbility.prototype.____constructor(self, "A069", abilityUnit)
end
return ____exports
