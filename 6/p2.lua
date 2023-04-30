side = "left"
port = 420

modem = peripheral.wrap(side)

modem.open(port)

while true do
    event,modemSide,senderChannel,replyChannel,message,senderDistance = os.pullEvent("modem_message")
    print(message)
    print("//////////////////")
end



