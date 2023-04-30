s =  peripheral.find("geoScanner")
os.loadAPI("move")



for i = 1,5 do
    data = s.chunkAnalyze()
    move.forward(16)
    print(textutils.serialise(data))
end






        
