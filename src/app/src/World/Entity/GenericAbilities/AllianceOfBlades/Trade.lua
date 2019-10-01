--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local AOB_ITEM_LOOT_LEVEL_ONE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_ONE
____exports.Trade = {}
local Trade = ____exports.Trade
Trade.name = "Trade"
Trade.__index = Trade
Trade.prototype = {}
Trade.prototype.__index = __TS__Index(Trade.prototype)
Trade.prototype.__newindex = __TS__NewIndex(Trade.prototype)
Trade.prototype.constructor = Trade
Trade.____super = GenericAbility
setmetatable(Trade, Trade.____super)
setmetatable(Trade.prototype, Trade.____super.prototype)
function Trade.new(...)
    local self = setmetatable({}, Trade.prototype)
    self:____constructor(...)
    return self
end
function Trade.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A016", game)
end
function Trade.prototype.TargetOnEffectAction(self)
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
            ) == 1 then
                local i = UnitItemInSlotBJ(tower.tower, 1)
                local indx = __TS__ArrayIndexOf(
                    AOB_ITEM_LOOT_LEVEL_ONE,
                    GetItemTypeId(i)
                )
                local mana = GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) + 1
                SetUnitManaBJ(tower.tower, mana)
                RemoveItem(
                    UnitItemInSlotBJ(tower.tower, 1)
                )
                if mana > 1 then
                    local random = Util:RandomInt(0, #AOB_ITEM_LOOT_LEVEL_ONE - 1)
                    if random == indx then
                        random = random + 1
                    end
                    if random > #AOB_ITEM_LOOT_LEVEL_ONE - 1 then
                        random = 0
                    end
                    local newItem = AOB_ITEM_LOOT_LEVEL_ONE[random + 1]
                    UnitAddItemByIdSwapped(newItem, tower.tower)
                    SetUnitManaBJ(tower.tower, 0)
                end
            end
        end
    end
end
return ____exports
