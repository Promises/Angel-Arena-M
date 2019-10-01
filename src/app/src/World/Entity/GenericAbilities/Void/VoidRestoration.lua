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
    GenericAbility.prototype.____constructor(self, "A095", game)
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
        local target = owner:GetTower(
            GetHandleId(
                GetSpellTargetUnit()
            )
        )
        if tower and target then
            CreateTextTagUnitBJ("TRIGSTR_7924", target.tower, 0, 10, 100, 100, 100, 0)
            SetTextTagVelocityBJ(
                GetLastCreatedTextTag(),
                40,
                90
            )
            SetTextTagPermanentBJ(
                GetLastCreatedTextTag(),
                false
            )
            SetTextTagLifespanBJ(
                GetLastCreatedTextTag(),
                4
            )
            SetTextTagFadepointBJ(
                GetLastCreatedTextTag(),
                2
            )
            owner:SetVoidFragments(
                owner:GetVoidFragments() + 10
            )
            if owner:getVoidBuilder() then
                SetUnitManaBJ(
                    owner:getVoidBuilder(),
                    owner:GetVoidFragments()
                )
            end
        end
    end
end
return ____exports
