s =  peripheral.find("geoScanner")
os.loadAPI("move")



data = s.chunkAnalyze()
print(textutils.serialise(data))






        
