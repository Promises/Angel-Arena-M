--[[ Generated with https://github.com/TypeScriptToLua/TypeScriptToLua ]]
local ____exports = {}
____exports.Image = {}
local Image = ____exports.Image
Image.name = "Image"
Image.__index = Image
Image.prototype = {}
Image.prototype.__index = Image.prototype
Image.prototype.constructor = Image
function Image.new(...)
    local self = setmetatable({}, Image.prototype)
    self:____constructor(...)
    return self
end
function Image.prototype.____constructor(self, imagePath, size, x, y, z)
    self.img = CreateImage(imagePath, size, size, 0, x - (size / 2), y - (size / 2), z, 0, 0, 0, 2)
end
function Image.prototype.Destroy(self)
    DestroyImage(self.img)
end
function Image.prototype.SetImageRenderAlways(self, flag)
    SetImageRenderAlways(self.img, flag)
end
function Image.prototype.ShowImage(self, flag)
    ShowImage(self.img, flag)
end
return ____exports
