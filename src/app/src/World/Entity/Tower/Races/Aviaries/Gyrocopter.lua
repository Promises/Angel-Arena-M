--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Gyrocopter = {}
local Gyrocopter = ____exports.Gyrocopter
Gyrocopter.name = "Gyrocopter"
Gyrocopter.__index = Gyrocopter
Gyrocopter.prototype = {}
Gyrocopter.prototype.__index = __TS__Index(Gyrocopter.prototype)
Gyrocopter.prototype.__newindex = __TS__NewIndex(Gyrocopter.prototype)
Gyrocopter.prototype.constructor = Gyrocopter
Gyrocopter.____super = Tower
setmetatable(Gyrocopter, Gyrocopter.____super)
setmetatable(Gyrocopter.prototype, Gyrocopter.____super.prototype)
function Gyrocopter.new(...)
    local self = setmetatable({}, Gyrocopter.prototype)
    self:____constructor(...)
    return self
end
function Gyrocopter.prototype.GenericAttack(self)
    IssueTargetOrderBJ(
        GetAttacker(),
        "chainlightning",
        GetAttackedUnitBJ()
    )
end
return ____exports
