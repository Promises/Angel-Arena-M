--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.PurchaseVoidBeast = {}
local PurchaseVoidBeast = ____exports.PurchaseVoidBeast
PurchaseVoidBeast.name = "PurchaseVoidBeast"
PurchaseVoidBeast.__index = PurchaseVoidBeast
PurchaseVoidBeast.prototype = {}
PurchaseVoidBeast.prototype.__index = __TS__Index(PurchaseVoidBeast.prototype)
PurchaseVoidBeast.prototype.__newindex = __TS__NewIndex(PurchaseVoidBeast.prototype)
PurchaseVoidBeast.prototype.constructor = PurchaseVoidBeast
PurchaseVoidBeast.____super = GenericAbility
setmetatable(PurchaseVoidBeast, PurchaseVoidBeast.____super)
setmetatable(PurchaseVoidBeast.prototype, PurchaseVoidBeast.____super.prototype)
function PurchaseVoidBeast.new(...)
    local self = setmetatable({}, PurchaseVoidBeast.prototype)
    self:____constructor(...)
    return self
end
function PurchaseVoidBeast.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0BJ", game)
end
function PurchaseVoidBeast.prototype.TargetOnCastAction(self)
    local owner = self.game.players:get(
        GetPlayerId(
            GetOwningPlayer(
                GetSpellAbilityUnit()
            )
        )
    )
    if owner then
        if owner:GetVoidFragments() >= 400 then
            owner:SetVoidFragments(
                owner:GetVoidFragments() - 400
            )
        end
    end
end
return ____exports
