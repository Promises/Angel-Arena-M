--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Wyvern = {}
local Wyvern = ____exports.Wyvern
Wyvern.name = "Wyvern"
Wyvern.__index = Wyvern
Wyvern.prototype = {}
Wyvern.prototype.__index = __TS__Index(Wyvern.prototype)
Wyvern.prototype.__newindex = __TS__NewIndex(Wyvern.prototype)
Wyvern.prototype.constructor = Wyvern
Wyvern.____super = Tower
setmetatable(Wyvern, Wyvern.____super)
setmetatable(Wyvern.prototype, Wyvern.____super.prototype)
function Wyvern.new(...)
    local self = setmetatable({}, Wyvern.prototype)
    self:____constructor(...)
    return self
end
function Wyvern.prototype.AttackAction(self)
    if self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.currentWave + 1 == 35 then
        return
    end
    if self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.currentWave + 1 == 36 then
        return
    end
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if u == self.tower then
        local loc = GetUnitLoc(self.tower)
        local grp = GetUnitsInRangeOfLocAll(128, loc)
        ForGroupBJ(
            grp,
            function() return self:AttackGroup() end
        )
        DestroyGroup(grp)
        RemoveLocation(loc)
    end
end
function Wyvern.prototype.AttackGroup(self)
    if GetPlayerId(
        GetOwningPlayer(
            GetEnumUnit()
        )
    ) > COLOUR.NAVY then
        SetUnitLifeBJ(
            GetEnumUnit(),
            RMaxBJ(
                1,
                GetUnitStateSwap(
                    UNIT_STATE_LIFE,
                    GetEnumUnit()
                ) * 0.85
            )
        )
        DestroyEffect(
            AddSpecialEffectTargetUnitBJ(
                "origin",
                GetEnumUnit(),
                "Abilities\\Spells\\Orc\\LightningShield\\LightningShieldTarget.mdl"
            )
        )
    end
end
return ____exports
