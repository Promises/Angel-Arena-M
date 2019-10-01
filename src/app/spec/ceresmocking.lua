--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("app.spec.mocking.WCPlayer")
require("app.spec.mocking.units")
require("app.spec.mocking.common")
require("app.spec.mocking.blizzard")
require("app.spec.mocking.trigger")
local ____Rectangle = require("app.src.JassOverrides.Rectangle")
local Rectangle = ____Rectangle.Rectangle
_G.ceres = {
    addHook = function(self, hookname, callback)
        print(hookname)
    end
}
_G.FourCC = function(input)
    return ({
        string.unpack(">I4", input)
    })[1]
end
_G.Rect = function(area)
    return Rectangle.new(area)
end
