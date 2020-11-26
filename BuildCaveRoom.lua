local args = {...}

local tunneltoroom = args[1]
local roomsize = args[2]
local halfroom = math.ceil(roomsize/2)
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

if startY > 0 then
    for i=1,startY,1 do
        turtle.down()
    end
else
    for i=startY,0,1 do
        turtle.up()
    end
end

turtle.dig()
turtle.forward()
for i=1,roomheight,1 do
    turtle.digUp()
    turtle.up()
end

for i=1,roomsize-1,1 do
    even = i - math.floor(i/2)*2

    turtle.dig()
    turtle.forward()

    if even ~= 0 then
        for j=1,roomheight,1 do
            turtle.digDown()
            turtle.down()
            startY = startY - roomheight
        end
        turtle.forward()
    else
        for j=1,roomheight,1 do
            turtle.digUp()
            turtle.up()
            startY = startY + roomheight
        end
        turtle.forward()
    end
end

if startY > 0 then
    for i=1,startY,1 do
        turtle.down()
    end
else
    for i=startY,0,1 do
        turtle.up()
    end
end

turtle.left()
turtle.dig()


for i=1,roomsize,1 do
    even = i - math.floor(i/2)*2

    for j=1,halfroom,1 do
        turtle.dig()
        turtle.forward()
        
        if even ~= 0 then
            for j=1,roomheight,1 do
                turtle.digDown()
                turtle.down()
                startY = startY - roomheight
            end
            turtle.forward()
        else
            for j=1,roomheight,1 do
                turtle.digUp()
                turtle.up()
                startY = startY + roomheight
            end
            turtle.forward()
        end
    end
end

-- Do the opposite side here


