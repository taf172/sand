local secsi = require 'secsi'

local Sand = secsi.entity{
    color = {0.76, 0.69, 0.5},
    render = true,
    solid = true,
}
function Sand:init(x,y)
    self.x = x
    self.y = y
end

return Sand