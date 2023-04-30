-- alpha 1.0 p2box 12-27

local tArgs = {...}

if tArgs[1] == "help" then
    print("**** p2send Alpha 1.0 ****")
    print("usage:")
    print("p2sendA (modemSide) (port) (message)")
    print(" ")
else
    side = tArgs[1]
    port = tonumber(tArgs[2])
    message = tArgs[3]

    modem = peripheral.wrap(side)
    modem.open(port)

    print("opened port at:")
    print(port)
    print(" ")
 
    modem.transmit(port,port,message)

    print("sent:")
    print(message)
    print("on port")
    print(port)

    print("safe to terminate shell")
end






