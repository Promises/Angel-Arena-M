--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Item = require("app.src.World.Entity.Item.Specs.Item")
local Item = ____Item.Item
____exports.WoodenSticks = {}
local WoodenSticks = ____exports.WoodenSticks
WoodenSticks.name = "WoodenSticks"
WoodenSticks.__index = WoodenSticks
WoodenSticks.prototype = {}
WoodenSticks.prototype.__index = __TS__Index(WoodenSticks.prototype)
WoodenSticks.prototype.__newindex = __TS__NewIndex(WoodenSticks.prototype)
WoodenSticks.prototype.constructor = WoodenSticks
WoodenSticks.____super = Item
setmetatable(WoodenSticks, WoodenSticks.____super)
setmetatable(WoodenSticks.prototype, WoodenSticks.____super.prototype)
function WoodenSticks.new(...)
    local self = setmetatable({}, WoodenSticks.prototype)
    self:____constructor(...)
    return self
end
function WoodenSticks.prototype.____constructor(self, game)
    Item.prototype.____constructor(self, "I028", game)
end
function WoodenSticks.prototype.ManipulateAction(self)
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
        ) + 1)
    )
end
return ____exports
