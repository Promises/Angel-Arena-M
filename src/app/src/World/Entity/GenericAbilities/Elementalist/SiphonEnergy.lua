--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.SiphonEnergy = {}
local SiphonEnergy = ____exports.SiphonEnergy
SiphonEnergy.name = "SiphonEnergy"
SiphonEnergy.__index = SiphonEnergy
SiphonEnergy.prototype = {}
SiphonEnergy.prototype.__index = __TS__Index(SiphonEnergy.prototype)
SiphonEnergy.prototype.__newindex = __TS__NewIndex(SiphonEnergy.prototype)
SiphonEnergy.prototype.constructor = SiphonEnergy
SiphonEnergy.____super = GenericAbility
setmetatable(SiphonEnergy, SiphonEnergy.____super)
setmetatable(SiphonEnergy.prototype, SiphonEnergy.____super.prototype)
function SiphonEnergy.new(...)
    local self = setmetatable({}, SiphonEnergy.prototype)
    self:____constructor(...)
    return self
end
function SiphonEnergy.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0CT", game)
end
function SiphonEnergy.prototype.TargetOnEffectAction(self)
    local u = GetTriggerUnit()
    local t = GetSpellTargetUnit()
    local owner = self.game.players:get(
        GetPlayerId(
            GetOwningPlayer(u)
        )
    )
    if owner then
        local source = owner:GetTower(
            GetHandleId(u)
        )
        local target = owner:GetTower(
            GetHandleId(t)
        )
        if source and target then
            if self.game.abilityHandler.elementalistSettings:HasCombination(
                DecodeFourCC(
                    nil,
                    source:GetTypeID()
                ),
                DecodeFourCC(
                    nil,
                    target:GetTypeID()
                )
            ) then
                source:Upgrade(
                    FourCC(
                        self.game.abilityHandler.elementalistSettings:GetCombination(
                            DecodeFourCC(
                                nil,
                                source:GetTypeID()
                            ),
                            DecodeFourCC(
                                nil,
                                target:GetTypeID()
                            )
                        )
                    )
                )
                target:Upgrade(
                    FourCC("n027")
                )
            end
        end
    end
end
return ____exports
