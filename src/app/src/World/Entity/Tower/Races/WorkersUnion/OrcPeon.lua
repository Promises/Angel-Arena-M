--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.OrcPeon = {}
local OrcPeon = ____exports.OrcPeon
OrcPeon.name = "OrcPeon"
OrcPeon.__index = OrcPeon
OrcPeon.prototype = {}
OrcPeon.prototype.__index = __TS__Index(OrcPeon.prototype)
OrcPeon.prototype.__newindex = __TS__NewIndex(OrcPeon.prototype)
OrcPeon.prototype.constructor = OrcPeon
OrcPeon.____super = Tower
setmetatable(OrcPeon, OrcPeon.____super)
setmetatable(OrcPeon.prototype, OrcPeon.____super.prototype)
function OrcPeon.new(...)
    local self = setmetatable({}, OrcPeon.prototype)
    self:____constructor(...)
    return self
end
function OrcPeon.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if u == self.tower then
        if not (GetUnitAbilityLevel(
            self.tower,
            FourCC("A09Q")
        ) > 0) then
            return
        end
        BlzSetUnitBaseDamage(
            self.tower,
            BlzGetUnitBaseDamage(self.tower, 0) + 1,
            0
        )
    end
end
function OrcPeon.prototype.EndOfRoundAction(self)
    BlzSetUnitBaseDamage(self.tower, 0, 0)
end
return ____exports
