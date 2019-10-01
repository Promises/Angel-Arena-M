--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.GoblinMineLayer = {}
local GoblinMineLayer = ____exports.GoblinMineLayer
GoblinMineLayer.name = "GoblinMineLayer"
GoblinMineLayer.__index = GoblinMineLayer
GoblinMineLayer.prototype = {}
GoblinMineLayer.prototype.__index = __TS__Index(GoblinMineLayer.prototype)
GoblinMineLayer.prototype.__newindex = __TS__NewIndex(GoblinMineLayer.prototype)
GoblinMineLayer.prototype.constructor = GoblinMineLayer
GoblinMineLayer.____super = Tower
setmetatable(GoblinMineLayer, GoblinMineLayer.____super)
setmetatable(GoblinMineLayer.prototype, GoblinMineLayer.____super.prototype)
function GoblinMineLayer.new(...)
    local self = setmetatable({}, GoblinMineLayer.prototype)
    self:____constructor(...)
    return self
end
function GoblinMineLayer.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if u == self.tower and target then
        if not (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) >= 15) then
            return
        end
        local mine = CreateUnit(
            self.owner.wcPlayer,
            FourCC("h013"),
            GetUnitX(target),
            GetUnitY(target),
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            2,
            FourCC("BTLF"),
            mine
        )
        SetUnitManaBJ(
            self.tower,
            (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) - 15)
        )
    end
end
return ____exports
