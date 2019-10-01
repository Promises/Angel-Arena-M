--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.GargoyleSpire = {}
local GargoyleSpire = ____exports.GargoyleSpire
GargoyleSpire.name = "GargoyleSpire"
GargoyleSpire.__index = GargoyleSpire
GargoyleSpire.prototype = {}
GargoyleSpire.prototype.__index = __TS__Index(GargoyleSpire.prototype)
GargoyleSpire.prototype.__newindex = __TS__NewIndex(GargoyleSpire.prototype)
GargoyleSpire.prototype.constructor = GargoyleSpire
GargoyleSpire.____super = Tower
setmetatable(GargoyleSpire, GargoyleSpire.____super)
setmetatable(GargoyleSpire.prototype, GargoyleSpire.____super.prototype)
function GargoyleSpire.new(...)
    local self = setmetatable({}, GargoyleSpire.prototype)
    self:____constructor(...)
    return self
end
function GargoyleSpire.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "Locustswarm"
    )
end
return ____exports
