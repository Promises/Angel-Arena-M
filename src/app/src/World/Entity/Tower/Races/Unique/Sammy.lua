--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Sammy = {}
local Sammy = ____exports.Sammy
Sammy.name = "Sammy"
Sammy.__index = Sammy
Sammy.prototype = {}
Sammy.prototype.__index = __TS__Index(Sammy.prototype)
Sammy.prototype.__newindex = __TS__NewIndex(Sammy.prototype)
Sammy.prototype.constructor = Sammy
Sammy.____super = Tower
setmetatable(Sammy, Sammy.____super)
setmetatable(Sammy.prototype, Sammy.____super.prototype)
function Sammy.new(...)
    local self = setmetatable({}, Sammy.prototype)
    self:____constructor(...)
    return self
end
function Sammy.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if u == self.tower then
        SetUnitManaBJ(
            self.tower,
            (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) + 1)
        )
        if GetUnitStateSwap(UNIT_STATE_MANA, self.tower) >= 1000 then
            self:Upgrade(
                FourCC("u040")
            )
        end
    end
end
return ____exports
