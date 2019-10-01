--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local unitTable = {}
_G.CreateUnit = function(owner, unitid, x, y, face)
    local u = {owner = owner, unitid = unitid, x = x, y = y, face = face}
    __TS__ArrayPush(unitTable, u)
    return u
end
_G.GetUnitTypeId = function(whichUnit)
    return whichUnit.unitid
end
_G.GetHandleIdBJ = function(whichUnit)
    return __TS__ArrayIndexOf(unitTable, whichUnit)
end
_G.GetUnitPointValue = function(whichUnit)
    return 100
end
_G.SetUnitOwner = function(whichUnit, whichPlayer, changeColor)
    whichUnit.owner = whichPlayer
end
_G.GetUnitX = function(whichUnit)
    return whichUnit.x
end
_G.GetUnitY = function(whichUnit)
    return whichUnit.y
end
_G.GetOwningPlayer = function(whichUnit)
    return whichUnit.owner
end
_G.CreateTextTagUnitBJ = function(s, whichUnit, zOffset, size, red, green, blue, transparency)
    return
end
_G.SetTextTagPermanentBJ = function(tt, flag)
    return
end
_G.SetTextTagLifespanBJ = function(tt, lifespan)
    return
end
_G.SetTextTagVelocityBJ = function(tt, speed, angle)
    return
end
_G.PlaySoundOnUnitBJ = function(tt, speed, angle)
    return
end
_G.RemoveUnit = function(whichUnit)
    unitTable[__TS__ArrayIndexOf(unitTable, whichUnit) + 1] = nil
end
_G.ReplaceUnitBJ = function(whichUnit, newUnitId, unitStateMethod)
    whichUnit.unitid = newUnitId
    return whichUnit
end
_G.GetUnitAbilityLevel = function(whichUnit, abilcode)
    if whichUnit.unitid == FourCC("uC14") then
        return 0
    end
    return 1
end
_G.UnitAddAbilityBJ = function(abilityId, whichUnit)
    return
end
