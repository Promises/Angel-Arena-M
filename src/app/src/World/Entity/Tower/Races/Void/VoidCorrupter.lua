--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.VoidCorrupter = {}
local VoidCorrupter = ____exports.VoidCorrupter
VoidCorrupter.name = "VoidCorrupter"
VoidCorrupter.__index = VoidCorrupter
VoidCorrupter.prototype = {}
VoidCorrupter.prototype.__index = __TS__Index(VoidCorrupter.prototype)
VoidCorrupter.prototype.__newindex = __TS__NewIndex(VoidCorrupter.prototype)
VoidCorrupter.prototype.constructor = VoidCorrupter
VoidCorrupter.____super = Tower
setmetatable(VoidCorrupter, VoidCorrupter.____super)
setmetatable(VoidCorrupter.prototype, VoidCorrupter.____super.prototype)
function VoidCorrupter.new(...)
    local self = setmetatable({}, VoidCorrupter.prototype)
    self:____constructor(...)
    return self
end
function VoidCorrupter.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    local target = self.game.gameDamageEngineGlobals.udg_DamageEventTarget
    if u == self.tower and target then
        BlzSetUnitArmor(
            target,
            BlzGetUnitArmor(target) - 0.25
        )
    end
end
function VoidCorrupter.prototype.KillingAction(self)
    if GetKillingUnitBJ() == self.tower then
        CreateTextTagUnitBJ("TRIGSTR_7925", self.tower, 0, 10, 100, 100, 100, 0)
        SetTextTagVelocityBJ(
            GetLastCreatedTextTag(),
            40,
            90
        )
        SetTextTagPermanentBJ(
            GetLastCreatedTextTag(),
            false
        )
        SetTextTagLifespanBJ(
            GetLastCreatedTextTag(),
            4
        )
        SetTextTagFadepointBJ(
            GetLastCreatedTextTag(),
            2
        )
        self.owner:SetVoidFragments(
            self.owner:GetVoidFragments() + 5
        )
        if self.owner:getVoidBuilder() then
            SetUnitManaBJ(
                self.owner:getVoidBuilder(),
                self.owner:GetVoidFragments()
            )
        end
    end
end
return ____exports
