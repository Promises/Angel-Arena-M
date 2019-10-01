--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local COLOUR_CODES = ____GlobalSettings.COLOUR_CODES
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
____exports.AbstractPlayer = {}
local AbstractPlayer = ____exports.AbstractPlayer
AbstractPlayer.name = "AbstractPlayer"
AbstractPlayer.__index = AbstractPlayer
AbstractPlayer.prototype = {}
AbstractPlayer.prototype.__index = AbstractPlayer.prototype
AbstractPlayer.prototype.constructor = AbstractPlayer
function AbstractPlayer.new(...)
    local self = setmetatable({}, AbstractPlayer.prototype)
    self:____constructor(...)
    return self
end
function AbstractPlayer.prototype.____constructor(self, id)
    self.id = id
    self.wcPlayer = Player(id)
end
function AbstractPlayer.prototype.makeAlliance(self, otherPlayer)
    SetPlayerAllianceStateBJ(self.wcPlayer, otherPlayer.wcPlayer, bj_ALLIANCE_ALLIED_VISION)
end
function AbstractPlayer.prototype.getPlayerColour(self)
    return string.lower(COLOUR[self.id])
end
function AbstractPlayer.prototype.getColourCode(self)
    return COLOUR_CODES[self.id + 1]
end
function AbstractPlayer.prototype.getNameWithColour(self)
    return Util:ColourString(
        self:getColourCode(),
        self:getPlayerName()
    )
end
function AbstractPlayer.prototype.getPlayerName(self)
    return GetPlayerName(self.wcPlayer)
end
function AbstractPlayer.prototype.sendMessage(self, message)
    Log.Message(
        "{\"s\":\"" .. tostring(
            self:getPlayerName()
        ) .. "\", \"m\":\"" .. tostring(message) .. "\"}"
    )
    DisplayTimedTextToPlayer(self.wcPlayer, 0, 0, 10, message)
end
function AbstractPlayer.prototype.setGold(self, amount)
    SetPlayerStateBJ(self.wcPlayer, PLAYER_STATE_RESOURCE_GOLD, amount)
end
function AbstractPlayer.prototype.setLumber(self, amount)
    SetPlayerStateBJ(self.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER, amount)
end
function AbstractPlayer.prototype.setHandicap(self, percentage)
    SetPlayerHandicapBJ(self.wcPlayer, percentage)
end
function AbstractPlayer.prototype.giveLumber(self, amount)
    AdjustPlayerStateBJ(amount, self.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER)
end
function AbstractPlayer.prototype.giveGold(self, amount)
    if amount then
        AdjustPlayerStateBJ(amount, self.wcPlayer, PLAYER_STATE_RESOURCE_GOLD)
    end
end
function AbstractPlayer.prototype.getGold(self)
    return GetPlayerState(self.wcPlayer, PLAYER_STATE_RESOURCE_GOLD)
end
function AbstractPlayer.prototype.getLumber(self)
    return GetPlayerState(self.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER)
end
function AbstractPlayer.prototype.defeatPlayer(self)
    CustomDefeatBJ(self.wcPlayer, "Defeat!")
end
return ____exports
