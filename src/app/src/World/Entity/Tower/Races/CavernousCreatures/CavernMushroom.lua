--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.CavernMushroom = {}
local CavernMushroom = ____exports.CavernMushroom
CavernMushroom.name = "CavernMushroom"
CavernMushroom.__index = CavernMushroom
CavernMushroom.prototype = {}
CavernMushroom.prototype.__index = __TS__Index(CavernMushroom.prototype)
CavernMushroom.prototype.__newindex = __TS__NewIndex(CavernMushroom.prototype)
CavernMushroom.prototype.constructor = CavernMushroom
CavernMushroom.____super = Tower
setmetatable(CavernMushroom, CavernMushroom.____super)
setmetatable(CavernMushroom.prototype, CavernMushroom.____super.prototype)
function CavernMushroom.new(...)
    local self = setmetatable({}, CavernMushroom.prototype)
    self:____constructor(...)
    return self
end
function CavernMushroom.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "Locustswarm"
    )
end
return ____exports
