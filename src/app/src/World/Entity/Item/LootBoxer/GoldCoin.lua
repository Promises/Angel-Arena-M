--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Item = require("app.src.World.Entity.Item.Specs.Item")
local Item = ____Item.Item
____exports.GoldCoin = {}
local GoldCoin = ____exports.GoldCoin
GoldCoin.name = "GoldCoin"
GoldCoin.__index = GoldCoin
GoldCoin.prototype = {}
GoldCoin.prototype.__index = __TS__Index(GoldCoin.prototype)
GoldCoin.prototype.__newindex = __TS__NewIndex(GoldCoin.prototype)
GoldCoin.prototype.constructor = GoldCoin
GoldCoin.____super = Item
setmetatable(GoldCoin, GoldCoin.____super)
setmetatable(GoldCoin.prototype, GoldCoin.____super.prototype)
function GoldCoin.new(...)
    local self = setmetatable({}, GoldCoin.prototype)
    self:____constructor(...)
    return self
end
function GoldCoin.prototype.____constructor(self, game)
    Item.prototype.____constructor(self, "I02A", game)
end
function GoldCoin.prototype.ManipulateAction(self)
    if __TS__ArrayIndexOf(
        self.game.worldMap.towerConstruction.lootBoxerTowers,
        GetUnitTypeId(
            GetManipulatingUnit()
        )
    ) + 1 < 4 then
        return
    end
    SetUnitManaBJ(
        GetManipulatingUnit(),
        (GetUnitStateSwap(
            UNIT_STATE_MANA,
            GetManipulatingUnit()
        ) + 2)
    )
end
return ____exports
