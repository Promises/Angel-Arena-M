--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.PurchaseVoidBeing = {}
local PurchaseVoidBeing = ____exports.PurchaseVoidBeing
PurchaseVoidBeing.name = "PurchaseVoidBeing"
PurchaseVoidBeing.__index = PurchaseVoidBeing
PurchaseVoidBeing.prototype = {}
PurchaseVoidBeing.prototype.__index = __TS__Index(PurchaseVoidBeing.prototype)
PurchaseVoidBeing.prototype.__newindex = __TS__NewIndex(PurchaseVoidBeing.prototype)
PurchaseVoidBeing.prototype.constructor = PurchaseVoidBeing
PurchaseVoidBeing.____super = GenericAbility
setmetatable(PurchaseVoidBeing, PurchaseVoidBeing.____super)
setmetatable(PurchaseVoidBeing.prototype, PurchaseVoidBeing.____super.prototype)
function PurchaseVoidBeing.new(...)
    local self = setmetatable({}, PurchaseVoidBeing.prototype)
    self:____constructor(...)
    return self
end
function PurchaseVoidBeing.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0BB", game)
end
function PurchaseVoidBeing.prototype.TargetOnCastAction(self)
    local owner = self.game.players:get(
        GetPlayerId(
            GetOwningPlayer(
                GetSpellAbilityUnit()
            )
        )
    )
    if owner then
        if owner:GetVoidFragments() >= 100 then
            owner:SetVoidFragments(
                owner:GetVoidFragments() - 100
            )
        end
    end
end
return ____exports
