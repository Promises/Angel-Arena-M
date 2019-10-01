--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Buff = require("app.src.World.Entity.Buff.Specs.Buff")
local Buff = ____Buff.Buff
____exports.SoulCollector = {}
local SoulCollector = ____exports.SoulCollector
SoulCollector.name = "SoulCollector"
SoulCollector.__index = SoulCollector
SoulCollector.prototype = {}
SoulCollector.prototype.__index = __TS__Index(SoulCollector.prototype)
SoulCollector.prototype.constructor = SoulCollector
SoulCollector.____super = Buff
setmetatable(SoulCollector, SoulCollector.____super)
setmetatable(SoulCollector.prototype, SoulCollector.____super.prototype)
function SoulCollector.new(...)
    local self = setmetatable({}, SoulCollector.prototype)
    self:____constructor(...)
    return self
end
function SoulCollector.prototype.____constructor(self, game)
    Buff.prototype.____constructor(self, "B02Q", game)
end
function SoulCollector.prototype.AttackAction(self)
    local target = self.damageEngineGlobals.udg_DamageEventTarget
    local source = self.damageEngineGlobals.udg_DamageEventSource
    if not target then
        return
    end
    if not self:Condition(target) then
        return
    end
    if self.damageEngineGlobals.udg_DamageEventAmount < GetUnitStateSwap(UNIT_STATE_LIFE, target) then
        return
    end
    if not self.damageEngineGlobals.udg_DamageEventSource then
        return
    end
    if source then
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(source)
            )
        )
        if owner then
            __TS__ArrayForEach(
                owner.towersArray,
                function(____, tower)
                    if tower:GetTypeID() == FourCC("oC7C") then
                        SetUnitManaBJ(
                            tower.tower,
                            GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) + 1
                        )
                    end
                    if GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) % 10 == 0 then
                        SetUnitAbilityLevel(
                            tower.tower,
                            FourCC("A0F6"),
                            GetUnitStateSwap(UNIT_STATE_MANA, tower.tower) / 10
                        )
                    end
                end
            )
        end
    end
end
return ____exports
