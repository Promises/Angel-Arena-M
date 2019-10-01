--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
PlayerType = {}
PlayerType.PLAYER = 0
PlayerType[PlayerType.PLAYER] = "PLAYER"
PlayerType.COMPUTER = 1
PlayerType[PlayerType.COMPUTER] = "COMPUTER"
PlayerType.NONE = 2
PlayerType[PlayerType.NONE] = "NONE"
PlayerType.NEUTRAL = 3
PlayerType[PlayerType.NEUTRAL] = "NEUTRAL"
_G.PLAYER_SLOT_STATE_PLAYING = true
_G.MAP_CONTROL_USER = PlayerType.PLAYER
_G.bj_ALLIANCE_UNALLIED = 1
_G.bj_ALLIANCE_ALLIED_VISION = 2
local alliances = {}
_G.PLAYER_STATE_RESOURCE_GOLD = "gold"
_G.PLAYER_STATE_RESOURCE_LUMBER = "lumber"
_G.PLAYER_STATE_GIVES_BOUNTY = "bounty"
_G.IngamePlayers = {{name = "Red", type = PlayerType.PLAYER, colour = 0, gold = 0, lumber = 0, bounty = false}, {name = "Blue", type = PlayerType.PLAYER, colour = 1, gold = 0, lumber = 0, bounty = false}, {name = "Teal", type = PlayerType.PLAYER, colour = 2, gold = 0, lumber = 0, bounty = false}, {name = "Purple", type = PlayerType.PLAYER, colour = 3, gold = 0, lumber = 0, bounty = false}, {name = "Yellow", type = PlayerType.PLAYER, colour = 4, gold = 0, lumber = 0, bounty = false}, {name = "Orange", type = PlayerType.PLAYER, colour = 5, gold = 0, lumber = 0, bounty = false}, {name = "Pink", type = PlayerType.PLAYER, colour = 6, gold = 0, lumber = 0, bounty = false}, {name = "Green", type = PlayerType.PLAYER, colour = 7, gold = 0, lumber = 0, bounty = false}, {name = "Gray", type = PlayerType.PLAYER, colour = 8, gold = 0, lumber = 0, bounty = false}, {name = "Light Blue", type = PlayerType.PLAYER, colour = 9, gold = 0, lumber = 0, bounty = false}, {name = "Dark Green", type = PlayerType.PLAYER, colour = 10, gold = 0, lumber = 0, bounty = false}, {name = "Brown", type = PlayerType.PLAYER, colour = 11, gold = 0, lumber = 0, bounty = false}, {name = "Maroon", type = PlayerType.PLAYER, colour = 12, gold = 0, lumber = 0, bounty = false}, {name = "Forces of North", type = PlayerType.COMPUTER, colour = 13, gold = 0, lumber = 0, bounty = false}, {name = "Forces of North", type = PlayerType.COMPUTER, colour = 14, gold = 0, lumber = 0, bounty = false}, {name = "Forces of North", type = PlayerType.COMPUTER, colour = 15, gold = 0, lumber = 0, bounty = false}, {name = "Forces of North", type = PlayerType.COMPUTER, colour = 16, gold = 0, lumber = 0, bounty = false}, {name = "", type = PlayerType.NONE, colour = 17, gold = 0, lumber = 0, bounty = false}, {name = "", type = PlayerType.NONE, colour = 18, gold = 0, lumber = 0, bounty = false}, {name = "", type = PlayerType.NONE, colour = 19, gold = 0, lumber = 0, bounty = false}, {name = "", type = PlayerType.NONE, colour = 20, gold = 0, lumber = 0, bounty = false}, {name = "", type = PlayerType.NONE, colour = 21, gold = 0, lumber = 0, bounty = false}, {name = "", type = PlayerType.NONE, colour = 22, gold = 0, lumber = 0, bounty = false}, {name = "", type = PlayerType.NONE, colour = 23, gold = 0, lumber = 0, bounty = false}, {name = "", type = PlayerType.NEUTRAL, colour = 24, gold = 0, lumber = 0, bounty = false}, {name = "", type = PlayerType.NEUTRAL, colour = 25, gold = 0, lumber = 0, bounty = false}, {name = "", type = PlayerType.NEUTRAL, colour = 26, gold = 0, lumber = 0, bounty = false}, {name = "", type = PlayerType.NEUTRAL, colour = 27, gold = 0, lumber = 0, bounty = false}}
_G.PLAYER_NEUTRAL_PASSIVE = 24
_G.bj_PLAYER_NEUTRAL_EXTRA = 25
_G.Player = function(colourId)
    return _G.IngamePlayers[colourId + 1]
end
_G.SetPlayerStateBJ = function(whichPlayer, whichPlayerState, value)
    whichPlayer[whichPlayerState] = value
end
_G.AdjustPlayerStateBJ = function(value, whichPlayer, whichPlayerState)
    whichPlayer[whichPlayerState] = whichPlayer[whichPlayerState] + value
end
_G.GetPlayerState = function(whichPlayer, whichPlayerState)
    return whichPlayer[whichPlayerState]
end
_G.SetPlayerFlagBJ = function(whichPlayerFlag, flag, whichPlayer)
    whichPlayer[whichPlayerFlag] = flag
end
_G.GetPlayerSlotState = function(p)
    return p.name ~= ""
end
_G.GetPlayerController = function(whichPlayer)
    return whichPlayer.type
end
_G.GetPlayerName = function(p)
    return p.name
end
_G.SetPlayerName = function(p, name)
    p.name = name
end
_G.SetPlayerAllianceStateBJ = function(sourcePlayer, otherPlayer, allianceState)
    __TS__ArrayPush(alliances, {playerA = sourcePlayer, playerB = otherPlayer, state = allianceState})
end
_G.SetSoundParamsFromLabel = function(audio, label)
    return
end
_G.SetSoundDuration = function(audio, duration)
    return
end
_G.SetSoundChannel = function(audio, channel)
    return
end
_G.SetSoundDistances = function(audio, minDist, maxDist)
    return
end
_G.GetPlayerId = function(whichPlayer)
    return whichPlayer.colour
end
