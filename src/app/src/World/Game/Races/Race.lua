--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Race = {}
local Race = ____exports.Race
Race.name = "Race"
Race.__index = Race
Race.prototype = {}
Race.prototype.__index = Race.prototype
Race.prototype.constructor = Race
function Race.new(...)
    local self = setmetatable({}, Race.prototype)
    self:____constructor(...)
    return self
end
function Race.prototype.____constructor(self, id, name, itemid, map, enabled)
    if enabled == nil then
        enabled = true
    end
    self.id = id
    self.name = name
    self.itemid = itemid
    self.enabled = enabled
    self.map = map
    if not enabled then
        map.disabledRaces = map.disabledRaces + 1
    end
end
function Race.prototype.pickAction(self, player)
    __TS__ArrayPush(
        player.builders,
        CreateUnit(
            player.wcPlayer,
            FourCC(self.id),
            player:getCenterX(),
            player:getCenterY(),
            bj_UNIT_FACING
        )
    )
end
return ____exports
