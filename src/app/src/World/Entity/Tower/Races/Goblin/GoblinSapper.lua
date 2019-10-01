--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.GoblinSapper = {}
local GoblinSapper = ____exports.GoblinSapper
GoblinSapper.name = "GoblinSapper"
GoblinSapper.__index = GoblinSapper
GoblinSapper.prototype = {}
GoblinSapper.prototype.__index = __TS__Index(GoblinSapper.prototype)
GoblinSapper.prototype.__newindex = __TS__NewIndex(GoblinSapper.prototype)
GoblinSapper.prototype.constructor = GoblinSapper
GoblinSapper.____super = Tower
setmetatable(GoblinSapper, GoblinSapper.____super)
setmetatable(GoblinSapper.prototype, GoblinSapper.____super.prototype)
function GoblinSapper.new(...)
    local self = setmetatable({}, GoblinSapper.prototype)
    self:____constructor(...)
    return self
end
function GoblinSapper.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "stomp"
    )
end
return ____exports
