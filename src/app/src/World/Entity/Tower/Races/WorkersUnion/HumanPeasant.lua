--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.HumanPeasant = {}
local HumanPeasant = ____exports.HumanPeasant
HumanPeasant.name = "HumanPeasant"
HumanPeasant.__index = HumanPeasant
HumanPeasant.prototype = {}
HumanPeasant.prototype.__index = __TS__Index(HumanPeasant.prototype)
HumanPeasant.prototype.__newindex = __TS__NewIndex(HumanPeasant.prototype)
HumanPeasant.prototype.constructor = HumanPeasant
HumanPeasant.____super = Tower
setmetatable(HumanPeasant, HumanPeasant.____super)
setmetatable(HumanPeasant.prototype, HumanPeasant.____super.prototype)
function HumanPeasant.new(...)
    local self = setmetatable({}, HumanPeasant.prototype)
    self:____constructor(...)
    return self
end
function HumanPeasant.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if u == self.tower then
        if not (GetUnitAbilityLevel(
            self.tower,
            FourCC("A09T")
        ) > 0) then
            return
        end
        BlzSetUnitBaseDamage(
            self.tower,
            BlzGetUnitBaseDamage(self.tower, 0) + 2,
            0
        )
    end
end
function HumanPeasant.prototype.EndOfRoundAction(self)
    BlzSetUnitBaseDamage(self.tower, 9, 0)
end
return ____exports
