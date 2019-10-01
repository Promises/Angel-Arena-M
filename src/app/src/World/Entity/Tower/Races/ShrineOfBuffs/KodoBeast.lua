--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.KodoBeast = {}
local KodoBeast = ____exports.KodoBeast
KodoBeast.name = "KodoBeast"
KodoBeast.__index = KodoBeast
KodoBeast.prototype = {}
KodoBeast.prototype.__index = __TS__Index(KodoBeast.prototype)
KodoBeast.prototype.__newindex = __TS__NewIndex(KodoBeast.prototype)
KodoBeast.prototype.constructor = KodoBeast
KodoBeast.____super = Tower
setmetatable(KodoBeast, KodoBeast.____super)
setmetatable(KodoBeast.prototype, KodoBeast.____super.prototype)
function KodoBeast.new(...)
    local self = setmetatable({}, KodoBeast.prototype)
    self:____constructor(...)
    return self
end
function KodoBeast.prototype.GenericAttack(self)
    IssueTargetOrderBJ(
        GetAttacker(),
        "devour",
        GetAttackedUnitBJ()
    )
end
return ____exports
