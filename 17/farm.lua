os.loadAPI("move")
run = true
counter = 0
while run == true do
    counter = counter +1
    if turle.detect == false then
        turtle.forward(1)
        turtle.inspectDown()
    
    local success, data = turtle.inspectDown()
    if success then
   -- print(data.state.age)
        cropAge = data.state.age
        print(cropAge)
    end
 
    if cropAge == 7 then
        turtle.digDown()
        turtle.select(2)
        turtle.placeDown()
    end
end


