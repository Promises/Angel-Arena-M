--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.Transfuse = {}
local Transfuse = ____exports.Transfuse
Transfuse.name = "Transfuse"
Transfuse.__index = Transfuse
Transfuse.prototype = {}
Transfuse.prototype.__index = __TS__Index(Transfuse.prototype)
Transfuse.prototype.__newindex = __TS__NewIndex(Transfuse.prototype)
Transfuse.prototype.constructor = Transfuse
Transfuse.____super = GenericAbility
setmetatable(Transfuse, Transfuse.____super)
setmetatable(Transfuse.prototype, Transfuse.____super.prototype)
function Transfuse.new(...)
    local self = setmetatable({}, Transfuse.prototype)
    self:____constructor(...)
    return self
end
function Transfuse.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A03A", game)
end
function Transfuse.prototype.TargetOnEffectAction(self)
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
            if GetItemLevel(
                UnitItemInSlotBJ(tower.tower, 1)
            ) == 2 then
                RemoveItem(
                    UnitItemInSlotBJ(tower.tower, 1)
                )
                SetUnitManaBJ(
                    tower.tower,
                    GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) + 1
                )
            end
        end
    end
end
return ____exports
