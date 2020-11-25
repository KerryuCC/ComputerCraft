local args = {...}

local tunneltoroom = args[1]
local roomsize = args[2]
local roomheight = 3

local startY = 0

for i=1,tunneltoroom,1 do
    even = i - math.floor(i/2)*2

    if even ~= 0 then
        turtle.dig()
        turtle.up()
        turtle.dig()
        turtle.up()
        turtle.dig()
        turtle.forward()
        startY = startY + 2
    else
        turtle.dig()
        turtle.down()
        turtle.dig()
        turtle.down()
        turtle.dig()
        turtle.forward()
        startY = startY - 2
    end
end

for i=1,startY,1 do
    turtle.down()
end

turtle.dig()
turtle.forward()
for i=1,roomheight,1 do
    turtle.digUp()
    turtle.up()
end

for i=1,roomsize,1 do
    even = i - math.floor(i/2)*2

    turtle.dig()
    turtle.forward()

    if even ~= 0 then
        for j=1,roomheight,1 do
            turtle.digDown()
            turtle.down()
        end
        turtle.forward()
    else
        for j=1,roomheight,1 do
            turtle.digUp()
            turtle.up()
        end
        turtle.forward()
    end
end


