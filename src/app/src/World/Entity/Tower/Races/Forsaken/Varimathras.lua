--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Varimathras = {}
local Varimathras = ____exports.Varimathras
Varimathras.name = "Varimathras"
Varimathras.__index = Varimathras
Varimathras.prototype = {}
Varimathras.prototype.__index = __TS__Index(Varimathras.prototype)
Varimathras.prototype.__newindex = __TS__NewIndex(Varimathras.prototype)
Varimathras.prototype.constructor = Varimathras
Varimathras.____super = Tower
setmetatable(Varimathras, Varimathras.____super)
setmetatable(Varimathras.prototype, Varimathras.____super.prototype)
function Varimathras.new(...)
    local self = setmetatable({}, Varimathras.prototype)
    self:____constructor(...)
    return self
end
function Varimathras.prototype.GenericAttack(self)
    IssueTargetOrderBJ(
        GetAttacker(),
        "doom",
        GetAttackedUnitBJ()
    )
end
return ____exports
