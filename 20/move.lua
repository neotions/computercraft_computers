
-- helper functions for movement

-- need bedrock detection

function forward(n)

    if (n < 0) then
        return -back(math.abs(n))
    elseif (n == 0) then
        return 0
    elseif (n == nil) then
        return forward(1)
    else
        for i = 0, n - 1 do
            repeat
                turtle.dig()
                turtle.digUp()
            
                -- gravel protection
                check = turtle.forward()
            until (check == true)
        
        end --for
        return n
    end --if    
end -- fn

function right(n)
    
    if (n < 0) then
        dist = -left(math.abs(n))
    elseif (n == 0) then
        return 0 
    elseif (n == nil) then
        dist = right(1)
    else
        turtle.turnRight()
        dist = forward(n)    
        turtle.turnLeft()
    end --if
    return dist
end --fn

function left(n)
    
    if (n < 0) then
        dist = -right(math.abs(n))
    elseif (n == 0) then 
        return 0
    elseif (n == nil) then
        dist = left(1)
    else
        turtle.turnLeft()
        dist = forward(n)    
        turtle.turnRight()
    end --if
    return dist
end --fn

function turn_around()
    turtle.turnRight()
    turtle.turnRight()
end --fn

function back(n)

    if (n < 0) then
        dist = -forward(math.abs(n))
    elseif (n == 0) then
        return 0
    elseif (n == nil) then
        dist = back(1)
    else
        turn_around()
        dist = forward(n)
        turn_around() 
    end --if
    return dist
end --fn

function up(n)
    if (n < 0) then
        dist = -down(math.abs(n))
    elseif (n == 0) then
        return 0
    elseif (n == nil) then
        dist = up(1)
    else
        for i = 0, n - 1 do
            turtle.digUp()
            turtle.up()
        end --for
        dist = n
    end --if
    return dist
end --fn

function down(n)
    if (n < 0) then
        dist = -up(math.abs(n))
    elseif (n == 0) then
        return 0
    elseif (n == nil) then
        dist = down(1)
    else
        for i = 0, n - 1 do
            turtle.digDown()
            turtle.down()
        end --for
        dist = n
    end --if
    return dist
end --fn 

