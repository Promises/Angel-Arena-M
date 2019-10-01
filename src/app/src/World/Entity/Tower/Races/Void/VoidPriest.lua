--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.VoidPriest = {}
local VoidPriest = ____exports.VoidPriest
VoidPriest.name = "VoidPriest"
VoidPriest.__index = VoidPriest
VoidPriest.prototype = {}
VoidPriest.prototype.__index = __TS__Index(VoidPriest.prototype)
VoidPriest.prototype.__newindex = __TS__NewIndex(VoidPriest.prototype)
VoidPriest.prototype.constructor = VoidPriest
VoidPriest.____super = Tower
setmetatable(VoidPriest, VoidPriest.____super)
setmetatable(VoidPriest.prototype, VoidPriest.____super.prototype)
function VoidPriest.new(...)
    local self = setmetatable({}, VoidPriest.prototype)
    self:____constructor(...)
    return self
end
function VoidPriest.prototype.GenericAttack(self)
    IssueTargetOrderBJ(
        GetAttacker(),
        "frostnova",
        GetAttackedUnitBJ()
    )
end
return ____exports
