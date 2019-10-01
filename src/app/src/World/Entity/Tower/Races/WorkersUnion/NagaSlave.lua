--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.NagaSlave = {}
local NagaSlave = ____exports.NagaSlave
NagaSlave.name = "NagaSlave"
NagaSlave.__index = NagaSlave
NagaSlave.prototype = {}
NagaSlave.prototype.__index = __TS__Index(NagaSlave.prototype)
NagaSlave.prototype.__newindex = __TS__NewIndex(NagaSlave.prototype)
NagaSlave.prototype.constructor = NagaSlave
NagaSlave.____super = Tower
setmetatable(NagaSlave, NagaSlave.____super)
setmetatable(NagaSlave.prototype, NagaSlave.____super.prototype)
function NagaSlave.new(...)
    local self = setmetatable({}, NagaSlave.prototype)
    self:____constructor(...)
    return self
end
function NagaSlave.prototype.AttackAction(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if u == self.tower then
        if not (GetUnitAbilityLevel(
            self.tower,
            FourCC("A09U")
        ) > 0) then
            return
        end
        BlzSetUnitBaseDamage(
            self.tower,
            BlzGetUnitBaseDamage(self.tower, 0) + 20,
            0
        )
        self:DoSpell(self.game)
    end
end
function NagaSlave.prototype.DoSpell(self, game)
    local randomInt = Util:RandomInt(1, 4)
    local target = game.gameDamageEngineGlobals.udg_DamageEventTarget
    if not target then
        return
    end
    if randomInt == 1 or randomInt == 2 then
        local spellPoint = GetUnitLoc(self.tower)
        local tempUnit = CreateUnitAtLocSaveLast(
            self.owner.wcPlayer,
            FourCC("u008"),
            spellPoint,
            bj_UNIT_FACING
        )
        UnitApplyTimedLifeBJ(
            3,
            FourCC("BTLF"),
            tempUnit
        )
        if randomInt == 1 then
            UnitAddAbilityBJ(
                FourCC("A09W"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "thunderbolt", target)
        else
            UnitAddAbilityBJ(
                FourCC("A09X"),
                tempUnit
            )
            IssueTargetOrderBJ(tempUnit, "forkedlightning", target)
        end
        RemoveLocation(spellPoint)
    end
end
function NagaSlave.prototype.EndOfRoundAction(self)
    BlzSetUnitBaseDamage(self.tower, 19, 0)
end
return ____exports
