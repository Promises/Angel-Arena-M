--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.DraeneiSeer = {}
local DraeneiSeer = ____exports.DraeneiSeer
DraeneiSeer.name = "DraeneiSeer"
DraeneiSeer.__index = DraeneiSeer
DraeneiSeer.prototype = {}
DraeneiSeer.prototype.__index = __TS__Index(DraeneiSeer.prototype)
DraeneiSeer.prototype.__newindex = __TS__NewIndex(DraeneiSeer.prototype)
DraeneiSeer.prototype.constructor = DraeneiSeer
DraeneiSeer.____super = Tower
setmetatable(DraeneiSeer, DraeneiSeer.____super)
setmetatable(DraeneiSeer.prototype, DraeneiSeer.____super.prototype)
function DraeneiSeer.new(...)
    local self = setmetatable({}, DraeneiSeer.prototype)
    self:____constructor(...)
    return self
end
function DraeneiSeer.prototype.GenericAttack(self)
    IssueTargetOrderBJ(
        GetAttacker(),
        "lightningshield",
        GetAttackedUnitBJ()
    )
end
return ____exports
