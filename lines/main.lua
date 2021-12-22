local NUMBER_OF_LINES = arg[2] or 150
local LINE_WIDTH = arg[3] or 12

function drawCoolLine(x1, y1, x2, y2, r, g, b, w)

    w = w or 10

    love.graphics.setLineWidth(w);
    love.graphics.setColor(r * .2, g * .2, b * .2)
    love.graphics.line(x1, y1, x2, y2)

    love.graphics.setLineWidth(w * .8);
    love.graphics.setColor(r * .4, g * .4, b * .4)
    love.graphics.line(x1, y1, x2, y2)

    love.graphics.setLineWidth(w * .6);
    love.graphics.setColor(r * .6, g * .6, b * .6)
    love.graphics.line(x1, y1, x2, y2)

    love.graphics.setLineWidth(w * .4);
    love.graphics.setColor(r * .8, g * .8, b * .8)
    love.graphics.line(x1, y1, x2, y2)

    love.graphics.setLineWidth(w * .2);
    love.graphics.setColor(r, g, b)
    love.graphics.line(x1, y1, x2, y2)

end

function love.load()
    --love.window.setMode(1920, 1080)
    love.window.setFullscreen(true);
    width, height = love.graphics.getDimensions()

    lines = {}
    for i=1,NUMBER_OF_LINES do
        lines[i] = {
            x1 = math.random(width), y1 = math.random(height), x2 = math.random(width), y2 = math.random(height),
            color = { r = math.random(), g = math.random(), b = math.random() },
            x1vel = math.random(11) - 6,
            x2vel = math.random(11) - 6,
            y1vel = math.random(11) - 6,
            y2vel = math.random(11) - 6
        }
    end
    love.graphics.setBackgroundColor(0, 0, 0);
end

function love.update()
    for i=1,NUMBER_OF_LINES do

        l = lines[i]

        if (l.x1 + l.x1vel > width or l.x1 + l.x1vel < 0) then l.x1vel = -l.x1vel end
        if (l.x2 + l.x2vel > width or l.x2 + l.x2vel < 0) then l.x2vel = -l.x2vel end
        if (l.y1 + l.y1vel > height or l.y1 + l.y1vel < 0) then l.y1vel = -l.y1vel end
        if (l.y2 + l.y2vel > height or l.y2 + l.y2vel < 0) then l.y2vel = -l.y2vel end

        l.x1 = l.x1 + l.x1vel
        l.x2 = l.x2 + l.x2vel
        l.y1 = l.y1 + l.y1vel
        l.y2 = l.y2 + l.y2vel


    end
end

function love.keypressed(key, unicode)
    if key == "f" then love.window.setFullscreen(not love.window.getFullscreen()) end
    if key == 'q' then love.event.quit() end
end

function love.draw()
    for i=1,NUMBER_OF_LINES do
        drawCoolLine(lines[i].x1, lines[i].y1, lines[i].x2, lines[i].y2, lines[i].color.r, lines[i].color.g, lines[i].color.b, LINE_WIDTH)
    end
end