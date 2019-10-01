--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
____exports.Creep = {}
local Creep = ____exports.Creep
Creep.name = "Creep"
Creep.__index = Creep
Creep.prototype = {}
Creep.prototype.__index = Creep.prototype
Creep.prototype.constructor = Creep
function Creep.new(...)
    local self = setmetatable({}, Creep.prototype)
    self:____constructor(...)
    return self
end
function Creep.prototype.____constructor(self, creep, gameRound, abilities, game)
    self.creep = creep
    self.gameRound = gameRound
    self.game = game
    self:AddArmorBonusByDifficulty()
    self:AddHPBonusByDifficulty()
    self.abilities = abilities
end
function Creep.prototype.ReapplyMovement(self)
    if not self.targetCheckpoint then
        Log.Fatal("Creep is missing pathing data")
        return
    end
    IssuePointOrder(
        self.creep,
        "move",
        GetRectCenterX(self.targetCheckpoint.rectangle),
        GetRectCenterY(self.targetCheckpoint.rectangle)
    )
end
function Creep.prototype.printId(self)
end
function Creep.prototype.getName(self)
    return GetUnitName(self.creep)
end
function Creep.prototype.getTypeId(self)
    return GetUnitTypeId(self.creep)
end
function Creep.prototype.getHandleId(self)
    return GetHandleIdBJ(self.creep)
end
function Creep.prototype.getLocation(self)
    return GetUnitLoc(self.creep)
end
function Creep.prototype.morningPerson(self)
    local mdlFile = "Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdl"
    DestroyEffect(
        AddSpecialEffect(
            mdlFile,
            GetUnitX(self.creep),
            GetUnitY(self.creep)
        )
    )
    SetUnitLifePercentBJ(
        GetEnteringUnit(),
        GetUnitLifePercent(self.creep) + 0.5 * self.gameRound.currentWave
    )
end
function Creep.prototype.AddCreepAbilities(self)
    for ____, ability in ipairs(self.abilities) do
        ability:AddAbilityToCreep(self)
    end
end
function Creep.prototype.AddArmorBonusByDifficulty(self)
    local unitArmorScaling = math.floor(
        BlzGetUnitArmor(self.creep) * (self.game.diffVote.difficulty / 100) + 0.5
    )
    BlzSetUnitArmor(self.creep, unitArmorScaling)
end
function Creep.prototype.AddHPBonusByDifficulty(self)
    local unitHPScaling = math.floor(
        BlzGetUnitMaxHP(self.creep) * (self.game.diffVote.difficulty / 100) + 0.5
    )
    BlzSetUnitMaxHP(self.creep, unitHPScaling)
    SetUnitLifeBJ(self.creep, unitHPScaling)
end
return ____exports
