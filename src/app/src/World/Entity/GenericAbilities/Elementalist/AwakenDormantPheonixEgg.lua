--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.AwakenDormantPheonixEgg = {}
local AwakenDormantPheonixEgg = ____exports.AwakenDormantPheonixEgg
AwakenDormantPheonixEgg.name = "AwakenDormantPheonixEgg"
AwakenDormantPheonixEgg.__index = AwakenDormantPheonixEgg
AwakenDormantPheonixEgg.prototype = {}
AwakenDormantPheonixEgg.prototype.__index = __TS__Index(AwakenDormantPheonixEgg.prototype)
AwakenDormantPheonixEgg.prototype.__newindex = __TS__NewIndex(AwakenDormantPheonixEgg.prototype)
AwakenDormantPheonixEgg.prototype.constructor = AwakenDormantPheonixEgg
AwakenDormantPheonixEgg.____super = GenericAbility
setmetatable(AwakenDormantPheonixEgg, AwakenDormantPheonixEgg.____super)
setmetatable(AwakenDormantPheonixEgg.prototype, AwakenDormantPheonixEgg.____super.prototype)
function AwakenDormantPheonixEgg.new(...)
    local self = setmetatable({}, AwakenDormantPheonixEgg.prototype)
    self:____constructor(...)
    return self
end
function AwakenDormantPheonixEgg.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0DV", game)
end
function AwakenDormantPheonixEgg.prototype.TargetOnEffectAction(self)
    local u = GetTriggerUnit()
    local owner = self.game.players:get(
        GetPlayerId(
            GetOwningPlayer(u)
        )
    )
    if owner then
        local tower = owner:GetTower(
            GetHandleId(u)
        )
        if tower then
            tower:Upgrade(
                FourCC("h006")
            )
        end
    end
end
return ____exports
