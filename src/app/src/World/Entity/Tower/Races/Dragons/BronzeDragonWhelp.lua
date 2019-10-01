--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.BronzeDragonWhelp = {}
local BronzeDragonWhelp = ____exports.BronzeDragonWhelp
BronzeDragonWhelp.name = "BronzeDragonWhelp"
BronzeDragonWhelp.__index = BronzeDragonWhelp
BronzeDragonWhelp.prototype = {}
BronzeDragonWhelp.prototype.__index = __TS__Index(BronzeDragonWhelp.prototype)
BronzeDragonWhelp.prototype.__newindex = __TS__NewIndex(BronzeDragonWhelp.prototype)
BronzeDragonWhelp.prototype.constructor = BronzeDragonWhelp
BronzeDragonWhelp.____super = Tower
setmetatable(BronzeDragonWhelp, BronzeDragonWhelp.____super)
setmetatable(BronzeDragonWhelp.prototype, BronzeDragonWhelp.____super.prototype)
function BronzeDragonWhelp.new(...)
    local self = setmetatable({}, BronzeDragonWhelp.prototype)
    self:____constructor(...)
    return self
end
function BronzeDragonWhelp.prototype.GenericAttack(self)
    IssueTargetOrderBJ(
        GetAttacker(),
        "slow",
        GetAttackedUnitBJ()
    )
end
return ____exports
