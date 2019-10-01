--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.VoidWorshipper = {}
local VoidWorshipper = ____exports.VoidWorshipper
VoidWorshipper.name = "VoidWorshipper"
VoidWorshipper.__index = VoidWorshipper
VoidWorshipper.prototype = {}
VoidWorshipper.prototype.__index = __TS__Index(VoidWorshipper.prototype)
VoidWorshipper.prototype.__newindex = __TS__NewIndex(VoidWorshipper.prototype)
VoidWorshipper.prototype.constructor = VoidWorshipper
VoidWorshipper.____super = Tower
setmetatable(VoidWorshipper, VoidWorshipper.____super)
setmetatable(VoidWorshipper.prototype, VoidWorshipper.____super.prototype)
function VoidWorshipper.new(...)
    local self = setmetatable({}, VoidWorshipper.prototype)
    self:____constructor(...)
    return self
end
function VoidWorshipper.prototype.____constructor(self, tower, owner, game)
    Tower.prototype.____constructor(self, tower, owner, game)
    self.owner:SetVoidFragmentTick(
        self.owner:GetVoidFragmentTick() + 1
    )
end
function VoidWorshipper.prototype.MaxCount(self)
    return 40
end
function VoidWorshipper.prototype.Action(self)
    local fragments = self.owner:GetVoidFragments()
    local newDmg = math.floor(
        14 + IMinBJ(35, 0.1 * fragments)
    )
    BlzSetUnitBaseDamage(self.tower, newDmg, 0)
end
function VoidWorshipper.prototype.GetTickModulo(self)
    return 9
end
function VoidWorshipper.prototype.SellAction(self)
    self.owner:SetVoidFragmentTick(
        self.owner:GetVoidFragmentTick() - 1
    )
end
return ____exports
