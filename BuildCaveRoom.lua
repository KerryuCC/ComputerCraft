local args = {...}

local tunneltoroom = args[1]
local roomsize = args[2]

for i=1,tunneltoroom,1 do
    even = i - math.floor(i/2)*2

    if even ~= 0 then
        turtle.dig()
        turtle.up()
        turtle.dig()
        turtle.up()
        turtle.dig()
        turtle.forward()
    else
        turtle.dig()
        turtle.down()
        turtle.dig()
        turtle.down()
        turtle.dig()
        turtle.forward()
    end
end