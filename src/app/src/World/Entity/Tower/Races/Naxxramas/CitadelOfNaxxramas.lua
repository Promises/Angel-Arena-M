--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.CitadelOfNaxxramas = {}
local CitadelOfNaxxramas = ____exports.CitadelOfNaxxramas
CitadelOfNaxxramas.name = "CitadelOfNaxxramas"
CitadelOfNaxxramas.__index = CitadelOfNaxxramas
CitadelOfNaxxramas.prototype = {}
CitadelOfNaxxramas.prototype.__index = __TS__Index(CitadelOfNaxxramas.prototype)
CitadelOfNaxxramas.prototype.__newindex = __TS__NewIndex(CitadelOfNaxxramas.prototype)
CitadelOfNaxxramas.prototype.constructor = CitadelOfNaxxramas
CitadelOfNaxxramas.____super = Tower
setmetatable(CitadelOfNaxxramas, CitadelOfNaxxramas.____super)
setmetatable(CitadelOfNaxxramas.prototype, CitadelOfNaxxramas.____super.prototype)
function CitadelOfNaxxramas.new(...)
    local self = setmetatable({}, CitadelOfNaxxramas.prototype)
    self:____constructor(...)
    return self
end
function CitadelOfNaxxramas.prototype.MaxCount(self)
    return 1
end
return ____exports
