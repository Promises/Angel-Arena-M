--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.SeaGiant = {}
local SeaGiant = ____exports.SeaGiant
SeaGiant.name = "SeaGiant"
SeaGiant.__index = SeaGiant
SeaGiant.prototype = {}
SeaGiant.prototype.__index = __TS__Index(SeaGiant.prototype)
SeaGiant.prototype.__newindex = __TS__NewIndex(SeaGiant.prototype)
SeaGiant.prototype.constructor = SeaGiant
SeaGiant.____super = Tower
setmetatable(SeaGiant, SeaGiant.____super)
setmetatable(SeaGiant.prototype, SeaGiant.____super.prototype)
function SeaGiant.new(...)
    local self = setmetatable({}, SeaGiant.prototype)
    self:____constructor(...)
    return self
end
function SeaGiant.prototype.KillingAction(self)
    local u = GetKillingUnitBJ()
    local target = GetDyingUnit()
    if u == self.tower and target then
        local x = GetUnitX(target)
        local y = GetUnitY(target)
        local rand = Util:RandomInt(0, 359)
        local dummyOne = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            x + 10 * CosBJ(rand + 45),
            y + 10 * SinBJ(rand + 45),
            0
        )
        local dummyTwo = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            x + 10 * CosBJ(rand + 135),
            y + 10 * SinBJ(rand + 135),
            0
        )
        local dummyThree = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            x + 10 * CosBJ(rand + 225),
            y + 10 * SinBJ(rand + 225),
            0
        )
        local dummyFour = CreateUnit(
            self.owner.wcPlayer,
            FourCC("u008"),
            x + 10 * CosBJ(rand + 315),
            y + 10 * SinBJ(rand + 315),
            0
        )
        UnitApplyTimedLifeBJ(
            1,
            FourCC("BTLF"),
            dummyOne
        )
        UnitApplyTimedLifeBJ(
            1,
            FourCC("BTLF"),
            dummyTwo
        )
        UnitApplyTimedLifeBJ(
            1,
            FourCC("BTLF"),
            dummyThree
        )
        UnitApplyTimedLifeBJ(
            1,
            FourCC("BTLF"),
            dummyFour
        )
        UnitAddAbilityBJ(
            FourCC("A03T"),
            dummyOne
        )
        UnitAddAbilityBJ(
            FourCC("A03T"),
            dummyTwo
        )
        UnitAddAbilityBJ(
            FourCC("A03T"),
            dummyThree
        )
        UnitAddAbilityBJ(
            FourCC("A03T"),
            dummyFour
        )
        IssuePointOrder(
            dummyOne,
            "carrionswarm",
            x + 150 * CosBJ(rand + 45),
            y + 150 * SinBJ(rand + 45)
        )
        IssuePointOrder(
            dummyTwo,
            "carrionswarm",
            x + 150 * CosBJ(rand + 135),
            y + 150 * SinBJ(rand + 135)
        )
        IssuePointOrder(
            dummyThree,
            "carrionswarm",
            x + 150 * CosBJ(rand + 225),
            y + 150 * SinBJ(rand + 225)
        )
        IssuePointOrder(
            dummyFour,
            "carrionswarm",
            x + 150 * CosBJ(rand + 315),
            y + 150 * SinBJ(rand + 315)
        )
    end
end
return ____exports
