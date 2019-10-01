--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Node = require("app.src.World.Antiblock.Node")
local Node = ____Node.Node
local ____NodeQueue = require("app.src.World.Antiblock.NodeQueue")
local NodeQueue = ____NodeQueue.NodeQueue
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
____exports.Walkable = {}
____exports.Walkable.Walkable = 0
____exports.Walkable[____exports.Walkable.Walkable] = "Walkable"
____exports.Walkable.Blocked = 1
____exports.Walkable[____exports.Walkable.Blocked] = "Blocked"
____exports.Walkable.Protected = 2
____exports.Walkable[____exports.Walkable.Protected] = "Protected"
____exports.Maze = {}
local Maze = ____exports.Maze
Maze.name = "Maze"
Maze.__index = Maze
Maze.prototype = {}
Maze.prototype.__index = Maze.prototype
Maze.prototype.constructor = Maze
function Maze.new(...)
    local self = setmetatable({}, Maze.prototype)
    self:____constructor(...)
    return self
end
function Maze.prototype.____constructor(self, minX, minY, maxX, maxY, width, height, maze)
    self.antiJugglers = {}
    self.minX = minX
    self.minY = minY
    self.maxX = maxX
    self.maxY = maxY
    self.width = width
    self.height = height
    self.maze = maze
end
function Maze.prototype.setWalkable(self, x, y, isWalkable)
    self.maze[x + 1][y + 1] = isWalkable
end
function Maze.prototype.breathFirstSearch(self, sourceX, sourceY, destinationX, destinationY)
    if self.maze[sourceX + 1][sourceY + 1] ~= ____exports.Walkable.Walkable or self.maze[destinationX + 1][destinationY + 1] ~= ____exports.Walkable.Walkable then
        return -1
    end
    local visited = {}
    do
        local i = 0
        while i < self.width do
            do
                local j = 0
                while j < self.height do
                    visited[(i + j * self.width) + 1] = false
                    j = j + 1
                end
            end
            i = i + 1
        end
    end
    visited[(sourceX + sourceY * self.width) + 1] = true
    local q = NodeQueue.new()
    local s = Node.new(sourceX, sourceY, 0)
    q:push(s)
    while not q:empty() do
        local curr = q:front()
        if curr.x == destinationX and curr.y == destinationY then
            return curr.distance
        end
        q:pop()
        do
            local i = 0
            while i < 4 do
                local row = curr.x + ____exports.Maze.ROW_NUM[i + 1]
                local col = curr.y + ____exports.Maze.COL_NUM[i + 1]
                if self:isValid(row, col) and self.maze[row + 1][col + 1] == ____exports.Walkable.Walkable and visited[(row + col * self.width) + 1] == false then
                    visited[(row + col * self.width) + 1] = true
                    q:push(
                        Node.new(row, col, curr.distance + 1)
                    )
                end
                i = i + 1
            end
        end
    end
    return -1
end
function Maze.prototype.isValid(self, row, col)
    return (row >= 0 and row < self.width and col >= 0 and col < self.height)
end
function Maze.prototype.Cleanup(self, x, y)
    if self.maze[x + 1][y + 1] == ____exports.Walkable.Protected then
        self:setWalkable(x, y, ____exports.Walkable.Walkable)
    end
end
function Maze.prototype.CleanAll(self)
    for ____, antijuggle in ipairs(self.antiJugglers) do
        antijuggle:EndOfRoundAction()
    end
    self.antiJugglers = {}
    do
        local x = 0
        while x < self.width do
            do
                local y = 0
                while y < self.height do
                    self:Cleanup(x, y)
                    y = y + 1
                end
            end
            x = x + 1
        end
    end
end
function Maze.prototype.SanityCheck(self)
    do
        local x = 0
        while x < self.width do
            do
                local y = 0
                while y < self.height do
                    local cornerX = (x * 64) + self.minX
                    local cornerY = y * 64 + self.minY
                    if IsTerrainPathable(cornerX, cornerY, PATHING_TYPE_WALKABILITY) == (self.maze[x + 1][y + 1] == ____exports.Walkable.Walkable) or IsTerrainPathable(cornerX, cornerY + 32, PATHING_TYPE_WALKABILITY) == (self.maze[x + 1][y + 1] == ____exports.Walkable.Walkable) or IsTerrainPathable(cornerX + 32, cornerY, PATHING_TYPE_WALKABILITY) == (self.maze[x + 1][y + 1] == ____exports.Walkable.Walkable) or IsTerrainPathable(cornerX + 32, cornerY + 32, PATHING_TYPE_WALKABILITY) == (self.maze[x + 1][y + 1] == ____exports.Walkable.Walkable) then
                        Log.Error(
                            tostring(x) .. ", " .. tostring(y) .. " is a missmatch"
                        )
                    end
                    y = y + 1
                end
            end
            x = x + 1
        end
    end
end
function Maze.prototype.CheckAll(self)
    do
        local x = 0
        while x < self.width do
            do
                local y = 0
                while y < self.height do
                    local cornerX = (x * 64) + self.minX
                    local cornerY = y * 64 + self.minY
                    if IsTerrainPathable(cornerX, cornerY, PATHING_TYPE_WALKABILITY) or IsTerrainPathable(cornerX, cornerY + 32, PATHING_TYPE_WALKABILITY) or IsTerrainPathable(cornerX + 32, cornerY, PATHING_TYPE_WALKABILITY) or IsTerrainPathable(cornerX + 32, cornerY + 32, PATHING_TYPE_WALKABILITY) then
                        Log.Debug(
                            tostring(x) .. ", " .. tostring(y) .. " is a unwalkable"
                        )
                    end
                    y = y + 1
                end
            end
            x = x + 1
        end
    end
end
function Maze.prototype.AddAntiJuggler(self, antijuggle)
    __TS__ArrayPush(self.antiJugglers, antijuggle)
end
Maze.ROW_NUM = {-1, 0, 0, 1}
Maze.COL_NUM = {0, -1, 1, 0}
return ____exports
