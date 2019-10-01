--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____StackingItem = require("app.src.World.Entity.Item.Specs.StackingItem")
local StackingItem = ____StackingItem.StackingItem
____exports.PremiumLootTower = {}
local PremiumLootTower = ____exports.PremiumLootTower
PremiumLootTower.name = "PremiumLootTower"
PremiumLootTower.__index = PremiumLootTower
PremiumLootTower.prototype = {}
PremiumLootTower.prototype.__index = __TS__Index(PremiumLootTower.prototype)
PremiumLootTower.prototype.__newindex = __TS__NewIndex(PremiumLootTower.prototype)
PremiumLootTower.prototype.constructor = PremiumLootTower
PremiumLootTower.____super = StackingItem
setmetatable(PremiumLootTower, PremiumLootTower.____super)
setmetatable(PremiumLootTower.prototype, PremiumLootTower.____super.prototype)
function PremiumLootTower.new(...)
    local self = setmetatable({}, PremiumLootTower.prototype)
    self:____constructor(...)
    return self
end
function PremiumLootTower.prototype.____constructor(self, game)
    StackingItem.prototype.____constructor(self, "I029", game)
end
function PremiumLootTower.prototype.ManipulateAction(self)
    return
end
return ____exports
