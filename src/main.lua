--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____init_game = require("app.src.init_game")
local InitGame = ____init_game.InitGame
local ____init_config = require("app.src.init_config")
local InitConfig = ____init_config.InitConfig
ceres.addHook(
    "config::after",
    function() return InitConfig:run() end
)
ceres.addHook(
    "main::after",
    function() return InitGame:run() end
)
