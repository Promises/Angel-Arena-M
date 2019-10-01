--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____GlobalSettings = require("app.src.World.GlobalSettings")
local COLOUR_CODES = ____GlobalSettings.COLOUR_CODES
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
local ____AdvancedHoloMaze = require("app.src.World.Holograms.AdvancedHoloMaze")
local AdvancedHoloMaze = ____AdvancedHoloMaze.AdvancedHoloMaze
local ____SimpleHoloMaze = require("app.src.World.Holograms.SimpleHoloMaze")
local SimpleHoloMaze = ____SimpleHoloMaze.SimpleHoloMaze
local ____CircleHoloMaze = require("app.src.World.Holograms.CircleHoloMaze")
local CircleHoloMaze = ____CircleHoloMaze.CircleHoloMaze
local ____TimedEvent = require("app.src.lib.WCEventQueue.TimedEvent")
local TimedEvent = ____TimedEvent.TimedEvent
local ____DummyPlayer = require("app.src.World.Entity.EmulatedPlayer.DummyPlayer")
local DummyPlayer = ____DummyPlayer.DummyPlayer
____exports.Commands = {}
local Commands = ____exports.Commands
Commands.name = "Commands"
Commands.__index = Commands
Commands.prototype = {}
Commands.prototype.__index = Commands.prototype
Commands.prototype.constructor = Commands
function Commands.new(...)
    local self = setmetatable({}, Commands.prototype)
    self:____constructor(...)
    return self
end
function Commands.prototype.____constructor(self, game)
    self.voteKickInProgress = false
    self.hasVotedToKick = {}
    self.voteKickTimer = CreateTimer()
    self.drawings = {}
    self.game = game
    self.commandTrigger = Trigger.new()
    self.commandTrigger:AddAction(
        function() return self:handleCommand() end
    )
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            self.hasVotedToKick[i + 1] = false
            i = i + 1
        end
    end
end
function Commands.prototype.handleDebugCommand(self, player, command, command2)
    Log.Debug(
        Util:ArraysToString(command)
    )
    local amount = 0
    local ____switch5 = command[1]
    if ____switch5 == "dummy" then
        goto ____switch5_case_0
    end
    if ____switch5 == "ui" then
        goto ____switch5_case_1
    end
    if ____switch5 == "openall" then
        goto ____switch5_case_2
    end
    if ____switch5 == "gold" then
        goto ____switch5_case_3
    end
    if ____switch5 == "lumber" then
        goto ____switch5_case_4
    end
    if ____switch5 == "lives" then
        goto ____switch5_case_5
    end
    if ____switch5 == "closeall" then
        goto ____switch5_case_6
    end
    if ____switch5 == "diff" then
        goto ____switch5_case_7
    end
    if ____switch5 == "wave" then
        goto ____switch5_case_8
    end
    if ____switch5 == "draw" then
        goto ____switch5_case_9
    end
    if ____switch5 == "undraw" then
        goto ____switch5_case_10
    end
    if ____switch5 == "killall" then
        goto ____switch5_case_11
    end
    if ____switch5 == "events" then
        goto ____switch5_case_12
    end
    if ____switch5 == "timer" then
        goto ____switch5_case_13
    end
    if ____switch5 == "start" then
        goto ____switch5_case_14
    end
    if ____switch5 == "startwave" then
        goto ____switch5_case_15
    end
    if ____switch5 == "leave" then
        goto ____switch5_case_16
    end
    if ____switch5 == "spawn" then
        goto ____switch5_case_17
    end
    if ____switch5 == "tm" then
        goto ____switch5_case_18
    end
    if ____switch5 == "sanity" then
        goto ____switch5_case_19
    end
    if ____switch5 == "time" then
        goto ____switch5_case_20
    end
    goto ____switch5_end
    ::____switch5_case_0::
    do
        local dummy11 = DummyPlayer.new(self.game, 2)
        goto ____switch5_end
    end
    ::____switch5_case_1::
    do
        CreateDestructable(
            FourCC("YTpc"),
            0,
            0,
            bj_UNIT_FACING,
            1,
            0
        )
        CreateDestructable(
            FourCC("YTpc"),
            0 + 128,
            0,
            bj_UNIT_FACING,
            1,
            0
        )
        CreateDestructable(
            FourCC("YTpc"),
            0 - 128,
            0,
            bj_UNIT_FACING,
            1,
            0
        )
        goto ____switch5_end
    end
    ::____switch5_case_2::
    do
        player:sendMessage("All spawns are now open!")
        self:OpenAllSpawns()
        goto ____switch5_end
    end
    ::____switch5_case_3::
    do
        amount = Util:ParseInt(command[2])
        if not amount then
            player:sendMessage(
                Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
            )
            return
        end
        player:sendMessage(
            "Gold was set to |cFFFFCC00" .. tostring(amount) .. "|r"
        )
        player:setGold(amount)
        goto ____switch5_end
    end
    ::____switch5_case_4::
    do
        amount = Util:ParsePositiveInt(command[2])
        if not amount then
            player:sendMessage(
                Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
            )
            return
        end
        player:sendMessage(
            "Lumber was set to |cFF00C850" .. tostring(amount) .. "|r"
        )
        player:setLumber(amount)
        goto ____switch5_end
    end
    ::____switch5_case_5::
    do
        amount = Util:ParseInt(command[2])
        if not amount then
            player:sendMessage(
                Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
            )
            return
        end
        amount = math.floor(
            __TS__Number(amount)
        )
        self.game.gameLives = amount
        self.game.startLives = amount
        player:sendMessage(
            "Lives were set to |cFFFFCC00" .. tostring(amount) .. "|r"
        )
        goto ____switch5_end
    end
    ::____switch5_case_6::
    do
        player:sendMessage("All spawns are now closed!")
        self:CloseAllSpawns()
        goto ____switch5_end
    end
    ::____switch5_case_7::
    do
        amount = Util:ParsePositiveInt(command[2])
        if not amount then
            player:sendMessage(
                Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
            )
            return
        end
        player:sendMessage(
            "Difficulty was set to " .. tostring(amount) .. "%"
        )
        self.game.diffVote.difficulty = amount
        for ____, enemy in ipairs(self.game.enemies) do
            enemy:setHandicap(amount)
        end
        goto ____switch5_end
    end
    ::____switch5_case_8::
    do
        amount = Util:ParsePositiveInt(command[2])
        if not amount then
            player:sendMessage(
                Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
            )
            return
        end
        if amount > #self.game.worldMap.waveCreeps then
            player:sendMessage(
                Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
            )
            return
        end
        player:sendMessage(
            "Current wave was set to " .. tostring(amount)
        )
        if self.game.worldMap.gameRoundHandler then
            self.game.worldMap.gameRoundHandler.currentWave = amount
        end
        goto ____switch5_end
    end
    ::____switch5_case_9::
    do
        local arr = {}
        local ____switch14 = command[2]
        if ____switch14 == "ab" then
            goto ____switch14_case_0
        end
        if ____switch14 == "antiblock" then
            goto ____switch14_case_1
        end
        goto ____switch14_end
        ::____switch14_case_0::
        ::____switch14_case_1::
        do
            goto ____switch14_end
        end
        ::____switch14_end::
        do
            local i = 0
            while i < #command - 2 do
                if not command[(2 + i) + 1] then
                    Log.Error("Missing arguments")
                    return
                end
                if not arr then
                    Log.Error("invalid array")
                    return
                end
                if not arr[command[(2 + i) + 1] + 1] then
                    Log.Error("invalid index")
                    return
                end
                self:DrawRect(arr[command[(2 + i) + 1] + 1])
                i = i + 1
            end
        end
        goto ____switch5_end
    end
    ::____switch5_case_10::
    do
        self:DestroyDrawings()
        goto ____switch5_end
    end
    ::____switch5_case_11::
    do
        local spawnedCreeps = self.game.worldMap.spawnedCreeps
        if spawnedCreeps then
            spawnedCreeps.unitMap:forEach(
                function(____, u) return KillUnit(u.creep) end
            )
        end
        goto ____switch5_end
    end
    ::____switch5_case_12::
    do
        Log.Debug(
            "TickEvents: " .. tostring(
                self.game.towerTicker:GetTickingTowerCount()
            )
        )
        goto ____switch5_end
    end
    ::____switch5_case_13::
    do
        self:TestTimeout()
        goto ____switch5_end
    end
    ::____switch5_case_14::
    ::____switch5_case_15::
    do
        self.game.waveTimer = 1
        goto ____switch5_end
    end
    ::____switch5_case_16::
    do
        player:PlayerLeftTheGame()
        goto ____switch5_end
    end
    ::____switch5_case_17::
    do
        local id = command2[2]
        if #id == 4 then
            local u = CreateUnit(
                player.wcPlayer,
                FourCC(id),
                BlzGetTriggerPlayerMouseX(),
                BlzGetTriggerPlayerMouseY(),
                bj_UNIT_FACING
            )
            self.game.worldMap.towerConstruction:SetupTower(u, player)
        end
        goto ____switch5_end
    end
    ::____switch5_case_18::
    do
        player:sendMessage(
            Util:ArraysToString(self.game.worldMap.playerMazes[player.id + 1].maze)
        )
        PreloadGenStart()
        self:MazeToString(self.game.worldMap.playerMazes[player.id + 1].maze)
        PreloadGenEnd("testmap.txt")
        goto ____switch5_end
    end
    ::____switch5_case_19::
    do
        self.game.worldMap.playerMazes[player.id + 1]:SanityCheck()
        self.game.worldMap.playerMazes[player.id + 1]:CheckAll()
        goto ____switch5_end
    end
    ::____switch5_case_20::
    do
        amount = Util:ParsePositiveInt(command[2])
        if not amount then
            player:sendMessage(
                Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
            )
            return
        end
        self.game.waveTimer = amount
        goto ____switch5_end
    end
    ::____switch5_end::
end
function Commands.prototype.handleCommand(self)
    local player = self.game.players:get(
        GetPlayerId(
            GetTriggerPlayer()
        )
    )
    if not player then
        return
    end
    if string.sub(
        GetEventPlayerChatString(),
        1,
        0 + 1
    ) ~= "-" then
        Log.Event(
            0,
            "{\"message\":\"" .. tostring(
                GetEventPlayerChatString()
            ) .. "\", \"sender\": \"" .. tostring(
                player:GetLogStr()
            ) .. "\"}"
        )
        return
    end
    local playerCommand = string.lower(
        string.sub(
            GetEventPlayerChatString(),
            2
        )
    )
    local playerCommand2 = string.sub(
        GetEventPlayerChatString(),
        2
    )
    local command = __TS__StringSplit(playerCommand, " ")
    local command2 = __TS__StringSplit(playerCommand2, " ")
    Log.Event(
        4,
        "{\"command\":\"" .. tostring(
            Util:ArraysToString(command)
        ) .. "\", \"sender\": \"" .. tostring(
            player:GetLogStr()
        ) .. "\"}"
    )
    if command[1] == "air" then
        player:sendMessage("|cFF999999Air:|r 5 / 15 / 20 / 25 / 30")
    elseif command[1] == "boss" then
        player:sendMessage("|cFF3737F2Boss:|r 9 / 14 / 19 / 24 / 29 / 31")
    elseif command[1] == "champ" or command[1] == "champion" then
        player:sendMessage("|cFFF2A137Champion:|r 35 / 36")
    elseif command[1] == "light" then
        player:sendMessage("|cFF6d7c86Light:|r 4 / 8 / 11 / 16 / 19 / 23 / 27 / 32")
    elseif command[1] == "medium" then
        player:sendMessage("|cFF416073Medium:|r 3 / 7 / 12 / 17 / 24 / 28 / 33")
    elseif command[1] == "heavy" then
        player:sendMessage("|cFF154360Heavy:|r 2 / 5 / 13 / 15 / 20 / 25 / 30 / 32 / 35")
    elseif command[1] == "fortified" then
        player:sendMessage("|cFFCA8500Fortified:|r 10 / 18 / 22 / 26 / 31")
    elseif command[1] == "hero" then
        player:sendMessage("|cFF7525FFHero:|r 36")
    elseif command[1] == "waves" then
        player:sendMessage("|cFF999999Air:|r 5 / 15 / 20 / 25 / 30\n|cFF3737F2Boss:|r 9 / 14 / 19 / 24 / 29 / 31\n|cFFF2A137Champion:|r 35 / 36\n|cFF6d7c86Light:|r 4 / 8 / 11 / 16 / 19 / 23 / 27 / 32\n|cFF416073Medium:|r 3 / 7 / 12 / 17 / 24 / 28 / 33\n|cFF154360Heavy:|r 2 / 5 / 13 / 15 / 20 / 25 / 30 / 32 / 35\n|cFFCA8500Fortified:|r 10 / 18 / 22 / 26 / 31\n|cFF7525FFHero:|r 36")
    elseif command[1] == "buffs" then
        player:sendMessage("|cFFFFCC00Hardened Skin:|r Creeps ignore 2x creep level incoming physical damage\n" .. "|cFFFFCC00Evasion:|r Creeps will have a 1x creep level chance to evade physical damage\n" .. "|cFFFFCC00Armor Bonus:|r Increases creep armor by creep level divided by 3\n" .. "|cFFFFCC00Cripple Aura:|r Whenever a creep takes damage it has a 10% chance to cripple the attacking tower," .. "slowing attack speed by 1.5% times creep level\n" .. "|cFFFFCC00Spell Shield:|r Blocks targetting spells from casting every 4 (minus 0.1 times creep level) second\n" .. "|cFFFFCC00Tornado Aura:|r Nearby towers are slowed by 1% times creep level\n" .. "|cFFFFCC00Vampiric Aura:|r Creeps have a 10% chance to heal for 4x creep level\n" .. "|cFFFFCC00Divine Shield:|r Creeps ignore damage until they\'ve been damaged 1x creep level times\n" .. "|cFFFFCC00Walk it Off:|r slowed down creeps take 0.5% times creep level less damage\n" .. "|cFFFFCC00Morning Person:|r creeps heal for 0.5% times creep level of their max health every time they " .. "reach a checkpoint (not teleports)")
    elseif command[1] == "repick" then
        if self:RepickConditions(player) then
            self:RepickActions(player)
        else
            DisplayTimedTextToPlayer(
                GetTriggerPlayer(),
                0,
                0,
                5,
                "You can only repick before wave 1!"
            )
        end
    elseif command[1] == "sa" or command[1] == "sellall" then
    elseif command[1] == "y" or command[1] == "yes" then
        self:VoteYes(player)
    elseif command[1] == "kick" or command[1] == "votekick" then
        if command[2] then
            local receiver = self:getPlayerIdFromColourName(command[2])
            local receivingPlayer = self.game.players:get(receiver)
            if receivingPlayer then
                self:VoteKick(player, receivingPlayer)
            else
                player:sendMessage("Player not available")
            end
        end
    elseif command[1] == "give" or command[1] == "send" then
        if command[2] and command[3] then
            local receiver = self:getPlayerIdFromColourName(command[2])
            local receivingPlayer = self.game.players:get(receiver)
            local amount = Util:ParsePositiveInt(command[3])
            if not amount then
                player:sendMessage(
                    Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
                )
                return
            end
            self:giveGoldToPlayer(receivingPlayer, player, amount)
        end
    elseif command[1] == "allow" then
        if command[2] then
            local receiver = self:getPlayerIdFromColourName(command[2])
            local receivingPlayer = self.game.players:get(receiver)
            if receivingPlayer then
                player:AllowPlayer(receivingPlayer.id)
            else
                player:sendMessage(
                    Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Colour")
                )
            end
        end
    elseif command[1] == "deny" then
        if command[2] then
            local receiver = self:getPlayerIdFromColourName(command[2])
            local receivingPlayer = self.game.players:get(receiver)
            if receivingPlayer then
                player:DenyPlayer(receivingPlayer.id)
                player:ClaimTowers()
            else
                player:sendMessage(
                    Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Colour")
                )
            end
        end
    elseif command[1] == "allowall" then
        player:AllowAllPlayers()
        player:sendMessage("ALL players are now |cFF00FF00allowed|r to build in your spawn!")
    elseif command[1] == "denyall" then
        player:DenyAllPlayers()
        player:ClaimTowers()
        player:sendMessage("ALL players are now |cFFFF0000denied|r access to your spawn!")
    elseif command[1] == "claim" then
        player:ClaimTowers()
        player:sendMessage("All towers in your spawn has now been claimed.")
    elseif command[1] == "zoom" or command[1] == "cam" then
        if GetLocalPlayer() == player.wcPlayer then
            local amount = Util:ParsePositiveInt(command[2])
            if not amount then
                player:sendMessage(
                    Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Amount")
                )
                return
            end
            SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, amount, 1)
        end
    elseif command[1] == "dt" or command[1] == "disabletowers" then
        player:DisableTowers()
    elseif command[1] == "buildings" or command[1] == "towers" then
        if command[2] then
            local receiver = self:getPlayerIdFromColourName(command[2])
            local receivingPlayer = self.game.players:get(receiver)
            if receivingPlayer then
                if receivingPlayer.hasHybridRandomed then
                    for ____, towerstr in ipairs(receivingPlayer.hybridTowers) do
                        player:sendMessage(
                            self.game.racePicking.HybridPool:get(towerstr).name
                        )
                    end
                else
                    player:sendMessage(
                        tostring(
                            receivingPlayer:getNameWithColour()
                        ) .. " has not hybrid randomed."
                    )
                end
            else
                player:sendMessage(
                    Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Colour")
                )
            end
        else
            player:sendMessage("Wrong Usage: -buildings <colour>")
        end
    elseif command[1] == "maze" then
        local invalidMaze = false
        if #command == 2 then
            local playerId = GetPlayerId(
                GetTriggerPlayer()
            )
            local firstSpawn = self.game.worldMap.playerSpawns[playerId + 1].spawnOne
            if firstSpawn == nil then
                return
            end
            local firstCheckpoint = firstSpawn.next
            if firstCheckpoint == nil then
                return
            end
            local secondCheckpoint = firstCheckpoint.next
            if secondCheckpoint == nil then
                return
            end
            local imagePath = ""
            imagePath = "ReplaceableTextures\\Splats\\SuggestedPlacementSplat.blp"
            local ____switch76 = command[2]
            if ____switch76 == "none" then
                goto ____switch76_case_0
            end
            if ____switch76 == "1" then
                goto ____switch76_case_1
            end
            if ____switch76 == "2" then
                goto ____switch76_case_2
            end
            if ____switch76 == "3" then
                goto ____switch76_case_3
            end
            goto ____switch76_case_default
            ::____switch76_case_0::
            do
                player:setHoloMaze(nil)
                goto ____switch76_end
            end
            ::____switch76_case_1::
            do
                player:setHoloMaze(
                    CircleHoloMaze.new(
                        imagePath,
                        GetRectCenterX(firstCheckpoint.rectangle),
                        GetRectCenterY(firstCheckpoint.rectangle),
                        GetRectCenterX(secondCheckpoint.rectangle),
                        GetRectCenterY(secondCheckpoint.rectangle)
                    )
                )
                goto ____switch76_end
            end
            ::____switch76_case_2::
            do
                player:setHoloMaze(
                    SimpleHoloMaze.new(
                        imagePath,
                        GetRectCenterX(firstCheckpoint.rectangle),
                        GetRectCenterY(firstCheckpoint.rectangle),
                        GetRectCenterX(secondCheckpoint.rectangle),
                        GetRectCenterY(secondCheckpoint.rectangle)
                    )
                )
                goto ____switch76_end
            end
            ::____switch76_case_3::
            do
                player:setHoloMaze(
                    AdvancedHoloMaze.new(
                        imagePath,
                        GetRectCenterX(firstCheckpoint.rectangle),
                        GetRectCenterY(firstCheckpoint.rectangle),
                        GetRectCenterX(secondCheckpoint.rectangle),
                        GetRectCenterY(secondCheckpoint.rectangle)
                    )
                )
                goto ____switch76_end
            end
            ::____switch76_case_default::
            do
                invalidMaze = true
                goto ____switch76_end
            end
            ::____switch76_end::
        else
            invalidMaze = true
        end
        if invalidMaze == true then
            player:sendMessage("Unknown maze selected, please try one of the mazes shown below\n" .. "|cFFFFCC00-maze none|r: removes the current maze\n" .. "|cFFFFCC00-maze 1|r: shows a very simple circled maze\n" .. "|cFFFFCC00-maze 2|r: shows a basic maze\n" .. "|cFFFFCC00-maze 3|r: shows a more advanced maze")
        end
    end
    if self.game.debugMode then
        self:handleDebugCommand(player, command, command2)
    end
end
function Commands.prototype.getPlayerIdFromColourName(self, color)
    return Util.COLOUR_IDS[string.upper(color)]
end
function Commands.prototype.RepickActions(self, player)
    local grp = GetUnitsInRectAll(
        GetPlayableMapRect()
    )
    local maxGold = player.id == COLOUR.GRAY and 150 or 100
    if player:getGold() > maxGold then
        player:setGold(maxGold)
    end
    player:setLumber(1)
    ForGroupBJ(
        grp,
        function() return self:RemovePlayerUnits(player) end
    )
    DestroyGroup(grp)
end
function Commands.prototype.RepickConditions(self, player)
    if not (self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.currentWave == 1) then
        return false
    end
    if self.game.worldMap.gameRoundHandler and self.game.worldMap.gameRoundHandler.isWaveInProgress then
        return false
    end
    if player.hasHardcoreRandomed then
        return false
    end
    if player.hasHybridRandomed then
        return false
    end
    return true
end
function Commands.prototype.RemovePlayerUnits(self, player)
    if GetOwningPlayer(
        GetEnumUnit()
    ) == player.wcPlayer then
        if self:RepickRemoveConditions(
            GetEnumUnit()
        ) then
            RemoveUnit(
                GetEnumUnit()
            )
        end
    end
end
function Commands.prototype.RepickRemoveConditions(self, Unit)
    if GetUnitTypeId(Unit) == FourCC("h03S") then
        return false
    end
    if GetUnitTypeId(Unit) == FourCC("e00C") then
        return false
    end
    return true
end
function Commands.prototype.OpenAllSpawns(self)
    for ____, spawn in ipairs(self.game.worldMap.playerSpawns) do
        spawn.isOpen = true
    end
end
function Commands.prototype.CloseAllSpawns(self)
    for ____, spawn in ipairs(self.game.worldMap.playerSpawns) do
        spawn.isOpen = false
    end
end
function Commands.prototype.giveGoldToPlayer(self, receivingPlayer, player, amount)
    if receivingPlayer then
        if player:getGold() >= amount then
            player:setGold(
                player:getGold() - amount
            )
            receivingPlayer:setGold(
                receivingPlayer:getGold() + amount
            )
            player:sendMessage(
                "You\'ve sent " .. tostring(
                    Util:ColourString(
                        "#FFCC00",
                        tostring(amount)
                    )
                ) .. " gold to " .. tostring(
                    receivingPlayer:getNameWithColour()
                )
            )
            receivingPlayer:sendMessage(
                "You\'ve received " .. tostring(
                    Util:ColourString(
                        "#FFCC00",
                        tostring(amount)
                    )
                ) .. " gold from " .. tostring(
                    player:getNameWithColour()
                )
            )
        else
            player:sendMessage("You do not have this much gold")
        end
    else
        player:sendMessage(
            Util:ColourString(COLOUR_CODES[COLOUR.RED + 1], "Invalid Receiver")
        )
    end
end
function Commands.prototype.VoteKick(self, player, receivingPlayer)
    if not self.voteKickInProgress then
        if player ~= receivingPlayer then
            SendMessage(
                tostring(
                    player:getNameWithColour()
                ) .. " has started a votekick for " .. tostring(
                    receivingPlayer:getNameWithColour()
                ) .. " (say -y to vote)"
            )
            self.voteKickInProgress = true
            self.voteAgainstPlayer = receivingPlayer
            self.hasVotedToKick[player.id + 1] = true
            self.game.timedEventQueue:AddEvent(
                TimedEvent.new(
                    function() return self:VotekickExpire() end,
                    300,
                    false
                )
            )
        else
            player:sendMessage("You idiot, you cannot stomp your own ass with the front of your own foot.")
        end
    else
        player:sendMessage("There is already a votekick in progress")
    end
end
function Commands.prototype.VotekickExpire(self)
    local count = self:CountCurrentVotes()
    if self.voteAgainstPlayer then
        SendMessage(
            "Votekick for " .. tostring(
                self.voteAgainstPlayer:getNameWithColour()
            ) .. " has ended with " .. tostring(count) .. " votes"
        )
    end
    self.voteKickInProgress = false
    return true
end
function Commands.prototype.VoteYes(self, player)
    if self.voteKickInProgress then
        if not self.hasVotedToKick[player.id + 1] then
            if not (self.voteAgainstPlayer == player) then
                self.hasVotedToKick[player.id + 1] = true
                self:CheckVotes()
            else
                player:sendMessage("You can not kick yourself")
            end
        else
            player:sendMessage("You have already voted to kick this player")
        end
    else
        player:sendMessage("There is no votekick in progress")
    end
end
function Commands.prototype.CheckVotes(self)
    local currentVotes = self:CountCurrentVotes()
    local neededVotes = (self.game.players.size / 2) + 1
    local missingVotes = neededVotes - currentVotes
    if currentVotes >= neededVotes then
        if self.voteAgainstPlayer then
            self.game.worldMap.playerSpawns[self.voteAgainstPlayer.id + 1].isOpen = false
            self:RemoveAllKickedPlayerTowers()
            if self.game.scoreBoard then
                MultiboardSetItemValueBJ(
                    self.game.scoreBoard.board,
                    1,
                    7 + self.voteAgainstPlayer.scoreSlot,
                    Util:ColourString(
                        self.voteAgainstPlayer:getColourCode(),
                        "<Kicked>"
                    )
                )
            end
            self.game.players:delete(self.voteAgainstPlayer.id)
            SendMessage(
                "Votekick for " .. tostring(
                    self.voteAgainstPlayer:getNameWithColour()
                ) .. " has succeeded!"
            )
            CustomDefeatBJ(self.voteAgainstPlayer.wcPlayer, "Kicked!")
            self.voteKickInProgress = false
        end
    else
        SendMessage(
            "You\'ll need " .. tostring(missingVotes) .. " more votes to kick"
        )
    end
end
function Commands.prototype.CountCurrentVotes(self)
    local count = 0
    do
        local i = 0
        while i < #self.hasVotedToKick do
            if self.hasVotedToKick[i + 1] then
                count = count + 1
            end
            i = i + 1
        end
    end
    return count
end
function Commands.prototype.RemoveAllKickedPlayerTowers(self)
    local grp = GetUnitsInRectAll(
        GetPlayableMapRect()
    )
    ForGroupBJ(
        GetUnitsInRectAll(
            GetPlayableMapRect()
        ),
        function() return self:RemoveKickedPlayerTowers() end
    )
    DestroyGroup(grp)
end
function Commands.prototype.RemoveKickedPlayerTowers(self)
    if self:IsPickedUnitOwnedByKickedPlayer() then
        RemoveUnit(
            GetEnumUnit()
        )
    end
end
function Commands.prototype.IsPickedUnitOwnedByKickedPlayer(self)
    if not self.voteAgainstPlayer then
        return false
    end
    if not (GetPlayerId(
        GetOwningPlayer(
            GetEnumUnit()
        )
    ) == self.voteAgainstPlayer.id) then
        return false
    end
    if not (GetUnitTypeId(
        GetEnumUnit()
    ) ~= FourCC("h03S")) then
        return false
    end
    return true
end
function Commands.prototype.DrawRect(self, rectangle)
    local x1 = rectangle.minX
    local y1 = rectangle.minY
    local x2 = rectangle.maxX
    local y2 = rectangle.maxY
    local model = "Doodads\\Cinematic\\DemonFootPrint\\DemonFootPrint0.mdl"
    local sfx = {}
    do
        local x = x1
        while x < x2 do
            __TS__ArrayPush(
                sfx,
                AddSpecialEffect(model, x, y1)
            )
            x = x + 16
        end
    end
    do
        local y = y1
        while y < y2 do
            __TS__ArrayPush(
                sfx,
                AddSpecialEffect(model, x2, y)
            )
            y = y + 16
        end
    end
    do
        local x = x1
        while x < x2 do
            __TS__ArrayPush(
                sfx,
                AddSpecialEffect(model, x, y2)
            )
            x = x + 16
        end
    end
    do
        local y = y1
        while y < y2 do
            __TS__ArrayPush(
                sfx,
                AddSpecialEffect(model, x1, y)
            )
            y = y + 16
        end
    end
    __TS__ArrayPush(self.drawings, sfx)
end
function Commands.prototype.DestroyDrawings(self)
    for ____, drawing in ipairs(self.drawings) do
        for sfx in __TS__Iterator(drawing) do
            DestroyEffect(sfx)
        end
    end
    self.drawings = {}
end
function Commands.prototype.TestTimeout(self)
    self.game.timedEventQueue:AddEvent(
        TimedEvent.new(
            function() return self:Timeout() end,
            20,
            false
        )
    )
end
function Commands.prototype.Timeout(self)
    Log.Debug("Hello world")
    return true
end
function Commands.prototype.MazeToString(self, maze)
    local output = "["
    Preload("{\"logevent\":}")
    do
        local i = 0
        while i < #maze do
            do
                if i == #maze - 1 then
                    Preload(
                        "\"" .. tostring(
                            Util:ArraysToString(maze[i + 1])
                        ) .. "\""
                    )
                    goto __continue147
                end
                Preload(
                    "\"" .. tostring(
                        Util:ArraysToString(maze[i + 1])
                    ) .. "\""
                )
            end
            ::__continue147::
            i = i + 1
        end
    end
end
return ____exports
