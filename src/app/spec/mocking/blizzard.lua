--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
_G.CreateFogModifierRectBJ = function(self, enabled, whichPlayer, whichFogState, r)
    return
end
_G.bj_QUESTTYPE_OPT_DISCOVERED = 2
_G.bj_QUESTTYPE_REQ_DISCOVERED = 1
local Quests = {}
_G.CreateQuestBJ = function(self, questType, title, description, iconPath)
    local q = {questType = questType, title = title, description = description, iconPath = iconPath}
    __TS__ArrayPush(Quests, q)
    return q
end
