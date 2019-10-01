--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.ChimaeraRoost = {}
local ChimaeraRoost = ____exports.ChimaeraRoost
ChimaeraRoost.name = "ChimaeraRoost"
ChimaeraRoost.__index = ChimaeraRoost
ChimaeraRoost.prototype = {}
ChimaeraRoost.prototype.__index = __TS__Index(ChimaeraRoost.prototype)
ChimaeraRoost.prototype.__newindex = __TS__NewIndex(ChimaeraRoost.prototype)
ChimaeraRoost.prototype.constructor = ChimaeraRoost
ChimaeraRoost.____super = Tower
setmetatable(ChimaeraRoost, ChimaeraRoost.____super)
setmetatable(ChimaeraRoost.prototype, ChimaeraRoost.____super.prototype)
function ChimaeraRoost.new(...)
    local self = setmetatable({}, ChimaeraRoost.prototype)
    self:____constructor(...)
    return self
end
function ChimaeraRoost.prototype.Action(self)
    if self.owner.chimeraCount <= 3 then
        do
            local ____obj, ____index = self.owner, "chimeraCount"
            ____obj[____index] = ____obj[____index] + 1
        end
        local tempUnit = CreateUnit(
            self.owner.wcPlayer,
            FourCC("e004"),
            GetUnitX(self.tower),
            GetUnitY(self.tower),
            bj_UNIT_FACING
        )
    end
end
function ChimaeraRoost.prototype.GetTickModulo(self)
    return 150
end
return ____exports
