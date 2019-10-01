--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.StarChaser = {}
local StarChaser = ____exports.StarChaser
StarChaser.name = "StarChaser"
StarChaser.__index = StarChaser
StarChaser.prototype = {}
StarChaser.prototype.__index = __TS__Index(StarChaser.prototype)
StarChaser.prototype.__newindex = __TS__NewIndex(StarChaser.prototype)
StarChaser.prototype.constructor = StarChaser
StarChaser.____super = Tower
setmetatable(StarChaser, StarChaser.____super)
setmetatable(StarChaser.prototype, StarChaser.____super.prototype)
function StarChaser.new(...)
    local self = setmetatable({}, StarChaser.prototype)
    self:____constructor(...)
    return self
end
function StarChaser.prototype.GenericAttack(self)
    IssueImmediateOrderBJ(
        GetAttacker(),
        "starfall"
    )
end
return ____exports
