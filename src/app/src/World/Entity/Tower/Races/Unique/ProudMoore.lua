--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____Tower = require("app.src.World.Entity.Tower.Specs.Tower")
local Tower = ____Tower.Tower
____exports.ProudMoore = {}
local ProudMoore = ____exports.ProudMoore
ProudMoore.name = "ProudMoore"
ProudMoore.__index = ProudMoore
ProudMoore.prototype = {}
ProudMoore.prototype.__index = __TS__Index(ProudMoore.prototype)
ProudMoore.prototype.__newindex = __TS__NewIndex(ProudMoore.prototype)
ProudMoore.prototype.constructor = ProudMoore
ProudMoore.____super = Tower
setmetatable(ProudMoore, ProudMoore.____super)
setmetatable(ProudMoore.prototype, ProudMoore.____super.prototype)
function ProudMoore.new(...)
    local self = setmetatable({}, ProudMoore.prototype)
    self:____constructor(...)
    return self
end
function ProudMoore.prototype.MaxCount(self)
    return 1
end
function ProudMoore.prototype.ConstructionFinished(self)
    do
        local i = 0
        while i < 8 do
            self:SpawnSeaElemental(i)
            i = i + 1
        end
    end
end
function ProudMoore.prototype.SpawnSeaElemental(self, i)
    if self.owner.seaElemetals < 8 then
        local towerLoc = GetUnitLoc(self.tower)
        local targetLoc = PolarProjectionBJ(towerLoc, 400, (i * (360 / 8)))
        CreateUnitAtLoc(
            self.owner.wcPlayer,
            FourCC("u041"),
            targetLoc,
            bj_UNIT_FACING
        )
        do
            local ____obj, ____index = self.owner, "seaElemetals"
            ____obj[____index] = ____obj[____index] + 1
        end
        RemoveLocation(targetLoc)
        RemoveLocation(towerLoc)
    end
end
function ProudMoore.prototype.SellAction(self)
    local towerLoc = GetUnitLoc(self.tower)
    local grp = GetUnitsInRangeOfLocAll(512, towerLoc)
    ForGroupBJ(
        grp,
        function() return self:RemoveElemental() end
    )
    DestroyGroup(grp)
    RemoveLocation(towerLoc)
end
function ProudMoore.prototype.RemoveElemental(self)
    if GetUnitTypeId(
        GetEnumUnit()
    ) == FourCC("u041") then
        RemoveUnit(
            GetEnumUnit()
        )
        do
            local ____obj, ____index = self.owner, "seaElemetals"
            ____obj[____index] = ____obj[____index] - 1
        end
    end
end
return ____exports
