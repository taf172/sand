local CW, CH = 100*2, 75*2
local CR = 4
local Canvas = love.graphics.newCanvas(CW, CH)
Canvas:setFilter("nearest", "nearest")
love.window.setMode(CW*CR, CH*CR)
local secsi = require 'secsi'
local Cells = require 'cells'
local Sand = require 'sand'
local Water = require 'water'

require 'systems'

function love.load()

end

function love.draw()
    love.graphics.setCanvas(Canvas)
    love.graphics.clear(0,0,0,0)
    secsi.update(0, 'draw')
    love.graphics.setCanvas()
    love.graphics.draw(Canvas, 0, 0, 0, CR, CR)
    love.graphics.setColor(1,1,1)
    love.graphics.print('FPS: '..love.timer.getFPS(), 10, 10)
    love.graphics.print('Paricles: '..#secsi.get(), 10, 20)
end

local mn = 5
local mr = 5
function love.update(dt)
    local mx, my = love.mouse.getPosition()
    local mx = math.floor(mx/CR)
    local my = math.floor(my/CR)

    secsi.update(dt)

    ---[[
    if love.mouse.isDown(1) then
        for i = 1, mn do
            local r = mr * math.sqrt(math.random())
            local theta = math.random() * 2 * math.pi

            local x = math.floor(mx + r * math.cos(theta))
            local y = math.floor(my + r * math.sin(theta))
            if x < 0 or x > CW or y < 0 or y > CH then return end
            if not Cells.get(x, y) then
                Cells.add(Sand(x, y))
            end
        end
    end
    if love.mouse.isDown(2) then
        for i = 1, mn do
            local r = mr * math.sqrt(math.random())
            local theta = math.random() * 2 * math.pi

            local x = math.floor(mx + r * math.cos(theta))
            local y = math.floor(my + r * math.sin(theta))
            if not Cells.get(x, y) then
                Cells.add(Water(x, y))
            end
        end
    end
    --]]
end

function love.mousepressed(x, y, button)
    --[[
    if button == 1 then
        local mx = math.floor(x/CR)
        local my = math.floor(y/CR)
        Cells.add(Sand(mx, my))
    end
    --]]
end