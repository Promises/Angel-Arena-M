--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.Marine = {}
local Marine = ____exports.Marine
Marine.name = "Marine"
Marine.__index = Marine
Marine.prototype = {}
Marine.prototype.__index = __TS__Index(Marine.prototype)
Marine.prototype.__newindex = __TS__NewIndex(Marine.prototype)
Marine.prototype.constructor = Marine
Marine.____super = Tower
setmetatable(Marine, Marine.____super)
setmetatable(Marine.prototype, Marine.____super.prototype)
function Marine.new(...)
    local self = setmetatable({}, Marine.prototype)
    self:____constructor(...)
    return self
end
function Marine.prototype.UpdateSize(self)
    SetUnitAbilityLevelSwapped(
        FourCC("A0EJ"),
        self.tower,
        self.owner.towerForces:get(
            self:GetTypeID()
        )
    )
end
return ____exports
