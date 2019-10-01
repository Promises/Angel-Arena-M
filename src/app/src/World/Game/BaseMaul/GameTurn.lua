--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.GameTurn = {}
local GameTurn = ____exports.GameTurn
GameTurn.name = "GameTurn"
GameTurn.__index = GameTurn
GameTurn.prototype = {}
GameTurn.prototype.__index = GameTurn.prototype
GameTurn.prototype.constructor = GameTurn
function GameTurn.new(...)
    local self = setmetatable({}, GameTurn.prototype)
    self:____constructor(...)
    return self
end
function GameTurn.prototype.____constructor(self)
    self._endOfTurnTowerArray = {}
end
function GameTurn.prototype.EndOfRoundTowers(self)
    return self._endOfTurnTowerArray
end
function GameTurn.prototype.AddEndOfRoundTower(self, id, endOfRoundTower)
    __TS__ArrayPush(self._endOfTurnTowerArray, endOfRoundTower)
end
function GameTurn.prototype.RemoveEndOfRoundTower(self, id)
    self._endOfTurnTowerArray = __TS__ArrayFilter(
        self._endOfTurnTowerArray,
        function(____, tower)
            return tower.UniqueID ~= id
        end
    )
end
return ____exports
