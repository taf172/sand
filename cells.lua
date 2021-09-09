
local WW, WH = 100*2, 75*2

local Cells = {}

function Cells.add(e)
    Cells[e.y*WW + e.x] = e
end

function Cells.remove(e)
    Cells[e.y*WW + e.x] = nil
end

function Cells.move(e, x, y)
    Cells.remove(e)
    e.x = x
    e.y = y
    Cells.add(e)
end

function Cells.swap(a, b)
    Cells.remove(a)
    Cells.remove(b)
    a.x, b.x = b.x, a.x
    a.y, b.y = b.y, a.y
    Cells.add(a)
    Cells.add(b)
end

function Cells.get(x, y)
    if x <= 0 or y < 0 or x > WW or y > WH then
        return {}
    else
        return Cells[y*WW + x]
    end
end

function Cells.getNeighbors(x, y)
    return {
        Cells.get(x - 1, y - 1), Cells.get(x + 0, y - 1), Cells.get(x + 1, y - 1),
        Cells.get(x - 1, y + 0), Cells.get(x + 0, y + 0), Cells.get(x + 1, y + 0),
        Cells.get(x - 1, y + 1), Cells.get(x + 0, y + 1), Cells.get(x + 1, y + 1),
    }
end

return Cells