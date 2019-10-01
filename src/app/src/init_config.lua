--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____Version = require("app.src.Generated.Version")
local BUILD_DATE = ____Version.BUILD_DATE
local BUILD_NUMBER = ____Version.BUILD_NUMBER
____exports.InitConfig = {}
local InitConfig = ____exports.InitConfig
InitConfig.name = "InitConfig"
InitConfig.__index = InitConfig
InitConfig.prototype = {}
InitConfig.prototype.__index = InitConfig.prototype
InitConfig.prototype.constructor = InitConfig
function InitConfig.new(...)
    local self = setmetatable({}, InitConfig.prototype)
    self:____constructor(...)
    return self
end
function InitConfig.prototype.____constructor(self)
end
function InitConfig.run(self)
    local message = "Welcome to Warcraft Maul.\n" .. "This is build: " .. tostring(BUILD_NUMBER) .. ", built " .. tostring(BUILD_DATE) .. ".\n" .. "Visit us on " .. tostring(
        Util:ColourString("#7ab1df", "https://maulbot.com/")
    ) .. " " .. tostring(
        Util:ColourString("#ccb896", "for the latest version and our discord channel.")
    )
    local chatbox = BlzGetFrameByName("ChatTextArea", 0)
    BlzFrameSetText(
        chatbox,
        Util:ColourString("#ccb896", message)
    )
    BlzFrameSetVertexColor(
        chatbox,
        BlzConvertColor(255, 0, 0, 0)
    )
end
return ____exports
