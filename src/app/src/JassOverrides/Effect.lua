--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.Effect = {}
local Effect = ____exports.Effect
Effect.name = "Effect"
Effect.__index = Effect
Effect.prototype = {}
Effect.prototype.__index = Effect.prototype
Effect.prototype.constructor = Effect
function Effect.new(...)
    local self = setmetatable({}, Effect.prototype)
    self:____constructor(...)
    return self
end
function Effect.prototype.____constructor(self, eff)
    self.eff = eff
end
function Effect.prototype.Destroy(self)
    DestroyEffect(self.eff)
end
return ____exports
