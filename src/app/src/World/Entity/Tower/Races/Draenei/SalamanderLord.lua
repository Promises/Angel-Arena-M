--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.SalamanderLord = {}
local SalamanderLord = ____exports.SalamanderLord
SalamanderLord.name = "SalamanderLord"
SalamanderLord.__index = SalamanderLord
SalamanderLord.prototype = {}
SalamanderLord.prototype.__index = __TS__Index(SalamanderLord.prototype)
SalamanderLord.prototype.__newindex = __TS__NewIndex(SalamanderLord.prototype)
SalamanderLord.prototype.constructor = SalamanderLord
SalamanderLord.____super = Tower
setmetatable(SalamanderLord, SalamanderLord.____super)
setmetatable(SalamanderLord.prototype, SalamanderLord.____super.prototype)
function SalamanderLord.new(...)
    local self = setmetatable({}, SalamanderLord.prototype)
    self:____constructor(...)
    return self
end
function SalamanderLord.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "stomp"
    )
end
return ____exports
