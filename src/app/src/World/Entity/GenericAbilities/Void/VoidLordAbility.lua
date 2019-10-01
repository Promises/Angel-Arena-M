--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.VoidLordAbility = {}
local VoidLordAbility = ____exports.VoidLordAbility
VoidLordAbility.name = "VoidLordAbility"
VoidLordAbility.__index = VoidLordAbility
VoidLordAbility.prototype = {}
VoidLordAbility.prototype.__index = __TS__Index(VoidLordAbility.prototype)
VoidLordAbility.prototype.__newindex = __TS__NewIndex(VoidLordAbility.prototype)
VoidLordAbility.prototype.constructor = VoidLordAbility
VoidLordAbility.____super = GenericAbility
setmetatable(VoidLordAbility, VoidLordAbility.____super)
setmetatable(VoidLordAbility.prototype, VoidLordAbility.____super.prototype)
function VoidLordAbility.new(...)
    local self = setmetatable({}, VoidLordAbility.prototype)
    self:____constructor(...)
    return self
end
function VoidLordAbility.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A09E", game)
end
function VoidLordAbility.prototype.TargetOnCastAction(self)
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
            if tower:GetTypeID() == FourCC("h01O") and target:GetTypeID() == FourCC("h02G") then
                BlzSetUnitBaseDamage(
                    tower.tower,
                    (BlzGetUnitBaseDamage(tower.tower, 0) + 250),
                    0
                )
                target:Upgrade(
                    FourCC("h02S")
                )
            end
        end
    end
end
return ____exports
