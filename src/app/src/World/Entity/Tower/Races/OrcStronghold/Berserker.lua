--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Berserker = {}
local Berserker = ____exports.Berserker
Berserker.name = "Berserker"
Berserker.__index = Berserker
Berserker.prototype = {}
Berserker.prototype.__index = __TS__Index(Berserker.prototype)
Berserker.prototype.__newindex = __TS__NewIndex(Berserker.prototype)
Berserker.prototype.constructor = Berserker
Berserker.____super = Tower
setmetatable(Berserker, Berserker.____super)
setmetatable(Berserker.prototype, Berserker.____super.prototype)
function Berserker.new(...)
    local self = setmetatable({}, Berserker.prototype)
    self:____constructor(...)
    return self
end
function Berserker.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "berserk"
    )
end
return ____exports
