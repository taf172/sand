local secsi = require 'secsi'

local Water = secsi.entity{
    color = {173/255, 216/255, 230},
    render = true,
    liquid = true,
}
function Water:init(x,y)
    self.x = x
    self.y = y
end

return Water