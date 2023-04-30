-- p2box alpha 1.0 12-27

local tArgs = {...}

if tArgs[1] == "help" then
    print("**** p2box alpha 1.0**** ")
    print("usage;")
    print("p2box (modemSide) (port)")
    print(" ")
else    
    side = tArgs[1]
    port = tonumber(tArgs[2])
    
    modem = peripheral.wrap(side)
    modem.open(port)
    
    print("messages:")
    print(" ")

    while true do
        event,modemSide,senderChannel,replyChannel,message,senderDistance = os.pullEvent("modem_message")
        print(message)
        print("//////////////////")
    end
end


