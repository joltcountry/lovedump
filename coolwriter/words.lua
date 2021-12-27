width = 400
height = 300
font = love.graphics.newFont(16)
love.graphics.setFont(font)
x = 60
y = 90
margin = 10
tabsize = 16
math.randomseed(os.time())
words = {
    print = function(s)
        line = 0
        love.graphics.setColor(.1,.1,1)
        love.graphics.rectangle('line', x, y, width, height)
        str = ""
        s = s:gsub('\n', ' :newline: ')
        s = s:gsub('\t', ' :tab: ')
        for word in s:gmatch('%S+') do
            if (word == ':newline:') then
                love.graphics.setColor(1,1,1)
                love.graphics.print(str, x + margin, y + line * font:getHeight('X') + margin)
                line = line + 1
                str = ""
            elseif word == ':tab:' then
                str = str .. string.rep(" ", tabsize)
            elseif font:getWidth(str .. ' ' .. word) > width - margin * 2 then
                love.graphics.setColor(1,1,1)
                love.graphics.print(str, x + margin, y + line * font:getHeight('X') + margin)
                str = word
                line = line + 1
            else
                if (#str > 0) then
                    str = str .. ' '
                end
                str = str .. word
                if str:sub(#str, #str) == '.' then
                    str = str .. ' '
                end
            end
        end
        love.graphics.print(str, x + margin, y + line * font:getHeight('X') + margin)
    end
}
