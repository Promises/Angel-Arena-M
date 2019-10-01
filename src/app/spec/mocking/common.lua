--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____Rectangle = require("app.src.JassOverrides.Rectangle")
local Rectangle = ____Rectangle.Rectangle
_G.DisplayTimedTextToForce = function(toForce, duration, message)
    print(
        "[SendMessage]: " .. tostring(message)
    )
end
_G.sound = {filename = string}
_G.CreateSound = function(self, fileName, looping, is3D, stopwhenoutofrange, fadeInRate, fadeOutRate, eaxSetting)
    return {filename = fileName}
end
_G.GetPlayableMapRect = function(self)
    return Rectangle.new({-2000, -2000, 2000, 2000})
end
_G.SetUnitInvulnerable = function(self, whichUnit, flag)
    return
end
_G.PauseUnit = function(self, whichUnit, flag)
    return
end
_G.PauseUnitBJ = _G.PauseUnit
_G.GetRectCenterX = function(self, whichRect)
    if not whichRect then
        return 0
    end
    return whichRect:GetCenterX()
end
_G.GetRectCenterY = function(self, whichRect)
    if not whichRect then
        return 0
    end
    return whichRect:GetCenterY()
end
_G.AddSpecialEffect = function(self, modelName, x, y)
    return 1
end
_G.DestroyEffect = function(self, whichEffect)
    return
end
_G.CreateTimer = function(self)
    return 1
end
_G.TimerStart = function(self, timer)
    return
end
_G.Filter = function(self, func)
    return function() return func(nil) end
end
_G.DialogCreate = function(self)
    return 1
end
_G.CreateDestructable = function(self, objectid, x, y, face, scale, variation)
    return 1
end
_G.TriggerSleepAction = function(self, timeout)
    return
end
_G.DisplayTimedTextToPlayer = function(self, toPlayer, x, y, duration, message)
    return
end
_G.SetTerrainPathable = function(self, x, y, t, flag)
    return
end
_G.BlzGetFrameByName = function(self, name, createContext)
    return nil
end
_G.BlzFrameIsVisible = function(self, frame)
    return false
end
_G.SetPlayerTechMaxAllowedSwap = function(techid, maximum, whichPlayer)
end
