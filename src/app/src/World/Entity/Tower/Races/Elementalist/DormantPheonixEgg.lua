--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.DormantPheonixEgg = {}
local DormantPheonixEgg = ____exports.DormantPheonixEgg
DormantPheonixEgg.name = "DormantPheonixEgg"
DormantPheonixEgg.__index = DormantPheonixEgg
DormantPheonixEgg.prototype = {}
DormantPheonixEgg.prototype.__index = __TS__Index(DormantPheonixEgg.prototype)
DormantPheonixEgg.prototype.__newindex = __TS__NewIndex(DormantPheonixEgg.prototype)
DormantPheonixEgg.prototype.constructor = DormantPheonixEgg
DormantPheonixEgg.____super = Tower
setmetatable(DormantPheonixEgg, DormantPheonixEgg.____super)
setmetatable(DormantPheonixEgg.prototype, DormantPheonixEgg.____super.prototype)
function DormantPheonixEgg.new(...)
    local self = setmetatable({}, DormantPheonixEgg.prototype)
    self:____constructor(...)
    return self
end
function DormantPheonixEgg.prototype.EndOfRoundAction(self)
    SetUnitManaBJ(
        self.tower,
        GetUnitStateSwap(UNIT_STATE_MANA, self.tower) + 1
    )
end
return ____exports
