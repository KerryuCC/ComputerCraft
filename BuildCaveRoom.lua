local args = {...}

local tunneltoroom = args[1]
local roomsize = args[2]
local halfroom = math.ceil(roomsize/2)
local roomheight = 3

local startY = 0

function GoDown()
    if turtle.detectDown() then
        turtle.digDown()
    end
    turtle.down()
end

function GoUp()
    if turtle.detectUp() then
        turtle.digUp()
    end
    turtle.up()
end

function ReturnY(yDiff)
    print("MY CURRENT Y IS: " .. startY)

    if yDiff > roomheight then
        yDiff = roomheight
    end

    if yDiff > 0 then
        for i=1,yDiff,1 do
            GoDown()
        end
    end
end

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

ReturnY(startY)
startY = 0

turtle.dig()
turtle.forward()
for i=1,roomheight,1 do
    turtle.digUp()
    turtle.up()
    startY = startY + roomheight
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

ReturnY(startY)
startY = 0

turtle.turnLeft()
turtle.dig()
turtle.forward()

for i=1,roomsize,1 do
    even = i - math.floor(i/2)*2

    for j=1,halfroom,1 do
        evena = j - math.floor(j/2)*2

        if evena ~= 0 then
            for j=1,roomheight,1 do
                turtle.digUp()
                turtle.up()
                startY = startY + roomheight
            end
        else
            for j=1,roomheight,1 do
                turtle.digDown()
                turtle.down()
                startY = startY - roomheight
            end
        end

        turtle.dig()
        turtle.forward()
    end

    print("MY CURRENT Y IS: " .. startY)

    ReturnY(startY)
    startY = 0

    if even ~= 0 then
        turtle.turnLeft()
        turtle.dig()
        turtle.forward()
        turtle.turnLeft()
    else
        turtle.turnRight()
        turtle.dig()
        turtle.forward()
        turtle.turnRight()
    end
end

-- Do the opposite side here


