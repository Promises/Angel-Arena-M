--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GenericAbility = require("app.src.World.Entity.GenericAbilities.GenericAbility")
local GenericAbility = ____GenericAbility.GenericAbility
____exports.Move = {}
local Move = ____exports.Move
Move.name = "Move"
Move.__index = Move
Move.prototype = {}
Move.prototype.__index = __TS__Index(Move.prototype)
Move.prototype.__newindex = __TS__NewIndex(Move.prototype)
Move.prototype.constructor = Move
Move.____super = GenericAbility
setmetatable(Move, Move.____super)
setmetatable(Move.prototype, Move.____super.prototype)
function Move.new(...)
    local self = setmetatable({}, Move.prototype)
    self:____constructor(...)
    return self
end
function Move.prototype.____constructor(self, game)
    GenericAbility.prototype.____constructor(self, "A0EB", game)
end
function Move.prototype.TargetOnEffectAction(self)
    local target = GetSpellTargetUnit()
    local creep = self.game.worldMap.spawnedCreeps.unitMap:get(
        GetHandleIdBJ(target)
    )
    if creep then
        creep:ReapplyMovement()
    end
end
return ____exports
