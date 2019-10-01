--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local LogEventType = ____Serilog.LogEventType
local LogLevel = ____Serilog.LogLevel
____exports.StringSinkTest = {}
local StringSinkTest = ____exports.StringSinkTest
StringSinkTest.name = "StringSinkTest"
StringSinkTest.__index = StringSinkTest
StringSinkTest.prototype = {}
StringSinkTest.prototype.__index = StringSinkTest.prototype
StringSinkTest.prototype.constructor = StringSinkTest
function StringSinkTest.new(...)
    local self = setmetatable({}, StringSinkTest.prototype)
    self:____constructor(...)
    return self
end
function StringSinkTest.prototype.____constructor(self, logLevel, printer)
    self.logLevel = logLevel
    self.printer = printer
end
function StringSinkTest.prototype.LogLevel(self)
    return self.logLevel
end
function StringSinkTest.prototype.Log(self, level, events)
    local message = ""
    do
        local index = 0
        while index < #events do
            local event = events[index + 1]
            if event.Type == LogEventType.Text then
                message = tostring(message) .. tostring(event.Text)
            elseif event.Type == LogEventType.Parameter then
                local whichType = type(event.Value)
                local color = ____exports.StringSinkTest.Colors[whichType]
                if color then
                    message = tostring(message) .. "|cff" .. tostring(color)
                end
                if ____exports.StringSinkTest.Brackets[whichType] then
                    message = tostring(message) .. "{ "
                end
                message = tostring(message) .. tostring(event.Value)
                if ____exports.StringSinkTest.Brackets[whichType] then
                    message = tostring(message) .. " }"
                end
                if color then
                    message = tostring(message) .. "|r"
                end
            end
            index = index + 1
        end
    end
    self.printer(
        string.format("[%s]: %s", ____exports.StringSinkTest.Prefix[level], message)
    )
end
StringSinkTest.Prefix = {[LogLevel.None] = "|cffffffffNON|r", [LogLevel.Verbose] = "|cff9d9d9dVRB|r", [LogLevel.Debug] = "|cff9d9d9dDBG|r", [LogLevel.Information] = "|cffe6cc80INF|r", [LogLevel.Message] = "|cffe6cc80MSG|r", [LogLevel.Event] = "|cffe6cc80EVT|r", [LogLevel.Warning] = "|cffffcc00WRN|r", [LogLevel.Error] = "|cffff8000ERR|r", [LogLevel.Fatal] = "|cffff0000FTL|r"}
StringSinkTest.Colors = {["nil"] = "9d9d9d", boolean = "1eff00", number = "00ccff", string = "ff8000", table = "ffcc00", ["function"] = "ffcc00", userdata = "ffcc00"}
StringSinkTest.Brackets = {["nil"] = false, boolean = false, number = false, string = false, table = true, ["function"] = true, userdata = true}
return ____exports
