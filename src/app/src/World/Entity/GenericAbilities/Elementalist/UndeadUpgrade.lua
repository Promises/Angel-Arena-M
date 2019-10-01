--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.UndeadUpgrade = {}
local UndeadUpgrade = ____exports.UndeadUpgrade
UndeadUpgrade.name = "UndeadUpgrade"
UndeadUpgrade.__index = UndeadUpgrade
UndeadUpgrade.prototype = {}
UndeadUpgrade.prototype.__index = __TS__Index(UndeadUpgrade.prototype)
UndeadUpgrade.prototype.__newindex = __TS__NewIndex(UndeadUpgrade.prototype)
UndeadUpgrade.prototype.constructor = UndeadUpgrade
UndeadUpgrade.____super = GenericAbility
setmetatable(UndeadUpgrade, UndeadUpgrade.____super)
setmetatable(UndeadUpgrade.prototype, UndeadUpgrade.____super.prototype)
function UndeadUpgrade.new(...)
    local self = setmetatable({}, UndeadUpgrade.prototype)
    self:____constructor(...)
    return self
end
function UndeadUpgrade.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0E6", game)
end
function UndeadUpgrade.prototype.TargetOnEffectAction(self)
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
                FourCC("u038")
            )
        end
    end
end
return ____exports
