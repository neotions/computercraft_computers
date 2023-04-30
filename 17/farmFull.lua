os.loadAPI("Farm4")
os.loadAPI("inspection")

run = true
faceInit = true


while run == true do
    if turtle.detect() == false then
        Farm4.moveDetect()
        Farm4.plant()
    else
        if faceInit == true then
            turtle.turnLeft()
            turtle.forward()
            turtle.turnLeft()
            faceInit = false
        else
            turtle.turnRight()
            turtle.forward()
            turtle.turnRight()
            faceInit = true
        end
    end
end
    

