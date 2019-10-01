--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Wisp = {}
local Wisp = ____exports.Wisp
Wisp.name = "Wisp"
Wisp.__index = Wisp
Wisp.prototype = {}
Wisp.prototype.__index = __TS__Index(Wisp.prototype)
Wisp.prototype.__newindex = __TS__NewIndex(Wisp.prototype)
Wisp.prototype.constructor = Wisp
Wisp.____super = Tower
setmetatable(Wisp, Wisp.____super)
setmetatable(Wisp.prototype, Wisp.____super.prototype)
function Wisp.new(...)
    local self = setmetatable({}, Wisp.prototype)
    self:____constructor(...)
    return self
end
function Wisp.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "thunderclap"
    )
end
return ____exports
