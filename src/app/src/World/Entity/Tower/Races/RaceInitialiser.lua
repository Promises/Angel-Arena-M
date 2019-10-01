--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____TowerMap = require("app.src.World.Entity.Tower.Specs.TowerMap")
local TowerMap = ____TowerMap.TowerMap
local ____AllianceOfBladesTowers = require("app.src.World.Entity.Tower.Races.AllianceOfBlades.AllianceOfBladesTowers")
local AllianceOfBladesTowers = ____AllianceOfBladesTowers.AllianceOfBladesTowers
local ____ArachnidTowers = require("app.src.World.Entity.Tower.Races.Arachnid.ArachnidTowers")
local ArachnidTowers = ____ArachnidTowers.ArachnidTowers
local ____AviariesTowers = require("app.src.World.Entity.Tower.Races.Aviaries.AviariesTowers")
local AviariesTowers = ____AviariesTowers.AviariesTowers
local ____CavernousCreaturesTowers = require("app.src.World.Entity.Tower.Races.CavernousCreatures.CavernousCreaturesTowers")
local CavernousCreaturesTowers = ____CavernousCreaturesTowers.CavernousCreaturesTowers
local ____CorruptedNightElfTowers = require("app.src.World.Entity.Tower.Races.CorruptedNightElves.CorruptedNightElfTowers")
local CorruptedNightElfTowers = ____CorruptedNightElfTowers.CorruptedNightElfTowers
local ____DemonTowers = require("app.src.World.Entity.Tower.Races.Demon.DemonTowers")
local DemonTowers = ____DemonTowers.DemonTowers
local ____DraeneiTowers = require("app.src.World.Entity.Tower.Races.Draenei.DraeneiTowers")
local DraeneiTowers = ____DraeneiTowers.DraeneiTowers
local ____DwarfTowers = require("app.src.World.Entity.Tower.Races.Dwaven.DwarfTowers")
local DwarfTowers = ____DwarfTowers.DwarfTowers
local ____ElementalistTowers = require("app.src.World.Entity.Tower.Races.Elementalist.ElementalistTowers")
local ElementalistTowers = ____ElementalistTowers.ElementalistTowers
local ____ForestTrollTowers = require("app.src.World.Entity.Tower.Races.ForestTrolls.ForestTrollTowers")
local ForestTrollTowers = ____ForestTrollTowers.ForestTrollTowers
local ____ForsakenTowers = require("app.src.World.Entity.Tower.Races.Forsaken.ForsakenTowers")
local ForsakenTowers = ____ForsakenTowers.ForsakenTowers
local ____GalaxyTowers = require("app.src.World.Entity.Tower.Races.Galaxy.GalaxyTowers")
local GalaxyTowers = ____GalaxyTowers.GalaxyTowers
local ____GiantsTowers = require("app.src.World.Entity.Tower.Races.Giants.GiantsTowers")
local GiantsTowers = ____GiantsTowers.GiantsTowers
local ____GoblinTowers = require("app.src.World.Entity.Tower.Races.Goblin.GoblinTowers")
local GoblinTowers = ____GoblinTowers.GoblinTowers
local ____HighElvenTowers = require("app.src.World.Entity.Tower.Races.HighElven.HighElvenTowers")
local HighElvenTowers = ____HighElvenTowers.HighElvenTowers
local ____HumanTowers = require("app.src.World.Entity.Tower.Races.Human.HumanTowers")
local HumanTowers = ____HumanTowers.HumanTowers
local ____IceTrollTowers = require("app.src.World.Entity.Tower.Races.IceTrolls.IceTrollTowers")
local IceTrollTowers = ____IceTrollTowers.IceTrollTowers
local ____NightElfTowers = require("app.src.World.Entity.Tower.Races.NightElf.NightElfTowers")
local NightElfTowers = ____NightElfTowers.NightElfTowers
local ____OrcStrongholdTowers = require("app.src.World.Entity.Tower.Races.OrcStronghold.OrcStrongholdTowers")
local OrcStrongholdTowers = ____OrcStrongholdTowers.OrcStrongholdTowers
local ____OutlandTowers = require("app.src.World.Entity.Tower.Races.Outland.OutlandTowers")
local OutlandTowers = ____OutlandTowers.OutlandTowers
local ____ShrineOfBuffsTowers = require("app.src.World.Entity.Tower.Races.ShrineOfBuffs.ShrineOfBuffsTowers")
local ShrineOfBuffsTowers = ____ShrineOfBuffsTowers.ShrineOfBuffsTowers
local ____SummonsTowers = require("app.src.World.Entity.Tower.Races.Summons.SummonsTowers")
local SummonsTowers = ____SummonsTowers.SummonsTowers
local ____TavernTowers = require("app.src.World.Entity.Tower.Races.Tavern.TavernTowers")
local TavernTowers = ____TavernTowers.TavernTowers
local ____UndeadTowers = require("app.src.World.Entity.Tower.Races.Undead.UndeadTowers")
local UndeadTowers = ____UndeadTowers.UndeadTowers
local ____UniqueTowers = require("app.src.World.Entity.Tower.Races.Unique.UniqueTowers")
local UniqueTowers = ____UniqueTowers.UniqueTowers
local ____VoidTowers = require("app.src.World.Entity.Tower.Races.Void.VoidTowers")
local VoidTowers = ____VoidTowers.VoidTowers
local ____WorkersUnionTowers = require("app.src.World.Entity.Tower.Races.WorkersUnion.WorkersUnionTowers")
local WorkersUnionTowers = ____WorkersUnionTowers.WorkersUnionTowers
local ____AntiJuggleTower = require("app.src.World.Entity.AntiJuggle.AntiJuggleTower")
local AntiJuggleTower = ____AntiJuggleTower.AntiJuggleTower
local ____NaxxramasTowers = require("app.src.World.Entity.Tower.Races.Naxxramas.NaxxramasTowers")
local NaxxramasTowers = ____NaxxramasTowers.NaxxramasTowers
function ____exports.InitialiseAllRaceTowers(self)
    local _towerTypes = TowerMap.new()
    local races = {}
    __TS__ArrayPush(
        races,
        AllianceOfBladesTowers.new()
    )
    __TS__ArrayPush(
        races,
        ArachnidTowers.new()
    )
    __TS__ArrayPush(
        races,
        AviariesTowers.new()
    )
    __TS__ArrayPush(
        races,
        CavernousCreaturesTowers.new()
    )
    __TS__ArrayPush(
        races,
        CorruptedNightElfTowers.new()
    )
    __TS__ArrayPush(
        races,
        DemonTowers.new()
    )
    __TS__ArrayPush(
        races,
        DraeneiTowers.new()
    )
    __TS__ArrayPush(
        races,
        DwarfTowers.new()
    )
    __TS__ArrayPush(
        races,
        ElementalistTowers.new()
    )
    __TS__ArrayPush(
        races,
        ForestTrollTowers.new()
    )
    __TS__ArrayPush(
        races,
        ForsakenTowers.new()
    )
    __TS__ArrayPush(
        races,
        GalaxyTowers.new()
    )
    __TS__ArrayPush(
        races,
        GiantsTowers.new()
    )
    __TS__ArrayPush(
        races,
        GoblinTowers.new()
    )
    __TS__ArrayPush(
        races,
        HighElvenTowers.new()
    )
    __TS__ArrayPush(
        races,
        HumanTowers.new()
    )
    __TS__ArrayPush(
        races,
        IceTrollTowers.new()
    )
    __TS__ArrayPush(
        races,
        NightElfTowers.new()
    )
    __TS__ArrayPush(
        races,
        OrcStrongholdTowers.new()
    )
    __TS__ArrayPush(
        races,
        OutlandTowers.new()
    )
    __TS__ArrayPush(
        races,
        ShrineOfBuffsTowers.new()
    )
    __TS__ArrayPush(
        races,
        SummonsTowers.new()
    )
    __TS__ArrayPush(
        races,
        TavernTowers.new()
    )
    __TS__ArrayPush(
        races,
        UndeadTowers.new()
    )
    __TS__ArrayPush(
        races,
        UniqueTowers.new()
    )
    __TS__ArrayPush(
        races,
        NaxxramasTowers.new()
    )
    __TS__ArrayPush(
        races,
        VoidTowers.new()
    )
    __TS__ArrayPush(
        races,
        WorkersUnionTowers.new()
    )
    __TS__ArrayForEach(
        races,
        function(____, race) return race:AddTowersToList(_towerTypes) end
    )
    _towerTypes:add(
        FourCC("uC14"),
        AntiJuggleTower
    )
    return _towerTypes
end
return ____exports
