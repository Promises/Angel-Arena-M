--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local ELEMENTALIST_ABILITIES = ____GlobalSettings.ELEMENTALIST_ABILITIES
____exports.UnchargedRune = {}
local UnchargedRune = ____exports.UnchargedRune
UnchargedRune.name = "UnchargedRune"
UnchargedRune.__index = UnchargedRune
UnchargedRune.prototype = {}
UnchargedRune.prototype.__index = __TS__Index(UnchargedRune.prototype)
UnchargedRune.prototype.__newindex = __TS__NewIndex(UnchargedRune.prototype)
UnchargedRune.prototype.constructor = UnchargedRune
UnchargedRune.____super = Tower
setmetatable(UnchargedRune, UnchargedRune.____super)
setmetatable(UnchargedRune.prototype, UnchargedRune.____super.prototype)
function UnchargedRune.new(...)
    local self = setmetatable({}, UnchargedRune.prototype)
    self:____constructor(...)
    return self
end
function UnchargedRune.prototype.____constructor(self, tower, owner, game)
    Tower.prototype.____constructor(self, tower, owner, game)
    self:AddAbilities()
end
function UnchargedRune.prototype.AddAbilities(self)
    local nums = {}
    do
        local i = 0
        while i < #ELEMENTALIST_ABILITIES - 1 do
            __TS__ArrayPush(nums, i)
            UnitRemoveAbilityBJ(ELEMENTALIST_ABILITIES[nums[i + 1] + 1], self.tower)
            i = i + 1
        end
    end
    Util:ShuffleArray(nums)
    UnitAddAbilityBJ(ELEMENTALIST_ABILITIES[nums[1] + 1], self.tower)
    UnitAddAbilityBJ(ELEMENTALIST_ABILITIES[nums[2] + 1], self.tower)
end
return ____exports
