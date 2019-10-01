--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____AbstractPlayer = require("app.src.World.Entity.Players.AbstractPlayer")
local AbstractPlayer = ____AbstractPlayer.AbstractPlayer
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local ALLOW_PLAYER_TOWER_LOCATIONS = ____GlobalSettings.ALLOW_PLAYER_TOWER_LOCATIONS
local PLAYER_AREAS = ____GlobalSettings.PLAYER_AREAS
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local ____TimedEvent = require("app.src.lib.WCEventQueue.TimedEvent")
local TimedEvent = ____TimedEvent.TimedEvent
____exports.Defender = {}
local Defender = ____exports.Defender
Defender.name = "Defender"
Defender.__index = Defender
Defender.prototype = {}
Defender.prototype.____getters = {}
Defender.prototype.__index = __TS__Index(Defender.prototype)
Defender.prototype.____setters = {}
Defender.prototype.__newindex = __TS__NewIndex(Defender.prototype)
Defender.prototype.constructor = Defender
Defender.____super = AbstractPlayer
setmetatable(Defender, Defender.____super)
setmetatable(Defender.prototype, Defender.____super.prototype)
function Defender.new(...)
    local self = setmetatable({}, Defender.prototype)
    self:____constructor(...)
    return self
end
function Defender.prototype.____constructor(self, id, game)
    AbstractPlayer.prototype.____constructor(self, id)
    self.chimeraCount = 0
    self.zerglings = 0
    self.loggedDebug = false
    self.seaElemetals = 0
    self.goldReward = 0
    self._voidFragments = 0
    self._voidFragmentTick = 0
    self._scoreSlot = 0
    self._kills = 0
    self._hasHybridRandomed = false
    self._hasHardcoreRandomed = false
    self._hasNormalPicked = false
    self._races = {}
    self._totalMazeLength = 0
    self.towersEnabled = true
    self._repickCounter = 0
    self._hybridTowers = {}
    self.deniedPlayers = Map.new()
    self._towersArray = {}
    self.holoMaze = nil
    self._builders = {}
    self._towerForces = Map.new()
    self.protectedTowers = {
        FourCC("n01D"),
        FourCC("n01E"),
        FourCC("n01F"),
        FourCC("n01G"),
        FourCC("n01I"),
        FourCC("n009")
    }
    self.game = game
    self:setUpPlayerVariables()
    self.leaveTrigger = Trigger.new()
    self.leaveTrigger:RegisterPlayerEventLeave(self)
    self.leaveTrigger:AddCondition(
        function() return self:PlayerLeftTheGameConditions(game) end
    )
    self.leaveTrigger:AddAction(
        function() return self:PlayerLeftTheGame() end
    )
    self.selectUnitTrigger = Trigger.new()
    self.selectUnitTrigger:RegisterPlayerUnitEvent(self.wcPlayer, EVENT_PLAYER_UNIT_SELECTED)
    self.selectUnitTrigger:AddAction(
        function() return self:SelectUnit() end
    )
    self.game.gameCommandHandler.commandTrigger:RegisterPlayerChatEvent(self.wcPlayer, "", false)
end
function Defender.prototype.____getters.towerForces(self)
    return self._towerForces
end
function Defender.prototype.____getters.builders(self)
    return self._builders
end
function Defender.prototype.____getters.totalMazeLength(self)
    return self._totalMazeLength
end
function Defender.prototype.____getters.hybridTowers(self)
    return self._hybridTowers
end
function Defender.prototype.____getters.hasHardcoreRandomed(self)
    return self._hasHardcoreRandomed
end
function Defender.prototype.____getters.hasNormalPicked(self)
    return self._hasNormalPicked
end
function Defender.prototype.____getters.races(self)
    return self._races
end
function Defender.prototype.____getters.towersArray(self)
    return self._towersArray
end
function Defender.prototype.____getters.hybridBuilder(self)
    return self._hybridBuilder
end
function Defender.prototype.____getters.hasHybridRandomed(self)
    return self._hasHybridRandomed
end
function Defender.prototype.____getters.lootBoxer(self)
    return self._lootBoxer
end
function Defender.prototype.____getters.voidBuilder(self)
    return self._voidBuilder
end
function Defender.prototype.____getters.repickCounter(self)
    return self._repickCounter
end
function Defender.prototype.____getters.kills(self)
    return self._kills
end
function Defender.prototype.____getters.scoreSlot(self)
    return self._scoreSlot
end
function Defender.prototype.____setters.builders(self, value)
    self._builders = value
end
function Defender.prototype.____setters.totalMazeLength(self, value)
    self._totalMazeLength = value
end
function Defender.prototype.____setters.hybridTowers(self, value)
    self._hybridTowers = value
end
function Defender.prototype.____setters.hasHardcoreRandomed(self, value)
    self._hasHardcoreRandomed = value
end
function Defender.prototype.____setters.hasNormalPicked(self, value)
    self._hasNormalPicked = value
end
function Defender.prototype.____setters.races(self, value)
    self._races = value
end
function Defender.prototype.____setters.hybridBuilder(self, value)
    self._hybridBuilder = value
end
function Defender.prototype.____setters.hasHybridRandomed(self, value)
    self._hasHybridRandomed = value
end
function Defender.prototype.____setters.lootBoxer(self, value)
    self._lootBoxer = value
end
function Defender.prototype.____setters.voidBuilder(self, value)
    self._voidBuilder = value
end
function Defender.prototype.____setters.repickCounter(self, value)
    self._repickCounter = value
end
function Defender.prototype.____setters.kills(self, value)
    self._kills = value
end
function Defender.prototype.____setters.scoreSlot(self, value)
    self._scoreSlot = value
end
function Defender.prototype.setHoloMaze(self, holoMaze)
    if self.holoMaze ~= nil then
        self.holoMaze:Destroy()
    end
    self.holoMaze = holoMaze
end
function Defender.prototype.setUpPlayerVariables(self)
    CreateFogModifierRectBJ(
        true,
        self.wcPlayer,
        FOG_OF_WAR_VISIBLE,
        GetPlayableMapRect()
    )
    SetPlayerStateBJ(self.wcPlayer, PLAYER_STATE_RESOURCE_GOLD, self.id == COLOUR.GRAY and 150 or 100)
    SetPlayerStateBJ(self.wcPlayer, PLAYER_STATE_RESOURCE_LUMBER, 1)
    local allowTowerLoc = ALLOW_PLAYER_TOWER_LOCATIONS[self.id + 1]
    self.allowPlayerTower = CreateUnit(
        self.wcPlayer,
        FourCC("h03S"),
        allowTowerLoc.x,
        allowTowerLoc.y,
        0
    )
    SetUnitVertexColor(self.allowPlayerTower, 0, 255, 0, 255)
end
function Defender.prototype.hasRace(self, race)
    return __TS__ArrayIndexOf(self._races, race) ~= -1
end
function Defender.prototype.getArea(self)
    return PLAYER_AREAS[self.id + 1]
end
function Defender.prototype.getCenterX(self)
    local x1 = self:getArea().minX
    local x2 = self:getArea().maxX
    return (x1 + x2) / 2
end
function Defender.prototype.getCenterY(self)
    local y1 = self:getArea().minY
    local y2 = self:getArea().maxY
    return (y1 + y2) / 2
end
function Defender.prototype.getVoidBuilder(self)
    return self._voidBuilder
end
function Defender.prototype.getLootBoxer(self)
    return self._lootBoxer
end
function Defender.prototype.getRectangle(self)
    return self:getArea()
end
function Defender.prototype.PlayerLeftTheGameConditions(self, game)
    if game.gameLives > 0 then
        return true
    end
    SendMessage(
        tostring(
            self:getNameWithColour()
        ) .. " has left the game!"
    )
    return false
end
function Defender.prototype.PlayerLeftTheGame(self)
    SendMessage(
        tostring(
            self:getNameWithColour()
        ) .. " has left the game!"
    )
    self.game.worldMap.playerSpawns[self.id + 1].isOpen = false
    if self.game.scoreBoard and self._scoreSlot > -1 then
        MultiboardSetItemValueBJ(
            self.game.scoreBoard.board,
            1,
            7 + self._scoreSlot,
            Util:ColourString(
                self:getColourCode(),
                "<Quit>"
            )
        )
        self._scoreSlot = -1
    end
    for ____, builder in ipairs(self.builders) do
        RemoveUnit(builder)
    end
    if self.hybridBuilder then
        RemoveUnit(self.hybridBuilder)
    end
    local leaveFunction = TimedEvent.new(
        function() return self:AfterPlayerLeft() end,
        20
    )
    self.game.timedEventQueue:AddEvent(leaveFunction)
end
function Defender.prototype.AfterPlayerLeft(self)
    self.game.safeEventQueue:AddMed(
        function() return self:DistributeAndDestroyTowers() end
    )
    self:setHoloMaze(nil)
    return true
end
function Defender.prototype.AddTower(self, tower)
    __TS__ArrayPush(self._towersArray, tower)
end
function Defender.prototype.GiveKillCount(self)
    self._kills = self._kills + 1
    if self.game.scoreBoard then
        MultiboardSetItemValueBJ(
            self.game.scoreBoard.board,
            2,
            7 + self._scoreSlot,
            tostring(self._kills)
        )
    end
    if self.killHook then
        self:killHook()
    end
end
function Defender.prototype.GetTower(self, id)
    local indx = __TS__ArrayFindIndex(
        self._towersArray,
        function(____, element) return element.UniqueID == id end
    )
    if indx >= 0 then
        return self._towersArray[indx + 1]
    end
    return nil
end
function Defender.prototype.DistributePlayerGold(self)
    local leavingPlayerGold = self:getGold()
    local goldDistribution = leavingPlayerGold / (self.game.players.size - 1)
    goldDistribution = math.floor(goldDistribution * 0.3)
    for player in __TS__Iterator(
        self.game.players:values()
    ) do
        player:sendMessage(
            "You have received |cffffcc00" .. tostring(goldDistribution) .. "|r gold from the leaving player!"
        )
        player:giveGold(goldDistribution)
    end
end
function Defender.prototype.DistributeAndDestroyTowers(self)
    if #self._towersArray > 0 then
        local tower = self._towersArray[1]
        if tower then
            self.game.sellTower:SellTower(tower.tower)
            return false
        end
    end
    self:DistributePlayerGold()
    self:setGold(0)
    self.game.players:delete(self.id)
    return true
end
function Defender.prototype.ClaimTowers(self)
    local rectangle = self:getRectangle():toRect()
    local grp = GetUnitsInRectMatching(
        rectangle,
        Condition(
            function() return self:IsOwnerNotMe() end
        )
    )
    ForGroupBJ(
        grp,
        function() return self:ClaimTower() end
    )
    RemoveRect(rectangle)
    DestroyGroup(grp)
end
function Defender.prototype.ClaimTower(self)
    if IsUnitType(
        GetEnumUnit(),
        UNIT_TYPE_STRUCTURE
    ) then
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(
                    GetEnumUnit()
                )
            )
        )
        if owner then
            local tower = owner:GetTower(
                GetHandleIdBJ(
                    GetEnumUnit()
                )
            )
            if tower then
                tower:Sell()
                tower:SetOwnership(self)
            end
        end
    elseif not IsUnitType(
        GetEnumUnit(),
        UNIT_TYPE_SUMMONED
    ) then
        local owner = self.game.players:get(
            GetPlayerId(
                GetOwningPlayer(
                    GetEnumUnit()
                )
            )
        )
        if owner and owner ~= self then
            SetUnitPosition(
                GetEnumUnit(),
                owner:getCenterX(),
                owner:getCenterY()
            )
        end
    end
end
function Defender.prototype.DisableTowers(self)
    self.towersEnabled = not self.towersEnabled
    __TS__ArrayForEach(
        self.towersArray,
        function(____, tower)
            if tower:GetSellValue() <= 10 and not (__TS__ArrayIndexOf(
                self.protectedTowers,
                tower:GetTypeID()
            ) >= 0) then
                if self.towersEnabled then
                    PauseUnitBJ(false, tower.tower)
                else
                    PauseUnitBJ(true, tower.tower)
                end
            end
        end
    )
    if self.towersEnabled then
        self:sendMessage("Towers enabled")
    else
        self:sendMessage("Towers disabled")
    end
end
function Defender.prototype.GetVoidFragments(self)
    return self._voidFragments
end
function Defender.prototype.GetVoidFragmentTick(self)
    return self._voidFragmentTick
end
function Defender.prototype.SetVoidFragments(self, value)
    self._voidFragments = value
end
function Defender.prototype.SetVoidFragmentTick(self, value)
    self._voidFragmentTick = value
end
function Defender.prototype.HasDenied(self, num)
    return not not self.deniedPlayers:get(num)
end
function Defender.prototype.ReRenderAllowPlayersTower(self)
    local red = 0
    local green = 255
    local allowTower = self.allowPlayerTower
    if allowTower then
        self.deniedPlayers:forEach(
            function(____, value, key)
                if value then
                    if GetLocalPlayer() == Player(key) then
                        red = 255
                        green = 0
                    end
                end
            end
        )
        SetUnitVertexColor(allowTower, red, green, 0, 255)
    end
end
function Defender.prototype.DenyAllPlayers(self)
    self.game.players:forEach(
        function(____, player)
            if self.id ~= player.id then
                self.deniedPlayers:set(player.id, true)
            end
        end
    )
    self:ReRenderAllowPlayersTower()
end
function Defender.prototype.DenyPlayer(self, num)
    self.deniedPlayers:set(num, true)
    self:ReRenderAllowPlayersTower()
end
function Defender.prototype.AllowAllPlayers(self)
    self.game.players:forEach(
        function(____, player)
            if self.id ~= player.id then
                self.deniedPlayers:set(player.id, false)
            end
        end
    )
    self:ReRenderAllowPlayersTower()
end
function Defender.prototype.AllowPlayer(self, num)
    self.deniedPlayers:set(num, false)
    self:ReRenderAllowPlayersTower()
end
function Defender.prototype.DestroyLeftoverUnits(self)
    if GetOwningPlayer(
        GetEnumUnit()
    ) == GetTriggerPlayer() then
        RemoveUnit(
            GetEnumUnit()
        )
    end
end
function Defender.prototype.GetLogStr(self)
    return "{\"colour\":" .. tostring(self.id) .. ", \"name\": \"" .. tostring(
        self:getPlayerName()
    ) .. "\"}"
end
function Defender.prototype.IsOwnerNotMe(self)
    return GetOwningPlayer(
        GetFilterUnit()
    ) ~= self.wcPlayer
end
function Defender.prototype.RemoveTower(self, handleId)
    self._towersArray = __TS__ArrayFilter(
        self._towersArray,
        function(____, elem) return elem.UniqueID ~= handleId end
    )
end
function Defender.prototype.SelectUnit(self)
    if GetOwningPlayer(
        GetTriggerUnit()
    ) == self.wcPlayer then
        PauseUnit(
            GetTriggerUnit(),
            false
        )
    end
end
return ____exports
