width = 400
height = 300
font = love.graphics.newFont(16)
love.graphics.setFont(font)
x = 60
y = 90
margin = 10
math.randomseed(os.time())
words = {
    print = function(s)
        y = y + math.random(11) - 6
        x = x + math.random(11) - 6
        line = 0
        love.graphics.setColor(.7,.7,1)
        love.graphics.rectangle('line', x, y, width, height)
        str = ""
        for word in s:gmatch('%S+') do
            if font:getWidth(str .. ' ' .. word) > width - margin * 2 then
                love.graphics.setColor(1,1,1)
                love.graphics.print(str, x + margin, y + line * font:getHeight('X') + margin)
                str = word
                line = line + 1
            else
                if (#str > 0) then
                    str = str .. ' '
                end
                str = str .. word
            end
        end
        love.graphics.print(str, x + margin, y + line * font:getHeight('X') + margin)
    end
}
