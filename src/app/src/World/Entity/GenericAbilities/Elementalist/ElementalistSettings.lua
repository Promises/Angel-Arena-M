--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
____exports.ElementalistSettings = {}
local ElementalistSettings = ____exports.ElementalistSettings
ElementalistSettings.name = "ElementalistSettings"
ElementalistSettings.__index = ElementalistSettings
ElementalistSettings.prototype = {}
ElementalistSettings.prototype.__index = ElementalistSettings.prototype
ElementalistSettings.prototype.constructor = ElementalistSettings
function ElementalistSettings.new(...)
    local self = setmetatable({}, ElementalistSettings.prototype)
    self:____constructor(...)
    return self
end
function ElementalistSettings.prototype.____constructor(self)
    self.combinations = Map.new()
    self:SetupCombinations()
end
function ElementalistSettings.prototype.SetupCombinations(self)
    self:AddCombination("n025", "n024", "n026")
    self:AddCombination("n025", "n01S", "u01D")
    self:AddCombination("n01S", "n024", "n028")
    self:AddCombination("n01R", "n024", "n030")
    self:AddCombination("n022", "n024", "u01E")
    self:AddCombination("n025", "n01R", "u01F")
    self:AddCombination("n024", "n023", "u020")
    self:AddCombination("n025", "n022", "u021")
    self:AddCombination("n025", "n023", "u022")
    self:AddCombination("n022", "n01R", "u023")
    self:AddCombination("n022", "n023", "u024")
    self:AddCombination("n022", "n01S", "u025")
    self:AddCombination("n01R", "n023", "u026")
    self:AddCombination("n01R", "n01S", "u028")
    self:AddCombination("n01S", "n023", "u027")
    self:AddDoubling("n024", "u02A")
    self:AddDoubling("n025", "u02C")
    self:AddDoubling("n022", "u02E")
    self:AddDoubling("n01S", "u030")
    self:AddDoubling("n023", "u032")
    self:AddDoubling("n01R", "u034")
end
function ElementalistSettings.prototype.AddCombination(self, a, b, c)
    self.combinations:set(
        tostring(a) .. tostring(b),
        c
    )
    self.combinations:set(
        tostring(b) .. tostring(a),
        c
    )
end
function ElementalistSettings.prototype.AddDoubling(self, a, c)
    self.combinations:set(
        tostring(a) .. tostring(a),
        c
    )
end
function ElementalistSettings.prototype.GetCombination(self, a, b)
    local result = self.combinations:get(
        tostring(a) .. tostring(b)
    )
    if result then
        return result
    end
    Log.Fatal("Combination does not exist")
    return ""
end
function ElementalistSettings.prototype.HasCombination(self, a, b)
    return self.combinations:has(
        tostring(a) .. tostring(b)
    )
end
return ____exports
