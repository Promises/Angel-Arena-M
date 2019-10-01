--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
____exports.Item = {}
local Item = ____exports.Item
Item.name = "Item"
Item.__index = Item
Item.prototype = {}
Item.prototype.____getters = {}
Item.prototype.__index = __TS__Index(Item.prototype)
Item.prototype.____setters = {}
Item.prototype.__newindex = __TS__NewIndex(Item.prototype)
Item.prototype.constructor = Item
function Item.new(...)
    local self = setmetatable({}, Item.prototype)
    self:____constructor(...)
    return self
end
function Item.prototype.____constructor(self, buffID, game)
    self._itemID = FourCC(buffID)
    self._game = game
end
function Item.prototype.____getters.game(self)
    return self._game
end
function Item.prototype.____getters.itemID(self)
    return self._itemID
end
function Item.prototype.____setters.game(self, value)
    self._game = value
end
function Item.prototype.____setters.itemID(self, value)
    self._itemID = value
end
function Item.prototype.ManipulateCondition(self)
    return GetItemTypeId(
        GetManipulatedItem()
    ) == self._itemID
end
function Item.prototype.ManipulateAction(self)
    Log.Debug("Missing Action")
end
function Item.prototype.IsStackingItem(self)
    return self.MakeStack ~= nil
end
return ____exports
