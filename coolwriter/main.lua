require 'lovesheet'
require 'loveconsole'

function love.load()
    love.window.setMode(600, 600)
    sheet = Sheet:new(0, 0, 600, 24)
    console = Console:new(10, 560, 500, '>')
    sheet:print("this is a test")
    sheet:print("this is also a test, though arguable a much longer one which will hopefully wrap\namong other things")
end

function love.draw()
    sheet:draw()
    console:draw()
end

function love.update(dt)
    console:update(dt)
end

function love.keypressed(key)
    local cmd = console:handleKey(key)
    if cmd then
        sheet:print(cmd)
    end
end