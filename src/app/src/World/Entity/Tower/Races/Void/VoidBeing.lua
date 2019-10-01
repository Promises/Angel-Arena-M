--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.VoidBeing = {}
local VoidBeing = ____exports.VoidBeing
VoidBeing.name = "VoidBeing"
VoidBeing.__index = VoidBeing
VoidBeing.prototype = {}
VoidBeing.prototype.__index = __TS__Index(VoidBeing.prototype)
VoidBeing.prototype.__newindex = __TS__NewIndex(VoidBeing.prototype)
VoidBeing.prototype.constructor = VoidBeing
VoidBeing.____super = Tower
setmetatable(VoidBeing, VoidBeing.____super)
setmetatable(VoidBeing.prototype, VoidBeing.____super.prototype)
function VoidBeing.new(...)
    local self = setmetatable({}, VoidBeing.prototype)
    self:____constructor(...)
    return self
end
function VoidBeing.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if u == self.tower then
        SetUnitLifeBJ(
            self.tower,
            GetUnitStateSwap(UNIT_STATE_LIFE, self.tower) + 2
        )
    end
end
return ____exports
