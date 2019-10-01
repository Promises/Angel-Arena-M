--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.NightElfWisp = {}
local NightElfWisp = ____exports.NightElfWisp
NightElfWisp.name = "NightElfWisp"
NightElfWisp.__index = NightElfWisp
NightElfWisp.prototype = {}
NightElfWisp.prototype.__index = __TS__Index(NightElfWisp.prototype)
NightElfWisp.prototype.__newindex = __TS__NewIndex(NightElfWisp.prototype)
NightElfWisp.prototype.constructor = NightElfWisp
NightElfWisp.____super = Tower
setmetatable(NightElfWisp, NightElfWisp.____super)
setmetatable(NightElfWisp.prototype, NightElfWisp.____super.prototype)
function NightElfWisp.new(...)
    local self = setmetatable({}, NightElfWisp.prototype)
    self:____constructor(...)
    return self
end
function NightElfWisp.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if self.game.gameDamageEngineGlobals.udg_DamageEventAOE ~= 1 then
        return
    end
    if u == self.tower then
        if not (GetUnitAbilityLevel(
            self.tower,
            FourCC("A09V")
        ) > 0) then
            return
        end
        BlzSetUnitBaseDamage(
            self.tower,
            BlzGetUnitBaseDamage(self.tower, 0) + 40,
            0
        )
    end
end
function NightElfWisp.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(self.tower, "stomp")
end
function NightElfWisp.prototype.EndOfRoundAction(self)
    BlzSetUnitBaseDamage(self.tower, 39, 0)
end
return ____exports
