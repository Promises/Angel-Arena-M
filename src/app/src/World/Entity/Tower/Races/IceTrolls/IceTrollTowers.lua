--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____IceTrollKing = require("app.src.World.Entity.Tower.Races.IceTrolls.IceTrollKing")
local IceTrollKing = ____IceTrollKing.IceTrollKing
local ____IceTrollEmperor = require("app.src.World.Entity.Tower.Races.IceTrolls.IceTrollEmperor")
local IceTrollEmperor = ____IceTrollEmperor.IceTrollEmperor
local ____IceTrollPriest = require("app.src.World.Entity.Tower.Races.IceTrolls.IceTrollPriest")
local IceTrollPriest = ____IceTrollPriest.IceTrollPriest
____exports.IceTrollTowers = {}
local IceTrollTowers = ____exports.IceTrollTowers
IceTrollTowers.name = "IceTrollTowers"
IceTrollTowers.__index = IceTrollTowers
IceTrollTowers.prototype = {}
IceTrollTowers.prototype.__index = IceTrollTowers.prototype
IceTrollTowers.prototype.constructor = IceTrollTowers
IceTrollTowers.____super = RaceTowers
setmetatable(IceTrollTowers, IceTrollTowers.____super)
setmetatable(IceTrollTowers.prototype, IceTrollTowers.____super.prototype)
function IceTrollTowers.new(...)
    local self = setmetatable({}, IceTrollTowers.prototype)
    self:____constructor(...)
    return self
end
function IceTrollTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("n01B"),
        IceTrollKing
    )
    list:add(
        FourCC("n01C"),
        IceTrollEmperor
    )
    list:add(
        FourCC("n018"),
        IceTrollPriest
    )
end
return ____exports
