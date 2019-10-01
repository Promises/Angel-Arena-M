--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Blaze = {}
local Blaze = ____exports.Blaze
Blaze.name = "Blaze"
Blaze.__index = Blaze
Blaze.prototype = {}
Blaze.prototype.__index = __TS__Index(Blaze.prototype)
Blaze.prototype.__newindex = __TS__NewIndex(Blaze.prototype)
Blaze.prototype.constructor = Blaze
Blaze.____super = Tower
setmetatable(Blaze, Blaze.____super)
setmetatable(Blaze.prototype, Blaze.____super.prototype)
function Blaze.new(...)
    local self = setmetatable({}, Blaze.prototype)
    self:____constructor(...)
    return self
end
function Blaze.prototype.EndOfRoundAction(self)
    self:Upgrade(
        FourCC("n027")
    )
end
return ____exports
