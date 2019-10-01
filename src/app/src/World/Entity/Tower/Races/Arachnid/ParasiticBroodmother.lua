--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.ParasiticBroodmother = {}
local ParasiticBroodmother = ____exports.ParasiticBroodmother
ParasiticBroodmother.name = "ParasiticBroodmother"
ParasiticBroodmother.__index = ParasiticBroodmother
ParasiticBroodmother.prototype = {}
ParasiticBroodmother.prototype.__index = __TS__Index(ParasiticBroodmother.prototype)
ParasiticBroodmother.prototype.__newindex = __TS__NewIndex(ParasiticBroodmother.prototype)
ParasiticBroodmother.prototype.constructor = ParasiticBroodmother
ParasiticBroodmother.____super = Tower
setmetatable(ParasiticBroodmother, ParasiticBroodmother.____super)
setmetatable(ParasiticBroodmother.prototype, ParasiticBroodmother.____super.prototype)
function ParasiticBroodmother.new(...)
    local self = setmetatable({}, ParasiticBroodmother.prototype)
    self:____constructor(...)
    return self
end
function ParasiticBroodmother.prototype.GenericAttack(self)
    IssueTargetOrderBJ(
        GetAttacker(),
        "parasite",
        GetAttackedUnitBJ()
    )
end
return ____exports
