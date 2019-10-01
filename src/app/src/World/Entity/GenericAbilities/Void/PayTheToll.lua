--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.PayTheToll = {}
local PayTheToll = ____exports.PayTheToll
PayTheToll.name = "PayTheToll"
PayTheToll.__index = PayTheToll
PayTheToll.prototype = {}
PayTheToll.prototype.__index = __TS__Index(PayTheToll.prototype)
PayTheToll.prototype.__newindex = __TS__NewIndex(PayTheToll.prototype)
PayTheToll.prototype.constructor = PayTheToll
PayTheToll.____super = GenericAbility
setmetatable(PayTheToll, PayTheToll.____super)
setmetatable(PayTheToll.prototype, PayTheToll.____super.prototype)
function PayTheToll.new(...)
    local self = setmetatable({}, PayTheToll.prototype)
    self:____constructor(...)
    return self
end
function PayTheToll.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0BF", game)
end
function PayTheToll.prototype.TargetOnCastAction(self)
    local owner = self.game.players:get(
        GetPlayerId(
            GetOwningPlayer(
                GetSpellAbilityUnit()
            )
        )
    )
    if owner then
        local tower = owner:GetTower(
            GetHandleId(
                GetSpellAbilityUnit()
            )
        )
        if tower then
            if owner:getGold() >= 50 then
                owner:giveGold(-50)
                if tower:GetTypeID() == FourCC("h02S") then
                    owner:SetVoidFragmentTick(
                        owner:GetVoidFragmentTick() - 1
                    )
                end
                if self.game.worldMap.antiBlock then
                    self.game.worldMap.antiBlock:CleanUpRemovedConstruction(tower.tower)
                end
                tower:Remove()
            end
        end
    end
end
return ____exports
