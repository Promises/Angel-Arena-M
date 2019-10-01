--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Sapphiron = {}
local Sapphiron = ____exports.Sapphiron
Sapphiron.name = "Sapphiron"
Sapphiron.__index = Sapphiron
Sapphiron.prototype = {}
Sapphiron.prototype.__index = __TS__Index(Sapphiron.prototype)
Sapphiron.prototype.__newindex = __TS__NewIndex(Sapphiron.prototype)
Sapphiron.prototype.constructor = Sapphiron
Sapphiron.____super = Tower
setmetatable(Sapphiron, Sapphiron.____super)
setmetatable(Sapphiron.prototype, Sapphiron.____super.prototype)
function Sapphiron.new(...)
    local self = setmetatable({}, Sapphiron.prototype)
    self:____constructor(...)
    return self
end
function Sapphiron.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if u == self.tower then
        if GetUnitStateSwap(UNIT_STATE_MANA, self.tower) >= 100 then
            SetUnitManaBJ(
                self.tower,
                GetUnitStateSwap(UNIT_STATE_MANA, self.tower) - 100
            )
            if GetUnitAbilityLevelSwapped(
                FourCC("A0F9"),
                self.tower
            ) <= 6 then
                IncUnitAbilityLevelSwapped(
                    FourCC("A0F9"),
                    self.tower
                )
            end
        end
        SetUnitManaBJ(
            self.tower,
            GetUnitStateSwap(UNIT_STATE_MANA, u) + 1
        )
    end
end
function Sapphiron.prototype.EndOfRoundAction(self)
    SetUnitAbilityLevelSwapped(
        FourCC("A0F9"),
        self.tower,
        1
    )
end
return ____exports
