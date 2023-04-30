players = peripheral.wrap("bottom")


while true do
    term.clear()
    term.setCursorPos(0,0)
    --
    term.setTextColor(colors.cyan)
    print("marts mad house")
    print(" ")
    --
    print("date:")
    term.setTextColor(colors.white)
    print(os.date())
    print(" ")
    --
    term.setTextColor(colors.cyan)
    print("# of days:")
    term.setTextColor(colors.white)    
    print(os.day())
    print(" ")
    --
    term.setTextColor(colors.cyan)
    print("time:")
    term.setTextColor(colors.white)
    print(os.time())
    print(" ")
    --
    term.setTextColor(colors.white)
    onlinePlayers = players.getOnlinePlayers()
    print("players online:")
    for key,value in pairs(onlinePlayers) do
        term.setTextColor(256)
        print(value)
    end
    --
    os.sleep(.1)
    
end


