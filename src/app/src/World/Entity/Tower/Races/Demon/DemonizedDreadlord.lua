--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.DemonizedDreadlord = {}
local DemonizedDreadlord = ____exports.DemonizedDreadlord
DemonizedDreadlord.name = "DemonizedDreadlord"
DemonizedDreadlord.__index = DemonizedDreadlord
DemonizedDreadlord.prototype = {}
DemonizedDreadlord.prototype.__index = __TS__Index(DemonizedDreadlord.prototype)
DemonizedDreadlord.prototype.__newindex = __TS__NewIndex(DemonizedDreadlord.prototype)
DemonizedDreadlord.prototype.constructor = DemonizedDreadlord
DemonizedDreadlord.____super = Tower
setmetatable(DemonizedDreadlord, DemonizedDreadlord.____super)
setmetatable(DemonizedDreadlord.prototype, DemonizedDreadlord.____super.prototype)
function DemonizedDreadlord.new(...)
    local self = setmetatable({}, DemonizedDreadlord.prototype)
    self:____constructor(...)
    return self
end
function DemonizedDreadlord.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "berserk"
    )
end
return ____exports
