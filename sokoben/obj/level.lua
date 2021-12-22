Level = {}

function Level:new(_map, _start, _boxes)
    local self = {}
    local boxes = _boxes
    local startBoxes = {}
    local map = _map
    local start = _start

    startBoxes = {}
    for i=1,#boxes do
        startBoxes[i] = {}
        startBoxes[i].x = boxes[i].x
        startBoxes[i].y = boxes[i].y
    end

    function self.load()
        boxes = {}
        for i=1,#startBoxes do
            boxes[i] = {}
            boxes[i].x = startBoxes[i].x
            boxes[i].y = startBoxes[i].y
            boxes[i].screenX = windowX + (boxes[i].x - 1) * CELL_SIZE
            boxes[i].screenY = windowY + (boxes[i].y - 1) * CELL_SIZE
            boxes[i].targetX = boxes[i].screenX
            boxes[i].targetY = boxes[i].screenY
        end
    end

    function self.update(dt)
    
        for i, v in ipairs(boxes) do
            if (v.targetX > v.screenX) then
                v.screenX = math.min(v.targetX, v.screenX + (SPEED * dt))
            end
            if (v.targetX < v.screenX) then
                v.screenX = math.max(v.targetX, v.screenX - (SPEED * dt))
            end
            if (v.targetY > v.screenY) then
                v.screenY = math.min(v.targetY, v.screenY + (SPEED * dt))
            end
            if (v.targetY < v.screenY) then
                v.screenY = math.max(v.targetY, v.screenY - (SPEED * dt))
            end
        end
    
    end

    function self.draw(windowX, windowY, cellSize, moving)
        for j, row in ipairs(map) do
            for i, v in ipairs(row) do
                if v == 0 then
                    love.graphics.setColor(.2, .2, .6)
                    love.graphics.rectangle('fill', windowX + (i-1) * cellSize, windowY + (j-1) * cellSize, cellSize, cellSize)
                elseif v == 1 then
                    love.graphics.setColor(.7, .7, .7)
                    love.graphics.rectangle('fill', windowX + (i-1) * cellSize, windowY + (j-1) * cellSize, cellSize, cellSize)
                elseif v == 2 then
                    love.graphics.setColor(.3, .7, .3)
                    love.graphics.rectangle('fill', windowX + (i-1) * cellSize, windowY + (j-1) * cellSize, cellSize, cellSize)
                elseif v == 3 then
                    love.graphics.setColor(.4, .4, .8)
                    love.graphics.rectangle('fill', windowX + (i-1) * cellSize, windowY + (j-1) * cellSize, cellSize, cellSize)
                end                
            end
    
        end 

        for i, v in ipairs(boxes) do
            love.graphics.setColor(.8, .8, .4)
            love.graphics.draw(block, v.screenX, v.screenY, 0, CELL_SIZE / block:getWidth(), CELL_SIZE / block:getHeight())
        end

    end

    function self.getCell(x, y)
        return map[y][x]
    end

    function self.getStart()
        return start.x, start.y
    end
        
    function self.getBoxes()
        return boxes
    end

    function self.getDimensions()
        return #map[1], #map
    end

    return self

end

