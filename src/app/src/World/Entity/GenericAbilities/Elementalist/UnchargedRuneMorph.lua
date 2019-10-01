--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.UnchargedRuneMorph = {}
local UnchargedRuneMorph = ____exports.UnchargedRuneMorph
UnchargedRuneMorph.name = "UnchargedRuneMorph"
UnchargedRuneMorph.__index = UnchargedRuneMorph
UnchargedRuneMorph.prototype = {}
UnchargedRuneMorph.prototype.__index = __TS__Index(UnchargedRuneMorph.prototype)
UnchargedRuneMorph.prototype.__newindex = __TS__NewIndex(UnchargedRuneMorph.prototype)
UnchargedRuneMorph.prototype.constructor = UnchargedRuneMorph
UnchargedRuneMorph.____super = GenericAbility
setmetatable(UnchargedRuneMorph, UnchargedRuneMorph.____super)
setmetatable(UnchargedRuneMorph.prototype, UnchargedRuneMorph.____super.prototype)
function UnchargedRuneMorph.new(...)
    local self = setmetatable({}, UnchargedRuneMorph.prototype)
    self:____constructor(...)
    return self
end
function UnchargedRuneMorph.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0BO", game)
    self.abilities = {
        FourCC("A0BO"),
        FourCC("A0BS"),
        FourCC("A0C0"),
        FourCC("A0C1"),
        FourCC("A0C2"),
        FourCC("A0C3")
    }
    self.towers = {
        FourCC("n01R"),
        FourCC("n01S"),
        FourCC("n022"),
        FourCC("n023"),
        FourCC("n024"),
        FourCC("n025")
    }
end
function UnchargedRuneMorph.prototype.Condition(self)
    return __TS__ArrayIndexOf(
        self.abilities,
        GetSpellAbilityId()
    ) >= 0
end
function UnchargedRuneMorph.prototype.TargetOnEffectAction(self)
    local u = GetTriggerUnit()
    local owner = self.game.players:get(
        GetPlayerId(
            GetOwningPlayer(u)
        )
    )
    if owner then
        local tower = owner:GetTower(
            GetHandleId(u)
        )
        if tower then
            tower:Upgrade(
                self.towers[__TS__ArrayIndexOf(
                    self.abilities,
                    GetSpellAbilityId()
                ) + 1]
            )
        end
    end
end
return ____exports
