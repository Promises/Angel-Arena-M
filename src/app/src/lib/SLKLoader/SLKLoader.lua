--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
____exports.Unit = {}
local Unit = ____exports.Unit
Unit.name = "Unit"
Unit.__index = Unit
Unit.prototype = {}
Unit.prototype.__index = Unit.prototype
Unit.prototype.constructor = Unit
function Unit.new(...)
    local self = setmetatable({}, Unit.prototype)
    self:____constructor(...)
    return self
end
function Unit.prototype.____constructor(self, id)
    self.Abilities = {abilList = {}}
    self.id = id
end
____exports.SLKLoader = {}
local SLKLoader = ____exports.SLKLoader
do
    function SLKLoader.loadFile(self, filePath)
        local units = Map.new()
        local file
        file = ({
            io.open(filePath, "r")
        })
        if file[1] then
            local currentUnit
            for line in file[1]:lines() do
                do
                    if string.match(line, "C;X1;Y%d+;K\"(.*)\"") then
                        local id = string.match(line, "C;X1;Y%d+;K\"(.*)\"")
                        if #id == 4 then
                            if currentUnit then
                                units:set(
                                    FourCC(currentUnit.id),
                                    currentUnit
                                )
                            end
                            currentUnit = ____exports.Unit.new(id)
                        end
                    end
                    if not currentUnit then
                        goto __continue5
                    end
                    local index = __TS__Number(
                        string.match(line, "C;X(%d+);")
                    )
                    local ____switch10 = index
                    if ____switch10 == 1 then
                        goto ____switch10_case_0
                    end
                    if ____switch10 == 2 then
                        goto ____switch10_case_1
                    end
                    if ____switch10 == 3 then
                        goto ____switch10_case_2
                    end
                    if ____switch10 == 4 then
                        goto ____switch10_case_3
                    end
                    if ____switch10 == 5 then
                        goto ____switch10_case_4
                    end
                    if ____switch10 == 6 then
                        goto ____switch10_case_5
                    end
                    goto ____switch10_end
                    ::____switch10_case_0::
                    do
                        goto ____switch10_end
                    end
                    ::____switch10_case_1::
                    do
                        goto ____switch10_end
                    end
                    ::____switch10_case_2::
                    do
                        goto ____switch10_end
                    end
                    ::____switch10_case_3::
                    do
                        goto ____switch10_end
                    end
                    ::____switch10_case_4::
                    do
                        local abilities = string.match(line, "C;X%d+;K\"(.*)\"")
                        if #abilities >= 4 then
                            for ____, ability in ipairs(
                                __TS__StringSplit(abilities, ",")
                            ) do
                                __TS__ArrayPush(currentUnit.Abilities.abilList, ability)
                            end
                        end
                        goto ____switch10_end
                    end
                    ::____switch10_case_5::
                    do
                        goto ____switch10_end
                    end
                    ::____switch10_end::
                end
                ::__continue5::
            end
        else
            print(file[2])
        end
        return units
    end
end
return ____exports
