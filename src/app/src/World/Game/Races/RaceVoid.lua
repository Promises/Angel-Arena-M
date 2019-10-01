--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Race = require("app.src.World.Game.Races.Race")
local Race = ____Race.Race
____exports.RaceVoid = {}
local RaceVoid = ____exports.RaceVoid
RaceVoid.name = "RaceVoid"
RaceVoid.__index = RaceVoid
RaceVoid.prototype = {}
RaceVoid.prototype.__index = RaceVoid.prototype
RaceVoid.prototype.constructor = RaceVoid
RaceVoid.____super = Race
setmetatable(RaceVoid, RaceVoid.____super)
setmetatable(RaceVoid.prototype, RaceVoid.____super.prototype)
function RaceVoid.new(...)
    local self = setmetatable({}, RaceVoid.prototype)
    self:____constructor(...)
    return self
end
function RaceVoid.prototype.pickAction(self, player)
    player.voidBuilder = CreateUnit(
        player.wcPlayer,
        FourCC(self.id),
        player:getCenterX(),
        player:getCenterY(),
        bj_UNIT_FACING
    )
    local voidBuilder = player:getVoidBuilder()
    if voidBuilder ~= nil then
        UnitAddItemByIdSwapped(
            FourCC("I01Y"),
            voidBuilder
        )
        UnitAddItemByIdSwapped(
            FourCC("I01Z"),
            voidBuilder
        )
        UnitAddItemByIdSwapped(
            FourCC("I020"),
            voidBuilder
        )
        UnitAddItemByIdSwapped(
            FourCC("I01X"),
            voidBuilder
        )
        UnitAddItemByIdSwapped(
            FourCC("I02E"),
            voidBuilder
        )
    end
    __TS__ArrayPush(player.builders, player.voidBuilder)
end
return ____exports
