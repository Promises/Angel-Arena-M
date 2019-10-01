--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.IronGolemStatue = {}
local IronGolemStatue = ____exports.IronGolemStatue
IronGolemStatue.name = "IronGolemStatue"
IronGolemStatue.__index = IronGolemStatue
IronGolemStatue.prototype = {}
IronGolemStatue.prototype.__index = __TS__Index(IronGolemStatue.prototype)
IronGolemStatue.prototype.__newindex = __TS__NewIndex(IronGolemStatue.prototype)
IronGolemStatue.prototype.constructor = IronGolemStatue
IronGolemStatue.____super = Tower
setmetatable(IronGolemStatue, IronGolemStatue.____super)
setmetatable(IronGolemStatue.prototype, IronGolemStatue.____super.prototype)
function IronGolemStatue.new(...)
    local self = setmetatable({}, IronGolemStatue.prototype)
    self:____constructor(...)
    return self
end
function IronGolemStatue.prototype.Action(self)
    if self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.isWaveInProgress then
        local y = GetUnitY(self.tower)
        local x = GetUnitX(self.tower)
        local impalers = {}
        __TS__ArrayPush(
            impalers,
            CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x + 100 * CosBJ(135),
                y + 100 * SinBJ(135),
                0
            )
        )
        __TS__ArrayPush(
            impalers,
            CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x + 100 * CosBJ(225),
                y + 100 * SinBJ(225),
                0
            )
        )
        __TS__ArrayPush(
            impalers,
            CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x + 100 * CosBJ(315),
                y + 100 * SinBJ(315),
                0
            )
        )
        __TS__ArrayPush(
            impalers,
            CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x + 100 * CosBJ(45),
                y + 100 * SinBJ(45),
                0
            )
        )
        __TS__ArrayPush(
            impalers,
            CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x + 100 * CosBJ(0),
                y + 100 * SinBJ(0),
                0
            )
        )
        __TS__ArrayPush(
            impalers,
            CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x + 100 * CosBJ(90),
                y + 100 * SinBJ(90),
                0
            )
        )
        __TS__ArrayPush(
            impalers,
            CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x + 100 * CosBJ(180),
                y + 100 * SinBJ(180),
                0
            )
        )
        __TS__ArrayPush(
            impalers,
            CreateUnit(
                self.owner.wcPlayer,
                FourCC("u008"),
                x + 100 * CosBJ(270),
                y + 100 * SinBJ(270),
                0
            )
        )
        __TS__ArrayForEach(
            impalers,
            function(____, impaler)
                UnitApplyTimedLifeBJ(
                    1,
                    FourCC("BTLF"),
                    impaler
                )
                UnitAddAbilityBJ(
                    FourCC("A030"),
                    impaler
                )
            end
        )
        IssuePointOrder(
            impalers[1],
            "impale",
            x + 150 * CosBJ(45),
            y + 150 * SinBJ(45)
        )
        IssuePointOrder(
            impalers[2],
            "impale",
            x + 150 * CosBJ(135),
            y + 150 * SinBJ(135)
        )
        IssuePointOrder(
            impalers[3],
            "impale",
            x + 150 * CosBJ(225),
            y + 150 * SinBJ(225)
        )
        IssuePointOrder(
            impalers[4],
            "impale",
            x + 150 * CosBJ(315),
            y + 150 * SinBJ(315)
        )
        IssuePointOrder(
            impalers[5],
            "impale",
            x + 150 * CosBJ(0),
            y + 150 * SinBJ(0)
        )
        IssuePointOrder(
            impalers[6],
            "impale",
            x + 150 * CosBJ(90),
            y + 150 * SinBJ(90)
        )
        IssuePointOrder(
            impalers[7],
            "impale",
            x + 150 * CosBJ(180),
            y + 150 * SinBJ(180)
        )
        IssuePointOrder(
            impalers[8],
            "impale",
            x + 150 * CosBJ(270),
            y + 150 * SinBJ(270)
        )
    end
end
function IronGolemStatue.prototype.GetTickModulo(self)
    return 49
end
return ____exports
