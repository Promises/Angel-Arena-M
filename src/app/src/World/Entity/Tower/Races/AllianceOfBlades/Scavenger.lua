--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local AOB_ITEM_LOOT_LEVEL_ONE = ____GlobalSettings.AOB_ITEM_LOOT_LEVEL_ONE
____exports.Scavenger = {}
local Scavenger = ____exports.Scavenger
Scavenger.name = "Scavenger"
Scavenger.__index = Scavenger
Scavenger.prototype = {}
Scavenger.prototype.__index = __TS__Index(Scavenger.prototype)
Scavenger.prototype.__newindex = __TS__NewIndex(Scavenger.prototype)
Scavenger.prototype.constructor = Scavenger
Scavenger.____super = Tower
setmetatable(Scavenger, Scavenger.____super)
setmetatable(Scavenger.prototype, Scavenger.____super.prototype)
function Scavenger.new(...)
    local self = setmetatable({}, Scavenger.prototype)
    self:____constructor(...)
    return self
end
function Scavenger.prototype.Scavenge(self)
    if UnitItemInSlot(self.tower, 0) == nil then
        local lootindx = Util:RandomInt(0, #AOB_ITEM_LOOT_LEVEL_ONE - 1)
        local i = CreateItem(
            AOB_ITEM_LOOT_LEVEL_ONE[lootindx + 1],
            GetUnitX(self.tower),
            GetUnitY(self.tower)
        )
        if not UnitAddItem(self.tower, i) then
            RemoveItem(i)
        end
    end
end
function Scavenger.prototype.Action(self)
    self:Scavenge()
end
function Scavenger.prototype.GetTickModulo(self)
    return 300
end
return ____exports
