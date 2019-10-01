--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.GeneratedRound = {}
local GeneratedRound = ____exports.GeneratedRound
GeneratedRound.name = "GeneratedRound"
GeneratedRound.__index = GeneratedRound
GeneratedRound.prototype = {}
GeneratedRound.prototype.__index = GeneratedRound.prototype
GeneratedRound.prototype.constructor = GeneratedRound
function GeneratedRound.new(...)
    local self = setmetatable({}, GeneratedRound.prototype)
    self:____constructor(...)
    return self
end
function GeneratedRound.prototype.____constructor(self, game, wave, waveStrength)
    self.mobCount = 20
    self.isAir = false
    self.isChampion = false
    self.moveSpeed = 0
    self.hpRegen = 0
    self.armor = 0
    self.armorType = 0
    self.hitPoints = 0
    self.game = game
    self.wave = wave
    self.waveStrength = waveStrength
    self:GenerateWave()
end
function GeneratedRound.prototype.GenerateWave(self)
    if Util:RandomInt(1, 100) < 20 then
        self.isAir = true
    else
        self.isAir = false
    end
    if not self.isAir then
        if Util:RandomInt(1, 100) > 20 then
            self.mobCount = 20
            self.isChampion = false
        else
            self.mobCount = 8
            self.isChampion = true
        end
    else
        self.mobCount = 20
        self.isChampion = false
    end
    if not self.isAir then
        if self.wave < 10 then
            self.moveSpeed = Util:RandomInt(170, 215)
        else
            self.moveSpeed = Util:RandomInt(200, 330)
        end
    else
        if self.wave < 10 then
            self.moveSpeed = Util:RandomInt(350, 400)
        else
            self.moveSpeed = Util:RandomInt(380, 500)
        end
    end
    self.hpRegen = Util:RandomInt(0, 3) * self.wave
    self.armor = math.ceil(self.wave / 10) * 3 + Util:RandomInt(0, 1)
    if self.isChampion then
        self.armor = self.armor * 2
    end
    self.armorType = Util:RandomInt(0, 4)
    local damageReduction = (self.armor * 0.06) / (1 + self.armor * 0.06)
    self.hitPoints = (1 - damageReduction) * self.waveStrength / (self.moveSpeed * self.mobCount)
end
return ____exports
