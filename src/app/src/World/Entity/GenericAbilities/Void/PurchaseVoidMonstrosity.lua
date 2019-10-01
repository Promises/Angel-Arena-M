--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.PurchaseVoidMonstrosity = {}
local PurchaseVoidMonstrosity = ____exports.PurchaseVoidMonstrosity
PurchaseVoidMonstrosity.name = "PurchaseVoidMonstrosity"
PurchaseVoidMonstrosity.__index = PurchaseVoidMonstrosity
PurchaseVoidMonstrosity.prototype = {}
PurchaseVoidMonstrosity.prototype.__index = __TS__Index(PurchaseVoidMonstrosity.prototype)
PurchaseVoidMonstrosity.prototype.__newindex = __TS__NewIndex(PurchaseVoidMonstrosity.prototype)
PurchaseVoidMonstrosity.prototype.constructor = PurchaseVoidMonstrosity
PurchaseVoidMonstrosity.____super = GenericAbility
setmetatable(PurchaseVoidMonstrosity, PurchaseVoidMonstrosity.____super)
setmetatable(PurchaseVoidMonstrosity.prototype, PurchaseVoidMonstrosity.____super.prototype)
function PurchaseVoidMonstrosity.new(...)
    local self = setmetatable({}, PurchaseVoidMonstrosity.prototype)
    self:____constructor(...)
    return self
end
function PurchaseVoidMonstrosity.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0BK", game)
end
function PurchaseVoidMonstrosity.prototype.TargetOnCastAction(self)
    local owner = self.game.players:get(
        GetPlayerId(
            GetOwningPlayer(
                GetSpellAbilityUnit()
            )
        )
    )
    if owner then
        if owner:GetVoidFragments() >= 800 then
            owner:SetVoidFragments(
                owner:GetVoidFragments() - 800
            )
        end
    end
end
return ____exports
