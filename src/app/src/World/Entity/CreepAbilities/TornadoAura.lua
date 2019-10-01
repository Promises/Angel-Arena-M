--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____CreepAbility = require("app.src.World.Entity.CreepAbilities.specs.CreepAbility")
local CreepAbility = ____CreepAbility.CreepAbility
____exports.TornadoAura = {}
local TornadoAura = ____exports.TornadoAura
TornadoAura.name = "TornadoAura"
TornadoAura.__index = TornadoAura
TornadoAura.prototype = {}
TornadoAura.prototype.__index = __TS__Index(TornadoAura.prototype)
TornadoAura.prototype.__newindex = __TS__NewIndex(TornadoAura.prototype)
TornadoAura.prototype.constructor = TornadoAura
TornadoAura.____super = CreepAbility
setmetatable(TornadoAura, TornadoAura.____super)
setmetatable(TornadoAura.prototype, TornadoAura.____super.prototype)
function TornadoAura.new(...)
    local self = setmetatable({}, TornadoAura.prototype)
    self:____constructor(...)
    return self
end
function TornadoAura.prototype.____constructor(self, abilityUnit)
    CreepAbility.prototype.____constructor(self, "A01S", abilityUnit)
end
return ____exports
