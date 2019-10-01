--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.ConstructThaddius = {}
local ConstructThaddius = ____exports.ConstructThaddius
ConstructThaddius.name = "ConstructThaddius"
ConstructThaddius.__index = ConstructThaddius
ConstructThaddius.prototype = {}
ConstructThaddius.prototype.__index = __TS__Index(ConstructThaddius.prototype)
ConstructThaddius.prototype.__newindex = __TS__NewIndex(ConstructThaddius.prototype)
ConstructThaddius.prototype.constructor = ConstructThaddius
ConstructThaddius.____super = GenericAbility
setmetatable(ConstructThaddius, ConstructThaddius.____super)
setmetatable(ConstructThaddius.prototype, ConstructThaddius.____super.prototype)
function ConstructThaddius.new(...)
    local self = setmetatable({}, ConstructThaddius.prototype)
    self:____constructor(...)
    return self
end
function ConstructThaddius.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0F5", game)
end
function ConstructThaddius.prototype.TargetOnEffectAction(self)
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
            if (source:GetTypeID() == FourCC("oC7D") and target:GetTypeID() == FourCC("oC7E")) or (source:GetTypeID() == FourCC("oC7E") and target:GetTypeID() == FourCC("oC7D")) then
                source:Upgrade(
                    FourCC("oC7F")
                )
                target:Upgrade(
                    FourCC("oC76")
                )
            end
        end
    end
end
return ____exports
