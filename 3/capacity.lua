chest = peripheral.wrap("front")
monitor = peripheral.wrap("top")
chestSize = chest.size()

term.setBackgroundColor(colors.black)
term.clear()
--term.setBackgroundColor(colors.black)
term.setCursorPos(0,0)

            
while true do

    percentSum = 0
    finalPercent = 0

    for i = 1,chestSize,1 do
        details = chest.getItemDetail(i)
        if details == null then
            percentSum = percentSum + 0
        else
            percent = details.count/details.maxCount
            percentSum = percentSum + percent
        end
    end

    finalPercent = percentSum/chestSize

    --print(finalPercent)
    maxPixels = (chestSize/27)*7
    --print(maxPixels)
    x = math.floor(finalPercent*maxPixels)
    --print(x)
    paintutils.drawFilledBox(0,0,x,10,colors.blue)
        
    os.sleep(5)
    term.setBackgroundColor(colors.black)
    term.clear()
    
    --paintutils.drawFilledBox(0,10,maxPixels,10,colors.black)
end        
