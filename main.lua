dial = require("clock")

function love.draw()
    local fps = love.timer.getFPS()
    local time = os.date("%X")
    local date = os.date("%d/%m/%Y")
    dial.draw()
    love.graphics.print(fps .. " fps", 10, 10)
    love.graphics.print(time, 10, 50)
    love.graphics.print(date, 10, 90)
end
