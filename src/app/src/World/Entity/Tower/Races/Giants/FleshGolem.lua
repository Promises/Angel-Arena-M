--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.FleshGolem = {}
local FleshGolem = ____exports.FleshGolem
FleshGolem.name = "FleshGolem"
FleshGolem.__index = FleshGolem
FleshGolem.prototype = {}
FleshGolem.prototype.__index = __TS__Index(FleshGolem.prototype)
FleshGolem.prototype.__newindex = __TS__NewIndex(FleshGolem.prototype)
FleshGolem.prototype.constructor = FleshGolem
FleshGolem.____super = Tower
setmetatable(FleshGolem, FleshGolem.____super)
setmetatable(FleshGolem.prototype, FleshGolem.____super.prototype)
function FleshGolem.new(...)
    local self = setmetatable({}, FleshGolem.prototype)
    self:____constructor(...)
    return self
end
function FleshGolem.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "berserk"
    )
end
return ____exports
