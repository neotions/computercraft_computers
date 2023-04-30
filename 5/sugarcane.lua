os.loadAPI("move")
length = 7

-- functions

function init()
    move.left(2)
    move.back(1)
    move.down(1)
    move.forward(1)
end

function reset()
    move.up(1)
    move.turn_around()
    move.right(9)
end
    


function farm()
    if turtle.detectDown() == true then
        move.down(2)
        move.up(2)
    else
        print("not ready")
    end
end

function row(length)
    farm()
    move.forward(1)
    farm()
    move.forward(1)
    farm()
    move.forward(1)
    farm()
    move.forward(1)
    farm()
    move.forward(1)
    farm()
    move.forward(1)
    farm()
end

while true do
    init()
    --
    row(length)
    move.left(1)
    move.turn_around()
    row(length)
    --
    move.turn_around()
    move.left(2)
    row(length)
    move.left(1)
    move.turn_around()
    row(length)
    --
    move.turn_around()
    move.left(2)
    row(length)
    move.left(1)
    move.turn_around()
    row(length)
    
    
    reset()
    os.sleep(1080)
end






