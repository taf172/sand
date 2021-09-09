local secsi = require 'secsi'
local Cells = require 'cells'

local CW, CH = 100*2, 75*2
local CR = 4

---[[
local renderSystem = secsi.system{}
renderSystem.group = 'draw'
function renderSystem.update(e)
    love.graphics.setColor(e.color)
    love.graphics.points(e.x, e.y)
    love.graphics.setColor(1,1,1)
end
--]]

---[[
local gravity = 1
local spread = 1
local physicsSystem = secsi.system{}
function physicsSystem.update(e)
    local neighbors = Cells.getNeighbors(e.x, e.y)
    local below = neighbors[8]
    local belowLeft = neighbors[7]
    local belowRight = neighbors[9]
    local right = neighbors[6]
    local left = neighbors[4]

    if e.solid then
        if not below then
            for i=1, gravity do
                if  Cells.get(e.x, e.y + 1) then break end
                Cells.move(e, e.x, e.y + 1)
            end
        elseif not (belowLeft or belowRight) then
            if math.random() > 0.5 then
                Cells.move(e, e.x + 1, e.y + 1)
            else
                Cells.move(e, e.x - 1, e.y + 1)
            end
        elseif not belowRight then
            Cells.move(e, e.x + 1, e.y + 1)
        elseif not belowLeft then
            Cells.move(e, e.x - 1, e.y + 1)
        elseif below and below.liquid then
            Cells.swap(e, below)
        elseif belowLeft and belowLeft.liquid and belowRight and belowRight.liquid then
            if math.random() > 0.5 then
                Cells.swap(e, belowRight)
            else
                Cells.swap(e, belowLeft)
            end
        elseif belowRight and belowRight.liquid then
            Cells.swap(e, belowRight)
        elseif belowLeft and belowLeft.liquid then
            Cells.swap(e, belowLeft)
        end
    end

    if e.liquid then
        ---[[
        if below then
            if not (right or left) then
                if math.random() > 0.5 then
                    for i=0, spread do
                        if Cells.get(e.x - 1, e.y) then break end
                        Cells.move(e, e.x - 1, e.y)
                    end
                else
                    for i=0, spread do
                        if  Cells.get(e.x + 1, e.y) then break end
                        Cells.move(e, e.x + 1, e.y)
                    end
                end
            elseif not right then
                for i=0, spread do
                    if  Cells.get(e.x + 1, e.y) then break end
                    Cells.move(e, e.x + 1, e.y)
                end
            elseif not left then
                for i=0, spread do
                    if  Cells.get(e.x - 1, e.y) then break end
                    Cells.move(e, e.x - 1, e.y)
                end
            end
        end
        --]]

        if not below then
            for i=0, gravity do
                if  Cells.get(e.x, e.y + 1) then break end
                Cells.move(e, e.x, e.y + 1)
            end
        elseif not (belowLeft or belowRight) then
            if math.random() > 0.5 then
                Cells.move(e, e.x + 1, e.y + 1)
            else
                Cells.move(e, e.x - 1, e.y + 1)
            end
        elseif not belowRight then
            Cells.move(e, e.x + 1, e.y + 1)
        elseif not belowLeft then
            Cells.move(e, e.x - 1, e.y + 1)
        end
    end
end
--]]

