--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
require("lualib_bundle");
local ____exports = {}
local ____AbstractPlayer = require("app.src.World.Entity.Players.AbstractPlayer")
local AbstractPlayer = ____AbstractPlayer.AbstractPlayer
____exports.Attacker = {}
local Attacker = ____exports.Attacker
Attacker.name = "Attacker"
Attacker.__index = Attacker
Attacker.prototype = {}
Attacker.prototype.__index = Attacker.prototype
Attacker.prototype.constructor = Attacker
Attacker.____super = AbstractPlayer
setmetatable(Attacker, Attacker.____super)
setmetatable(Attacker.prototype, Attacker.____super.prototype)
function Attacker.new(...)
    local self = setmetatable({}, Attacker.prototype)
    self:____constructor(...)
    return self
end
function Attacker.prototype.____constructor(self, id, game)
    AbstractPlayer.prototype.____constructor(self, id)
    SetPlayerName(self.wcPlayer, "Forces of Darkness")
    SetPlayerFlagBJ(PLAYER_STATE_GIVES_BOUNTY, true, self.wcPlayer)
    for humanPlayer in __TS__Iterator(
        game.players:values()
    ) do
        SetPlayerAllianceStateBJ(humanPlayer.wcPlayer, self.wcPlayer, bj_ALLIANCE_UNALLIED)
    end
end
return ____exports
