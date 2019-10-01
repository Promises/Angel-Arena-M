--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.ChannelItem = {}
local ChannelItem = ____exports.ChannelItem
ChannelItem.name = "ChannelItem"
ChannelItem.__index = ChannelItem
ChannelItem.prototype = {}
ChannelItem.prototype.__index = __TS__Index(ChannelItem.prototype)
ChannelItem.prototype.__newindex = __TS__NewIndex(ChannelItem.prototype)
ChannelItem.prototype.constructor = ChannelItem
ChannelItem.____super = GenericAbility
setmetatable(ChannelItem, ChannelItem.____super)
setmetatable(ChannelItem.prototype, ChannelItem.____super.prototype)
function ChannelItem.new(...)
    local self = setmetatable({}, ChannelItem.prototype)
    self:____constructor(...)
    return self
end
function ChannelItem.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A05H", game)
    self.allianceTowers = {
        FourCC("n02T"),
        FourCC("n02X"),
        FourCC("n02V"),
        FourCC("n02U"),
        FourCC("n007"),
        FourCC("n02W"),
        FourCC("n012")
    }
end
function ChannelItem.prototype.TargetOnEffectAction(self)
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
            if __TS__ArrayIndexOf(
                self.allianceTowers,
                GetUnitTypeId(
                    GetSpellTargetUnit()
                )
            ) >= 0 then
                UnitAddItemSwapped(
                    UnitItemInSlotBJ(tower.tower, 1),
                    GetSpellTargetUnit()
                )
            end
        end
    end
end
return ____exports
