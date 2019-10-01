--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Destructable = {}
local Destructable = ____exports.Destructable
Destructable.name = "Destructable"
Destructable.__index = Destructable
Destructable.prototype = {}
Destructable.prototype.__index = Destructable.prototype
Destructable.prototype.constructor = Destructable
function Destructable.new(...)
    local self = setmetatable({}, Destructable.prototype)
    self:____constructor(...)
    return self
end
function Destructable.prototype.____constructor(self, destr)
    self.destr = destr
    ____exports.Destructable._byDestr:set(destr, self)
end
function Destructable.Create(self, objectid, x, y, face, scale, variation)
    return ____exports.Destructable.new(
        CreateDestructable(objectid, x, y, face, scale, variation)
    )
end
function Destructable.CreateZ(self, objectid, x, y, z, face, scale, variation)
    return ____exports.Destructable.new(
        CreateDestructableZ(objectid, x, y, z, face, scale, variation)
    )
end
function Destructable.CreateDead(self, objectid, x, y, face, scale, variation)
    return ____exports.Destructable.new(
        CreateDeadDestructable(objectid, x, y, face, scale, variation)
    )
end
function Destructable.CreateDeadZ(self, objectid, x, y, z, face, scale, variation)
    return ____exports.Destructable.new(
        CreateDeadDestructableZ(objectid, x, y, z, face, scale, variation)
    )
end
function Destructable.ByDestr(self, destr)
    return ____exports.Destructable._byDestr:has(destr) and ____exports.Destructable._byDestr:get(destr) or ____exports.Destructable.new(destr)
end
function Destructable.FilterDestructable(self)
    return self:ByDestr(
        GetFilterDestructable()
    )
end
function Destructable.EnumDestructable(self)
    return self:ByDestr(
        GetEnumDestructable()
    )
end
function Destructable.OrderTargetDestructable(self)
    return self:ByDestr(
        GetOrderTargetDestructable()
    )
end
function Destructable.SpellTargetDestructable(self)
    return self:ByDestr(
        GetSpellTargetDestructable()
    )
end
function Destructable.TriggerDestructable(self)
    return self:ByDestr(
        GetTriggerDestructable()
    )
end
function Destructable.EnumInRect(self, r, filter, actionFunc)
    EnumDestructablesInRect(
        r,
        filter,
        function() return actionFunc end
    )
end
function Destructable.prototype.Destroy(self)
    RemoveDestructable(self.destr)
end
function Destructable.prototype.Kill(self)
    KillDestructable(self.destr)
end
function Destructable.prototype.SetInvulnerable(self, flag)
    SetDestructableInvulnerable(self.destr, flag)
end
function Destructable.prototype.IsInvulnerable(self)
    return IsDestructableInvulnerable(self.destr)
end
function Destructable.prototype.TypeId(self)
    return GetDestructableTypeId(self.destr)
end
function Destructable.prototype.x(self)
    return GetDestructableX(self.destr)
end
function Destructable.prototype.y(self)
    return GetDestructableY(self.destr)
end
function Destructable.prototype.life(self)
    return GetDestructableLife(self.destr)
end
function Destructable.prototype.SetLife(self, life)
    SetDestructableLife(self.destr, life)
end
function Destructable.prototype.MaxLife(self)
    return GetDestructableMaxLife(self.destr)
end
function Destructable.prototype.SetMaxLife(self, max)
    SetDestructableMaxLife(self.destr, max)
end
function Destructable.prototype.RestoreLife(self, life, birth)
    DestructableRestoreLife(self.destr, life, birth)
end
function Destructable.prototype.SetAnimation(self, whichAnimation)
    SetDestructableAnimation(self.destr, whichAnimation)
end
function Destructable.prototype.QueueAnimation(self, whichAnimation)
    QueueDestructableAnimation(self.destr, whichAnimation)
end
function Destructable.prototype.SetAnimationSpeed(self, speedFactor)
    SetDestructableAnimationSpeed(self.destr, speedFactor)
end
function Destructable.prototype.Show(self, flag)
    ShowDestructable(self.destr, flag)
end
function Destructable.prototype.OccluderHeight(self)
    return GetDestructableOccluderHeight(self.destr)
end
function Destructable.prototype.SetOccluderHeight(self, height)
    SetDestructableOccluderHeight(self.destr, height)
end
function Destructable.prototype.GetName(self)
    return GetDestructableName(self.destr)
end
Destructable._byDestr = Map.new()
return ____exports
