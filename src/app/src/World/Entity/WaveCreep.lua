--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
local ____Serilog = require("app.src.lib.Serilog.Serilog")
local Log = ____Serilog.Log
____exports.WaveCreep = {}
local WaveCreep = ____exports.WaveCreep
WaveCreep.name = "WaveCreep"
WaveCreep.__index = WaveCreep
WaveCreep.prototype = {}
WaveCreep.prototype.__index = WaveCreep.prototype
WaveCreep.prototype.constructor = WaveCreep
function WaveCreep.new(...)
    local self = setmetatable({}, WaveCreep.prototype)
    self:____constructor(...)
    return self
end
function WaveCreep.prototype.____constructor(self, wave, id, name)
    self.wave = wave
    self.id = id
    self.name = name
    self.type = self:getCreepType()
    self:getArmourType()
end
function WaveCreep.prototype.getCreepType(self)
    local ____switch3 = self.wave
    if ____switch3 == 5 then
        goto ____switch3_case_0
    end
    if ____switch3 == 15 then
        goto ____switch3_case_1
    end
    if ____switch3 == 20 then
        goto ____switch3_case_2
    end
    if ____switch3 == 25 then
        goto ____switch3_case_3
    end
    if ____switch3 == 30 then
        goto ____switch3_case_4
    end
    if ____switch3 == 9 then
        goto ____switch3_case_5
    end
    if ____switch3 == 14 then
        goto ____switch3_case_6
    end
    if ____switch3 == 19 then
        goto ____switch3_case_7
    end
    if ____switch3 == 24 then
        goto ____switch3_case_8
    end
    if ____switch3 == 29 then
        goto ____switch3_case_9
    end
    if ____switch3 == 31 then
        goto ____switch3_case_10
    end
    if ____switch3 == 35 then
        goto ____switch3_case_11
    end
    if ____switch3 == 36 then
        goto ____switch3_case_12
    end
    if ____switch3 == 37 then
        goto ____switch3_case_13
    end
    goto ____switch3_case_default
    ::____switch3_case_0::
    ::____switch3_case_1::
    ::____switch3_case_2::
    ::____switch3_case_3::
    ::____switch3_case_4::
    do
        return CREEP_TYPE.AIR
    end
    ::____switch3_case_5::
    ::____switch3_case_6::
    ::____switch3_case_7::
    ::____switch3_case_8::
    ::____switch3_case_9::
    ::____switch3_case_10::
    do
        return CREEP_TYPE.CHAMPION
    end
    ::____switch3_case_11::
    ::____switch3_case_12::
    ::____switch3_case_13::
    do
        return CREEP_TYPE.BOSS
    end
    ::____switch3_case_default::
    do
        return CREEP_TYPE.NORMAL
    end
    ::____switch3_end::
end
function WaveCreep.prototype.getArmourType(self)
    local ____switch5 = self.wave
    if ____switch5 == 1 then
        goto ____switch5_case_0
    end
    if ____switch5 == 6 then
        goto ____switch5_case_1
    end
    if ____switch5 == 9 then
        goto ____switch5_case_2
    end
    if ____switch5 == 14 then
        goto ____switch5_case_3
    end
    if ____switch5 == 21 then
        goto ____switch5_case_4
    end
    if ____switch5 == 29 then
        goto ____switch5_case_5
    end
    if ____switch5 == 34 then
        goto ____switch5_case_6
    end
    if ____switch5 == 4 then
        goto ____switch5_case_7
    end
    if ____switch5 == 8 then
        goto ____switch5_case_8
    end
    if ____switch5 == 11 then
        goto ____switch5_case_9
    end
    if ____switch5 == 16 then
        goto ____switch5_case_10
    end
    if ____switch5 == 19 then
        goto ____switch5_case_11
    end
    if ____switch5 == 23 then
        goto ____switch5_case_12
    end
    if ____switch5 == 27 then
        goto ____switch5_case_13
    end
    if ____switch5 == 32 then
        goto ____switch5_case_14
    end
    if ____switch5 == 3 then
        goto ____switch5_case_15
    end
    if ____switch5 == 7 then
        goto ____switch5_case_16
    end
    if ____switch5 == 12 then
        goto ____switch5_case_17
    end
    if ____switch5 == 17 then
        goto ____switch5_case_18
    end
    if ____switch5 == 24 then
        goto ____switch5_case_19
    end
    if ____switch5 == 28 then
        goto ____switch5_case_20
    end
    if ____switch5 == 33 then
        goto ____switch5_case_21
    end
    if ____switch5 == 2 then
        goto ____switch5_case_22
    end
    if ____switch5 == 5 then
        goto ____switch5_case_23
    end
    if ____switch5 == 13 then
        goto ____switch5_case_24
    end
    if ____switch5 == 15 then
        goto ____switch5_case_25
    end
    if ____switch5 == 20 then
        goto ____switch5_case_26
    end
    if ____switch5 == 25 then
        goto ____switch5_case_27
    end
    if ____switch5 == 30 then
        goto ____switch5_case_28
    end
    if ____switch5 == 10 then
        goto ____switch5_case_29
    end
    if ____switch5 == 18 then
        goto ____switch5_case_30
    end
    if ____switch5 == 22 then
        goto ____switch5_case_31
    end
    if ____switch5 == 26 then
        goto ____switch5_case_32
    end
    if ____switch5 == 31 then
        goto ____switch5_case_33
    end
    if ____switch5 == 35 then
        goto ____switch5_case_34
    end
    if ____switch5 == 36 then
        goto ____switch5_case_35
    end
    if ____switch5 == 37 then
        goto ____switch5_case_36
    end
    goto ____switch5_case_default
    ::____switch5_case_0::
    ::____switch5_case_1::
    ::____switch5_case_2::
    ::____switch5_case_3::
    ::____switch5_case_4::
    ::____switch5_case_5::
    ::____switch5_case_6::
    do
        return ARMOUR_TYPE.UNARMOURED
    end
    ::____switch5_case_7::
    ::____switch5_case_8::
    ::____switch5_case_9::
    ::____switch5_case_10::
    ::____switch5_case_11::
    ::____switch5_case_12::
    ::____switch5_case_13::
    ::____switch5_case_14::
    do
        return ARMOUR_TYPE.LIGHT
    end
    ::____switch5_case_15::
    ::____switch5_case_16::
    ::____switch5_case_17::
    ::____switch5_case_18::
    ::____switch5_case_19::
    ::____switch5_case_20::
    ::____switch5_case_21::
    do
        return ARMOUR_TYPE.MEDIUM
    end
    ::____switch5_case_22::
    ::____switch5_case_23::
    ::____switch5_case_24::
    ::____switch5_case_25::
    ::____switch5_case_26::
    ::____switch5_case_27::
    ::____switch5_case_28::
    do
        return ARMOUR_TYPE.HEAVY
    end
    ::____switch5_case_29::
    ::____switch5_case_30::
    ::____switch5_case_31::
    ::____switch5_case_32::
    ::____switch5_case_33::
    do
        return ARMOUR_TYPE.FORTIFIED
    end
    ::____switch5_case_34::
    ::____switch5_case_35::
    ::____switch5_case_36::
    do
        return ARMOUR_TYPE.HERO
    end
    ::____switch5_case_default::
    do
        Log.Error(
            "COULD NOT FIND ARMOUR TYPE FOR " .. tostring(self.wave) .. ":" .. tostring(self.id) .. ":" .. tostring(self.name)
        )
        return ARMOUR_TYPE.UNARMOURED
    end
    ::____switch5_end::
end
return ____exports
