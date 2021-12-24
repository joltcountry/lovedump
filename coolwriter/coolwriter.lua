local strings = {}

chartimer = 0
colortimer = 0
chartime = .02
colortime = .1

vera = love.graphics.newFont(18)

coolwriter = {
    print = function(s, x, y, opt)
        strings[#strings + 1] = {
            s = s,
            x = x,
            y = y,
            lastchar = 0,
            charcolors = {},
            options = opt or {}
        }
    end,

    draw = function()
        love.graphics.setFont(vera)
        for i,v in ipairs(strings) do
            for char = 1,v.lastchar do
                if (v.options.color == 'red') then
                    love.graphics.setColor(1, v.charcolors[char], v.charcolors[char])
                elseif (v.options.color == 'blue') then
                    love.graphics.setColor(v.charcolors[char], v.charcolors[char], 1)
                else
                    love.graphics.setColor(v.charcolors[char], 1, v.charcolors[char])
                end
                if (v.options.shake) then
                    love.graphics.print(v.s:sub(char, char), math.random(3) - 2 + v.x + vera:getWidth(v.s:sub(1, char - 1)), math.random(3) - 2 + v.y)
                else
                    love.graphics.print(v.s:sub(char, char), v.x + vera:getWidth(v.s:sub(1, char - 1)), v.y)
                end
            end
        end
    end,

    update = function(dt)
        chartimer = chartimer + dt
        colortimer = colortimer + dt
        if chartimer > chartime then
            for i,v in ipairs(strings) do
                chartimer = chartimer % chartime
                v.lastchar = v.lastchar + 1
                v.charcolors[v.lastchar] = 1
            end
        end
        if colortimer > colortime then
            for i,v in ipairs(strings) do
                colortimer = colortimer % colortime
                for c = 1,v.lastchar do
                    if v.charcolors[c] > 0 then v.charcolors[c] = v.charcolors[c] - .07 end
                end
            end
        end
    end,

    clear = function()
        strings = {}
    end

}
