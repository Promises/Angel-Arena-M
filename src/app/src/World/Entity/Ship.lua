--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____CheckPoint = require("app.src.World.Entity.CheckPoint")
local CheckPoint = ____CheckPoint.CheckPoint
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local Sounds = ____GlobalSettings.Sounds
____exports.Ship = {}
local Ship = ____exports.Ship
Ship.name = "Ship"
Ship.__index = Ship
Ship.prototype = {}
Ship.prototype.__index = __TS__Index(Ship.prototype)
Ship.prototype.__newindex = __TS__NewIndex(Ship.prototype)
Ship.prototype.constructor = Ship
Ship.____super = CheckPoint
setmetatable(Ship, Ship.____super)
setmetatable(Ship.prototype, Ship.____super.prototype)
function Ship.new(...)
    local self = setmetatable({}, Ship.prototype)
    self:____constructor(...)
    return self
end
function Ship.prototype.____constructor(self, ship, worldMap)
    CheckPoint.prototype.____constructor(
        self,
        Rect(-768, -4992, 768, -4800),
        worldMap
    )
    self.destination = Rect(-5440, -5664, -5184, -4864)
    self.ship = ship
    self.worldMap = worldMap
    self.game = self.worldMap.game
end
function Ship.prototype.MoveShip(self)
    IssuePointOrder(
        self.ship,
        "move",
        GetRectCenterX(self.destination),
        GetRectCenterY(self.destination)
    )
end
function Ship.prototype.checkPointAction(self)
    local u = GetEnteringUnit()
    if self.game.gameEnded or not self.game.worldMap.gameRoundHandler then
        return
    end
    if self.game.worldMap.gameRoundHandler.currentWave >= 36 then
        RemoveUnit(u)
    end
    local spawnedCreeps = self.worldMap.spawnedCreeps
    if spawnedCreeps ~= nil then
        local creep = spawnedCreeps.unitMap:get(
            GetHandleIdBJ(
                GetEnteringUnit()
            )
        )
        if creep ~= nil then
            if creep:getTypeId() == FourCC("uC72") then
                SendMessage("Archimonde has boarded the ship! |cFFFF0000YOU LOSE!|r")
                self.game.gameLives = 0
            else
                if self.game.worldMap.waveCreeps[self.game.worldMap.gameRoundHandler.currentWave]:getCreepType() == CREEP_TYPE.CHAMPION then
                    self.game.gameLives = self.game.gameLives - math.ceil(
                        GetUnitLifePercent(creep.creep) / 10
                    )
                else
                    self.game.gameLives = self.game.gameLives - math.ceil(
                        GetUnitLifePercent(creep.creep) / 20
                    )
                end
                if self.game.gameLives <= 0 then
                    self.game.gameLives = 0
                end
                SendMessage(
                    "|c00ff0000A unit has boarded the ship!|r " .. tostring(self.game.gameLives) .. "|c00ff0000% of your lives left|r"
                )
            end
            creep.targetCheckpoint = nil
            spawnedCreeps.unitMap:delete(
                GetHandleIdBJ(
                    GetEnteringUnit()
                )
            )
            RemoveUnit(creep.creep)
            PlaySoundBJ(Sounds.loseALifeSound)
            if self.game.scoreBoard then
                MultiboardSetItemValueBJ(
                    self.game.scoreBoard.board,
                    2,
                    4,
                    tostring(self.game.gameLives) .. "%"
                )
            end
            if self.game.gameLives <= 0 then
                self.game:GameOver()
            end
        end
    end
end
return ____exports
