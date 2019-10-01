--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local triggerTable = {}
local TriggerRegisterPlayerEventLeaveTable = {}
_G.CreateTrigger = function()
    local t = {index = 0}
    __TS__ArrayPush(triggerTable, t)
    t.index = __TS__ArrayIndexOf(triggerTable, t)
    return t
end
_G.CreateTrigger = function()
    local t = {index = 0}
    __TS__ArrayPush(triggerTable, t)
    t.index = __TS__ArrayIndexOf(triggerTable, t)
    return t
end
_G.TriggerRegisterPlayerEventLeave = function(trig, whichPlayer)
    local t = {player = whichPlayer, trigger = trig, index = 0}
    __TS__ArrayPush(TriggerRegisterPlayerEventLeaveTable, t)
    t.index = __TS__ArrayIndexOf(TriggerRegisterPlayerEventLeaveTable, t)
    return t
end
_G.Condition = function(fun)
    return function() return fun() end
end
_G.TriggerAddCondition = function(whichTrigger, fun)
    whichTrigger.condition = function() return fun() end
end
_G.TriggerAddAction = function(whichTrigger, fun)
    whichTrigger.action = function() return fun() end
end
local TriggerRegisterAnyUnitEventBJTable = {}
_G.TriggerRegisterAnyUnitEventBJ = function(trig, whichEvent)
    local t = {trigger = trig, event = whichEvent, index = 0}
    __TS__ArrayPush(TriggerRegisterAnyUnitEventBJTable, t)
    t.index = __TS__ArrayIndexOf(TriggerRegisterAnyUnitEventBJTable, t)
    return t
end
local TriggerRegisterEnterRectSimpleTable = {}
_G.TriggerRegisterEnterRectSimple = function(trig, r)
    local t = {trigger = trig, rectangle = r, index = 0}
    __TS__ArrayPush(TriggerRegisterEnterRectSimpleTable, t)
    t.index = __TS__ArrayIndexOf(TriggerRegisterEnterRectSimpleTable, t)
    return t
end
local TriggerRegisterPlayerUnitEventSimpleTable = {}
_G.TriggerRegisterPlayerUnitEventSimple = function(trig, whichPlayer, whichEvent)
    local t = {trigger = trig, player = whichPlayer, event = whichEvent, index = 0}
    __TS__ArrayPush(TriggerRegisterPlayerUnitEventSimpleTable, t)
    t.index = __TS__ArrayIndexOf(TriggerRegisterPlayerUnitEventSimpleTable, t)
    return t
end
local TriggerRegisterDeathEventTable = {}
_G.TriggerRegisterDeathEvent = function(trig, whichPlayer, whichEvent)
    local t = {trigger = trig, player = whichPlayer, event = whichEvent, index = 0}
    __TS__ArrayPush(TriggerRegisterDeathEventTable, t)
    t.index = __TS__ArrayIndexOf(TriggerRegisterDeathEventTable, t)
    return t
end
_G.TriggerRegisterTimerEventPeriodic = function(trig, timeout)
    return
end
_G.TriggerRegisterTimerEventSingle = function(trig, timeout)
    return
end
_G.TriggerRegisterPlayerChatEvent = function(whichTrigger, whichPlayer, chatMessageToDetect, exactMatchOnly)
    return
end
_G.TriggerRegisterDialogEventBJ = function(trig, whichDialog)
    return
end
_G.TriggerRegisterPlayerStateEvent = function(whichTrigger, whichPlayer, whichState, opcode, limitval)
    return
end
