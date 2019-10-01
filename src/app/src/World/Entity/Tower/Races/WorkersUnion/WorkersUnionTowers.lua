--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____RaceTowers = require("app.src.World.Entity.Tower.Races.RaceTowers")
local RaceTowers = ____RaceTowers.RaceTowers
local ____NagaSlave = require("app.src.World.Entity.Tower.Races.WorkersUnion.NagaSlave")
local NagaSlave = ____NagaSlave.NagaSlave
local ____OrcPeon = require("app.src.World.Entity.Tower.Races.WorkersUnion.OrcPeon")
local OrcPeon = ____OrcPeon.OrcPeon
local ____HumanPeasant = require("app.src.World.Entity.Tower.Races.WorkersUnion.HumanPeasant")
local HumanPeasant = ____HumanPeasant.HumanPeasant
local ____UndeadAcolyte = require("app.src.World.Entity.Tower.Races.WorkersUnion.UndeadAcolyte")
local UndeadAcolyte = ____UndeadAcolyte.UndeadAcolyte
local ____NightElfWisp = require("app.src.World.Entity.Tower.Races.WorkersUnion.NightElfWisp")
local NightElfWisp = ____NightElfWisp.NightElfWisp
____exports.WorkersUnionTowers = {}
local WorkersUnionTowers = ____exports.WorkersUnionTowers
WorkersUnionTowers.name = "WorkersUnionTowers"
WorkersUnionTowers.__index = WorkersUnionTowers
WorkersUnionTowers.prototype = {}
WorkersUnionTowers.prototype.__index = WorkersUnionTowers.prototype
WorkersUnionTowers.prototype.constructor = WorkersUnionTowers
WorkersUnionTowers.____super = RaceTowers
setmetatable(WorkersUnionTowers, WorkersUnionTowers.____super)
setmetatable(WorkersUnionTowers.prototype, WorkersUnionTowers.____super.prototype)
function WorkersUnionTowers.new(...)
    local self = setmetatable({}, WorkersUnionTowers.prototype)
    self:____constructor(...)
    return self
end
function WorkersUnionTowers.prototype.AddTowersToList(self, list)
    list:add(
        FourCC("h03G"),
        NagaSlave
    )
    list:add(
        FourCC("h03E"),
        OrcPeon
    )
    list:add(
        FourCC("h03F"),
        HumanPeasant
    )
    list:add(
        FourCC("h03I"),
        UndeadAcolyte
    )
    list:add(
        FourCC("h03H"),
        NightElfWisp
    )
end
return ____exports
