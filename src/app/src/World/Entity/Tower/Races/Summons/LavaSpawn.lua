--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.LavaSpawn = {}
local LavaSpawn = ____exports.LavaSpawn
LavaSpawn.name = "LavaSpawn"
LavaSpawn.__index = LavaSpawn
LavaSpawn.prototype = {}
LavaSpawn.prototype.__index = __TS__Index(LavaSpawn.prototype)
LavaSpawn.prototype.__newindex = __TS__NewIndex(LavaSpawn.prototype)
LavaSpawn.prototype.constructor = LavaSpawn
LavaSpawn.____super = Tower
setmetatable(LavaSpawn, LavaSpawn.____super)
setmetatable(LavaSpawn.prototype, LavaSpawn.____super.prototype)
function LavaSpawn.new(...)
    local self = setmetatable({}, LavaSpawn.prototype)
    self:____constructor(...)
    return self
end
function LavaSpawn.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "thunderclap"
    )
end
return ____exports
