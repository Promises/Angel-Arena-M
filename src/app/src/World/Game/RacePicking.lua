--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local ____hybridRandomGEN = require("app.src.Generated.hybridRandomGEN")
local HybridTierEight = ____hybridRandomGEN.HybridTierEight
local HybridTierFive = ____hybridRandomGEN.HybridTierFive
local HybridTierFour = ____hybridRandomGEN.HybridTierFour
local HybridTierNine = ____hybridRandomGEN.HybridTierNine
local HybridTierOne = ____hybridRandomGEN.HybridTierOne
local HybridTierSeven = ____hybridRandomGEN.HybridTierSeven
local HybridTierSix = ____hybridRandomGEN.HybridTierSix
local HybridTierThree = ____hybridRandomGEN.HybridTierThree
local HybridTierTwo = ____hybridRandomGEN.HybridTierTwo
____exports.RacePicking = {}
local RacePicking = ____exports.RacePicking
RacePicking.name = "RacePicking"
RacePicking.__index = RacePicking
RacePicking.prototype = {}
RacePicking.prototype.__index = RacePicking.prototype
RacePicking.prototype.constructor = RacePicking
function RacePicking.new(...)
    local self = setmetatable({}, RacePicking.prototype)
    self:____constructor(...)
    return self
end
function RacePicking.prototype.____constructor(self, game)
    self.HybridPool = Map.new()
    self.game = game
    self.raceSelectTrigger = Trigger.new()
    self.raceSelectTrigger:RegisterAnyUnitEventBJ(EVENT_PLAYER_UNIT_SELL_ITEM)
    self.raceSelectTrigger:AddCondition(
        function() return self:RaceSelectionConditions() end
    )
    self.raceSelectTrigger:AddAction(
        function() return self:RaceSelectionActions() end
    )
    self:CreateHybridPool()
    CreateUnit(
        Player(PLAYER_NEUTRAL_PASSIVE),
        FourCC("h03Q"),
        -1920,
        3000,
        0
    )
    CreateUnit(
        Player(PLAYER_NEUTRAL_PASSIVE),
        FourCC("h00H"),
        -1920,
        2624,
        0
    )
    CreateUnit(
        Player(PLAYER_NEUTRAL_PASSIVE),
        FourCC("h00O"),
        -1920,
        2240,
        0
    )
    CreateUnit(
        Player(PLAYER_NEUTRAL_PASSIVE),
        FourCC("h03C"),
        -1920,
        1856,
        0
    )
    CreateUnit(
        Player(PLAYER_NEUTRAL_PASSIVE),
        FourCC("h03K"),
        -1920,
        1472,
        0
    )
    for player in __TS__Iterator(
        self.game.players:values()
    ) do
        CreateUnit(
            player.wcPlayer,
            FourCC("e00C"),
            -1920,
            3000,
            0
        )
        CreateUnit(
            player.wcPlayer,
            FourCC("e00C"),
            -1920,
            2624,
            0
        )
        CreateUnit(
            player.wcPlayer,
            FourCC("e00C"),
            -1920,
            2240,
            0
        )
        CreateUnit(
            player.wcPlayer,
            FourCC("e00C"),
            -1920,
            1856,
            0
        )
        CreateUnit(
            player.wcPlayer,
            FourCC("e00C"),
            -1920,
            1472,
            0
        )
    end
end
function RacePicking.prototype.RaceSelectionConditions(self)
    if GetUnitTypeId(
        GetSellingUnit()
    ) == FourCC("h03Q") then
        return true
    end
    if GetUnitTypeId(
        GetSellingUnit()
    ) == FourCC("h00H") then
        return true
    end
    if GetUnitTypeId(
        GetSellingUnit()
    ) == FourCC("h00O") then
        return true
    end
    if GetUnitTypeId(
        GetSellingUnit()
    ) == FourCC("h03C") then
        return true
    end
    if GetUnitTypeId(
        GetSellingUnit()
    ) == FourCC("h03K") then
        return true
    end
    return false
end
function RacePicking.prototype.PickRaceForPlayerByItem(self, player, raceItem)
    if raceItem == FourCC("I00W") then
        if player.hasHybridRandomed then
            player:giveLumber(1)
            player:sendMessage("You can only use Hybrid Random!")
        else
            if not player.hasHardcoreRandomed then
                if player.repickCounter == 0 then
                    player.hasHardcoreRandomed = true
                    self:HardCoreRandomRace(player)
                    player:giveGold(50)
                else
                    player:giveLumber(1)
                    player:sendMessage("You can\'t hardcore random after using normal random!")
                end
            else
                player:giveLumber(1)
            end
        end
    elseif raceItem == FourCC("I00V") then
        if player.hasHybridRandomed then
            player:giveLumber(1)
            player:sendMessage("You can only use Hybrid Random!")
        else
            if player.repickCounter < 3 then
                player.repickCounter = player.repickCounter + 1
            end
            player:giveGold(40 - 10 * player.repickCounter)
            self:NormalRandomRace(player)
        end
    elseif raceItem == FourCC("I00X") then
        if player.repickCounter == 0 and not player.hasHardcoreRandomed and not player.hasNormalPicked then
            self:HybridRandomRace(player)
            player:giveGold(50)
        else
            player:giveLumber(1)
            player:sendMessage("You can\'t hybrid random after using normal / hardcore random / selection!")
        end
    else
        if player.hasHybridRandomed then
            player:giveLumber(1)
            player:sendMessage("You can only use Hybrid Random!")
        else
            player.hasNormalPicked = true
            self:GetSelectedRace(player, raceItem)
        end
    end
end
function RacePicking.prototype.RaceSelectionActions(self)
    local player = self.game.players:get(
        GetPlayerId(
            GetOwningPlayer(
                GetBuyingUnit()
            )
        )
    )
    if not player then
        return
    end
    self.game.worldMap.playerSpawns[player.id + 1].isOpen = true
    local soldItem = GetItemTypeId(
        GetSoldItem()
    )
    self:PickRaceForPlayerByItem(player, soldItem)
end
function RacePicking.prototype.HardCoreRandomRace(self, player)
    local randomedRace = self:RandomRace(player)
    if randomedRace then
        SendMessage(
            tostring(
                player:getNameWithColour()
            ) .. " has |cFF375FF1ra|r|cFF364CF0nd|r|cFF3535EFom|r|cFF4A34EFed|r " .. tostring(randomedRace.name)
        )
    end
end
function RacePicking.prototype.GiveBuyingPlayerBuilder(self, player, randomedRace)
    randomedRace:pickAction(player)
end
function RacePicking.prototype.GetSelectedRace(self, player, soldItem)
    local race = self:getRaceFromItem(soldItem)
    if race then
        __TS__ArrayPush(player.races, race)
        race:pickAction(player)
        SendMessage(
            tostring(
                player:getNameWithColour()
            ) .. " has chosen " .. tostring(race.name)
        )
    end
end
function RacePicking.prototype.getRaceFromItem(self, soldItem)
    for ____, race in ipairs(self.game.worldMap.races) do
        if FourCC(race.itemid) == soldItem then
            return race
        end
    end
    return nil
end
function RacePicking.prototype.NormalRandomRace(self, player)
    local randomedRace = self:RandomRace(player)
    if randomedRace then
        SendMessage(
            tostring(
                player:getNameWithColour()
            ) .. " has |cFF375FF1ra|r|cFF364CF0nd|r|cFF3535EFom|r|cFF4A34EFed|r " .. tostring(randomedRace.name)
        )
    end
end
function RacePicking.prototype.RandomRace(self, player)
    local randomNumber = Util:RandomInt(0, #self.game.worldMap.races - 1)
    if #self.game.worldMap.races - #player.races <= self.game.worldMap.disabledRaces then
        player:giveLumber(1)
        return
    end
    local randomedRace = self.game.worldMap.races[randomNumber + 1]
    if not randomedRace.enabled then
        return self:RandomRace(player)
    end
    if player:hasRace(randomedRace) then
        return self:RandomRace(player)
    end
    __TS__ArrayPush(player.races, randomedRace)
    self:GiveBuyingPlayerBuilder(player, randomedRace)
    return randomedRace
end
function RacePicking.prototype.randomChoice(self, myarr, blacklist)
    if blacklist == nil then
        blacklist = {}
    end
    local choice = myarr[math.floor(
        math.random() * #myarr
    ) + 1]
    if __TS__ArrayIndexOf(blacklist, choice) >= 0 then
        choice = self:randomChoice(myarr, blacklist)
    end
    return choice
end
function RacePicking.prototype.HybridRandomRace(self, player)
    local t1 = self:randomChoice(HybridTierOne, player.hybridTowers).id
    local t2 = self:randomChoice(HybridTierTwo, player.hybridTowers).id
    local t3 = self:randomChoice(HybridTierThree, player.hybridTowers).id
    local t4 = self:randomChoice(HybridTierFour, player.hybridTowers).id
    local t5 = self:randomChoice(HybridTierFive, player.hybridTowers).id
    local t6 = self:randomChoice(HybridTierSix, player.hybridTowers).id
    local t7 = self:randomChoice(HybridTierSeven, player.hybridTowers).id
    local t8 = self:randomChoice(HybridTierEight, player.hybridTowers).id
    local t9 = self:randomChoice(HybridTierNine, player.hybridTowers).id
    player.hybridTowers = {}
    __TS__ArrayPush(player.hybridTowers, t1)
    __TS__ArrayPush(player.hybridTowers, t2)
    __TS__ArrayPush(player.hybridTowers, t3)
    __TS__ArrayPush(player.hybridTowers, t4)
    __TS__ArrayPush(player.hybridTowers, t5)
    __TS__ArrayPush(player.hybridTowers, t6)
    __TS__ArrayPush(player.hybridTowers, t7)
    __TS__ArrayPush(player.hybridTowers, t8)
    __TS__ArrayPush(player.hybridTowers, t9)
    if not player.hasHybridRandomed then
        player.hybridBuilder = CreateUnit(
            player.wcPlayer,
            FourCC("e00I"),
            player:getCenterX(),
            player:getCenterY(),
            0
        )
    end
    player.hasHybridRandomed = true
    for ____, tower in ipairs(HybridTierOne) do
        if tower.id ~= t1 then
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                false,
                player.wcPlayer
            )
        else
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                true,
                player.wcPlayer
            )
        end
    end
    for ____, tower in ipairs(HybridTierTwo) do
        if tower.id ~= t2 then
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                false,
                player.wcPlayer
            )
        else
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                true,
                player.wcPlayer
            )
        end
    end
    for ____, tower in ipairs(HybridTierThree) do
        if tower.id ~= t3 then
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                false,
                player.wcPlayer
            )
        else
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                true,
                player.wcPlayer
            )
        end
    end
    for ____, tower in ipairs(HybridTierFour) do
        if tower.id ~= t4 then
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                false,
                player.wcPlayer
            )
        else
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                true,
                player.wcPlayer
            )
        end
    end
    for ____, tower in ipairs(HybridTierFive) do
        if tower.id ~= t5 then
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                false,
                player.wcPlayer
            )
        else
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                true,
                player.wcPlayer
            )
        end
    end
    for ____, tower in ipairs(HybridTierSix) do
        if tower.id ~= t6 then
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                false,
                player.wcPlayer
            )
        else
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                true,
                player.wcPlayer
            )
        end
    end
    for ____, tower in ipairs(HybridTierSeven) do
        if tower.id ~= t7 then
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                false,
                player.wcPlayer
            )
        else
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                true,
                player.wcPlayer
            )
        end
    end
    for ____, tower in ipairs(HybridTierEight) do
        if tower.id ~= t8 then
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                false,
                player.wcPlayer
            )
        else
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                true,
                player.wcPlayer
            )
        end
    end
    for ____, tower in ipairs(HybridTierNine) do
        if tower.id ~= t9 then
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                false,
                player.wcPlayer
            )
        else
            SetPlayerUnitAvailableBJ(
                FourCC(tower.id),
                true,
                player.wcPlayer
            )
        end
    end
    SendMessage(
        tostring(
            player:getNameWithColour()
        ) .. " has |cFFB0F442hy|r|cFF8CF442b|r|cFF42F4C5r|r|cFF42F4F1id|r randomed!"
    )
end
function RacePicking.prototype.CreateHybridPool(self)
    __TS__ArrayForEach(
        HybridTierEight,
        function(____, d) return self.HybridPool:set(d.id, d) end
    )
    __TS__ArrayForEach(
        HybridTierFive,
        function(____, d) return self.HybridPool:set(d.id, d) end
    )
    __TS__ArrayForEach(
        HybridTierFour,
        function(____, d) return self.HybridPool:set(d.id, d) end
    )
    __TS__ArrayForEach(
        HybridTierNine,
        function(____, d) return self.HybridPool:set(d.id, d) end
    )
    __TS__ArrayForEach(
        HybridTierOne,
        function(____, d) return self.HybridPool:set(d.id, d) end
    )
    __TS__ArrayForEach(
        HybridTierSeven,
        function(____, d) return self.HybridPool:set(d.id, d) end
    )
    __TS__ArrayForEach(
        HybridTierSix,
        function(____, d) return self.HybridPool:set(d.id, d) end
    )
    __TS__ArrayForEach(
        HybridTierThree,
        function(____, d) return self.HybridPool:set(d.id, d) end
    )
    __TS__ArrayForEach(
        HybridTierTwo,
        function(____, d) return self.HybridPool:set(d.id, d) end
    )
end
return ____exports
