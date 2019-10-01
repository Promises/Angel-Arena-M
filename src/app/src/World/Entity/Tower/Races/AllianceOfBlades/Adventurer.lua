--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local AOB_ITEM_LOOT_LEVEL_ONE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_ONE
____exports.Adventurer = {}
local Adventurer = ____exports.Adventurer
Adventurer.name = "Adventurer"
Adventurer.__index = Adventurer
Adventurer.prototype = {}
Adventurer.prototype.__index = __TS__Index(Adventurer.prototype)
Adventurer.prototype.__newindex = __TS__NewIndex(Adventurer.prototype)
Adventurer.prototype.constructor = Adventurer
Adventurer.____super = Tower
setmetatable(Adventurer, Adventurer.____super)
setmetatable(Adventurer.prototype, Adventurer.____super.prototype)
function Adventurer.new(...)
    local self = setmetatable({}, Adventurer.prototype)
    self:____constructor(...)
    return self
end
function Adventurer.prototype.KillingAction(self)
    local u = GetKillingUnitBJ()
    local target = GetDyingUnit()
    if u == self.tower and target then
        if UnitItemInSlotBJ(u, 1) == nil then
            local lootindx = Util:RandomInt(0, #AOB_ITEM_LOOT_LEVEL_ONE - 1)
            UnitAddItemById(u, AOB_ITEM_LOOT_LEVEL_ONE[lootindx + 1])
        end
    end
end
return ____exports
