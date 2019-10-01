--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____NativePatcher = require("app.src.JassOverrides.NativePatcher")
local PatchNatives = ____NativePatcher.PatchNatives
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
local LogLevel = ____Serilog.LogLevel
local ____StringSink = require("app.src.lib.Serilog.Sinks.StringSink")
local StringSink = ____StringSink.StringSink
local ____WarcraftMaul = require("app.src.World.WarcraftMaul")
local WarcraftMaul = ____WarcraftMaul.WarcraftMaul
local ____Trigger = require("app.src.JassOverrides.Trigger")
local Trigger = ____Trigger.Trigger
require("app.src.lib.translators")
local ____CreepAbilityHandler = require("app.src.World.Entity.CreepAbilities.CreepAbilityHandler")
local CreepAbilityHandler = ____CreepAbilityHandler.CreepAbilityHandler
____exports.InitGame = {}
local InitGame = ____exports.InitGame
InitGame.name = "InitGame"
InitGame.__index = InitGame
InitGame.prototype = {}
InitGame.prototype.__index = InitGame.prototype
InitGame.prototype.constructor = InitGame
function InitGame.new(...)
    local self = setmetatable({}, InitGame.prototype)
    self:____constructor(...)
    return self
end
function InitGame.prototype.____constructor(self)
end
function InitGame.Main(creepAbilityHandler)
    local maul = WarcraftMaul.new(creepAbilityHandler)
    if maul.debugMode then
        Log.Information("Initialisation finished")
    end
end
function InitGame.run(self)
    require("app/src/LuaModules/TimerUtils")
    require("app/src/LuaModules/FastTriggers")
    PatchNatives(nil)
    Log.Init(
        {
            StringSink.new(LogLevel.Warning, SendMessageUnlogged)
        }
    )
    local creepAbilityHandler = self:SetupAbilities()
    xpcall(
        function()
            local init = Trigger.new()
            init:RegisterTimerEvent(0, false)
            init:AddAction(
                function() return ____exports.InitGame.Main(creepAbilityHandler) end
            )
        end,
        function(err)
            Log.Fatal(err)
        end
    )
end
function InitGame.SetupAbilities(self)
    local abilityUnit = CreateUnit(
        Player(bj_PLAYER_NEUTRAL_EXTRA),
        FourCC("h00L"),
        0,
        0,
        0
    )
    local creepAbilityHandler = CreepAbilityHandler.new(abilityUnit)
    RemoveUnit(abilityUnit)
    return creepAbilityHandler
end
return ____exports
