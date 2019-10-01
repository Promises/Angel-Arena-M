--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Item = require("app.src.World.Entity.Item.Specs.Item")
local Item = ____Item.Item
____exports.PlatinumToken = {}
local PlatinumToken = ____exports.PlatinumToken
PlatinumToken.name = "PlatinumToken"
PlatinumToken.__index = PlatinumToken
PlatinumToken.prototype = {}
PlatinumToken.prototype.__index = __TS__Index(PlatinumToken.prototype)
PlatinumToken.prototype.__newindex = __TS__NewIndex(PlatinumToken.prototype)
PlatinumToken.prototype.constructor = PlatinumToken
PlatinumToken.____super = Item
setmetatable(PlatinumToken, PlatinumToken.____super)
setmetatable(PlatinumToken.prototype, PlatinumToken.____super.prototype)
function PlatinumToken.new(...)
    local self = setmetatable({}, PlatinumToken.prototype)
    self:____constructor(...)
    return self
end
function PlatinumToken.prototype.____constructor(self, game)
    Item.prototype.____constructor(self, "I02C", game)
end
function PlatinumToken.prototype.ManipulateAction(self)
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
        ) + 6)
    )
end
return ____exports
