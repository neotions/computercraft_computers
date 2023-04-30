s = peripheral.wrap("right")
volume = 3
measure = 2
tone = 4
s.playNote("bass",volume,tone-1)
os.sleep(measure/8)

for i = 0,3 do
    s.playNote("bass",volume,tone)
    s.playNote("basedrum",volume,tone)
    s.playNote("snare",volume,tone/2)
    
    
    tone = tone - 1
    
    os.sleep(measure/2)
    
    s.playNote("snare",volume,tone)
    
    os.sleep(measure/2)  
end
    
