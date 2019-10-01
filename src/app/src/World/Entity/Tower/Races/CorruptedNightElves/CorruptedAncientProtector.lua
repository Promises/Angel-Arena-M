--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.CorruptedAncientProtector = {}
local CorruptedAncientProtector = ____exports.CorruptedAncientProtector
CorruptedAncientProtector.name = "CorruptedAncientProtector"
CorruptedAncientProtector.__index = CorruptedAncientProtector
CorruptedAncientProtector.prototype = {}
CorruptedAncientProtector.prototype.__index = __TS__Index(CorruptedAncientProtector.prototype)
CorruptedAncientProtector.prototype.__newindex = __TS__NewIndex(CorruptedAncientProtector.prototype)
CorruptedAncientProtector.prototype.constructor = CorruptedAncientProtector
CorruptedAncientProtector.____super = Tower
setmetatable(CorruptedAncientProtector, CorruptedAncientProtector.____super)
setmetatable(CorruptedAncientProtector.prototype, CorruptedAncientProtector.____super.prototype)
function CorruptedAncientProtector.new(...)
    local self = setmetatable({}, CorruptedAncientProtector.prototype)
    self:____constructor(...)
    return self
end
function CorruptedAncientProtector.prototype.Action(self)
    if self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.isWaveInProgress then
        local y = GetUnitY(self.tower)
        local x = GetUnitX(self.tower)
        local dummy = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            x,
            y,
            0
        )
        UnitApplyTimedLifeBJ(
            11,
            FourCC("BTLF"),
            dummy
        )
        UnitAddAbilityBJ(
            FourCC("A010"),
            dummy
        )
        IssueImmediateOrderBJ(dummy, "starfall")
    end
end
function CorruptedAncientProtector.prototype.GetTickModulo(self)
    return 300
end
return ____exports
