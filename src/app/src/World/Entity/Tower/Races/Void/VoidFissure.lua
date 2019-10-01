--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.VoidFissure = {}
local VoidFissure = ____exports.VoidFissure
VoidFissure.name = "VoidFissure"
VoidFissure.__index = VoidFissure
VoidFissure.prototype = {}
VoidFissure.prototype.__index = __TS__Index(VoidFissure.prototype)
VoidFissure.prototype.__newindex = __TS__NewIndex(VoidFissure.prototype)
VoidFissure.prototype.constructor = VoidFissure
VoidFissure.____super = Tower
setmetatable(VoidFissure, VoidFissure.____super)
setmetatable(VoidFissure.prototype, VoidFissure.____super.prototype)
function VoidFissure.new(...)
    local self = setmetatable({}, VoidFissure.prototype)
    self:____constructor(...)
    return self
end
function VoidFissure.prototype.____constructor(self, tower, owner, game)
    Tower.prototype.____constructor(self, tower, owner, game)
    self.owner:SetVoidFragmentTick(
        self.owner:GetVoidFragmentTick() + 50
    )
end
function VoidFissure.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "roar"
    )
end
function VoidFissure.prototype.SellAction(self)
    self.owner:SetVoidFragmentTick(
        self.owner:GetVoidFragmentTick() - 50
    )
end
function VoidFissure.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if u == self.tower and target then
        local rndSpell = Util:RandomInt(1, 4)
        local x = GetUnitX(self.tower)
        local y = GetUnitY(self.tower)
        local dummy = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            x,
            y,
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            3,
            FourCC("BTLF"),
            dummy
        )
        local ____switch6 = rndSpell
        if ____switch6 == 1 then
            goto ____switch6_case_0
        end
        if ____switch6 == 2 then
            goto ____switch6_case_1
        end
        if ____switch6 == 3 then
            goto ____switch6_case_2
        end
        if ____switch6 == 4 then
            goto ____switch6_case_3
        end
        goto ____switch6_end
        ::____switch6_case_0::
        do
            UnitAddAbilityBJ(
                FourCC("A09I"),
                dummy
            )
            IssuePointOrder(dummy, "blizzard", x, y)
            goto ____switch6_end
        end
        ::____switch6_case_1::
        do
            UnitAddAbilityBJ(
                FourCC("A09N"),
                dummy
            )
            IssuePointOrder(dummy, "flamestrike", x, y)
            goto ____switch6_end
        end
        ::____switch6_case_2::
        do
            UnitAddAbilityBJ(
                FourCC("A09K"),
                dummy
            )
            IssuePointOrder(dummy, "monsoon", x, y)
            goto ____switch6_end
        end
        ::____switch6_case_3::
        do
            UnitAddAbilityBJ(
                FourCC("A09J"),
                dummy
            )
            IssuePointOrder(dummy, "rainoffire", x, y)
            goto ____switch6_end
        end
        ::____switch6_end::
    end
end
return ____exports
