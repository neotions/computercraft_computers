os.loadAPI("move")

found = false

s = peripheral.find("geoScanner")

aB = " "

move.down(1)

while found == false do


    data = s.chunkAnalyze()

    for key,value in pairs(data) do
        if key == aD then
            move.up()
            found = true
        else
            found = false
        end
    end
    
    move.forward(16)
end
    
