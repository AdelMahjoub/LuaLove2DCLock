local width = love.graphics.getWidth()
local height = love.graphics.getHeight()

local clock = {}
-- The clock's dial radius : rayon du cadran de l'horloge
clock.radius = 200

-- The clock's dial center : centre du cadran de l'horloge
clock.center = {}
clock.center.x = width * 0.5
clock.center.y = height * 0.5

clock.hours = {}
-- Hours indicators count : le nombre de marqueurs d'heures 
clock.hours.slices = 12
-- Angle between hours indicators : l'angle entre les marqueurs d'heures
clock.hours.angle = math.pi * 2 / clock.hours.slices
-- Hours indicators radius : 
clock.hours.sliceRadius = 6
-- Hours hand radius : rayon du curseur des heures
clock.hours.handRadius = clock.radius - 110

clock.minutes = {}
clock.minutes.handRadius = clock.radius - 60

clock.seconds = {}
clock.seconds.slices = 60
clock.seconds.angle = math.pi * 2 / clock.seconds.slices
clock.seconds.sliceRadius = 2
clock.seconds.handRadius = clock.radius - 30

function clock.draw()
    clock.drawMarkers()
    clock.drawHands()
end

function clock.drawMarkers()
    clock.hours.drawMarkers()
    clock.seconds.drawMarkers()
end

function clock.drawHands()
    clock.seconds.drawHand()
    clock.minutes.drawHand()
    clock.hours.drawHand()
end

function clock.hours.drawMarkers()
    for angle = 0, math.pi * 2, clock.hours.angle do
        local x = clock.radius * math.cos(angle) + clock.center.x
        local y = clock.radius * math.sin(angle) + clock.center.y
        love.graphics.circle("fill", x, y, clock.hours.sliceRadius)
    end
end

function clock.seconds.drawMarkers()
    for angle = 0, math.pi * 2, clock.seconds.angle do
        local x = clock.radius * math.cos(angle) + clock.center.x
        local y = clock.radius * math.sin(angle) + clock.center.y
        love.graphics.circle("fill", x, y, clock.seconds.sliceRadius)
    end
end

function clock.seconds.drawHand()
    local seconds = tonumber(os.date("%S"))
    seconds = (seconds >= 60) and 0 or seconds
    local angle = -math.pi * 0.5 + seconds * clock.seconds.angle
    local x = clock.seconds.handRadius * math.cos(angle) + clock.center.x
    local y = clock.seconds.handRadius * math.sin(angle) + clock.center.y
    love.graphics.line(clock.center.x, clock.center.y, x, y)
end

function clock.minutes.drawHand()
    local minutes = tonumber(os.date("%M"))
    local angle = -math.pi * 0.5 + minutes * clock.seconds.angle
    local x = clock.minutes.handRadius * math.cos(angle) + clock.center.x
    local y = clock.minutes.handRadius * math.sin(angle) + clock.center.y
    love.graphics.line(clock.center.x, clock.center.y, x, y)
end

function clock.hours.drawHand()
    local hours = tonumber(os.date("%I"))
    local angle = -math.pi * 0.5 + hours * clock.hours.angle
    local x = clock.hours.handRadius * math.cos(angle) + clock.center.x
    local y = clock.hours.handRadius * math.sin(angle) + clock.center.y
    love.graphics.line(clock.center.x, clock.center.y, x, y)
end

return clock
