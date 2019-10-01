--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____Maze = require("app.src.World.Antiblock.Maze")
local Walkable = ____Maze.Walkable
local settings = require("app.src.World.GlobalSettings")
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
local ____destructable = require("app.src.lib.common.destructable")
local Destructable = ____destructable.Destructable
____exports.AntiJuggleTower = {}
local AntiJuggleTower = ____exports.AntiJuggleTower
AntiJuggleTower.name = "AntiJuggleTower"
AntiJuggleTower.__index = AntiJuggleTower
AntiJuggleTower.prototype = {}
AntiJuggleTower.prototype.__index = AntiJuggleTower.prototype
AntiJuggleTower.prototype.constructor = AntiJuggleTower
function AntiJuggleTower.new(...)
    local self = setmetatable({}, AntiJuggleTower.prototype)
    self:____constructor(...)
    return self
end
function AntiJuggleTower.prototype.____constructor(self, game, tower)
    self.leftSide = 0
    self.rightSide = 0
    self.topSide = 0
    self.bottomSide = 0
    self.game = game
    self.x = GetUnitX(tower.tower)
    self.y = GetUnitY(tower.tower)
    RemoveUnit(tower.tower)
    self.destructable = Destructable:Create(
        FourCC("YTpc"),
        self.x,
        self.y,
        bj_UNIT_FACING,
        1,
        1
    )
    local playerSpawnId
    do
        local i = 0
        while i < #settings.PLAYER_AREAS do
            if settings.PLAYER_AREAS[i + 1]:ContainsDestructable(self.destructable) then
                playerSpawnId = i
                break
            end
            i = i + 1
        end
    end
    if playerSpawnId == nil then
        Log.Error("Unable to locate the correct player spawn")
        return
    end
    local maze = self.game.worldMap.playerMazes[playerSpawnId + 1]
    maze:AddAntiJuggler(self)
    self.leftSide = ((self.x - 64) - maze.minX) / 64
    self.rightSide = (self.x - maze.minX) / 64
    self.topSide = (self.y - maze.minY) / 64
    self.bottomSide = ((self.y - 64) - maze.minY) / 64
    maze:setWalkable(self.leftSide, self.bottomSide, Walkable.Protected)
    maze:setWalkable(self.rightSide, self.bottomSide, Walkable.Protected)
    maze:setWalkable(self.leftSide, self.topSide, Walkable.Protected)
    maze:setWalkable(self.rightSide, self.topSide, Walkable.Protected)
end
function AntiJuggleTower.prototype.EndOfRoundAction(self)
    self.destructable:Destroy()
end
return ____exports
