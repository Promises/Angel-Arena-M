--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____Defender = require("app.src.World.Entity.Players.Defender")
local Defender = ____Defender.Defender
local ____TimedEvent = require("app.src.lib.WCEventQueue.TimedEvent")
local TimedEvent = ____TimedEvent.TimedEvent
local ____HologramCheckpointDistance = require("app.src.World.Holograms.HologramCheckpointDistance")
local HologramCheckpointDistance = ____HologramCheckpointDistance.HologramCheckpointDistance
____exports.DummyPlayer = {}
local DummyPlayer = ____exports.DummyPlayer
DummyPlayer.name = "DummyPlayer"
DummyPlayer.__index = DummyPlayer
DummyPlayer.prototype = {}
DummyPlayer.prototype.__index = DummyPlayer.prototype
DummyPlayer.prototype.constructor = DummyPlayer
function DummyPlayer.new(...)
    local self = setmetatable({}, DummyPlayer.prototype)
    self:____constructor(...)
    return self
end
function DummyPlayer.prototype.____constructor(self, game, slot)
    self.step = 0
    self.towers = {
        FourCC("h00L"),
        FourCC("h02V"),
        FourCC("o012"),
        FourCC("o006"),
        FourCC("o013"),
        FourCC("o008")
    }
    self.currentIndx = 0
    self.game = game
    self.slot = slot
    self:Setup()
end
function DummyPlayer.prototype.Setup(self)
    local dummyPlayer = Defender.new(self.slot, self.game)
    self.player = dummyPlayer
    self.game.players:set(self.slot, dummyPlayer)
    self.game.worldMap.playerSpawns[self.slot + 1].isOpen = true
    self.game.timedEventQueue:AddEvent(
        TimedEvent.new(
            function() return self:ConstructTowers() end,
            10,
            false
        )
    )
    self.step = 0
    return true
end
function DummyPlayer.prototype.ConstructTowers(self)
    if self:CreateTowersForPlayer() then
        self.game.timedEventQueue:AddEvent(
            TimedEvent.new(
                function() return self:Leave() end,
                150,
                false
            )
        )
        return true
    end
    return false
end
function DummyPlayer.prototype.Leave(self)
    if not self.player then
        self:Setup()
        return false
    end
    self.player:PlayerLeftTheGame()
    self.game.timedEventQueue:AddEvent(
        TimedEvent.new(
            function() return self:Setup() end,
            150,
            true
        )
    )
    return true
end
function DummyPlayer.prototype.GetTower(self)
    self.currentIndx = self.currentIndx + 1
    if self.currentIndx == #self.game.worldMap.towerConstruction.towerTypes:GetArray() then
        self.currentIndx = 0
    end
    return self.game.worldMap.towerConstruction.towerTypes:GetArray()[self.currentIndx + 1]
end
function DummyPlayer.prototype.CreateTowersForPlayer(self)
    if not self.player then
        return true
    end
    local firstSpawn = self.game.worldMap.playerSpawns[self.player.id + 1].spawnOne
    if firstSpawn == nil then
        return true
    end
    local firstCheckpoint = firstSpawn.next
    if firstCheckpoint == nil then
        return true
    end
    local secondCheckpoint = firstCheckpoint.next
    if secondCheckpoint == nil then
        return true
    end
    local firstCheckpointX = GetRectCenterX(firstCheckpoint.rectangle)
    local firstCheckpointY = GetRectCenterY(firstCheckpoint.rectangle)
    local secondCheckpointX = GetRectCenterX(secondCheckpoint.rectangle)
    local secondCheckpointY = GetRectCenterY(secondCheckpoint.rectangle)
    local dist = HologramCheckpointDistance.new(secondCheckpointX - firstCheckpointX, secondCheckpointY - firstCheckpointY)
    self.step = self.step + 1
    if self.step == 1 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX + dist.yDividedBy9,
                firstCheckpointY + dist.xDividedBy9,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 2 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX + dist.xDividedBy9,
                firstCheckpointY + dist.yDividedBy9,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 3 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX - dist.yDividedBy9,
                firstCheckpointY - dist.xDividedBy9,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 4 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX - dist.xDividedBy9 - dist.yDividedBy18,
                firstCheckpointY - dist.yDividedBy9 - dist.xDividedBy18,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 5 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX - dist.xDividedBy9 - dist.xDividedBy18 + dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY - dist.yDividedBy9 - dist.yDividedBy18 + dist.xDividedBy9 - dist.xDividedBy18,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 6 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX - dist.xDividedBy9 - dist.xDividedBy18 + 2 * dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY - dist.yDividedBy9 - dist.yDividedBy18 + 2 * dist.xDividedBy9 - dist.xDividedBy18,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 7 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX - dist.xDividedBy18 + 3 * dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY - dist.yDividedBy18 + 3 * dist.xDividedBy9 - dist.xDividedBy18,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 8 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX + dist.xDividedBy18 + 3 * dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY + dist.yDividedBy18 + 3 * dist.xDividedBy9 - dist.xDividedBy18,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 9 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX + dist.xDividedBy9 + dist.xDividedBy18 + 2 * dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY + dist.yDividedBy9 + dist.yDividedBy18 + 2 * dist.xDividedBy9 - dist.xDividedBy18,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 10 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX + 2 * dist.xDividedBy9 + dist.xDividedBy18 + dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY + 2 * dist.yDividedBy9 + dist.yDividedBy18 + dist.xDividedBy9 - dist.xDividedBy18,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 11 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX + 2 * dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy18,
                firstCheckpointY + 2 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy18,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 12 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX + dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY + dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9 - dist.xDividedBy18,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 13 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX + dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY + dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 14 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX - dist.xDividedBy9 + dist.xDividedBy18 - 2 * dist.yDividedBy9 - dist.yDividedBy18,
                firstCheckpointY - dist.yDividedBy9 + dist.yDividedBy18 - 2 * dist.xDividedBy9 - dist.xDividedBy18,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 15 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX - 2 * dist.xDividedBy9 + dist.xDividedBy18 - 2 * dist.yDividedBy9,
                firstCheckpointY - 2 * dist.yDividedBy9 + dist.yDividedBy18 - 2 * dist.xDividedBy9,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 16 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX - 3 * dist.xDividedBy9 + dist.xDividedBy18 - dist.yDividedBy9,
                firstCheckpointY - 3 * dist.yDividedBy9 + dist.yDividedBy18 - dist.xDividedBy9,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 17 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX - 3 * dist.xDividedBy9,
                firstCheckpointY - 3 * dist.yDividedBy9,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 18 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX - 3 * dist.xDividedBy9 + dist.yDividedBy9,
                firstCheckpointY - 3 * dist.yDividedBy9 + dist.xDividedBy9,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 19 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX - 3 * dist.xDividedBy9 + 2 * dist.yDividedBy9,
                firstCheckpointY - 3 * dist.yDividedBy9 + 2 * dist.xDividedBy9,
                bj_UNIT_FACING
            ),
            self.player
        )
        return false
    end
    if self.step == 20 then
        self.game.worldMap.towerConstruction:SetupTower(
            CreateUnit(
                self.player.wcPlayer,
                self:GetTower(),
                firstCheckpointX - 2 * dist.xDividedBy9 + 3 * dist.yDividedBy9,
                firstCheckpointY - 2 * dist.yDividedBy9 + 3 * dist.xDividedBy9,
                0
            ),
            self.player
        )
        return false
    end
    return true
end
return ____exports
