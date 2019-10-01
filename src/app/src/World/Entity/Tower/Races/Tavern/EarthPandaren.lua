--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.EarthPandaren = {}
local EarthPandaren = ____exports.EarthPandaren
EarthPandaren.name = "EarthPandaren"
EarthPandaren.__index = EarthPandaren
EarthPandaren.prototype = {}
EarthPandaren.prototype.__index = __TS__Index(EarthPandaren.prototype)
EarthPandaren.prototype.__newindex = __TS__NewIndex(EarthPandaren.prototype)
EarthPandaren.prototype.constructor = EarthPandaren
EarthPandaren.____super = Tower
setmetatable(EarthPandaren, EarthPandaren.____super)
setmetatable(EarthPandaren.prototype, EarthPandaren.____super.prototype)
function EarthPandaren.new(...)
    local self = setmetatable({}, EarthPandaren.prototype)
    self:____constructor(...)
    return self
end
function EarthPandaren.prototype.GenericAttack(self)
    IssueTargetOrderBJ(
        GetAttacker(),
        "drunkenhaze",
        GetAttackedUnitBJ()
    )
end
return ____exports
