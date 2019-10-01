--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.UndeadAcolyte = {}
local UndeadAcolyte = ____exports.UndeadAcolyte
UndeadAcolyte.name = "UndeadAcolyte"
UndeadAcolyte.__index = UndeadAcolyte
UndeadAcolyte.prototype = {}
UndeadAcolyte.prototype.__index = __TS__Index(UndeadAcolyte.prototype)
UndeadAcolyte.prototype.__newindex = __TS__NewIndex(UndeadAcolyte.prototype)
UndeadAcolyte.prototype.constructor = UndeadAcolyte
UndeadAcolyte.____super = Tower
setmetatable(UndeadAcolyte, UndeadAcolyte.____super)
setmetatable(UndeadAcolyte.prototype, UndeadAcolyte.____super.prototype)
function UndeadAcolyte.new(...)
    local self = setmetatable({}, UndeadAcolyte.prototype)
    self:____constructor(...)
    return self
end
function UndeadAcolyte.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if self.game.gameDamageEngineGlobals.udg_DamageEventAOE ~= 1 then
        return
    end
    if u == self.tower then
        if not (GetUnitAbilityLevel(
            self.tower,
            FourCC("A09S")
        ) > 0) then
            return
        end
        BlzSetUnitBaseDamage(
            self.tower,
            BlzGetUnitBaseDamage(self.tower, 0) + 5,
            0
        )
    end
end
function UndeadAcolyte.prototype.EndOfRoundAction(self)
    BlzSetUnitBaseDamage(self.tower, 4, 0)
end
return ____exports
