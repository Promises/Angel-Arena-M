--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____DemonicIllidan = require("app.src.World.Entity.Tower.Races.NightElf.DemonicIllidan")
local DemonicIllidan = ____DemonicIllidan.DemonicIllidan
local ____CorruptedIllidan = require("app.src.World.Entity.Tower.Races.NightElf.CorruptedIllidan")
local CorruptedIllidan = ____CorruptedIllidan.CorruptedIllidan
local ____Warden = require("app.src.World.Entity.Tower.Races.NightElf.Warden")
local Warden = ____Warden.Warden
local ____Wisp = require("app.src.World.Entity.Tower.Races.NightElf.Wisp")
local Wisp = ____Wisp.Wisp
local ____AncientProtector = require("app.src.World.Entity.Tower.Races.NightElf.AncientProtector")
local AncientProtector = ____AncientProtector.AncientProtector
local ____ChimaeraRoost = require("app.src.World.Entity.Tower.Races.NightElf.ChimaeraRoost")
local ChimaeraRoost = ____ChimaeraRoost.ChimaeraRoost
____exports.NightElfTowers = {}
local NightElfTowers = ____exports.NightElfTowers
NightElfTowers.name = "NightElfTowers"
NightElfTowers.__index = NightElfTowers
NightElfTowers.prototype = {}
NightElfTowers.prototype.__index = NightElfTowers.prototype
NightElfTowers.prototype.constructor = NightElfTowers
NightElfTowers.____super = RaceTowers
setmetatable(NightElfTowers, NightElfTowers.____super)
setmetatable(NightElfTowers.prototype, NightElfTowers.____super.prototype)
function NightElfTowers.new(...)
    local self = setmetatable({}, NightElfTowers.prototype)
    self:____constructor(...)
    return self
end
function NightElfTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("h00S"),
        DemonicIllidan
    )
    list:add(
        FourCC("eC83"),
        CorruptedIllidan
    )
    list:add(
        FourCC("h00G"),
        Warden
    )
    list:add(
        FourCC("e00E"),
        Wisp
    )
    list:add(
        FourCC("hC82"),
        AncientProtector
    )
    list:add(
        FourCC("hC86"),
        ChimaeraRoost
    )
end
return ____exports
