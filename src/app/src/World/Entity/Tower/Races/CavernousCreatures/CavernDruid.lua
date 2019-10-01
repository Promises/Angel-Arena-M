--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.CavernDruid = {}
local CavernDruid = ____exports.CavernDruid
CavernDruid.name = "CavernDruid"
CavernDruid.__index = CavernDruid
CavernDruid.prototype = {}
CavernDruid.prototype.__index = __TS__Index(CavernDruid.prototype)
CavernDruid.prototype.__newindex = __TS__NewIndex(CavernDruid.prototype)
CavernDruid.prototype.constructor = CavernDruid
CavernDruid.____super = Tower
setmetatable(CavernDruid, CavernDruid.____super)
setmetatable(CavernDruid.prototype, CavernDruid.____super.prototype)
function CavernDruid.new(...)
    local self = setmetatable({}, CavernDruid.prototype)
    self:____constructor(...)
    return self
end
function CavernDruid.prototype.InitialDamageModification(self)
    local u = self.game.gameDamageEngineGlobals.udg_DamageEventSource
    if u == self.tower then
        do
            local ____obj, ____index = self.game.gameDamageEngineGlobals, "udg_DamageEventAmount"
            ____obj[____index] = ____obj[____index] + (GetUnitStateSwap(UNIT_STATE_MANA, self.tower) * 25)
        end
        SetUnitManaBJ(self.tower, 0)
    end
end
return ____exports
