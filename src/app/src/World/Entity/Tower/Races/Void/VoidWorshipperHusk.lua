--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.VoidWorshipperHusk = {}
local VoidWorshipperHusk = ____exports.VoidWorshipperHusk
VoidWorshipperHusk.name = "VoidWorshipperHusk"
VoidWorshipperHusk.__index = VoidWorshipperHusk
VoidWorshipperHusk.prototype = {}
VoidWorshipperHusk.prototype.__index = __TS__Index(VoidWorshipperHusk.prototype)
VoidWorshipperHusk.prototype.__newindex = __TS__NewIndex(VoidWorshipperHusk.prototype)
VoidWorshipperHusk.prototype.constructor = VoidWorshipperHusk
VoidWorshipperHusk.____super = Tower
setmetatable(VoidWorshipperHusk, VoidWorshipperHusk.____super)
setmetatable(VoidWorshipperHusk.prototype, VoidWorshipperHusk.____super.prototype)
function VoidWorshipperHusk.new(...)
    local self = setmetatable({}, VoidWorshipperHusk.prototype)
    self:____constructor(...)
    return self
end
function VoidWorshipperHusk.prototype.____constructor(self, tower, owner, game)
    Tower.prototype.____constructor(self, tower, owner, game)
    self.owner:SetVoidFragmentTick(
        self.owner:GetVoidFragmentTick() + 1
    )
end
function VoidWorshipperHusk.prototype.SellAction(self)
    self.owner:SetVoidFragmentTick(
        self.owner:GetVoidFragmentTick() - 1
    )
end
return ____exports
