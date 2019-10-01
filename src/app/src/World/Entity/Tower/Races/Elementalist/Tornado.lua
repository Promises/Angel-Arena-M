--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Tornado = {}
local Tornado = ____exports.Tornado
Tornado.name = "Tornado"
Tornado.__index = Tornado
Tornado.prototype = {}
Tornado.prototype.__index = __TS__Index(Tornado.prototype)
Tornado.prototype.__newindex = __TS__NewIndex(Tornado.prototype)
Tornado.prototype.constructor = Tornado
Tornado.____super = Tower
setmetatable(Tornado, Tornado.____super)
setmetatable(Tornado.prototype, Tornado.____super.prototype)
function Tornado.new(...)
    local self = setmetatable({}, Tornado.prototype)
    self:____constructor(...)
    return self
end
function Tornado.prototype.EndOfRoundAction(self)
    if GetUnitAbilityLevel(
        self.tower,
        FourCC("A0E0")
    ) > 0 then
        UnitRemoveAbility(
            self.tower,
            FourCC("A0E0")
        )
        UnitAddAbility(
            self.tower,
            FourCC("A0E1")
        )
        UnitAddAbility(
            self.tower,
            FourCC("A0E2")
        )
    else
        UnitRemoveAbility(
            self.tower,
            FourCC("A0E1")
        )
        UnitRemoveAbility(
            self.tower,
            FourCC("A0E2")
        )
        UnitAddAbility(
            self.tower,
            FourCC("A0E0")
        )
    end
end
return ____exports
