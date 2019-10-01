--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Buff = require("app.src.World.Entity.Buff.Specs.Buff")
local Buff = ____Buff.Buff
____exports.DrunkenHaze = {}
local DrunkenHaze = ____exports.DrunkenHaze
DrunkenHaze.name = "DrunkenHaze"
DrunkenHaze.__index = DrunkenHaze
DrunkenHaze.prototype = {}
DrunkenHaze.prototype.__index = __TS__Index(DrunkenHaze.prototype)
DrunkenHaze.prototype.constructor = DrunkenHaze
DrunkenHaze.____super = Buff
setmetatable(DrunkenHaze, DrunkenHaze.____super)
setmetatable(DrunkenHaze.prototype, DrunkenHaze.____super.prototype)
function DrunkenHaze.new(...)
    local self = setmetatable({}, DrunkenHaze.prototype)
    self:____constructor(...)
    return self
end
function DrunkenHaze.prototype.____constructor(self, game)
    Buff.prototype.____constructor(self, "B02O", game)
end
function DrunkenHaze.prototype.ModifyDamage(self)
    local target = self.damageEngineGlobals.udg_DamageEventTarget
    if not target then
        return
    end
    if not self:Condition(target) then
        return
    end
    do
        local ____obj, ____index = self.damageEngineGlobals, "udg_DamageEventAmount"
        ____obj[____index] = ____obj[____index] * 1.25
    end
end
return ____exports
