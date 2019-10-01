--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Akama = {}
local Akama = ____exports.Akama
Akama.name = "Akama"
Akama.__index = Akama
Akama.prototype = {}
Akama.prototype.__index = __TS__Index(Akama.prototype)
Akama.prototype.__newindex = __TS__NewIndex(Akama.prototype)
Akama.prototype.constructor = Akama
Akama.____super = Tower
setmetatable(Akama, Akama.____super)
setmetatable(Akama.prototype, Akama.____super.prototype)
function Akama.new(...)
    local self = setmetatable({}, Akama.prototype)
    self:____constructor(...)
    return self
end
function Akama.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "spiritwolf"
    )
end
return ____exports
