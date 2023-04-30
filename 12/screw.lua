-- screw digging tool


os.loadAPI("move")


while turtle.getFuelLevel() > 0 do
    move.forward(1)
    move.up(1)
    move.left(1)
    move.down(1)
    move.right(1)
end
