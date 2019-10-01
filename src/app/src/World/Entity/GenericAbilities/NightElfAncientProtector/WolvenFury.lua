--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.WolvenFury = {}
local WolvenFury = ____exports.WolvenFury
WolvenFury.name = "WolvenFury"
WolvenFury.__index = WolvenFury
WolvenFury.prototype = {}
WolvenFury.prototype.__index = __TS__Index(WolvenFury.prototype)
WolvenFury.prototype.__newindex = __TS__NewIndex(WolvenFury.prototype)
WolvenFury.prototype.constructor = WolvenFury
WolvenFury.____super = GenericAbility
setmetatable(WolvenFury, WolvenFury.____super)
setmetatable(WolvenFury.prototype, WolvenFury.____super.prototype)
function WolvenFury.new(...)
    local self = setmetatable({}, WolvenFury.prototype)
    self:____constructor(...)
    return self
end
function WolvenFury.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0BG", game)
    self.givesAbility = FourCC("A0C4")
    self.maxLevel = 10
end
function WolvenFury.prototype.TargetOnCastAction(self)
    local target = GetSpellTargetUnit()
    if target then
        if GetUnitAbilityLevelSwapped(self.givesAbility, target) >= self.maxLevel then
            return
        end
        if GetUnitAbilityLevelSwapped(self.givesAbility, target) >= 1 then
            IncUnitAbilityLevelSwapped(self.givesAbility, target)
        else
            UnitAddAbilityBJ(self.givesAbility, target)
        end
    end
end
return ____exports
