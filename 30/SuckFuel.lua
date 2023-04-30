run = true
while run == true do
    turtle.suck()
    turtle.refuel()
    print(turtle.getFuelLevel())
    turtle.turnRight()
    turtle.drop()
    turtle.turnLeft()
end
