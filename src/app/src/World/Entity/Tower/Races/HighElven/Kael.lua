--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Kael = {}
local Kael = ____exports.Kael
Kael.name = "Kael"
Kael.__index = Kael
Kael.prototype = {}
Kael.prototype.__index = __TS__Index(Kael.prototype)
Kael.prototype.__newindex = __TS__NewIndex(Kael.prototype)
Kael.prototype.constructor = Kael
Kael.____super = Tower
setmetatable(Kael, Kael.____super)
setmetatable(Kael.prototype, Kael.____super.prototype)
function Kael.new(...)
    local self = setmetatable({}, Kael.prototype)
    self:____constructor(...)
    return self
end
function Kael.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "Locustswarm"
    )
end
return ____exports
