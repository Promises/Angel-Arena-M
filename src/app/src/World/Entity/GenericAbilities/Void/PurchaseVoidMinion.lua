--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.PurchaseVoidMinion = {}
local PurchaseVoidMinion = ____exports.PurchaseVoidMinion
PurchaseVoidMinion.name = "PurchaseVoidMinion"
PurchaseVoidMinion.__index = PurchaseVoidMinion
PurchaseVoidMinion.prototype = {}
PurchaseVoidMinion.prototype.__index = __TS__Index(PurchaseVoidMinion.prototype)
PurchaseVoidMinion.prototype.__newindex = __TS__NewIndex(PurchaseVoidMinion.prototype)
PurchaseVoidMinion.prototype.constructor = PurchaseVoidMinion
PurchaseVoidMinion.____super = GenericAbility
setmetatable(PurchaseVoidMinion, PurchaseVoidMinion.____super)
setmetatable(PurchaseVoidMinion.prototype, PurchaseVoidMinion.____super.prototype)
function PurchaseVoidMinion.new(...)
    local self = setmetatable({}, PurchaseVoidMinion.prototype)
    self:____constructor(...)
    return self
end
function PurchaseVoidMinion.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0EZ", game)
end
function PurchaseVoidMinion.prototype.TargetOnCastAction(self)
    local owner = self.game.players:get(
        GetPlayerId(
            GetOwningPlayer(
                GetSpellAbilityUnit()
            )
        )
    )
    local t = GetSpellTargetUnit()
    if owner then
        local target = owner:GetTower(
            GetHandleId(t)
        )
        if target then
            if target:GetTypeID() == FourCC("h02G") then
                if owner:GetVoidFragments() >= 50 then
                    owner:SetVoidFragments(
                        owner:GetVoidFragments() - 50
                    )
                end
                local voidMinions = {"hC12", "hC13", "hC14"}
                local index = Util:RandomInt(0, 2)
                target:Upgrade(
                    FourCC(voidMinions[index + 1])
                )
            else
                SetUnitManaBJ(
                    owner:getVoidBuilder(),
                    owner:GetVoidFragments() + 50
                )
            end
        end
    end
end
return ____exports
