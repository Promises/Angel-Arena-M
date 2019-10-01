--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Race = require("app.src.World.Game.Races.Race")
local Race = ____Race.Race
____exports.RaceLootBoxer = {}
local RaceLootBoxer = ____exports.RaceLootBoxer
RaceLootBoxer.name = "RaceLootBoxer"
RaceLootBoxer.__index = RaceLootBoxer
RaceLootBoxer.prototype = {}
RaceLootBoxer.prototype.__index = RaceLootBoxer.prototype
RaceLootBoxer.prototype.constructor = RaceLootBoxer
RaceLootBoxer.____super = Race
setmetatable(RaceLootBoxer, RaceLootBoxer.____super)
setmetatable(RaceLootBoxer.prototype, RaceLootBoxer.____super.prototype)
function RaceLootBoxer.new(...)
    local self = setmetatable({}, RaceLootBoxer.prototype)
    self:____constructor(...)
    return self
end
function RaceLootBoxer.prototype.pickAction(self, player)
    if player.lootBoxer then
        player:sendMessage("I\'m sorry Dave, I\'m afraid I can\'t do that")
        player:giveLumber(1)
        return
    end
    player.lootBoxer = CreateUnit(
        player.wcPlayer,
        FourCC(self.id),
        player:getCenterX(),
        player:getCenterY(),
        bj_UNIT_FACING
    )
    __TS__ArrayPush(player.builders, player.lootBoxer)
end
return ____exports
