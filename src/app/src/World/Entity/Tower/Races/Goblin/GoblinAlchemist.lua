--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.GoblinAlchemist = {}
local GoblinAlchemist = ____exports.GoblinAlchemist
GoblinAlchemist.name = "GoblinAlchemist"
GoblinAlchemist.__index = GoblinAlchemist
GoblinAlchemist.prototype = {}
GoblinAlchemist.prototype.__index = __TS__Index(GoblinAlchemist.prototype)
GoblinAlchemist.prototype.__newindex = __TS__NewIndex(GoblinAlchemist.prototype)
GoblinAlchemist.prototype.constructor = GoblinAlchemist
GoblinAlchemist.____super = Tower
setmetatable(GoblinAlchemist, GoblinAlchemist.____super)
setmetatable(GoblinAlchemist.prototype, GoblinAlchemist.____super.prototype)
function GoblinAlchemist.new(...)
    local self = setmetatable({}, GoblinAlchemist.prototype)
    self:____constructor(...)
    return self
end
function GoblinAlchemist.prototype.GenericAttack(self)
    IssueTargetOrderBJ(
        GetAttacker(),
        "acidbomb",
        GetAttackedUnitBJ()
    )
end
return ____exports
