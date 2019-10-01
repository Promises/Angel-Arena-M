--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.PurchaseVoidLord = {}
local PurchaseVoidLord = ____exports.PurchaseVoidLord
PurchaseVoidLord.name = "PurchaseVoidLord"
PurchaseVoidLord.__index = PurchaseVoidLord
PurchaseVoidLord.prototype = {}
PurchaseVoidLord.prototype.__index = __TS__Index(PurchaseVoidLord.prototype)
PurchaseVoidLord.prototype.__newindex = __TS__NewIndex(PurchaseVoidLord.prototype)
PurchaseVoidLord.prototype.constructor = PurchaseVoidLord
PurchaseVoidLord.____super = GenericAbility
setmetatable(PurchaseVoidLord, PurchaseVoidLord.____super)
setmetatable(PurchaseVoidLord.prototype, PurchaseVoidLord.____super.prototype)
function PurchaseVoidLord.new(...)
    local self = setmetatable({}, PurchaseVoidLord.prototype)
    self:____constructor(...)
    return self
end
function PurchaseVoidLord.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0BL", game)
end
function PurchaseVoidLord.prototype.TargetOnCastAction(self)
    local owner = self.game.players:get(
        GetPlayerId(
            GetOwningPlayer(
                GetSpellAbilityUnit()
            )
        )
    )
    if owner then
        if owner:GetVoidFragments() >= 1200 then
            owner:SetVoidFragments(
                owner:GetVoidFragments() - 1200
            )
        end
    end
end
return ____exports
