local tArgs = {...}

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



