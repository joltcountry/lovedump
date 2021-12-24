require 'coolwriter'

lasttext = 0

text = {
    "Hey there.  Welcome to the coolwriter.",
    "With this tool, you can do cool things like this, which will really impress chicks.",
    "Or perhaps not.",
    "Hard to say.",
    "Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit..."
}

function love.load()
    love.window.setMode(1600, 900);
end

function love.draw()
    coolwriter.draw()
end

function love.update(dt)
    coolwriter.update(dt)
end

function love.keypressed(key)
    if key == 'q' then love.event.quit() end
    if key == 'space' then 
        lasttext = lasttext + 1
        if lasttext > #text then
            coolwriter.clear()
            lasttext = 0
        else
            coolwriter.print(text[lasttext], 10, lasttext * vera:getHeight('1') * 2, { shake = true, color = 'green' });
        end
    end
end