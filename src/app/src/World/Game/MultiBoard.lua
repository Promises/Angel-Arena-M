--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local settings = require("app.src.World.GlobalSettings")
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local ARMOUR_TYPE_COLOURS = ____GlobalSettings.ARMOUR_TYPE_COLOURS
local ARMOUR_TYPE_NAMES = ____GlobalSettings.ARMOUR_TYPE_NAMES
____exports.MultiBoard = {}
local MultiBoard = ____exports.MultiBoard
MultiBoard.name = "MultiBoard"
MultiBoard.__index = MultiBoard
MultiBoard.prototype = {}
MultiBoard.prototype.__index = MultiBoard.prototype
MultiBoard.prototype.constructor = MultiBoard
function MultiBoard.new(...)
    local self = setmetatable({}, MultiBoard.prototype)
    self:____constructor(...)
    return self
end
function MultiBoard.prototype.____constructor(self, game)
    self.scoreboardColumnWidth = {}
    self.game = game
    self.scoreboardColumnWidth[2] = 10
    self.scoreboardColumnWidth[3] = 8
    self.board = CreateMultiboardBJ(2, self.game.players.size + 6, settings.GAME_NAME)
    MultiboardSetItemValueBJ(self.board, 1, 1, "Starting in")
    MultiboardSetItemValueBJ(
        self.board,
        2,
        1,
        tostring(self.game.waveTimer)
    )
    MultiboardSetItemValueBJ(self.board, 1, 2, "Level")
    if self.game.worldMap.gameRoundHandler then
        MultiboardSetItemValueBJ(
            self.board,
            2,
            2,
            tostring(self.game.worldMap.gameRoundHandler.currentWave)
        )
    end
    MultiboardSetItemValueBJ(self.board, 1, 3, "Difficulty")
    MultiboardSetItemValueBJ(self.board, 1, 4, "Lives")
    MultiboardSetItemValueBJ(
        self.board,
        2,
        4,
        tostring(self.game.gameLives) .. "%"
    )
    MultiboardSetItemValueBJ(self.board, 1, 5, "Armour Type")
    local armourType = string.lower(
        ARMOUR_TYPE_NAMES[self.game.worldMap.waveCreeps[1]:getArmourType() + 1]
    )
    armourType = tostring(
        string.upper(
            string.sub(armourType, 1, 1)
        )
    ) .. tostring(
        string.sub(armourType, 2)
    )
    MultiboardSetItemValueBJ(
        self.board,
        2,
        5,
        Util:ColourString(
            ARMOUR_TYPE_COLOURS[self.game.worldMap.waveCreeps[1]:getArmourType() + 1],
            armourType
        )
    )
    MultiboardSetItemValueBJ(self.board, 1, 7, "Player")
    MultiboardSetItemValueBJ(self.board, 2, 7, "Kills")
    MultiboardSetItemWidthBJ(self.board, 1, 1, self.scoreboardColumnWidth[2])
    MultiboardSetItemWidthBJ(self.board, 2, 1, self.scoreboardColumnWidth[3])
    MultiboardSetItemWidthBJ(self.board, 1, 2, self.scoreboardColumnWidth[2])
    MultiboardSetItemWidthBJ(self.board, 2, 2, self.scoreboardColumnWidth[3])
    MultiboardSetItemWidthBJ(self.board, 1, 3, self.scoreboardColumnWidth[2])
    MultiboardSetItemWidthBJ(self.board, 2, 3, self.scoreboardColumnWidth[3])
    MultiboardSetItemWidthBJ(self.board, 1, 4, self.scoreboardColumnWidth[2])
    MultiboardSetItemWidthBJ(self.board, 2, 4, self.scoreboardColumnWidth[3])
    MultiboardSetItemWidthBJ(self.board, 1, 5, self.scoreboardColumnWidth[2])
    MultiboardSetItemWidthBJ(self.board, 2, 5, self.scoreboardColumnWidth[3])
    MultiboardSetItemWidthBJ(self.board, 1, 6, self.scoreboardColumnWidth[2])
    MultiboardSetItemWidthBJ(self.board, 2, 6, self.scoreboardColumnWidth[3])
    MultiboardSetItemStyleBJ(self.board, 1, 1, true, false)
    MultiboardSetItemStyleBJ(self.board, 2, 1, true, false)
    MultiboardSetItemStyleBJ(self.board, 1, 2, true, false)
    MultiboardSetItemStyleBJ(self.board, 2, 2, true, false)
    MultiboardSetItemStyleBJ(self.board, 1, 3, true, false)
    MultiboardSetItemStyleBJ(self.board, 2, 3, true, false)
    MultiboardSetItemStyleBJ(self.board, 1, 4, true, false)
    MultiboardSetItemStyleBJ(self.board, 2, 4, true, false)
    MultiboardSetItemStyleBJ(self.board, 1, 5, true, false)
    MultiboardSetItemStyleBJ(self.board, 2, 5, true, false)
    MultiboardSetItemStyleBJ(self.board, 1, 6, true, false)
    MultiboardSetItemStyleBJ(self.board, 2, 6, true, false)
    self:InitializePlayerScores()
    MultiboardDisplayBJ(true, self.board)
end
function MultiBoard.prototype.InitializePlayerScores(self)
    local count = 0
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local player = self.game.players:get(i)
            if player then
                player.scoreSlot = count
                MultiboardSetItemValueBJ(
                    self.board,
                    1,
                    7 + count,
                    player:getNameWithColour()
                )
                MultiboardSetItemValueBJ(
                    self.board,
                    2,
                    7 + count,
                    tostring(player.kills)
                )
                MultiboardSetItemStyleBJ(self.board, 1, 7 + count, true, false)
                MultiboardSetItemStyleBJ(self.board, 2, 7 + count, true, false)
                MultiboardSetItemWidthBJ(self.board, 1, 7 + count, self.scoreboardColumnWidth[2])
                MultiboardSetItemWidthBJ(self.board, 2, 7 + count, self.scoreboardColumnWidth[3])
                count = count + 1
            end
            i = i + 1
        end
    end
end
return ____exports
